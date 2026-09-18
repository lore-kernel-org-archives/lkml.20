Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B8509EE2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745616; cv=none; b=utcNdQnKpEFt55ec/F3oUSbRU7g0tqKkYFsXp/+JUIbJdGaJqWrMqMnatpwrde19IM4N1Ha/y6Q1vusj7bHMZ1uQlVbpBsNHQYy5e+wnWcI/e5Gvwi2rtw+nYxiVECNhn7Sha2xo21IImBlB9Q3/phqtO71BzRonmiIlme9uvzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745616; c=relaxed/simple;
	bh=dIYyxZgsj031zKhH/ITSJ091DyX11qiCrTkYrVwSexI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y1DU664KmuoYaAybf4Mltu5A4QvDpTPhJcyIsuB75+n8qElCOeVfEtnaAqEl0Fuyc+dmTwIbBrGbqpEFu0tyTR2PMyHrAnYcR5f8uO4f8pzzbtw/eUW3V3gR8TWAOYYF/IxPrCYfjoZEKzqYvj37ptpOcZ5VAHti7tyCDWbxtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iP8n9ppE; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iP8n9ppE"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1686573a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789745613; x=1790350413; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GezTlyn6XHQWhl94S93tdh+KQwNw767Wgp9o9ICsVJ4=;
        b=iP8n9ppE6S7cGKRM9cCHEAVHGQNQ2irz2n28H6OtfxbvyL6XGBMMcZ50yODIEJLzNE
         R9DmkCk2EJQFCqt263ZtlNSapA9U39dUrjDNBEGdndNM5wHG0JbQxGdhdddwFfxTS7f4
         xwcZ6OXJkk8eBr5VnEKhhcB9yjjC4QnpZh3WZMp8krwYgH4R+F43oq0muMiCXQs8HA+N
         6SCG2Y8X6tgnjEjlW/4QnEICWuVdmNbaCobqbW1uxijBw526CWvWtpkzJ7RooSe1mGln
         x2S77vcqDkbaxgL+eBY/titiCdTvNorLM/lJ5U3VXtsAa1x4fBnv1070jMTVPwYitFX+
         REyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745613; x=1790350413;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GezTlyn6XHQWhl94S93tdh+KQwNw767Wgp9o9ICsVJ4=;
        b=w79K1Vlc/VrmPM+WqmEHpeF9U9x1UKFpwf/YADdJbei3LRY0BriCB3Z8/rOgdBxPaC
         /YAJq4xn/hznv2SzxYUvppCak5LTIe/8nbmb4fo5TQt/+fDYmuDVCaqh0o6YqEiMR6Q/
         S9td0gyyeS9xR+co5T6mYBVU+icWPlwFMaOL7V/dsmCpPQDh1e2gFS/+imrL4t9th4/U
         nlvzPQp5WwwzqYJhygert/4LSgtE2wI1EshRyRAckKiiIHqD34VaYjulsnzoCBP2qNEB
         FUbLA1ne9rgyIM77VN9qLMBaVJoicd5jB2mV9dQQxN3ccqMzzmUYtYwC0KP8EuN7MYK8
         r9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWaedBCQdN6LaVyjJM6Ip+MrU6RROrEWS2x2ShGUdt1ewpxV/tu/60xxkQFHmAnMj++ud6AdQhCEwZbSY=@vger.kernel.org
X-Gm-Message-State: AFuF++mVMa+9AA9t4DtivaPIJwga5P/my8LpJKTs05eqblUyd70yHYun
	GU+DCw3gaV9R0sIGSR1JDF7HJkR8eSnCqcGahA+jT2bAndTFFFStk+6Z60Exd16kyeOYfDEZFvY
	mx9f2dg==
X-Received: from dldyr17-n1.prod.google.com ([2002:a05:701b:4511:10b0:143:7976:20e7])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d91:b0:39e:6c68:c782
 with SMTP id 98e67ed59e1d1-39e6c68c9f1mr34046a91.56.1789745613433; Fri, 18
 Sep 2026 08:33:33 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:33:17 -0700
In-Reply-To: <20260918153318.758387-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918153318.758387-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918153318.758387-7-surenb@google.com>
Subject: [PATCH v5 6/7] proc/task_mmu: read proc/pid/smaps_rollup under
 per-vma lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@kernel.org, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

proc/pid/smaps_rollup can be read using the combination of RCU and
VMA read locks, similar to proc/pid/{maps|smaps|numa_maps}. RCU is
required to safely traverse the VMA tree and VMA lock stabilizes the
VMA being processed and the pagetable walk.
Note that we have to keep the logic to drop mmap_lock on contention
because even when using per-VMA locks we might have to fall back to
holding the mmap_lock.

Running Paul's contention benchmark [1] shows considerable improvement
both in median and in the worst case latencies:

Execution command: run-proc-vs-map.sh --nsamples 20 --rawdata -- \
--busyduration 2 --procfile smaps_rollup

Baseline:
   Median   Minimum   Maximum
    0.174     0.161     2.553
    0.174     0.164     2.663
    0.174     0.165     2.664
    0.174     0.166     2.679
    0.174     0.167     2.691
    0.174     0.168     2.704
    0.174     0.169     2.729
    0.174     0.172     2.741
    0.174     0.174     2.745
    0.174     0.174     2.755
    0.174     0.175     2.790
    0.174     0.177     2.809
    0.174     0.179     3.096
    0.174     0.183     3.144
    0.174     0.184     3.158
    0.174     0.185     3.175
    0.174     0.185     4.568
    0.174     0.198     4.821
    0.174     0.214     5.143
    0.174     0.251     5.220

Patched:
   Median   Minimum   Maximum
    0.007     0.007     1.952
    0.007     0.007     1.955
    0.007     0.007     1.955
    0.007     0.007     1.955
    0.007     0.007     1.957
    0.007     0.007     1.969
    0.007     0.007     2.065
    0.007     0.007     2.075
    0.007     0.007     2.146
    0.007     0.007     2.195
    0.007     0.007     2.223
    0.007     0.007     2.259
    0.007     0.007     2.488
    0.007     0.007     2.562
    0.007     0.007     2.599
    0.007     0.007     2.697
    0.007     0.007     3.030
    0.007     0.007     3.075
    0.007     0.007     3.145
    0.007     0.007     3.225

Remove now unused lock_ctx_mm() and move unlock_ctx_vma() next to
unlock_ctx_mm() as they are logically related.

Remove a long comment about 4 cases that we handle when dropping the
mmap lock in the middle of VMA walk due to contention. The first 3
cases explained there are handled naturally and only case 4 needs to
be handled in a special way, which is done in smap_gather_stats() by
gathering stats from the portion of the VMA that has not yet been
processed.
For posterity, moving this comment here:

After dropping the lock, there are four cases to
consider. See the following example for explanation.

  +------+------+-----------+
  | VMA1 | VMA2 | VMA3      |
  +------+------+-----------+
  |      |      |           |
 4k     8k     16k         400k

Suppose we drop the lock after reading VMA2 due to
contention, then we get:

	last_vma_end = 16k

1) VMA2 is freed, but VMA3 exists:

   vma_next(vmi) will return VMA3.
   In this case, just continue from VMA3.

2) VMA2 still exists:

   vma_next(vmi) will return VMA3.
   In this case, just continue from VMA3.

3) No more VMAs can be found:

   vma_next(vmi) will return NULL.
   No more things to do, just break.

4) (last_vma_end - 1) is the middle of a vma (VMA'):

   vma_next(vmi) will return VMA' whose range
   contains last_vma_end.
   Iterate VMA' from last_vma_end.

[1] https://github.com/paulmckrcu/proc-mmap_sem-test

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 fs/proc/task_mmu.c | 159 ++++++++++++++++++---------------------------
 1 file changed, 63 insertions(+), 96 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 2c90b91d271b..c0d228036b8a 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -130,30 +130,12 @@ static void release_task_mempolicy(struct proc_maps_private *priv)
 }
 #endif
 
-#ifdef CONFIG_PROC_PAGE_MONITOR
-static int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
-{
-	int ret = mmap_read_lock_killable(lock_ctx->mm);
-
-	if (!ret)
-		lock_ctx->mmap_locked = true;
-
-	return ret;
-}
-#endif
-
 static void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
 {
 	mmap_read_unlock(lock_ctx->mm);
 	lock_ctx->mmap_locked = false;
 }
 
-static void reset_lock_ctx(struct proc_maps_locking_ctx *lock_ctx)
-{
-	lock_ctx->locked_vma = NULL;
-	lock_ctx->mmap_locked = false;
-}
-
 static void unlock_ctx_vma(struct proc_maps_locking_ctx *lock_ctx)
 {
 	if (lock_ctx->locked_vma) {
@@ -162,6 +144,12 @@ static void unlock_ctx_vma(struct proc_maps_locking_ctx *lock_ctx)
 	}
 }
 
+static void reset_lock_ctx(struct proc_maps_locking_ctx *lock_ctx)
+{
+	lock_ctx->locked_vma = NULL;
+	lock_ctx->mmap_locked = false;
+}
+
 static struct vm_area_struct *get_next_vma(struct proc_maps_private *priv,
 					   loff_t last_pos)
 {
@@ -1406,12 +1394,14 @@ static int show_smap(struct seq_file *m, void *v)
 static int show_smaps_rollup(struct seq_file *m, void *v)
 {
 	struct proc_maps_private *priv = m->private;
+	struct proc_maps_locking_ctx *lock_ctx = &priv->lock_ctx;
+	struct mm_struct *mm = lock_ctx->mm;
 	struct mem_size_stats mss = {};
-	struct mm_struct *mm = priv->lock_ctx.mm;
+	unsigned long last_vma_end = 0;
+	unsigned long vma_start = 0;
 	struct vm_area_struct *vma;
-	unsigned long vma_start = 0, last_vma_end = 0;
+	loff_t pos = 0;
 	int ret = 0;
-	VMA_ITERATOR(vmi, mm, 0);
 
 	priv->task = get_proc_task(priv->inode);
 	if (!priv->task)
@@ -1422,90 +1412,63 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 		goto out_put_task;
 	}
 
-	ret = lock_ctx_mm(&priv->lock_ctx);
-	if (ret)
-		goto out_put_mm;
-
 	hold_task_mempolicy(priv);
-	vma = vma_next(&vmi);
+	rcu_read_lock();
+	reset_lock_ctx(lock_ctx);
 
+	vma_iter_init(&priv->iter, mm, 0);
+	vma = proc_get_vma(m, &pos);
 	if (unlikely(!vma))
 		goto empty_set;
 
-	vma_start = vma->vm_start;
-	do {
-		smap_gather_stats(priv, vma, &mss);
+	if (!IS_ERR(vma))
+		vma_start = vma->vm_start;
+
+	while (vma) {
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+			goto out_unlock;
+		}
+
+		if (vma->vm_start < last_vma_end) {
+			/*
+			 * After retaking the lock, already reported VMA grew
+			 * or got merged with the next one and we found it
+			 * again. Gather stats for the remaining portion by
+			 * starting at last_vma_end.
+			 */
+			smap_gather_stats_range(priv, vma, &mss, last_vma_end);
+		} else {
+			/* Found next unreported VMA, start from its beginning */
+			smap_gather_stats(priv, vma, &mss);
+		}
 		last_vma_end = vma->vm_end;
 
 		/*
-		 * Release mmap_lock temporarily if someone wants to
-		 * access it for write request.
+		 * If the VMA lock is not taken, we hold the often contended
+		 * mmap lock. This can happen if we had to fall back to the
+		 * mmap lock.
+		 *
+		 * To relieve pressure, check if it is indeed contended, then
+		 * temporarily release it.
 		 */
-		if (mmap_lock_is_contended(mm)) {
-			vma_iter_invalidate(&vmi);
-			unlock_ctx_mm(&priv->lock_ctx);
-			ret = lock_ctx_mm(&priv->lock_ctx);
-			if (ret) {
-				release_task_mempolicy(priv);
-				goto out_put_mm;
-			}
-
+		if (lock_ctx->mmap_locked &&
+		    mmap_lock_is_contended(lock_ctx->mm)) {
+			unlock_ctx_mm(lock_ctx);
 			/*
-			 * After dropping the lock, there are four cases to
-			 * consider. See the following example for explanation.
-			 *
-			 *   +------+------+-----------+
-			 *   | VMA1 | VMA2 | VMA3      |
-			 *   +------+------+-----------+
-			 *   |      |      |           |
-			 *  4k     8k     16k         400k
-			 *
-			 * Suppose we drop the lock after reading VMA2 due to
-			 * contention, then we get:
-			 *
-			 *	last_vma_end = 16k
-			 *
-			 * 1) VMA2 is freed, but VMA3 exists:
-			 *
-			 *    vma_next(vmi) will return VMA3.
-			 *    In this case, just continue from VMA3.
-			 *
-			 * 2) VMA2 still exists:
-			 *
-			 *    vma_next(vmi) will return VMA3.
-			 *    In this case, just continue from VMA3.
-			 *
-			 * 3) No more VMAs can be found:
-			 *
-			 *    vma_next(vmi) will return NULL.
-			 *    No more things to do, just break.
-			 *
-			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
-			 *
-			 *    vma_next(vmi) will return VMA' whose range
-			 *    contains last_vma_end.
-			 *    Iterate VMA' from last_vma_end.
+			 * Even though we previously fell back to mmap lock,
+			 * we try taking VMA lock for the next VMA, since it
+			 * might not be under modification. In the worst case
+			 * we will fall back to mmap lock again.
 			 */
-			vma = vma_next(&vmi);
-			/* Case 3 above */
-			if (!vma)
-				break;
-
-			/* Case 1 and 2 above */
-			if (vma->vm_start >= last_vma_end) {
-				smap_gather_stats(priv, vma, &mss);
-				last_vma_end = vma->vm_end;
-				continue;
-			}
-
-			/* Case 4 above */
-			if (vma->vm_end > last_vma_end) {
-				smap_gather_stats_range(priv, vma, &mss,
-							last_vma_end);
-				last_vma_end = vma->vm_end;
-			}
+			rcu_read_lock();
+			reset_lock_ctx(lock_ctx);
+			/* Resume from the last position. */
+			pos = last_vma_end;
+			vma_iter_init(&priv->iter, mm, pos);
 		}
-	} for_each_vma(vmi, vma);
+		vma = proc_get_vma(m, &pos);
+	}
 
 empty_set:
 	show_vma_header_prefix(m, vma_start, last_vma_end, 0, 0, 0, 0);
@@ -1514,10 +1477,14 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 	__show_smap(m, &mss, true);
 
+out_unlock:
+	if (lock_ctx->mmap_locked) {
+		unlock_ctx_mm(lock_ctx);
+	} else {
+		unlock_ctx_vma(lock_ctx);
+		rcu_read_unlock();
+	}
 	release_task_mempolicy(priv);
-	unlock_ctx_mm(&priv->lock_ctx);
-
-out_put_mm:
 	mmput(mm);
 out_put_task:
 	put_task_struct(priv->task);
-- 
2.55.0.1082.g2b9226bbc0-goog

