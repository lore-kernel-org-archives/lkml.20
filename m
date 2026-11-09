Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223711;
	b=IRQhCLHrMiqFJY6gAk9sosiPUnOrou4UOA15aQyzU9N2XyUnKtcEu8N0t8PDMYR0kdKC
	 sknb/5w8/o0BCdPHM4M1Rtx7A4RyohcpKNtFItCtuqECo1bQbhN5XNW7EiAh3VGmgYSCo
	 nWFOMgxKaEYSKth2WCUGgKjoC9ZeDyDqSvSiRpdukETU+Ck0x1hQBX0FYmzucyjfDBFS8
	 NEviFfPYPp8pc/SVbcH/CVL2Y5Fp2wzGS5XtUpoS+OHMii4nQpSvUtkcLyWM/6kBWhfd5
	 X1AVnqwyeHhGCvqRRI1uCZRtfxpz6j9WFZ2VKiUR7ZSj6KE22zbMc1DPT71uA4Tq4yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=ln0y5U1jKy1IVnrY6DivBoyjZORmP31287fuX8zc1QA=;
	b=lIiIisXH9b/iTdfIRpOYzN48h8NO6EPrapfJ9wT3qi9DIEeJVtwX3dGDB5cq+SyOYzXy
	 AeccimKLISF3fvdtiLzlHUeQ66PSOjfdREtU3T79dUqD8Jrfs+faO3qT1i+87MKl9OyPs
	 Q5r4tQ5oFSkVVpvqrECiiMiIGtD2dEtuC4kgaAjYdK+NNtIwzoZJegwGhy6+MdQYNmyjV
	 sPQg2FAjF87fsd3HTdrJ1T6L89VM0vq034MbQ8WaZCeFiwcEj4dByx2A+7iD7EjSvB60s
	 stqEat2jJ3uo2Ad/pVYlLSgprsLW2L1/bBm4FB1wgJkwaK2W8u7bAJYCzaJBCf+Fa3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPlOjVRe;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D1606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80D1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPlOjVRe
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c10dc41270so594830e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223709; x=1794828509; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ln0y5U1jKy1IVnrY6DivBoyjZORmP31287fuX8zc1QA=;
        b=EPlOjVRen0BdefrZSHQUO4xGtXWHR8NLHERvaJh+4YkNZzSlu1UaFoQRydTpKC6TX6
         oKmRjxrtlP4I9lzpGXpN+i6yMzV+nWNj1sO2k5DZ9g1EReBFrTkofd4ijCUkROSY4CuJ
         Jw9oamXJMFfRrM7CEQkPtHa7jaV56vdK1JMZ6eLhRpuKMayGLmwBkt4oO4ioYvSQUVF9
         hjGjv6aJD5U1XXyz69g1igzeGdX/mPDR5/21irEYdDSz+wk4RGLcVS2zEfXJY+0QrJhF
         alBGPJ+/7+0+22x0+Ea9KNpl0j9JPXpUenfep/0dEhDlcAffNzGtP2r8jj35UyEckT9i
         Xlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223709; x=1794828509;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln0y5U1jKy1IVnrY6DivBoyjZORmP31287fuX8zc1QA=;
        b=U3Jo/c/nfhs+5sbHOgpZqYjvzqWwD0CSyzQAAp1Ix3fDGFu/CwibeXnJDik/sAdaHD
         vCt8HNyEhZ+uZMmXHQ4zm26+RX7VO0+21BBc7XgODP3ja7C1FtQ2gD8BksmuNBGf6/mH
         2h9e8JDp+5HAznKyemgWelnLrGk3P6KgPixgijFqUgiFmjDpoIuVQRZiDJmtXH7Vu4Aw
         zOza++A1DJisCTtOiYNhg5Jrb5hg0O8qyEzcaQmcCSW4hytLpj/lBllZotjRh+MXw3kb
         vQZGXJa5ss4mzhR3Rs+0P89h052sU3z52jCEPmlXzl/OIiRaRw20eU1iprWPbkM7i4+h
         BXwQ==
X-Forwarded-Encrypted: i=1; AL+hErEcrqHY02tkiVpMXEYx5dxM+vYioN+zT5tg4KFr/YDuDJrD1PDZ61zWe/0qrfJMjTn7shlxXQPVuQ5Liuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xFlEaYMWa9y9pPgtW4qmZd27IZtg0U7Tv0pFeDzgTxri6TPC4
	WHnYopOU2Wqd83cFojaNUCaSTxAJyVwJBAdx08xIfYn5D5crROS2vP8F
X-Gm-Gg: AYBFou3jwW8XyuP/+CbsH2oPm0cuGZfggk1OHNArpxtDCPv+rBSI3cMrgnwMsinRTgq
	12/amwwrTTaFmFm5Uxuq4Q+bJSR9n6ld8V7OIDKH2b5PRI7XS3MvTMVeRV9gWqj0FQZY/UO4gjA
	yDNjBW3Y1mH0kSUS7JCONd2Lm2XS6y6rAfwu3BwtJ2QgNLp3xLCo8aJvMlBwhvHpJva38aU8pm+
	MrbwAOtXtbhlloSjp8muGO9Zfjs3fwnSpWKre8/cXBAgjpPPn2fxscTzEi3Dd28h2d9/NBtjCnt
	cQqy4MbUcdeH/PpJv8KqxFRrIBBv6PlFFpEAkXzoSsRX7E3DDWnQKspKzQynjPI3zNblu8LKu69
	7aT3QzjMjzryrW4EsAAEeGIVXrtzb9ajeOnyxbkdEzhja4MePCXXwDo7F/JvwYQYIxrCxspdFzv
	wyfbOC5aViMsSwv0JPwGdByQqEeMnjXXnN8qsknwERP8Kz+NhSC89ISndOlPCaMU2LZKM02wg4w
	ITA59KRPvDFz81uPkO6Td8Gb8DfImfF8uKUklCk1biiKCnbpi9oUveb1r861yfNuh+AYBbit8rb
	FbVtywiqPnEkRvg24o3Xggn+ae6JpiEXgzIM4bT0ttYOFQs/jI12NcqKE6I8zJ2KhLR2pqJVOrb
	XzQ==
X-Received: by 2002:a05:6512:238f:b0:5ba:3fbc:272d with SMTP id 2adb3069b0e04-5c14c02a03emr1076390e87.33.1794223708878;
        Mon, 09 Nov 2026 03:28:28 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b8280c6sm780433e87.81.2026.11.09.03.28.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:27 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 6/8] char: xillybus: Correct handling of wait queue
Date: Mon,  9 Nov 2026 12:27:58 +0100
Message-Id: <20261109112800.48663-7-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
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

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 49 ++++++++++++--------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 3afd9bd38a1a..09c7b0ecab59 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -40,6 +40,7 @@ MODULE_LICENSE("GPL v2");
 
 #define XILLY_RX_TIMEOUT		(10 * HZ / 1000)
 #define XILLY_RESPONSE_TIMEOUT		(500 * HZ / 1000)
+#define XILLY_ETERNITY_TIMEOUT		(10 * HZ)
 
 #define BUF_SIZE_ORDER			4
 #define BUFNUM				8
@@ -596,11 +597,11 @@ static void wakeup_all(struct work_struct *work)
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
 
@@ -609,7 +610,7 @@ static void wakeup_all(struct work_struct *work)
 
 	mutex_unlock(&xdev->process_in_mutex);
 
-	wake_up_interruptible(&xdev->msg_ep->fifo.waitq);
+	wake_up(&xdev->msg_ep->fifo.waitq);
 
 	kref_put(&xdev->kref, cleanup_dev);
 }
@@ -872,7 +873,7 @@ static void try_queue_bulk_out(struct xillyusb_endpoint *ep)
 	mutex_unlock(&ep->ep_mutex);
 
 	if (do_wake)
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 }
 
 static void bulk_out_work(struct work_struct *work)
@@ -918,7 +919,7 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
 		in_fifo = READ_ONCE(chan->in_fifo);
 		if (in_fifo)
-			wake_up_interruptible(&in_fifo->waitq);
+			wake_up(&in_fifo->waitq);
 		break;
 
 	case OPCODE_REACHED_CHECKPOINT:
@@ -1018,7 +1019,7 @@ static int process_bulk_in(struct xillybuffer *xb)
 			return -EIO;
 		}
 
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 
 		dwconsume = (bytes + 3) >> 2;
 		dws -= dwconsume;
@@ -1089,18 +1090,10 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
 
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
@@ -1719,18 +1712,12 @@ static int xillyusb_release(struct inode *inode, struct file *filp)
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
@@ -2240,9 +2227,9 @@ static void xillyusb_disconnect(struct usb_interface *interface)
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

