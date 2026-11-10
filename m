Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323111;
	b=vdBuaGsh5zmPuMQ7FKN2mylcFMwGDmCEUGVl/LkNqSctcxCt3fKcx/HFYAEznUZWGQOL
	 Zs+Hw7pS4gOKxHCC/LcQn+wYW0kPtusggEplG7xaWXq5x1hfahcgPqOgSvdGQWRgAaXw9
	 FIK2zHF5LnOgk5icyMKYZDeRyzZgETUHX33xOyJgKT+FfZ3cj9x9CXJSP6+e90KwtoIv/
	 hVGqPqCWoEmU4Ibw4gen581v8VK5PusTgjIhNDQgzz4uS8l4CZM37wFtg7t6ZbwCLnNvm
	 R3xrPTG4OpO0mGk7zcKmArmvGpcwx4ly51hpdn9JyRSMmCtg4/k8sfoD9PhNlSSXZ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2e1bpjGT+eR4C4dYYlQalUYG3DRy3QidLDmMcITtjh4=;
	b=iMLow4QofYineBKean5HUC9uWs9bwCHe+7e7wVAuz2MccDihQ1LI51iGCZv3aFdj5L6i
	 3LMnHjVNfjHSG+bt3MYu9mDix9RXQt6BSKXJaGzNE2iCjOj4I6iCtS240ABVtsuG4GFiF
	 DriCBaStSvAgfNwoQ6XzuqGa2Rfqv5ZS6QaImugjxqA4rGG1gBhU3pWftzluMHmPCon8j
	 QHy99rrs+a6CGEIrOzz4IThIU6cyksBGWEk2oNqic9UPH9c8mGM+PZAETYpES7CSWpHO5
	 8zoZf36ip0CFFKYIxn0fQPKBTTfK2OSgePeEJvjD4N9/3OaOWoZRz9Rk0Z/Yvz48SpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZyuVz+sx;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BCD60A5BC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BCD60A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZyuVz+sx
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb5559b34so16123966d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323109; x=1794927909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1bpjGT+eR4C4dYYlQalUYG3DRy3QidLDmMcITtjh4=;
        b=ZyuVz+sx8RVuV6qsDI+KVaPEjvy0dNhnEI+M7IkahOkkPZ1EeVh2GDVfok9+cfVBUf
         bbP6hRWgfGXjkCiRztq0QuiF6MvZsLK+2WE/3HuVZQSKInt+dZnauiX/0S9AdtF5kget
         DJPpAnVNhY8LArJ1hg/4vVfnxVi6oq2HqJFyrBYGWVA06bT/9tPdmj20tYJtKcu5zQOI
         1e1RfCHCCx4PgQZCyMyDuMtK0CEN1aqQsVblfKYuWbKnxZN4xZ0AnALO1Eeb/yfO13qe
         fwU+UgHeaQssN/zLF/HZl7GDlq2pyv2nm+qNBkhS092nao1q8ZKL2Z+osn8kW4gUT7Yp
         +Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323109; x=1794927909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1bpjGT+eR4C4dYYlQalUYG3DRy3QidLDmMcITtjh4=;
        b=HESUKzeIPxBuJH8EAA9Tg3x0fYqWdRoX/9hfHcU6UPr5k0tpZwruwGeLT3gvrrcfLT
         R/1GJQ/emJwWtnZN5NK1W+8AdiEuwc3U3yk8fvlwiRdkbLidXx7RVLlXrL6lEGWXtLPa
         rPpY024dRc93goJVGdTQnYBc/FEFInzWbpwaYWN0yLqV2uKpIW3FDTCbmRifNJgaPmk0
         8Ul+CaeG+ap9Q/dAsxUjPVSNY/eAmp551GP+OP+UsYzXV40yOrtFQPYNyLSKJWDlC37t
         1PkgmKaKH9QlJ4bJJE8PP6QaiS5PIisvBPMBn4WspUvhQCrcQfCx1ZzCWsa3JIt3hDV7
         RyOg==
X-Gm-Message-State: APuU4Z9zMC5GYTtxpIVBblrH8BuiLnUX9hnLmrevfbMji9sfYVChu0GI
	17BST98kfWP+3bI+RBHvfzE77MMsIdDIoiCsW7a1kXiUTRRMrWomRjZbG+0azaoAw/A=
X-Gm-Gg: AYBFou29U4DL+6NtOjEu7belVYQrmnRxu66I+QqQuPH/39gmd550b7kTBHMqeifIeTc
	MFf1yp8c7ZOY61xQAGtS99dYOxZt9MMdbR+xY3kiJcX+eP+ADHbSWjAkzl0M8gR9n4tZ1CVfR+D
	VfKHCyHDgT6RM31v5aE+QLtwr31P9AtCtohesepgfIfZEwOppm8lu2QBfWcQVavSoO7rZX1+tDm
	oLlQA7lnWVtVkjaqVfjNzKKhxzFS4xzJJ2cBnynnYR5Uu+7zdgg2SBXS7XBy4XgFSOub9l4c6CI
	DZGNK2frrOfWu43yxO/6F0spB7mMjgWDUql0foT4J41v/gXwF9iZivEnwVQ+M4qGTMwHvo7UtPu
	0rfzoOWJn14MRH0fwJpPTz9iRBpxO260eAtLr7OCR3/Gw78o6O/NSjG2dIiNh/Fy57WL71Lcekg
	HW4qOaq+b6uTB/DccUCgdrW3DTM65WewUtq8bd6vWJTRJ77FgkkXcZQ1sstG+zzeQadX7YgWsGK
	YBl03nQlWOnIDEq9h4WPRGK/BEXM3X5m83xzHuQGC2WJg1UGPdUqV/PupBaA1rOY9Gb0ePDhhyi
	dxQfsGpr58HqEx9NOGRc6l+5ZB++DiINitzxWDI1kj6QWODeAp9WNqlCeD00WCOCBZ40U40g7q7
	dcTpEnjtM94LO2Sk=
X-Received: by 2002:a05:6214:1d0c:b0:91e:b7fd:b35f with SMTP id 6a1803df08f44-91eef8e19d0mr48737926d6.30.1794323109417;
        Tue, 10 Nov 2026 07:05:09 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:05:08 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@techsingularity.net,
	mingo@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	osalvador@suse.de,
	raghavendra.kt@amd.com
Subject: [PATCH v5 7/7] mm: use VMA flag helpers in NUMA balancing
Date: Tue, 10 Nov 2026 10:04:46 -0500
Message-ID: <20261110150446.2452975-8-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110150446.2452975-1-gourry@gourry.net>
References: <20261110150446.2452975-1-gourry@gourry.net>
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

Use vma_test() instead of accessing vm_flags directly in the NUMA
balancing code touched by the preceding fixes. Keep the existing flag
predicates unchanged.

No functional change intended.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Link: https://lore.kernel.org/r/aq1FDhy00epXXtgd@gremlin
Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 2 +-
 mm/internal.h       | 2 +-
 mm/migrate.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 279bf12b74b64..cf3e3657e9533 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4378,7 +4378,7 @@ static void task_numa_work(struct callback_head *work)
 		 */
 		placement_scan = balancing;
 		if (placement_scan && vma->vm_file) {
-			if ((vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ)
+			if (vma_test(vma, VMA_READ_BIT) && !vma_test(vma, VMA_WRITE_BIT))
 				placement_scan = false;
 		}
 
diff --git a/mm/internal.h b/mm/internal.h
index 6e7c247781a16..7fc34d084697e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1248,7 +1248,7 @@ size_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
 
 static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 {
-	if (vma->vm_flags & VM_SHARED)
+	if (vma_test(vma, VMA_SHARED_BIT))
 		return false;
 
 	return atomic_read(&vma->vm_mm->mm_users) == 1;
diff --git a/mm/migrate.c b/mm/migrate.c
index 50a0a2e11a353..796d98d1c116c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2715,7 +2715,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio) &&
+		if (vma_test(vma, VMA_EXEC_BIT) && folio_maybe_mapped_shared(folio) &&
 		    (!folio_numab_promotable(folio) || !node_is_toptier(node)))
 			return -EACCES;
 
-- 
2.53.0-Meta

