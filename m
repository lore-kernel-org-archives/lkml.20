Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F005484238
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989268; cv=none; b=e2yJ6TE/OyNgNgzpbEciBpI+fr7e7gVJ6cVbQyyz0K/osWl9Aet8Y9i4Vpg8qPQN0VsFJDIosd+NHbiYSwhZ8De8c2If3T9Vd28J7strSiFDc+YbVdZHJouXS4SJO254OvpXdhg0PXPK+ShFHxV+qSreGKfGtvCOHEkcpkKgNck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989268; c=relaxed/simple;
	bh=1jg1XxWMFzFAotXiHpvxbD8wsFp6YWqm9Uxeq0aUeV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU/n+0u0s/r/Th2DmEPZNGHzOhHV56uJ74GE0f5UsxYhEaRllmZabi3UhNoQcHY6SiWNI6ELBr3mD0vG2xHoYZKCQl7zF/rRrtnd5m5gBlooVAfn2dNUBES9n6KwA6zFGdUuVKT7KIoTOLYiXf8uCwPDSGBuhaLq0LtrKQlzB4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBzRnrvp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBzRnrvp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so33621205ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989264; x=1790594064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOHOI1E8fGa5CU5V13c9pAIdSK9plZJHC6KFQ2NxiI=;
        b=FBzRnrvp0gBU6Yet5j1nepLE+K8P+GMBuDeoX/06fyykYHBs7XemjVfaELpoRkpv9X
         CpEmddG4LkZvUz6fBa64Z6Q/GpZeDg/c/+m4wILvIuoaytVxv0RsIpod/lGV9EQqMggn
         1+eAKjABo/KgpNKOP173d2j9H2V282NjsxehrnBCKGaS02EvBPnVOYnjoYUgepqrIp4i
         yfmX8BAnMZ/Zm0Jo7CAe+HdT2gphdeQ17s5b/m1Zuv8fvuahfWtVJYk7Dq812gnfayQm
         jpVmfVU6jgCWvdedZRQNUJYgTH/7+F98jPwiRXKseifZOGnWVIDw02/YUZm7tM6u987Z
         gqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989264; x=1790594064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdOHOI1E8fGa5CU5V13c9pAIdSK9plZJHC6KFQ2NxiI=;
        b=hpbMBl2ESsCFTytQQIXQvp5hjYFMKuoUhWaVkNV7wzq1ItZVxiw8eF35wR9CFbMO0P
         PhsN4OT/xrMS1VSU+iHku2pYgAjHmm7Xoi37QzyF79N7ulDcsxssz85PKIG9295VpC8T
         KgGY4FnvaAG//E51kimSxGiUoWxlzlL4yp33wwX0rXrHhL/eBh/iJgr7kbzApRJPADxt
         l4nHJwL50jK2tbggqtgP6JKNvBE2ktrGp0gFnJOj516MqlGwLQ37hGpjH2bUw4g64ezO
         88qaB9OqbvUfjP6KxyKIBQ5Cs0apsAHQHbZwOqjqQc40UNVJejlzmmAEm+giq1lpoLjk
         NaWw==
X-Forwarded-Encrypted: i=1; AKwUvBwM58CHvPax/XWeSZHqh/PBUyrEi8zWrACTPel0lsKAv5ltyj4Mdgq2MXUDmkzXkNitvguu75TOgSpL8Kc=@vger.kernel.org
X-Gm-Message-State: AFuF++mJK8YOwe92ysTi1mm7a1bjjvsL9WCqk+40KWT6K6QKe811ip7R
	pfVNTikTVqUMW7oemZXjJQWIPQX/tNeNE1AFCogduyOLeJXImBDMkWpv
X-Gm-Gg: AYBFou10gX00MTrJr753h/1hHiSOl0TIXgb+rEZjuzj1Or+gnvaCyqj9ERuJQe/YguG
	W7FwCqI1hnCgXJ20UmrXvE2IiJkdjEASC1fwuBGttvaKaxEuH8mbBZ4qmotbgHVvN/F+ifKK79Z
	WqD62JPucoWfiL64rJq3l/3FraJl4mvgEHRvwWm4IZRbbTw28elnwa+gyCY9ssJWG430ZrARz4M
	NDY0rdsm20ttGzr6scmS4vy4DVC/oybCY09DggcB7fOlhfpTlZEoWXLfI7O+mNKrBrOn1MZ3baF
	oAcYEjLN9qiFgQmonUz0HehKqwTviy7e7dt4g7NOr+aSKgSCI5q2rUF1bKfe7zWDLJDwQvmsIpi
	27c6AF4kc7/AXIDYdWJwvSUMGlzQ34oWSXKheLzvk8bDiVm+9Z79ybvmZzv8tYxnMbGefZpqrtI
	lKABBUoHzkzgmAkhj6g/nYZW6wKLPWT+anZuV7Xo2IuBZBQCnKI6645bR16i9FQ3f4pdvfZOfOq
	zH6OpAFAUjZv9rzCXSZveJgAka7uzAz
X-Received: by 2002:a17:90b:35c9:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-39e6c6a674bmr9093523a91.47.1789989264562;
        Mon, 21 Sep 2026 04:14:24 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:24 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 2/5] KVM: riscv: Read G-stage PTEs once when walking page tables
Date: Mon, 21 Sep 2026 20:13:59 +0900
Message-ID: <20260921111402.120911-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gstage_pte_leaf() dereferences the PTE pointer, causing walkers to read
the same entry multiple times. This is safe under mmu_lock, but a
lockless walker could observe different values when deciding whether an
entry is a leaf and which child table to follow.

Make gstage_pte_leaf() take a PTE value and use a single snapshot for
presence, leaf and child-table checks. Also remove a redundant leaf
check in kvm_riscv_gstage_set_pte(), where mmu_lock prevents the entry
from changing.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/gstage.c | 48 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index f61ba434093c..944fa4c95aea 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -19,8 +19,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #endif
 
-#define gstage_pte_leaf(__ptep)	\
-	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
+#define gstage_pte_leaf(__pte)	\
+	(pte_val(__pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
 
 static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
 					     gpa_t addr, u32 level)
@@ -84,14 +84,18 @@ static int gstage_level_to_page_size(struct kvm_gstage *gstage, u32 level,
 bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 			       pte_t **ptepp, u32 *ptep_level)
 {
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	u32 current_level = gstage->pgd_levels - 1;
 
 	*ptep_level = current_level;
 	ptep = (pte_t *)gstage->pgd;
 	ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
-	while (ptep && pte_val(ptep_get(ptep))) {
-		if (gstage_pte_leaf(ptep)) {
+	while (ptep) {
+		pte = ptep_get(ptep);
+		if (!pte_val(pte))
+			break;
+
+		if (gstage_pte_leaf(pte)) {
 			*ptep_level = current_level;
 			*ptepp = ptep;
 			return true;
@@ -100,7 +104,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 		if (current_level) {
 			current_level--;
 			*ptep_level = current_level;
-			ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 			ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
 		} else {
 			ptep = NULL;
@@ -151,10 +155,12 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 		return -EINVAL;
 
 	while (current_level != map->level) {
-		if (gstage_pte_leaf(ptep))
+		pte_t pte = ptep_get(ptep);
+
+		if (gstage_pte_leaf(pte))
 			return -EEXIST;
 
-		if (!pte_val(ptep_get(ptep))) {
+		if (!pte_val(pte)) {
 			if (!pcache)
 				return -ENOMEM;
 			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
@@ -163,9 +169,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
 					      __pgprot(_PAGE_TABLE)));
 		} else {
-			if (gstage_pte_leaf(ptep))
-				return -EEXIST;
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 		}
 
 		current_level--;
@@ -175,7 +179,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	if (pte_val(*ptep) != pte_val(map->pte)) {
 		bool was_invalid = !pte_val(*ptep);
 		set_pte(ptep, map->pte);
-		if (gstage_pte_leaf(ptep) &&
+		if (gstage_pte_leaf(map->pte) &&
 		    !(was_invalid && riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)))
 			gstage_tlb_flush(gstage, current_level, map->addr);
 	}
@@ -316,7 +320,7 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	unsigned long huge_pte, child_pte;
 	unsigned long child_page_size;
 	bool need_flush = false;
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	int i, ret;
 
 	if (!pcache)
@@ -325,16 +329,17 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	while(current_level > target_level) {
 		ptep = (pte_t *)&next_ptep[gstage_pte_index(gstage, addr, current_level)];
 
-		if (!pte_val(ptep_get(ptep)))
+		pte = ptep_get(ptep);
+		if (!pte_val(pte))
 			break;
 
-		if (!gstage_pte_leaf(ptep)) {
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+		if (!gstage_pte_leaf(pte)) {
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 			current_level--;
 			continue;
 		}
 
-		huge_pte = pte_val(ptep_get(ptep));
+		huge_pte = pte_val(pte);
 
 		ret = gstage_level_to_page_size(gstage, current_level - 1, &child_page_size);
 		if (ret)
@@ -373,7 +378,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
-	pte_t old_pte, *next_ptep;
+	pte_t old_pte, pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 	bool flush = false;
@@ -384,11 +389,12 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 
 	WARN_ON(addr & (page_size - 1));
 
-	if (!pte_val(ptep_get(ptep)))
+	pte = ptep_get(ptep);
+	if (!pte_val(pte))
 		return false;
 
-	if (ptep_level && !gstage_pte_leaf(ptep)) {
-		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+	if (ptep_level && !gstage_pte_leaf(pte)) {
+		next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 		next_ptep_level = ptep_level - 1;
 		ret = gstage_level_to_page_size(gstage, next_ptep_level, &next_page_size);
 		if (ret)
-- 
2.52.0

