Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223708;
	b=hDh7HhaOVHLjOLi0PrIJkn3C1Q+ejUoARzK/EISXRgZF0bfUKMdpZmpKuUOXCDf9jGo9
	 yJG2+tcbLxyKspKJgoi11lcWs+vyTeSAplIxImRUogMx+9+VoA1OGWG6DJMOGMO3Om/v0
	 zsHbJei8T0q7sYKVabrOvLd7OYJ47NA0zM/JM1m+yrSvvMhfoGX3iZsL6D3x7CNbxG8f4
	 4r7Pt/TqZOShTNpQvXJlTbN1n5TxqULxwl0CHT0UPkTbSSgNrC3wDUfX7Q5FT1oJ5VUr+
	 gK112rGF6tt8Hs9TrQCc6kC2Fc0YtufMdWxpVG3P7QPgXJmMeUdVhU7klmzeAj2g+ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=jLCvOPUWajhThgaPDP1pombl5VcBQ+A9YkbtJC1lMWo=;
	b=jzAtbOBvQ5UTgZWKBg1VK7FfZD8OvL6N5yDGS/W8m5XZIAlvIHlpU7k5SgVqDorB9xeU
	 OGCWn/3O5wEcraWLh4FMC6jPXybw5jZtF6oI7K619CV8q9tAoGgSXn/FUXDkUItN6x16I
	 J43daC7UFqYSu77mX375jwbhe6t2JO+NlnqOS9nKDQiXCTlHjRI1ao6U1lkadx9KCvxQu
	 FZZ45KuTVhVLImY3FAUdXLu2xaaKSJh3Fr1OnkIfvMvvJIuK3EVYJPVG5pd/vJtXrCztg
	 VsPbFqFanPUvDLw0eVUGs2pwBR3MEpGjHQ87S/Of0jpQ5QnlEEA+Qg09KS28La4PnfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tETUzaEG;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9511E606EE8A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9511E606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tETUzaEG
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c126f80426so494670e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223706; x=1794828506; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jLCvOPUWajhThgaPDP1pombl5VcBQ+A9YkbtJC1lMWo=;
        b=tETUzaEG3mj7rTFlgpwUHl1jhUfjwqJvpSAR9Wa5irmw/PoC/Olz2rY791nQ7uevDB
         cIGnzQUJPLfc2UocILVTM1wBPWNLit28jL2pTohyt1H2fdpJ3rFFTdUTAC/0r9ngz0/F
         gLFRpiGoOM5voh+sJhTJW+Uu85ZSY8wW0Y5vQ6ph6efwXSCLswMcOqALpWSxTojOtr4h
         j1Wg9XMxt4al4j66JRNWiZsmO2fnEcIklSy1CIuQ3f+MQPO2GqBX3LRbpK9M60S3VGID
         5bjO0hrvCXwh4pa+kXYtD08ugCVfo/RbeF3SOKkR91ku6eDeTfNwhOFRjNTDo+evuwZz
         1jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223706; x=1794828506;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLCvOPUWajhThgaPDP1pombl5VcBQ+A9YkbtJC1lMWo=;
        b=lDUgRucTCHGL9aAN0M5P7HrGhBqlDZSEi1HYEJtWjpQcSJggQgH8TI767YuRXTSb95
         rhltRe8mBySUgrAPzN6MZcNqfkIHPQ9/+FF42L40qwXimI5N3mgUd2TOuLTq9fMoTn7C
         0yxg+EpHerhrUbovb0eU9OayHfH/jTBefejMKoeqkY9Y1TZipRPiyV7nqrQwqleBQL/v
         JKw5lQSbgNASgYs+j253pZM1qCBpGKylD+yCnTCYR5ffMH+htOltBqzthSQ+LUsSX+Nx
         JxWPXVWqsOueUOYNMKF8tWaq7b0z9cFEjc+fWFKq5xS6NvQvAkgB78hm1GBYmCU6huAa
         9lhA==
X-Forwarded-Encrypted: i=1; AL+hErEhPcUK83WhXUbWsmFsZDAug2f3iuOCmPLRq2iitCpzxtT34LGcoxX9vlH8CUwK94lTE8W1c3VrRmr2qiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vrV69gc+1ulDu1CbetaFyv276M8sy9/jjsgXWJoxXtp71zZru
	4P2/bDhjgxvXLWPkx653p6yPnEK5x8Kw8+DNNN3rp8HwljAk73n+5IDtK9gTPw==
X-Gm-Gg: AYBFou1q1+36DcDz4uBdGxCtCu8/EoPra+qz7uyU4+jubnlkC3dZdAN8mdVlxStNhh8
	cUIoFTW2c06GlNYMha7bDtENJwD9qiyYpjY3wveS95jSJMbUrTfcYeEtMzIlVpiNSB8aHbBDOGd
	KPm4EPf4VzXeN0y048CWp3IRaqvb3IQukfL7RCyD30II2n5nYre0wXKt4/scVF8Z3wYWqZP8PkR
	KRM7tzLYN1HtP+rA2xg6tvtO3RrS+cEFbLUZtfOgI4cQl5jkuiaEIp0mBlCdK+GrnPwiUQEAA/y
	Om53SQCVxqimrYAQaCcWw1b8d5bwMf0zwwfWqt8/T+Uj43lcAjEAobTpEkRGJ37g2goHpH2TKv1
	nxcb2KGFh/GmPwJmksYa5tA0x24UfChROZrC54tEALbMaYYMtjSOE6YmuyozGkHLb3pjpBb01m5
	yeA32o7IEcPta9N2aIFJ55XlyA2T7kHt9igzTJGySOtVd8qTYMNQYwRwmP1fXlGq1id17QZUpTt
	BAcRelOolLLTyV3MK2ayWOgs9D0g06MSagqqgaxNrQHC+/y2aX9KTTZX7dcXnJ8uc/xn0hupYxc
	WbccsrRxxLIc3+9kO9CW4SJ208UyWoKwun9tSYi1sRH1XR+wm0SBr55RCQ==
X-Received: by 2002:a05:6512:1288:b0:5bf:9f5e:a1f0 with SMTP id 2adb3069b0e04-5c14c02f98fmr1142664e87.63.1794223705612;
        Mon, 09 Nov 2026 03:28:25 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc4d7sm789737e87.15.2026.11.09.03.28.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:25 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 5/8] char: xillybus: Refactor flush function
Date: Mon,  9 Nov 2026 12:27:57 +0100
Message-Id: <20261109112800.48663-6-eli.billauer@gmail.com>
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

Previous flush_downstream() looped on wait_event_interruptible() and
wait_event_interruptible_timeout() without returning if an interrupt
occurred. Replace these with non-interruptible counterparts and use
wake_up() instead of wake_up_interruptible() on the relevant wait queue.

In addition, flush_downstream()'s @interruptible argument is removed.
Instead, this function either waits with a timeout only, or with an
interruptible wait. This is what the callers of this function requested
anyhow.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 89 +++++++++++++++-----------------
 1 file changed, 41 insertions(+), 48 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 73e26f254693..3afd9bd38a1a 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -604,7 +604,7 @@ static void wakeup_all(struct work_struct *work)
 
 		mutex_unlock(&chan->lock);
 
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 	}
 
 	mutex_unlock(&xdev->process_in_mutex);
@@ -923,12 +923,12 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
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
@@ -1130,11 +1130,13 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
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
@@ -1159,21 +1161,22 @@ static int flush_downstream(struct xillyusb_channel *chan,
 			return rc; /* Only real error, never -EINTR */
 
 		/* Ignoring interrupts. Cancellation must be handled */
-		while (!chan->canceled) {
-			left_to_sleep = cancel_deadline - jiffies;
+		left_to_sleep = cancel_deadline - jiffies;
 
-			if (left_to_sleep <= 0) {
-				report_io_error(xdev, -EIO);
-				return -EIO;
-			}
+		rc = 0;
 
-			rc = wait_event_interruptible_timeout(chan->flushq,
-							      chan->canceled ||
-							      xdev->error,
-							      left_to_sleep);
+		if (left_to_sleep > 0)
+			rc = wait_event_timeout(chan->flushq,
+						chan->canceled ||
+						xdev->error,
+						left_to_sleep);
+
+		if (xdev->error)
+			return xdev->error;
 
-			if (xdev->error)
-				return xdev->error;
+		if (!rc) {
+			report_io_error(xdev, -EIO);
+			return -EIO;
 		}
 	}
 
@@ -1194,40 +1197,30 @@ static int flush_downstream(struct xillyusb_channel *chan,
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
+	if (timeout) {
+		left_to_sleep = deadline - jiffies;
 
-		goto done;
-	}
+		rc = 0;
 
-	while (chan->flushing) {
-		left_to_sleep = deadline - jiffies;
+		if (left_to_sleep > 0)
+			rc = wait_event_timeout(chan->flushq,
+						!chan->flushing ||
+						xdev->error,
+						left_to_sleep);
 
-		if (left_to_sleep <= 0)
+		if (!rc)
 			return -ETIMEDOUT;
+	} else {
+		rc = wait_event_interruptible(chan->flushq,
+					      !chan->flushing || xdev->error);
+	}
 
-		rc = wait_event_interruptible_timeout(chan->flushq,
-						      !chan->flushing ||
-						      xdev->error,
-						      left_to_sleep);
-
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
@@ -1335,7 +1328,7 @@ static int xillyusb_open(struct inode *inode, struct file *filp)
 		 * This can't go wrong unless there's a serious hardware error
 		 * (or the computer is stuck for 500 ms?)
 		 */
-		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT, false);
+		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT);
 
 		if (rc == -ETIMEDOUT) {
 			rc = -EIO;
@@ -1629,7 +1622,7 @@ static int xillyusb_flush(struct file *filp, fl_owner_t id)
 	 * the user pressed CTRL-C, that interrupt will still be in flight by
 	 * the time we reach here, and the opportunity to flush is lost.
 	 */
-	rc = flush_downstream(chan, HZ, false);
+	rc = flush_downstream(chan, HZ);
 
 	mutex_unlock(&chan->out_mutex);
 
@@ -1699,7 +1692,7 @@ static ssize_t xillyusb_write(struct file *filp, const char __user *userbuf,
 	}
 
 	if (chan->out_synchronous) {
-		int flush_rc = flush_downstream(chan, 0, true);
+		int flush_rc = flush_downstream(chan, 0);
 
 		if (flush_rc && !rc)
 			rc = flush_rc;
@@ -1836,7 +1829,7 @@ static loff_t xillyusb_llseek(struct file *filp, loff_t offset, int whence)
 
 	if (chan->writable) {
 		chan->flushed = 0;
-		rc = flush_downstream(chan, HZ, false);
+		rc = flush_downstream(chan, HZ);
 	}
 
 end:
-- 
2.17.1

