Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952060;
	b=iVhmc2UtO8FX2eRtqqexSpBBECEAnOaAq5/5jqpFqyctlqNk8pr1MfZ/cVUJH5JAtYkh
	 7QgdXSxKjehOFH4kjMcedGvwsx5XiMvOL49JAbRAgoPo7vZBa+Es6lBuddVLfPeXk1jnQ
	 yvYljyO5JlkUddckR78yUErpsTL+rHJAtYj6owtx1MOF/I0ikuaLNGU78gCnJJt+uBJaj
	 adUuHZmvRnQZ9rYz7ojwhln4QVp28lVCH3Y1BztpcsKBInTAbxH+MDqTbPSYIc6iSu1pw
	 CkGWIpZ+hZ0Jssnr9qw5t4ofLtYPKjzvNPrJNsGawma2+bJbqJ75UIY7qMw4qFk/riA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952060;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B3jXFvru+WaSXTCb/25+/dzEIkdnXF4SUOLhG3aBRG0=;
	b=gdy6jrnpv1NFt/HjvO1wfJ2lmzy9jpBNPv9J2ZF3yH6gklqsfGpkI8YPcmH3LVtpZl0E
	 MjkkQYehRVIl077M1Rps0DXMKnqBosG3P5n5/fvOcSQaHRne6Az8eeR945GI7gBh6jq1K
	 SaG3n8slGc9dmYa1i2v4xt31jqKGSHcJx5NoAUF7gDk4rIM5BHmY9Axih25diDc8NsYxO
	 Y5SA3Yi5GlKpHy8Q1tHpB39knoiRx9ALN0gdm71UFYkNQ1RTtHYjPF5aXIod5b9+scu9W
	 +7192LzZiS/1OStnZt1W6ShGFV6MucsL8x76QRmHMr7xByuQYrPzn+eWM6b+r0YuZ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=TVM4RJVH;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=BVjHujVz;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18721606A329;
	Sun, 25 Oct 2026 18:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18721606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=TVM4RJVH;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=BVjHujVz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952053; bh=kVFx4m72829d7qz6rWfycW6fc2Z/xG1cF3gpWTPqDtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVM4RJVH/DC7n95NHConfpj4JHMZmzXhbhFU/2D8UEiQAJ08v3kzOUueIszxbfDFx
	 oJBnxMxPErJrPbbOLQS21VK/v6X9dsZ30OEcXM2xbp7hX6ai+NtrxJJd7VLi24QM+M
	 HWsNTVwE7+GAlsDu6aI0KIhyiA+hP8HSl2xzucJ1YjlFpeouyiwXHBIXRGdtu3Q6w3
	 gIgNGLQDf2QnWjsg/MEalMIXI+/7jmcNtILaZRENTCcav5Nt28ZoCsSKpcwy/steQf
	 Y9E+YRrUTlJ0f/Fe5TQLGwLtTVww57edY4stxvmto9Ura9SO18R05ZIUp2k0lmUjdv
	 WoeLrMJfM3u1Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id AC9C840B52; Sun, 25 Oct 2026 18:14:13 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952052; bh=kVFx4m72829d7qz6rWfycW6fc2Z/xG1cF3gpWTPqDtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BVjHujVz8C+VNMZOX9S0M/VDcYDZ1Ogdi3Zk+yziDbZOPlqAvv92BIBjR8PXrHOXW
	 vYp5W/hxd2HSwUvA9B7tNUI22Wjf18HFTalVwbwKETKl/1rODI5nV9O5RDLEdsdnAO
	 CTSs1pU/S7/zhLNNqvwhMYBD37nilabovZee+dg3usvmH/W1+BB38KXCyT7GlQCgng
	 xt3OFzbXQSVxpwd26uIHcnviARQi9aoV2UstVnXSu1+LLlrhfnh3sTlobdBpcQw5u9
	 aStuJBxjjLZMML2+oA3LdKjfc+juJtgCzlzuBa3xZFgDbbIm7TgOOcBSiOkRmHdQ+4
	 VIRhOGD6ipwOQ==
Received: from maru.home (host86-145-132-241.range86-145.btcentralplus.com [86.145.132.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 323D140B2D;
	Sun, 25 Oct 2026 18:14:12 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: imon: Replace pr_err() with dev_err() and friends
Date: Sun, 25 Oct 2026 18:13:44 +0000
Message-ID: <b91c663a9813f32a739e38fc566634df2e182238.1792951808.git.sean@mess.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792951808.git.sean@mess.org>
References: <cover.1792951808.git.sean@mess.org>
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

We can also remove debug module parameter. This also fixes the use
after free in free_imon_context() by removing the dev_dbg().

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/imon.c | 93 +++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 54 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 0a8844cce23b..56958576a13f 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -13,8 +13,6 @@
  *   support for me and provided debug dumps from their devices.
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__
-
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -462,10 +460,6 @@ MODULE_VERSION(MOD_VERSION);
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(usb, imon_usb_id_table);
 
-static bool debug;
-module_param(debug, bool, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(debug, "Debug messages: 0=no, 1=yes (default: no)");
-
 /* lcd, vfd, vga or none? should be auto-detected, but can be overridden... */
 static int display_type;
 module_param(display_type, int, S_IRUGO);
@@ -513,7 +507,6 @@ static int display_open(struct inode *inode, struct file *file)
 	subminor = iminor(inode);
 	interface = usb_find_interface(&imon_driver, subminor);
 	if (!interface) {
-		pr_err("could not find interface for minor %d\n", subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
@@ -522,7 +515,8 @@ static int display_open(struct inode *inode, struct file *file)
 	ictx = usb_get_intfdata(interface);
 	if (!ictx || ictx->disconnected || !refcount_inc_not_zero(&ictx->users)) {
 		rcu_read_unlock();
-		pr_err("no context found for minor %d\n", subminor);
+		dev_dbg(&interface->dev, "no context found for minor %d\n",
+			subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
@@ -533,10 +527,10 @@ static int display_open(struct inode *inode, struct file *file)
 	if (ictx->disconnected) {
 		retval = -ENODEV;
 	} else if (!ictx->display_supported) {
-		pr_err("display not supported by device\n");
+		dev_dbg(ictx->dev, "display not supported by device\n");
 		retval = -ENODEV;
 	} else if (ictx->display_isopen) {
-		pr_err("display port is already open\n");
+		dev_dbg(ictx->dev, "display port is already open\n");
 		retval = -EBUSY;
 	} else {
 		ictx->display_isopen = true;
@@ -565,10 +559,10 @@ static int display_close(struct inode *inode, struct file *file)
 	mutex_lock(&ictx->lock);
 
 	if (!ictx->display_supported) {
-		pr_err("display not supported by device\n");
+		dev_err(ictx->dev, "display not supported by device\n");
 		retval = -ENODEV;
 	} else if (!ictx->display_isopen) {
-		pr_err("display is not open\n");
+		dev_err(ictx->dev, "display is not open\n");
 		retval = -EIO;
 	} else {
 		ictx->display_isopen = false;
@@ -643,13 +637,13 @@ static int send_packet(struct imon_context *ictx)
 	if (retval) {
 		ictx->tx.busy = false;
 		smp_rmb(); /* ensure later readers know we're not busy */
-		pr_err_ratelimited("error submitting urb(%d)\n", retval);
+		dev_err_ratelimited(ictx->dev, "error submitting urb(%d)\n", retval);
 	} else {
 		/* Wait for transmission to complete (or abort or timeout) */
 		retval = wait_for_completion_interruptible_timeout(&ictx->tx.finished, 10 * HZ);
 		if (retval <= 0) {
 			usb_kill_urb(ictx->tx_urb);
-			pr_err_ratelimited("task interrupted\n");
+			dev_dbg(ictx->dev, "task interrupted\n");
 			if (retval < 0)
 				ictx->tx.status = retval;
 			else
@@ -659,7 +653,8 @@ static int send_packet(struct imon_context *ictx)
 		ictx->tx.busy = false;
 		retval = ictx->tx.status;
 		if (retval)
-			pr_err_ratelimited("packet tx failed (%d)\n", retval);
+			dev_err_ratelimited(ictx->dev, "packet tx failed (%d)\n",
+					    retval);
 	}
 
 	kfree(control_req);
@@ -689,13 +684,8 @@ static int send_associate_24g(struct imon_context *ictx)
 	const unsigned char packet[8] = { 0x01, 0x00, 0x00, 0x00,
 					  0x00, 0x00, 0x00, 0x20 };
 
-	if (!ictx) {
-		pr_err("no context for device\n");
-		return -ENODEV;
-	}
-
 	if (!ictx->dev_present_intf0) {
-		pr_err("no iMON device present\n");
+		dev_dbg(ictx->dev, "no iMON device present\n");
 		return -ENODEV;
 	}
 
@@ -721,11 +711,6 @@ static int send_set_imon_clock(struct imon_context *ictx,
 	int retval = 0;
 	int i;
 
-	if (!ictx) {
-		pr_err("no context for device\n");
-		return -ENODEV;
-	}
-
 	switch (ictx->display_type) {
 	case IMON_DISPLAY_TYPE_LCD:
 		clock_enable_pkt[0][0] = 0x80;
@@ -783,7 +768,7 @@ static int send_set_imon_clock(struct imon_context *ictx,
 		memcpy(ictx->usb_tx_buf, clock_enable_pkt[i], 8);
 		retval = send_packet(ictx);
 		if (retval) {
-			pr_err("send_packet failed for packet %d\n", i);
+			dev_err(ictx->dev, "send_packet failed for packet %d\n", i);
 			break;
 		}
 	}
@@ -958,13 +943,13 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	}
 
 	if (!ictx->dev_present_intf0) {
-		pr_err_ratelimited("no iMON device present\n");
+		dev_dbg(ictx->dev, "no iMON device present\n");
 		retval = -ENODEV;
 		goto exit;
 	}
 
 	if (n_bytes <= 0 || n_bytes > 32) {
-		pr_err_ratelimited("invalid payload size\n");
+		dev_dbg(ictx->dev, "invalid payload size\n");
 		retval = -EINVAL;
 		goto exit;
 	}
@@ -990,7 +975,8 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 
 		retval = send_packet(ictx);
 		if (retval) {
-			pr_err_ratelimited("send packet #%d failed\n", seq / 2);
+			dev_err_ratelimited(ictx->dev, "send packet #%d failed\n",
+					    seq / 2);
 			goto exit;
 		} else {
 			seq += 2;
@@ -1004,7 +990,8 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	ictx->usb_tx_buf[7] = (unsigned char) seq;
 	retval = send_packet(ictx);
 	if (retval)
-		pr_err_ratelimited("send packet #%d failed\n", seq / 2);
+		dev_err_ratelimited(ictx->dev, "send packet #%d failed\n",
+				    seq / 2);
 
 exit:
 	mutex_unlock(&ictx->lock);
@@ -1039,14 +1026,14 @@ static ssize_t lcd_write(struct file *file, const char __user *buf,
 	}
 
 	if (!ictx->display_supported) {
-		pr_err_ratelimited("no iMON display present\n");
+		dev_dbg(ictx->dev, "no iMON display present\n");
 		retval = -ENODEV;
 		goto exit;
 	}
 
 	if (n_bytes != 8) {
-		pr_err_ratelimited("invalid payload size: %d (expected 8)\n",
-				   (int)n_bytes);
+		dev_dbg(ictx->dev, "invalid payload size: %zu (expected 8)\n",
+			n_bytes);
 		retval = -EINVAL;
 		goto exit;
 	}
@@ -1058,7 +1045,7 @@ static ssize_t lcd_write(struct file *file, const char __user *buf,
 
 	retval = send_packet(ictx);
 	if (retval) {
-		pr_err_ratelimited("send packet failed!\n");
+		dev_err_ratelimited(ictx->dev, "send packet failed!\n");
 		goto exit;
 	} else {
 		dev_dbg(ictx->dev, "%s: write %d bytes to LCD\n",
@@ -1647,10 +1634,7 @@ static void imon_incoming_packet(struct imon_context *ictx,
 		imon_pad_to_keys(ictx, buf);
 	}
 
-	if (debug) {
-		printk(KERN_INFO "intf%d decoded packet: %*ph\n",
-		       intf, len, buf);
-	}
+	dev_dbg(dev, "intf%d decoded packet: %*ph\n", intf, len, buf);
 
 	press_type = imon_parse_press_type(ictx, buf, ktype);
 	if (press_type < 0)
@@ -1841,65 +1825,66 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 	u8 ffdc_cfg_byte = ictx->usb_rx_buf[6];
 	u8 detected_display_type = IMON_DISPLAY_TYPE_NONE;
 	u64 allowed_protos = RC_PROTO_BIT_IMON;
+	const char *descr;
 
 	switch (ffdc_cfg_byte) {
 	/* iMON Knob, no display, iMON IR + vol knob */
 	case 0x21:
-		dev_info(ictx->dev, "0xffdc iMON Knob, iMON IR");
+		descr = "0xffdc iMON Knob, iMON IR";
 		ictx->display_supported = false;
 		break;
 	/* iMON 2.4G LT (usb stick), no display, iMON RF */
 	case 0x4e:
-		dev_info(ictx->dev, "0xffdc iMON 2.4G LT, iMON RF");
+		descr = "0xffdc iMON 2.4G LT, iMON RF";
 		ictx->display_supported = false;
 		ictx->rf_device = true;
 		break;
 	/* iMON VFD, no IR (does have vol knob tho) */
 	case 0x35:
-		dev_info(ictx->dev, "0xffdc iMON VFD + knob, no IR");
+		descr = "0xffdc iMON VFD + knob, no IR";
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
 		break;
 	/* iMON VFD, iMON IR */
 	case 0x24:
 	case 0x30:
 	case 0x85:
-		dev_info(ictx->dev, "0xffdc iMON VFD, iMON IR");
+		descr = "0xffdc iMON VFD, iMON IR";
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
 		break;
 	/* iMON VFD, MCE IR */
 	case 0x46:
 	case 0x9e:
-		dev_info(ictx->dev, "0xffdc iMON VFD, MCE IR");
+		descr = "0xffdc iMON VFD, MCE IR";
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
 		allowed_protos = RC_PROTO_BIT_RC6_MCE;
 		break;
 	/* iMON VFD, iMON or MCE IR */
 	case 0x7e:
-		dev_info(ictx->dev, "0xffdc iMON VFD, iMON or MCE IR");
+		descr = "0xffdc iMON VFD, iMON or MCE IR";
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
 		allowed_protos |= RC_PROTO_BIT_RC6_MCE;
 		break;
 	/* iMON LCD, MCE IR */
 	case 0x9f:
-		dev_info(ictx->dev, "0xffdc iMON LCD, MCE IR");
+		descr = "0xffdc iMON LCD, MCE IR";
 		detected_display_type = IMON_DISPLAY_TYPE_LCD;
 		allowed_protos = RC_PROTO_BIT_RC6_MCE;
 		break;
 	/* no display, iMON IR */
 	case 0x26:
-		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
+		descr = "0xffdc iMON Inside, iMON IR";
 		ictx->display_supported = false;
 		break;
 	/* Soundgraph iMON UltraBay */
 	case 0x98:
-		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
+		descr = "0xffdc iMON UltraBay, LCD + IR";
 		detected_display_type = IMON_DISPLAY_TYPE_LCD;
 		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
 		ictx->dev_descr = &ultrabay_table;
 		break;
 
 	default:
-		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
+		descr = "Unknown 0xffdc device, defaulting to VFD and iMON IR";
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
 		/*
 		 * We don't know which one it is, allow user to set the
@@ -1909,7 +1894,7 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 		break;
 	}
 
-	printk(KERN_CONT " (id 0x%02x)\n", ffdc_cfg_byte);
+	dev_info(ictx->dev, "%s (id 0x%02x)\n", descr, ffdc_cfg_byte);
 
 	ictx->display_type = detected_display_type;
 	ictx->rc_proto = allowed_protos;
@@ -2207,7 +2192,7 @@ static bool imon_find_endpoints(struct imon_context *ictx,
 
 	/* Input endpoint is mandatory */
 	if (!ir_ep_found)
-		pr_err("no valid input (IR) endpoint found\n");
+		dev_err(ictx->dev, "no valid input (IR) endpoint found\n");
 
 	ictx->tx_control = tx_control;
 
@@ -2276,7 +2261,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 
 	ret = usb_submit_urb(ictx->rx_urb_intf0, GFP_KERNEL);
 	if (ret) {
-		pr_err("usb_submit_urb failed for intf0 (%d)\n", ret);
+		dev_err(dev, "usb_submit_urb failed for intf0 (%d)\n", ret);
 		goto urb_submit_failed;
 	}
 
@@ -2452,8 +2437,8 @@ static int imon_probe(struct usb_interface *interface,
 		sysfs_err = sysfs_create_group(&interface->dev.kobj,
 					       &imon_rf_attr_group);
 		if (sysfs_err)
-			pr_err("Could not create RF sysfs entries(%d)\n",
-			       sysfs_err);
+			dev_err(dev, "Could not create RF sysfs entries(%d)\n",
+				sysfs_err);
 	}
 
 	if (ictx->display_supported)
-- 
2.56.0

