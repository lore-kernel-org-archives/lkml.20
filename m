Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042C1DED5C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084064; cv=none; b=Bw6mgz36pHVqkANAtmA9EHQRg/bVPIUIwgYYlMiWwmUpRX6l5UG+31FdoIwX2s+kqJmguOwinSQ9Hy8ktdAhRtA6ZuTp40TS0Ge2paPWC2OMw/bwPfTTQ5gupnOocD6RsPtEf9ynd86Ln+g1CMc8UyAGfGuX3RWiiv/ZmRlPq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084064; c=relaxed/simple;
	bh=T48UsE+20gNhkSTGTr5xMbrVP6zrShLG9JQOtYPmyFs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QGuZxM4ZTv3Ygj/QGJXn0txRsTJHxUjfZaxuDj50GI4VS4LoKGVAtraWeIj0Vs0UxyOm2WJnCdNla/tuZUqkZ8oGyMQUP88duCw5R93Xy4ONBwaqhe0YJaMG2N8CIs43FE649pWKjWm3+HE2NgQyb0Nw5lenkM2xW47npIgnaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NnfDa/DW; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NnfDa/DW"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso479379a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789084062; x=1789688862; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjYzY5hY0HpXPVya+Zd4xkPFjC42gfo+YPj1TM2pAi0=;
        b=NnfDa/DWDolQIoPbVAyn17/wLkVoMcH2d/g4h25gKl+uOAwsy3AiLxDeAdvS830EmF
         z9dtW+RPApBgUne+YT9TfLSkWX1h+NvJCjMABvqd69LI4qDhuNi+O1AfHEfn1QjFw+xy
         wzOuJxGLTPkvvc5A7MTealrM2GwyrRSFFQ1Im9K6y656cdX/Yq0arJgxU5F8Z7la4FUR
         gDk/4euJCzAStulFYLZ0qizOYJX2R+uUh8ZaWuT7byXMQfhuP6wVFSpmGX2MxHv3xu1R
         GgBge5uFwJ7ddVZR/aWARmfvvvTc9vrCxZudAchIHn3fwvv4INyDDFQQMk7OR5bO90lp
         l8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084062; x=1789688862;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjYzY5hY0HpXPVya+Zd4xkPFjC42gfo+YPj1TM2pAi0=;
        b=oPdz6QaXNisZIKBUL18N0/NEsW7WRvVAOyVxH9xOpOR/gbUeyWPMqvoZ9tJcHc7+s8
         3PfOf++QCw9FyJjaacIFAXkLUOOpOejc7vQR4D9tfIPgxVYv1z7LPYqfmwaGoEbuXH53
         0EAp6HlAz6+pV+0QH5hF5DPLpy1BvWXGTiF5CdxkoObAqJkrP1gaTsL9FllqirNWRB2F
         t+uMhmJhyR6hb+5ntuD6jdLSL1emtTWIQrdT/ZM3D61aNITTHaQnH37Cl8qz1aW7IgCt
         6N2Qsl0H58UsrF3bWnLPvEckgern0itgNCn8a18/KhVMdSlcM33lMYC2RfDmLlLa/9Zz
         DJnw==
X-Forwarded-Encrypted: i=1; AKwUvBxtiXIEEC2EOrLyac+GOXAzLGQjtBFLFA26WHCfa09k8cMX7D0ysq28DZj/aOdD80WjGBP1ALMDETqlob4=@vger.kernel.org
X-Gm-Message-State: AFuF++mellqeKEu+i/6sKbeS5CgJ6inJIyC2EL9L1TkhctSTUQytS6uT
	l/LHhcFr7rylduzft1m1OrTK29vjRBBsIR3MKZCj6QdVH1mOD3Jm5P6kzYe5bgsmf8PvzrYHrwR
	fj27HjA==
X-Received: from dll34.prod.google.com ([2002:a05:7022:222:b0:143:6080:6696])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:398:9c00:29ee
 with SMTP id 98e67ed59e1d1-39d9c38fa48mr1808878a91.22.1789084061665; Thu, 10
 Sep 2026 16:47:41 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:47:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910234737.1340642-1-surenb@google.com>
Subject: [PATCH v3 0/7] read proc/pid/smaps_rollup under per-vma lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@redhat.com, 
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

The first 3 patches are cleanups making later change simpler. The main
change is in patch 4. Patch 5 extends existing proc-maps-race tearing
test to verify smaps_rollup content.

Changes since v2 [1]:
Patch 1:
- Added Reviewed-by and Acked-by, per Usama Arif, Liam R. Howlett,
  David Hildenbrand, Lorenzo Stoakes
Patch 2:
- Confirmed no change in binary size, added a note in the changelog,
  per Usama Arif
- Converted multiple lines of arguments in modified functions to
  two-tab indents, per Liam R. Howlett, David Hildenbrand
- Added Reviewed-by and Acked-by, per Usama Arif, Liam R. Howlett,
  Lorenzo Stoakes
Patch 3:
- Updated the condition and the comment for walking shmem mappings and
  split it into a separate patch, per David Hildenbrand
- Added Reviewed-by, per Liam R. Howlett
Patch 4:
- Refactored gate VMA handling out of proc_get_vma() as a separate patch.
- Fixed skipping of the first VMA, per Usama Arif
- Removed gate VMA handling inside show_smaps_rollup,
  per David Hildenbrand

[1] https://lore.kernel.org/all/20260907063918.3432401-1-surenb@google.com/

Patchset applies over mm-new branch.

Suren Baghdasaryan (7):
  proc/task_mmu: remove unnecessary helpers
  proc/task_mmu: remove unnecessary inlines in function definitions
  proc/task_mmu: clarify shmem mapping walk conditions in
    smap_gather_stats()
  proc/task_mmu: remove special-casing of smap_gather_stats() start
    parameter
  proc/task_mmu: change proc_get_vma() to stop returning gate VMA at the
    end
  proc/task_mmu: read proc/pid/smaps_rollup under per-vma lock
  selftests/proc: add /proc/pid/smaps_rollup tearing tests

 fs/proc/task_mmu.c                            | 320 ++++++++----------
 tools/testing/selftests/proc/proc-maps-race.c | 187 +++++++++-
 2 files changed, 318 insertions(+), 189 deletions(-)


base-commit: 1f78f28a2945f9e856b4ea8428ac41a6788e4b67
-- 
2.55.0.1007.g17ff1f9808-goog

