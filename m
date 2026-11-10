Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794295210;
	b=gsDuh2mfrX5QF4hDBzCWZsIAq03YAmmwEUNPrAnVa+3yqlQgR2rOIO4knELo+VnsrKNC
	 VS3uQxqkwAW1FLuDcf9QevpjLGf8aYE53zDDy0/rRIw19L5lMVPMePZMmRy7qx0V2W8HB
	 +UXt4bSwFvSWfzIreR6tDa7TUjlN6itOFL1dnDB8NL32lLfedb5bpjq2mOM/fWx/j/E3U
	 bsJwzxkdKgFCpn6XMUHxGIOs4bqOnlYIHiUJBwOIARw+ryBVcC4DtNKudaGxJx//fK3cp
	 7gzo+2StRtpfO/6+Cqylww5PWBeuC0o/k3lNS1AYh2WrC6BRQbD/74yDO/kMQMr8oQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295210;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y6cvwU/71HJ9+A3saeCHVFbXtx1kh4cOKRZ17+c2Hsk=;
	b=zzib0Dtg6fBxX+J62F04D8tJurqvp4r/903jFc2OtjffNwH5CmTbDcKKZetL5XDjnDuO
	 dIB7LT0N3zAjGJTuarjjjT5XSLRep0GTG1ffz2z97P4dyZDC7caISmBnVHZ1L0IIZFA9Z
	 MIy4Rkfi45vK4lAuC0kJwuR/O9xerf+hLaLyKNrHseobjvzLSQwdimBx41eaG+1ye+WN5
	 6Ju9Vl4aRJIqcrMVh350i/ava+XWtXg+7i9yD/oPAihhNkEEAd3hS9N+ag7/1Na/weWXh
	 PGKXk7TSG5Iw+ZiUIIQPQzt/3giMOXl4vygJ1Z7I02usnYi3z930srWt42diVN9fKNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aA12441A;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B8606A842;
	Tue, 10 Nov 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aA12441A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295209;
	b=2WLM+BHsjYMIPcL/7IGMURYnfR+Dq7DbTKh/vHnPiuvBgW0wKypzb1hkbt21FNpn0SgX
	 ttd/mdiOD7Cb3jjZ1qRs6GR/cFi3YCy5/3yqJm9AVPKRHg2HeAytXgADDzo8rgp3gb6l4
	 CjzN43ptfFyXWSf/IfPDWZBjL/Dm447cEtVTP6ZNCoBFEbGNYwvNj1943CqLvugwUcCew
	 jGXfkPl4lNc+jCV42lvcMq+JD3snE5KTJMbLyVrGKYOPxTbT2KIODt0BlshVadzEXS7QU
	 LLrzfPZ5oh8chXq0/5+oirGU16VFOc8EURMgY7Nl2Zyk4uxmwsb3ATd+vkY60RtZzMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y6cvwU/71HJ9+A3saeCHVFbXtx1kh4cOKRZ17+c2Hsk=;
	b=P3THI6IPjeNUabsMc4kiwAvgBoa3FE6QDmI79v87utmRv6oNM9gqKnat5SfD0BlY0O9D
	 ebl5nkpuc7Ra50BREsIusWcrHr7amtAWnzjp4jlHW5zCD9eLa65QFq9Qiv6Yy4NIiQfDS
	 ADBzepcrwYDi2i2cUJeuBKD5FDE9FVthEJufZNkwvqZI0T99p/MPt8k8OCk33JDNSCBeS
	 eM/EA0LNxxxEbAnG5kibYRpi3Nmxm1AbqNlhhuwugoF+b1Dbm1L/0dfQNxxAN5zxDgiBx
	 Sd4K416ztDENIrkWWdcT6BrC5C2S4/cg8FWmcaHNLD650w1e5xvFbW9YWm+xefnX9bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B5DE1F008A1;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295209;
	bh=Y6cvwU/71HJ9+A3saeCHVFbXtx1kh4cOKRZ17+c2Hsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aA12441A62FEUAtZHrUduR3TEW6eL0D9lmJmcrtIrTyLdrBg7R9Qh1ELrUn+9H8LK
	 qEw8HPNPmLg667zKkmIuC4Di5LJRpV5ahCaN2DA+a9/Is7c+lDstNcT4Cy+jc4QWPz
	 Q1GAb5+6QTQ8oth2mAaYzy6FlXUm7Mj0P3Gd+g/yR4kIv33buWSHVSUkfG0VPO3Y5L
	 Saia+uGVJ4xlSHvZBwHrUYl3K6AW0gslGCRExdP8UBLYW4cBz2iYlgVWj8geD+iPQc
	 JXHN2u4+COMH41lErAbu+ui9Ai7HvDXifFndGVE10+11AFmZyfQlggTFAZ81C/PWHf
	 n9WMxj3cbmhPw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF526489E4;
	Tue, 10 Nov 2026 07:20:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:20:07 +0000
Subject: [PATCH 2/4] usb: core: Pair ports of different hubs through their
 connector
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-usb-port-pairing-v1-2-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295206; l=10006;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=TKM1R1LcIumGh2H1LgAD/GVIXTtpjHSsuzoyd7DkBY8=;
 b=7AuXo8FvIUWJFnAvunMTOLcsZ/tJ6SjJ2wUz9QjDwjEtIPVETb751fme+2jY+3wcqh97eVEED
 0NZiz2IPr9jB9HtDV1Ht4eTInkgCvJmjcON68l6DCgVrMD9tdM3ELFO
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A USB 3 port is two ports to the USB core, a USB 2.0 one and a
SuperSpeed one, and the core pairs them as peers. Root hub ports are
paired with the same port number of the other root hub of the same
xHCI, unless ACPI gives their locations.

Some SoCs route the two halves of a connector to different host
controllers. On the Rockchip RK3588, USB 3.0 host 2 is SuperSpeed-only:
its own USB 2.0 root hub port is not wired to a PHY, and the connector's
USB 2.0 lines go to a separate EHCI instead. Default pairing then joins
the SuperSpeed port to a dead USB 2.0 port, and nothing knows about the
EHCI port that really shares the connector.

A usb-connector node describes its USB 2.0 data lines as graph port 0
and its SuperSpeed lanes as graph port 1. When a hub's or host
controller's graph links one of its ports to a connector whose other
half leads to a different hub or host controller, pair the port with
that one instead, and keep it out of the default pairing. Connectors
whose two halves end on the same node, like a Type-C connector on a
DWC3, keep the default pairing.

This lets the runtime PM rules for peers (keep the SuperSpeed port
powered while its USB 2.0 peer is) apply to such connectors too.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/hub.h  |   2 +
 drivers/usb/core/of.c   | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/port.c |  54 ++++++++++++++++++++++++--
 include/linux/usb/of.h  |   9 +++++
 4 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..78382839be48 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -97,6 +97,7 @@ struct usb_hub {
  * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
  * @early_stop: whether port initialization will be stopped earlier.
  * @ignore_event: whether events of the port are ignored.
+ * @connector_peer: @peer is on another hub, paired through a connector.
  */
 struct usb_port {
 	struct usb_device *child;
@@ -118,6 +119,7 @@ struct usb_port {
 	unsigned int is_superspeed:1;
 	unsigned int usb3_lpm_u1_permit:1;
 	unsigned int usb3_lpm_u2_permit:1;
+	unsigned int connector_peer:1;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index a6ee20d8774e..63cead74ae8e 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -145,6 +145,107 @@ enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int p
 }
 EXPORT_SYMBOL_GPL(usb_of_get_connect_type);
 
+static bool usb_of_is_connector(const struct device_node *np)
+{
+	return of_device_is_compatible(np, "usb-a-connector") ||
+	       of_device_is_compatible(np, "usb-b-connector") ||
+	       of_device_is_compatible(np, "usb-c-connector");
+}
+
+/*
+ * Return the device node owning the far end of @con's endpoint on @con_port,
+ * and in @port1 the number of the port that endpoint belongs to.
+ */
+static struct device_node *usb_of_connector_remote(struct device_node *con,
+						   u32 con_port, u32 *port1)
+{
+	struct device_node *ep, *remote;
+	struct of_endpoint endpoint;
+
+	ep = of_graph_get_endpoint_by_regs(con, con_port, -1);
+	if (!ep)
+		return NULL;
+
+	remote = of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!remote)
+		return NULL;
+
+	if (of_graph_parse_endpoint(remote, &endpoint)) {
+		of_node_put(remote);
+		return NULL;
+	}
+	*port1 = endpoint.port;
+
+	ep = remote;
+	remote = of_graph_get_port_parent(ep);
+	of_node_put(ep);
+
+	return remote;
+}
+
+/**
+ * usb_of_get_connector_peer() - find a port's peer through its connector
+ * @hub: hub to which the port @port1 belongs
+ * @port1: one-based index of the port
+ * @superspeed: whether @hub is a SuperSpeed hub
+ * @peer_port1: returns the one-based index of the peer port
+ *
+ * A USB connector carries its USB 2.0 data lines on graph port 0 and its
+ * SuperSpeed lanes on graph port 1. Usually both reach the same hub or host
+ * controller, whose USB 2.0 and SuperSpeed ports are paired by default. Some
+ * SoCs instead route the two halves of a connector to different host
+ * controllers, for example a SuperSpeed-only xHCI paired with an EHCI. In that
+ * case the two ports can only be paired through the connector.
+ *
+ * Return: the device node of the hub or host controller providing the peer
+ * port, with its refcount incremented, if @port1 is the @superspeed half of a
+ * connector whose other half leads to a different node. NULL otherwise.
+ */
+struct device_node *usb_of_get_connector_peer(struct usb_device *hub,
+					      int port1, bool superspeed,
+					      u32 *peer_port1)
+{
+	struct device_node *np = hub->dev.of_node;
+	struct device_node *ep, *con, *remote, *peer = NULL;
+	u32 remote_port1;
+
+	if (!np || !of_graph_is_present(np))
+		return NULL;
+
+	ep = of_graph_get_endpoint_by_regs(np, port1, -1);
+	if (!ep)
+		return NULL;
+
+	con = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!con)
+		return NULL;
+
+	if (!usb_of_is_connector(con) || !of_device_is_available(con))
+		goto out;
+
+	/* The connector's half for our speed must lead back to this port */
+	remote = usb_of_connector_remote(con, superspeed ? 1 : 0, &remote_port1);
+	if (!remote)
+		goto out;
+	of_node_put(remote);
+	if (remote != np || remote_port1 != port1)
+		goto out;
+
+	/* Peers on the same node are paired without the connector's help */
+	peer = usb_of_connector_remote(con, superspeed ? 0 : 1, peer_port1);
+	if (peer && (peer == np || !*peer_port1 ||
+		     !of_device_is_available(peer))) {
+		of_node_put(peer);
+		peer = NULL;
+	}
+out:
+	of_node_put(con);
+	return peer;
+}
+EXPORT_SYMBOL_GPL(usb_of_get_connector_peer);
+
 /**
  * usb_of_get_interface_node() - get a USB interface node
  * @udev: USB device of interface
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..1677118ae043 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -649,10 +649,39 @@ static int match_location(struct usb_device *peer_hdev, void *p)
 	return 0;
 }
 
+struct usb_connector_peer {
+	struct usb_port *port_dev;
+	struct device_node *np;
+	u32 port1;
+};
+
+/*
+ * Check whether @peer_hdev is the hub that firmware describes as providing
+ * the other half of the port's connector, and link the two ports if it is.
+ */
+static int match_connector_peer(struct usb_device *peer_hdev, void *p)
+{
+	struct usb_connector_peer *cp = p;
+	struct usb_hub *peer_hub = usb_hub_to_struct_hub(peer_hdev);
+	struct usb_port *peer;
+
+	if (!peer_hub || peer_hdev->dev.of_node != cp->np ||
+	    hub_is_superspeed(peer_hdev) == cp->port_dev->is_superspeed ||
+	    cp->port1 > peer_hdev->maxchild)
+		return 0;
+
+	peer = peer_hub->ports[cp->port1 - 1];
+	if (!peer || peer->connect_type == USB_PORT_NOT_USED)
+		return 0;
+
+	link_peers_report(cp->port_dev, peer);
+	return 1; /* done */
+}
+
 /*
  * Find the peer port either via explicit platform firmware "location"
- * data, the peer hcd for root hubs, or the upstream peer relationship
- * for all other hubs.
+ * data, a connector described in the device tree, the peer hcd for root
+ * hubs, or the upstream peer relationship for all other hubs.
  */
 static void find_and_link_peer(struct usb_hub *hub, int port1)
 {
@@ -660,6 +689,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 	struct usb_device *hdev = hub->hdev;
 	struct usb_device *peer_hdev;
 	struct usb_hub *peer_hub;
+	struct usb_connector_peer cp;
 
 	/*
 	 * If location data is available then we can only peer this port
@@ -671,7 +701,23 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 		/* we link the peer in match_location() if found */
 		usb_for_each_dev(port_dev, match_location);
 		return;
-	} else if (!hdev->parent) {
+	}
+
+	/*
+	 * If a connector routes the two halves of this port to different
+	 * hubs or host controllers, the connector alone decides the peer.
+	 */
+	cp.np = usb_of_get_connector_peer(hdev, port1,
+					  port_dev->is_superspeed, &cp.port1);
+	if (cp.np) {
+		cp.port_dev = port_dev;
+		port_dev->connector_peer = 1;
+		usb_for_each_dev(&cp, match_connector_peer);
+		of_node_put(cp.np);
+		return;
+	}
+
+	if (!hdev->parent) {
 		struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
 		struct usb_hcd *peer_hcd = hcd->shared_hcd;
 
@@ -703,7 +749,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 	 * does not have location data
 	 */
 	peer = peer_hub->ports[port1 - 1];
-	if (peer && peer->location == 0)
+	if (peer && peer->location == 0 && !peer->connector_peer)
 		link_peers_report(port_dev, peer);
 }
 
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index de42f14bd280..cfcfa26e7c69 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -20,6 +20,9 @@ int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
 enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int port1);
 struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1);
+struct device_node *usb_of_get_connector_peer(struct usb_device *hub,
+					      int port1, bool superspeed,
+					      u32 *peer_port1);
 bool usb_of_has_combined_node(struct usb_device *udev);
 struct device_node *usb_of_get_interface_node(struct usb_device *udev,
 		u8 config, u8 ifnum);
@@ -49,6 +52,12 @@ usb_of_get_device_node(struct usb_device *hub, int port1)
 {
 	return NULL;
 }
+static inline struct device_node *
+usb_of_get_connector_peer(struct usb_device *hub, int port1, bool superspeed,
+			  u32 *peer_port1)
+{
+	return NULL;
+}
 static inline bool usb_of_has_combined_node(struct usb_device *udev)
 {
 	return false;

-- 
2.55.0


