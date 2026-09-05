Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A73B7A8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633131; cv=none; b=AF3m5i2f1PeXEdhH71OxpC6EhSM8R4at9mKX5gspuQYIG8+Pm57+508+758Azv7ofOJkKUOijayWbFiaGfQYHvxiQtVZLAL568TrDTmWG4J2cnBJwEqMqiQcByVtYE7kWM90zH6jMQ6Mk2D5CEzn1FmJ95K0bPC0Ck3VTAXIqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633131; c=relaxed/simple;
	bh=k6HPUqzeSFwsPf41tPOFciWylz7Rq1ysSgyVS9Jknfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uyv+17ZX5k8itbTIZNtutqhpKflqrH4G3i20f69QEbeQdFEYNBl8HXOzbbZqsM/TyyQyzKvUFplOfjvhdjQFav8aAmnSWBGLzFt7dwCQpKKrvHa9DyMDDabiNTixV7/QCkwICXhhLKLkGecpqF2y3ve4bNBOwSc6e/x5fWldJHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHC4/yaJ; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHC4/yaJ"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49cfcf2548aso7026375e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633127; x=1789237927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQhtRiM/OzSt8Zhsf9bNwGzEPuThkXQQtWQPWxIhnCk=;
        b=sHC4/yaJ8fWNyTH0tw1BVSdHEEsxIC9uqAjhcLL51E/OatvipLTfo7p8F87ZbyrTwb
         LSq+pua9Pz7KRcUjX6aEBSYse84iO4vcLd0byOcmhb0AllGBjH7V1e852VmRgyMEfZtV
         lskPdX02bvVnJHS4l0oTYFjai6/Tno3MWWeyw+1SJJ6iOahkG1m63qlFZZEauWQDUixk
         d9ufwdFfExq/wTCUr5xC/9a8Aw/x45yKFO6CPq0DyfzYeSXhQXrGkWqACq+Qen6vhraE
         USNqyh/cWRWmny2Nk9miWWS8+JWiOMjYAe6tg0lq6YJMAZltXbGkNVWZNPOCg9gl4Mbn
         cyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633127; x=1789237927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GQhtRiM/OzSt8Zhsf9bNwGzEPuThkXQQtWQPWxIhnCk=;
        b=aYfzVmnloDhF2yhc1dTEh85W4ZHSBGgYs+PGZm7Nk3RwxhVKHGVlp9qYQO7sozGDfP
         z7Npxlti7aBzngWqVEjE+v36ZcUMMgkboii/xKA+RekvMJy5Ph9jAUU73Doqj5hZVDuw
         He7ks+jMnkroKR7VlL8b3evi+EhqL9zdOj7Z6ejKIyBpu7VhksOnWFfl6b0feICsq2bY
         77G8KA4FfieavVzJR1j73CJ7JkcGlEJxLGcQVwT9nIQDHhw7Z3DTYlTQ07TrTNas7psl
         tS9K9LM30tx0kV/dAY3+MBxI5Yqvstgd4BtpVhEA9PWOS4H3BLBa9hjBPgi4Ytj5ZQRp
         D4PA==
X-Forwarded-Encrypted: i=1; AKwUvByXDZhztK7qg23Im5lty/ePmFfCgD6ALMUW/KjYyfA5Lbqq7/sydv/4/kmHcwqKu7E4jcSyYZeejG3i+Js=@vger.kernel.org
X-Gm-Message-State: AFuF++kvpIf9tvffo0x9XS5FYMP8HAh1gKzJcdlCHWYBOBgUKK3sBKl2
	hxq4+kLacslG9hJP7A1NM2edqhBytHSsYGLFzj3KY5P8MLoAoV3AWZ79
X-Gm-Gg: AYBFou1nI4cUA+SHHO8ota7Ul/pCZC7KamRk2LpZYbBiRgf3pPgl5orbJBUs752+aWb
	mJHFAKOi22gj69Ptw2BmXXdUVPj3bdiVka9VgFviYOG4rZbJ2nWMJAdg1GLWEsZ2PCbV6EpBCWm
	iQibzAZ+zOW1bbeRycjyCg5NUEUNg1azdCNyKgFXJs1ID4534w0PIU+L4MLhxZTl21VHc4uGKhJ
	jEwsnBk7c6GhvsEf5G1xAKrDyaS62hst6kumhTPYSrCuE7C9HPy7UaeLZv8G3fiUTlBumGGQF/n
	iP0oqTuYSuUtTE9g9kYmvZnpww9esHP9hW/BP8hRqABD7xu96uMLzpprLvjme3lic2U8JCZl0rK
	1cc8hBHdV9+QWQ9VOTJKRWlfuLadyBicsZ4hjpSG51TRvOXtiHOnrz0AOllT8FYm0W0jzeHykwy
	7posZ5ToYjOlaqu/7v79B0+aKlYc9J7ts2wGx9zckVwJ51n+0qbhKgD61R/pcnPM0atxbnNxz0V
	Ou7r1pT8QL0SNr+OdKp5GLIZoO2cg==
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr120992185e9.18.1788633127562;
        Sat, 05 Sep 2026 11:32:07 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm13066670f8f.3.2026.09.05.11.32.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 11:32:06 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH v2 3/3] mm/hugetlb: fix various coding style warnings.
Date: Sat,  5 Sep 2026 21:31:35 +0300
Message-ID: <20260905183135.20993-4-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
References: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style issues flagged by the checkpatch.pl script. Specifically:
- Fix block comment formatting to keep trailing '*/' on a separate line.
- Add missing blank lines after variable declarations.
- Remove unnecessary braces {} from single statement blocks.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/hugetlb.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..3b00e76332ac 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -145,7 +145,8 @@ static inline void unlock_or_release_subpool(struct hugepage_subpool *spool,
 
 	/* If no pages are used, and no other handles to the subpool
 	 * remain, give up any reservations based on minimum size and
-	 * free the subpool */
+	 * free the subpool
+	 */
 	spin_unlock_irqrestore(&spool->lock, irq_flags);
 
 	if (free_subpool) {
@@ -3700,6 +3701,7 @@ static void try_to_free_low(struct hstate *h, unsigned long count,
 	for_each_node_mask(i, *nodes_allowed) {
 		struct folio *folio, *next;
 		struct list_head *freel = &h->hugepage_freelists[i];
+
 		list_for_each_entry_safe(folio, next, freel, lru) {
 			if (count >= h->nr_huge_pages)
 				goto out;
@@ -4188,9 +4190,9 @@ void __init hugetlb_add_hstate(unsigned int order)
 	struct hstate *h;
 	unsigned long i;
 
-	if (size_to_hstate(PAGE_SIZE << order)) {
+	if (size_to_hstate(PAGE_SIZE << order))
 		return;
-	}
+
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
 	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
 	WARN_ON(order > MAX_FOLIO_ORDER);
@@ -4832,11 +4834,11 @@ static pte_t make_huge_pte(struct vm_area_struct *vma, struct folio *folio,
 	pte_t entry = folio_mk_pte(folio, vma->vm_page_prot);
 	unsigned int shift = huge_page_shift(hstate_vma(vma));
 
-	if (try_mkwrite && (vma->vm_flags & VM_WRITE)) {
+	if (try_mkwrite && (vma->vm_flags & VM_WRITE))
 		entry = pte_mkwrite_novma(pte_mkdirty(entry));
-	} else {
+	else
 		entry = pte_wrprotect(entry);
-	}
+
 	entry = pte_mkyoung(entry);
 	entry = arch_make_huge_pte(entry, shift, vma->vm_flags);
 
@@ -4919,6 +4921,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 	last_addr_mask = hugetlb_mask_last_page(h);
 	for (addr = src_vma->vm_start; addr < src_vma->vm_end; addr += sz) {
 		spinlock_t *src_ptl, *dst_ptl;
+
 		src_pte = hugetlb_walk(src_vma, addr, sz);
 		if (!src_pte) {
 			addr |= last_addr_mask;
@@ -6321,6 +6324,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 		folio = alloc_hugetlb_folio(dst_vma, dst_addr, false);
 		if (IS_ERR(folio)) {
 			pte_t *actual_pte = hugetlb_walk(dst_vma, dst_addr, PMD_SIZE);
+
 			if (actual_pte) {
 				ret = -EEXIST;
 				goto out;
-- 
2.55.0

