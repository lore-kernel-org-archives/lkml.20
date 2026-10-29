Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253953;
	b=HB0B//mPt4yX1eAMo/w794rEYE/1DE0oVZzmQly7kmJRH79cYmhqtaDUkQV1g53gCaU3
	 xuuvGKP0UXWESSrl2fvyJtMuJD5qR8Gli+dejVu/LMtq4tbP0NFTDiDtYUommUR1/J85G
	 D1hs2vK97ZMMSZ3MEI2qjl8EkPSRT0E/cAhpoXsA/NU3L81IRBgiXGldFrSxX9slwmtK/
	 q6UDYfQVhoth37zidU2r+T+GUU9ElP4aQo8fd5EHsARvdjF2rnmxIzUBJRP3PaREW05Nq
	 KWXULjbsEjQD0UtG37+OGe3DX/4C8/8d5S3V4CCsdNfXgpMYuEGwWzOsuOYEhlil5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ve4P/af0YMON2eW8s3CRyy2aQgdBXU6q9ZyvIcIdYyI=;
	b=LDXmA8PjxM7nFDAvBQNQMAQuK981AWyPQKRhrchEuwsoNt97HjS1iITnPW59BdKsZk6Y
	 yV1oLPRILx7kYVb5hKWdJx7FN3RR8rnv9go36bkCQ/2Sehg0iT9KcAxBzjQw6nlPzbmY3
	 rhSNPZkE/mf7UsoV0ygUnjNS5kT94YhIojLAZyeuk3TQODW3d0h7Lm4fooZokq8pLfRkA
	 Y6E/V6SLCyFfuUeeoQkgBEq7Hzt5Cvs1r2Rfex6dGr6p5AsvUHiki6I4gw585ShJGD4CC
	 y7l3Rx4fb71pyStuvvgnR36JTV0bGKD49SkA5gWViUOTE9vB5YoVk4bqlMGFEC3cVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z66VK0C0;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E25A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E25A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z66VK0C0
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so671776e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253952; x=1793858752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve4P/af0YMON2eW8s3CRyy2aQgdBXU6q9ZyvIcIdYyI=;
        b=z66VK0C0HWf264jDUwlCBYeaaFVfhK90ht+1E8fX2sss76ORC5RyQ6rFHWRKj01p4f
         6l/1dxN7WSjeytE3l9HzhYnxQ1Bghsxj9TZA/eLcO5fp5r9Xc5gvDsTPuSmTEyNT680S
         TaryncxCNquKE9+QYvCXUFX8WXho3DsElu3o9l3aIJvq6YkoC8kVrdBj1HqTsAgJ3W19
         DgKq14NgcAamdh2bwwI+RN97VmWFthn6a9I5hkF20FcnMhCgquqZU8xisfpEtEDL+YzW
         1ljaB+w1AjJQO5Je/9IOOuVUkFRlNnbSoUzQRGGaAcl1vbH1r0D4uNLUsAjkE1t0hGs5
         ECeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253952; x=1793858752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve4P/af0YMON2eW8s3CRyy2aQgdBXU6q9ZyvIcIdYyI=;
        b=kf4RwMlYZxnY7FNU7RNom92f7VOLwwgoEFWlxZrU4bvRF5gZlAeLlgt4cFNqTBW0ck
         58nQsPMQv/3gDSkQVzv4nDQHuP6xhf0ig3lOxk1GW4UPqtKS/PiwCok+FqYZ3alDsdUa
         zo3WJJOixNnyahviDqaKQFPgyCdJ9JblNwjmi7n7qMpQM8PTJ/h2flcm2nOgpOBxzJPw
         e+NWNgcjnDH2wRI4YuyPa148Yfu9NFGFqC8ZqKle22P7Wp3AaMf7ef8kri1/r9d2DQuP
         fY45wEEyHtpLR0k8KY3WStEzUSe8c7PptU0ayYqTHMPk2Ql2WwTBDipmWzEkdE4tN30s
         eLNg==
X-Forwarded-Encrypted: i=1; AKwUvBx3VGVzAHE8fj8uvAlHCUn9S9DdOnVDH783FWWYXTeKy+CPcSSURiEUoxpwP4EVOMM6dYz/dpsQn0DICMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuG2BSkUEFfAEkkoiZ6QaqRDpBhi30Ms9vVieIRHlKg2eh0fmB
	AxvNBkT4CAmh4OfFhlojp7fq2qjUDyCO4D9PZZJw8QMxhnW7wW4d4kaSedoMd6zHOoE=
X-Gm-Gg: AYBFou1/JSFXJij7vYpFedwGWQ044t8JA2vWdVok/ovi63EikTL8IhfkXXiT6iAuoes
	LzpeJst5hP1Yka66DgouNbvXOCLWicacgNvoRtRLUS+PZRunffyD+piqezrSP2kk5382hdgC1hk
	kQUIPn/VvB6PqbEJm4M5v1R0TfGLfgOdQuOPZr+7eVE+qzXHkL6j5GKqS/eNEpScH87cRuT9F4A
	a7SnLDon2RQ38adobxywG0E8ySHU+uK2itjp9tzi16JWLfZfg53gPiDBGk1L+JbKUftXRlw80KP
	gSyKIRDYsWfwTJjow8j0E73eSCSG+nUzj33Ak5gaSO7URoafpogbFUDVD/2GNLNFJ8xuSwf5vRZ
	Olixy/cJ8OUvc8Xl32gXw5Tpt+cJElcZVK3yV+hT4UM05yHuHpQFg7QYgvsHKyh8hZBf6eR/a06
	GH/WV4g+BosRg86iQcVaNlCTmiTQTs8LP2K/MINE87VFkRilsRyZ6NNLpYZlaGttCEykpcmixnh
	bGYb9amzbwMEFvW2Ss+Qv7s5twDK81oFiVAzIKz7u0LnWB3EUuzgR/qQ1dixCvbSP9jzRwcncUX
	3yvY5H/hkSWzJTmmlmPF/ZLYIf+o9nSFPfFx+0k=
X-Received: by 2002:a05:6122:4286:b0:5e9:6d96:aa38 with SMTP id 71dfb90a1353d-5ec4cbfd1c0mr2200118e0c.9.1793253952022;
        Wed, 28 Oct 2026 23:05:52 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:8b5e:397a:cdcb:e1d9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec57d219f0sm2276999e0c.4.2026.10.28.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:05:50 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	sgogte@purestorage.com,
	hare@kernel.org,
	nilay@linux.ibm.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nvme-rdma: fix NULL queue->ctrl dereference on reconnect
Date: Thu, 29 Oct 2026 03:05:21 -0300
Message-ID: <20261029060521.1690223-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation
and startup"), a reconnect that gets more I/O queues than before grows
the tag set before the new queues are set up. queue->ctrl is only set
by nvme_rdma_setup_io_queues(), so I/O submitted in between reaches
nvme_rdma_queue_rq() on a queue that was never allocated and
dereferences a NULL queue->ctrl:

  BUG: kernel NULL pointer dereference, address: 000000000000034c
  RIP: 0010:nvme_rdma_queue_rq+0x52/0xb90

Add nvme_rdma_init_queue() for the queue fields that do not depend on
the connection and call it for every queue when allocating the
controller. Such requests are then requeued like on any other queue
that is not live. queue_lock moves there as well, and
nvme_rdma_exit_queue() destroys it when the controller is freed.

Fixes: 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation and startup")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Based on nvme-7.4 (89480d137bf0), also applies to mainline and v7.3.
Same approach as "nvme-tcp: fix NULL queue->ctrl dereference on
reconnect" in nvme-7.4.

pi_support, cmnd_capsule_len, queue_size and cm_done are still set on
each connect, as they depend on the RDMA device or on the connect.

Reproduced in QEMU with nvmet-rdma over rxe and
CONFIG_NVME_MULTIPATH=n: connect with attr_qid_max=2, keep direct reads
running on the CPUs that map to the new hw queues, then raise
attr_qid_max to 4. The window is short, so the readers run at
SCHED_FIFO with nvme-wq pinned to their CPUs. Without the patch the
host oopses within two tries in all six boots. With it, 64 of 64 tries
go live and 30 resets under I/O pass, with and without lockdep.

 drivers/nvme/host/rdma.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 07216890f75c..79ef8927d3f0 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -90,6 +90,9 @@ enum nvme_rdma_queue_flags {
 	NVME_RDMA_Q_TR_READY		= 2,
 };
 
+#define NVME_RDMA_OPT_NR_QUEUES(opts) ((opts)->nr_io_queues + \
+	(opts)->nr_write_queues + (opts)->nr_poll_queues + 1)
+
 struct nvme_rdma_queue {
 	struct nvme_rdma_qe	*rsp_ring;
 	int			queue_size;
@@ -576,6 +579,19 @@ static int nvme_rdma_create_queue_ib(struct nvme_rdma_queue *queue)
 	return ret;
 }
 
+static void nvme_rdma_init_queue(struct nvme_rdma_ctrl *ctrl, int idx)
+{
+	struct nvme_rdma_queue *queue = &ctrl->queues[idx];
+
+	queue->ctrl = ctrl;
+	mutex_init(&queue->queue_lock);
+}
+
+static void nvme_rdma_exit_queue(struct nvme_rdma_ctrl *ctrl, int idx)
+{
+	mutex_destroy(&ctrl->queues[idx].queue_lock);
+}
+
 static int nvme_rdma_alloc_queue(struct nvme_rdma_queue *queue)
 {
 	struct nvme_rdma_ctrl *ctrl = queue->ctrl;
@@ -583,7 +599,6 @@ static int nvme_rdma_alloc_queue(struct nvme_rdma_queue *queue)
 	struct sockaddr *src_addr = NULL;
 	int ret;
 
-	mutex_init(&queue->queue_lock);
 	if (idx && ctrl->ctrl.max_integrity_segments)
 		queue->pi_support = true;
 	else
@@ -600,8 +615,7 @@ static int nvme_rdma_alloc_queue(struct nvme_rdma_queue *queue)
 	if (IS_ERR(queue->cm_id)) {
 		dev_info(ctrl->ctrl.device,
 			"failed to create CM ID: %ld\n", PTR_ERR(queue->cm_id));
-		ret = PTR_ERR(queue->cm_id);
-		goto out_destroy_mutex;
+		return PTR_ERR(queue->cm_id);
 	}
 
 	if (ctrl->ctrl.opts->mask & NVMF_OPT_HOST_TRADDR)
@@ -631,8 +645,6 @@ static int nvme_rdma_alloc_queue(struct nvme_rdma_queue *queue)
 out_destroy_cm_id:
 	rdma_destroy_id(queue->cm_id);
 	nvme_rdma_destroy_queue_ib(queue);
-out_destroy_mutex:
-	mutex_destroy(&queue->queue_lock);
 	return ret;
 }
 
@@ -660,7 +672,6 @@ static void nvme_rdma_free_queue(struct nvme_rdma_queue *queue)
 
 	rdma_destroy_id(queue->cm_id);
 	nvme_rdma_destroy_queue_ib(queue);
-	mutex_destroy(&queue->queue_lock);
 }
 
 static void nvme_rdma_free_io_queues(struct nvme_rdma_ctrl *ctrl)
@@ -735,7 +746,6 @@ static int nvme_rdma_setup_io_queues(struct nvme_rdma_ctrl *ctrl,
 	for (i = 0; i < nr_queues; i++) {
 		struct nvme_rdma_queue *queue = &ctrl->queues[first + i];
 
-		queue->ctrl = ctrl;
 		queue->queue_size = queue_size;
 
 		ctxs[i].queue = queue;
@@ -798,7 +808,6 @@ static int nvme_rdma_configure_admin_queue(struct nvme_rdma_ctrl *ctrl,
 	bool pi_capable = false;
 	int error;
 
-	ctrl->queues[0].ctrl = ctrl;
 	ctrl->queues[0].queue_size = NVME_AQ_DEPTH;
 	error = nvme_rdma_alloc_queue(&ctrl->queues[0]);
 	if (error)
@@ -1001,6 +1010,7 @@ static void nvme_rdma_stop_ctrl(struct nvme_ctrl *nctrl)
 static void nvme_rdma_free_ctrl(struct nvme_ctrl *nctrl)
 {
 	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
+	int i, nr_queues = NVME_RDMA_OPT_NR_QUEUES(nctrl->opts);
 
 	if (list_empty_careful(&ctrl->list))
 		goto free_ctrl;
@@ -1011,6 +1021,8 @@ static void nvme_rdma_free_ctrl(struct nvme_ctrl *nctrl)
 
 	nvmf_free_options(nctrl->opts);
 free_ctrl:
+	for (i = 0; i < nr_queues; i++)
+		nvme_rdma_exit_queue(ctrl, i);
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -2284,7 +2296,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 		struct nvmf_ctrl_options *opts)
 {
 	struct nvme_rdma_ctrl *ctrl;
-	int ret;
+	int ret, i;
 
 	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
@@ -2333,8 +2345,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 	INIT_WORK(&ctrl->err_work, nvme_rdma_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_rdma_reset_ctrl_work);
 
-	ctrl->ctrl.queue_count = opts->nr_io_queues + opts->nr_write_queues +
-				opts->nr_poll_queues + 1;
+	ctrl->ctrl.queue_count = NVME_RDMA_OPT_NR_QUEUES(opts);
 	ctrl->ctrl.sqsize = opts->queue_size - 1;
 	ctrl->ctrl.kato = opts->kato;
 
@@ -2343,6 +2354,9 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 	if (!ctrl->queues)
 		goto out_free_ctrl;
 
+	for (i = 0; i < ctrl->ctrl.queue_count; i++)
+		nvme_rdma_init_queue(ctrl, i);
+
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_rdma_ctrl_ops,
 				0 /* no quirks, we're perfect! */);
 	if (ret)

base-commit: 89480d137bf0d943a82c64f86ae2407a15276b5e
-- 
2.43.0

