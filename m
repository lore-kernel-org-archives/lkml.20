Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934843;
	b=DgAyEWah/PPydqK1s9aHSEtiFpWHa4ndbGJHyY4QrdMyDVWlbLbK7BrTSl+zO4vsQpCI
	 Gi1gf1dssY8Xmc1ZZfKvk1l2BkqM7XYzd+w3FxVfmly5k73Xin7Y8sdiyFuQR5fm3cHLc
	 ZoDRiomLXzAjPEyQNJhn7uSoBnrMUhvOkkeNtNg3awoCt5RFF6gIEkcf3115H0r+qWZRy
	 tIlRZoGnyVUz30NCqkX5L/qJPR5lFEYZvWF0/26+iley6MrQXDvTbaBUlB137r/Nki2Nc
	 7PD+He/S7ys/IRJ2EYPKOLMfmNE2bSh0pDk50UGiC7pZUjokoGH7Tlw+QZ0L6/TKAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934843;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=s4G6y9mFTbTckKTLQXLl6WZ3FRA9OVGpxiqTBq5svBw=;
	b=IByz231dGB5NpQMHHx3MIekX1YLOqoHAAeWsQPUQRNZIWO1HQtfZq4Qmxzlbqgfkzf3a
	 XSaWuM3N4Ohvq++f5VFDpT0EcRk54g/yhv9Znci1eKhN2bQqTunk+5ai7fpn3xPkVtrzE
	 kU9NvnZOrqLw3ZNQXMg4H+LjNMAJJt+OQ7JSh9/EhorBar1+XYh7CRVdS0RvEulY21akQ
	 UD7JG+JhFsF7sMXSkG4pH+eEFOrzdtb/rUc4bk9IH5ATYKreK2iMClpu7RdkZwr2rhVkX
	 CImFSX7tcKAlaCZNG0X6V63+rKimix/GnPjHiDFxnyxGqqNNt+mpdN2Pt1A1MTvqgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FC606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504FC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xKyCb-000000005KX-1kCw;
	Sun, 25 Oct 2026 13:27:11 +0000
Date: Sun, 25 Oct 2026 13:27:08 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joerg.roedel@amd.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/vsi: keep the runtime PM callbacks without PM_SLEEP
Message-ID: <e8114502dc91f5fb709509291fdd85e27545dfb6.1792716048.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The runtime PM operations are handed to the driver core through
pm_sleep_ptr(), which is NULL unless CONFIG_PM_SLEEP is set.

Without system sleep support the IOMMU has no runtime PM callbacks at
all: its clocks are never enabled by the driver, the page table is not
restored when the power domain comes back, and iommu->enable stays set
while genpd powers the domain off.
The TLB flush issued from vsi_iommu_map() then writes to the unpowered
IOMMU, and the first buffer allocation of the RK3588 AV1 decoder ends
in an asynchronous SError.

Use pm_ptr(), which keeps the operations whenever CONFIG_PM is set.

Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/iommu/vsi-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
index 5dac20b143a55..1b447c0693936 100644
--- a/drivers/iommu/vsi-iommu.c
+++ b/drivers/iommu/vsi-iommu.c
@@ -780,7 +780,7 @@ static struct platform_driver rockchip_vsi_iommu_driver = {
 	.driver = {
 		   .name = "vsi_iommu",
 		   .of_match_table = vsi_iommu_dt_ids,
-		   .pm = pm_sleep_ptr(&vsi_iommu_pm_ops),
+		   .pm = pm_ptr(&vsi_iommu_pm_ops),
 		   .suppress_bind_attrs = true,
 	},
 };

base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.56.0
