Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470283B2FF8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107686; cv=none; b=r0Fa6NqI6zxRyImu3deUd2h94sEVKrlu9UAN62YhFnFgqDFuBxe79320sOErkcQqlv8HQnlLgi9g6ol9XccutV1F/z+h6sFJsP3d9kOnJ9bpMUsIrZNw3nxi1hMpE1lromfLqilx48dMmSiGu7GUQttv5y6zo0p5qO/Ws8SIKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107686; c=relaxed/simple;
	bh=YrLCdTCgijXxhNeP071upz/ihBFRy7w7FSybZD6lVsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj98PhEu76NqYCJpKssJUN/5oax5P+Nm+h6rP2cDkLubGEONR3U564bZryU+CBlYWgG7cR1YjaB1f+rPpVvzigIDbf96YY17lM+8ew3gzc/gKB2NCaooxEJQK+KFJUxIUsu34xP6oijGuQtleEvz3D34VAMJ020w3rkj930/u7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UItcxZw1; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UItcxZw1"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2df3ae6288cso793645ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790107669; x=1790712469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKj3QXNJc64ZYZOzUkze7Bi+QP/5m/9g84NFc6owjQw=;
        b=UItcxZw1iHlRa/gw43U/jo44quuZREgjU96K023KVkkC8fuVITc8d2GF/BwikuoTL3
         o3L8rpv2AG6KzlQz5tZuyXkrlI5/WFd1YT4ll/sQh1ICBhBp8efdenl1OPLnXLE9KEhz
         o7b2IQG1rs7TZPwR3pqR52NneBbSLY9HZZ0o+GXtq2i0Ai+RG1pXFj6kFbyCTe4ckh2o
         2DCDmSMcrMdy9p4hlTjjKCyXZdOhM5SHSLkW1ztEe6MFnKLoTdfN0sh6SVgzDSk5EhOs
         acbAWjsqBd1fHJgxHdOxFQ7cPzhTexToFt2JS/Mj6yzBP+vLBqdmVX+U/tpYkpXOYueZ
         GxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107669; x=1790712469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKj3QXNJc64ZYZOzUkze7Bi+QP/5m/9g84NFc6owjQw=;
        b=OOq+3yobwDUw/s09zuKkmah9zZGmzbuB0zrusvYWjXcXCDMHXBYCthNoi7AYzf9Na6
         0isE8xTBBfdpLFIDEi+Jq0XgzFOWESqKxIk2kHsrMeFUgoNP7RhmXzY0Y8WTlodrGiAP
         BbpIoi1GZRB552wbidN9gkIVK1ovGsmqP4DSg4wn+8+ndqqMg8FZ0FbQ/XLH7UortMj/
         8o4OcSUZmeqtZg4GK+RFFfraVawPTSLDZHLEVOSh7ulHmhnDCiGry/QRg7vdXKofTWvk
         kYZiQ2J5IcQexAWjrLikUQLtBvpJAEk6RsZ6mD2Kw5+lmZyKk4xGTPQ+cjY3BnSPV1e2
         gf4w==
X-Forwarded-Encrypted: i=1; AKwUvBxBIbjGsqTeWdM2YQfQkEFWfo0Y750qnTowO9UR2waSJQHUsfnefZnH/ncLEcDfgRmVKDNxhuiw8bcCTIk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOJFiX8zWcQ3JbFxF9u6cNeX4n4jXfLoNRLP+YjackezVjg3ly
	7LLvlHnhe55jv/lZgIH1i/Np8mgH1NDY4P9BYEZvv65DoG0uilM9BDzJ3rnU9kriHxAh6ZoaWcV
	G5gXwRE+LJhfj4bG8cX/wibNJOK7FnDxKjoyy4+ieZUqDgMEL3yMn
X-Gm-Gg: AYBFou3PxPDpCDbELKXTuTbSKmsyPOUCt9y+JB08fKiP7FukT7AsoOrHbsA70fyJJLd
	kXnNmzjk89/1U0yZdOmyI+X9XgDhYF/26vthj7j2YgmrLVAE0IwoJxjlByJsFP1bHK2CsK13fIH
	hQ97DTYeXYr4KO3mjuS8RN4Gj37mvJOL3rIMPVJutoFYyWHSM1D6/EkT445SAalTtMmF42gp4QO
	1l2ru8ebZtewO6cGb/7vFds9e6fdxOMjJl3In5W1hOvprLcMHVLyYYhwxEUhkwip+tbGYQx699n
	s3lBrMvdhuKStXkKGtvjwg6lotUW4JTYGq+B9RDfRZDGkUomffcV236JrwAkV+OeJi6Pw3h758D
	aHIXOuby5yL0peLA=
X-Received: by 2002:a17:90b:2e83:b0:3a0:348a:5118 with SMTP id 98e67ed59e1d1-3a07e7555c3mr451315a91.47.1790107669177;
        Tue, 22 Sep 2026 13:07:49 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a07dd381f4sm306951a91.7.2026.09.22.13.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:07:49 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (bond0.slc5-n22m24-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:429])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id F0E694014B;
	Tue, 22 Sep 2026 14:07:47 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id EE52B3F9F5; Tue, 22 Sep 2026 14:07:47 -0600 (MDT)
From: Surabhi Gogte <sgogte@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	adailey@purestorage.com,
	Surabhi Gogte <sgogte@purestorage.com>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and startup
Date: Tue, 22 Sep 2026 14:07:18 -0600
Message-ID: <20260922200718.3941465-4-sgogte@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922200718.3941465-1-sgogte@purestorage.com>
References: <20260922200718.3941465-1-sgogte@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
allocation and startup"), refactor nvme tcp I/O queue setup to use async
API, combining allocation and startup into a single parallel operation
per queue. This reduces connection and reconnection setup time when
there are delays in establishing connections, which is especially
important for high-core-count hosts.

Key changes:
- Use async API to facilitate parallel calls for io queue setup.
- Add nvme_tcp_queue_setup_ctx for propagating errors from async
  workers.
- Remove nvme_tcp_start_io_queues() and __nvme_tcp_alloc_io_queues();
  their logic is folded into nvme_tcp_setup_io_queues() and
  nvme_tcp_configure_io_queues().
- Allocate the io tag set before the queues so that the queue range is
  known, and only set up the reconnect grow case if the queue count
  actually increased.
- Serialize the cpu scan and claim in nvme_tcp_set_queue_io_cpu() with a
  spinlock, as concurrent callers would otherwise select the same cpu.
  The per-cpu counters no longer need to be atomics.

Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
time reduced from 61ms to 11ms.

Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/host/tcp.c | 119 ++++++++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 42 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 9308feba8a74..ec678ed07af8 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/async.h>
 #include <linux/err.h>
 #include <linux/crc32.h>
 #include <linux/nvme-tcp.h>
@@ -54,7 +55,8 @@ MODULE_PARM_DESC(tls_handshake_timeout,
 		 "nvme TLS handshake timeout in seconds (default 10)");
 #endif
 
-static atomic_t nvme_tcp_cpu_queues[NR_CPUS];
+static int nvme_tcp_cpu_queues[NR_CPUS];
+static DEFINE_SPINLOCK(nvme_tcp_cpu_queues_lock);
 
 enum nvme_tcp_send_state {
 	NVME_TCP_SEND_CMD_PDU = 0,
@@ -154,6 +156,12 @@ struct nvme_tcp_queue {
 static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
 static LIST_HEAD_GUARDED(nvme_tcp_ctrl_list, nvme_tcp_ctrl_mutex);
 
+struct nvme_tcp_queue_setup_ctx {
+	struct nvme_ctrl	*ctrl;
+	int			qid;
+	int			*err;
+};
+
 struct nvme_tcp_ctrl {
 	/* read only in the hot path */
 	struct nvme_tcp_queue	*queues;
@@ -1731,9 +1739,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		goto out;
 
 	/* Search for the least used cpu from the mq_map */
+	spin_lock(&nvme_tcp_cpu_queues_lock);
 	io_cpu = WORK_CPU_UNBOUND;
 	for_each_online_cpu(cpu) {
-		int num_queues = atomic_read(&nvme_tcp_cpu_queues[cpu]);
+		int num_queues = nvme_tcp_cpu_queues[cpu];
 
 		if (mq_map[cpu] != qid)
 			continue;
@@ -1744,9 +1753,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 	}
 	if (io_cpu != WORK_CPU_UNBOUND) {
 		queue->io_cpu = io_cpu;
-		atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
+		nvme_tcp_cpu_queues[io_cpu]++;
 		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
 	}
+	spin_unlock(&nvme_tcp_cpu_queues_lock);
 out:
 	dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
 		qid, queue->io_cpu);
@@ -2023,8 +2033,11 @@ static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
 	if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
 
-	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
-		atomic_dec(&nvme_tcp_cpu_queues[queue->io_cpu]);
+	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags)) {
+		spin_lock(&nvme_tcp_cpu_queues_lock);
+		nvme_tcp_cpu_queues[queue->io_cpu]--;
+		spin_unlock(&nvme_tcp_cpu_queues_lock);
+	}
 
 	mutex_lock(&queue->queue_lock);
 	if (test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags))
@@ -2131,25 +2144,6 @@ static void nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl)
 		nvme_tcp_wait_queue(ctrl, i);
 }
 
-static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
-				    int first, int last)
-{
-	int i, ret;
-
-	for (i = first; i < last; i++) {
-		ret = nvme_tcp_start_queue(ctrl, i);
-		if (ret)
-			goto out_stop_queues;
-	}
-
-	return 0;
-
-out_stop_queues:
-	for (i--; i >= first; i--)
-		nvme_tcp_stop_queue(ctrl, i);
-	return ret;
-}
-
 static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
 {
 	int ret;
@@ -2210,22 +2204,67 @@ static int nvme_tcp_tls_check_psk(struct nvme_ctrl *ctrl)
 	return 0;
 }
 
-static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
+static void nvme_tcp_setup_queue_async(void *data, async_cookie_t cookie)
 {
-	int i, ret;
+	struct nvme_tcp_queue_setup_ctx *ctx = data;
+	struct nvme_ctrl *ctrl = ctx->ctrl;
+	int ret;
 
-	for (i = 1; i < ctrl->queue_count; i++) {
-		ret = nvme_tcp_alloc_queue(ctrl, i,
-				ctrl->tls_pskid);
-		if (ret)
-			goto out_free_queues;
+	ret = nvme_tcp_alloc_queue(ctrl, ctx->qid, ctrl->tls_pskid);
+	if (ret)
+		goto out_err;
+
+	ret = nvme_tcp_start_queue(ctrl, ctx->qid);
+	if (ret)
+		goto out_err;
+
+	return;
+
+out_err:
+	WRITE_ONCE(*ctx->err, ret);
+}
+
+static int nvme_tcp_setup_io_queues(struct nvme_ctrl *ctrl, unsigned int first,
+		unsigned int last)
+{
+	ASYNC_DOMAIN_EXCLUSIVE(queue_domain);
+	struct nvme_tcp_queue_setup_ctx *ctxs;
+	int nr_queues = last - first;
+	int err = 0, i, ret;
+
+	if (first >= last)
+		return 0;
+
+	ctxs = kmalloc_objs(*ctxs, nr_queues);
+	if (!ctxs)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_queues; i++) {
+		ctxs[i].ctrl = ctrl;
+		ctxs[i].qid = first + i;
+		ctxs[i].err = &err;
+		async_schedule_domain(nvme_tcp_setup_queue_async, &ctxs[i],
+				&queue_domain);
 	}
 
+	async_synchronize_full_domain(&queue_domain);
+	kfree(ctxs);
+
+	ret = READ_ONCE(err);
+	if (ret)
+		goto out_free_queues;
+
 	return 0;
 
 out_free_queues:
-	for (i--; i >= 1; i--)
-		nvme_tcp_free_queue(ctrl, i);
+	for (i = first; i < last; i++) {
+		struct nvme_tcp_queue *queue = &to_tcp_ctrl(ctrl)->queues[i];
+
+		if (test_bit(NVME_TCP_Q_LIVE, &queue->flags))
+			nvme_tcp_stop_queue(ctrl, i);
+		if (test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
+			nvme_tcp_free_queue(ctrl, i);
+	}
 
 	return ret;
 }
@@ -2267,10 +2306,6 @@ static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
 	if (ret)
 		return ret;
 
-	ret = __nvme_tcp_alloc_io_queues(ctrl);
-	if (ret)
-		return ret;
-
 	if (new) {
 		ret = nvme_alloc_io_tag_set(ctrl, &to_tcp_ctrl(ctrl)->tag_set,
 				&nvme_tcp_mq_ops,
@@ -2281,12 +2316,12 @@ static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
 	}
 
 	/*
-	 * Only start IO queues for which we have allocated the tagset
+	 * Only setup IO queues for which we have allocated the tagset
 	 * and limited it to the available queues. On reconnects, the
 	 * queue number might have changed.
 	 */
 	nr_queues = min(ctrl->tagset->nr_hw_queues + 1, ctrl->queue_count);
-	ret = nvme_tcp_start_io_queues(ctrl, 1, nr_queues);
+	ret = nvme_tcp_setup_io_queues(ctrl, 1, nr_queues);
 	if (ret)
 		goto out_cleanup_connect_q;
 
@@ -2310,9 +2345,9 @@ static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
 
 	/*
 	 * If the number of queues has increased (reconnect case)
-	 * start all new queues now.
+	 * setup all new queues now.
 	 */
-	ret = nvme_tcp_start_io_queues(ctrl, nr_queues,
+	ret = nvme_tcp_setup_io_queues(ctrl, nr_queues,
 				       ctrl->tagset->nr_hw_queues + 1);
 	if (ret)
 		goto out_wait_freeze_timed_out;
@@ -3157,7 +3192,7 @@ static int __init nvme_tcp_init_module(void)
 		return -ENOMEM;
 
 	for_each_possible_cpu(cpu)
-		atomic_set(&nvme_tcp_cpu_queues[cpu], 0);
+		nvme_tcp_cpu_queues[cpu] = 0;
 
 	nvmf_register_transport(&nvme_tcp_transport);
 	return 0;
-- 
2.55.0

