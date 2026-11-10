Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333595;
	b=z76FCfgGIY/inUrwfXP1sPD64iLJR9EnZCAU/TGWmMb/5Gh+8c8mniQVoVRAapotEJYj
	 Y+z3bWios3QZQRgoqih/HH1obn5iPSBIEt6HAfWYKJeSZv1GLt/JSyBmg+Nhm9tSf6FJo
	 W2DWJKqR9n+3T8Z1c0zyIMPrsLCbeDMZXwJQh/mCJHlfLqFj8tDIh3xHqTCMI63GlSRbY
	 S71eaeeWZr0ZyhTpn/kJaAh2b5U97VhMpKYk3Sx6m/K57H/zip1u+iOO8vDETjLyys22P
	 N1mFaDYiyqikvDv546fAdf3FL19bD5n+i65usC0I8se4xikw+13VyU0voqNe0RAEE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v5hDUSqbTuz9LFPhC9eqz5SNXuJ9mfPMxk2F/tftndY=;
	b=OYtH6yMS4IKYfpjoVHl+LUn4voY82ZyWOcgLcTfAZL8fvRvPeLdrGQ7a2QzfapDahGuy
	 GCVhyt5quUDjrd9XgT1w1n3qADiVNbrh9i2J1IB7MZBy7BpQI5Es0hHOtOS/59s3Z9Uay
	 X9+NyzYMmvlzZUW76tdS/GTHFeN+x607e9cNu1oPkhTverN46As+wYUbL+q4d4yvR7QIN
	 iqpZttNy4JwiQnxZExsCX7FEohKjvvhWJQ0wUvG88Wp364c82hx+7BldlCm7mxjoxh5Ug
	 6/VC+dO+wfSlllij4AJdAwWPgkPy3Chg4yjfEBDPbvQ11wG7X42c6Mb3XXlPt6TtLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHc7yO1E;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF88606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF88606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHc7yO1E
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so4033900c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333594; x=1794938394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5hDUSqbTuz9LFPhC9eqz5SNXuJ9mfPMxk2F/tftndY=;
        b=iHc7yO1EDPxUPABXoE6RzgrxUoRZR9McR5quRu8YB2pmPyiroEvbDpugwX4FwZUANG
         Wgq7pJZ6asCpEBRbQAHxx55x5g8h3x7flLhwes1MvojqebelHdb96D76CUh24xT4PpGb
         cmO5nLzN5as3eJRyL7ev3QI4YTmY99PTQy+tnh6rYgvqVzH0nPP22nUDqgmF7Wq4ac5P
         3dzPdd7ZvEyvQdIof0cg+WF47Ht0HoSKBx8OlHLqG2LrOPjbCKuBQHI6yIcWeoj/jwT2
         1HqnGkRt99Vlg/uZVp+6LH0mrx2KZWdFDVjGFu5rdVkU87a2f9e1jTSWH31FNtmMFK6U
         Gdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333594; x=1794938394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5hDUSqbTuz9LFPhC9eqz5SNXuJ9mfPMxk2F/tftndY=;
        b=FKxIa7TyIe0hTsdip58ERSncyqq8ME1j2g+yjyYPh2GL/AsX2j+ABmanp/8CO0mOhX
         jmX8whiYiIYz7HUEbWOz73OeIUL0Ir/C1djr303wWpYF3wUcjzoWCsZ8pK1OCL040q31
         5igJEjD0LdMEuSN6HGtbLOZ/yW7Hg5wnZ1WfjayrXSrZGZHhxz5Wqe5iKuNN/c8W/Tvo
         uOazbL32/C8aNu948J+8O3IbknkNxjeT9PbmmKPaomNIZSjKEq+RMsRlJiKJlAxBJYCV
         whbrEhWUdYF8wO68PmDx59/z5pASksRiDmenD4Uj3tyUGNwkHdHKU107rRm8I71M04WN
         8wTQ==
X-Forwarded-Encrypted: i=1; AL+hErGTa2sxHJC0pwEKkUOaSh//IWCZ9JgHMY3qOuea0YippMzHZj8TPaIIytvQIlRvPkIXNPiGgyWcahS5Tdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tQVq4h3/jj4UPcGF97NZjDGEx7h4v9H4JblcKylaQ190r++vt
	3Hyyyp2uWXOt/LrBLNgVWtQPPYrMMZyt2VCTDkXb8JFw8lNjRvUX1uri
X-Gm-Gg: AYBFou2+Wnqju5d8jM8Y1aVaMNmn9a5EjohfyUTF8un0xAQiNjqmGiOm9TCPJ4D86SB
	aU5ptepCbjhrEQGWQTABCwIZhrCFQmhFo/d7ppw8USa58n8m22Jz8njA+UyFiWzodxCH9uUuUD/
	7bLKR7pjADrBhHxUtRJPAPRwsx1/NqWnKBDI7ztToiUqe4R2cWayYkXCiNsyW9fUd1iBqBhWb1C
	lwVIUgJ3iSY7eHSAvly4MUWzyzKS5fG7JvbBdT0SMwkGxL+glDv6fhR37VXCGU0XTQvy8H8tIX6
	Mhm6Wd6TDpz8XEihFAx93nq6QI/8OlG0Sjtu0FYvvCl809rLONBxCpvSQSjy9JO412QTwdbyLIu
	Q3tI/K0deRYCd3Leda6YoeSC3MAfgToPDINolIyreu0W1a66Yb232+jeGtnpPTuKVboX6pqeVLI
	oWqYUFXUOAUmvej87hXAIHv9ARYXfA376fC3p6fM0qi3/V6oOXSQ+jqbwm3Lz586q7NtEm7QUoU
	45fo5/PgwROuyBa3wPdTKEqbBJGRTwFGC9k0WoCjRLyWrntTaesXlSU6c7GgBMEt5xk5owvkmh7
	xjLR/0E6QwN6R27B+BMbF3ncuSVGC0nkR3gql4FSONSYM8pWoM6bC/EbMoJ3
X-Received: by 2002:a05:701b:4554:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b3b5fda3camr4660963c88.7.1794333594295;
        Tue, 10 Nov 2026 09:59:54 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.09.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:59:53 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 1/9] mm/huge_memory: read the huge PMD entry once when splitting it
Date: Wed, 11 Nov 2026 01:59:16 +0800
Message-Id: <20261110175924.2945538-2-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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

__split_huge_pmd_locked() re-reads *pmd several times to classify the same
entry. The PMD page table lock is held throughout, so read it once into
old_pmd and classify from that.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb913acb03b7..b643e264ca23 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3188,10 +3188,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	pmd_t old_pmd = *pmd;
 	struct folio *folio;
 	struct page *page;
 	pgtable_t pgtable;
-	pmd_t old_pmd, _pmd;
+	pmd_t _pmd;
 	bool soft_dirty, uffd_wp = false, young = false, write = false;
 	bool anon_exclusive = false, dirty = false;
 	unsigned long addr;
@@ -3202,7 +3203,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
 
-	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(*pmd) && !pmd_trans_huge(*pmd));
+	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(old_pmd) &&
+			!pmd_trans_huge(old_pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -3238,7 +3240,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (is_huge_zero_pmd(*pmd)) {
+	if (is_huge_zero_pmd(old_pmd)) {
 		/*
 		 * FIXME: Do we want to invalidate secondary mmu by calling
 		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
@@ -3251,10 +3253,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	if (pmd_is_migration_entry(*pmd)) {
+	if (pmd_is_migration_entry(old_pmd)) {
 		softleaf_t entry;
 
-		old_pmd = *pmd;
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
 		folio = page_folio(page);
@@ -3267,10 +3268,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			anon_exclusive = softleaf_is_migration_read_exclusive(entry);
 		young = softleaf_is_migration_young(entry);
 		dirty = softleaf_is_migration_dirty(entry);
-	} else if (pmd_is_device_private_entry(*pmd)) {
+	} else if (pmd_is_device_private_entry(old_pmd)) {
 		softleaf_t entry;
 
-		old_pmd = *pmd;
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
 		folio = page_folio(page);
@@ -3462,7 +3462,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(*pmd))
+	if (!pmd_is_migration_entry(old_pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
-- 
2.34.1

