Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96F38E8A8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155729; cv=none; b=hdJX/Dn3f83Cj8/GArAwsucNlZrtA9MIbKoXafm4u32P/lCMwG+SlVY5fGXlhIhgjoZ8VKhYE2IIpQ38otXji7Uu0pzGIRrEMMXTCcLqGXeqEKMrXlJHpQsHLNhs1KL18udYLlXMLY4s3RcFRxDIH0cSuEd5ZLBkR+1b2uqV6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155729; c=relaxed/simple;
	bh=fUxXDYw3T1gUirTrhaVtgZWtvxsAdhHi4+wohdyk030=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lcXa2ARJgQQ7AJbFKgdPTLdcMhKgGMo37B0WRiChFZR+Z18R3yE5+p/P8d14jQVCbWLJBDGuNO/0ivtr+6sVkF5ppCODEmbn2WeeF9r+MhlrlpkBw0BFs/T4K7stWQBCnytFRK4qMDjsGdDRusP7vDqgGvyF7X5Wxc9WRs/JcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YX9IOoyD; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YX9IOoyD"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db050d469fso34567805ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155713; x=1789760513; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YI2R/SdoKPqweMYYzjbXGeDWKwn1DHCKfjSC8BU4ikg=;
        b=YX9IOoyDHCtVX5kYiuXg61qs2GEN+0EzGzp3ouuKpfKmmSFdCKlxir45/tB6dvV+oQ
         bfo2KoZQh9rwm5mkEKJwmGh8oQbhQJpo6I7sxEDzbxzrEUeFTZNCTRzWVmmhb4WHaiMm
         UKo9Sv/2ErmESr2us9G9G9ak5hVORfhdF1U53U4ulYfK6mDuLQdFexKnACiHg1IRkib1
         VvcCs/psqtcoOZHBCMr24cm6kYZyg7LcSabhxGKjTIl3bSKJtmmy1zLetid30OEMGsCM
         IvLZ9pf/+rxokGKXyaIqjSGO0wEQ5+RiL/L1VLNwS0itW27H7hUfXQXaB7AS0Ax9YqsC
         EYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155713; x=1789760513;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI2R/SdoKPqweMYYzjbXGeDWKwn1DHCKfjSC8BU4ikg=;
        b=iiNmC9fnFGXCGGSDoqojgemQRXYrtlP4wfYo3QzjC03SFBya1BovsoeU6mTjDbtG5S
         5YZKmVyIhX0jB+Xea7Gbw+4RM/6M5pclR7AT+oRHcrbMgGvPKmY18X8Q9o0XYAkma9cj
         Wr7p57wref+ULKc7LISF50u7lvtkH8aExdU9WQAVVqrK1rIogPJEgUL+L4s+YCE7aBO2
         F7mP4vCWX01f+YsfCefI0UP9MEfAxKl+2DL4pUs0Q7HGlZgQ7p2g0kE0rTQg5YF1s43/
         pgDm5i0lJK9tYXwXp8L+/Z5pDMcl4Brdn8SCP+TErWpScK9xnU/px7uDXopamyfsAJHo
         Flig==
X-Forwarded-Encrypted: i=1; AKwUvBwFQiKHfumo3gjRvORotsxA2dn1GnZYON2+hpVP/wSz0QxrebX92HwZzd4qRCDSrbMCO31raebAZ/c4jvk=@vger.kernel.org
X-Gm-Message-State: AFuF++l4Yxrw9Uc+MiqaUeljyPMgoOu5E/l5l63s1RvSv5Ltc4kNyMSF
	iB4DUo1V5wkDVHNLcRLDcuvGhovkFFvgLkJL7qJS0fgOX0Y2u+qmgKkENQ7SDCk7RS10Mi5rqFD
	8Lz7OHg==
X-Received: from dybrp10.prod.google.com ([2002:a05:7301:460a:b0:339:7bd3:e896])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:38cc:b0:2db:3734:cfa4
 with SMTP id d9443c01a7336-2dd0e8a0ef6mr117429835ad.5.1789155713246; Fri, 11
 Sep 2026 12:41:53 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:41:40 -0700
In-Reply-To: <20260911194145.1781926-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911194145.1781926-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911194145.1781926-3-surenb@google.com>
Subject: [PATCH v4 2/7] proc/task_mmu: remove unnecessary inlines in function definitions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@kernel.org, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com, 
	Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"

It was pointed out in the previous reviews of this code that many
functions are specified as inline, which is unnecessary as the compile
can make that decision by itself. Cleanup these definitions.

No change in the resulting binary file size with gcc v15.2.0.
No functional change intended.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Liam R. Howlett (Oracle) <liam@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: Usama Arif <usama.arif@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 fs/proc/task_mmu.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 2f500d639db5..cfc7af1b551d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -130,7 +130,7 @@ static void release_task_mempolicy(struct proc_maps_private *priv)
 }
 #endif
 
-static inline int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
+static int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
 {
 	int ret = mmap_read_lock_killable(lock_ctx->mm);
 
@@ -140,7 +140,7 @@ static inline int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
 	return ret;
 }
 
-static inline void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
+static void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
 {
 	mmap_read_unlock(lock_ctx->mm);
 	lock_ctx->mmap_locked = false;
@@ -177,8 +177,8 @@ static struct vm_area_struct *get_next_vma(struct proc_maps_private *priv,
 	return vma;
 }
 
-static inline bool fallback_to_mmap_lock(struct proc_maps_private *priv,
-					 loff_t pos)
+static bool fallback_to_mmap_lock(struct proc_maps_private *priv,
+		loff_t pos)
 {
 	struct proc_maps_locking_ctx *lock_ctx = &priv->lock_ctx;
 
@@ -194,7 +194,7 @@ static inline bool fallback_to_mmap_lock(struct proc_maps_private *priv,
 	return true;
 }
 
-static inline void drop_rcu(struct proc_maps_private *priv)
+static void drop_rcu(struct proc_maps_private *priv)
 {
 	if (priv->lock_ctx.mmap_locked)
 		return;
@@ -202,7 +202,7 @@ static inline void drop_rcu(struct proc_maps_private *priv)
 	rcu_read_unlock();
 }
 
-static inline void reacquire_rcu(struct proc_maps_private *priv)
+static void reacquire_rcu(struct proc_maps_private *priv)
 {
 	if (priv->lock_ctx.mmap_locked)
 		return;
@@ -1230,7 +1230,7 @@ static const struct mm_walk_ops smaps_shmem_walk_vma_lock_ops = {
 	.walk_lock		= PGWALK_VMA_RDLOCK_VERIFY,
 };
 
-static inline const struct mm_walk_ops *
+static const struct mm_walk_ops *
 get_smaps_walk_ops(struct proc_maps_private *priv)
 {
 	if (priv->lock_ctx.mmap_locked)
@@ -1238,7 +1238,7 @@ get_smaps_walk_ops(struct proc_maps_private *priv)
 	return &smaps_walk_vma_lock_ops;
 }
 
-static inline const struct mm_walk_ops *
+static const struct mm_walk_ops *
 get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
 {
 	if (priv->lock_ctx.mmap_locked)
@@ -1572,7 +1572,7 @@ struct clear_refs_private {
 	enum clear_refs_types type;
 };
 
-static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr, pte_t pte)
+static bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr, pte_t pte)
 {
 	struct folio *folio;
 
@@ -1588,8 +1588,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 	return folio_maybe_dma_pinned(folio);
 }
 
-static inline void clear_soft_dirty(struct vm_area_struct *vma,
-		unsigned long addr, pte_t *pte)
+static void clear_soft_dirty(struct vm_area_struct *vma, unsigned long addr,
+		pte_t *pte)
 {
 	if (!pgtable_supports_soft_dirty())
 		return;
@@ -1620,7 +1620,7 @@ static inline void clear_soft_dirty(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
-static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
+static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 		unsigned long addr, pmd_t *pmdp)
 {
 	pmd_t old, pmd = *pmdp;
@@ -1646,7 +1646,7 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 	}
 }
 #else
-static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
+static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 		unsigned long addr, pmd_t *pmdp)
 {
 }
@@ -1846,7 +1846,7 @@ struct pagemapread {
 
 #define PM_END_OF_BUFFER    1
 
-static inline pagemap_entry_t make_pme(u64 frame, u64 flags)
+static pagemap_entry_t make_pme(u64 frame, u64 flags)
 {
 	return (pagemap_entry_t) { .pme = (frame & PM_PFRAME_MASK) | flags };
 }
@@ -3388,7 +3388,7 @@ static const struct mm_walk_ops show_numa_vma_lock_ops = {
 	.walk_lock = PGWALK_VMA_RDLOCK_VERIFY,
 };
 
-static inline const struct mm_walk_ops *
+static const struct mm_walk_ops *
 get_show_numa_ops(struct proc_maps_private *priv)
 {
 	if (priv->lock_ctx.mmap_locked)
-- 
2.55.0.1007.g17ff1f9808-goog

