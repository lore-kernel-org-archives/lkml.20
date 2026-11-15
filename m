Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737817;
	b=5MyasK6XdjaaOdUuAVWN1i4M5Ez25csz44fP5eKMkmP9jgaJxdlE8jNyaKHvHeHXUXNn
	 OexhIwP8yXTAyBTUmq9y9Nt2w1pvIUuZa+4LhKz5F++IuKkgpyCHy2Bmuyr/w8+3hJF/o
	 EKZJwFGbLsDp2v8AGjFiJuCnMDcGHV68Hq6dvr1dvxjzhz8M556dVhTQ2zbXcu/v/Y4XJ
	 jylzAmypss8+Wz9aHS5dX5zwQLivhMxb1isHpfBGiSMyrBa+0mFBA2LyVFoW4wtInLk2V
	 13Fou74eGeXxl/5bEvlIqZ5DFV1x/eKryFkTS+PJ/hLSTKmmdILTBbqmrrGewb+9Osw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737817;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cbIBX/u18CTG47SpI1ezRb64cX82qK6+CTmQksOFjn0=;
	b=wGHhCy0higJpvR5sP9WXyUDUqHWG2waJNrHr5bgYRiYqh70mA9x4XbcHtxV5k4maCDHg
	 evRq7ttYtS/VVftQbVumuhTybGwb/XpHw2v0nJWvWpJQrrTzcUdgUoWbRQ1KqGghHiImQ
	 ptAZ+Ny9D9fK/RIwOCQbWxVUklL+fFS2X88nMKwq1mTo9RrQmP7y+4LVO+dpQ3aqy8yDn
	 t70thLYphy2cIONAwpQKFHU/Tu/kzEHmETkBJ7UcaSWgM3ejzYl4mFYnlAiNolQkeW0jH
	 2svQsYpnjZCEGm5pSuqS9/hhABkVHkggknJ9GHFdzatfbz/va3PeSGCz5ywjCNosGew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dhZrIw99;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFC2606A31F;
	Sun, 15 Nov 2026 10:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFC2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dhZrIw99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dhZrIw99afblWNJB8lLoZ9wljNP+6opFQYD86wK1PsgBSFDZ9Hnp2sSE5lqgnJfqono6NAFHrQOgy
	 dv/TaL7bC0g3bTdx6WLvk1Jmh39fDTs/O/7NCKfH8qMx3KAhrIEvkSy3l4oymJbQMM+B7wGNe59tty
	 /7rK3imCArqCTId4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af9868aed2-fb459;
	Sun, 15 Nov 2026 18:16:49 +0800 (CST)
X-RM-TRANSID:2ee96af9868aed2-fb459
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af9868f834-6066e;
	Sun, 15 Nov 2026 18:16:49 +0800 (CST)
X-RM-TRANSID:2ee36af9868f834-6066e
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: hso: fix tx skb leak and a race on the stashed skb
Date: Sun, 15 Nov 2026 18:16:46 +0800
Message-ID: <20261115101646.244-1-chenaibing@cmss.chinamobile.com>
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

Free the pending skb in hso_net_close() and take ownership of the
pointer with xchg() in both places, so that only one of the close and
resume paths can obtain it.  hso_resume() also drops the frame instead
of transmitting it when the interface has already been stopped.

Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/
Fixes: 72dc1c096c70 ("HSO: add option hso driver")
Fixes: c213f286f2cf ("[netdrvr] hso: dev_kfree_skb crash fix")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
v2:
- take the stashed skb with xchg() in hso_net_close() and hso_resume(),
  so that only one path can free it (race reported by sashiko).
- drop the frame in hso_resume() instead of transmitting it after the
  interface was stopped.
- add the two Fixes tags.

 drivers/net/usb/hso.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..ba59bdefd 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -720,6 +720,7 @@ static int hso_net_open(struct net_device *net)
 static int hso_net_close(struct net_device *net)
 {
 	struct hso_net *odev = netdev_priv(net);
+	struct sk_buff *skb;
 
 	/* we don't need the queue anymore */
 	netif_stop_queue(net);
@@ -728,6 +729,14 @@ static int hso_net_close(struct net_device *net)
 
 	hso_stop_net_device(odev->parent);
 
+	/*
+	 * Take ownership of a frame stashed by hso_net_start_xmit() and drop it.
+	 * hso_resume() takes it the same way, so only one of the two paths frees
+	 * it.
+	 */
+	skb = xchg(&odev->skb_tx_buf, NULL);
+	dev_kfree_skb(skb);
+
 	/* done */
 	return 0;
 }
@@ -3032,6 +3041,7 @@ static int hso_resume(struct usb_interface *iface)
 {
 	int i, result = 0;
 	struct hso_net *hso_net;
+	struct sk_buff *skb;
 
 	/* Start all serial ports */
 	for (i = 0; i < HSO_SERIAL_TTY_MINORS; i++) {
@@ -3054,13 +3064,17 @@ static int hso_resume(struct usb_interface *iface)
 			if (hso_net->flags & IFF_UP) {
 				/* First transmit any lingering data,
 				   then restart the device. */
-				if (hso_net->skb_tx_buf) {
+				skb = xchg(&hso_net->skb_tx_buf, NULL);
+				if (skb) {
 					dev_dbg(&iface->dev,
 						"Transmitting"
 						" lingering data\n");
-					hso_net_start_xmit(hso_net->skb_tx_buf,
-							   hso_net->net);
-					hso_net->skb_tx_buf = NULL;
+					if (test_bit(HSO_NET_RUNNING,
+						     &hso_net->flags))
+						hso_net_start_xmit(skb,
+								   hso_net->net);
+					else
+						dev_kfree_skb(skb);
 				}
 				result = hso_start_net_device(network_table[i]);
 				if (result)


