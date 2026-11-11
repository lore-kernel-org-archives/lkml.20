Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384810;
	b=tD0ydmsmAyuYHTaAFtldH70jYK+b24fUccoITuX0uixFuQO+0wG5fGv7n5uq4fjKdz9t
	 pOjsbwEoo77I78G6Zp6AHQ7yPGd6kmITwuccLaoq6vG8ycc3IvhV0QCm196spBmNopW1m
	 LXwdEmdFFj0Zjk8p/nXj/yGGgnN+eI2yChPFdMppnNM8j+uveIR64L6SEaEm388bOvZ+D
	 Cd7xweypWT2oSXYuZpwg2Ilo1NZfG9Nk+WBVHQtkN60xgkU5hqtALU3bAESeFuoZI/3Y2
	 i3LXXtyOcSs68DQFLuJg1wf423E2lSoA80MsjjPrMYBwTJZMWMIZn88FL6XgXusuXWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384810;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b7Bi93YhuWG+RdmQ9GL/DTEVMY9ztDb7MNZFb7Aqgr4=;
	b=bRLof16uU79s0719E6mJicAxeSOSMzjTeOqIVlbZRyNCF75VI5WY+WHiv5jO5+KPQXI8
	 GyQZx8q7KqunIt0+60cfnHEi+oH8/is+af53Z/k7OxPGBCPeygdYlMPm6MlGtifYYv+UU
	 UW4P8w3dyBvEz6flRPcVKPude/XDYNPlpzLYKKqmll3W1Ssy+v9J9Dm25mPCTPEJMbb/m
	 Vfx37s52BeLtyfRfpruQENBR0mmInunQNesY2UoMQWGmelB9afpOnaiVXEVebRXTUgA5t
	 +VJCIzfdq/Q571hnmBC40zTdAvUIK3cXze9dDN/rA0imbWEJINt2Kgb/68T6xqJrO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bcNu4gDT;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6E760A2612;
	Wed, 11 Nov 2026 08:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6E760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bcNu4gDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=bcNu4gDTwUMX5JYpPnRnqFEmxYRgeKiX4ZNot9IFs7nROyt/Ux3i0qiP26IOaelJSKeOGpKLYi19x
	 oLWGXndg2615Lwu2qp/oZJJrxKN8lHAWQSyDeDPAtPG9/1R4xgflH3kor6luiBAeyOJRwoSf1IQ++i
	 ps05gQDjjnTMddjc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af4239e7f0-dbb65;
	Wed, 11 Nov 2026 16:13:18 +0800 (CST)
X-RM-TRANSID:2ee96af4239e7f0-dbb65
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42399a3d-d4b4b;
	Wed, 11 Nov 2026 16:13:18 +0800 (CST)
X-RM-TRANSID:2ee46af42399a3d-d4b4b
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] usb: gadget: f_hid: fix race between userspace report update and GET_REPORT response
Date: Wed, 11 Nov 2026 08:13:12 +0000
Message-ID: <20261111081313.16626-4-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
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

The GET_REPORT response is served by pointing get_req->buf at the
data[] array of a report_list entry and calling usb_ep_queue().
The request completes asynchronously, so the controller may still
be reading the entry's buffer after get_report_workqueue_handler()
drops get_report_spinlock.

At the same time, userspace can update that same entry via the
GADGET_HID_WRITE_GET_REPORT ioctl: f_hidg_get_report() copies new
report data into the entry while holding the spinlock, but the
transfer reading the entry is not serialized against that update
(the lock was already released by the work handler).

The result is that the host can receive a GET_REPORT response that
mixes bytes of the old and the new report (a torn write), with no
memory-safety violation but corrupted report data on the wire.

Serve the response from a dedicated buffer allocated at bind time:
the handler now copies the entry data into get_req_buf and zeroes
the rest of the buffer before queueing the request, so userspace
updates to the entry can no longer race with the asynchronous read
of the previous response, and no uninitialized slab memory is
exposed to the host.

The buffer lives from bind() to unbind(); hidg_disable() must not
free it, because hidg_set_alt() does not reallocate it and the next
GET_REPORT after a USB reset would use freed memory.

This also removes the now unused get_report member from struct
f_hidg.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 36 +++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index d7ba30323414..426bc1743cbb 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -94,7 +94,7 @@ struct f_hidg {
 
 	/* get report */
 	struct usb_request		*get_req;
-	struct usb_hidg_report		get_report;
+	void				*get_req_buf;
 	bool				get_report_returned;
 	int				get_report_req_report_id;
 	int				get_report_req_report_length;
@@ -568,6 +568,7 @@ static void get_report_workqueue_handler(struct work_struct *work)
 	struct usb_request		*req;
 	struct report_entry *ptr;
 	unsigned long	flags;
+	unsigned int copied;
 
 	int status = 0;
 
@@ -587,7 +588,10 @@ static void get_report_workqueue_handler(struct work_struct *work)
 	ptr = f_hidg_search_for_report(hidg, hidg->get_report_req_report_id);
 	if (ptr && !ptr->report_data.userspace_req) {
 		/* Report exists in list and it is to be used for immediate response */
-		req->buf = ptr->report_data.data;
+		copied = min_t(unsigned int, req->length, ptr->report_data.length);
+		memcpy(req->buf, ptr->report_data.data, copied);
+		if (copied < MAX_REPORT_LENGTH)
+			memset(req->buf + copied, 0x0, MAX_REPORT_LENGTH - copied);
 		status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
 		hidg->get_report_returned = true;
 		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
@@ -622,10 +626,12 @@ static void get_report_workqueue_handler(struct work_struct *work)
 			 * Either get an updated response just serviced by userspace
 			 * or send the latest response in the list
 			 */
-			req->buf = ptr->report_data.data;
+			copied = min_t(unsigned int, req->length, ptr->report_data.length);
+			memcpy(req->buf, ptr->report_data.data, copied);
+			if (copied < MAX_REPORT_LENGTH)
+				memset(req->buf + copied, 0x0, MAX_REPORT_LENGTH - copied);
 		} else {
 			/* If there are no prevoiusly sent reports send empty report */
-			req->buf = hidg->get_report.data;
 			memset(req->buf, 0x0, req->length);
 		}
 
@@ -1160,6 +1166,23 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!hidg->get_req)
 		return -ENOMEM;
 
+	/*
+	 * The GET_REPORT response is served from a dedicated buffer, not
+	 * from the report_list entries: userspace may update an entry
+	 * (f_hidg_get_report()) while the controller is still reading the
+	 * previous response, which would corrupt the data on the wire.
+	 *
+	 * The buffer lives from bind() to unbind(); hidg_disable() must
+	 * not free it, because hidg_set_alt() does not reallocate it and
+	 * the next GET_REPORT after a USB reset would use freed memory.
+	 */
+	hidg->get_req_buf = kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
+	if (!hidg->get_req_buf) {
+		status = -ENOMEM;
+		goto fail_free_request;
+	}
+	hidg->get_req->buf = hidg->get_req_buf;
+
 	hidg->get_req->zero = 0;
 	hidg->get_req->complete = hidg_get_report_complete;
 	hidg->get_req->context = hidg;
@@ -1303,6 +1326,9 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (hidg->req != NULL)
 		free_ep_req(hidg->in_ep, hidg->req);
 
+	kfree(hidg->get_req_buf);
+	hidg->get_req_buf = NULL;
+fail_free_request:
 	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
 	hidg->get_req = NULL;
 
@@ -1593,6 +1619,8 @@ static void hidg_unbind(struct usb_configuration *c, struct usb_function *f)
 
 	cdev_device_del(hidg->cdev, &hidg->dev);
 	destroy_workqueue(hidg->workqueue);
+	kfree(hidg->get_req_buf);
+	hidg->get_req_buf = NULL;
 	usb_free_all_descriptors(f);
 }
 
-- 
2.53.0



