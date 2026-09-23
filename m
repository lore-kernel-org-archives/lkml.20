Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CED444705
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144965; cv=none; b=Q0/9/Lnha9DIAL1i81Bai9Kouz8z/jQ+AtWIvbcWHL7g7MEO60UGo/BeqWYvj76Jsy4nkmgg7yhWoLPK4TMHbLa4gnImqmpykfoq5ENvWKYRLmGfSTLStcIEIZh/6eEu6F4zCM4Ecnhs1WJ3zu548lTxt4wTWUxuvBM+ajnkEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144965; c=relaxed/simple;
	bh=p+t6rwYDFXv9MMHDHyLII541DjI3rl25xQ77OuO+OVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DpqZ5nKyHZx5BwRQu5XNaQX0+UcjCnIAOz4NDfvRut/fPY3tkGSDbdWYRKMorIzjY011FElTwN1PPwifIgVeeLeN4vEodVELR/8sNwNNC3rlJGvAJM+/ndz12WO5/F06KbOxJgZKrElxILbxe7DPo+MZvqHoRJ1FPGsx+ct7hGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz4WDphN; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz4WDphN"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc433d52421so316904a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144955; x=1790749755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMhtuKKM9junrQcHfwBMD2RoOkQktkfIp1wjOSUMcpY=;
        b=gz4WDphNRBWqrFbYo2DhKpq7mcnHd3AwBCirquh9e0CrLjCmmO7fo0NUB7PAUcS4XB
         0VfnquxR7E4pn6f+pV/bU75TxgbwrJgUJFGGRRtLGerWTGK22pBqI4zDHt+SeV22ms2E
         +cLDOfcWQ5WYVEK80/RhzIGbu63NbbC4AWPgTJfyvL9i3qnDHKUxy7zhlmcIYQXd6Izq
         OZrQCi9VHj7Sp0Xab+yAkD9j1z1Lr7h9O3Ps7PA/xB0K9o6IC+/xrNPNUTOiklGGkL46
         TYyRmwc5/LNpKHwZuVT7hioB7/n0ek30Amx4BolpPb6Bsn74UgY1Rs2SIyrdYXE+jlyn
         4lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144955; x=1790749755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMhtuKKM9junrQcHfwBMD2RoOkQktkfIp1wjOSUMcpY=;
        b=hYgaL83vpcxRZYRUgtgVO68xn3kCFfWe0ECI2h7gqKxreGzJjOCbE1WrRmp6+dKW3R
         rT/isk4UY9UonltVYFFWP14r5RdbVtIBphKcn687B/cJYHa4sBw972BTKxlwqRU9Hq1N
         M9hQVEXzn/vbznFGlOxfbzm2wc9QKJiHHmohsSolas47QPz0a5ybueB1exCicZMMXJaR
         wa5cBK7p088kVqvHE1S+ySGo8b27s0ajAkskn/g+VGQ3iwFVkyF3vxrYz21KQdY6hRSm
         VZO7y720dALuhPDQGLXero9qtoiS20EQJHr2zPNUTwDgSYh0uVSaofObBLzMPtlMX0AM
         OuPg==
X-Forwarded-Encrypted: i=1; AKwUvBwxAsvew2N1ZdEdrIse+2mT0BnalUUGOBUIN71meKyn+Q71tEF2ZKnfCEK/NbTW0nOk1DNx/iD4ZzDvWT0=@vger.kernel.org
X-Gm-Message-State: AFuF++mUWEUGm5vJQbAwNiiq1I9HWXxeuKOuDTly49qdZJbB4v4kk/jY
	PmWpi/FKUIq9XIXQLUabz7O8Jpa2BNO8B2Xfwgijzl3rYJMAfgn6z1Q2
X-Gm-Gg: AYBFou15tfY+Lm1TPP1mFmBrygPTvrZrvel1+s41inGRN0lhFzjojIQWMfoncyXqQI0
	/LiZiB8kuFcjQ8AoXEHQPw6cxDlk2iBs5R74pAQp8JAM8XFWk8xHlUj787OwoSuafqUkbyAMyPO
	zRwCm924rhUsKMJ2Hsm/WCfMGJ6Gl66NNH20Vtq9S/0M8LD6I/x8WEucCl71ylD4wqRNjMNOn18
	LQvZQCq4f4bKrsbgEGDKaM8N3ivFr28GEIezxv87fJRw4iqA8Ac5HOjwRXcSNlQog5sO/5KJeIq
	VdUam5m+GKQFPvNe9Qij6WljXiU3gSHf8aCbUm4oaPEJ5Yoht6WE1FAfeCtV3sjBfH0l1BwnkLc
	FHmVlprjIImw1rYMuSbJ4nZmZfdNEOnjW02SVNnVlQUiDV1RUoTW7xxmQaZpzX9YbsYiwDVT0K7
	/SdBaPXG7dMz9mwnu3xeBJv2knuzOWYSvhfitwZZNuyGajhvu6+UZdgN2DxDxiprj0Qs7/Q1vc2
	p5hV7G+aPtQ+vj6ZohAQA==
X-Received: by 2002:a17:902:ccc2:b0:2dd:c100:4249 with SMTP id d9443c01a7336-2df69de978fmr13493295ad.45.1790144955081;
        Tue, 22 Sep 2026 23:29:15 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:14 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
	ryan.roberts@arm.com
Subject: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Wed, 23 Sep 2026 14:28:28 +0800
Message-Id: <20260923062832.479455-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fb757d95bde25..d475e52110e4a 100644
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
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
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
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, pfn += steps, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1

