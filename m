Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD63282F24;
	Sun,  6 Sep 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725758; cv=none; b=Icil6UfXTVjIXURMJNK9tbc/GUcMULYfYG6ClhPYDvTuUoR1fV0HGOxX0h9Pyzx+pxptoGORxyimrLB6UKhxmZeb0Hma174KlP+PAr5A2eYYFNImfVZsSOGElhYmhdEFPvQbER35c2vg1nRaCZn88sKyb32e2JIHv6d9+16/bJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725758; c=relaxed/simple;
	bh=Fz8XG8oQ7bUfEBW6UqfnvmVNdLdAjp8EDeeQ/0TR0VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNtkwOKxUvmZOtnBVROjWTzc+V8GdbnbPZP8JMUPxPuED9/MH6t8Z76IWAjPcPdVdkSzC7gn/zdGCjbOOpeZ0PUuXElA3XbWAcV2Vn8G8VcHHmTz7yzdaZ43k/G11CZraqgTRRc3udGJSv/8PWR2DP34eibBzKwWRrkoz1ZM6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=Fe/NIKly; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="Fe/NIKly"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788725748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYrYFU5rbVzPv6FFpTGXsSRcBGtTs53y69QSHyJzaYg=;
	b=Fe/NIKlyE98soY7EGX/LVxVGmt7l2LHNfQeT/X8r01ydJvBHkgc999ERpy6V8q5e9X8AFh
	0fMd5zH8LqzK8Rs4A5pB4gkc3l97yCQz/Bl3e/tLfw+YIfqp5DanAZJoYAnlMMS0ukiXP5
	J86gk1rV7Bv/Kb9hcJelIS58U0g28PU=
Date: Sun, 06 Sep 2026 22:15:30 +0200
Subject: [PATCH v2 2/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-apple-nvme-t8132-v2-2-ac0328590823@cyberchaos.dev>
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
In-Reply-To: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

Add support for ANS2 NVMe on the Apple t8132 (M4) SoC.

This variant requires the IO queues to be registered using additional
MMIO writes. The qsize of the create_{cq,sq} command is now ignored, and
instead a write to mmio_nvme+0x1210 (which was previously known as
APPLE_ANS_MAX_PEND_CMDS_CTRL) sets the IO queue sizes.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/nvme/host/apple.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c63e28c75766..4621584b1b6f 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -42,7 +42,11 @@
 #define APPLE_ANS_ACQ_DB  0x1004
 #define APPLE_ANS_IOCQ_DB 0x100c
 
-#define APPLE_ANS_MAX_PEND_CMDS_CTRL 0x1210
+#define APPLE_ANS_T8132_IOQ_CMDS 0x1200
+#define APPLE_ANS_T8132_IOQ_CQES 0x1208
+#define APPLE_ANS_T8132_IOQ_SIZE 0x1210
+
+#define APPLE_ANS_T8103_MAX_PEND_CMDS_CTRL 0x1210
 
 #define APPLE_ANS_BOOT_STATUS	 0x1300
 #define APPLE_ANS_BOOT_STATUS_OK 0xde71ce55
@@ -184,6 +188,7 @@ struct apple_nvme_iod {
 
 struct apple_nvme_hw {
 	bool has_lsq_nvmmu;
+	bool needs_ioq_register;
 	u32 max_queue_depth;
 };
 
@@ -1133,9 +1138,16 @@ static void apple_nvme_reset_work(struct work_struct *work)
 			anv->mmio_nvme + APPLE_ANS_LINEAR_SQ_CTRL);
 
 		/* Allow as many pending command as possible for both queues */
-		writel(anv->hw->max_queue_depth
-			| (anv->hw->max_queue_depth << 16), anv->mmio_nvme
-			+ APPLE_ANS_MAX_PEND_CMDS_CTRL);
+		if (!anv->hw->needs_ioq_register) {
+			/*
+			 * Since T8132, this is replaced by IOQ_SIZE which is
+			 * located at the same offset and is handled with the
+			 * IO queue setup further below.
+			 */
+			writel(anv->hw->max_queue_depth
+				| (anv->hw->max_queue_depth << 16), anv->mmio_nvme
+				+ APPLE_ANS_T8103_MAX_PEND_CMDS_CTRL);
+		}
 
 		/* Setup the NVMMU for the maximum admin and IO queue depth */
 		writel(anv->hw->max_queue_depth - 1,
@@ -1190,6 +1202,16 @@ static void apple_nvme_reset_work(struct work_struct *work)
 	if (ret)
 		goto out_remove_cq;
 
+	if (anv->hw->needs_ioq_register) {
+		writeq(anv->ioq.cq_dma_addr,
+			anv->mmio_nvme + APPLE_ANS_T8132_IOQ_CQES);
+		writeq(anv->ioq.sq_dma_addr,
+			anv->mmio_nvme + APPLE_ANS_T8132_IOQ_CMDS);
+		writel((anv->hw->max_queue_depth - 1)
+			| ((anv->hw->max_queue_depth - 1) << 16), anv->mmio_nvme
+			+ APPLE_ANS_T8132_IOQ_SIZE);
+	}
+
 	apple_nvme_init_queue(&anv->ioq);
 	nr_io_queues = 1;
 	ret = nvme_set_queue_count(&anv->ctrl, &nr_io_queues);
@@ -1699,17 +1721,26 @@ static DEFINE_SIMPLE_DEV_PM_OPS(apple_nvme_pm_ops, apple_nvme_suspend,
 
 static const struct apple_nvme_hw apple_nvme_t8015_hw = {
 	.has_lsq_nvmmu = false,
+	.needs_ioq_register = false,
 	.max_queue_depth = 16,
 };
 
 static const struct apple_nvme_hw apple_nvme_t8103_hw = {
 	.has_lsq_nvmmu = true,
+	.needs_ioq_register = false,
+	.max_queue_depth = 64,
+};
+
+static const struct apple_nvme_hw apple_nvme_t8132_hw = {
+	.has_lsq_nvmmu = true,
+	.needs_ioq_register = true,
 	.max_queue_depth = 64,
 };
 
 static const struct of_device_id apple_nvme_of_match[] = {
 	{ .compatible = "apple,t8015-nvme-ans2", .data = &apple_nvme_t8015_hw },
 	{ .compatible = "apple,t8103-nvme-ans2", .data = &apple_nvme_t8103_hw },
+	{ .compatible = "apple,t8132-nvme-ans2", .data = &apple_nvme_t8132_hw },
 	{ .compatible = "apple,nvme-ans2", .data = &apple_nvme_t8103_hw },
 	{},
 };

-- 
2.55.0

