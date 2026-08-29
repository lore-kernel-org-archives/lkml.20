Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57389378D9C;
	Sat, 29 Aug 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020022; cv=none; b=OMHDkoIdAiQtNHL1jcV5k74tALmR4rQY781sQCox+NDEeqBnjP0Kf5G6kn+PKXiEhb6O5FHKVVvA7IMKTQkN5gphZ+JOa99yIpKbUZB8odSSDMm9Faj92BZsSLZZlfToStKfuf1fe4m6Mtf7lrOxdM0dZShx8/b1b+kCwsgZ8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020022; c=relaxed/simple;
	bh=fUlgM8CnOaMuuPMrcomCp9ui1YL6CpR0aSOVxgfXuJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoigoPPTemOJS1CR92/4Ks+nOgAcZRuToc/6FEFhFWC++gYkjMrzgUeHEWOOM7Nd32//liYrxzQLlffImE7lCD0AoOKpvmc+a9aqr/I2m3OJMGPrAv92F68qWbVEm5WqFn/qTNHPle1csii5K3QpPifB8meJiIwV+64UhGgRFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U8L2Xle5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lDKobK1p; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U8L2Xle5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lDKobK1p"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788020015; bh=LtJ/Ds2CVtR9ucuRy9u7b2Z
	AymSZP9fehyNnyo9s5JU=; b=U8L2Xle58YRW+5uhvbg4ehl7xK7Z7qeDqR5jMv9hDs75v1z5C/
	XphkXv9P1L4kpskOuPWM3vIqSioXpq5aPxWL2vxmYCNVGdwAP+Ojp+JjDHxQirsL1TP3fkWAiwu
	4c8dyzGnNrhPiClcOLzO6cwRN11RwsAytY+R3EvHdsEpskeFfhcz8GyJ+5SOYJnmgBbZMj5I6ZQ
	2BjqDTkWDqAvGFBksHBArHJgcIu+jjV8JsQEil5oR489WorZMtYSlxjCOWcqVm5OWNXvmg93Gij
	MaTmnUAbcSaipWZczEju2aWevWIXyt10RbBiOm+NM5zIqiqhFdZhfsFYMvlmAa4awfg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788020015; bh=LtJ/Ds2CVtR9ucuRy9u7b2Z
	AymSZP9fehyNnyo9s5JU=; b=lDKobK1pxKM1yWXeWvN4kysJyHL3XRQ1n5C72t1WoTQ2aeqlig
	lIlq7RZM3MFrRg+JYxxOgBJa22hD9a+zsZAw==;
From: Bradley Morgan <include@grrlz.net>
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 1/5] media: ivtv: convert to kthread_run_worker
Date: Sat, 29 Aug 2026 16:13:35 +0000
Message-ID: <20260829161336.17646-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829161150.16301-1-include@grrlz.net>
References: <20260829161150.16301-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

Embedding a kthread_worker and running kthread_worker_fn yourself is
the old way. Convert ivtv to kthread_run_worker(), dropping the
separate irq_worker_task pointer.

This is part of removing the worker->task self-assignment in
kthread_worker_fn().

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 14 ++++++--------
 drivers/media/pci/ivtv/ivtv-driver.h |  3 +--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index b9ea56ec9593..6f0e0e46deb5 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -703,15 +703,13 @@ static int ivtv_init_struct1(struct ivtv *itv)
 	spin_lock_init(&itv->lock);
 	spin_lock_init(&itv->dma_reg_lock);
 
-	kthread_init_worker(&itv->irq_worker);
-	itv->irq_worker_task = kthread_run(kthread_worker_fn, &itv->irq_worker,
-					   "%s", itv->v4l2_dev.name);
-	if (IS_ERR(itv->irq_worker_task)) {
+	itv->irq_worker = kthread_run_worker(0, "%s", itv->v4l2_dev.name);
+	if (IS_ERR(itv->irq_worker)) {
 		IVTV_ERR("Could not create ivtv task\n");
 		return -1;
 	}
 	/* must use the FIFO scheduler as it is realtime sensitive */
-	sched_set_fifo(itv->irq_worker_task);
+	sched_set_fifo(itv->irq_worker->task);
 
 	kthread_init_work(&itv->irq_work, ivtv_irq_work_handler);
 
@@ -1232,7 +1230,7 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	v4l2_ctrl_handler_free(&itv->cxhdl.hdl);
 	exit_ivtv_i2c(itv);
 free_worker:
-	kthread_stop(itv->irq_worker_task);
+	kthread_destroy_worker(itv->irq_worker);
 err:
 	if (retval == 0)
 		retval = -ENODEV;
@@ -1372,8 +1370,8 @@ static void ivtv_remove(struct pci_dev *pdev)
 	timer_shutdown_sync(&itv->dma_timer);
 
 	/* Kill irq worker */
-	kthread_flush_worker(&itv->irq_worker);
-	kthread_stop(itv->irq_worker_task);
+	kthread_flush_worker(itv->irq_worker);
+	kthread_destroy_worker(itv->irq_worker);
 
 	ivtv_streams_cleanup(itv);
 	ivtv_udma_free(itv);
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index 000e8beecc7c..091bc44f13bc 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -668,8 +668,7 @@ struct ivtv {
 	/* Interrupts & DMA */
 	u32 irqmask;                    /* active interrupts */
 	u32 irq_rr_idx;                 /* round-robin stream index */
-	struct kthread_worker irq_worker;		/* kthread worker for PIO/YUV/VBI actions */
-	struct task_struct *irq_worker_task;		/* task for irq_worker */
+	struct kthread_worker *irq_worker;		/* kthread worker for PIO/YUV/VBI actions */
 	struct kthread_work irq_work;	/* kthread work entry */
 	spinlock_t dma_reg_lock;        /* lock access to DMA engine registers */
 	int cur_dma_stream;		/* index of current stream doing DMA (-1 if none) */
-- 
2.47.3

