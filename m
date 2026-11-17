Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905262;
	b=jucJ9n6bC1+biOSzOYvY2ackXCZJScuEIEhhRbM+A32w2FhZWgGhZg+K0k4NTAhVevAx
	 PiN/6OsPB5z5QUFeRvR45mA45ye4s2L6ssvWZMwdoiShaDILp6yGb1nGtWynA0PsI+RDc
	 IjJHMmPRuSE0Xb4KqWPGlKTxDUEco+aYjekGyn3B4ZU7hXZPB9u7d6KGWSzt7hpoWEPPy
	 uRh2aY1CIOh3xEPw/ktWtxjke20xJnNEdXZV7lb/OGeh8D5+YxqegH8jrT9MyatBbPTrj
	 AeSlfVWcAO8dRAc0BNEC0FhSKfxj6gRSNuJ7W2BdGtoKlKjIjhhdajD9e2yMy9mNNjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905262;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fydWEeJs6h6D2xN8oefEySjHP1aGYuFhV27H0XaCs9U=;
	b=G2ucpkhP5uZNjB3CgMKujBQPkabMis2jUnW3lJoIfQEzTQ6EJvU8r3rXm9SOViWEM9I5
	 5iBxLN+FMYd+SOQ7jpom1pI/xxdiVah//FQuzoEtl4saQ9ZtV2U6hwrhFkBCN4qjUTw/C
	 +DkdNOvLZRQGHdN8eHNTtz0PSQkgKbPgZApNH96IU4i7tI4zsWqVVdlFOa+XhDBJBZcpC
	 XuiNl2i71YRDe6TNMYSzMVInGY7SH8H6Sl0j6iPY+bdF2mBtFNFpFlRw8KBbixCvhinOE
	 K+pojlR0WhYHpjkczfmamXw6fdib4+gdNurxOQmsY5P6NKf8P8ncJ54OjZa8YMOjdwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LUme+Ygg;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5104606A339;
	Tue, 17 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5104606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LUme+Ygg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LUme+Ygg+q51cG9GyQAxh060oG07vN2VZtcssugOKKwIXk6syQMVJTadVGh3T9WCHJvNq81OLsgAH
	 cmk3iXszr6ziQnudBCOlMXqs2lLANW6i3zaiXh0yW+iXIazEjSochP3US6sQjm9io0/uK/y4dRYeDs
	 ZivPEV87E++kBa/0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afc14a637a-0db48;
	Tue, 17 Nov 2026 16:47:35 +0800 (CST)
X-RM-TRANSID:2ee96afc14a637a-0db48
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afc14a5a08-a8e4f;
	Tue, 17 Nov 2026 16:47:34 +0800 (CST)
X-RM-TRANSID:2ee36afc14a5a08-a8e4f
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: hso: fix stashed tx skb leak and replay race
Date: Tue, 17 Nov 2026 16:47:32 +0800
Message-ID: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
References: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hso_net_start_xmit() stashes the skb in odev->skb_tx_buf and stops the
queue when hso_get_activity() reports -EAGAIN, which happens when the
USB device is suspended or no longer configured.  If the interface is
then brought down, or the device is disconnected, that skb is simply
left behind: hso_net_close() and hso_free_net_device() never release
it, and hso_net_open() clears the pointer, so the skb and its data
buffer are leaked.

hso_resume() loses a frame in the same way when the device is still not
ready: it passes skb_tx_buf to hso_net_start_xmit() and then clears the
pointer unconditionally, so a frame stashed again by that call is never
freed.

Take the stashed skb with xchg() in both paths so that only one of them
can obtain it, and serialize the replay in hso_resume() against
hso_net_close() with a per-interface mutex: either the frame is replayed
before the device is stopped, or hso_net_close() takes and drops it.
The state check uses test_bit(HSO_NET_RUNNING), the bit that
hso_net_open() and hso_net_close() maintain.

Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/
Fixes: 72dc1c096c70 ("HSO: add option hso driver")
Fixes: c213f286f2cf ("[netdrvr] hso: dev_kfree_skb crash fix")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
v3:
- serialize the replay in hso_resume() against hso_net_close() with a
  per-interface mutex, closing the window between xchg() and the replay.
- check HSO_NET_RUNNING (the bit hso_net_open() and hso_net_close()
  maintain) instead of the IFF_UP alias in hso_resume().

v2:
- take the stashed skb with xchg() so that only one path can free it.
- add the two Fixes tags.

 drivers/net/usb/hso.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..43884234c 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -142,6 +142,9 @@ struct hso_net {
 	struct sk_buff *skb_rx_buf;
 	struct sk_buff *skb_tx_buf;
 
+	/* serializes the hso_resume() replay with hso_net_close() */
+	struct mutex tx_replay_lock;
+
 	enum pkt_parse_state rx_parse_state;
 	spinlock_t net_lock;
 
@@ -720,6 +723,14 @@ static int hso_net_open(struct net_device *net)
 static int hso_net_close(struct net_device *net)
 {
 	struct hso_net *odev = netdev_priv(net);
+	struct sk_buff *skb;
+
+	/*
+	 * Serialize with the replay in hso_resume(): either the frame is
+	 * replayed before we stop the device, or it is taken and dropped
+	 * here, never both and never after the queue is gone.
+	 */
+	mutex_lock(&odev->tx_replay_lock);
 
 	/* we don't need the queue anymore */
 	netif_stop_queue(net);
@@ -728,6 +739,11 @@ static int hso_net_close(struct net_device *net)
 
 	hso_stop_net_device(odev->parent);
 
+	skb = xchg(&odev->skb_tx_buf, NULL);
+	dev_kfree_skb(skb);
+
+	mutex_unlock(&odev->tx_replay_lock);
+
 	/* done */
 	return 0;
 }
@@ -2398,6 +2414,7 @@ static void hso_net_init(struct net_device *net)
 
 	/* and initialize the semaphore */
 	spin_lock_init(&hso_net->net_lock);
+	mutex_init(&hso_net->tx_replay_lock);
 }
 
 /* Adds a network device in the network device table */
@@ -3032,6 +3049,7 @@ static int hso_resume(struct usb_interface *iface)
 {
 	int i, result = 0;
 	struct hso_net *hso_net;
+	struct sk_buff *skb;
 
 	/* Start all serial ports */
 	for (i = 0; i < HSO_SERIAL_TTY_MINORS; i++) {
@@ -3051,21 +3069,28 @@ static int hso_resume(struct usb_interface *iface)
 		if (network_table[i] &&
 		    (network_table[i]->interface == iface)) {
 			hso_net = dev2net(network_table[i]);
-			if (hso_net->flags & IFF_UP) {
-				/* First transmit any lingering data,
-				   then restart the device. */
-				if (hso_net->skb_tx_buf) {
+			mutex_lock(&hso_net->tx_replay_lock);
+
+			/*
+			 * First transmit any lingering data, then restart
+			 * the device.
+			 */
+			if (test_bit(HSO_NET_RUNNING, &hso_net->flags)) {
+				skb = xchg(&hso_net->skb_tx_buf, NULL);
+				if (skb) {
 					dev_dbg(&iface->dev,
 						"Transmitting"
 						" lingering data\n");
-					hso_net_start_xmit(hso_net->skb_tx_buf,
-							   hso_net->net);
-					hso_net->skb_tx_buf = NULL;
+					hso_net_start_xmit(skb, hso_net->net);
 				}
 				result = hso_start_net_device(network_table[i]);
-				if (result)
+				if (result) {
+					mutex_unlock(&hso_net->tx_replay_lock);
 					goto out;
+				}
 			}
+
+			mutex_unlock(&hso_net->tx_replay_lock);
 		}
 	}
 


