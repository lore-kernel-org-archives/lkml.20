Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589991;
	b=FibNrPYhObXXzhTEzpQyntdvd6HFdTBavedknpjV7j292TlYmJ2FTaprdrDkoiRNRRgW
	 Sok4MTOnPLeLFqTXhBrNZUTdjggPR9CRSnGgdX54PHJwuKC5ys5LajKoFYWiJQIsaBtat
	 hobhTsY1oWbkcDJj1mYDNssMo31I2t1dLktuc1JMoFOyo9zXvPbFa73hY7P+diyIyy3K2
	 eGPLhrGwnSWNZHqK/zbpkA5s7gM2bzTOYZx1mymZik9AihcmLUdj7alHf94qzR4ZD7gTt
	 umBrz9cPEBhA0o7LHCI7T/rUiEphLJUWXiJk3GAElYTwkqM3DEX4Y99+ZXLGSfNPScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
	b=vv1S/eh6tmpIbSrTZOEdjVl0b07AL+z0V19AfL6B9esIro2EdFic6MtHXZdbU+MsQZPm
	 7Ezbk0t4lSigOL48dtmsEdEuIdc5nakNFgP3j6IIIPCsZRgUpRfcNf+iRHPS61Dda39Tf
	 TNVjbraaQxOsSgMAtRr7aLpOZUBtuusJBiQeqxh1FQAMK5XmHVZFqxV57JafLkXV2+5OI
	 Ge3q+KZGWrO/y7K0L3jOQFmkdVtRNCvjDJeq7cX2xpaX+J/1XrGd1zXMBviVH2HZev8Hl
	 1nCMkZS0KSUecoMzIRuunFr96fzrMD1ej+EtIE6T0aPFVrLf29k9k6CFj5EMkrJbYQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LwPJIsDg;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EB6606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EB6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LwPJIsDg
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso56518a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793589990; x=1794194790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
        b=LwPJIsDg74jk70+cX9ly8s0NLIMcLgE8ePdpdtrzN2oF/qBvFALkp2jRSm/xjMOSlu
         faEwMZOZ4J7L4DNOl81lSLZR98kVzt5+Z+55PLoYc/Mk+27cTf1F4lb6tkb7nrSpKzBQ
         x9vNgi5/sl4HpKrpndpPp4fax8hoqHI2AJekzGNcodK2BgysmjsmIYpLx2Oi2N5Mb1vS
         aHU6U2MmJGbSVg0f53tcRpXRDdsWC7srVAnkzkS00wfOSkKr3CqEWCbWAmegNK0k2Vli
         P7Akh70dMLuIrl9pKY0tecyhpuHoW6uritW/k2evDKCWBNbig5+CY4jV2ozZ7JY5ruxn
         tc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589990; x=1794194790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
        b=UhCM6BxpwqmOdVq0p8dKcwE37gycrbLRLNeDodHKbuqfvg1jbIqeDlcQbrjO0KB7Wd
         tImSixQwwUFYhHkGxLdC7LImUsqib1JbLEo4OtobDGO3qrKwuQv+JZLmtuTlHI08zOvL
         bN6YLm5QNAzw00aKtAbUAigsETfhM6Z5O1eMQkWg2lUxMJ6OAQc7PNBNCWTm6q61FonH
         slGFAA0VUVUnm9WXvJOxDAW8BtB8unnHa0CFBEr44fJh+XngHrTg34FWrxfYRZcLKyyQ
         dp9auaN6wK7fFj0g+LQXDM1iprNhymJnuRbzAxYMoiI0+atKGAIk2TSAb008aFtwf94X
         WNDw==
X-Forwarded-Encrypted: i=1; AKwUvBwD4PLD1ct586s2H39ktEhtT663VfObCo4IaU06POhm5pBFNFRsKHv1HzrYsDkftnyth3fHT211aqWVEjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kqTEi+X79vCkShwsyeT7IEPmfo7BWG8ZtfSCh1LtNQmbliwgf
	7CKLsJ9m7IilMR69B8yYmtRHCc2e5OZoPEMcd7TPaJuyCA00nWAKUNt5UVMhz4KP0R4=
X-Gm-Gg: AYBFou11V2LKEOPtwu6DKb0Qh+52pHzDiIf3dxZko8mlw0JTi5VVMAY3e42w3LfVib5
	CMUzSzqoESYJR1Z7ZhGCkbyo2JB33/Se4dreD+bN5lURhwEFom/BpvK0c1gcwLlOSYpCXhVeXCu
	EWE5YA2rs6o69b6NdAqk6/J0ww/c/g895jNKbHAAVEZX+yjB4MGTFkF7YWzm3e643plwenGLVAs
	xgDHHRnWNJKkOMq1T8Whw+qeJEJx1GK+oT1858PlqDk4YtjIWk7ML5f/vgTKhDtanmcOATTMtpB
	jBhv+htC2D9luI7qJjYLW8dudOCHKfsqiIreNR78Bq8mK9+CUV79gnTBd8dQ53WjsNNwD9Afpks
	IQohGiDViJ69sXune9A0P2qXGUy9IcLxOWo9aVONairSgNVmuiiQYqOo9XNzfUKSHXtaDLLCNTP
	M3maqWMruePcktU1NPBefDfw3aqtUUEFJK+S5Jnfopmz0TXUrsjvbJSJIM7qkVJaxpUIL5US+rr
	csD2gs8AVgOgZWqX9dEZBFfg/Lacq1wHsLynvFsVIqXzjjp849Snp3TDHjtXzOd93YBS7qC8bDw
	BJ9M7YVxu07zv8g6Yqq7WODLpGnFoOOkXSkvV44JmserIXHmmw==
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr6776957a91.45.1793589989738;
        Sun, 01 Nov 2026 19:26:29 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:29 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 02/12] mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Date: Mon,  2 Nov 2026 11:25:15 +0800
Message-ID: <20261102032525.3597743-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
describe fully independent choices. A split-only walk can defer the
PMD-split flush to a later global flush, and a remap-only walk can
defer the final remap flush. However, when a PMD split is followed
by PTE remapping, the split flush must happen before the PTEs are
changed, because stale large-page translations must not overlap with
new small-page translations that map different physical pages.

Replace the two flags with a single VMEMMAP_DEFER_TLB_FLUSH flag. The
new name reflects that only safely batchable flushes are deferred. Keep
split-only walks able to defer the flush, but force the split flush
whenever a remap_pte callback is present. Callers that batch HVO work
can still defer the final remap flush and issue their own global flush.

Current callers keep the same flushing behavior.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Rename the unified flag to VMEMMAP_DEFER_TLB_FLUSH and update its
  comment (suggested by Qi Zheng)
- Update the commit message for the new flag name
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4b73d6ec8dce..63e899cfaac3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
 	struct list_head	*vmemmap_pages;
 
 
-/* Skip the TLB flush when we split the PMD */
-#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
-/* Skip the TLB flush when we remap the PTE */
-#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
+/* Defer safely batchable TLB flushes to the caller. */
+#define VMEMMAP_DEFER_TLB_FLUSH	BIT(0)
 	unsigned long		flags;
 };
 
@@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
-		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
+		/*
+		 * Modern MMUs allow overlapping TLB entries with different mapping
+		 * granularities only if they map the same physical address. So
+		 * remapping must not proceed without first flushing the TLB.
+		 */
+		if (walk->remap_pte || !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
 	} else {
 		pte_free_kernel(&init_mm, pgtable);
@@ -166,7 +169,7 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	if (ret)
 		return ret;
 
-	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
+	if (walk->remap_pte && !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
 	return 0;
@@ -274,7 +277,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 {
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= NULL,
-		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
+		.flags		= VMEMMAP_DEFER_TLB_FLUSH,
 	};
 
 	return vmemmap_remap_range(start, end, &walk);
@@ -458,7 +461,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	struct folio *folio, *t_folio;
 	long restored = 0;
 	long ret = 0;
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
+	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
@@ -516,7 +519,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 
 	/*
 	 * Very Subtle
-	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
+	 * If VMEMMAP_DEFER_TLB_FLUSH is set, TLB flushing is not performed
 	 * immediately after remapping.  As a result, subsequent accesses
 	 * and modifications to struct pages associated with the hugetlb
 	 * page could be to the OLD struct pages.  Set the vmemmap optimized
@@ -595,7 +598,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	struct folio *folio;
 	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
+	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
 	if (list_empty(folio_list))
 		return;
-- 
2.54.0

