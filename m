Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916771;
	b=EtORNJOVtPYsyzl3nyNKCXO7Xz/IWHuKDlmYY9AOKDL089OFRt2u+5jqUXSX3Viagzsp
	 4PktiXMxFxQrqLtOUQT05ilKQVl3K68LN+4xD+rem4VhtNsXuEKgl4WUEYzOZuRcqVvPs
	 ZQuTl0ZJdtx3fS5rcuBFPD87s3ByHY5LmtBjsX98UoyAswmk8vkCwkvN1I9fYM+SqmyP2
	 yb+Z9cL/WZhNc2BJryv+NS0xpkBfGI2nxrlfSy9RQWEBVumDSqWsRP9REseGt3FxwhaMZ
	 smk/v4ysr6M5RnMJBq7Ax9Jn1XLx9NvQssQR+Sk+RhfvhUoIT7zEKKPUapB0rF5zv7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=YaIvGQkAIrW4yqQDgTgKqvFDE3F3JRi/gvIaXCz7nT0=;
	b=ZgymXABd/FhsaGnkRaCI/G6aOau5Ai+FLNj4qkmImx4/2TLuv66kZ4O6iU60WnngCc8B
	 wLN4OUzJ517dvU88kM0iFEEsOgKiV/EXR7E8nQRee+4cdpNFfYQJ4M2neQJgkHcVIffhT
	 UrtxkwS88N7bfG+m8JbrP4yGdGqwbCOwdu8heNS0HpfMOurlWvR7idk+4oAX5E7+DrSFa
	 Amvvfh5Ek/r/Potnv03zaJRiJHraxWGKYqWcrCxzkY4y3NoGSgHHgXAFKpJvG0PmIHk+M
	 Oaq4bbOg6NKL5WxnIBEilCcuWhgvU8ea3ksVDwY0ris8G4SA80o9Mft1z9sdvYpR4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wqy+nGK6;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39B606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC39B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wqy+nGK6
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50715c2757so593289466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916769; x=1795521569; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YaIvGQkAIrW4yqQDgTgKqvFDE3F3JRi/gvIaXCz7nT0=;
        b=Wqy+nGK6Nsryz0UEh5sW4L9Vjvx/NjwDSU26Kv1vPvjKWIQt094BdB3QxoNI9ABj9Z
         oMLMefR9z/MnHHdTwzx7uCPVXbwAFv/bGlxPJNSVdlDzKNbAoWBMfbzFN1vYpiluF1JQ
         L/baAIvd0c7LuQa3sUDmuhnGK4Qqo8qOeMz6Xd3ptDqX+sgngbgH8TwaOvMzZ8e8kXxQ
         NkXLXvCSmrF1JE1FLOzLFmtwwtzIA3JZphaG8UHNyOsR5ujNAiQcUZwIN4G9O7uhhqrH
         HqgawkJY7S52hJZi1Xbu5MdcTe1o1Lm1jhyVld1bKxJEEHjd1Kqsk7KwTHav2Q3Be10e
         Y27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916769; x=1795521569;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaIvGQkAIrW4yqQDgTgKqvFDE3F3JRi/gvIaXCz7nT0=;
        b=fMBOtxzVROETEw87pD399M/oFbZpWJv+PpQ82TNjA/RuOHhGrEBGcuorhJAtJqvhr9
         oR9yww7CKLrioLlRsC6QAJGCsqzKGRuqG3UXY1G3JyNfTBY3e77+hrD1Qwmkhy/E8zEP
         KOwpMBjxSXlKtSbzwRDlj7HhVksHGe7QRPpiikIW+fW0rDSoMO4cZ3qH651u4z47bwSk
         qffQ/T/agJD+WxjhA/kbD/QinLOLWiLJrdCXrM0dh7oZbdl2XD5SwWOkrbV9cl7BJwE5
         6OnPLEgMoGWsj0pW28NloUvtiB4Tia941oxT61vdgGLcHzrgPJagtsAs+ZApTOk8Yxpc
         G/ag==
X-Forwarded-Encrypted: i=1; AL+hErFUwKpTf0Fu65x4CVoBaEmBd0+6c5kVZVJP3ytBLFDhQ/xzttArhWrkfG1+FR9+mHA4pgvk+k4ksrAixM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DbL1YDTvfOVkE6C8u+fQ9UYhQ6eM6MD3a/0+uMNZI+nQcpUTn
	iBi14ovAhcy0Y9jUjgF/uvw9GNc+myODUoUPunen8Uwwe2wYQ/hS+DPWhqn1tg==
X-Gm-Gg: AYBFou3hVgEK8TGRqT/CUGxQTOU+V7EVXh7dhzC55bjuCIFst8MSW+TBWFLk01y5NFm
	YGzensM0UGcIwDpr4rVcWhE8inA7gz9m5c7xVmlbUtIGV/ljmQY18Ip3Hi8y5NNAFPkvmhH7rne
	QGYuf9dvdozgs/EOy4HJQ5GBMDjyfvS/HrKE4aGEhHY36p9pYiyKpRvo/Xh2/QAhhcvXsUtQFXa
	ZxEjBNNnR1NLr18tNyCZRjW/+8+blf809AdcWT+cNYA0FbMDeNsahvf57mFzKI7OWyZRc+L6GUT
	zysw68JpyQnp68PfuhanjsAwVZdTRp5x5B2MB3ZdIE8hOYreNXAfsrGP5H9EWDdlMvWpu9Jxd8/
	k2JThGl+8z1Nv1FIkFA+cHA6LRnafJx7X1Alj1kifjIVhXtk3pjehKzCgdqnLEtEv99lW8H2BVv
	x+VGuURwOjks9S6mYdrR06uGFGgY5SO+B5b3bowsujgc4gO+yi+cagO4tjnsiRSuDdRrtHvfSsO
	Uq/AZKNob9ZK6yuqKkILyijmdFfx3qinnxrznNEtnvGBHgXfHWxGXllqim0d950s8cB2fKzhn4S
	/OfJUkTZQAnAsOtDRVB4UjSNDCVSQcjxWry7Zbbi2sFcCVcoY/BqhwOM
X-Received: by 2002:a17:907:72cb:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c509640727cmr1065363966b.47.1794916769043;
        Tue, 17 Nov 2026 03:59:29 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm165706866b.35.2026.11.17.03.59.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:28 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 7/8] char: xillybus: Avoid indefinite sleep of work item
Date: Tue, 17 Nov 2026 12:59:01 +0100
Message-Id: <20261117115902.41359-8-eli.billauer@gmail.com>
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

xillybus_write() may sleep indefinitely with rd_mutex taken while
waiting for a DMA buffer to become available for writing. As the work
item implementing automatic flush also takes this mutex, it may sleep
indefinitely as well.

Thanks to the Concurrency Managed Workqueue (cmwq), there has been no
visible problem with work items sleeping forever, but this shouldn't be
allowed by design.

This commit makes the autoflush work item return immediately if
xillybus_write() is invoked in parallel, and record that fact with the
help of a new struct member, autoflush_skipped. This way, the work item
doesn't attempt to take rd_mutex, avoiding sleeping indefinitely.
When an autoflush has been skipped this way, xillybus_write() compensates
for this with a direct call to xillybus_myflush().

Fixes: 48bae0507410 ("staging: New driver: Xillybus generic interface for FPGA")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillybus.h      |  3 +
 drivers/char/xillybus/xillybus_core.c | 88 +++++++++++++++++++++------
 2 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/drivers/char/xillybus/xillybus.h b/drivers/char/xillybus/xillybus.h
index 98c7ac4dd1f9..cd3cde833ce3 100644
--- a/drivers/char/xillybus/xillybus.h
+++ b/drivers/char/xillybus/xillybus.h
@@ -77,6 +77,9 @@ struct xilly_channel {
 	int rd_full;
 	spinlock_t rd_spinlock;
 	struct mutex rd_mutex;
+	struct mutex autoflush_mutex;
+	int dont_autoflush;
+	bool autoflush_skipped;
 	wait_queue_head_t rd_wait;
 	int rd_ref_count;
 	int rd_allow_partial;
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 7189c6d97e7d..ab8ac78b28dc 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -84,10 +84,11 @@ static struct workqueue_struct *xillybus_wq;
  * Blocking on the wait queues is allowed with mutexes held, but not with
  * spinlocks.
  *
- * Only interruptible blocking is allowed on mutexes and wait queues.
+ * Only interruptible blocking is allowed on mutexes and wait queues,
+ * except for autoflush_mutex.
  *
  * All in all, the locking order goes (with skips allowed, of course):
- * wr_mutex -> rd_mutex -> register_mutex ->
+ * autoflush_mutex -> wr_mutex -> rd_mutex -> register_mutex ->
  * allow_isr_lock -> wr_spinlock -> rd_spinlock
  */
 
@@ -522,6 +523,9 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 		spin_lock_init(&channel->rd_spinlock);
 		mutex_init(&channel->wr_mutex);
 		mutex_init(&channel->rd_mutex);
+		mutex_init(&channel->autoflush_mutex);
+		channel->dont_autoflush = 0;
+		channel->autoflush_skipped = false;
 		init_waitqueue_head(&channel->rd_wait);
 		init_waitqueue_head(&channel->wr_wait);
 		init_waitqueue_head(&channel->wr_ready_wait);
@@ -1194,7 +1198,10 @@ static int xillybus_myflush(struct xilly_channel *channel, long timeout)
 		/*
 		 * Indefinite sleep with mutex taken. With data waiting for
 		 * flushing user should not be surprised if open() for write
-		 * sleeps.
+		 * sleeps. Note that timeout == 0 is used only with
+		 * synchronous channels (with rd_synchronous true), and
+		 * the autoflush work item is never queued for such, so
+		 * no risk of work item sleeping indefinitely.
 		 */
 		if (timeout == 0)
 			wait_event_interruptible(channel->rd_wait,
@@ -1241,6 +1248,13 @@ static void xillybus_autoflush(struct work_struct *work)
 		workitem, struct xilly_channel, rd_workitem);
 	int rc;
 
+	guard(mutex)(&channel->autoflush_mutex);
+
+	if (channel->dont_autoflush) {
+		channel->autoflush_skipped = true;
+		return;
+	}
+
 	rc = xillybus_myflush(channel, -1);
 	if (rc == -EINTR)
 		dev_warn(channel->endpoint->dev,
@@ -1250,8 +1264,8 @@ static void xillybus_autoflush(struct work_struct *work)
 			"Autoflush failed under weird circumstances.\n");
 }
 
-static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
-			      size_t count, loff_t *f_pos)
+static ssize_t __xillybus_write(struct file *filp, const char __user *userbuf,
+				size_t count)
 {
 	ssize_t rc;
 	unsigned long flags;
@@ -1264,9 +1278,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 	int howmany = 0, bufpos = 0, bufidx = 0, bufferdone = 0;
 	int end_offset_plus1 = 0;
 
-	if (channel->endpoint->fatal_error)
-		return -EIO;
-
 	rc = mutex_lock_interruptible(&channel->rd_mutex);
 	if (rc)
 		return rc;
@@ -1409,12 +1420,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 				if (channel->endpoint->fatal_error)
 					return -EIO;
 
-				if (!channel->rd_synchronous)
-					queue_delayed_work(
-						xillybus_wq,
-						&channel->rd_workitem,
-						XILLY_RX_TIMEOUT);
-
 				return rc;
 			}
 		}
@@ -1454,11 +1459,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 
 	mutex_unlock(&channel->rd_mutex);
 
-	if (!channel->rd_synchronous)
-		queue_delayed_work(xillybus_wq,
-				   &channel->rd_workitem,
-				   XILLY_RX_TIMEOUT);
-
 	if (channel->endpoint->fatal_error)
 		return -EIO;
 
@@ -1475,6 +1475,56 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 	return bytes_done;
 }
 
+/*
+ * Prevent the autoflush work item from sleeping indefinitely by having
+ * dont_autoflush non-zero while __xillybus_write() is invoked, as this
+ * function may sleep indefinitely with rd_mutex taken.
+ * The work item terminates immediately when dont_autoflush is non-zero,
+ * and announces this by setting autoflush_skipped. Perform autoflush before
+ * returning to compensate for a skipped autoflush if necessary.
+ */
+
+static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
+			      size_t count, loff_t *f_pos)
+{
+	struct xilly_channel *channel = filp->private_data;
+
+	ssize_t retval;
+	bool compensate = false;
+
+	if (channel->endpoint->fatal_error)
+		return -EIO;
+
+	/*
+	 * On synchronous channels, flush is performed after every
+	 * write operation. Autoflush is therefore irrelevant.
+	 */
+	if (channel->rd_synchronous)
+		return __xillybus_write(filp, userbuf, count);
+
+	scoped_guard(mutex, &channel->autoflush_mutex)
+		channel->dont_autoflush++;
+
+	retval = __xillybus_write(filp, userbuf, count);
+
+	scoped_guard(mutex, &channel->autoflush_mutex) {
+		channel->dont_autoflush--;
+
+		if (channel->autoflush_skipped) {
+			compensate = true;
+			channel->autoflush_skipped = false;
+		}
+	}
+
+	if (compensate)
+		xillybus_myflush(channel, -1);
+
+	queue_delayed_work(xillybus_wq, &channel->rd_workitem,
+			   XILLY_RX_TIMEOUT);
+
+	return retval;
+}
+
 static int xillybus_open(struct inode *inode, struct file *filp)
 {
 	int rc;
-- 
2.17.1

