Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701073;
	b=ezANYA16oWI9EE/0vc2rQQhX+48CsPRqNdGRqusNYwmgBrieC6DKFwo6izqJvcwrgt8N
	 jsfx2fE/td4ADHy+uefpqZnPWG4N92SkFaX5MOd/PuiKamxYPgPP1UgSDfSqtsluS7E9x
	 nIlhDHQ3lHcb48zpwze/bfVa0XtIshMP/rlypqVDB4oG0R0DINPu8SVpBX2TVL/eiWI+l
	 Ev2RfBZuJ1unuMx9Pzc1LP8TuiPAkN0gOJ61tWKY9JO/HkK9a5fJln5QzRocVtKv2c5Qn
	 PtGJDtrGw5V47vhUpqu6oMr6/eYI2xEVM8EvlKXn8Jjh90vlA3zSK8cAJ0Dj7UmZ+fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=;
	b=oFToEvL/3dh2j2sFMeD5GcAxYF2TkRSb+MaWsh2z/wQqIoACND6xCVbfHwKW5jXkG3N7
	 W0sd/tEkYCgSNb2vIl+6I5KEPv8KagxoEEh2zUNPvjnzUl+dTSwVkK5y47ahY6tlFecZM
	 hvOKGIB/6t+ke3/Ogm2Wi5ZAajPYvgXL5YFdGKRdYXZ1e+RIGSH58mA1A/ASplCjROQat
	 PmF03Vx8CXAbFG5b1UZtLQ30toByWUvNKUzkWWgyz68eIaUndPgxoa3bQhgqlQR9xqD6K
	 DTInLEK0a0YaU8XxyDPCK5I1XAfn04YeC7DLbMmV0s38q3K5/xcA70DV44y6VwfMUgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Obyjsjrm;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF71606A810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF71606A810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Obyjsjrm
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so6994889eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701072; x=1794305872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=;
        b=ObyjsjrmfXfrvfQMCxAeTak49ceyRZR9Fanfngg410Jj8kxRqJWjmoNiTduFivhqmH
         gDyXy0m3hwKENbPALNGXrg9PSCwBfPYhd40A1OYqtyeSlBOHCVSToWjiSnawyX0ooS5W
         tHVonykOxVRT5Gk3v7MwUNRKCp6b5dNv9WbB7ywk/dXrfEP8TfJ0CloyhVzp0JemyBLz
         ntRv2nN6dlG03AxDaN8ooAR5oISxne+eCXn2cQ3GqgzDSvBkcVhI1Fh+RpFx2tJVfXqp
         bQUAhOqCCWcx9hfx+PjInf7EzRHppd52x0T4t/EyS9ToDzM3PYH4GZ06it5BNo1P2gBz
         nnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701072; x=1794305872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=;
        b=xFschFcqH2Qam2bY/DwmiigKV+Kl86gzwxhX0fDCjxBMBmuCZc933FGA9RY7I9ZZ2R
         gGVEjWMoERa1/l4nznUxYAzZAvhxJA+5W/EG1Gme1ggz28sf0UmPuiJ5fylUWbqnFCZU
         3lt1PyzuAmQhj6TEL+XHHaTI/gipjWr+DTdyrw6jYwov+2yrsznFONADDTY1ObdKhc4B
         Oqcxd5ZRRcnnpBGxsknszSVYPJ98a4tywXRT4T5lCZ8Uee2Hlj9z/QwrRRyyCImScjzL
         azO7R8l2gvfM8B5rbatKKUBdZyJt7FGAEYItPl81N5Rmiw60rPrngoDnL+O0PCF2g0U0
         uJTw==
X-Forwarded-Encrypted: i=1; AKwUvBzF0aX7msssnudiwYg8wbc+/4Fp8SZ7Ttap/GIXHPVPEqAcg6znd7Z1ny/SspQ6IEzArxssMomddjSlQR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qgu0K0OaLm9TfKwSmV5/9tmyINk/polU43TDylNpvrcqFTYoj
	JvO4pkVU+efyvxSpJbCOB471CelBPxB6jT63fJqZwCN/8z71d5IEGmLl
X-Gm-Gg: AYBFou0Mih/wfFEblFewcly1+gYNDzeFuCiEpwivTEQTIEAdLYEd8wKB5/bZzU+bQhx
	zUXtZ7qTNTk7LeodpTg0hFNDxfMDDBuEwnP+s/viSiH+ZxcDX2U4oMcVYbm+BC6NRhl4U2ZFi64
	djpyjIWV/5NZoWvb2SfPIKMKSAaB5ZbPNP21wIjbLKyDkPMmcJfE06qTZx07HSZ+uBPU/GJ+cEz
	RjNwAWCvQxvmsp0bg2lhSSL8XuxH6hTuGrFRv8ZZPGZtuhWZ+a6fBZOCJ9nF+Dj2pexB8Zl+A4E
	raA4E7wUrRREEwpG4c32jEspdyBh5fe2SKtaKIWjoMT4PNPRhZrw8ohaOu8NDzMGkOnyfxOaGXq
	qrcxSB0Lauii5XgPuwtWcGllSt0p5Ypzf/AGyzRYrVMdWiDfeHCI//4Q50/4+708mzAnXYH22ka
	3uwBHCZbfsGNjCQDLhmo3DM4C25GnK3jEbTOcD4YUhvQzKfJEP1DwOYkFgIHHs+sbZZ4AQ92/+A
	lOaxIOi49A/weXoyHInX3Fvyzewc9fd+Y2eFAKMbYipfVJerj6TPZbuatEvQi8CqLK8tgb2dRQ2
	L+zdgYs/YUgPUq/mYcFaRp46nJs3wQ==
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr518555eec.30.1793701071962;
        Tue, 03 Nov 2026 02:17:51 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:51 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Tue,  3 Nov 2026 18:16:54 +0800
Message-Id: <20261103101658.766905-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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
index df37c8490ae7..e3ea9581e68d 100644
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

