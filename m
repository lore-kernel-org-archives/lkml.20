Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669F4FC339
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745603; cv=none; b=Vj0Yf+I77cGoVEaVbSepeb+UW3UE+P3DADN7fqHrFfKtWW/TiP3A2DCjrs8Nw5BrAH9aishySo+ORcRPXsppt+CS2McPqS02hCxcSoP/yCJKl5z1TUBmWsmazRfmnkTutgNrmqb5g5GE8dJ7KgPCroifpbkKalWOSB34ZyTT28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745603; c=relaxed/simple;
	bh=jBs4oYy2jX63TwbsrfniBkxZwk5PB6Cf2fYjn0xxSX0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aulTPRWqdJhyhjUy9ThPt/FgD5M9blr2KjSC9Q3D1nXvYGxJ33i1T5BLz8S2j7HTjoLozoIacZLlOwh5sL8RNkYjnyTjHAqKEGca5B510FTrtuO+ANWsDLuC31Se637P4Gf5mAEPfOcv6LhgSUf+9DDcISilgr7gkCkUgvfdo8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qN/AnMTm; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qN/AnMTm"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso11225995ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789745601; x=1790350401; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o3afKIhDxvUwFzaGiZkLeSCGdh09AvtFvmwbyAEPcg=;
        b=qN/AnMTmkA7/iLLeDTlfpwlHBM8GOb1DZpcO8W9F8hxl3luHFpLjNpKni2Ltbz3ELk
         j2BvYYodnAt7jPFKnhviwL6L/uSk2Iy9Dm1IqdvZn8+jYnJlkApuw8rV5lArKwVrczIT
         RjeKF6sWyd2rHPxfJhZZWkrYjs8E2R0Uyq/TZmhNJjaK+dZYLIJ6QhGCxJ0jhmT1ynt0
         76GMjV7IjSVqFrL4PIZ1yoO/50PMHa5NNrQRoI7Gh15NQoMcolvl0AXQJRjMkzH0wZp/
         Kl3YN04HfCtwRVy4qTYtjExcbheyT7UKycwv70yH3RDiQMM68aUQPBAtiIqwv7p6D+eO
         qvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745601; x=1790350401;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o3afKIhDxvUwFzaGiZkLeSCGdh09AvtFvmwbyAEPcg=;
        b=puYKo2cYvy/RbmymyNicQ82/9ArFXj0ahUB6eLRp0u9071Z0WCrr4DvKR7OLPbScp/
         Z07Kf2BeUZk/h+No8Ff1Ry433SZC+3Ez0D1UCCSF3RxMvL+SMzeVvKSJTV1kJ+KmB+pi
         5U3gXoyTKk2EjI3neyVQEK2+XWQp8iL4TFZpk79Y4/QAX8hrf489QTqV7eFJFCnM+Xyp
         gKvrFYQVvNKxqk/T/SrxzpPkhelEnT/zk/SXGg8OSomxVXe12dF/VILWYdUX/o9CnugX
         iofgMofHXjmRxCp3+Xt+LI1koU1Wyfenu97htCOsfDgBNX7vdHB7UrbV41InXF4EyOav
         rbbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT12URMiFyhPdPbI+MpMiHm21P57ZFyf26MkwpHG/wJe/Ms/+dWFkMmteNV+aBZ91urAE0BWZbSTS5clQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nft9dnX2Bavxq3Fnp3djXPivC+Sa5lLPBZPqG3HvNYzxFBlOgb
	nxRpi4BUD0gEpuuYUtHzXDNmQfb2qXieFFSn2Yuj9Xh4qJYAFsWDyKVwlttwDQkhSymK5EnmvaG
	2Lf1m0w==
X-Received: from pldu4.prod.google.com ([2002:a17:903:1084:b0:2dd:24d6:a74e])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:a9cb:b0:2dd:c053:e668
 with SMTP id d9443c01a7336-2ddc053e68amr2809575ad.46.1789745601208; Fri, 18
 Sep 2026 08:33:21 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:33:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918153318.758387-1-surenb@google.com>
Subject: [PATCH v5 0/7] read proc/pid/smaps_rollup under per-vma lock
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

The first 5 patches are cleanups making later change simpler. The main
change is in patch 6. Patch 7 extends existing proc-maps-race tearing
test to verify smaps_rollup content.

Changes since v4 [1]:
Patch 2:
- Fixed warnings with CONFIG_PROC_PAGE_MONITOR=n
- Fixed a typo in the changelog
Patch 3:
- Add Reviewed-by and Acked-by, per Lorenzo Stoakes and
  David Hildenbrand
Patch 3:
- Add Reviewed-by and Acked-by, per Lorenzo Stoakes and
  David Hildenbrand

[1] https://lore.kernel.org/all/20260911194145.1781926-1-surenb@google.com/

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

 fs/proc/task_mmu.c                            | 341 ++++++++----------
 tools/testing/selftests/proc/proc-maps-race.c | 186 +++++++++-
 2 files changed, 336 insertions(+), 191 deletions(-)


base-commit: 854157fc9d011b8dd5a1a86a237447e28d681eb9
-- 
2.55.0.1082.g2b9226bbc0-goog

