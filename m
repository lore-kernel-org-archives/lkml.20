Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE14A3860
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050429; cv=none; b=q8+ksTPHyCVYH0ImOzwrTqttgd7inaNrbu5/iSiXuCEcyElyx2ipdGOJV4dEZlQJpEyHNrkvyMD1+JklxldPgnTB3WI/C9147F8GVwp+a+CX8vL5WrML3/n1tUawOSvkE9hmue1SMa7wmHq34djxliIiiXqTTKOM91PdYfEhzAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050429; c=relaxed/simple;
	bh=YYZVAnbeYsjJUQMqHO19xE7fLWQGWh0V5fiC80emyOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ROT7rlSDtBfdraczZ3xgxzp+nLELXpUE57Wxpw5JvVTY+KAJWK8qfChuWs9jQV9X1NGf0CNHi8cJxzVXXlCGO03FhGRH/w49xL8jJnX1hIiRWyzAMvYLFDoDY1RLR7r2ZcI+d7O5jJxV+bpzfOirl5R3mGU9ENcGUwN+MgsMUnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbqPrSp3; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbqPrSp3"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7167834a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789050426; x=1789655226; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2x6uJrq0uW0oJaL9sX59+iCeuYUCoD1qgfJpjGmx3Y=;
        b=lbqPrSp3up+iMmA+ev5Y8bFdZHmpQzyLKI9a8m0PAQql3pNIuLCxFiTxp/CpmtlNBN
         +1jrUL6pwqrNf9zDKkbAeX28EcMgyLc63lT/8UxXEBcQGQTZGoCrqz2WOFNfuSgg9pkL
         uTm0L/yINbFIZwZpoBO/y9tn6bG/sqkwnnPsGqEA4FR+kt8faHlksElAKkpIySs37vLo
         gGFVTWCpHwwRIRmuaSi7S6Ljggbg6IqQfggWPj1h/AG32GyxE5w9xHXfn+RoKYI2ihPm
         i4UrDyOiOtakML8ngTId4ekTFkczM6YMXOJxab3JYJ3rkqzZjrYbdiU1B9DsRH3dH/IG
         SSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050426; x=1789655226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2x6uJrq0uW0oJaL9sX59+iCeuYUCoD1qgfJpjGmx3Y=;
        b=El7+LxMUKTFXpIr7qt5HK8BZqG7CVGedWDAQzYb8xWRYDIIrvOLtIoCoFVuzgkFj5e
         NwKfO+Kh2i0PQwRgkrnEOG4H5jVsQ02e4GimSRXa8jBHyN1unuZhj+o0kdwGJcH0h6Pp
         y4HM0DJzrFo2uc1eBiIRRPJMOZgCS0oQuj48TzbQebXCL4FDz5DzbsM9lmBJrZiE2kwS
         owkf/WkkEYMQ8KnDqHwIn32DPCWiYlsifR271tK6jWtaGcoxFwb5yLhFVXNt2luqBODM
         X1OYEsmlXaxdfJwTsTonFiOLTRT+WOztBp6UmqahCGfPy72VCJu+M+ezIOUpoj5rV35n
         LCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+rrsDkGJHvAF2/RMpzxojmxtHKND9NbxgAzFwQlKU3sxBbDAzAF7tJh1fVY9GFSlBqxWOxrE++bv3ONs=@vger.kernel.org
X-Gm-Message-State: AFuF++kSWjvYJQ3kWhgW2gkK38arnJnYgF6ad9xBjMkhJCAlvPggYXdQ
	7FRXOPhWxcld2LvF0BUbrFTlF0UP8QI90v43ZG3myKwXmzmax2I3Uw88zlISb65SzqEYprAKPRX
	gbw==
X-Received: from pgmm13.prod.google.com ([2002:a05:6a02:550d:b0:cc4:a477:43cc])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c05:b0:393:288:29e3
 with SMTP id 98e67ed59e1d1-39b26106c44mr63990436a91.10.1789050425503; Thu, 10
 Sep 2026 07:27:05 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:26:53 +0000
In-Reply-To: <20260910142655.3281464-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910142655.3281464-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910142655.3281464-3-praan@google.com>
Subject: [PATCH v4 2/4] iommu/amd: Remove iommu_ignore_device()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Ankit Soni <ankit.soni@amd.com>, Jason Gunthorpe <jgg@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

The iommu_ignore_device() helper was historically called on device
initialization failure to clear the primary Device Table Entry (DTE) via
memset() and nullify the rlookup_table entry.

However, clearing the DTE on probe failure is problematic:
1. During normal boot, DTEs start out unconfigured (blocking DMA), making
   clearing redundant.
2. During kdump boot, pre-existing translations should be kept running
   until deferred attach rather than abruptly clearing them, which risks
   breaking in-flight transfers.
3. Writing to the DTE table via memset without flushing the hardware DTE
   cache risks aliasing & torn writes.
4. Clearing the rlookup_table entry breaks interrupt remapping for
   devices that fail probe or operate in translation-less modes.

Remove iommu_ignore_device() entirely and simplify the error return
paths in amd_iommu_probe_device().

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Suggested-by: Vasant Hegde <vasant.hegde@amd.com>
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260529153216.2AD1E1F00899@smtp.kernel.org/
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/amd/iommu.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 5e144a60c397..7f8b51c28a7e 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -728,22 +728,6 @@ static struct iommu_dev_data *iommu_init_device(struct amd_iommu *iommu,
 	return dev_data;
 }
 
-static void iommu_ignore_device(struct amd_iommu *iommu, struct device *dev)
-{
-	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
-	struct dev_table_entry *dev_table = get_dev_table(iommu);
-	int devid, sbdf;
-
-	sbdf = get_device_sbdf_id(dev);
-	if (sbdf < 0)
-		return;
-
-	devid = PCI_SBDF_TO_DEVID(sbdf);
-	pci_seg->rlookup_table[devid] = NULL;
-	memset(&dev_table[devid], 0, sizeof(struct dev_table_entry));
-
-	setup_aliases(iommu, dev);
-}
 
 
 /****************************************************************************
@@ -2528,9 +2512,7 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	dev_data = iommu_init_device(iommu, dev, devid);
 	if (IS_ERR(dev_data)) {
 		dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
-		iommu_dev = ERR_CAST(dev_data);
-		iommu_ignore_device(iommu, dev);
-		goto out_err;
+		return ERR_CAST(dev_data);
 	}
 
 	iommu_init_device_caps(dev_data, dev, iommu);
@@ -2544,11 +2526,9 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	if (amd_iommu_pgtable == PD_MODE_NONE) {
 		pr_warn_once("%s: DMA translation not supported by iommu.\n",
 			     __func__);
-		iommu_dev = ERR_PTR(-ENODEV);
-		goto out_err;
+		return ERR_PTR(-ENODEV);
 	}
 
-out_err:
 	return iommu_dev;
 }
 
-- 
2.55.0.1003.g10538fe699-goog

