Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0756A3A8388
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084071; cv=none; b=nKfuCnlHVcSp75biM9m7YYSjbj///E8XCo7Pzf1SukEIoZCxvO9d10jDISlB/gekrO1nsq6TclFije3PziwNn1Szcko4p/h0oiFYoWd49/w18rXI4uTtZjrfs86d6HDtXbxKuMUPCh2djkD+sSR489oWSLOXlImR3uuIEzxMF9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084071; c=relaxed/simple;
	bh=BMzBUmw1fl42znOkNTkCVK4JdAcRIAo9h88IPHF5h7o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ON80zpYstJmH2ZmWY4D8KJB7c2ydY4/KcPr42FQ4n5HvOur4EwRBKgrhF8sBn31dj3YG0SQ+jugDpGYXHtmkXK22IlCHMa5NnyhDtqs+PPZSTjT3Ja9N4tupfAF+xMThmE3czS96REOObRjLZKs8rE1WJAYxi9g8/XLzgJpYJb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mVwg0pH6; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVwg0pH6"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso3937455ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789084069; x=1789688869; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GmwxGnSxtyc3MMcZyUdMtOHBijNkoyl6C3OnmMdL/s=;
        b=mVwg0pH6V8EqvInUK9mYGaVUzuZwc5CPX579StbzXZqGSBRA2CU/0C7y3VltaIwH6v
         rJuuJJb8sBQYDUIcZSRzCQPk9o1AWRXP+7xtpSneC9zJTBIXdVmykSg1bAyoJFDU1/Ha
         oWPQ/TGkWPCZ2C2tDAu5dLzIe5G/mRrV1gwQsmM6VCx9zdGg52B5I2eS0fPhmuirOHCx
         gSK5GlN7wTafKTiCg+tnk9/geLIAIknxkS5WO4qjGBvb2q3EQibvd2ZdMGXbTjHhB1ZY
         M7aiG5NZjNeDJn7+aWSLGlZ6plLU8RrS2qKYOx6dsSMF4iElfmQJNKpNa4MtIkwbBHyK
         H/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084069; x=1789688869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GmwxGnSxtyc3MMcZyUdMtOHBijNkoyl6C3OnmMdL/s=;
        b=DuiM+WGfhxIpVKu7j6R1VnVUp3kE8Y8ONgHmg4ZDojB5tubOXIx3NFecwXPfjq/eKo
         m+LU8ozWmzBTE04Is9tmf6kMk9Z8urNjz38NQF/YecRMYvoYQgzwCCgh9lHAe45hklV2
         0Aj8Wbu98s/eNFBUmFoG/JcRtsj4oTYm8TTw9pL94bp2QzjwAFXsvYIF11te9a10vNCJ
         RcI56IrUZvJktcnHvLyLU/5/TN64kJ1W/wTV+Tq3gKn1UeVeoSqUcLIrQjcxMVjvUoCb
         WhYCJKaBcD6R+n8DaOIu6Tp9ZyS/1fePv8NzRZ8ktUpHNodK/0z4BBwNweaeuK4+3q/P
         HUdw==
X-Forwarded-Encrypted: i=1; AKwUvBxMTTF8Vv1jW9OSr7p4gNRD/LdfsEIvVbejF6rqg/teE9IK/LRR4ElqFC5HhurWImC4FFXd4BHGePcm4fE=@vger.kernel.org
X-Gm-Message-State: AFuF++kF4fHwy9X8geao3VvQwVQyto8P/WYNol/N6BIvYLM3X310KPZR
	fYvksBMc6gY0mSndAv9yBNx/868Y6Z+zCHYdRndWIC6GsVe2f/YvmzbRR5cwPppsPzk1OwRktlg
	6k5hzKg==
X-Received: from dlbek20.prod.google.com ([2002:a05:7022:c94:b0:141:4abc:f12d])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4990:b0:396:4cbf:45a2
 with SMTP id 98e67ed59e1d1-39d9c0acc23mr1884695a91.14.1789084069193; Thu, 10
 Sep 2026 16:47:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:47:33 -0700
In-Reply-To: <20260910234737.1340642-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910234737.1340642-4-surenb@google.com>
Subject: [PATCH v3 3/7] proc/task_mmu: clarify shmem mapping walk conditions
 in smap_gather_stats()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@redhat.com, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

smap_gather_stats() optimizes stats gathering by skipping the walk for
shmem mappings in certain conditions. Update the comment to clarify
these conditions and use vma_is_cow_mapping() for COW identification
instead of open-coding it.
Instead of using (start != 0) condition to identify partial walks, use
more semantically correct (start > vma->vm_start) check.

No functional change intended.

Suggested by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cfc7af1b551d..3c40c9cbb9c9 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1257,6 +1257,7 @@ static void smap_gather_stats(struct proc_maps_private *priv,
 			      struct mem_size_stats *mss, unsigned long start)
 {
 	const struct mm_walk_ops *ops = get_smaps_walk_ops(priv);
+	const bool is_partial = start > vma->vm_start;
 
 	/* Invalid start */
 	if (start >= vma->vm_end)
@@ -1270,23 +1271,18 @@ static void smap_gather_stats(struct proc_maps_private *priv,
 
 	if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
 		/*
-		 * For shared or readonly shmem mappings we know that all
-		 * swapped out pages belong to the shmem object, and we can
-		 * obtain the swap value much more efficiently. For private
-		 * writable mappings, we might have COW pages that are
-		 * not affected by the parent swapped out pages of the shmem
-		 * object, so we have to distinguish them during the page walk.
-		 * Unless we know that the shmem object (or the part mapped by
-		 * our VMA) has no swapped out pages at all.
+		 * CoW mappings might map anon folios that do not belong to
+		 * shmem. Perform a less efficient page table walk in this
+		 * situation, unless we know that the shmem object (or the
+		 * part mapped by our VMA) has no swapped out pages at all.
 		 */
-		unsigned long shmem_swapped = shmem_swap_usage(vma);
+		const unsigned long shmem_swapped = shmem_swap_usage(vma);
+		const bool is_cow = vma_is_cow_mapping(vma);
 
-		if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
-					!(vma->vm_flags & VM_WRITE))) {
-			mss->swap += shmem_swapped;
-		} else {
+		if (is_partial || (shmem_swapped && is_cow))
 			ops = get_smaps_shmem_walk_ops(priv);
-		}
+		else
+			mss->swap += shmem_swapped;
 	}
 
 	if (!start)
-- 
2.55.0.1007.g17ff1f9808-goog

