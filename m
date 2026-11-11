Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363422;
	b=pRjyPDrFO9VjrI6vuhi4unX9IDmtoRqHGuE27PB36FCwhEshTYbX09dRMiXvwpj/ziQF
	 gwodG6x3Q2C8Wy5nrahktEHLJdbdDyEapRqLZxAAXE4JktwZ0CF2lLWIVWpmU4jCjAHwX
	 4f5XN9iB1mCiDrc273bqw7+WpAVp2pwWoUPbV9mLuj3SCqse3thItIRi8I/4Abjdl4wlK
	 Zsn4uD7iUU6zcDtmNUTUMwk0x/mVHT6eseEX4TYutk3fArTbCTOuFRqw6MwBVbIBqye7T
	 H24QtTDjZ06cO2g6SDd0WNpbuiIUyRsvq6Xse7qQ2osXx93eJRA5cQzvVC97dY2asBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363422;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AsvmgZZ04ynDo5lf0VPc3x/TvRtIDu6sj9PHArQ0OOQ=;
	b=v/lNmtDokvjWAJKtnZCxJpDlADOtX6r0lPFXAYO2vvJ9A3dTWa6XGkFPJjFDZc/M3ERo
	 dw5MUmmSzH+KO1ZAmNhg00Grtl136lj4TjoT6FIciGXffn/BizNEwn+ZDdmOhhUjEuP/w
	 opzVHCTBQvKunw4OoO0OPADqoH5vLjCAmhMb4Jc6AXRI7iSx8OMd7NHK1gvDSUJP0Cxdr
	 qU70ElUpD77uju30GUtUqTPGPaiOaco7Tg++ALiHoYfHHK41Mcrc2M/DZEqilSBNlf5/i
	 5oSKrigm1K0jVH0Z44HrnNVKBvWhsV0vbYkmMDcnjqFGyOqFMEyjx0pCLS14s0GcP1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=J8RKynsr;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25011606A324;
	Wed, 11 Nov 2026 02:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25011606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=J8RKynsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=J8RKynsrBwqChGm3xKOUpzjAyNo+Pnx4Zx9qce8T2PwSB9iG5/c3kzqF0GstQKsmHMCyo2lkHNuiO
	 zp2OZz1ZUmz2g+IB+kN3oi2rBy3nWs+GH2DVJyyDYBM372y8ergc8zp6aVWQmogpAF/V8L3qnoSGGW
	 eCUkidjrt8oQNrJI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af3d01b084-d0663;
	Wed, 11 Nov 2026 10:16:59 +0800 (CST)
X-RM-TRANSID:2ee56af3d01b084-d0663
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af3d01737a-ca710;
	Wed, 11 Nov 2026 10:16:59 +0800 (CST)
X-RM-TRANSID:2ee56af3d01737a-ca710
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: gadget: f_hid: fix race between userspace report update and GET_REPORT response
Date: Wed, 11 Nov 2026 02:16:55 +0000
Message-ID: <20261111021655.37851-4-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
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
the handler now copies the entry data into get_req_buf before
queueing the request, so userspace updates to the entry can no
longer race with the asynchronous read of the previous response.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index d7ba30323414..1810e3163518 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -94,6 +94,7 @@ struct f_hidg {
 
 	/* get report */
 	struct usb_request		*get_req;
+	void				*get_req_buf;
 	struct usb_hidg_report		get_report;
 	bool				get_report_returned;
 	int				get_report_req_report_id;
@@ -587,7 +588,8 @@ static void get_report_workqueue_handler(struct work_struct *work)
 	ptr = f_hidg_search_for_report(hidg, hidg->get_report_req_report_id);
 	if (ptr && !ptr->report_data.userspace_req) {
 		/* Report exists in list and it is to be used for immediate response */
-		req->buf = ptr->report_data.data;
+		memcpy(req->buf, ptr->report_data.data,
+		       min(req->length, (unsigned int)ptr->report_data.length));
 		status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
 		hidg->get_report_returned = true;
 		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
@@ -622,10 +624,10 @@ static void get_report_workqueue_handler(struct work_struct *work)
 			 * Either get an updated response just serviced by userspace
 			 * or send the latest response in the list
 			 */
-			req->buf = ptr->report_data.data;
+			memcpy(req->buf, ptr->report_data.data,
+			       min(req->length, (unsigned int)ptr->report_data.length));
 		} else {
 			/* If there are no prevoiusly sent reports send empty report */
-			req->buf = hidg->get_report.data;
 			memset(req->buf, 0x0, req->length);
 		}
 
@@ -1007,6 +1009,8 @@ static void hidg_disable(struct usb_function *f)
 		hidg->get_req = NULL;
 		hidg->get_report_returned = true;
 	}
+	kfree(hidg->get_req_buf);
+	hidg->get_req_buf = NULL;
 	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 
 	spin_lock_irqsave(&hidg->read_spinlock, flags);
@@ -1160,6 +1164,19 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!hidg->get_req)
 		return -ENOMEM;
 
+	/*
+	 * The GET_REPORT response is served from a dedicated buffer, not
+	 * from the report_list entries: userspace may update an entry
+	 * (f_hidg_get_report()) while the controller is still reading the
+	 * previous response, which would corrupt the data on the wire.
+	 */
+	hidg->get_req_buf = kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
+	if (!hidg->get_req_buf) {
+		usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
+		return -ENOMEM;
+	}
+	hidg->get_req->buf = hidg->get_req_buf;
+
 	hidg->get_req->zero = 0;
 	hidg->get_req->complete = hidg_get_report_complete;
 	hidg->get_req->context = hidg;
-- 
2.53.0



