Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0E3BC68D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075071; cv=none; b=nYv80yTOzdhNgQZYfABAHJDzOZndY/HcL4ryFA2hfetd/ikrWPC1w9/PEKCe07DaDZy07DJouZM4VTRcAEd9gJnzf491wyJLYAY8oQgV82bDI8gg/cSmA/WAXfupaWOIIwv76RUC+kacxuYJsUnPi9Ln4KBm8vV8RgJtddGGND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075071; c=relaxed/simple;
	bh=fE7ZEs+HZw7jAzhbN1V6IHtbB/2B+h2P9T7DsacF7zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2vB/AbVFhYXdNB/hFrXea3S46JaTsXe0ty1hP2EUWlBZvHKOhr+9mAVe09ktz5lHUtbGNjp9/mPykxVZtYKFgxX2IwZvQOBhRRIqr7ptI+XJfydt3Qy0EQ1xjHJhkPaLW1uZQFQ1/7/BVCZNwcpDrWd3RoGaavBbqNcPx4hkqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmaCHChh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmaCHChh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so177238a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075069; x=1792679869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzlE60HTAGr+gfmDoDFGpsVbnSFEzyvSpQks7NPwYvU=;
        b=ZmaCHChhTw6wSMSsIMDWySPOV0orVN+x8Y3ukm38V7ekeo9zo3oxXpRpKhYzbLy2Qy
         fAkszD5PYN730NDb1XiOcniKQPNnhRhjqiOHUWbq52fidvHZbU74eefS6A6dyle7rCZG
         EZO3eTvo2IwGFH4kv/daU/PdStZC/LIdss0zZEit5Db8AJW1L6EJPVvzHj3Th4P5hAjo
         6ZHq7HSNElea2ywcwRHsktSnWYxmLciUZEOxsMygEt8J6vagXU5N3S51AvudFlzEl8xx
         mgAFtYpfCgcDSapirqQS7HbrOU7OL09JGijZnuNlY7w/ufmcVD2eGcV8HEDtJJzVTbwL
         V34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075069; x=1792679869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzlE60HTAGr+gfmDoDFGpsVbnSFEzyvSpQks7NPwYvU=;
        b=Kuac/EQNy+49Ie+BCq0tbanwy4/9kmneOQMq2Xl1+2ojKwxPHCd+8KAxo6HCFRNuiQ
         Tg2xo+/a5772DvJArzk/hn8K3p0F0FChqiOKJc1lGA/0gyFElkgr/VIx65EZSLYHn/ed
         7alfcCfp0+6TwMtJdcddWw3ExlIp4rhFxgUy0IC7pKj+s7vje6+EHvYA/vDerLRs9gme
         XuwrlaAgmrpQ87UPcaZXHaIUoFl/DiBK0PWdpmN8ToiPUjf0mQY1/SfGkBo4usoVKtUx
         MS8WqoQhN7vBEZnDQLCKnUDPleE5CWD2alxZPVs7tkfceEtOB+j4IfbJicQSL/r0TLMQ
         6yIg==
X-Forwarded-Encrypted: i=1; AKwUvBweoAcq+v1U1hRbRlqx3Bp0QDjtHqhXc0yo+MxLnNHOM9oNuerw6mVkV4zoHGiigmDYeRrzt1gd4C3+f1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAQ7mYWQhCQ725uvAsNFBzF/7er/S3w2TExVNQOW4MfhA+3+nD
	QSttU+K2yCR7g6V8bOCUGQvOb55VAOBp+3kELawiwBU+O4XkFaUxQRhF
X-Gm-Gg: AYBFou0xAvJAQ6uZUivTN+xDMHYikXft0tVFH/4Ji4fISQNPZ/U+EO9Upnt//q1uhv8
	FN9LlzlorCL+pdZpAelPJskrHogPfDLqLy23qQFOgSGNTuiwVCsDvlHDFnEXor+u3KhJ9y1bOLU
	n1URKEgK9wQQwdyC+dRSkqoIt5SMaA+qWv28DKD3F2uH7+nSj6ITanlFHNdGSHYOMiv7ZgrmESN
	OeK51wOuJyhYwXWavLOvN3psp23TK3u9UVrCm6p8jvdjIGPdtcoIU266xO8ibr7v+o7x0nCI1Oj
	q6QBtJZOtucEUZ64X8wFtGhpotlyKb0bBsTZ7iMsYBSI+S9bZwJWVFtFT09LxX1CxJxwk1S2FUX
	9C2kgmp3I1zzlxOuEa4gNk+f0nYTIRKuSBwaTvHG/YEf7D67a95oZ9lUCB7HJULtXGKTZcejU39
	rPCsD5RDB815BW6nh0Y4nCpY6DL4cfkuxI+Ksq6xNPUFTWnq2ioKr+jFev89lW054q/t+lv36HX
	vRi/QFmP5E=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ab3a60ac9amr17946112a91.12.1792075069046;
        Thu, 15 Oct 2026 07:37:49 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac936f89d1sm2729799a91.2.2026.10.15.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:37:48 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Jann Horn <jannh@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH] mm: prevent VMA generation reuse from skipping readers
Date: Thu, 15 Oct 2026 23:37:35 +0900
Message-ID: <20261015143735.1630957-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-VMA write locking treats equality between vm_lock_seq and the current
mm_lock_seq as proof that the active mmap writer already excluded readers.

Both values are 32-bit. After 2^31 complete mmap write-lock acquisitions,
an old VMA stamp can alias the live odd generation. vma_start_write() then
returns without waiting for an existing reader.

A capability-free reproducer uses brk(0) to recycle the generation, then
races an anonymous fault with MREMAP_DONTUNMAP. The stale equality lets
mremap move and tear down a PMD table while the fault retains vmf->pmd.
Unmodified kernels panic in folio_add_new_anon_rmap(), while diagnostic
runs show a freed PMD access and a writable mapping created in another
PROT_NONE VMA.

Add an epoch that advances whenever mm_lock_seq wraps. Stamp it with the
sequence after excluding readers, and require both fields to match before a
writer takes the already-locked fast path. Reader checks remain unchanged;
reused sequence values only cause a pessimistic fallback there.

The fixed KASAN kernel completed the real-wrap THP schedule on three fresh
boots without KASAN, warnings, oopses or panics. Kernels before v6.15 use
the older rwsem-based per-VMA locking and need an adapted backport.

Fixes: 5e31275cc997 ("mm: add per-VMA lock and helper functions to control it")
Link: https://lore.kernel.org/r/20241010205644.3831427-3-andrii@kernel.org
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 include/linux/mm_types.h        | 10 +++++++---
 include/linux/mmap_lock.h       | 14 +++++++++++---
 mm/mmap_lock.c                  |  2 ++
 tools/testing/vma/include/dup.h | 10 ++++++----
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index f3e5a2fadbe5b7..309a278e552451 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -961,9 +961,9 @@ struct vm_area_struct {
 	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
 	 * while holding nothing (except RCU to keep the VMA struct allocated).
 	 *
-	 * This sequence counter is explicitly allowed to overflow; sequence
-	 * counter reuse can only lead to occasional unnecessary use of the
-	 * slowpath.
+	 * This sequence counter is explicitly allowed to overflow. Readers can
+	 * treat a reused value as a pessimistic false positive. Writers also
+	 * compare vm_lock_seq_epoch so reuse cannot skip reader exclusion.
 	 */
 	unsigned int vm_lock_seq;
 #endif
@@ -1004,6 +1004,8 @@ struct vm_area_struct {
 	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
 #endif
 #ifdef CONFIG_PER_VMA_LOCK
+	/* Extends vm_lock_seq without moving the hot VMA header fields. */
+	unsigned int vm_lock_seq_epoch;
 	/*
 	 * Used to keep track of firstly, whether the VMA is attached, secondly,
 	 * if attached, how many read locks are taken, and thirdly, if the
@@ -1274,6 +1276,8 @@ struct mm_struct {
 		 * mmap_lock.
 		 */
 		seqcount_t mm_lock_seq;
+		/* Extends the VMA writer generation across sequence wrap. */
+		unsigned int mm_lock_seq_epoch;
 #endif
 		struct futex_mm_data	futex;
 
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index b8a13b8d36a45b..27caf8818e0b75 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -118,6 +118,7 @@ static inline void mmap_assert_write_locked(const struct mm_struct *mm)
 static inline void mm_lock_seqcount_init(struct mm_struct *mm)
 {
 	seqcount_init(&mm->mm_lock_seq);
+	mm->mm_lock_seq_epoch = 0;
 }
 
 static inline void mm_lock_seqcount_begin(struct mm_struct *mm)
@@ -128,6 +129,8 @@ static inline void mm_lock_seqcount_begin(struct mm_struct *mm)
 static inline void mm_lock_seqcount_end(struct mm_struct *mm)
 {
 	ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
+	if (unlikely(mm->mm_lock_seq.sequence == UINT_MAX))
+		mm->mm_lock_seq_epoch++;
 	do_raw_write_seqcount_end(&mm->mm_lock_seq);
 }
 
@@ -157,6 +160,7 @@ static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
 	if (reset_refcnt)
 		refcount_set(&vma->vm_refcnt, 0);
 	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq_epoch = UINT_MAX;
 }
 
 /*
@@ -281,11 +285,15 @@ static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
  */
 static inline bool __is_vma_write_locked(struct vm_area_struct *vma)
 {
+	const struct mm_struct *mm = vma->vm_mm;
+
 	/*
-	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
-	 * mm->mm_lock_seq can't be concurrently modified.
+	 * The current task holds mmap_write_lock, so neither generation can be
+	 * concurrently modified. The epoch prevents a wrapped sequence from
+	 * making an old VMA stamp look current to a writer.
 	 */
-	return vma->vm_lock_seq == __vma_raw_mm_seqnum(vma);
+	return vma->vm_lock_seq == __vma_raw_mm_seqnum(vma) &&
+		vma->vm_lock_seq_epoch == mm->mm_lock_seq_epoch;
 }
 
 int __vma_start_write(struct vm_area_struct *vma, int state);
diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
index 898c2ef1e95803..281659225b1dbb 100644
--- a/mm/mmap_lock.c
+++ b/mm/mmap_lock.c
@@ -139,6 +139,7 @@ static int __vma_start_exclude_readers(struct vma_exclude_readers_state *ves)
 int __vma_start_write(struct vm_area_struct *vma, int state)
 {
 	const unsigned int mm_lock_seq = __vma_raw_mm_seqnum(vma);
+	const unsigned int mm_lock_seq_epoch = vma->vm_mm->mm_lock_seq_epoch;
 	struct vma_exclude_readers_state ves = {
 		.vma = vma,
 		.state = state,
@@ -158,6 +159,7 @@ int __vma_start_write(struct vm_area_struct *vma, int state)
 	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
 	 */
 	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+	WRITE_ONCE(vma->vm_lock_seq_epoch, mm_lock_seq_epoch);
 
 	if (ves.exclusive) {
 		__vma_end_exclude_readers(&ves);
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 4c58487b764e9d..211ffbf5850057 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -571,9 +571,9 @@ struct vm_area_struct {
 	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
 	 * while holding nothing (except RCU to keep the VMA struct allocated).
 	 *
-	 * This sequence counter is explicitly allowed to overflow; sequence
-	 * counter reuse can only lead to occasional unnecessary use of the
-	 * slowpath.
+	 * This sequence counter is explicitly allowed to overflow. Readers can
+	 * treat a reused value as a pessimistic false positive. Writers also
+	 * compare vm_lock_seq_epoch so reuse cannot skip reader exclusion.
 	 */
 	unsigned int vm_lock_seq;
 #endif
@@ -611,7 +611,8 @@ struct vm_area_struct {
 	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
 #endif
 #ifdef CONFIG_PER_VMA_LOCK
-	/* Unstable RCU readers are allowed to read this. */
+	/* Extends vm_lock_seq without moving the hot VMA header fields. */
+	unsigned int vm_lock_seq_epoch;
 	refcount_t vm_refcnt;
 #endif
 #ifdef CONFIG_64BIT
@@ -1230,6 +1231,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
 	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq_epoch = UINT_MAX;
 }
 
 /*

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.55.0

