Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292879;
	b=kpwOTkxz9t9r1J/EyHykjyEypiB9n312Pb9M5F2ELPqjg0oQCALwYdFDUykmhdjIqvvq
	 2gInox2yV/6gW9iB8waD+FE7ntX/fhv2P0O87DAM7pFMCusZtWoD74YeJe6NyIz7dohVi
	 N84uE2RAoiggjMhdVxKUmXZPebQIWh8mPVXwyOiF3wfrf5jDZqSu8TFgQ7/+3RzvwyKbu
	 yG4wh1oX4a+x1Ieg/dISFj2I/urZrwbKsnPszN9oaYIWxOZKyegT5Qd9ohe6iLLVSF8vw
	 z5v/RwsehkmcRA6Qi+Su2Q9jG/sNu6emwKVE8vs+wJkB4z6IXesx+r9MKGkjV45BWMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292879;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v2NaWUyDjUGB1RhUVr0pzGunvJcuRcKCw5SwYd2ZAWA=;
	b=imSa2/eek+3jCnjlbPfnVioAfD0RFjXK4Xaw0Q5m5+Dgze/8S/9TFa9A8BZb88vbXPR2
	 hIfHtkSfm0k+QxyqqYSvXb78hkFztpoZVhiVzxIaryA8WUgOXEDTpQ8o6GtFyO78tJnSX
	 Ybk/6Ua+GhkxpRWX/Tp7MW7AuPH9slfiMc6f8f93GtTq0uCkqTD3yQFis/++EJycXEYhP
	 JG+v+T/NsXgKXyzILBa4MyCs+6msMUnej3+WVfIB31aHTDEdbBvPHBki7I9oFR3ViB/Ii
	 qNv7r7XV//0NwyQSXKDxNht1SiLEzIx0EDJQDQGVxTTtKUthbgGmi6un4kHla/HfwTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aGxeD8fl;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C09F606A332;
	Tue, 10 Nov 2026 06:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C09F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aGxeD8fl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aGxeD8flJeoDRTdgIhvWkW+XLIcZX7UM45Gxtf8+tp1mzpoKDGww0X0gYhFs6nYMQUddaXJGP0TgQ
	 oE394BMK1i4+di7csNy7nodK8v/sKSyykHR3hrjqFcsRJfy3bcBlp9tPmSH0BuXWNGd7bWMgGuD3u9
	 qurSrgTv17KQoE7w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2bc8a1f6-a75e9;
	Tue, 10 Nov 2026 14:41:15 +0800 (CST)
X-RM-TRANSID:2ee16af2bc8a1f6-a75e9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa10e;
	Tue, 10 Nov 2026 14:41:15 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa10e
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/22] usb: gadget: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:53 +0000
Message-ID: <20261110064105.20335-11-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/composite.c               |  4 ++--
 drivers/usb/gadget/epautoconf.c              |  2 +-
 drivers/usb/gadget/function/f_hid.c          |  2 +-
 drivers/usb/gadget/function/f_ncm.c          |  2 +-
 drivers/usb/gadget/function/f_printer.c      |  2 +-
 drivers/usb/gadget/function/f_uac2.c         |  4 ++--
 drivers/usb/gadget/function/ndis.h           |  2 +-
 drivers/usb/gadget/function/rndis.c          |  2 +-
 drivers/usb/gadget/function/storage_common.c |  2 +-
 drivers/usb/gadget/function/u_audio.c        |  2 +-
 drivers/usb/gadget/legacy/inode.c            |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c     |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c     |  2 +-
 drivers/usb/gadget/udc/bdc/bdc.h             |  6 +++---
 drivers/usb/gadget/udc/bdc/bdc_cmd.c         |  2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c        |  4 ++--
 drivers/usb/gadget/udc/bdc/bdc_ep.c          | 10 +++++-----
 drivers/usb/gadget/udc/cdns2/cdns2-ep0.c     |  4 ++--
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.h  |  4 ++--
 drivers/usb/gadget/udc/core.c                |  4 ++--
 drivers/usb/gadget/udc/fsl_qe_udc.h          |  2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c        | 10 +++++-----
 drivers/usb/gadget/udc/gr_udc.c              |  2 +-
 drivers/usb/gadget/udc/m66592-udc.c          |  2 +-
 drivers/usb/gadget/udc/net2280.c             |  2 +-
 drivers/usb/gadget/udc/pch_udc.c             | 20 ++++++++++----------
 drivers/usb/gadget/udc/pxa27x_udc.c          | 12 ++++++------
 drivers/usb/gadget/udc/r8a66597-udc.c        |  2 +-
 drivers/usb/gadget/udc/renesas_usbf.c        |  4 ++--
 drivers/usb/gadget/udc/snps_udc_core.c       |  6 +++---
 drivers/usb/gadget/udc/snps_udc_plat.c       |  2 +-
 drivers/usb/gadget/udc/udc-xilinx.c          |  2 +-
 drivers/usb/gadget/usbstring.c               |  2 +-
 33 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 1b2238147cfe..4ec54414c927 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -25,7 +25,7 @@
 
 /**
  * struct usb_os_string - represents OS String to be reported by a gadget
- * @bLength: total length of the entire descritor, always 0x12
+ * @bLength: total length of the entire descriptor, always 0x12
  * @bDescriptorType: USB_DT_STRING
  * @qwSignature: the OS String proper
  * @bMS_VendorCode: code used by the host for subsequent requests
@@ -1556,7 +1556,7 @@ static void composite_setup_complete(struct usb_ep *ep, struct usb_request *req)
 				req->status, req->actual, req->length);
 
 	/*
-	 * REVIST The same ep0 requests are shared with function drivers
+	 * REVISIT The same ep0 requests are shared with function drivers
 	 * so they don't have to maintain the same ->complete() stubs.
 	 *
 	 * Because of that, we need to check for the validity of ->context
diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 30016b805bfd..8013bf6be6dd 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -29,7 +29,7 @@
  *    supports a different number of streams.
  *
  * This routine replaces the usb_ep_autoconfig when needed
- * superspeed enhancments. If such enhancemnets are required,
+ * superspeed enhancements. If such enhancemnets are required,
  * the FD should call usb_ep_autoconfig_ss directly and provide
  * the additional ep_comp parameter.
  *
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..cf54704b7655 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -618,7 +618,7 @@ static void get_report_workqueue_handler(struct work_struct *work)
 			 */
 			req->buf = ptr->report_data.data;
 		} else {
-			/* If there are no prevoiusly sent reports send empty report */
+			/* If there are no previously sent reports send empty report */
 			req->buf = hidg->get_report.data;
 			memset(req->buf, 0x0, req->length);
 		}
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..f15e1c809a7d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -612,7 +612,7 @@ static void ncm_notify(struct f_ncm *ncm)
 	 *
 	 * If ncm_notify() is called before the second (CONNECT)
 	 * notification is sent, then it will reset to send the SPEED
-	 * notificaion again (and again, and again), but it's not a problem
+	 * notification again (and again, and again), but it's not a problem
 	 */
 	ncm->notify_state = NCM_NOTIFY_SPEED;
 	ncm_do_notify(ncm);
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d786110b..3f25d99be34d 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -557,7 +557,7 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 
 		/* If we not returning all the data left in this RX request
 		 * buffer then adjust the amount of data left in the buffer.
-		 * Othewise if we are done with this RX request buffer then
+		 * Otherwise if we are done with this RX request buffer then
 		 * requeue it to get any incoming data from the USB host.
 		 */
 		if (size < current_rx_bytes) {
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d8cf710085a0..f9ca07dec17e 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -206,7 +206,7 @@ static struct uac2_input_terminal_descriptor io_in_it_desc = {
 	.bmControls = cpu_to_le16(CONTROL_RDWR << COPY_CTRL),
 };
 
-/* Ouput Terminal for USB_IN */
+/* Output Terminal for USB_IN */
 static struct uac2_output_terminal_descriptor usb_in_ot_desc = {
 	.bLength = sizeof usb_in_ot_desc,
 	.bDescriptorType = USB_DT_CS_INTERFACE,
@@ -220,7 +220,7 @@ static struct uac2_output_terminal_descriptor usb_in_ot_desc = {
 	.bmControls = cpu_to_le16(CONTROL_RDWR << COPY_CTRL),
 };
 
-/* Ouput Terminal for I/O-Out */
+/* Output Terminal for I/O-Out */
 static struct uac2_output_terminal_descriptor io_out_ot_desc = {
 	.bLength = sizeof io_out_ot_desc,
 	.bDescriptorType = USB_DT_CS_INTERFACE,
diff --git a/drivers/usb/gadget/function/ndis.h b/drivers/usb/gadget/function/ndis.h
index a19f72dec0cd..16e87628d37b 100644
--- a/drivers/usb/gadget/function/ndis.h
+++ b/drivers/usb/gadget/function/ndis.h
@@ -4,7 +4,7 @@
  * ntddndis.h modified by Benedikt Spranger <b.spranger@pengutronix.de>
  *
  * Thanks to the cygwin development team,
- * espacially to Casper S. Hornstrup <chorns@users.sourceforge.net>
+ * especially to Casper S. Hornstrup <chorns@users.sourceforge.net>
  *
  * THIS SOFTWARE IS NOT COPYRIGHTED
  *
diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index a2fd239b7ad3..0d3f784dc945 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -731,7 +731,7 @@ static int rndis_keepalive_response(struct rndis_params *params,
 
 
 /*
- * Device to Host Comunication
+ * Device to Host Communication
  */
 static int rndis_indicate_status_msg(struct rndis_params *params, u32 status)
 {
diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index 75831f2c7abe..cc90e252925c 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -3,7 +3,7 @@
  * storage_common.c -- Common definitions for mass storage functionality
  *
  * Copyright (C) 2003-2008 Alan Stern
- * Copyeight (C) 2009 Samsung Electronics
+ * Copyright (C) 2009 Samsung Electronics
  * Author: Michal Nazarewicz (mina86@mina86.com)
  */
 
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc..11d8a304a38e 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -129,7 +129,7 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * in samples/microframe.
 		 * Format is encoded in Q12.13 fitted into four bytes so that
 		 * the binary point is located between the second and the third
-		 * byte fromat (that is Q16.16)
+		 * byte format (that is Q16.16)
 		 *
 		 * ff = (freq << 16) / 8000
 		 *
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 7f6d8460152f..cc059a6ee262 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2081,7 +2081,7 @@ static const struct file_operations ep0_operations = {
 
 
 /* FIXME PAM etc could set this security policy without mount options
- * if epfiles inherited ownership and permissons from ep0 ...
+ * if epfiles inherited ownership and permissions from ep0 ...
  */
 
 static unsigned default_uid;
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index e9aa74231760..6b363aa6f8bd 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -365,7 +365,7 @@ static int ast_vhub_ep0_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 	struct device *dev = &vhub->pdev->dev;
 	unsigned long flags;
 
-	/* Paranoid cheks */
+	/* Paranoid checks */
 	if (!u_req || (!u_req->complete && !req->internal)) {
 		dev_warn(dev, "Bogus EP0 request ! u_req=%p\n", u_req);
 		if (u_req) {
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index d0345f31037a..5a9accd8fb53 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -551,7 +551,7 @@ void ast_vhub_device_connect(struct ast_vhub *vhub,
 					  0, true);
 
 	/*
-	 * If the hub is set to wakup the host on connection events
+	 * If the hub is set to wakeup the host on connection events
 	 * then send a wakeup.
 	 */
 	if (vhub->wakeup_en)
diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 2f4abf6f8f77..d967bd5bd625 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -361,13 +361,13 @@ struct bdc_ep {
 	/* endpoint bd list*/
 	struct bd_list bd_list;
 	/*
-	 * HW generates extra event for multi bd tranfers, this flag helps in
+	 * HW generates extra event for multi bd transfers, this flag helps in
 	 * ignoring the extra event
 	 */
 	bool ignore_next_sr;
 };
 
-/* bdc cmmand parameter structure */
+/* bdc command parameter structure */
 struct bdc_cmd_params {
 	u32	param2;
 	u32	param1;
@@ -414,7 +414,7 @@ struct bdc {
 	/* num of endpoints for a particular instantiation of IP */
 	unsigned int num_eps;
 	/*
-	 * Array of ep's, it uses the same index covention as bdc hw i.e.
+	 * Array of ep's, it uses the same index convention as bdc hw i.e.
 	 * 1 for ep0, 2 for 1out,3 for 1in ....
 	 */
 	struct bdc_ep		**bdc_ep_array;
diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.c b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
index 1848ced073f8..831b0e252a2b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
@@ -116,7 +116,7 @@ int bdc_dconfig_ep(struct bdc *bdc, struct bdc_ep *ep)
 	return bdc_submit_cmd(bdc, cmd_sc, 0, 0, 0);
 }
 
-/* Reinitalize the bdlist after config ep command */
+/* Reinitialize the bdlist after config ep command */
 static void ep_bd_list_reinit(struct bdc_ep *ep)
 {
 	struct bdc *bdc = ep->bdc;
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index a8dbaef54aba..cd16b6010edd 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -296,7 +296,7 @@ static void bdc_mem_init(struct bdc *bdc, bool reinit)
 			for (i = 1; i < bdc->num_eps; ++i)
 				bdc->bdc_ep_array[i]->flags = 0;
 	} else {
-		/* One time initiaization only */
+		/* One time initialization only */
 		/* Enable status report function pointers */
 		bdc->sr_handler[0] = bdc_sr_xsf;
 		bdc->sr_handler[1] = bdc_sr_uspc;
@@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
 	return ret;
 }
 
-/* Allocate all the dyanmic memory */
+/* Allocate all the dynamic memory */
 static int bdc_mem_alloc(struct bdc *bdc)
 {
 	u32 page_size;
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index a7a22e5ec47b..039941009f1a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -198,7 +198,7 @@ static inline int bd_needed_req(struct bdc_req *req)
 	if (req->usb_req.length == 0)
 		return 1;
 
-	/* remaining bytes after tranfering all max BD size BD's */
+	/* remaining bytes after transferring all max BD size BD's */
 	remaining = req->usb_req.length % BD_MAX_BUFF_SIZE;
 	if (remaining)
 		bd_needed++;
@@ -298,8 +298,8 @@ static int bd_available_ep(struct bdc_ep *ep)
 		return bd_list->max_bdi - bd_list->num_tabs;
 
 	/*
-	 * Depending upon where eqp and dqp pointers are, caculate number
-	 * of avaialble bd's
+	 * Depending upon where eqp and dqp pointers are, calculate number
+	 * of available bd's
 	 */
 	if (bd_list->hwd_bdi < bd_list->eqp_bdi) {
 		/* available bd's are from eqp..max_bds + 0..dqp - chain_bds */
@@ -519,7 +519,7 @@ static int bdc_queue_xfr(struct bdc *bdc, struct bdc_req *req)
 	num_bds =  bd_needed_req(req);
 	bd_available = bd_available_ep(ep);
 
-	/* how many bd's are avaialble on ep */
+	/* how many bd's are available on ep */
 	if (num_bds > bd_available)
 		return -ENOMEM;
 
@@ -1093,7 +1093,7 @@ static void ep0_stall(struct bdc *bdc)
 	bdc->delayed_status = false;
 	ep_set_halt(ep, 1);
 
-	/* de-queue any pendig requests */
+	/* de-queue any pending requests */
 	while (!list_empty(&ep->queue)) {
 		req = list_entry(ep->queue.next, struct bdc_req,
 				queue);
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c b/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
index a5a9d395fd0d..802b7614ddea 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
@@ -495,7 +495,7 @@ void cdns2_handle_ep0_interrupt(struct cdns2_device *pdev, int dir)
 
 /*
  * Function shouldn't be called by gadget driver,
- * endpoint 0 is allways active.
+ * endpoint 0 is always active.
  */
 static int cdns2_gadget_ep0_enable(struct usb_ep *ep,
 				   const struct usb_endpoint_descriptor *desc)
@@ -505,7 +505,7 @@ static int cdns2_gadget_ep0_enable(struct usb_ep *ep,
 
 /*
  * Function shouldn't be called by gadget driver,
- * endpoint 0 is allways active.
+ * endpoint 0 is always active.
  */
 static int cdns2_gadget_ep0_disable(struct usb_ep *ep)
 {
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.h b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.h
index b5d5ec12e986..2ef1dea605ae 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.h
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.h
@@ -540,8 +540,8 @@ struct cdns2_ring {
  * @trb_burst_size: number of burst used in TRB.
  * @skip: Sometimes the controller cannot process isochronous endpoint ring
  *        quickly enough and it will miss some isoc tds on the ring and
- *        generate ISO transmition error.
- *        Driver sets skip flag when receive a ISO transmition error and
+ *        generate ISO transmission error.
+ *        Driver sets skip flag when receive a ISO transmission error and
  *        process the missed TDs on the endpoint ring.
  * @wa1_set: use WA1.
  * @wa1_trb: TRB assigned to WA1.
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d5844384c368..5ad5639a5ed1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1014,7 +1014,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_giveback_request);
 /* ------------------------------------------------------------------------- */
 
 /**
- * gadget_find_ep_by_name - returns ep whose name is the same as sting passed
+ * gadget_find_ep_by_name - returns ep whose name is the same as string passed
  *	in second parameter or NULL if searched endpoint not found
  * @g: controller to check for quirk
  * @name: name of searched endpoint
@@ -1525,7 +1525,7 @@ EXPORT_SYMBOL_GPL(usb_add_gadget_udc_release);
 /**
  * usb_get_gadget_udc_name - get the name of the first UDC controller
  * This functions returns the name of the first UDC controller in the system.
- * Please note that this interface is usefull only for legacy drivers which
+ * Please note that this interface is useful only for legacy drivers which
  * assume that there is only one UDC controller in the system and they need to
  * get its name before initialization. There is no guarantee that the UDC
  * of the returned name will be still available, when gadget driver registers
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.h b/drivers/usb/gadget/udc/fsl_qe_udc.h
index 53ca0ff7c2cb..902b0de88eca 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.h
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.h
@@ -213,7 +213,7 @@ struct qe_frame{
 #define RX_ER_CRC              0x04000000 /* Received packet with CRC error */
 #define RX_ER_OVERUN           0x02000000 /* Over-run occurred on reception */
 #define RX_ER_PID              0x01000000 /* Wrong PID received */
-/* Tranmit side */
+/* Transmit side */
 #define TX_ER_NAK              0x00800000 /* Received NAK handshake */
 #define TX_ER_STALL            0x00400000 /* Received STALL handshake */
 #define TX_ER_TIMEOUT          0x00200000 /* Transmit time out */
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 878d70b55530..f8fd6fd327ec 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -472,7 +472,7 @@ static int dr_ep_get_stall(unsigned char ep_num, unsigned char dir)
 ********************************************************************/
 
 /*------------------------------------------------------------------
-* struct_ep_qh_setup(): set the Endpoint Capabilites field of QH
+* struct_ep_qh_setup(): set the Endpoint Capabilities field of QH
  * @zlt: Zero Length Termination Select (1: disable; 0: enable)
  * @mult: Mult field
  ------------------------------------------------------------------*/
@@ -484,7 +484,7 @@ static void struct_ep_qh_setup(struct fsl_udc *udc, unsigned char ep_num,
 	struct ep_queue_head *p_QH = &udc->ep_qh[2 * ep_num + dir];
 	unsigned int tmp = 0;
 
-	/* set the Endpoint Capabilites in QH */
+	/* set the Endpoint Capabilities in QH */
 	switch (ep_type) {
 	case USB_ENDPOINT_XFER_CONTROL:
 		/* Interrupt On Setup (IOS). for control ep  */
@@ -594,7 +594,7 @@ static int fsl_ep_enable(struct usb_ep *_ep,
 	ep->stopped = 0;
 
 	/* Controller related setup */
-	/* Init EPx Queue Head (Ep Capabilites field in QH
+	/* Init EPx Queue Head (Ep Capabilities field in QH
 	 * according to max, zlt, mult) */
 	struct_ep_qh_setup(udc, (unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
@@ -1398,7 +1398,7 @@ __acquires(udc->lock)
 
 	udc_reset_ep_queue(udc, 0);
 
-	/* We process some stardard setup requests here */
+	/* We process some standard setup requests here */
 	switch (setup->bRequest) {
 	case USB_REQ_GET_STATUS:
 		/* Data+Status phase from udc */
@@ -1831,7 +1831,7 @@ static void reset_irq(struct fsl_udc *udc)
 
 	if (fsl_readl(&dr_regs->portsc1) & PORTSCX_PORT_RESET) {
 		dev_vdbg(udc->dev, "Bus reset\n");
-		/* Bus is reseting */
+		/* Bus is resetting */
 		udc->bus_reset = 1;
 		/* Reset all the queues, include XD, dTD, EP queue
 		 * head and TR Queue */
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index cdcbfae140e9..4426caa999a8 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -470,7 +470,7 @@ static int gr_add_dma_desc(struct gr_ep *ep, struct gr_request *req,
  * The first descriptor in the chain is enabled, the rest disabled. The
  * interrupt handler will later enable them one by one when needed so we can
  * find out when the transfer is finished. For OUT endpoints, all descriptors
- * therefore generate interrutps.
+ * therefore generate interrupts.
  */
 static int gr_setup_out_desc_list(struct gr_ep *ep, struct gr_request *req,
 				  gfp_t gfp_flags)
diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index d77c11c4eb38..18578975b1df 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -599,7 +599,7 @@ static void init_controller(struct m66592 *m66592)
 		m66592_bclr(m66592, M66592_DPRPU, M66592_SYSCFG);
 		m66592_bset(m66592, M66592_USBE, M66592_SYSCFG);
 
-		/* This is a workaound for SH7722 2nd cut */
+		/* This is a workaround for SH7722 2nd cut */
 		m66592_bset(m66592, 0x8000, M66592_DVSTCTR);
 		m66592_bset(m66592, 0x1000, M66592_TESTMODE);
 		m66592_bclr(m66592, 0x8000, M66592_DVSTCTR);
diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7c5f30cfd24d..0438bfed445f 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -1938,7 +1938,7 @@ static void defect7374_disable_data_eps(struct net2280 *dev)
 	/*
 	 * For Defect 7374, disable data EPs (and more):
 	 *  - This phase undoes the earlier phase of the Defect 7374 workaround,
-	 *    returing ep regs back to normal.
+	 *    returning ep regs back to normal.
 	 */
 	struct net2280_ep *ep;
 	int i;
diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..abcf3dbca29f 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -53,7 +53,7 @@
 #define UDC_EPCTL_F			(1 << 1)
 #define UDC_EPCTL_S			(1 << 0)
 #define UDC_EPCTL_ET_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPCTL_ET_MASK		0x00000030
 /* Value for ET field */
 #define UDC_EPCTL_ET_CONTROL		0
@@ -73,7 +73,7 @@
 #define UDC_EPSTS_BNA			(1 << 7)
 #define UDC_EPSTS_IN			(1 << 6)
 #define UDC_EPSTS_OUT_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPSTS_OUT_MASK		0x00000030
 #define UDC_EPSTS_ALL_CLR_MASK		0x1F0006F0
 /* Value for OUT field */
@@ -110,7 +110,7 @@
 #define UDC_DEVSTS_ALT_SHIFT		8
 #define UDC_DEVSTS_INTF_SHIFT		4
 #define UDC_DEVSTS_CFG_SHIFT		0
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVSTS_TS_MASK		0xfffc0000
 #define UDC_DEVSTS_ENUM_SPEED_MASK	0x00006000
 #define UDC_DEVSTS_ALT_MASK		0x00000f00
@@ -132,7 +132,7 @@
 #define UDC_DEVINT_ES			(1 << 2)
 #define UDC_DEVINT_SI			(1 << 1)
 #define UDC_DEVINT_SC			(1 << 0)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVINT_MSK			0x7f
 
 /* Endpoint irq register */
@@ -141,7 +141,7 @@
 #define UDC_EPINT_OUT_SHIFT		16
 #define UDC_EPINT_IN_EP0		(1 << 0)
 #define UDC_EPINT_OUT_EP0		(1 << 16)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPINT_MSK_DISABLE_ALL	0xffffffff
 
 /* UDC_CSR_BUSY Status register */
@@ -162,7 +162,7 @@
 #define UDC_CSR_NE_INTF_SHIFT		11
 #define UDC_CSR_NE_ALT_SHIFT		15
 #define UDC_CSR_NE_MAX_PKT_SHIFT	19
-/* Mask patern */
+/* Mask pattern */
 #define UDC_CSR_NE_NUM_MASK		0x0000000f
 #define UDC_CSR_NE_DIR_MASK		0x00000010
 #define UDC_CSR_NE_TYPE_MASK		0x00000060
@@ -296,7 +296,7 @@ struct pch_udc_ep {
 };
 
 /**
- * struct pch_vbus_gpio_data - Structure holding GPIO informaton
+ * struct pch_vbus_gpio_data - Structure holding GPIO information
  *					for detecting VBUS
  * @port:		gpio descriptor for the VBUS GPIO
  * @intr:		gpio interrupt number
@@ -319,7 +319,7 @@ struct pch_vbus_gpio_data {
  * @ep:			array of endpoints
  * @lock:		protects all state
  * @stall:		stall requested
- * @prot_stall:		protcol stall requested
+ * @prot_stall:		protocol stall requested
  * @suspended:		driver in suspended state
  * @connected:		gadget driver associated
  * @vbus_session:	required vbus_session state
@@ -332,7 +332,7 @@ struct pch_vbus_gpio_data {
  * @base_addr:		for mapped device memory
  * @bar:		PCI BAR used for mapped device memory
  * @cfg_data:		current cfg, intf, and alt in use
- * @vbus_gpio:		GPIO informaton for detecting VBUS
+ * @vbus_gpio:		GPIO information for detecting VBUS
  */
 struct pch_udc_dev {
 	struct usb_gadget		gadget;
@@ -846,7 +846,7 @@ static inline u32 pch_udc_read_ep_interrupts(struct pch_udc_dev *dev)
 }
 
 /**
- * pch_udc_write_ep_interrupts() - Clear endpoint interupts
+ * pch_udc_write_ep_interrupts() - Clear endpoint interrupts
  * @dev:	Reference to structure of type pch_udc_regs
  * @val:	The value to be written to interrupt register
  */
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..9fd079cb65c6 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1037,7 +1037,7 @@ static int write_ep0_fifo(struct pxa_ep *ep, struct pxa27x_request *req)
  * special case of ep0 setup :
  *   (irq->handle_ep0_ctrl_req->gadget_setup->pxa_ep_queue)
  *
- * Returns 0 if succedeed, error otherwise
+ * Returns 0 if succeeded, error otherwise
  */
 static int pxa_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 			gfp_t gfp_flags)
@@ -1535,7 +1535,7 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
  * @_gadget: usb gadget
  * @is_active: 0 if should disable the udc, 1 if should enable
  *
- * Enables the udc, and optionnaly activates D+ pullup resistor. Or disables the
+ * Enables the udc, and optionally activates D+ pullup resistor. Or disables the
  * udc, and deactivates D+ pullup resistor.
  *
  * Returns 0
@@ -1943,7 +1943,7 @@ static void handle_ep0_ctrl_req(struct pxa_udc *udc,
  *     STAGE. The driver add STATUS STAGE to send last zero length packet in
  *     OUT_STATUS_STAGE.
  *   - special attention was needed for IN_STATUS_STAGE. If a packet complete
- *     event is detected, we terminate the status stage without ackowledging the
+ *     event is detected, we terminate the status stage without acknowledging the
  *     packet (not to risk to loose a potential SETUP packet)
  */
 static void handle_ep0(struct pxa_udc *udc, int fifo_irq, int opc_irq)
@@ -2023,7 +2023,7 @@ static void handle_ep0(struct pxa_udc *udc, int fifo_irq, int opc_irq)
 }
 
 /**
- * handle_ep - Handle endpoint data tranfers
+ * handle_ep - Handle endpoint data transfers
  * @ep: pxa physical endpoint
  *
  * Tries to transfer all pending request data into the endpoint and/or
@@ -2091,7 +2091,7 @@ static void handle_ep(struct pxa_ep *ep)
  * @config: usb configuration
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 {
@@ -2121,7 +2121,7 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
  * @alt: alternate setting number
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 {
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 915786c9628c..c7477eb4b2d4 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -652,7 +652,7 @@ static int sudmac_alloc_channel(struct r8a66597 *r8a66597,
 		change_bfre_mode(r8a66597, ep->pipenum, 1);
 	}
 
-	/* set r8a66597_ep paramters */
+	/* set r8a66597_ep parameters */
 	ep->use_dma = 1;
 	ep->dma = dma;
 	ep->fifoaddr = D0FIFO;
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 367c9e73f366..cb6b365ab17c 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -858,7 +858,7 @@ static int usbf_epn_dma_in(struct usbf_ep *epn, struct usbf_req *req)
 		usbf_ep_reg_bitset(epn, USBF_REG_EPN_CONTROL, USBF_EPN_AUTO);
 
 		/* The end of DMA transfer at the USBF level needs to be handle
-		 * after the detection of the end of DMA transfer at the brige
+		 * after the detection of the end of DMA transfer at the bridge
 		 * level.
 		 * To force this sequence, EPN_IN_END_EN will be set by the
 		 * detection of the end of transfer at bridge level (ie. bridge
@@ -1075,7 +1075,7 @@ static void usbf_epn_dma_out_send_dma(struct usbf_ep *epn, dma_addr_t addr, u32
 				USBF_EPN_SET_DMACNT(0));
 
 		/* The end of DMA transfer at the USBF level needs to be handled
-		 * after the detection of the end of DMA transfer at the brige
+		 * after the detection of the end of DMA transfer at the bridge
 		 * level.
 		 * To force this sequence, enabling the OUT_END interrupt will
 		 * be donee by the detection of the end of transfer at bridge
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index d506f9d92bca..1cb29c1a0926 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -82,7 +82,7 @@ static int stop_timer;
  * in the FIFO (important for not blocking control traffic).
  * The value of set_rde controls the corresponding timer.
  *
- * set_rde -1 == not used, means it is alloed to be set to 0 or 1
+ * set_rde -1 == not used, means it is allowed to be set to 0 or 1
  * set_rde  0 == do not touch RDE, do no start the RDE timer
  * set_rde  1 == timer function will look whether FIFO has data
  * set_rde  2 == set by timer function to enable RX DMA on next call
@@ -1213,7 +1213,7 @@ udc_queue(struct usb_ep *usbep, struct usb_request *usbreq, gfp_t gfp)
 				DBG(dev, "udc_queue(): pending bytes in "
 					"rxfifo after nyet\n");
 				/*
-				 * read pending bytes afer nyet:
+				 * read pending bytes after nyet:
 				 * referring to isr
 				 */
 				if (udc_rxfifo_read(ep, req)) {
@@ -1328,7 +1328,7 @@ udc_set_halt(struct usb_ep *usbep, int halt)
 		else {
 			/*
 			 * set STALL
-			 * rxfifo empty not taken into acount
+			 * rxfifo empty not taken into account
 			 */
 			tmp = readl(&ep->regs->ctl);
 			tmp |= AMD_BIT(UDC_EPCTL_S);
diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 8ce43c4f8fba..a2350db814c3 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -36,7 +36,7 @@ static void stop_udc(struct udc *udc)
 
 	spin_lock(&udc->lock);
 
-	/* Flush the receieve fifo */
+	/* Flush the receive fifo */
 	reg = readl(&udc->regs->ctl);
 	reg |= AMD_BIT(UDC_DEVCTL_SRX_FLUSH);
 	writel(reg, &udc->regs->ctl);
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe7543b..20fe241b4275 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -311,7 +311,7 @@ static void xudc_epconfig(struct xusb_ep *ep, struct xusb_udc *udc)
  * Return: 0 on success, error code on failure
  *
  * This function starts DMA transfer by writing to DMA source,
- * destination and lenth registers.
+ * destination and length registers.
  */
 static int xudc_start_dma(struct xusb_ep *ep, dma_addr_t src,
 			  dma_addr_t dst, u32 length)
diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
index 37a2f1b61cba..51bf85f1e343 100644
--- a/drivers/usb/gadget/usbstring.c
+++ b/drivers/usb/gadget/usbstring.c
@@ -25,7 +25,7 @@
  * string descriptor in utf16-le.
  * Returns length of descriptor (always even) or negative errno
  *
- * If your driver needs stings in multiple languages, you'll probably
+ * If your driver needs strings in multiple languages, you'll probably
  * "switch (wIndex) { ... }"  in your ep0 string descriptor logic,
  * using this routine after choosing which set of UTF-8 strings to use.
  * Note that US-ASCII is a strict subset of UTF-8; any string bytes with
-- 
2.53.0



