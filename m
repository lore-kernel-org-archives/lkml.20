Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059442;
	b=uqmig4wUEhzwsDn41O3UljwQMRD80vZm6VvnYO1EKLlw1uBmU8D4kVgFyNPnf4ESuDMb
	 quBfDPP24murzhkoaSa+zZCzWVFbTzNJ7y3OWV5L3cP8LL1EpXVs7nnW99H3IWvMa6FHs
	 /0zGRJIAEoIcCOBg0+exUV5GMr5npLqWIjtIQsXYfuD4366++BMPcdMdTjd1UKJhf1SDW
	 yuUDE/JsW+mxZ/DiqbPuTnJN8MjJZriiLNCWS5qbjoYtir1ESy9HS9j+JpacupoYlOLpL
	 sdXnsRGjuVOrrSDgoYNWhGyiTOGbD4FOxkMDG4f37xWoTOSYLw8UDuVmhsc+eCGS06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=;
	b=MubZMJjH7CJ52jfnYw9XDoI5hVwxsozvlryVZd4TewxreU2sz02OQwf2g5ejAnSmIQLz
	 nHE/v07e1Xv9oDayiYGw/GnWYTRa44HUCeCIt/krLXVknN0S5P82AsERndxIaGqF3ZV5H
	 IrpfetRTmSgUXn+YlY2uT4EY04/obAQSBDCyocAyYO4jHPeAGavIdjwAtOgsRo58XOEgu
	 pRMtzO39Yw3Gd3+MUXfmRlZV5Wd/SIaDUnR5I6MNpB/DwQoufWXsN46dLNKpc+FqSeb2U
	 07Lb98ny2F2LebLsau/Kd5hV68MqxF/IYAdrqHMCeeVZJKgMhTb/yog4IfTBVamFAHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zy9qolOc;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9613606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9613606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zy9qolOc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37071c0f42aso2118972eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059441; x=1794664241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=;
        b=zy9qolOcJtfHj0yzGoVqDfHwDm9hKFlRbodJKVOQK9QvvPjHGA96Eyw6IcdRNJJnV1
         jlLF0YPca6Vrpa4euDuoqnHg+J3sPm3ohTGLPSJcyt73bR/BvjP6N/N8ZgVYeccrGx9h
         3zlelmpcdqlHEZJiZeb/oYngoBu2xG5c+sGzwoJCTLydwnhNNgoO0p7bDQ28Ruj2uXbp
         sx0VRyp5Oan3k8Ika2DI0K8UcopLl+ddw74ImXa5h0Ds2Fwh30pHwrNQ568Ctn1q42JD
         RnBWVmjShv4zMx+OcIhSrhFkd6Tj3NEYKj9qBCTZmNvM8/tmkrQEXUo1LqTlnQMTDSp6
         Mtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059441; x=1794664241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=;
        b=ZN9N2lHVvzz6DQfzFJCcpvsfasV/zS7hYqE6fdauHLiR1RdSLO15E1UChKATnvrNrY
         BnPnlRNGmtPxlYTXqsFqVP31xODWRY+Q10pWOu/+YByZVTqhizx4gJYkvUofhLQ4UvkN
         KwuLwj2B42WWDKwbhYqPkj4RbXElp5YM8P9dtlOys7mq+27xLiHHLouKtuKgztw/aw/3
         ikcTiWXwmcPISJrRFv+ln2BMQhwwHkVjg4Vm7z0ooGYVFlkEQjOiGthoKAN8PDK8Vgob
         5EfDmtKrNBUmrY15mPr80a2r5UnaK4eK1IJXPuzoElSNCaMRFV1uBiCO3ERO5O5Zm49F
         7k/w==
X-Forwarded-Encrypted: i=1; AL+hErHn6udkzqh5Qqu/QdWWkkhQXiq267fd2jI6N2uFIsgkcNzK8j5crF4JrG8j+HiPH16sbHsWEWfsImU37X8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U4C71wR3CT3l0o+fWgujlWgWT5cKzH9pHkYS9LirpS5Fi+S68
	C6pMKburtCfoLOh8YXkoDVrL0NdGQ9Zlji3jNs1quxiOtmYeC327pPEp
X-Gm-Gg: AYBFou1g8lQ34NAI3aofZMGw4Grjy0t99bdmVTAZteX1SSTvdOIDICLPxf4MhvmLAYX
	GgIF9EmQjKHqPF8nYM8a0pn13N9ZScQ3yLmSqw+pcil23bUS0UM2pKeo+izMqwFl30PkUt8FIiL
	89vEfQ/npufnCJ3knVoge9pibbfGDguzRQHtdjbDQZRXR6XfNqpMUFP87dgZ/vsoh6FQOHcKD8y
	Y49cojIm4QR79mSYd1YkOsdS+M8qCsDC9hWIH3OMuQkWczBKbQpZqfVrrNzdSWBfSskjS/p+JUx
	+G9KhuaYU1ASUu6DFp4ceHfOq1E7hrhPpaTivpFZ/YxuBfkBia6q3pPCwppJkfi/iufRhFqIM/U
	/Ibnnyu3YjiiBpJtR7g7wuVbRCjBM3hCPCdzg/9K0IhNXPVFem0rLI8NqZpnR4EAK9ep/RvMaUr
	onpd60wVajL5GX2T3/gI12el8tBsKgv3qniSJeyYAmMXTHhi9GgDhJh3vGOZjcHgyRKognwfmfk
	nWi70kzIQ3pzPhUqL9FIY5vDLXUSM3R8sAwD42Enrz8/9dgt0qtf3Iq/Tb7SRLnfVBN3/0ESk3/
	5RUitrXTGND3ZRjNSKWbyWbGBAhb5eg7Xu5T1fmyJItg5Ohnart5/suOIA==
X-Received: by 2002:a05:7301:fc02:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36f761249e4mr8433809eec.34.1794059440743;
        Sat, 07 Nov 2026 05:50:40 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:40 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Sat,  7 Nov 2026 21:49:49 +0800
Message-Id: <20261107134953.748622-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df37c8490ae7e..e3ea9581e68d0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		vmap_pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int nr_pages;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1

