Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916768;
	b=L6V3bhTr8nCOD4n5NrmrucXqrnsA9sf685lJyRh+xzarjJ0xhBerHwi7Hck1o9466WBS
	 oYpMqtPec9dteKV5jAak/Ie3FY02mcDq+gnUdy55NFpjWRCQQIPPyFoLUdKpdskpfm80J
	 N5kU99R4+OE3onbUpRCi8xQ4b5awfTmhCvInOqer3IKh7NdI3LRSJtoRBqk9UYPdFqh+k
	 ikiRBUIdbXwVR0BqzKGGwAUuvKu5YU/HzKNf5fj0swjP4s1QZGy0U+S/n9RxPCy2OXH2B
	 0PoDvCLmr+iY/4oAama+jPEhw79hJYSw0ICynKSCm3G6djgG3sld736IOJvweRPCaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=d2C4wDUiGx2LoyTa/1g2kDNfLHE/CABeVD9ZXdUPYQ0=;
	b=Ik8k5ZVz29nwKZmqeSkNsnL9zU/f6uRKcFUy5MckJKq7XrVWT0v/gPr8Fg1cvA988iqy
	 yawtCpE+qono9iaso+x99qLL8Jdq13Pyf/Cq0GyA5xjDEKpMKH0UTowmpRBREID/S+7yR
	 NqyzHh9YyLYFqZUZrKvCkb+uBd/q1d0ZPvDb6HrQTkzV2a9S3YEIHKJlZcDpM4LmhkUaQ
	 cZJU1jgme5xsLhbRKyxUwNKlnhYVR+nVqTJw19saqSrmGxMwhTpZE7bk6ul2zyDDakxy5
	 omKX3uKvMoirkIDOP24Q4hl64voaqRmMqWoD7wCBFxepASLyibSKGwtjcTBxQMeilmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vlmRyna/";
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE26606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE26606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlmRyna/
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso5984539a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916766; x=1795521566; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d2C4wDUiGx2LoyTa/1g2kDNfLHE/CABeVD9ZXdUPYQ0=;
        b=vlmRyna/PYnRWyiCPPKuXgqnv72bD6/21jSyzsaTvlfEV1coP8Sji92h7ZywG22bh6
         86gzI7mBD2b/Cz/Q9XNURtBrzLOVG97gzoZDargiXrg0zGN5paXXplRKS2qqvAvwi13p
         iIzeX2POxGv2Ra7MYAMQIKis8TXrriyzc6ZqyOhg7Ettt1DCYTaYoy+D1oMCxsDB8+Wo
         fmrPxk9rTkZeVZJkt1ZLz57cRm+VTX70LkBPkzEL1FSpUi4Xk0GQr8t+O9SJwJro4eVX
         X260xrDR3j34ztVFV89wUqZTDhS4hrTSNFq8OEkYR1Su/TaYuTnpAfG/AUgBC29Y9Mh8
         RBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916766; x=1795521566;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2C4wDUiGx2LoyTa/1g2kDNfLHE/CABeVD9ZXdUPYQ0=;
        b=JC1c4ek2pv7emhtQPODlHqMkjfb28E3+swKGSxjU075h7MTpjnEG3kXT3pfOWM/PiS
         27CiC18qkeTfSimzV8QnkAnhzd3CcOGkqwDrZn0YQqe3cPEr+5fOmLidozqo+45dOPmf
         pya01MZPZMfDB1PXkSgSDgzWfjpEFs4dIG6iwmSFAvljybpvH/qSRYZAdr+S4gubG5ZM
         QV+wFT/waiqy7Rup43hiyGq0eggKh+FhV9DktQhJHr2j+a7rctpHKEqkC01rbnvXrFTl
         +dtlGIPn/rFOnOlBwt3qKENbz0Z8aCs23SHLgn2YbQeNMbsLPS+0aBI51S7AsXAHnaNJ
         Fjjg==
X-Forwarded-Encrypted: i=1; AL+hErE1nXvv+KK13N81r40D32RC1zbQAuBxqmYIvbtjb57NCi2oAVyJaTtlBW4wChzosMUrbitDWC39pR5dM/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D0JfhwQcgwV3JMPj+s/dJoH1dAK9pj/1/p97nZGXwMmjJ+fN0
	iJgFV28bwURVw9UzCu0pRhjxALw2aCwvzTbBhDWLsUDRMGNOiMkLcAovkUk3Ew==
X-Gm-Gg: AYBFou1W8oOtUz+pFg7oNX8sd3JJWG5gk8bDWJNwLxU++x8/WGI0icU8eP9juGn6plk
	JYv/v/ug6uUin/5OsFIa6EKCqe2vy+UdjreZDz8GX5b1Gd4rNz7R18U0PGKHaEZEUPNZPLaxCrc
	WxWGFRx3ztEf3ptjI/A/jeBu4QLU75t2C18OlRiJS2ARGKL811w3jurPMtzW+Th2AaARKiTCdQp
	xgPhUtbZrDJNB17glXLqtRVG4s0QJgH3lSEHgZ7CzAvgg+70zpypQa+XGG8AeBa5LNZPAzzj5b8
	9IqQ7zaRy55n2UhVYoUkn6x/3pn6jjjwg5nEFmKhkhCgi7RR67Jyn4suv0Ay2S481drMUvIe7NU
	Q6vSPfuVeoWK8C1KjIdTRxItRwbbRrl/dhl2Me4H2SvS5rqgaSUUjZXUIQDFEWD4diBFRXo6ZOL
	weF/04I7Elnb298eE0R0at3d/gwSyXbv1PlmaVW8R9moK7n9OAWbU4NSKUvCkIipa3tHtQ7/j4z
	5unKhXrJmaYf+ctzeF50d0IXMstIJnwywYeHAhJE8uZDsl7ODXcom4o5mQAVu6sw62Et12VhP2J
	shIQcrsAjWOtk/fgWz90q15rH/eUGhZRW1/Gkz+SPkG67TeNe+VhMTh1
X-Received: by 2002:a05:6402:4504:b0:6b4:1629:b1aa with SMTP id 4fb4d7f45d1cf-6b7c0890b5dmr11332359a12.2.1794916766491;
        Tue, 17 Nov 2026 03:59:26 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm5744241a12.6.2026.11.17.03.59.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:26 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 5/8] char: xillybus: Refactor flush function
Date: Tue, 17 Nov 2026 12:58:59 +0100
Message-Id: <20261117115902.41359-6-eli.billauer@gmail.com>
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

Previous flush_downstream() looped on wait_event_interruptible() and
wait_event_interruptible_timeout() without returning if an interrupt
occurred. Replace these with non-interruptible counterparts and use
wake_up() instead of wake_up_interruptible() on the relevant wait queue.

In addition, flush_downstream()'s @interruptible argument is removed.
Instead, this function either waits with a timeout only, or with an
interruptible wait. This is what the callers of this function requested
anyhow.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Link: https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Always call wait_event_timeout(), with a timeout of max(1L,
      left_to_sleep), so that the wait condition is checked even when the
      deadline has already passed. This addresses Sashiko's comment about
      a missing condition check in flush_downstream().
    - Added include of <linux/minmax.h> for max().
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 86 ++++++++++++++------------------
 1 file changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index f9c8591a679f..decc87f8e059 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/list.h>
 #include <linux/device.h>
@@ -601,7 +602,7 @@ static void wakeup_all(struct work_struct *work)
 
 		mutex_unlock(&chan->lock);
 
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 	}
 
 	mutex_unlock(&xdev->process_in_mutex);
@@ -920,12 +921,12 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
 	case OPCODE_REACHED_CHECKPOINT:
 		chan->flushing = 0;
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 		break;
 
 	case OPCODE_CANCELED_CHECKPOINT:
 		chan->canceled = 1;
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 		break;
 
 	default:
@@ -1127,11 +1128,13 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
  * chan->flushed is there to avoid multiple flushes at the same position,
  * in particular as a result of programs that close the file descriptor
  * e.g. after a dup2() for redirection.
+ *
+ * If timeout == 0, no timeout is applied and the wait is interruptible,
+ * otherwise a timeout is applied but the wait is non-interruptible.
  */
 
 static int flush_downstream(struct xillyusb_channel *chan,
-			    unsigned long timeout,
-			    bool interruptible)
+			    unsigned long timeout)
 {
 	struct xillyusb_dev *xdev = chan->xdev;
 	int chan_num = chan->chan_idx << 1;
@@ -1156,21 +1159,19 @@ static int flush_downstream(struct xillyusb_channel *chan,
 			return rc; /* Only real error, never -EINTR */
 
 		/* Ignoring interrupts. Cancellation must be handled */
-		while (!chan->canceled) {
-			left_to_sleep = cancel_deadline - jiffies;
+		left_to_sleep = cancel_deadline - jiffies;
 
-			if (left_to_sleep <= 0) {
-				report_io_error(xdev, -EIO);
-				return -EIO;
-			}
+		rc = wait_event_timeout(chan->flushq,
+					chan->canceled ||
+					xdev->error,
+					max(1L, left_to_sleep));
 
-			rc = wait_event_interruptible_timeout(chan->flushq,
-							      chan->canceled ||
-							      xdev->error,
-							      left_to_sleep);
+		if (xdev->error)
+			return xdev->error;
 
-			if (xdev->error)
-				return xdev->error;
+		if (!rc) {
+			report_io_error(xdev, -EIO);
+			return -EIO;
 		}
 	}
 
@@ -1191,40 +1192,27 @@ static int flush_downstream(struct xillyusb_channel *chan,
 	if (rc)
 		return rc; /* Only real error, never -EINTR */
 
-	if (!timeout) {
-		while (chan->flushing) {
-			rc = wait_event_interruptible(chan->flushq,
-						      !chan->flushing ||
-						      xdev->error);
-			if (xdev->error)
-				return xdev->error;
-
-			if (interruptible && rc)
-				return -EINTR;
-		}
-
-		goto done;
-	}
-
-	while (chan->flushing) {
+	if (timeout) {
 		left_to_sleep = deadline - jiffies;
 
-		if (left_to_sleep <= 0)
-			return -ETIMEDOUT;
+		rc = wait_event_timeout(chan->flushq,
+					!chan->flushing ||
+					xdev->error,
+					max(1L, left_to_sleep));
 
-		rc = wait_event_interruptible_timeout(chan->flushq,
-						      !chan->flushing ||
-						      xdev->error,
-						      left_to_sleep);
+		if (!rc)
+			return -ETIMEDOUT;
+	} else {
+		rc = wait_event_interruptible(chan->flushq,
+					      !chan->flushing || xdev->error);
+	}
 
-		if (xdev->error)
-			return xdev->error;
+	if (xdev->error)
+		return xdev->error;
 
-		if (interruptible && rc < 0)
-			return -EINTR;
-	}
+	if (rc < 0)
+		return -EINTR;
 
-done:
 	chan->flushed = 1;
 	return 0;
 }
@@ -1332,7 +1320,7 @@ static int xillyusb_open(struct inode *inode, struct file *filp)
 		 * This can't go wrong unless there's a serious hardware error
 		 * (or the computer is stuck for 500 ms?)
 		 */
-		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT, false);
+		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT);
 
 		if (rc == -ETIMEDOUT) {
 			rc = -EIO;
@@ -1626,7 +1614,7 @@ static int xillyusb_flush(struct file *filp, fl_owner_t id)
 	 * the user pressed CTRL-C, that interrupt will still be in flight by
 	 * the time we reach here, and the opportunity to flush is lost.
 	 */
-	rc = flush_downstream(chan, HZ, false);
+	rc = flush_downstream(chan, HZ);
 
 	mutex_unlock(&chan->out_mutex);
 
@@ -1696,7 +1684,7 @@ static ssize_t xillyusb_write(struct file *filp, const char __user *userbuf,
 	}
 
 	if (chan->out_synchronous) {
-		int flush_rc = flush_downstream(chan, 0, true);
+		int flush_rc = flush_downstream(chan, 0);
 
 		if (flush_rc && !rc)
 			rc = flush_rc;
@@ -1833,7 +1821,7 @@ static loff_t xillyusb_llseek(struct file *filp, loff_t offset, int whence)
 
 	if (chan->writable) {
 		chan->flushed = 0;
-		rc = flush_downstream(chan, HZ, false);
+		rc = flush_downstream(chan, HZ);
 	}
 
 end:
-- 
2.17.1

