Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5046AA7C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297219; cv=none; b=od9noEH+7DEVK/MNbo/kItz5eb0QuuJymtoCt9hnMuBDq+msJqUa2E4XoAW8h0AnAL9NRYXc0wcqhN0cqzWMtvSTIrVxdhmyHmA/+YuaLJSWbK6V8RLyqG5+seB0KlbPKLfxlamWHJ+NtOP3OO3UzT1relozcjvUKM0ZrT5NaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297219; c=relaxed/simple;
	bh=ZCDjo9b3IFmT4+oCvqwHPhq0H2sUKPMLVyRJ8oA+Prw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LIYID8Vrb/c+9zrrPEZ1iTjevF9lOgjV+MDrKN8O7Pp12WpI69DRAuxKtgDXR7T+si79D02RP6vcM2flkRI4d5EVzdMzq+ka8zuk3v4y2diLVkjUyOxevlSTBU6uUcKEg04fajh23XK2p+kpgXztr/L6EhKyoSwZUmNSUEDqkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5rOtIj0; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5rOtIj0"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso4293678c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791297215; x=1791902015; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kI6agDxL1eh8YPLkDIP44zBbj716g5bLAuc2cGCeaR4=;
        b=Y5rOtIj0KF0J1f5JtH+CPGrN/fX3vhvDeRlxOGI/6czXbuwPvAHmvhnBRa4yZFENAi
         C8j/7n0j90GTmfL4AjUDvdQx+e/QPiszouTcY4mdsCsv2uEpX1ykW6lgqQXzE6GL6zK1
         vruBpvCgpDJ/E8lleRcAf1RR6210YeiuYQXrWbKNFp34O2Y6SwEFUZHrhu33f+hiNh7f
         YXJbn0W2tUAUd5UypuC3YpVcmJ6VXPEJRA5t9qGSFM/ej7NOi3ah7xRAo1E89OD0GL6d
         7OKwAdF4D79QhRjbcOkyrKTs2nEFY0f7jrdUNDY33TtA3LAiWKWdTmvsqYZEnkQaWykv
         +Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297215; x=1791902015;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kI6agDxL1eh8YPLkDIP44zBbj716g5bLAuc2cGCeaR4=;
        b=vOyIBpufL8yVi1WygyVdijHv5vezAoGIQ4SNKpgmggEtCLwTXlfvVNgTfsMkeqIqcW
         tJjGDUz/YWrp7euu5HFndtt3Ldzg9ruoRJPS9FdzqUERP6MQGxB7rPYbIbuDwHPw8vJr
         ydyNMoh4yIyIpCgmF5t29liXur9UJy5OIjF378taaFYg2gWR6HYJaaX4bNrayyROtWxN
         BBwyOvCXB4fmhq3FDTnGheP6Vc7TL8KtkH1zrEZxcjUTsz8tL7q9QzvdGOvbQPkubUPI
         Q8w60fkFJkMszIumAQBG7DXC0kHY3w4emqU3StzaNOZIUouGbGc/4jIUFfM1snXaBBJN
         w+zg==
X-Forwarded-Encrypted: i=1; AKwUvBzgo7sdx64Ez9zMOs4CLA5WevgJ6DlMBCov0lAitcJId4itH+Nnt7LXoT7CCazlP+qn7wAybsiJmBn0JDg=@vger.kernel.org
X-Gm-Message-State: AFuF++mVfw5S4nbTQH2LdVl4zpevhjsVbQA2PPahegbSM/SebIgDdW6+
	wfKrIb/WxsSq80vL0/YpXBjXYRvILqQft9rMQyDWXe4MTe7gCEe3uC02jv/1HMiyCTqOMrgCbRA
	0zRCowmqZkw==
X-Received: from dlbou16.prod.google.com ([2002:a05:7022:1110:b0:14d:a680:6081])
 (user=afranji job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2506:b0:156:3684:96d4
 with SMTP id a92af1059eb24-15eca26aa8amr1928661c88.25.1791297214392; Tue, 06
 Oct 2026 07:33:34 -0700 (PDT)
Date: Tue,  6 Oct 2026 14:33:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006143329.2415252-1-afranji@google.com>
Subject: [RFC PATCH] nvme-pci: defer batch completion to unbound workqueue for SWIOTLB
From: Ryan Afranji <afranji@google.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Petr Tesarik <ptesarik@suse.com>, 
	Luigi Rizzo <lrizzo@google.com>, linux-nvme@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ryan Afranji <afranji@google.com>
Content-Type: text/plain; charset="UTF-8"

High-bandwidth NVMe read workloads when SWIOTLB bounce buffering is
forced enabled (e.g. all confidential VMs) can cause guest CPU
soft lockups.

The root cause is that each NVMe queue has a dedicated interrupt vector
pinned to a single vCPU. During I/O read completions, the interrupt
handler executes on that pinned vCPU and invokes
nvme_pci_complete_batch(), which unmaps requests via
nvme_pci_unmap_rq(). When SWIOTLB bounce buffering is active, DMA
unmapping performs CPU-heavy memory copies to transfer data from
shared/unencrypted bounce buffers to private guest memory. As read
throughput scales, this memory copying saturates 100% of the pinned
vCPU's execution time in hard IRQ context, starving other kernel threads
and watchdogs, leading to soft lockup stalls.

While increasing the number of NVMe queues and reducing queue depth in
the VMM mitigates the issue by distributing the SWIOTLB bounces across
more vCPUs, it is only a temporary workaround: expensive compute work
remains inside the hard IRQ handler, and next-generation storage or
faster host platforms will still saturate the assigned cores.

Address this by deferring completion batch processing out of the hard
IRQ handler into an unbound, high-priority workqueue (swiotlb_wq,
allocated with WQ_HIGHPRI | WQ_UNBOUND). Allocate a dedicated workqueue
for each NVMe I/O queue to limit workqueue lock contention.

Introduce a module parameter 'force_bounce_swiotlb_wq'. When enabled,
nvme_irq() packages the io_comp_batch into a work item and defers
nvme_pci_complete_batch() to the queue's swiotlb_wq. If the atomic
allocation of the deferred work item fails, it falls back to immediate
in-IRQ completion.

Deferring completion to an unbound workqueue provides two key benefits:
1. Work executes in worker thread context at lower priority, allowing
   watchdog and other kernel threads to run thus preventing soft
   lockups.
2. The unbound workqueue allows the kernel scheduler to distribute
   bounce-buffer copy work across any available vCPU rather than
   bottlenecking the single vCPU pinned to the NVMe interrupt.

Across 40 consecutive test runs under high-bandwidth workloads, baseline
in-IRQ completions frequently suffered soft lockups, whereas the
deferred workqueue implementation completely eliminated them.

The benchmark results in the tables below compare performance with this
feature enabled against the existing implementation ('+' indicates
performance improvement, '-' indicates regression):

  4 vCPUs (2 Queues)
  Metric                      p5        p50
  =========================================
  IOPS                    +7.59%     +4.05%
  Bandwidth               +1.53%     +1.18%
  Latency (clat p50)     -10.41%     -3.88%
  Latency (clat p90)      +1.74%     +5.51%
  Latency (clat p99.9)   +16.44%     +9.86%

  176 vCPUs (4 Queues)
  Metric                      p5        p50
  =========================================
  IOPS                   +90.32%    +93.32%
  Bandwidth               +9.57%    +10.68%
  Latency (clat p50)      -9.58%     -8.70%
  Latency (clat p90)      -9.91%     -7.51%
  Latency (clat p99.9)    -8.00%     +4.58%

Signed-off-by: Ryan Afranji <afranji@google.com>
---
 drivers/nvme/host/pci.c | 61 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9..a20d6bd12ef0 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -24,6 +24,7 @@
 #include <linux/suspend.h>
 #include <linux/t10-pi.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/sed-opal.h>
@@ -277,6 +278,11 @@ static bool noacpi;
 module_param(noacpi, bool, 0444);
 MODULE_PARM_DESC(noacpi, "disable acpi bios quirks");
 
+static bool force_bounce_swiotlb_wq;
+module_param(force_bounce_swiotlb_wq, bool, 0644);
+MODULE_PARM_DESC(force_bounce_swiotlb_wq,
+		 "Defer NVMe completion batch to swiotlb_wq");
+
 struct nvme_dev;
 struct nvme_queue;
 
@@ -395,6 +401,7 @@ struct nvme_queue {
 	__le32 *dbbuf_sq_ei;
 	__le32 *dbbuf_cq_ei;
 	struct completion delete_done;
+	struct workqueue_struct *swiotlb_wq;
 };
 
 /* bits for iod->flags */
@@ -1541,6 +1548,35 @@ static void nvme_pci_complete_batch(struct io_comp_batch *iob)
 	nvme_complete_batch(iob, nvme_pci_unmap_rq);
 }
 
+struct nvme_pci_complete_batch_work {
+	struct work_struct work;
+	struct io_comp_batch iob;
+};
+
+static void nvme_pci_complete_batch_work_fn(struct work_struct *work)
+{
+	struct nvme_pci_complete_batch_work *w =
+		container_of(work, struct nvme_pci_complete_batch_work, work);
+
+	nvme_pci_complete_batch(&w->iob);
+	kfree(w);
+}
+
+static void nvme_pci_complete_batch_deferred(struct nvme_queue *nvmeq,
+					     struct io_comp_batch iob)
+{
+	struct nvme_pci_complete_batch_work *w;
+
+	w = kmalloc_obj(*w, GFP_ATOMIC);
+	if (w) {
+		INIT_WORK(&w->work, nvme_pci_complete_batch_work_fn);
+		w->iob = iob;
+		queue_work(nvmeq->swiotlb_wq, &w->work);
+	} else {
+		nvme_pci_complete_batch(&iob);
+	}
+}
+
 /* We read the CQE phase first to check if the rest of the entry is valid */
 static inline bool nvme_cqe_pending(struct nvme_queue *nvmeq)
 {
@@ -1644,8 +1680,12 @@ static irqreturn_t nvme_irq(int irq, void *data)
 	DEFINE_IO_COMP_BATCH(iob);
 
 	if (nvme_poll_cq(nvmeq, &iob)) {
-		if (!rq_list_empty(&iob.req_list))
-			nvme_pci_complete_batch(&iob);
+		if (!rq_list_empty(&iob.req_list)) {
+			if (force_bounce_swiotlb_wq && nvmeq->swiotlb_wq)
+				nvme_pci_complete_batch_deferred(nvmeq, iob);
+			else
+				nvme_pci_complete_batch(&iob);
+		}
 		return IRQ_HANDLED;
 	}
 	return IRQ_NONE;
@@ -2026,6 +2066,10 @@ static enum blk_eh_timer_return nvme_timeout(struct request *req)
 static void nvme_free_queue(struct nvme_queue *nvmeq)
 	__context_unsafe(/* frees queue which is no longer in use */)
 {
+	if (nvmeq->swiotlb_wq) {
+		destroy_workqueue(nvmeq->swiotlb_wq);
+		nvmeq->swiotlb_wq = NULL;
+	}
 	dma_free_coherent(nvmeq->dev->dev, CQ_SIZE(nvmeq),
 				(void *)nvmeq->cqes, nvmeq->cq_dma_addr);
 	if (!nvmeq->sq_cmds)
@@ -2065,6 +2109,8 @@ static void nvme_suspend_queue(struct nvme_dev *dev, unsigned int qid)
 		nvme_quiesce_admin_queue(&nvmeq->dev->ctrl);
 	if (!test_and_clear_bit(NVMEQ_POLLED, &nvmeq->flags))
 		pci_free_irq(to_pci_dev(dev->dev), nvmeq->cq_vector, nvmeq);
+	if (nvmeq->swiotlb_wq)
+		flush_workqueue(nvmeq->swiotlb_wq);
 }
 
 static void nvme_suspend_io_queues(struct nvme_dev *dev)
@@ -2158,9 +2204,15 @@ static int nvme_alloc_queue(struct nvme_dev *dev, int qid, int depth)
 	if (!nvmeq->cqes)
 		goto free_nvmeq;
 
-	if (nvme_alloc_sq_cmds(dev, nvmeq, qid))
+	nvmeq->swiotlb_wq = alloc_workqueue("nvme%dq%d-swiotlb-wq",
+					    WQ_HIGHPRI | WQ_UNBOUND, 0,
+					    dev->ctrl.instance, qid);
+	if (!nvmeq->swiotlb_wq)
 		goto free_cqdma;
 
+	if (nvme_alloc_sq_cmds(dev, nvmeq, qid))
+		goto free_wq;
+
 	nvmeq->dev = dev;
 	spin_lock_init(&nvmeq->sq_lock);
 	spin_lock_init(&nvmeq->cq_poll_lock);
@@ -2172,6 +2224,9 @@ static int nvme_alloc_queue(struct nvme_dev *dev, int qid, int depth)
 
 	return 0;
 
+ free_wq:
+	destroy_workqueue(nvmeq->swiotlb_wq);
+	nvmeq->swiotlb_wq = NULL;
  free_cqdma:
 	dma_free_coherent(dev->dev, CQ_SIZE(nvmeq), (void *)nvmeq->cqes,
 			  nvmeq->cq_dma_addr);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

