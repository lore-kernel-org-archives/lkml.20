Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687584;
	b=u0YeMyFHcB6Lle5KkAFPIQwU/+fKJ2X6PnhKHWW+9PsKU2P+KAnnMShp/SqNq45tcOzC
	 DASGgdafvwZfpqc4pY4mJ0ps5E6mp3vqvG6p0TFNQTrPWXokrSMGO1tNPJF2isDjg0Nwa
	 WXXXyf1dvu10rrP6jSfpYcKqY4AEDwKIS3bzKY2oUmZ1cBpBQvGDzR3/V4wdYMyu4drc+
	 34Y0E6bLLXie/w0Zv5B3m6q8lrnEDSoGJNakznc56BTqwI/bVVN20Yj14GsCxZo1TD3Xz
	 D7yqr1/f62zvu1aCSabB7Ndq8tC+brX6FTSCPzqCHMkdfvxHi0mUNUOsPLfQ7aNMIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687584;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qfAtoIcGCBg87uuZW1y9XaJODikXP+EnVxZyeJ9W7jc=;
	b=ChF0CfiDEsTSptTUeZMPwICQiN7f2m0PVJfe+Xkavi3oA/m7jN49tb4IjReYqr2CGO8d
	 jNnXqJHQahzL/Y7BLqg5KOclLDEzcUauLVRAccb4HhYCssWXH8V05OICULiW0hewhdYCk
	 OviP6jclKV0jJWXP4vvkcEgZMb0beoVuP9fHaLuDMchWePoUaK9fuT5Vmd9ec/dALqly1
	 P5avZtR2KSxOhO8fb3UwVo2uzDpLEdnHEZu2v10Gs/Z3TfqSz7BJsZDLTKM2PgUJLJe9o
	 UVlIym1SbatG9qUIR2FOdR6ZmcU2w7Z5SnrUUyOhyknOOS9LsLIC98sZ+oAzPawN+/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.75
Received: from out28-75.mail.aliyun.com (out28-75.mail.aliyun.com [115.124.28.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D56606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D56606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.9170154|0.100999;CH=green;DM=|AD|false|;DS=CONTINUE|ham_alarm|0.00322135-0.00151948-0.995259;FP=11438868440337108543|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=liaoxuan@open-hieco.net;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.jvPeWBu_1793687571;
Received: from Ubuntu2404-XLH.hygon.cn(mailfrom:liaoxuan@open-hieco.net fp:SMTPD_---.jvPeWBu_1793687571 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 14:32:57 +0800
From: Liao Xuan <liaoxuan@open-hieco.net>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liao Xuan <liaoxuan@open-hieco.net>
Subject: [PATCH] nvme-pci: Fix performance regression with completion batching for Hygon processors
Date: Tue,  3 Nov 2026 14:32:49 +0800
Message-ID: <20261103063249.3212198-1-liaoxuan@open-hieco.net>
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

Commit 4f5022453acd ("nvme: wire up completion batching for the IRQ path")
introduced completion batching to the NVMe IRQ handling path. While this
change brings performance gains on mainstream platforms, it causes a
severe random read performance regression on Hygon platforms.

The batching logic defers CQE processing until after the doorbell is
written. On Hygon microarchitectures, this specific execution order
accelerates the NVMe controller's interrupt generation. This leads to an
interrupt storm: the overall interrupt count increases significantly,
and each interrupt handles fewer CQEs. Consequently, a massive amount of
CPU cycles are consumed by the fixed overhead of interrupt entry/exit
rather than useful I/O processing, drastically degrading random read
efficiency.

Interrupt statistics were collected on a Hygon platform using a 10-second
workload of 16 jobs with 4 KiB random reads:
With batching: average IOPS ~2.29M; interrupts per queue ~1.82M
Without batching: average IOPS ~2.89M; interrupts per queue ~1.52M

By restoring the single-completion fast path, the interrupt rate is
reduced by ~16%, eliminating the interrupt storm.

Performance results (fio 4k randread, 16 jobs) show
significant improvements across various CPU pinning topologies:

CPU Pinning     | With Batching (kops) | This Patch (kops) | Improvement
0-15,128-143    | 1,747.9              | 2,053.9           | +17.5%
0-11,128-139    | 1,939.8              | 2,437.6           | +25.7%
0-7,128-135     | 2,341.9              | 2,891.3           | +23.5%
0-15            | 1,754.1              | 2,018.6           | +15.1%
0-11            | 2,051.2              | 2,510.5           | +22.4%

It is worth noting that this issue is not necessarily exclusive to Hygon
CPUs. Architectures with higher interrupt latency or lower overall
performance characteristics may also suffer from similar regressions,
where the overhead of the batching fast path outweighs the benefit of
amortizing the doorbell write.

Instead of hardcoding a permanent revert, introduce a flag 'use_comp_batch'
and disable IRQ completion batching if running on a Hygon CPU. This
preserves the performance benefits for platforms that favor batching
while restoring the optimal single-completion fast path for Hygon, and
provides a scalable mechanism to disable it on other affected platforms
in the future.

Fixes: 4f5022453acd ("nvme: wire up completion batching for the IRQ path")
Signed-off-by: Liao Xuan <liaoxuan@open-hieco.net>
---
 drivers/nvme/host/pci.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 69932d640..a3ecbac40 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -276,6 +276,15 @@ static bool noacpi;
 module_param(noacpi, bool, 0444);
 MODULE_PARM_DESC(noacpi, "disable acpi bios quirks");
 
+static bool use_comp_batch __ro_after_init = true;
+static void nvme_setup_comp_batch(void)
+{
+#ifdef CONFIG_X86
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
+		use_comp_batch = false;
+#endif
+}
+
 struct nvme_dev;
 struct nvme_queue;
 
@@ -1630,8 +1639,11 @@ static inline bool nvme_poll_cq(struct nvme_queue *nvmeq,
 static irqreturn_t nvme_irq(int irq, void *data)
 {
 	struct nvme_queue *nvmeq = data;
-	DEFINE_IO_COMP_BATCH(iob);
 
+	if (!use_comp_batch)
+		return nvme_poll_cq(nvmeq, NULL) ? IRQ_HANDLED : IRQ_NONE;
+
+	DEFINE_IO_COMP_BATCH(iob);
 	if (nvme_poll_cq(nvmeq, &iob)) {
 		if (!rq_list_empty(&iob.req_list))
 			nvme_pci_complete_batch(&iob);
@@ -3767,6 +3779,8 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dev_info(dev->ctrl.device, "pci function %s\n", dev_name(&pdev->dev));
 
+	nvme_setup_comp_batch();
+
 	result = nvme_pci_enable(dev);
 	if (result)
 		goto out_release_iod_mempool;
-- 
2.43.0

