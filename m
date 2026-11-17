Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916770;
	b=Du3BpaRccg0XwkX2R+4XVxvNL+eORdFbPvRg0GH6rLOTRQEWgWEKIYMHED+AtF/X3egC
	 RQFdh63Ir84yvGWTcEZqdeLh4Y3Qo8xwBo/6mFAtNgZsP6IVqFyazXM3lIGonAGT7sn5h
	 D2NQEErS5qC+gUE++SvsH6ha0XJIOBaO2XhMbnvlfyVu8eKVdn6JXFCFERrK47Yww1McE
	 RRvoo7X8qXl7OVPxcixha4SJ85x0jUBfwm2HZ/lbS3au2CKIUSeKFIdssKnbFzczt18nU
	 +jcGg7v2x0P4WXZn+6N6WGdBdbt4F73IpDwQA3jSZTKxs/pkzRvGsAgRuZnOtQWVK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=wtpxAt2Uf4YERXke+LICDmqP5qj/rD7huDmAbU+zMVQ=;
	b=VrRLCg04eXhKFeG9P5Zh838tfew/CKyqomPvdB8ojwOlhjvww+Ol02qptSR1GoYZaUat
	 s4m+Wgt4z10CsWZeFhaYhS9bzNxkUjvIZQh1NC/GEHzPuwFS05chxr6hnf//bjP9gc6lz
	 pbZIZQ6eADSTazs9oAO6KRKquh1KhFGf6YJGRkxmSY6oeb1aIwKfQdFXpfgz3lj32g65C
	 ebD4/zZR5+aha9ULjysW2luhsDCHyIA9XHostzG0V2RCfEpHi4RcFKB0c/gELPZO0yFzP
	 eQGv324vLp7G0p86mOBlJSIvH1SfuA9cd1vCatzSktIDku9CRQjwKmcvAdZn39S0tmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhe4CugM;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D3606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5D3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhe4CugM
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so461442566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916768; x=1795521568; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wtpxAt2Uf4YERXke+LICDmqP5qj/rD7huDmAbU+zMVQ=;
        b=zhe4CugMEF2Tny7MES6Jhty/Yrxp9uw6z7l9TPJQTho2BjRP2FnzVLBF+emuopryS0
         7Jnpz1j/OtxbLjlrY0sIbAlQfCio7lqNN+N7p6g922XolbEDy8lTewzp89K/fKJl6B8X
         Wh4/RorS0aPe4smmxOXnZnV4Vw/HewLDwDfKNv19kbrd9QhvWNEHTumHoXwBAj6wMXXs
         oav+XFSB+3PPj79KnZMrB0n1YHa9m5NNACKlrZ0u+XxsDlcd+xV1xmj456i7yk5s7+2c
         nopCubNpukDkmt0zCfb3492+wmjHFh/1H5AGOtGwvwR6Btvu3uPCKx9O9WrtiA4ORiZB
         u7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916768; x=1795521568;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtpxAt2Uf4YERXke+LICDmqP5qj/rD7huDmAbU+zMVQ=;
        b=era4laaJjisBDPARB3XMH66W9HyT2ue7q7jJBnuaqwJodL1H44qy7JWOg/Nl7fPOXX
         p4NDnih6vWxYnnWmIqUPnpWWy0htylnJiK3lMymajLnGm28OgWb+xXxuCY297ZSNLxW/
         3cxf4DrRz4iWEywp//soiZIpCH5Alm6VQQKCpZWDW88qMKR6m68Cf5KOfI+hMF82KoKN
         IJxXgzzyWXwjleZdA+0zn2SPgctCne0kRNRVVjCmmFN+IwXbPgBK/7YIxOkxsuxyEymh
         z4jF+TC8gtaWMmfkhdSpWeCxILOwuoOeFPuJHPuvvtN4hN9twEEitktGNbMWrvn6APxg
         IKwA==
X-Forwarded-Encrypted: i=1; AL+hErElR1MKJwggO1iQmm1iXJ9xCfSkzj5WUkIMlnoeg1oi1/uoUdTDJVRM7tUEBiPUGfu+MMEW46/bf96Taqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNnpl+h7eUgE/ZfAj+qioambQMESXy+OSFBQRadXl/zyTg8Yc
	IeEM6nVIqGvKanCSAZdioRfgrKstzkoVFKy1p0od+msd9Re0VWyAbNIIr/o1hQ==
X-Gm-Gg: AYBFou2kj29opOfEVIi39cHZbzpC/REKewBqJyx7AziO5qtCbViX26l6gbU0m8hfkys
	6A/Bqcwj17BdL/zbOblWxxES1kCh+TpDL5dlYr95A2kPlQGkvgyY2MjFNqHegonuJ5NoNUnqBxq
	MfVrvdya7H4A+RqX/NNxnJsqq1wS3NR9XB7KLHrNk3P5zpALIFsJ+Idcyb24O8BFp682s0qQ6Wx
	BVWhnKAx2LlKJHlsOqXhwlMT/i9ZZqL/lJRqDWT+/ZNYEzCfnRLkN01ntz8LNOzRpYFt1LZA8J2
	fthu+dnSejymAFgQekQV+fekn1WzzrF6gqfTiNd7EIYc9vINP5rXr9sE71ot9UGYA9BCwCkF0Uc
	ZPUDoOW9tZLzfjZByNCRoIh4Q4rnqH0gNGUyhaRIFpDBOPF6jN4yMS8I22hEWeRGbi5uopgOMN1
	CS5ATB57qLtnquv5q/qRE3gydNxiNJfq1rbjpfmyABfckIo/KrKS1yu/VP86tlvz1OKNRkFOWcV
	6WxGyMGUGzg83tiKV56pbvAZ+EzYTMd1gaHKQizuWb6MIib5RiqIbDDky//A3cCgylrsSYXbytC
	IUiuaQ48TbEl9lE4G5XpFldZCCyJrMinxF0o0YFdmEGTRf2IzWV1WMbz
X-Received: by 2002:a17:907:3f0f:b0:c4d:31f7:28e6 with SMTP id a640c23a62f3a-c50963d9094mr1149383166b.29.1794916767964;
        Tue, 17 Nov 2026 03:59:27 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b427ddsm529863666b.43.2026.11.17.03.59.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:27 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 6/8] char: xillybus: Correct handling of wait queue
Date: Tue, 17 Nov 2026 12:59:00 +0100
Message-Id: <20261117115902.41359-7-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Don't use wait_event_interruptible() in an infinite while loop, and
replace with a non-interruptible timed-out wait instead. Use wake_up()
instead of wake_up_interruptible() to match that change.

Also, use the correct form of wait function in the disconnect method.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 49 ++++++++++++--------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index decc87f8e059..fcac39bcab4d 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -41,6 +41,7 @@ MODULE_LICENSE("GPL v2");
 
 #define XILLY_RX_TIMEOUT		(10 * HZ / 1000)
 #define XILLY_RESPONSE_TIMEOUT		(500 * HZ / 1000)
+#define XILLY_ETERNITY_TIMEOUT		(10 * HZ)
 
 #define BUF_SIZE_ORDER			4
 #define BUFNUM				8
@@ -594,11 +595,11 @@ static void wakeup_all(struct work_struct *work)
 			 * processed.
 			 */
 			chan->read_data_ok = 0;
-			wake_up_interruptible(&chan->in_fifo->waitq);
+			wake_up(&chan->in_fifo->waitq);
 		}
 
 		if (chan->out_ep)
-			wake_up_interruptible(&chan->out_ep->fifo.waitq);
+			wake_up(&chan->out_ep->fifo.waitq);
 
 		mutex_unlock(&chan->lock);
 
@@ -607,7 +608,7 @@ static void wakeup_all(struct work_struct *work)
 
 	mutex_unlock(&xdev->process_in_mutex);
 
-	wake_up_interruptible(&xdev->msg_ep->fifo.waitq);
+	wake_up(&xdev->msg_ep->fifo.waitq);
 
 	kref_put(&xdev->kref, cleanup_dev);
 }
@@ -870,7 +871,7 @@ static void try_queue_bulk_out(struct xillyusb_endpoint *ep)
 	mutex_unlock(&ep->ep_mutex);
 
 	if (do_wake)
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 }
 
 static void bulk_out_work(struct work_struct *work)
@@ -916,7 +917,7 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
 		in_fifo = READ_ONCE(chan->in_fifo);
 		if (in_fifo)
-			wake_up_interruptible(&in_fifo->waitq);
+			wake_up(&in_fifo->waitq);
 		break;
 
 	case OPCODE_REACHED_CHECKPOINT:
@@ -1016,7 +1017,7 @@ static int process_bulk_in(struct xillybuffer *xb)
 			return -EIO;
 		}
 
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 
 		dwconsume = (bytes + 3) >> 2;
 		dws -= dwconsume;
@@ -1087,18 +1088,10 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
 
 	mutex_lock(&xdev->msg_mutex);
 
-	/*
-	 * The wait queue is woken with the interruptible variant, so the
-	 * wait function matches, however returning because of an interrupt
-	 * will mess things up considerably, in particular when the caller is
-	 * the release method. And the xdev->error part prevents being stuck
-	 * forever in the event of a bizarre hardware bug: Pull the USB plug.
-	 */
-
-	while (wait_event_interruptible(fifo->waitq,
-					fifo->fill <= (fifo->size - 8) ||
-					xdev->error))
-		; /* Empty loop */
+	if (!wait_event_timeout(fifo->waitq,
+				fifo->fill <= (fifo->size - 8) ||
+				xdev->error, XILLY_ETERNITY_TIMEOUT))
+		report_io_error(xdev, -EIO);
 
 	if (xdev->error) {
 		rc = xdev->error;
@@ -1711,18 +1704,12 @@ static int xillyusb_release(struct inode *inode, struct file *filp)
 		 * If rc_read is nonzero, xdev->error indicates a global
 		 * device error. The error is reported later, so that
 		 * resources are freed.
-		 *
-		 * Looping on wait_event_interruptible() kinda breaks the idea
-		 * of being interruptible, and this should have been
-		 * wait_event(). Only it's being waken with
-		 * wake_up_interruptible() for the sake of other uses. If
-		 * there's a global device error, chan->read_data_ok is
-		 * deasserted and the wait queue is awaken, so this is covered.
 		 */
 
-		while (wait_event_interruptible(in_fifo->waitq,
-						!chan->read_data_ok))
-			; /* Empty loop */
+		if (!wait_event_timeout(in_fifo->waitq,
+					!chan->read_data_ok,
+					XILLY_ETERNITY_TIMEOUT))
+			report_io_error(xdev, -EIO);
 
 		safely_assign_in_fifo(chan, NULL);
 		fifo_mem_release(in_fifo);
@@ -2232,9 +2219,9 @@ static void xillyusb_disconnect(struct usb_interface *interface)
 	 * but somehow the message wasn't sent. Should never happen.
 	 */
 
-	rc = wait_event_interruptible_timeout(fifo->waitq,
-					      msg_ep->drained || xdev->error,
-					      XILLY_RESPONSE_TIMEOUT);
+	rc = wait_event_timeout(fifo->waitq,
+				msg_ep->drained || xdev->error,
+				XILLY_RESPONSE_TIMEOUT);
 
 	if (!rc)
 		dev_err(&interface->dev,
-- 
2.17.1

