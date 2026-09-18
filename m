Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C610502D7D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745612; cv=none; b=ci5+flQ5rx8/YX41xclLLmiKK1XtF486xRGA5/BQ2Vaw0GN7U8mfwh0JNJtZO/csSfOdkPpOrMWn11SrWjyvigI2o0sA8vILa7xU2QAN9ZmM5Sjbt0VaWR5TK7CWFI6x+04/UWy74gUc+54fKGoyxN6HZkbsssDZr5+1E71lX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745612; c=relaxed/simple;
	bh=Kk/Av/Wahs3wr855f5dR9G/6SzogvS0HbJ/6bSoiP1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lDPU2tg8RAk55G+qWbwKQMDClOBIuxtWa1jzXT+TPKSAQkIof0XE/HRZKsdf3MOG5GgWrtkEHeVub9cb7yK9WlMJKaDOAckFvGWh7WoicDKE4rGJJXxLcb31EhuDemqpvInhBOOTET5Ha8KO1Ejl+VYUj/0NvRbHb6Cy7uJ2BeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIV7uBr+; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIV7uBr+"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1370900a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789745609; x=1790350409; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c64grHEqWwUtUzGGsYu1Ih95rNaNVw7BlsDsBBQp/Gk=;
        b=MIV7uBr+mTtJaORu/r8kpHdzUd9BRkqldxLci5LktBLGOZEHGnJR92OdM6RMk1a5Em
         5d+nSY7Jjj09XaBDH/E8jfni9Tu7CT4FYQ8Y6NAqkJbVpxbh3jwgcnyETfEklYJEyodF
         znE3pFhD0Kk86VeozNBXlqtF3MSj5x6N1I4KC0dvtwUCfxkyRBsF/aZXDscl3Mp6Zw/o
         xdlUpj6bMB5+P6dWOg1ncm7SVzL9R3980/pbxBASEQmFozv62K7rEBTG8nfeQKs+/kEP
         JPnNe9zBX3YKRj35mDvi/hrCI/AQAg+c5y8ZvDweyvk02f2FqfsNFNtKIEVvY+auk6SA
         o2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745609; x=1790350409;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c64grHEqWwUtUzGGsYu1Ih95rNaNVw7BlsDsBBQp/Gk=;
        b=coYhMXS24bsqWxtCIgdfBTAQcucWyHOHSuSHlSG0gPNpz4Jh5wWYkC5/3ThbOkDpbr
         LsV/WdiS2K2qYFKI85El7Tj899VmCf9u/2ix6xiOgls5NxOsFqFhRWP5h/god6aL6vlX
         VLvMEGXbKWuhB+YnAdXxMADhY3VTVVS4iUfGy7Ow7NnCuuC1G8xQrf6d3XlUYjUmHarF
         fMMYLTGELkSgzK1SCCvWXtN4DnJgTf7B7uaIf4bQvdMFgWC5sSjB3Ot9+N/eup6UpCy7
         +nxGNkdKPtYxJFBmbhIHPqaB6QGwtArpE4EePAoh2aiUGDie2uPCfZgnRgcGTeCnTR76
         FJ2g==
X-Forwarded-Encrypted: i=1; AKwUvBxHzh4ZOuF6jKsBiEGDYtFN7/rInewW1fUxkwd1xuQ/Qu8EBraxAOi3TZJhs/K5IJ+hcH0t4uMbSjX8ox4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJVxdK/enh6Ti+wNKfJ/zQbvs9AgCDGpnztU2BAGQyKbRpgj3C
	XKmxZCJjakbO/JSFn9ubg51MbpTX3Tm15pneVgsT10GOm8F5QSmTKLWH9PWKOOauZv+vxgyMhm6
	bn6vYHA==
X-Received: from dlbvp1.prod.google.com ([2002:a05:7022:ff41:b0:144:d125:b235])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1fce:b0:39e:402e:accb
 with SMTP id 98e67ed59e1d1-39e402eaed7mr7921534a91.18.1789745609213; Fri, 18
 Sep 2026 08:33:29 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:33:15 -0700
In-Reply-To: <20260918153318.758387-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918153318.758387-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918153318.758387-5-surenb@google.com>
Subject: [PATCH v5 4/7] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@kernel.org, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

smap_gather_stats() interprets its start parameter to mean vma->vm_start
when it's set to 0. Eliminate this special interpretation and provide two
separate functions for a partial and complete VMA walk.

Since smap_gather_stats() operates within a single VMA, we can replace
walk_page_vma()/walk_page_range() calls with walk_page_range_vma()
which is simpler and also can be called while holding per-VMA lock.

No functional change intended.

Suggested by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 fs/proc/task_mmu.c | 52 +++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f1ce15981253..8f2f302d4563 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1250,20 +1250,26 @@ get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
 	return &smaps_shmem_walk_vma_lock_ops;
 }
 
-/*
- * Gather mem stats from @vma with the indicated beginning
- * address @start, and keep them in @mss.
+/**
+ * smap_gather_stats_range() - Gather mem stats from a portion of the @vma.
+ * @priv: proc maps private state.
+ * @vma: The VMA to gather stats for.
+ * @mss: The accumulated stats.
+ * @start: The address from which to start.
  *
- * Use vm_start of @vma as the beginning address if @start is 0.
+ * This gathers stats for the portion of the VMA starting at the @start
+ * address.
  */
-static void smap_gather_stats(struct proc_maps_private *priv,
-			      struct vm_area_struct *vma,
-			      struct mem_size_stats *mss, unsigned long start)
+static void smap_gather_stats_range(struct proc_maps_private *priv,
+		struct vm_area_struct *vma,
+		struct mem_size_stats *mss,
+		unsigned long start)
 {
 	const struct mm_walk_ops *ops = get_smaps_walk_ops(priv);
+	const bool is_partial = start > vma->vm_start;
 
 	/* Invalid start */
-	if (start >= vma->vm_end)
+	if (start < vma->vm_start || start >= vma->vm_end)
 		return;
 
 	if (vma == get_gate_vma(priv->lock_ctx.mm))
@@ -1282,20 +1288,31 @@ static void smap_gather_stats(struct proc_maps_private *priv,
 		const unsigned long shmem_swapped = shmem_swap_usage(vma);
 		const bool is_cow = vma_is_cow_mapping(vma);
 
-		if (start || (shmem_swapped && is_cow))
+		if (is_partial || (shmem_swapped && is_cow))
 			ops = get_smaps_shmem_walk_ops(priv);
 		else
 			mss->swap += shmem_swapped;
 	}
 
-	if (!start)
-		walk_page_vma(vma, ops, mss);
-	else
-		walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss);
+	walk_page_range_vma(vma, start, vma->vm_end, ops, mss);
 
 	reacquire_rcu(priv);
 }
 
+/**
+ * smap_gather_stats() - Gather mem stats from the entire @vma.
+ * @priv: proc maps private state.
+ * @vma: The VMA to gather stats for.
+ * @mss: The accumulated stats.
+ *
+ * This gathers stats for the whole of the VMA.
+ */
+static void smap_gather_stats(struct proc_maps_private *priv,
+		struct vm_area_struct *vma, struct mem_size_stats *mss)
+{
+	smap_gather_stats_range(priv, vma, mss, vma->vm_start);
+}
+
 #define SEQ_PUT_DEC(str, val) \
 		seq_put_decimal_ull_width(m, str, (val) >> 10, 8)
 
@@ -1346,7 +1363,7 @@ static int show_smap(struct seq_file *m, void *v)
 	struct vm_area_struct *vma = v;
 	struct mem_size_stats mss = {};
 
-	smap_gather_stats(priv, vma, &mss, 0);
+	smap_gather_stats(priv, vma, &mss);
 
 	show_map_vma(m, vma);
 
@@ -1399,7 +1416,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 	vma_start = vma->vm_start;
 	do {
-		smap_gather_stats(priv, vma, &mss, 0);
+		smap_gather_stats(priv, vma, &mss);
 		last_vma_end = vma->vm_end;
 
 		/*
@@ -1458,14 +1475,15 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 			/* Case 1 and 2 above */
 			if (vma->vm_start >= last_vma_end) {
-				smap_gather_stats(priv, vma, &mss, 0);
+				smap_gather_stats(priv, vma, &mss);
 				last_vma_end = vma->vm_end;
 				continue;
 			}
 
 			/* Case 4 above */
 			if (vma->vm_end > last_vma_end) {
-				smap_gather_stats(priv, vma, &mss, last_vma_end);
+				smap_gather_stats_range(priv, vma, &mss,
+							last_vma_end);
 				last_vma_end = vma->vm_end;
 			}
 		}
-- 
2.55.0.1082.g2b9226bbc0-goog

