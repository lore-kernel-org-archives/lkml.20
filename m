Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFE403EB5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763170; cv=none; b=joDxi273BFqQhzKzRc45RfUW+zeldA06FikzgWWTu2tcOllOqDI50XnfoEtdpiDvvyM5UhblxAdtJK0cVQYio8zKM3ObmjXU9BYnq6sZQAF/ZCUNzV+FB1j9C0Vtxcr20T0k00K2WIU1CIjETloE4WWEubh4IWSLRNL5Gog+eTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763170; c=relaxed/simple;
	bh=vys6AT7bnyxQQxULzvDgCzmeOLcybKvobkQ/3Vu4NVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e5fBz0wxezKcUP2eDPx48bwWbqEhYVxpzo/jLJhSHQ0fWkz5PCCs3BrQuep4UL0jk7w5xsqdoYwweCHJ69U8upJrZO/chx8QiesELKRZIgd1eGjsdyIlnb5qoYp4tSX3xZwqvw52U5NtFeWrAYxjUzm0rTrnHXxflWce71oBT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNMWYCpT; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNMWYCpT"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1585654a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788763168; x=1789367968; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l82YwPFJoqBct/wpgBVxgb9B5/Qm0auI8Z1CtPsM/dw=;
        b=CNMWYCpTbZVDpPjAv2vErU87jRba4RASpQbaGg6ib7zNPrmnP5VEsp3jThCRjU9bmI
         4tXq4jk1ZmoIZUp8VV7y3e33fty0deBq2TYbnO4/iqC/Ox9chcsLthZMYk2yoSONc38X
         BXPFsIsesa9IUhzqP8EpQAXKwwKS1rrBg0Wu92ivpslEjKMFCtLhgeHJ0xxxcYFa2E6O
         2/x9h1VksO6flvT23NJohvSnIJD1NSa8oxqvwGOE+az0Tzy9EMf658cZa2tkt/QbLwtZ
         uC9dW/H5AF7/iiK3h+s9mhBsplnm+hq3VFjKnkr6VPPIdq7feft++TA1WySWl4EVXA2u
         w9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763168; x=1789367968;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l82YwPFJoqBct/wpgBVxgb9B5/Qm0auI8Z1CtPsM/dw=;
        b=sRRADMTud02zprHhUpQ94mKHR4BbchAK49eM3b45GeAIV29f9f6QJjPgRP3hChDykW
         +XS5HGVt31x8r0iVVvDUo9pfxmjnTCBHQCchJFweOQZopg20fLdYGjgaHiGVC5ziuDyz
         y9DQwdlCnr+UCWpExL6DWvy7DLI82hYP24IhpydWH+T2vyecsqgu4aL1EqO+ooSU21yl
         Sdp/21+N206uUQqHfNKtFqBNeCWLxJrusu4TeiMO/w1n0SMlCJCv7kUrt+kS9ulbCF+f
         JI4+7jHXGQy5y6BkhdCrjK/d/tBrGbsJmGU8mwu+QvnTQHcsfNyrBzbLpLnz0CLK+sTs
         08gw==
X-Forwarded-Encrypted: i=1; AKwUvBzjjaZAecGZ0AZ486/pH2RRnEyrqOqA7p8ME9JApD8TZTdH0u+AFiEIXvGtePrV6jyRiB2ndMou5rDH6eo=@vger.kernel.org
X-Gm-Message-State: AFuF++k1pWZiJ9uPExMmEeTa7a+DNKyNCmDaq0QTpvUvD6H9bNoBV1RS
	P+mQgKvDYZsZaDFvXJFuGGAYURweRZIcfUH8QKKISVTY/mMu7jDylRyfRC6EFWVsIlGfSfQwdI5
	tkm/SIw==
X-Received: from dyjo27.prod.google.com ([2002:a05:7300:339b:b0:327:c2c1:f06f])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5866:b0:398:e73e:5a13
 with SMTP id 98e67ed59e1d1-39b2613272amr31362696a91.9.1788763168352; Sun, 06
 Sep 2026 23:39:28 -0700 (PDT)
Date: Sun,  6 Sep 2026 23:39:16 -0700
In-Reply-To: <20260907063918.3432401-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907063918.3432401-4-surenb@google.com>
Subject: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@redhat.com, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

smap_gather_stats() interprets its start parameter to mean vma->vm_start
when it's set to 0. Eliminate this special interpretation and pass
vma->vm_start explicitly when needed.

Since smap_gather_stats() operates within a single VMA, we can replace
walk_page_vma()/walk_page_range() calls with walk_page_range_vma()
which is simpler and also can be called while holding per-VMA lock.

No functional change intended.

Suggested by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 9908ba32f180..3351decd1172 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1246,20 +1246,27 @@ get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
 	return &smaps_shmem_walk_vma_lock_ops;
 }
 
-/*
- * Gather mem stats from @vma with the indicated beginning
- * address @start, and keep them in @mss.
+/**
+ * smap_gather_stats() - Gather mem stats from @vma.
+ * @priv: proc maps private state.
+ * @vma: The VMA to gather stats for.
+ * @mss: The accumulated stats.
+ * @start: The address from which to start.
  *
- * Use vm_start of @vma as the beginning address if @start is 0.
+ * This gathers stats for the whole of the VMA unless the lock was dropped
+ * and VMA grew or got merged and we found it again, in which case we only
+ * gather stats for the remainder of the VMA range.
  */
 static void smap_gather_stats(struct proc_maps_private *priv,
 			      struct vm_area_struct *vma,
-			      struct mem_size_stats *mss, unsigned long start)
+			      struct mem_size_stats *mss,
+			      unsigned long start)
 {
 	const struct mm_walk_ops *ops = get_smaps_walk_ops(priv);
+	const bool is_partial = start > vma->vm_start;
 
 	/* Invalid start */
-	if (start >= vma->vm_end)
+	if (start < vma->vm_start || start >= vma->vm_end)
 		return;
 
 	if (vma == get_gate_vma(priv->lock_ctx.mm))
@@ -1279,20 +1286,17 @@ static void smap_gather_stats(struct proc_maps_private *priv,
 		 * Unless we know that the shmem object (or the part mapped by
 		 * our VMA) has no swapped out pages at all.
 		 */
-		unsigned long shmem_swapped = shmem_swap_usage(vma);
+		const unsigned long shmem_swapped = shmem_swap_usage(vma);
+		const bool shared_or_ro = vma_test(vma, VMA_SHARED_BIT) ||
+					  !vma_test(vma, VMA_WRITE_BIT);
 
-		if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
-					!(vma->vm_flags & VM_WRITE))) {
+		if (!is_partial && (!shmem_swapped || shared_or_ro))
 			mss->swap += shmem_swapped;
-		} else {
+		else
 			ops = get_smaps_shmem_walk_ops(priv);
-		}
 	}
 
-	if (!start)
-		walk_page_vma(vma, ops, mss);
-	else
-		walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss);
+	walk_page_range_vma(vma, start, vma->vm_end, ops, mss);
 
 	reacquire_rcu(priv);
 }
@@ -1347,7 +1351,7 @@ static int show_smap(struct seq_file *m, void *v)
 	struct vm_area_struct *vma = v;
 	struct mem_size_stats mss = {};
 
-	smap_gather_stats(priv, vma, &mss, 0);
+	smap_gather_stats(priv, vma, &mss, vma->vm_start);
 
 	show_map_vma(m, vma);
 
@@ -1400,7 +1404,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 	vma_start = vma->vm_start;
 	do {
-		smap_gather_stats(priv, vma, &mss, 0);
+		smap_gather_stats(priv, vma, &mss, vma->vm_start);
 		last_vma_end = vma->vm_end;
 
 		/*
@@ -1459,7 +1463,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 			/* Case 1 and 2 above */
 			if (vma->vm_start >= last_vma_end) {
-				smap_gather_stats(priv, vma, &mss, 0);
+				smap_gather_stats(priv, vma, &mss, vma->vm_start);
 				last_vma_end = vma->vm_end;
 				continue;
 			}
-- 
2.55.0.979.g7e5102b832-goog

