Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEC4E73CA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611710; cv=none; b=asYyT8UOroVwxdUvlko3JcqkH7CbLMKzdAbzMXiFNHI2cq0q1VP+OUg8s9nUZZxdyj5+k2HriyfjICYVt2E+t4JJi5WYwI10z7vbfM1H/LgApxqdJH60b7ir0MK+Pk1zQ44GkbZ6uRe222etVOnLvuehy7/WfvOhpG0k6ORoFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611710; c=relaxed/simple;
	bh=kwqPqWGU/lu5O5WnPDRNz7W9uJsbb9qHjsAczhFSIQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNFw5L1cRN3J4BjDNS3wpQI3zOY4jKSsdy2PfTYI4QArcNF7fIU10sh0ROk6QW3k2u+l8jKVauWCoclzJVIoSBpQDvzSikvagz8Z/tV4AENxy+4Zvu44rjp6IeEVGvav2etG3zFxZbdwIwmOLMhIvH1REdyGyUukEHIFUlw6JFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=RZUCXPKs; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="RZUCXPKs"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a7c33dbfeeso30924407b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611708; x=1791216508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVTg+cJ8iEwlI+g5Z3PmYvi9KtBGqHnIrE1JgGd8h38=;
        b=RZUCXPKsVCr9U2XIQ36eFxqdUpSVfi/qr/h9VJjt1JAMNNuk/ftlU8XidIkxvfv5fm
         Dh9C0+UCL29DM74mlqbeZ0Bf3ge0UQBw8rh9Z8c/cJzQNivX2Dni1u38Yz9RWxU28ggp
         A37Cxi6kh8RV9zQJt80CH1ZQfgRXwKhwpdnhRlHqE+0UfS/936A+rbrQxCSv2oeShQcl
         LQYe9DmKVW5nnoql3uVETbWk4lTJvtUkP4BFMhT71JW6e8YzU09feXai7+XZpJD7jYZc
         zKJgSR0hnjFZzLJi3tPNE6FLIrk2/EL0kH5pAmsIixel4MaK2Td32jh1eY0LGEE0dKAj
         31/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611708; x=1791216508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVTg+cJ8iEwlI+g5Z3PmYvi9KtBGqHnIrE1JgGd8h38=;
        b=yRYL7huiZHhrBm5oENT6apeuBUpo5QtCDmt7nNCci+s10Kn+1qUqcQR7/MAbsa8gWo
         AUo9OOn5Iv5/5jcuK78Yd9X9eXUiphvkDc1RVYOb11pzc4TLxtX8ll7LSC77axN7DIrO
         o0Lm0vvoNRfa+dVRjvHEAbcDuIj3sl8KzmGtOXcMziZWg0ZiOjJNiqCBUWF4xTevGOhP
         6IzghBnsAcNT88gSkrH+kSUJr+1t8zxTH5CnZ8tLN7jqvm8hqzIMfJxjHIKaPbHnHeBL
         PKdffykNr28i7P2lUZt4y3NW0bRNlUGUlkWeaAu3msj38XRfKKkuMyR5vf7rjKUgyNPH
         /HVA==
X-Forwarded-Encrypted: i=1; AKwUvBxJolbBPxhWwiZxiGfmsH0+orKMYtq+BOI32cvwXHVI52Q63RD3SJU8FPElenXQ9dhRMPPVWc4A4HThHFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD36vEOG8ceo0vZSs0vGpF76ASOHgrzHNEOB9Ro77iZ4zkcfZp
	96qSZiSuNxHbfM0G0VcXjdWPN16VWz+GIxm9p4743WhBiX7uERAQz9hkf047CGx10q4=
X-Gm-Gg: AYBFou36p0+GMNTkWfT/RvRoH7wC4xqLrrqBWo2CiWheSwoyAGQkyi/K8vSqH9hxOG0
	seb7Ij7logM/QXawxxcUXJY8b8GI4QmLmPm0KYUShelvt8evzi+TguVtULm7f1YDQCU7ppXqLtJ
	zWukaDQ6t0Y7D2XKsYOkEMNSGiJqf8ndEdPALpMF4CPPqHYCdmqB4LgUOUMk7ovi+WPFqj1KaxA
	xPYgSX6yEOdFdHoq04BIjdJuKc3qG8sJKf/w6/EfRlNN14veH/UIyG9SP0RYAZRAtcab5yVeK6Y
	ABATcWHvgv95zUojZ4p2si2VUa4yKyJ30R8VTszRMysbSsIeBIu7zj6RTECJQSV9ebcKaFf92uL
	gFMe0x/TIRl8rOXJWmRhYXnBV/VHfGCTFiELjWZwPX488hRf6TUbPdQiHlbfotgOGFRuFxUlLee
	NYBEh0jpv1OuwJpHSDYlYRUz74sSomh5sLpMbKqYNf0MIlDKE5vFXIYjnP0TQfmRldc9rKNhlg9
	+hO9hWv2pI/2327XIHkSuyteQ==
X-Received: by 2002:a05:690c:c681:b0:8a8:5721:9098 with SMTP id 00721157ae682-8a857219668mr41750367b3.20.1790611707875;
        Mon, 28 Sep 2026 09:08:27 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813fee09sm179568685a.24.2026.09.28.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:08:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 28 Sep 2026 16:00:45 +0000
Subject: [PATCH 9/9] ublk: refuse to go live over canceled io commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-ublk-cancel-stop-v1-9-4a4360232a46@toxicpanda.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611254; l=7836;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=kwqPqWGU/lu5O5WnPDRNz7W9uJsbb9qHjsAczhFSIQ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGcSLVl7nzeCvDJvP1fgiB+ynMcfQD0XJ1tJZLVKaA3KPxQnr8qiuhuPvwb9JVcYQUx678ZcTIY
 BM5AbDh08zgA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

START_DEV on a ready device whose commands got canceled adds a disk on
which every request fails. With UBLK_F_USER_RECOVERY, unless
UBLK_F_USER_RECOVERY_FAIL_IO is set, the requests are requeued instead
and never kicked again, so the partition scan read hangs with
disk->open_mutex held until the device is stopped again or deleted.
Every opener blocks behind it. END_USER_RECOVERY on a queue which kept
->canceling marks the device live and leaves its requests parked the
same way.

A command canceled by ublk_claim_cmd() cannot be fetched again before
the queues are reinitialized: FETCH fails with -EBUSY once the device
is ready and with -EINVAL on an active io. Since commit 1133b93fc7f6
("ublk: set canceling flag even when disk is not allocated") and the
previous patches such a device keeps ->canceling set, but nothing stops
it from going live.

In ublk_ctrl_start_dev() check for that and publish ub->ub_disk in one
cancel_mutex section, so that either START_DEV sees the canceled
commands or ublk_start_cancel() sees the disk and quiesces it.

Fix by failing START_DEV and END_USER_RECOVERY with -ENODEV when a
queue is canceling or holds a command canceled after being fetched.

Fixes: 1133b93fc7f6 ("ublk: set canceling flag even when disk is not allocated")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/block/ublk.rst | 15 +++++++++--
 drivers/block/ublk_drv.c     | 63 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
index 28300fee22bf..05d702f66a93 100644
--- a/Documentation/block/ublk.rst
+++ b/Documentation/block/ublk.rst
@@ -118,7 +118,13 @@ managing and controlling ublk devices with help of several control commands:
   After the server prepares userspace resources (such as creating I/O handler
   threads & io_uring for handling ublk IO), this command is sent to the
   driver for allocating & exposing ``/dev/ublkb*``. Parameters set via
-  ``UBLK_CMD_SET_PARAMS`` are applied for creating the device.
+  ``UBLK_CMD_SET_PARAMS`` are applied for creating the device. The command
+  fails with ``-ENODEV`` if any fetched io command got canceled meantime,
+  by ``UBLK_CMD_STOP_DEV`` or because its io_uring is gone, and the device
+  has to be deleted then. With ``UBLK_F_BATCH_IO`` it fails the same way
+  after a ``UBLK_CMD_STOP_DEV`` sent while no process had ``/dev/ublkc*``
+  open, or after the current one opened it, even if no io command had
+  been fetched yet.
 
 - ``UBLK_CMD_STOP_DEV``
 
@@ -195,7 +201,12 @@ managing and controlling ublk devices with help of several control commands:
   command is accepted after ublk device is quiesced and a new process has
   opened ``/dev/ublkc*`` and get all ublk queues be ready. When this command
   returns, ublk device is unquiesced and new I/O requests are passed to the
-  new process.
+  new process. It fails with ``-ENODEV`` if any of the new io commands got
+  canceled already, and with ``UBLK_F_BATCH_IO`` also if the cancel of a
+  ``UBLK_CMD_QUIESCE_DEV`` reached one of its queues after the old process
+  released ``/dev/ublkc*`` and before that queue got ready. The device has
+  to be deleted then, or the recovery
+  started over after the new process has closed ``/dev/ublkc*``.
 
 - user recovery feature description
 
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 5e86405b294b..19efa13c205a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2757,6 +2757,7 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 static struct gendisk *ublk_start_cancel(struct ublk_device *ub)
 	__must_hold(&ub->cancel_mutex)
 {
+	/* sync with ublk_ctrl_start_dev() publishing the disk */
 	struct gendisk *disk = ublk_get_disk(ub);
 
 	if (ub->canceling)
@@ -2772,10 +2773,10 @@ static struct gendisk *ublk_start_cancel(struct ublk_device *ub)
 		blk_mq_unquiesce_queue(disk->queue);
 	} else {
 		/*
-		 * Disk not yet allocated by ublk_ctrl_start_dev(), so
-		 * there is no request queue and ublk_queue_rq() cannot
-		 * be running.  Just set the flag; if start_dev proceeds
-		 * later, new I/O will see canceling and be aborted.
+		 * Disk not published by ublk_ctrl_start_dev() or detached
+		 * already, so ublk_queue_rq() cannot be running.  Just set
+		 * the flag, START_DEV fails on canceled commands instead
+		 * of adding a disk on top of them.
 		 */
 		ublk_set_canceling(ub, true);
 	}
@@ -4652,11 +4653,35 @@ static bool ublk_validate_user_pid(struct ublk_device *ub, pid_t ublksrv_pid)
 	return ub->ublksrv_tgid == ublksrv_pid;
 }
 
+/*
+ * The commands canceled by ublk_claim_cmd() can't be fetched again
+ * before the queues are reinitialized, so a ready device must not go live
+ * while a queue is canceling or holds a command canceled after the fetch.
+ */
+static bool ublk_dev_cmds_canceled(struct ublk_device *ub)
+	__must_hold(&ub->cancel_mutex)
+{
+	u16 i;
+
+	for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
+		struct ublk_queue *ubq = ublk_get_queue(ub, i);
+		bool canceled;
+
+		spin_lock(&ubq->cancel_lock);
+		canceled = ubq->canceling || ublk_queue_has_canceled_io(ubq);
+		spin_unlock(&ubq->cancel_lock);
+		if (canceled)
+			return true;
+	}
+	return false;
+}
+
 /*
  * Wait until all queues have fetched their I/O commands, and return with
- * ub->mutex held and readiness guaranteed: then every queue's ->canceling
- * is cleared. Ready may regress between wakeup and mutex_lock() (F_BATCH
- * UNPREP, daemon death), so re-check it under the mutex and wait again.
+ * ub->mutex held and readiness guaranteed. Ready may regress between wakeup
+ * and mutex_lock() (F_BATCH UNPREP, daemon death), so re-check it under the
+ * mutex and wait again. The commands may still get canceled after being
+ * fetched, callers check ublk_dev_cmds_canceled().
  */
 static int ublk_wait_dev_ready_and_lock(struct ublk_device *ub)
 {
@@ -4691,6 +4716,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub,
 	};
 	struct gendisk *disk;
 	int ret = -EINVAL;
+	bool canceled;
 
 	if (ublksrv_pid <= 0)
 		return -EINVAL;
@@ -4776,8 +4802,20 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub,
 	disk->fops = &ub_fops;
 	disk->private_data = ub;
 
+	/*
+	 * Check and publish under cancel_mutex, so either the canceled
+	 * commands are seen here or ublk_start_cancel() sees the disk.
+	 */
+	mutex_lock(&ub->cancel_mutex);
+	canceled = ublk_dev_cmds_canceled(ub);
+	if (!canceled)
+		ub->ub_disk = disk;
+	mutex_unlock(&ub->cancel_mutex);
+	if (canceled) {
+		ret = -ENODEV;
+		goto out_put_disk;
+	}
 	ub->dev_info.ublksrv_pid = ub->ublksrv_tgid;
-	ub->ub_disk = disk;
 
 	ublk_apply_params(ub);
 
@@ -4824,6 +4862,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub,
 		ublk_detach_disk(ub);
 		ublk_put_device(ub);
 	}
+out_put_disk:
 	if (ret)
 		put_disk(disk);
 out_unlock:
@@ -5350,6 +5389,7 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 {
 	int ublksrv_pid = (int)header->data[0];
 	int ret = -EINVAL;
+	bool canceled;
 
 	pr_devel("%s: Waiting for all FETCH_REQs, dev id %d...\n", __func__,
 		 header->dev_id);
@@ -5372,6 +5412,13 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
+	mutex_lock(&ub->cancel_mutex);
+	canceled = ublk_dev_cmds_canceled(ub);
+	mutex_unlock(&ub->cancel_mutex);
+	if (canceled) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 	ub->dev_info.ublksrv_pid = ub->ublksrv_tgid;
 	ub->dev_info.state = UBLK_S_DEV_LIVE;
 	pr_devel("%s: new ublksrv_pid %d, dev id %d\n",

-- 
2.55.0

