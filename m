Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919894;
	b=1ZK79H19BywfBs6QZtHYbyJVptQEUTq5X38yYvQQBx9ZZpOBVJusfX+o0BO8bFru0khp
	 BGxzemO3A481Br9TbsYpCPjCH6wzJD324HEJlVGtCTrQg+cl6sagczrVfRPh7f/rh3Qbm
	 Op76GNKXAa5ABV0KFWOpwxHcjyCCN0AuDFIFh+4joZP/n+3Q1hw1/9bZ0aMguuqPyStDx
	 nhXcoMRm4lcZVsORiZrw3Ir46kgeblDbZ/uH4gtqI76LQgEiqDeMCFF0QRgQD2h+FlPKd
	 3JUxWXMGvK1+uUjZritap6MFL2yF2g+6suzfyFtKKIjMN0T5mcBUxnBOf6lv6gShZ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919894;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6GIe2jMm2efcwcdu1CuO0tRd8b3RmXepdg/7r62Rhcw=;
	b=j8rAEo7vpLi2xm160Bhvj7CWFrWzM6E3X4Fh+MyMIeyuyKVw8qWUYVFesYeluVc2Cxm0
	 IeLtsqSa2l/xUyISrmea3Ytzqu99u2/355Z0I4LAKDwYwIxNau3Ro1DjwIqg4YCkbXzPX
	 c8dgKU6ueO27IUeiHdyQnYFXWo76Q0s3eIDoDL6Yn9ijaVdxz9C9Pl9qg9/4UmPVvjXIp
	 RS373WqMgco2gSXZdpdgeUgUSVrfqnRshZyPW2we6iL/grOOvCJYzXhPqAILuFraCYRx2
	 YV5wHz7qAfvmnw4yLmFHP+YAv6tfD/yqnCHGoTl4pRRx9miMyQlDWUpZ7ynUq6xswyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Pv5znyws;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CF9606A338;
	Tue, 17 Nov 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CF9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Pv5znyws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Pv5znywsD6zShjgJLKaIUXwVCHaEklUyppjFZUlSeLjYqgoi3Vz37uTwnHnO8n/37r6CxV5/yuOGO
	 bqzLQ9bN3HpDSFbKbREhBZ6j5tHE0FKELpkNghCFiAn677bFhexyDyM6KQciWgjEjTZmE6A/3VKfCy
	 Z8PBFZkKU3sPDe+0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afc4db0886-aabc4;
	Tue, 17 Nov 2026 20:50:57 +0800 (CST)
X-RM-TRANSID:2ee46afc4db0886-aabc4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[123.121.1.242])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afc4dad71e-b1c13;
	Tue, 17 Nov 2026 20:50:57 +0800 (CST)
X-RM-TRANSID:2ee66afc4dad71e-b1c13
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 2/3] usb: gadget: f_hid: fix race between userspace report update and GET_REPORT response
Date: Tue, 17 Nov 2026 12:50:50 +0000
Message-ID: <20261117125051.5646-3-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Serve the response from a dedicated buffer allocated once in
hidg_alloc() and freed in hidg_release().

This also removes the now unused get_report member from struct
f_hidg.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
Changes in v4:
 Just copy req->length bytes to keep the existing UAPI behavior
 suggested by Neill. Thanks!

 drivers/usb/gadget/function/f_hid.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index d7ba30323414..d864a0d4bb8f 100644
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
@@ -128,6 +128,7 @@ static void hidg_release(struct device *dev)
 		kfree(entry);
 	}
 
+	kfree(hidg->get_req_buf);
 	kfree(hidg->report_desc);
 	kfree(hidg->set_report_buf);
 	kfree(hidg);
@@ -587,7 +588,7 @@ static void get_report_workqueue_handler(struct work_struct *work)
 	ptr = f_hidg_search_for_report(hidg, hidg->get_report_req_report_id);
 	if (ptr && !ptr->report_data.userspace_req) {
 		/* Report exists in list and it is to be used for immediate response */
-		req->buf = ptr->report_data.data;
+		memcpy(req->buf, ptr->report_data.data, req->length);
 		status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
 		hidg->get_report_returned = true;
 		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
@@ -622,10 +623,9 @@ static void get_report_workqueue_handler(struct work_struct *work)
 			 * Either get an updated response just serviced by userspace
 			 * or send the latest response in the list
 			 */
-			req->buf = ptr->report_data.data;
+			memcpy(req->buf, ptr->report_data.data, req->length);
 		} else {
 			/* If there are no prevoiusly sent reports send empty report */
-			req->buf = hidg->get_report.data;
 			memset(req->buf, 0x0, req->length);
 		}
 
@@ -1160,6 +1160,15 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!hidg->get_req)
 		return -ENOMEM;
 
+	/*
+	 * The GET_REPORT response is served from a dedicated buffer
+	 * (allocated in hidg_alloc()), not from the report_list
+	 * entries: userspace may update an entry while the controller
+	 * is still reading the previous response, which would corrupt
+	 * the data on the wire.
+	 */
+	hidg->get_req->buf = hidg->get_req_buf;
+
 	hidg->get_req->zero = 0;
 	hidg->get_req->complete = hidg_get_report_complete;
 	hidg->get_req->context = hidg;
@@ -1646,6 +1655,18 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	}
 	hidg->use_out_ep = !opts->no_out_endpoint;
 
+	/*
+	 * Dedicated buffer for GET_REPORT responses, allocated once for
+	 * the whole lifetime of this function instance: hidg_release()
+	 * is the only safe free point, as it runs after all USB
+	 * activity has ceased and all file references are gone.
+	 */
+	hidg->get_req_buf = kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
+	if (!hidg->get_req_buf) {
+		ret = -ENOMEM;
+		goto err_put_device;
+	}
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
-- 
2.53.0



