Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3E418A58
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810775; cv=none; b=gqRJNBfwK6cdaKOAjoL5+yoaeMG82H6j3lM6flnYIK3zVCEXeOsZaVWGGYF7yvp2TgqyzFPpdrg2NXT0sQ5MDtA3w0ANJQWbOURXWF+SgKOj4O/UNzT1ikSXpGA99BPh4XNNnYYbSTwyzk1hKBLMuuyjgr//w9bmT+0m3bkxx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810775; c=relaxed/simple;
	bh=/EJ+DQuNqyrcTr+dd/Ap+TjS0UWbvdYfhZZrmMS78Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mg9uMXGsJPezRhp9gheXNdDAjTCX4D4Q9vQSenAWqzbiprwonjdm3KY6aqYUBq3/ptWFJbBlNUGPYw71FUgUyTDpY55J8ACqnAtYXxiJWRbavTMFRXmHF/L7bUafk4SmDv41gxhe/iM9fM7yKq9F8JaxlE67Ztb/HQ+kwZ09IGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=j4z8AxjC; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="j4z8AxjC"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cdbe2306;
	Tue, 8 Sep 2026 03:52:41 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu/vsi: Fix use-after-free during module unload
Date: Tue,  8 Sep 2026 03:52:28 +0800
Message-Id: <20260907195228.812227-1-lhfff@tju.edu.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aa503065-cd97-47cd-894c-bd660e59f5f9@collabora.com>
References: <aa503065-cd97-47cd-894c-bd660e59f5f9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07d6e14e803a1kunm408e707cee41e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx8YVkxOHR5OH0MaHU0dSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=j4z8AxjCQ+0txI1BX4NpODfWoiCg7e5P+a76FfB6iHwZjzFJKZCMRlE5RwjGkezQfs2vFbBHF0NPIW+sc1vke2J3p022qyqm1qq7zGcYq2YjZjWSu6a9FG7tmnQ3wJF0E6kUoWIdMl0Vo6B1fgJ21IiKr7a9If+yFYZg393qGX0=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=utgMQwCRZ/2sfUZlNY8pDupsLx5WjB3e1uON7aK5Q40=;
	h=date:mime-version:subject:message-id:from;

iommu_device_register() links the embedded iommu_device into the IOMMU
core's global device list. The VSI driver can be built as a module, but
has no remove callback to unregister the device before devres frees the
containing struct vsi_iommu.

With no attached consumer holding a module reference, unloading
vsi-iommu.ko succeeds. A later platform device registration enters the
IOMMU bus notifier and scans the stale list entry. KASAN reports a
slab-use-after-free in __iommu_probe_device().

The missing unregister operation on driver unbind was also noted during
review of the driver's fwnode lookup lifetime handling.

Add the missing remove callback. Unregister the IOMMU device and remove
its sysfs object while the provider is still alive, then force runtime
suspend and unprepare the clocks acquired during probe. Leave the IRQ
and other managed resources to devres teardown.

The failure was reproduced with real module load and unload syscalls.
With the same KASAN kernel, the unmodified driver produced two invalid
reads from the same freed list entry. The patched driver removed the
entry, completed the later device registration and produced no KASAN,
WARNING, Oops or panic.

The remove callback also builds with W=1 for arm64 with
ARCH_ROCKCHIP=y and CONFIG_PM=y, and for the arm64 COMPILE_TEST path
with CONFIG_PM=n.

A standalone reproducer, the vulnerable and fixed serial logs, and
their checksums are available at:

https://github.com/kimaiden1984-boop/linux-vsi-iommu-unload-uaf-reproducer

Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
Link: https://lore.kernel.org/0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com/
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
Changes in v2:
- Drop devm_free_irq() and leave managed IRQ teardown to devres.
- Re-run the KASAN A/B test and arm64 PM-enabled and PM-disabled builds.

v1: https://lore.kernel.org/all/20260905183834.3447662-1-lhfff@tju.edu.cn/

 drivers/iommu/vsi-iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
index 42c424496d07..f73bcc82c472 100644
--- a/drivers/iommu/vsi-iommu.c
+++ b/drivers/iommu/vsi-iommu.c
@@ -728,6 +728,16 @@ static int vsi_iommu_probe(struct platform_device *pdev)
 	return err;
 }
 
+static void vsi_iommu_remove(struct platform_device *pdev)
+{
+	struct vsi_iommu *iommu = platform_get_drvdata(pdev);
+
+	iommu_device_unregister(&iommu->iommu);
+	iommu_device_sysfs_remove(&iommu->iommu);
+	pm_runtime_force_suspend(&pdev->dev);
+	clk_bulk_unprepare(iommu->num_clocks, iommu->clocks);
+}
+
 static void vsi_iommu_shutdown(struct platform_device *pdev)
 {
 	struct vsi_iommu *iommu = platform_get_drvdata(pdev);
@@ -776,6 +786,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(vsi_iommu_pm_ops,
 
 static struct platform_driver rockchip_vsi_iommu_driver = {
 	.probe = vsi_iommu_probe,
+	.remove = vsi_iommu_remove,
 	.shutdown = vsi_iommu_shutdown,
 	.driver = {
 		   .name = "vsi_iommu",
