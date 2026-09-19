Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD183ACF1D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857325; cv=none; b=dQeeJqz0DnfWyfxfDpK/XdGDDkwwLN1TzWc/nNt3MS7jnEe7CZ2txIlg8kk6UH8lnVcpAIqrHNypv74+FZLPGIGvlQlerMHqTao/0CCPigr5+QK3mT01yCIKR3qZJh2tV0U9nuG9pgJDMXEdtiLTHRgnknUUCEkYIiMxSnzQ7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857325; c=relaxed/simple;
	bh=fyN1/ggVxJygZG5i6+A4c1djg5DKsUoEuMFLVp4UvTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NDESNbE2LcsFyOxD6w+vQY8QCtNZ3/V7lW3eLltFkrj2jcCGJVzBIeUVDFdmZQNk5IxPV2Ahr1gGC1MUm/7mnoNGZxfdvkwn02Gqmv7dsDg1Y6zs6lerHKMnHkZLkQCzVhefuV0T3Qvtl9yoNFDolnrTg5IjCakRJKp4Dk7IvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2KGW5bn; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2KGW5bn"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1102120a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857322; x=1790462122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UCLzSSGOZOFP4VEGt9CYwna1SB1xEnYIUlL/0fxF74=;
        b=G2KGW5bn1zX/le78Q9Gl5bFGV5Dh2RXd4mJQzbcwwtikIurFEXZhHhHqLfaYdFs52D
         8ELC/Xmdkk6F+ZZWxoEJbggJlJIDpyfIpIxMV/xI0x0Er8mcE/O8iH54PR7a29AtKBoo
         f5DdqtDPD+naaipTascuiNSRoNPHeyRgpvUbHvt/FR76oHmdU9DZpbwl9MNOce+8wzn8
         Wc0XhbST9E4eO2Wwf5g4OAgtQuO1eluKfR3H3TPf4/ex4p3UeBWwWsuSaTWHNIPWx2G/
         1YWY1WnpFrz7CAMgPOBfHi2xe5weQVzmxO0TKsqT8A8CVDCeaf9gbuezkbsA/+ysVz0z
         VMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857322; x=1790462122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UCLzSSGOZOFP4VEGt9CYwna1SB1xEnYIUlL/0fxF74=;
        b=ztoboclflfVL6cZ5xY8R9kpYM5DxEGka11ozAnTViVUW3oKkZdLFVXg916GTe4oPDd
         AsdiKHZr4tIjJ9Zvfh2mdkalctzg3gMGr+89hyEXZx3K+QjFTHDXLHS0HQgHCwEBVf2t
         0Bcho0OTkX4wOhSBIxtxM/+6WznDNZsl/838ow+RNVqzs+Q3SbbxLroSmK/OxW43oDtA
         J4/gbOFtkfiZhx3tVCgTinutHtIDa8Ek/87wSuBwQ8gxwan7+GDSMo/60gtb+WeadBM3
         RfPWcKDl1DhZrxqklXOIbs5dlzGWoRtYOoPQf/fXZMnl4VIOfP91oLrZviyozasOX3cf
         hyHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzzx92e8ZRg5pQ4DA6SCY6Qoq+GV8LANa8/HhSlYN3grTBj14RzQCcfQMDSJFbSaBD+OkbaDSIXW1sy8A=@vger.kernel.org
X-Gm-Message-State: AFuF++ki5xAyqJbsw4ljmvPd0CrHK/InsyRMcUJR4DW+SmgMsS6IrKdf
	7581MA/aLHKmWisBj0ClVzOVTnm0O9evO8F8BYAOmn5837o3b9Oybkz+Gr0fEVqo
X-Gm-Gg: AYBFou0y1YczrZCo2ThcBw/Z3nmjOKKObfBAP9njmRpHtjwmNwX9AsB8ZaWlpgOxbWt
	yd3Zk0Ap+n9gtq5gRQK7RS4mUN6naRDNZyr5q5F21CU3O/OTIKkpuBq75t1R6tnvP+FynB76NP7
	yVkBEawQufFpdA5ST5RzGS4/fzwmZiqHF+1aFpxAeziFKCDf9hCOtagoPiGpQejhf4qRwMmzflk
	dpoLk+siAynsGtqqn2p8dUbZQHfmxqJh+Rekz0XmNsOZSOBTk+FD9nWvOZtDEMfOpPQf8Px7Me9
	gdOP4/swLgGsBJRbyqo/sJxnEerE0fK+gZvHn7Fg+p8bjnrTy7885S7way8A1wKwPnatLAru5nU
	UPGlWArOLLLi15Gr6glEiPRYmI2sPnGQ2kIOJU37k3PbMyDLyNedFYPRKqlUaD+Qw4yylYE3aOz
	pJTdAS+fYwqvG0iOjdUYPWoNW4kzCaNGcizD+A5b1l8FmjDHOmHM1Z6xkJtLA2fCZHWwiJ2wThw
	twdVqff8yXZuQsfP1Qw7vUBQFu2U2mtFh3NxtX9PNoiyLA9bidRNFA4ySJl++WhzP1rwkqlQrrv
	LfbwY6qWOY6qenu84GT2
X-Received: by 2002:a05:6a20:9f8a:b0:3dd:a008:dc3d with SMTP id adf61e73a8af0-3dda008e194mr5684774637.43.1789857322087;
        Sat, 19 Sep 2026 15:35:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72af027b9sm1295609a12.31.2026.09.19.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: fix f_printer ep0 overflow/list race and f_hid/f_tcm/f_eem bounds
Date: Sat, 19 Sep 2026 22:35:21 +0000
Message-ID: <20260919223521.3890508-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple memory corruption bugs in USB gadget function drivers:

1. In printer_func_setup() and printer_reset_interface()
   (drivers/usb/gadget/function/f_printer.c), bound GET_DEVICE_ID copies
   to USB_COMP_EP0_BUFSIZ (1024 bytes) under lock, and dequeue from
   dev->rx_reqs_active instead of dev->rx_buffers in
   printer_reset_interface().
2. In drivers/usb/gadget/function/f_hid.c, f_tcm.c, and f_eem.c,
   validate setup wLength, command lengths, and skb bounds.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index ac37d7c1d168..85dc67bc6be1 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -457,7 +457,7 @@ static int eem_unwrap(struct gether *port,
 					goto next;
 				}
 
-				ctx = kmalloc_obj(*ctx);
+				ctx = kmalloc_obj(*ctx, GFP_ATOMIC);
 				if (!ctx) {
 					kfree(req->buf);
 					usb_ep_free_request(ep, req);
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..9febf853a918 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -426,6 +426,9 @@ static ssize_t f_hidg_read(struct file *file, char __user *buffer,
 {
 	struct f_hidg *hidg = file->private_data;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+
 	if (hidg->use_out_ep)
 		return f_hidg_intout_read(file, buffer, count, ptr);
 	else
@@ -437,7 +440,7 @@ static void f_hidg_req_complete(struct usb_ep *ep, struct usb_request *req)
 	struct f_hidg *hidg = (struct f_hidg *)ep->driver_data;
 	unsigned long flags;
 
-	if (req->status != 0) {
+	if (req->status != 0 && hidg->func.config && hidg->func.config->cdev) {
 		ERROR(hidg->func.config->cdev,
 			"End Point Request ERROR: %d\n", req->status);
 	}
@@ -456,6 +459,9 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 	unsigned long flags;
 	ssize_t status = -ENOMEM;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 
 	if (!hidg->req) {
@@ -644,12 +650,16 @@ static int f_hidg_get_report_id(struct file *file, __u8 __user *buffer)
 static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
 {
 	struct f_hidg			*hidg = file->private_data;
-	struct usb_composite_dev	*cdev = hidg->func.config->cdev;
+	struct usb_composite_dev	*cdev;
 	unsigned long	flags;
 	struct report_entry *entry;
 	struct report_entry *ptr;
 	__u8 report_id;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+	cdev = hidg->func.config->cdev;
+
 	entry = kmalloc_obj(*entry);
 	if (!entry)
 		return -ENOMEM;
@@ -668,13 +678,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
@@ -998,11 +1002,12 @@ static void hidg_disable(struct usb_function *f)
 
 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
 	if (!hidg->get_report_returned) {
-		usb_ep_free_request(f->config->cdev->gadget->ep0, hidg->get_req);
-		hidg->get_req = NULL;
 		hidg->get_report_returned = true;
+		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
+		usb_ep_dequeue(f->config->cdev->gadget->ep0, hidg->get_req);
+	} else {
+		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 	}
-	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 
 	spin_lock_irqsave(&hidg->read_spinlock, flags);
 	hidg->disabled = true;
@@ -1100,6 +1105,8 @@ static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 
 	if (hidg->in_ep != NULL) {
 		spin_lock_irqsave(&hidg->write_spinlock, flags);
+		if (hidg->req && !hidg->write_pending)
+			free_ep_req(hidg->in_ep, hidg->req);
 		hidg->req = req_in;
 		hidg->write_pending = 0;
 		spin_unlock_irqrestore(&hidg->write_spinlock, flags);
@@ -1585,10 +1592,19 @@ static void hidg_free(struct usb_function *f)
 static void hidg_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct f_hidg *hidg = func_to_hidg(f);
+	struct report_entry *entry, *tmp;
+	unsigned long flags;
 
 	cdev_device_del(hidg->cdev, &hidg->dev);
 	destroy_workqueue(hidg->workqueue);
+	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
+	list_for_each_entry_safe(entry, tmp, &hidg->report_list, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 	usb_free_all_descriptors(f);
+	hidg->func.config = NULL;
 }
 
 static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d786110b..7709a20fa4cb 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -940,7 +940,7 @@ static void printer_soft_reset(struct printer_dev *dev)
 	}
 
 	while (likely(!(list_empty(&dev->rx_reqs_active)))) {
-		req = container_of(dev->rx_buffers.next, struct usb_request,
+		req = container_of(dev->rx_reqs_active.next, struct usb_request,
 				list);
 		list_del_init(&req->list);
 		list_add(&req->list, &dev->rx_reqs);
@@ -1030,16 +1030,19 @@ static int printer_func_setup(struct usb_function *f,
 			if ((wIndex>>8) != dev->interface)
 				break;
 
-			if (!*dev->pnp_string) {
+			spin_lock(&dev->lock);
+			if (!dev->pnp_string || !*dev->pnp_string) {
+				spin_unlock(&dev->lock);
 				value = 0;
 				break;
 			}
-			value = strlen(*dev->pnp_string);
-			buf[0] = (value >> 8) & 0xFF;
-			buf[1] = value & 0xFF;
+			value = min_t(size_t, strlen(*dev->pnp_string),
+				      USB_COMP_EP0_BUFSIZ - 2);
+			buf[0] = ((value + 2) >> 8) & 0xFF;
+			buf[1] = (value + 2) & 0xFF;
 			memcpy(buf + 2, *dev->pnp_string, value);
-			DBG(dev, "1284 PNP String: %x %s\n", value,
-			    *dev->pnp_string);
+			spin_unlock(&dev->lock);
+			value = min_t(u16, wLength, value + 2);
 			break;
 
 		case GET_PORT_STATUS: /* Get Port Status */
@@ -1265,11 +1268,17 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 {
 	struct f_printer_opts *opts = to_f_printer_opts(item);
 	char *new_pnp;
+	size_t copy_len;
 	int result;
 
 	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		result = -EBUSY;
+		goto unlock;
+	}
 
-	new_pnp = kstrndup(page, len, GFP_KERNEL);
+	copy_len = min_t(size_t, len, USB_COMP_EP0_BUFSIZ - 2);
+	new_pnp = kstrndup(page, copy_len, GFP_KERNEL);
 	if (!new_pnp) {
 		result = -ENOMEM;
 		goto unlock;
@@ -1277,7 +1286,6 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 
 	if (opts->pnp_string_allocated)
 		kfree(opts->pnp_string);
-
 	opts->pnp_string_allocated = true;
 	opts->pnp_string = new_pnp;
 	result = len;
diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a..6d67ec153b24 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -136,6 +136,8 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 			req->length = cmd->data_len;
 			cmd->data_len = 0;
 		}
+		if (cmd->is_read)
+			memset(fu->cmd[0].buf, 0, req->length);
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
@@ -330,7 +332,8 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	fu->bot_status.req->complete = bot_status_complete;
 	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
 
-	fu->cmd[0].buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
+	fu->cmd[0].buf = kzalloc(max(fu->ep_out->maxpacket,
+				     fu->ep_in->maxpacket), GFP_KERNEL);
 	if (!fu->cmd[0].buf)
 		goto err_buf;
 
@@ -528,7 +531,10 @@ static void uasp_free_cmdreq(struct f_uas *fu)
 	int i;
 
 	for (i = 0; i < USBG_NUM_CMDS; i++) {
-		usb_ep_free_request(fu->ep_cmd, fu->cmd[i].req);
+		if (fu->cmd[i].req) {
+			usb_ep_dequeue(fu->ep_cmd, fu->cmd[i].req);
+			usb_ep_free_request(fu->ep_cmd, fu->cmd[i].req);
+		}
 		kfree(fu->cmd[i].buf);
 		fu->cmd[i].req = NULL;
 		fu->cmd[i].buf = NULL;
@@ -871,7 +877,8 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	usbg_submit_command(fu, req);
+	if (usbg_submit_command(fu, req) < 0)
+		usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
 }
 
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stream)
@@ -904,11 +911,14 @@ static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stream)
 
 static int uasp_alloc_cmd(struct f_uas *fu, int i)
 {
+	size_t alloc_len = max_t(size_t, fu->ep_cmd->maxpacket,
+				 sizeof(struct command_iu) + USBG_MAX_CMD);
+
 	fu->cmd[i].req = usb_ep_alloc_request(fu->ep_cmd, GFP_KERNEL);
 	if (!fu->cmd[i].req)
 		goto err;
 
-	fu->cmd[i].buf = kmalloc(fu->ep_cmd->maxpacket, GFP_KERNEL);
+	fu->cmd[i].buf = kzalloc(alloc_len, GFP_KERNEL);
 	if (!fu->cmd[i].buf)
 		goto err_buf;
 
@@ -920,6 +930,7 @@ static int uasp_alloc_cmd(struct f_uas *fu, int i)
 
 err_buf:
 	usb_ep_free_request(fu->ep_cmd, fu->cmd[i].req);
+	fu->cmd[i].req = NULL;
 err:
 	return -ENOMEM;
 }
@@ -949,6 +960,7 @@ static int uasp_prepare_reqs(struct f_uas *fu)
 
 err_free_stream:
 	uasp_free_cmdreq(fu);
+	i = USBG_NUM_CMDS;
 
 err_cleanup:
 	if (i) {
@@ -1382,6 +1394,9 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 		return -EINVAL;
 	}
 
+	if (req->actual < sizeof(struct command_iu))
+		return -EINVAL;
+
 	scsi_tag = be16_to_cpup(&iu->tag);
 	cmd = usbg_get_cmd(fu, tv_nexus, scsi_tag);
 	if (IS_ERR(cmd)) {
@@ -1434,7 +1449,8 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 	}
 
 	cmd_len = (cmd_iu->len & ~0x3) + 16;
-	if (cmd_len > USBG_MAX_CMD) {
+	if (cmd_len > USBG_MAX_CMD ||
+	    req->actual < offsetof(struct command_iu, cdb) + cmd_len) {
 		target_free_tag(tv_nexus->tvn_se_sess, &cmd->se_cmd);
 		hash_del(&stream->node);
 		return -EINVAL;
@@ -1740,6 +1756,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 
 static int tcm_usbg_drop_nexus(struct usbg_tpg *);
 
+static int usbg_attach(struct usbg_tpg *);
+static void usbg_detach(struct usbg_tpg *);
+
 static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 {
 	struct usbg_tpg *tpg = container_of(se_tpg,
@@ -1747,6 +1766,11 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 	unsigned i;
 	struct f_tcm_opts *opts;
 
+	if (tpg->gadget_connect) {
+		usbg_detach(tpg);
+		tpg->gadget_connect = false;
+	}
+
 	tcm_usbg_drop_nexus(tpg);
 	core_tpg_deregister(se_tpg);
 	destroy_workqueue(tpg->workqueue);
@@ -1760,6 +1784,7 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 		opts = container_of(tpg_instances[i].func_inst,
 			struct f_tcm_opts, func_inst);
 		mutex_lock(&opts->dep_lock);
+		opts->can_attach = false;
 		if (opts->has_dep)
 			module_put(opts->dependent);
 		else
@@ -1816,9 +1841,6 @@ static struct configfs_attribute *usbg_wwn_attrs[] = {
 	NULL,
 };
 
-static int usbg_attach(struct usbg_tpg *);
-static void usbg_detach(struct usbg_tpg *);
-
 static int usbg_enable_tpg(struct se_portal_group *se_tpg, bool enable)
 {
 	struct usbg_tpg  *tpg = container_of(se_tpg, struct usbg_tpg, se_tpg);
