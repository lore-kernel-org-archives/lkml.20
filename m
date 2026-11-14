Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648708;
	b=OSKRmKeWhxUXsn4t90DHCmI6uWT/ixInWF0TL2ow4bh5fKUNiYLf3ZMtL1PgzotyrugR
	 94eiS3V/8DYVnXdMO6L44DvHj6oi4SQmoE1MJwhXShtRmBYm2B3wM1JVxef9YYyE/RQAm
	 wvkwxwrqW1mzewiZjVQCLNwVTFDYm19m4PSQnez5yjtte2xaO9T2GY+QLh4gLDZXxba7Y
	 EjUA4nXwOyYki4gVwL/2SEFOR0x0RJxwKs4gGfWIoW37zd0S4NozMXCI8eWeOoX5pRZad
	 MfThgMgbmG9fNQdztjIWitc+anZgRvRnoY/f0spwAsFCDDdLcDGWLnVc/RotwCRsrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648708;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+O+j2J6ZI6uCwbPqc+nN+TK1ogvnK/G+NpPY+aJ55g=;
	b=DUYZIm6xCceKN6tsN9jcrFJrmdNdlaH+8k4bmE2BcXph+fbnDL0/9T2AsQKbeYePK8aw
	 5ZugAMpCaTtMD+j0fSR73EBA63i+F6Il07eoM1d99gC3MW/9luTZFtTTTUzbSCEZw/NPt
	 PUuseSCR4oiVMpWdtOE1uhULBjel1QQ73YUQG++33/SvxCFTbzPgmYmMKTGnJQyhacCaG
	 pyUZKuKIox6BPUszNEnmv20hmxFCYxTIE6eQLYvibmRBJCydrxh8mxA9tfrCoj3MQHB+2
	 UpHzWUZoto/sYrc4ZE+j8UENrtNFFjokpOSnFnyJjpaxJcm4//OMFgc24iMDdNAe1Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=y07kiuIg;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AC9606A32E;
	Sat, 14 Nov 2026 09:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AC9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=y07kiuIg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=y07kiuIgb/pnAdM5tDGPigcrGZQvrS9EWQ8woZAseeHLknNFby0W4wMrwFX5wBkeLhdKCfZSZS8nY
	 Gdv8qew7ID3ehjTJJWQCy9U0s3i3RJ1/qFdCxZ0SnM3QY7Yq+aHdwxesHMyRw5cOspMVqMJw/FoX6u
	 9E/RpoXdSUvPbJsU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af82a762a8-f1df7;
	Sat, 14 Nov 2026 17:31:36 +0800 (CST)
X-RM-TRANSID:2ee76af82a762a8-f1df7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af82a72329-40e44;
	Sat, 14 Nov 2026 17:31:35 +0800 (CST)
X-RM-TRANSID:2ee16af82a72329-40e44
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: hso: fix tx skb leak when the device stops
Date: Sat, 14 Nov 2026 17:31:32 +0800
Message-ID: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

Free the pending skb in hso_net_close(), which is also reached from
unregister_netdev() on disconnect.

hso_resume() loses a frame in the same way when the device is still not
ready: it passes skb_tx_buf to hso_net_start_xmit() and then clears the
pointer unconditionally, so a frame stashed again by that call is never
freed.  Clear the pointer before the call instead and let
hso_net_start_xmit() stash it again if it has to.

Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/net/usb/hso.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..03956fa8e 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -728,6 +728,13 @@ static int hso_net_close(struct net_device *net)
 
 	hso_stop_net_device(odev->parent);
 
+	/*
+	 * A frame stashed by hso_net_start_xmit() will never be transmitted now,
+	 * so drop it instead of leaking it.
+	 */
+	dev_kfree_skb(odev->skb_tx_buf);
+	odev->skb_tx_buf = NULL;
+
 	/* done */
 	return 0;
 }
@@ -3055,12 +3062,13 @@ static int hso_resume(struct usb_interface *iface)
 				/* First transmit any lingering data,
 				   then restart the device. */
 				if (hso_net->skb_tx_buf) {
+					struct sk_buff *skb = hso_net->skb_tx_buf;
+
 					dev_dbg(&iface->dev,
 						"Transmitting"
 						" lingering data\n");
-					hso_net_start_xmit(hso_net->skb_tx_buf,
-							   hso_net->net);
 					hso_net->skb_tx_buf = NULL;
+					hso_net_start_xmit(skb, hso_net->net);
 				}
 				result = hso_start_net_device(network_table[i]);
 				if (result)


