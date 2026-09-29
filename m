Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF9443C27
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653557; cv=none; b=LZ0fjv38cdHQhVRi1hYOQaZCD/PZee/4HHUMxbOq4FCIpKQCTZrGe0gY5ztvaVMz4tzbEUd4kp4BNUIohhzsnMydM1mbKRFLh+CIDk4c0vj+An0pLxzB0wLFrCJbPSNA3ZXWJOci3E5RWl05CRmpfCdQ2ApfCxiTA3YrPrrVMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653557; c=relaxed/simple;
	bh=xKzOlxV1mbMqlPwZGhd+MrehSrrNxk9EFSUjk86veO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JykNZzoSPJI0HrogwKeX5GplnL9oSoP1UOwz+WKZlODfFdMpZmEgsLEzPB83PcqKhERwGGRxOW1KTaTcbf+reQVQhrRV8BgWOf1gEzdvzJAMxGebDFuMNFbiQkSmih3gjHP8zK9WoF0OmjuZs8tw3k5khGQh6bhDVh9VSCw5GV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VqLlyPRp; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqLlyPRp"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6595338a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653554; x=1791258354; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=;
        b=VqLlyPRpGnwf6VC5R/F2b7dnT5NJ53CXvuwEStE0M1Wqrud5cj3zkwTDz9CfL68jmC
         WylxYpe+pR0Vwk6ViXUhwQM5Xhd/PESiEmVB/D4IPbVDCL4o9RVxipgQnRmzBdoHa49O
         qN7OW7Qbw9DMXpXD1BCKMwQmX2VL82lxd/84t6ho/iHwAoFyx/MsNmxlHstGtYBWfTdi
         xUDHrhL2R31HQauWQzdBmsMp7hDUYxmCpWNQVLH0hJk13YylxHBg3enkk6xWHWB406ib
         vHebC/d5nRsd/hZ9Q+Ul3kq7KXL1A58Tx7BLMERcVv4nrUUR9WFpL/ov8uUcsbUZ24F+
         pymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653554; x=1791258354;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=;
        b=jNg46j3Aak45D8fryST6JV+TzkyyMQtNdbyAbGQD0qwQbexOqS72/Y6hKpBUSmFdC9
         /Pp3eZhPk0XArUT79/wodPsNd1cn24Zpdh80YnX0f6FTKqy7UQ4/zsD/izL3g52WuRxz
         c+FwXG69Be8cd1d5bU33O6JJ3Y0hNaCZ9Azi9WAqTO3u2dPfKal4IzSRzD+IjZ6/4kYD
         FoD5g4ZRmV6yhxor7mISyKSUCQItzaJ3FFzm6Z1UuLgKGZc6p5OVHsNdOTTCDotKa0vR
         3ntj530NlvxEUprjfHFE49r9Z6YksoSUh5m+d29J3NyK2jBr4qMvDPEJV+CIF99jJYZC
         teBA==
X-Forwarded-Encrypted: i=1; AKwUvBx9qCVbtd31GpXplMSYKbw02GlU2fi/ePg9BM8oZJxvCi5EyzyXKvp4Sl+miqtf2OARs9TQko+jaRAJpDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpH84YglGjRlntTdilqQOisXX/rm0YyjrUU0KCIGVQMw/Hgyzs
	ATU+TeJ4L7XJSBvAGq1cY8PHoPCluB1m1nCg6N/KeqJuvKEqnCO3zLFfWl2yd39iWfXfWiTllOI
	CWQ==
X-Received: from pgce10.prod.google.com ([2002:a05:6a02:1ca:b0:cc7:9b89:2a8d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c1:b0:39e:6c68:c77b
 with SMTP id 98e67ed59e1d1-3a098e078b8mr13128801a91.49.1790653554263; Mon, 28
 Sep 2026 20:45:54 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:08 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-15-praan@google.com>
Subject: [PATCH v11 14/16] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable PM runtime for SMMUs having a power-domain during smmu probe.
Add a devlink between the clients and SMMU device. The absence of a
power domain effectively disables runtime power management.

Additionally, handle runtime PM teardown in arm_smmu_disable_action()
and skip MMIO accesses during teardown and shutdown if the SMMU is
already runtime suspended, as translation is already disabled and the
hardware is in a low-power state.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 49 +++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e127e3be3a6b..2a1b5ce6ff1c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4511,8 +4511,28 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	if (ret)
 		goto err_disable_pasid;
 
+	/*
+	 * If linking fails on an RPM-enabled SMMU, abort probe to prevent
+	 * DMA transactions while the SMMU is autosuspended. Otherwise, warn
+	 * and continue since the SMMU is always powered.
+	 */
+	if (!device_link_add(dev, smmu->dev,
+			     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER)) {
+		if (pm_runtime_enabled(smmu->dev)) {
+			dev_err(smmu->dev, "failed to add devlink to %s\n",
+				dev_name(dev));
+			ret = -ENOMEM;
+			goto err_free_cd_tables;
+		}
+
+		dev_warn(smmu->dev, "failed to add devlink to %s\n", dev_name(dev));
+	}
+
 	return &smmu->iommu;
 
+err_free_cd_tables:
+	if (arm_smmu_cdtab_allocated(&master->cd_table))
+		arm_smmu_free_cd_tables(master);
 err_disable_pasid:
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
@@ -5097,9 +5117,17 @@ static void arm_smmu_disable_action(void *data)
 {
 	struct arm_smmu_device *smmu = data;
 
-	if (smmu->impl_ops && smmu->impl_ops->device_disable)
-		smmu->impl_ops->device_disable(smmu);
-	arm_smmu_device_disable(smmu);
+	/* If the SMMU is already suspended, nothing to do */
+	if (!pm_runtime_suspended(smmu->dev)) {
+		if (smmu->impl_ops && smmu->impl_ops->device_disable)
+			smmu->impl_ops->device_disable(smmu);
+		arm_smmu_device_disable(smmu);
+	}
+
+	if (pm_runtime_enabled(smmu->dev)) {
+		pm_runtime_dont_use_autosuspend(smmu->dev);
+		pm_runtime_disable(smmu->dev);
+	}
 }
 
 static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
@@ -5912,6 +5940,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Safe to enable RPM here as client devices cannot be probed
+	 * before this probe function successfully returns.
+	 */
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
+		pm_runtime_enable(dev);
+	}
+
 	return 0;
 }
 
@@ -5927,6 +5966,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	/* If the SMMU is already suspended, nothing to do */
+	if (pm_runtime_suspended(&pdev->dev))
+		return;
+
 	arm_smmu_device_disable(smmu);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

