const audio = new window.Audio();
const socket = new JsSIP.WebSocketInterface("ws://127.0.0.1");

// Register callbacks to desired call events
const eventHandlers = {
  peerconnection: (e) => console.log("peerconnection", e),
  connecting: (e) => console.log("connecting", e),
  sending: (e) => console.log("sending", e),
  progress: (e) => console.log("progress", e),
  accepted: (e) => console.log("accepted", e),
  confirmed: (e) => console.log("confirmed", e),
  ended: (e) => console.log("ended", e),
  failed: (e) => console.log("failed", e),
  newDTMF: (e) => console.log("newDTMF", e),
  newInfo: (e) => console.log("newInfo", e),
  hold: (e) => console.log("hold", e),
  unhold: (e) => console.log("unhold", e),
  muted: (e) => console.log("muted", e),
  unmuted: (e) => console.log("unmuted", e),
  reinvite: (e) => console.log("reinvite", e),
  update: (e) => console.log("update", e),
  refer: (e) => console.log("refer", e),
  replaces: (e) => console.log("replaces", e),
  sdp: (e) => console.log("sdp", e),
  icecandidate: (e) => console.log("icecandidate", e),
  getusermediafailed: (e) => console.log("getusermediafailed", e),
};

const options = {
  mediaConstraints: { audio: true, video: false },
};

const registerEventHandlers = {
  connecting: (e) => console.log("connecting", e),
  connected: (e) => console.log("connected", e),
  disconnected: (e) => console.log("disconnected", e),
  registered: (e) => {
    console.log("registered", e);
    const session = ua.call("100", options);

    Object.entries(eventHandlers).forEach(([event, handler]) =>
      session.on(event, handler)
    );

    if (session.connection) {
      console.log("Connection is valid");

      session.connection.addEventListener("addstream", (e) => {
        console.log("Add stream");
        audio.srcObject = e.stream;
        audio.play();
      });

      session.connection.addEventListener("peerconnection", (e) => {
        console.log("Peer connection");
        audio.srcObject = e.stream;
        audio.play();
      });
    } else {
      console.log("Connection is null");
    }
  },
  unregistered: (e) => console.log("unregistered", e),
  registrationFailed: (e) => console.log("registrationFailed", e),
  newRTCSession: (e) => {
    console.log("newRTCSession", e);
    const session = e.session;
    session.on("addstream", function (e) {
      audio.src = window.URL.createObjectURL(e.stream);
      audio.play();
    });
  },
  newMessage: (e) => console.log("newMessage", e),
};

const configuration = {
  sockets: [socket],
  uri: "sip:test@172.20.0.4",
  password: "test",
  realm: "172.20.0.4",
  display_name: "test",
  register: true,
};

const ua = new JsSIP.UA(configuration);
Object.entries(registerEventHandlers).forEach(([event, handler]) =>
  ua.on(event, handler)
);

ua.start();
