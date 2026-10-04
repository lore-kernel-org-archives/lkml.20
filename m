Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBECA134CCF
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108746; cv=none; b=rDdTOfb9qN72LjpwfbN+FbTGL4pTbphJ6SThnAB//v5wYEquKsZQrwFkAQdTdzAEvadO7ynZo46C6q0z1bXIteQYvtaq3RmgPOz8rCiD0P3ThKQOTXafSSPi5xJUpOFaDXrIObYz+dlRlVzSo9+GhIDOUHAivyj09yxs+qXKAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108746; c=relaxed/simple;
	bh=ZUlbH9F0GG0U9GdQojoxCWZZQEvgOKPGO2rP6vSpaQA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KTFXb7cXJo+YncVSLr+/mVqIoe1y73U3nYVAt2OhBVFzZqBxd9VBQYzB2AkKCvnc8Uqjtk3UsKVXrWwii8V8IAfvaSMn0/zGv6CVnlVY4B8dNw38PwA+WToCz3jFdvAJC7jmMD1qJgpY2H5DCn6oLQoHKePcw0RnYQxDMCRppuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=WwJR9uXH; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="WwJR9uXH"
Received: from [IPV6:2a02:842a:8223:5500:5b20:512c:83d4:ba0a] (unknown [IPv6:2a02:842a:8223:5500:5b20:512c:83d4:ba0a])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id C77EE5FFAF;
	Sun,  4 Oct 2026 12:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791108735;
	bh=ZUlbH9F0GG0U9GdQojoxCWZZQEvgOKPGO2rP6vSpaQA=;
	h=Date:To:Cc:From:Subject:From;
	b=WwJR9uXH/n3vZEpYKqlNzDe003NvEW8mSsTCbTffD87Hw+PG8AtiUJAyCcNnXNfH8
	 jUCW3ytnPc1Ng5zdEOhv0kgNk1LnZbEu/5bXGvGLylR3F0J87mPl6ooJBUeKgYQRH0
	 qeaDDLahEHOVP6+7LG+/sC47KgdmS+ifMYiPnD6Gk353mpU5Vvr+nUcYtfZFgLqozx
	 24BcW20UtzdDN/Qn5STNOs0x+Fbimp+Rf5Lg6DkakIoBuA60gVwdHXEKESBH/rt7NT
	 AjYgB984qJa/xQhH1vfUADtyXulWXp8TrbbmF8pfiaJCZv0KiASWmPwEv9jbjXHbNr
	 O9UA8YMQdJQbA==
Message-ID: <f921c2ca-e083-41ad-90a9-e54816427a50@free.fr>
Date: Sun, 4 Oct 2026 12:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
From: Julien ROBIN <julien.robin28@free.fr>
Subject: [PATCH v2 RESEND] x86/pci-dma: swiotlb: Fix a regression since 5.19.0
 about iommu=soft kernel parameter
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following patch fixes a regression introduced since linux-5.19.0 about
kernel parameter "iommu=soft" which, according to kernel-parameters.txt,
is expected to enable the use of software bounce buffering (SWIOTLB) and to
prevent the usage of an available hardware IOMMU.

Since linux-5.19.0 however, iommu=soft doesn't prevent anymore the usage of
hardware IOMMU implementations, and at least when an AMD GART IOMMU is
available, SWIOTLB even gets disabled by "amd_gart_64.c" despite the
iommu=soft parameter.

The issue is fixed by adding an "x86_soft_iommu_only" variable which is set
when the iommu=soft parameter is found and processed.
If the variable is set, hardware IOMMU detection and allocation is skipped,
as these detection and allocation functions could overwrite both
x86_init.iommu.iommu_init and x86_platform.iommu_shutdown for later
initialization and shutdown of these hardware IOMMU implementations.

When the iommu=soft parameter isn't provided however, the behavior of the
kernel is left untouched by this patch.

Patch applies from 5.19.0 to 6.19.0, based on mainline as of 2026-02-12.
Successfully tested this fix with iommu=soft parameter on linux-6.1.163 and
linux-6.19.0 on a Gigabyte 990FXA-UD3 based computer.

Tested the fix and iommu=soft parameter on linux-6.19 on these 4 machines:
 - Gigabyte 990FXA-UD3 motherboard based computer (AMD FX9590 CPU)
 - Asus TUF B550-PLUS motherboard based computer (AMD Ryzen 5 3700X CPU)
 - HP Victus 16-s1034nf / 8C9C laptop (AMD Ryzen 5 8645HS CPU)
 - Asus X550JK laptop (Intel Core i5-4200H CPU)

On the 1st, this successfully disables AMD GART IOMMU and enables SWIOTLB.
On the 2nd, this allows disabling AMD-Vi but SWIOTLB was already enabled.
Same for the 3rd one.
On the 4th, there was no hardware IOMMU enabled, and SWIOTLB was already
enabled too: no resulting change for this laptop.

Signed-off-by: Julien ROBIN <julien.robin28@free.fr>
---
Changes since v1:
 - Added static keyword to 'x86_soft_iommu_only' (only used locally).
---
 arch/x86/kernel/pci-dma.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 75cf8f6ae8cd..c3dad499cd27 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -34,6 +34,7 @@ int force_iommu __read_mostly = 0;
 int iommu_merge __read_mostly = 0;
 
 int no_iommu __read_mostly;
+static int x86_soft_iommu_only __read_mostly;
 /* Set this to 1 if there is a HW IOMMU in the system */
 int iommu_detected __read_mostly = 0;
 
@@ -100,9 +101,15 @@ void __init pci_iommu_alloc(void)
 		return;
 	}
 	pci_swiotlb_detect();
-	gart_iommu_hole_init();
-	amd_iommu_detect();
-	detect_intel_iommu();
+
+	if (x86_soft_iommu_only)
+		pr_info("PCI-DMA: skipping hardware IOMMU detection and allocation\n");
+	else {
+		gart_iommu_hole_init();
+		amd_iommu_detect();
+		detect_intel_iommu();
+	}
+
 	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
 }
 
@@ -149,8 +156,10 @@ static __init int iommu_setup(char *p)
 			return 1;
 		}
 #ifdef CONFIG_SWIOTLB
-		if (!strncmp(p, "soft", 4))
+		if (!strncmp(p, "soft", 4)) {
 			x86_swiotlb_enable = true;
+			x86_soft_iommu_only = 1;
+		}
 #endif
 		if (!strncmp(p, "pt", 2))
 			iommu_set_default_passthrough(true);
