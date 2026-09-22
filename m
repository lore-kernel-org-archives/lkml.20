Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B61049B44C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101787; cv=none; b=hPv9+Jqdh1zSZkwVYKAi/LgA/wwb65mO/Mu8tjBPWDjxdRbT7UYY+6wmnRDw+UZW3n9MZK8XZvsazpQeqqR+vl356Gz2GgOBGRgSHA7j/vE3956fibPf/4F/Ufp5uC4XYDntzBO6bo5mRn2dMudA7/HCBQ8fN2nCbCN/Dz2C5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101787; c=relaxed/simple;
	bh=n6JqVCExDT3lN80dM6YcCQVpCL3hT3SrhDfa6lpEbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/177sd1CG/J8FYO8/VrD4m4wKzXYvj6zfE2guglQGVP8oq0pV0HupA6ZckpkPgobvzgSgkDgBjg+/zdwdSi3jERkyjA5/MHfSUWk0gLcPNBPhrOlT6+3Z7CvStwdox2WAYArZpIdvf+bqJc8itgeihPd7NGLdCLbpDfA0jYWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jQQCzHcj; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jQQCzHcj"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so22299785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790101785; x=1790706585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEBH2G+jGtGbGG4yhB6a6/Qs6IdlZYnf6Lv/AMN6/lM=;
        b=jQQCzHcjFH+hl2ldSJxKE1x/ZZwI/1emLrqVH98PFsYRXP+F1EpQ1/LQWdoxT65kdH
         s4KB+ytslUFA4ToNRCObgM/o28BaZpOPbUKgW4YG871Zv1bdX5g4SqwMLCb9JU3Oc1Ks
         PMLjd4lP1Mi+7DThyEJcmOrVEnB4IlfnjZ3W3VZCHETV3VN4KpscoIzcOGwsFo/8AaKv
         GNe7EB3P9EPLx55jFK3+BSnGDF7+1JJnuzkNqAn9xt+sNU1tQei57ZdQ3D2+n6GPpwa4
         O/EpCvjc+0i/ZRnK/Edtb8BaAaDc71xj7qi2ktvp0MHN6Xk3Wu+u056quj2SJSDLzabD
         j2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101785; x=1790706585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEBH2G+jGtGbGG4yhB6a6/Qs6IdlZYnf6Lv/AMN6/lM=;
        b=ArGZfmee7jkO+VrokPfm9wgHMTCG8WtjoJAbmbwwRWX5rbVwJJN6kEOqQP1HKrmfDK
         MkZeZlpsxDpTu0flQR9amD52kUW4DLwY7PNNhqVi7EAF1+YG0pskdp0oif9TucR7Or1c
         d+YDxni9mIgcz4Y0Cv7khV/vMyL0vVDwVRurlglZsyHjsprmZj8O9fBFuPYZMrHxaCn4
         LR87YhUiVRpCtyPJ5vUXyrolSJkgmN7jrks5bW0r+vSFjVS8nDvZyh+L+RPUfKclp7t5
         TMHuUGH6+F+87qWvSvBwxw9edFmX32gTRYYUDDqbuGyz30+NKEGo1sY4vso5lOsi6W6j
         +qvA==
X-Gm-Message-State: AFuF++kmSm98PM8348ukHCa+c8P0ozSGeqARA4p4+lueVFaue/m+3iU+
	twLbgt0FfnGMpnCN0XnoVxhyY6Ir5viKIzFsZXZVeMo9uwNrYja694dzlPEHepISlI8=
X-Gm-Gg: AYBFou2DB0rB9PVYyagkRIPSZYKnsuQbJZzEkx5cufL0SChMy7gaww2MGb8nz5e45i0
	Q4Yf4+GQKjGINsQd2+xW9yCE4+m3z50zyWNwT3vIjl/LHvwWdTLPHKrf3KgMOYLoqusQ0yJyhgm
	TQ1FsXLWStnwS4on9IFbYvUh7m6+5xxwwnUH9FMEW9pBIqLRjYCmOs3V5Fp5Mk0LdpmxiiO3nyn
	REqCof86Gg8hZw8CHWfgjPFrkhVjuzvte2/BSqx8d7Zykd75aVnIbYflc1MHhZMCKWOaKKDWvLM
	m5sTA7mwasYbj0saA8Q4NMRUAKpNnahsOY3H0XoezY0hYEE+GGkXxzGBDxHUnb5s4NcOJQt3Kra
	eS1stFPbY7uBUQ3tCBzMgPJBkncRkwOoZ1+YkxoxCkw22pwWs3dBwJU15RPgmpfG2dW17Gar3Kp
	p3Eb4VGgqfgi9FOERYu38p+ciWD3CTxUSX3215eRJcNo6k1gNlgSCVZtPd7E8anutEa+IkBMfKQ
	o6TgTvSlDS2oxDf88FNfNhPSEgra9VW9G8gwpSPYzlw7qXDbUqa7gYA3fQ8
X-Received: by 2002:a05:620a:29c8:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c250a3567mr41425285a.20.1790101784800;
        Tue, 22 Sep 2026 11:29:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24889ac9sm37130085a.27.2026.09.22.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:44 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
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
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
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
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	raghavendra.kt@amd.com
Subject: [PATCH v3 7/7] mm: use VMA flag helpers in NUMA balancing
Date: Tue, 22 Sep 2026 14:29:28 -0400
Message-ID: <20260922182928.2199090-8-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922182928.2199090-1-gourry@gourry.net>
References: <20260922182928.2199090-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

Use vma_test() instead of accessing vm_flags directly in the NUMA
balancing code touched by the preceding fixes. Keep the existing flag
predicates unchanged.

No functional change intended.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Link: https://lore.kernel.org/r/aq1FDhy00epXXtgd@gremlin
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 3 ++-
 mm/internal.h       | 2 +-
 mm/migrate.c        | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 412c72084a63d..0d48d595740bf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4224,7 +4224,8 @@ static void task_numa_work(struct callback_head *work)
 		 * under cache pressure can drive considerable bandwidth.
 		 */
 		placement_scan = !(vma->vm_file &&
-			(vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ);
+		    vma_test(vma, VMA_READ_BIT) &&
+		    !vma_test(vma, VMA_WRITE_BIT));
 
 		if (!vma->vm_mm || (!placement_scan && !tiering)) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
diff --git a/mm/internal.h b/mm/internal.h
index cbeaf1fc38cfc..560406c36a757 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1240,7 +1240,7 @@ size_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
 
 static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 {
-	if (vma->vm_flags & VM_SHARED)
+	if (vma_test(vma, VMA_SHARED_BIT))
 		return false;
 
 	return atomic_read(&vma->vm_mm->mm_users) == 1;
diff --git a/mm/migrate.c b/mm/migrate.c
index 6a08690cfe219..8e1e5ff1cb580 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2705,7 +2705,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) &&
+		if (vma_test(vma, VMA_EXEC_BIT) &&
 		    folio_maybe_mapped_shared(folio) &&
 		    (!folio_in_lowtier(folio) || !node_is_toptier(node)))
 			return -EACCES;
-- 
2.53.0-Meta

