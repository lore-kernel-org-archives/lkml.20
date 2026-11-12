Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445776;
	b=3cupqjAfjvNYPNxmhN7em2faRLOuAXA4KFHquNf/+n4dKrxfNGi138mJ5RWyQik0hn/6
	 a/NU4KChWAxRnBNpejV8cOxCenZEySh3huarkRQ2C2XblD4W0fhpz0ycglWGMHXq40AqM
	 0aEtg/5iOYyE9F1RZNxg7xWJpgeedlIP4YuQT1IMDea77NcYcufffaNzsh5r1mUFr0deS
	 2YfJRCF9y4GK2fL7TwNOlEszSIfmSgrLJnqiQ2ifG4UIuojRmfrXBFtmYeSNCxItxJ/Z0
	 KFixn2ibMNvSBl6q9lFL+PGCi9z91SAznO8Y6uHzVIxbvYCoNHPFBuJYrGcPWdwppqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445776;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ml7+hnMLt20J6tYDQMN5zrY5YKy+QB//6TSGPGrzSqs=;
	b=zaN1yeFPN7v2haA81YVQdxgOHenhYpHdaBrlXuIZfkYZBQobHSLUz3I2HKdDX/JlL6HD
	 FVZX9hECNtAP3X/bxjMgSv6BaKc5pWH9rz6m+6vgGw71Fnw4t4AGHZ7XfpLnwg2uod3l6
	 zfn2FG7CqtBHidjTK7o6ptx1Mi+jw4mHdBXJrRQq0xk17vDFTnZ+M7l809oBYXxhe/3vP
	 JO8PUvCelf7hL7pz9HuW8QJaWwdgGQiW7R1bcHgx3dwwwQJoPyJ1L8IDnPA9kQ1fsw+HO
	 j5LJgTWX/FmVR4ikNd7AWYdE4uSRumNNcUDuieCIWELBvFWDGI3+B+Nvr59WNmml69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QP0Twke6;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B785F606A321;
	Thu, 12 Nov 2026 01:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B785F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QP0Twke6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QP0Twke6IY3uyxYIzyaAIzvf6p0kPa+oujyZu+Z0Qwvxv7hTh4kZpiwqGC/WiseFoeOCUSD4oirwE
	 f9iFtU7WOuqI/hA9C52TIAiT7q2paWNXyMXKEY+m8YCB8kobbbr0KuWr9QLoZfuKSQCDJeh9fsAI/h
	 KQPAu7NROR7/Y1Pg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af511c9360-7b2f5;
	Thu, 12 Nov 2026 09:09:32 +0800 (CST)
X-RM-TRANSID:2ee46af511c9360-7b2f5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af511c8154-ec50e;
	Thu, 12 Nov 2026 09:09:32 +0800 (CST)
X-RM-TRANSID:2eea6af511c8154-ec50e
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] usb: gadget: f_hid: fix race between userspace report update and GET_REPORT response
Date: Thu, 12 Nov 2026 01:09:27 +0000
Message-ID: <20261112010928.23716-4-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
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

Serve the response from a dedicated buffer allocated once in
hidg_alloc() and freed in hidg_release(): the handler copies the
entry data into get_req_buf and zeroes the rest before queueing,
so userspace updates to the entry can no longer race with the
asynchronous read of the previous response, and no uninitialized
slab memory is exposed to the host.  Placing the buffer at the
function-instance level (rather than bind/unbind) means it is only
freed after all USB activity has ceased and all userspace file
references are gone, so no disable/set_alt/unbind ordering
constraints apply.

This also removes the now unused get_report member from struct
f_hidg.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 36 +++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index d7ba30323414..8c2adf392389 100644
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
@@ -568,6 +569,7 @@ static void get_report_workqueue_handler(struct work_struct *work)
 	struct usb_request		*req;
 	struct report_entry *ptr;
 	unsigned long	flags;
+	unsigned int copied;
 
 	int status = 0;
 
@@ -587,7 +589,10 @@ static void get_report_workqueue_handler(struct work_struct *work)
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
@@ -622,10 +627,12 @@ static void get_report_workqueue_handler(struct work_struct *work)
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
 
@@ -1160,6 +1167,15 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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
@@ -1646,6 +1662,18 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
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



