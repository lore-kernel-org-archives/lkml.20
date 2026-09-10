Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5813749C4BA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050420; cv=none; b=TqBVnM+Y4ACNQtrR7uqwts0E4ixE/iDUXzVGnMU3pNfHWOo26IdZr5N8N6AfB1cNcv8Vo/U9Nejx/WXM0HcU6no82FWimsEefNw+wIKuGCkCfKew9XDuGZBylR8KAlZndLX/ZzT22nN3dmwRtVH15wX1i/TAV60GjBXzftGYS7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050420; c=relaxed/simple;
	bh=J0Hc4q1Go6YI0ET8ibt8BHU2+llLW9yLplGEKFVytrI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZwMVH1yKFF24ikRlMf0Ak4ejIo8EVWM52A2rGsY3tJ3giDGHgYOlD1wMjZfCvZvoPpB94vtShMMpSr4Y5NZqq5Va3U65zP3RYtjajv9B2zNzOQEwiql+exhCKCHLYABg86lwSHARsUs+9PUkPOuNqLd9JKQGVHWxNZABaCpV6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j0VVc2qy; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j0VVc2qy"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso11996406a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789050418; x=1789655218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBJ7ZQ97TaoaWnA5M7weW3ELiXVtmItecO6telkSzYE=;
        b=j0VVc2qykOzKyHMAAw0SdcIJ3mk2Fz/S8TD/lY08Pzm2Be4dm0hyB3ghQ7ODORobKd
         jakOt8Hmf6aF1v3deOgWyC5NaQbUkfGvxYLCQuppOcIFmqd7MCWnmIGd1PNs/gSG4FMi
         OrMTcqDmmLF7oR4NO5URJIRVH9Ko491MHC0Q/6KWxf71uBoedB3Jyvb9SFP627j5ngO8
         SwSj3AXxOB6VeP5KpvibZILziimbBP8xmg3HoMSxOHRlwGePpO7p9ywGm3Hk0MYSJz2x
         +IugwalyOQg/vdpqow4CtFt3I+C5z6/9MCEU8e4rvrNDY8+dKNF3Wc+eaagIPxbQseFM
         g5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050418; x=1789655218;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBJ7ZQ97TaoaWnA5M7weW3ELiXVtmItecO6telkSzYE=;
        b=m5ZATgkImECdk2LmmEAWW7EmYP72THh2c2tar0kwKvH7DA9lPqMMVi0nJnGBoVMjr2
         NaEBNjyHmyq41luR4KubQJGaRUC5oRYooWzUsMF/AtjzGl9+Mdf9iljVd45LacTFCEYG
         Ye+dnsnoGIabV6HQ0GythYKmWjfEDFHLaCRjocJd1R8TJ1Mk6dXsQHjc5p6ulgoINNMT
         g+C8nlzDZQqZxvri7gV+7exGJJbdiZKEQp+kxir/NP8Afjsarz6mlnj/J3FjWJj0opqW
         CNbY0tU4ItNdihBwE8ZQXSqvXFarK7eTF+0ukT55aCYiEGExCUYuX2dJ3fueMs37msTx
         lYdw==
X-Forwarded-Encrypted: i=1; AKwUvBxjremEhrg/3P6bkl7ERzD8oVIcQQp69j06K0+gj55WJJQAkebMRlhVStrZdJYEpgJBhl7mmqHcZoznlYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kDGR8ehl0R2xmQr+OAIYqs9262KCk6XAvLTKalL9bCTbb22IoW
	YUfPRDmSe6UQkbrhd3yVKfnDDiWAYAtPvoYhQQ+FGjFzfzF0xoMEQ/1mklaYsVmCQvyKUZhMlAI
	USw==
X-Received: from plao19.prod.google.com ([2002:a17:903:3013:b0:2db:1fc8:4e2e])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2781:b0:398:9c00:29ee
 with SMTP id 98e67ed59e1d1-39b26289136mr66346991a91.22.1789050417446; Thu, 10
 Sep 2026 07:26:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:26:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910142655.3281464-1-praan@google.com>
Subject: [PATCH v4 0/4] iommu/amd: Refactors for ATS robustness
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Ankit Soni <ankit.soni@amd.com>, Jason Gunthorpe <jgg@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

This series forms the second half of the subsystem-wide ATS robustness
updates. The first part (focusing on the core subsystem, Intel, and ARM
SMMUv3) has already been merged upstream [1]. This half addresses the
AMD IOMMU driver and standardizes the PCI ATS API.

In v2, the series has been significantly restructured based on feedback
on v1. 

[v4]
 - https://lore.kernel.org/all/20260824122347.1588592-1-praan@google.com/
 - Dropped iommu_ignore_device() and dropped patch 3 per discussion with
   Jason and Vasant.
 - Renamed iommu_lookup_device() to lookup_device().
 - Cleaned up amd_iommu_probe_device() to return error pointers directly.
 - Collected Reviewed-by tags from Jason, Vasant and Sami.

[v3]
 - Collected Reviewed-by tags from Vasant.
 - Added a comment explaining why devices without DMA translation support
   are not ignored (to preserve interrupt remapping) per Vasant's feedback.
 - Renamed iommu_disable_device_dma() to iommu_disable_device() to
   accurately reflect that it disables both DMA and interrupt remapping.

[v2]
 - https://lore.kernel.org/all/20260814015647.3370124-1-praan@google.com/
 - Patch 1 Refctors the probe path, isolating capabilities into 
   iommu_init_device_caps().
 - Patch 2 renames iommu_ignore_device() to iommu_disable_device_dma().
   Following Jason's suggestion, it invalidates the hardware DTE by
   clearing the Valid bit (lower 128 bits) followed by the upper
   128 bits.  
 - Patch 3 splits the probe error paths to ensure that devices with
   config failures (like PD_MODE_NONE or ATS mismatches) can preserve
   their rlookup_table entries, successfully keeping IRQ remapping 
   functional for bypassed devices.
 - Patch 4 implements the "Fail Hard" pattern for ATS in the AMD driver,
   failing the probe and throwing a WARN_ON() upon ATS configuration or
   enablement failures.
 - Patch 5 enforces the checking of pci_ats_supported() prior to calling
   pci_prepare_ats() across the entire kernel PCI subsystem.

[v1]
 - https://lore.kernel.org/all/20260601134204.2150602-1-praan@google.com/

Thanks,
Praan

[1] https://lore.kernel.org/all/20260615235037.259909-1-praan@google.com/

Pranjal Shrivastava (4):
  iommu/amd: Refactor device probe and capability initialization
  iommu/amd: Remove iommu_ignore_device()
  iommu/amd: Fail probe on ATS configuration failure
  PCI/ATS: Mandate checking pci_ats_supported() before pci_prepare_ats()

 drivers/iommu/amd/iommu.c | 164 +++++++++++++++++++-------------------
 drivers/pci/ats.c         |   6 +-
 2 files changed, 86 insertions(+), 84 deletions(-)

-- 
2.55.0.1003.g10538fe699-goog

