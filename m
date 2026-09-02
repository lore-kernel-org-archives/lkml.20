Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD44AD4A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376408; cv=none; b=iNqUpT+P2sw5dVnZa62OBfNh/eVxdK9H8InhmgBuzE0ggp4hhkKjhJZqfEckXbNgefCPN/VdEONs3VwYj181ineeNpLMmkD88G9OHg163Wnwtgta5BtSrhDbc0JAhZfGFzRnDUZrMa7jr/5izdVvpFjP2OkO4lQfRCJfxpKrasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376408; c=relaxed/simple;
	bh=PFLrtI8FJvq4Xkwov+zqiL8iQ5uTOI2l8tCCPKjbTGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nra4NZoW66A+agbOJhCc2yq+frhsYBD84nU8sqYC27j1/nAzAvkHF17UjMytivQAtKmTvXk8BJTig129d+m2IzmM36GvtRmLwCK2hZiWozV96Xekh80B7vvJxls4yA9Ag0g3OZglcnxuGS3/lf1DlowGF4wXewC1FhecZLkhFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=roXYkCXy; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="roXYkCXy"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso2761719a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788376406; x=1788981206; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S7KYRpQb2qK2BMI5cWRKmHlXxuXkcNUnDHM16soIFqI=;
        b=roXYkCXyCM54SxblsxpNDxG7DTcbgBC2NUUrkjgEQQwmBuwkGl3mNZ+o4BTHni3453
         M0qV3jll1d6S2c+aTs8ULsgQ2O4Orov5SXxVpCefk4aJUu0jaabCwB8dkVGfXcvTW9m7
         VyWClN7K6IWV1c5NWj3E6AekQTuzCnp8+tsSLUw7sj8sCOeaJFK5R3uFaxO/nphbZehi
         Z4mHutAwcq9euC3d8tjnZnP6jQ/VZpV19rJBNyhL/L4yKEC0Vkte9uLOeUlDwrMdIozo
         SHv58xx47ZG8/wvmTpgKzlq1wB5iJb32kAuZy6RDSU9weB6m77NY1XGn/lNMK/efA/DH
         +1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376406; x=1788981206;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7KYRpQb2qK2BMI5cWRKmHlXxuXkcNUnDHM16soIFqI=;
        b=JRAlckzyRptuvIazmQxPXuJyam8gdPNgk6riF8bXNMzKCrEhu2OGC98MZk9wHnrmDC
         V7G4GiF3vIG8TsIbfPa2ule30KI/J5YE6PXp4f2svq1IKX1Pqh2K0uakQXFbXvflR3re
         1T+X3IHbbGqmF8EUFv7g20jMf3/13xQlHukrdHJ1rb99T2RytV3J3xN+zM3bQ6cohXw7
         RUmPmC0Yz1jis6MYacE2lRtbwKSftOOmrkkegX45f8cZsiXlSsU9B0Rd2WR/0I3Sl4zz
         QDUakHMC+6+gTwVtEBLoF16pl6OSsrIzk41F8MSCYKGDmqfZP+SPMgLXjFra/N3J5RxB
         AqAg==
X-Forwarded-Encrypted: i=1; AKwUvBwqVST4rmA/TUoWKhnRJgGZm4s5S8jcM7qqQxPtQOLXtoN4/UA1KJMinRYY+19YdDytaA1KnQuwHFkCpLk=@vger.kernel.org
X-Gm-Message-State: AFuF++m7dj7VfB7LoLBHcwH4hpGhdby0FII2uHTsYB15i3u3mU2/j38l
	LcJkJPnx8EN4wtCGVzLsoXzAJCoElpGEKDhAr6dwqd6KD9YCRkAjSeJa3rs/f3kJfZGOQvnfSnm
	TQyPEkg==
X-Received: from pjbhk14.prod.google.com ([2002:a17:90b:224e:b0:398:cd79:3b48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b8b:b0:398:9be5:b419
 with SMTP id 98e67ed59e1d1-39aee1c9b76mr7984963a91.20.1788376405725; Wed, 02
 Sep 2026 12:13:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 12:13:20 -0700
In-Reply-To: <20260902191321.2644150-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260821-stable-item001-snp-builtin-kvm@kernel.org> <20260902191321.2644150-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902191321.2644150-2-seanjc@google.com>
Subject: [PATCH 6.12.y 1/2] iommu/amd: remove return value of amd_iommu_detect
From: Sean Christopherson <seanjc@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Gao Shiyuan <gaoshiyuan@baidu.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Sean Christopherson <seanjc@google.com>, Stable@vger.kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Gao Shiyuan <gaoshiyuan@baidu.com>

[ Upstream commit 5bb494d5cbb9a3403ba8b1c8bc145b42fc119078 ]

The return value of amd_iommu_detect is not used, so remove it and
is consistent with other iommu detect functions.

Signed-off-by: Gao Shiyuan <gaoshiyuan@baidu.com>
Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Link: https://lore.kernel.org/r/20250103165808.80939-1-gaoshiyuan@baidu.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/init.c  | 10 ++++------
 include/linux/amd-iommu.h |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 36a814b6c4de..0e270533bf12 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3484,25 +3484,23 @@ static bool amd_iommu_sme_check(void)
  * IOMMUs
  *
  ****************************************************************************/
-int __init amd_iommu_detect(void)
+void __init amd_iommu_detect(void)
 {
 	int ret;
 
 	if (no_iommu || (iommu_detected && !gart_iommu_aperture))
-		return -ENODEV;
+		return;
 
 	if (!amd_iommu_sme_check())
-		return -ENODEV;
+		return;
 
 	ret = iommu_go_to_state(IOMMU_IVRS_DETECTED);
 	if (ret)
-		return ret;
+		return;
 
 	amd_iommu_detected = true;
 	iommu_detected = 1;
 	x86_init.iommu.iommu_init = amd_iommu_init;
-
-	return 1;
 }
 
 /****************************************************************************
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 2b90c48a6a87..062fbd4c9b77 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -31,11 +31,11 @@ struct amd_iommu_pi_data {
 struct task_struct;
 struct pci_dev;
 
-extern int amd_iommu_detect(void);
+extern void amd_iommu_detect(void);
 
 #else /* CONFIG_AMD_IOMMU */
 
-static inline int amd_iommu_detect(void) { return -ENODEV; }
+static inline void amd_iommu_detect(void) { }
 
 #endif /* CONFIG_AMD_IOMMU */
 
-- 
2.55.0.970.g62bdec98f9-goog

