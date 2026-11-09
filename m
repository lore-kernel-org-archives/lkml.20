Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223713;
	b=0M3XnkPxzfFCaGQu9SQs+RnVTNE03moQNZMVU/76lZDvJ0lSnj+ER3daKmWh5kf+pPy/
	 PPcniD0o5Fe5LpZ8DnZFOLrkE1uTT7Uoz/J6n9GZvFcihis3KqeaXfXdmQjqmbWuZqlAI
	 3TECT9TyCvuT77Tk/p6DgmsB9/Mq6RDfa2hfl2p/hBPRNNPtp3Lv/3kYLfP2kdYbLWASX
	 MlkC9xfK4A1bctIXkl5BX8f1C2tfrKDbXv+9DAyhrRBcUxYRFzl+ZT0VR+lLdvKrWtu/T
	 FR9i0J8+5cHyQmJjhJ8L+NsdsWPAJUIV1d+CFJvrKWcAqU1t0QI4OuRmowoFE4VfAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=krxt2Dkb7wz1T6uZHgiNQo1YbtCz1gbCUqw9CSeEdYQ=;
	b=4lPDlHT0UoA2MKXxL1XH9CNtcob7zACgcfLPrA7GjVhN8VEb4fS6lb3UsSk/xHmM6NQY
	 F13TTcvdH8vk37P3Dc0XIvlgV0wO34HynoWN1JaYX73HKa3UbU4YVnj2SZFZmOZUQnVK6
	 Buma1dew4awrlp1v58g5rBs06rBVI+gCqKKGAfriMM3HSzEy9BGTtDMAA3Zy30NBmFjLY
	 29G3iplncXd3r1Uu7guegKYDCz4WYN4mMhDk/A4gz6C5AgfDA+//pKkQXQAGt6r0Q2s6Z
	 XcJxJed64JqLpXch4xFqvUsY80psNHBVcQz74u2BTyOa/qtkZzZR5mTkoS5fybpZdNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yO2i8FO3;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB96606EE8C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB96606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yO2i8FO3
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f6f58aeso532756e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223711; x=1794828511; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=krxt2Dkb7wz1T6uZHgiNQo1YbtCz1gbCUqw9CSeEdYQ=;
        b=yO2i8FO3vYuPXBIEEKKt9Z0mjbrGYuZ30bKC5XnzoU3y9aqhENF8o6BqBUUe1hRSMh
         GM+mSmhF5SP1bflvBnM7GbieCcEs2PyrWxSq9ghEvXX3+i90MmIkCW7ztAhMo8AMOQ5H
         y0NWCV11SmRE3XPOCZglxXCymj6blS22ynxBSvq4zgo/Y+ODrdTy9c38RM7emYf7g6dW
         ZDX3Cgi/PPDhEJOj83YTZDTmG2nauzU/m9QdWIB+bY0ixPeaoNoHzaNEGF/zJtgybi9q
         BwCHQLg+j1MgkEJ5PzhlT3Xp8KnkVtlEPZcRKeEeAJC5xOHA/sETKSiHfISY0QMmmKoJ
         Nd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223711; x=1794828511;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krxt2Dkb7wz1T6uZHgiNQo1YbtCz1gbCUqw9CSeEdYQ=;
        b=KI6qhXVgvCQy8tfqx+cDC/iazdQzD/ppcl2V/6iqKP1rlFVEYDSG0/6L+IzmbYxGmz
         jZ8JGphIPE1J4v9lUQsmckNpRJHJ69wapNBlvS9TQqsycKeIuWmdCCOymH3KpBoMXrn2
         rnfmvP8NaG9mzOJ4tZTavm5loPnQFfRbg3hH7qEbGF3/gOe9h9YFPGZtDzRAn6qcNWdd
         KrfAENdhUpWOW5/xA+aM/3kVfwCN2Qb62SjuhvJ9JJ/nm/wkbXheOPBWssdj4xuP/a75
         acwaGq/3/owxLo5bWmcu8P/C+JydTcq8n+7IvO+hGj9NludgZhrXp8sH4zcJsQwcZcCb
         RLdw==
X-Forwarded-Encrypted: i=1; AL+hErFcLcqKxB9OWaCYQqQUSRqLoUZluocSeqa0i93QQjC/KvQlLf3q3wdzYvJeyC76xIr4W39Q9xCyX/ybDtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LnfMm1S9IC+yv0LxJ7GPs3mzalFc28YBC+7bFT2g/IzcuGZeZ
	kck2wuMnfnyjx1ux6Te8CnTZopfwfcqKb+qCEMbKUI7vpnUXaYhjWlPc
X-Gm-Gg: AYBFou2PoUCuUpEPrS9qapqggZoryVQXqk7f8XVCx4DRXmNQyLtRv35qOP8PbIVDQsF
	wzbC6pV+3lMZw91Mhisvo5oE2XvQ+fDXDVkOicRz7+hNiKfXbGu9IohxAD5ho44TKCN2zjqgIr9
	qGWPtggolGPk+xLhi5meUSrNd0f/33M+aaAD1+TvzyekR/yPUfAUYQ0zur0c0ZiYiP+gTG8m1tL
	SMqqWQmpkxz2YhMWDfLRyycW7IjUsggksz/U/M+3mkuVgtYzIu8KQhwMFNL8biCNZvmL/uzr5lC
	q1zPR5AocfBiSbOJg/iH0+TLIjmWQ6mx1FgaBVs1UNdfD3Tovzxs1wchioswhnmeMas51JSYFVn
	ydvtQrrj7a5tD68MeLrlqZO/ghHRhzPlC5XTRjFq+fqJXbgLGcKfpUnRwRfJKe4sG2ORd669BOI
	ci/hwV+j4lYjiY0knLiBNfDg1pRsYAXSqF8myBMiPQ5l/VP4BNajKXwJHPn3jTNNV7q9908PPLj
	TXZ9h4+6+1e05+/K9NTUcfixtsXOmT2cxQXbFf1iHMy58QhpNTPmufOCO4zmnhZPmU5hXDzg71c
	/OzXJVE/fteR/5vQxiT3ya87aOuKST7OOphTrz096wD24RT5056vHPo6
X-Received: by 2002:a05:6512:a94:b0:5b8:fa05:e49c with SMTP id 2adb3069b0e04-5c14c0110a2mr1029253e87.34.1794223711396;
        Mon, 09 Nov 2026 03:28:31 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b805b77sm841847e87.30.2026.11.09.03.28.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:30 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 7/8] char: xillybus: Avoid indefinite sleep of work item
Date: Mon,  9 Nov 2026 12:27:59 +0100
Message-Id: <20261109112800.48663-8-eli.billauer@gmail.com>
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

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
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

