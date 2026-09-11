Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1357269C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155734; cv=none; b=uYjxcXAoGPrHVQ6eK5cP7wn53u+jESn4vPJdM8evAMcFgdgzrz9qOyXl3KO6hSmMJsZBZD933eOhxeF2EgCJGxOeURmmdI0PfAa4Qui7ynkwDBwZ7nfYyBfZRXGauC5xkT7PDAVvHoRsITJau/Qs6reEVTK2gDQ8m4mfVe59i9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155734; c=relaxed/simple;
	bh=xC/1m/ZNc5aD6WbXVRq3B46Q8Q9ABXZzcNxtVqCNRYM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FbDVM5+P9BXAuMke662TByCaYPAvEoakXbndru2KFpmNrMXsRtErDu0qT3mpCArrhcZccL1iI/GgJ6MZ7dXUwiA6U71JnjJ8j5I9CP0MBM6RNnZbBGkZiNnF/Zs1PO9tcJh8ibJ2t4YtNd5do6p70dEKf83AOq1tcOBMdWmIvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lUdWkD9z; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lUdWkD9z"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1844510a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155715; x=1789760515; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FgSt6854K565EW8hKNAIrNpKO8xQPyDCjbWGmWWQzU=;
        b=lUdWkD9zD1CLXJmIp/rKKVNq9jD2Oh2GRnSOKy96DciTzX7LLO/Hz2EibEOUL+s1e/
         Myr//Mdj7dpXKnvsz/kjzig/YClgO5RELer+dbpP3Qe0bQOzTjKMejwrfDbQb56q0n6Q
         ctvo5WfMqrvxHhLM7RRvaY9ONHb5YzMjk6yu/Id5ipWhnNnN3gdNCmT1ptHYZAFbDH0O
         nHEVV25Resjyu7i3cCWFH9z7UVAdYCrNxjIytKUy2JYqkYJ+68m7AP7nFUHQzrU+soec
         TdIDfjf9QsFqAMEOMoZtw3vsb4+OgHgAHdf4l2l4gGj3A6ojjcRx5YhBbv0vxitAVHlA
         FvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155715; x=1789760515;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FgSt6854K565EW8hKNAIrNpKO8xQPyDCjbWGmWWQzU=;
        b=LoBoftcoR/oNVEd2VQxDe+8fqWTTKVet0pDtiu50DKUpazzh8lwM36+/3yf6NwPwuy
         WfBs/1FSPSauu4mncQVS4eiBf+C+kC7eec+dNMGLHA79RFte6LNtWp5YaN2h0WrCrhZ4
         2vIfEcQ4mOmmgtJWwBSSiQ5ghQRGSvk+H+/XI9AezvBmaLpNmWWaMlem21INhOQd7g0O
         g0reftNYjjMYGt54tyA9YwQnmda6pg8x1vdUbovZbp3lnXVt+p97jEVy1w9cjXHGuETk
         W3aH16+yK40+/Xom5ko0iC+pZwlVAkCRQ4LlelOF2bUNA+zYY/CeJwxtqUpnNupGNw16
         axRg==
X-Forwarded-Encrypted: i=1; AKwUvBwUoSlLWyPZqLT0RxIJGexKuafdep2g4SDX25BxA3oFqtYWaAxrYFi6mXiVW08r++dedOIpjtbG2/Em8Ss=@vger.kernel.org
X-Gm-Message-State: AFuF++nHTum5zIHqlRZxINiMiUkNQ1uvm7g7hI1DprSHymzLLuEziTVP
	DUKC4lJSUjvmi8jj+UE4ZrAvJYIWA/LygfPC375uwqwl/fR92Kqfex4kd38ihhXujnvqGfgW80t
	5NY7/Lw==
X-Received: from dyaz19-n1.prod.google.com ([2002:a05:693c:6393:10b0:339:7d9d:9439])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c8f:b0:3da:b8b4:91d7
 with SMTP id adf61e73a8af0-3daed100006mr10905880637.2.1789155715225; Fri, 11
 Sep 2026 12:41:55 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:41:41 -0700
In-Reply-To: <20260911194145.1781926-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911194145.1781926-1-surenb@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911194145.1781926-4-surenb@google.com>
Subject: [PATCH v4 3/7] proc/task_mmu: clarify shmem mapping walk conditions
 in smap_gather_stats()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@kernel.org, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

smap_gather_stats() optimizes stats gathering by skipping the walk for
shmem mappings in certain conditions. Update the comment to clarify
these conditions and use vma_is_cow_mapping() for CoW identification
instead of open-coding it.

No functional change intended.

Suggested by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cfc7af1b551d..0e53eb065a3e 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1270,23 +1270,18 @@ static void smap_gather_stats(struct proc_maps_private *priv,
 
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
+		if (start || (shmem_swapped && is_cow))
 			ops = get_smaps_shmem_walk_ops(priv);
-		}
+		else
+			mss->swap += shmem_swapped;
 	}
 
 	if (!start)
-- 
2.55.0.1007.g17ff1f9808-goog

