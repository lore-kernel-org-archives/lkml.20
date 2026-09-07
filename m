Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684638838F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763164; cv=none; b=iV5/ZhAhnV10yhl/OKp9Q8E1tb5rjx4GzDMror7UgFU5z0YUluAAOIVMYbYm8blvcMehTpGdmsXOrk1bTD2liwGRh4+JpKyKo/nVdrR8GpICZ1JansnrA/7DCuJyDXakUae7MvxitRbgPyIwGPGYsgdomnATV1XkEATl2SEQAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763164; c=relaxed/simple;
	bh=gUJ14xM591vHq1qNE8oZtRitzIUZ0UgAPcaN82Rowm8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eh1vv2ZTGN/T4QFFsQP8EjL/PNmIg80tR+CP+iBNJi6gWFMCz++rPXV8GqmEqvTInFMhiSe6F3CYhEK8iv3zKmbgtS/FlUVy9kjXsfeK6cWTzKn7HIwRbPyPgI+1D8fG8+T4Ha2sC46j2xlfvRXpM0wVzfLD8MNveyraRmvq9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cODuvHlP; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cODuvHlP"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so3187758a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788763162; x=1789367962; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dm0sPp817ea+YIVgxkakoV5ujQpRM5ozgV+CKpT59+U=;
        b=cODuvHlPhhbxA5Rns0LiJw5uCQ7yZ93CxB9+80SbOcYXVZw6zdaKC8aW4x/P9TIgBn
         iO++ambh4W8FSKjDJ6FxAc4fZLo4UbduzhQynJSz5vkxOuTZ/Z47URynY4Hx8YV8PVeu
         fZgHAF3gs2FeheX38KTXzkNPt0o5IylGsoawnEBCS4uM0lLsh5JXXFKnb0HNdCEOer1u
         MopxX92uTNQ28D34N4cbi1M2WySqigNb1SgD66vpzmEW3QrEANjkoA1vMAew9O9oHlLD
         scSRStz9H3baOoydaRtuzn5hLrom/B9MnU/uN5+GidOA78QOLoEGY2q0Yhx9iVaB6XYU
         wb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763162; x=1789367962;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm0sPp817ea+YIVgxkakoV5ujQpRM5ozgV+CKpT59+U=;
        b=XQbeX1aW6vSTWBPPv7Im/cQujro0rNa7xKItrBAHDPWdrTjNKVAgk3GSkPCkVJTWSu
         upO4pWciaqSISxg4vOeUB4YH0rtxrGA8x0weIuS6pftrsNkaBUMVcXqiG3WJu0oWeCp+
         U5PTgXFCUS+G1mZ7VNdG4CRtuvSzNGxqG5zJ08j3BtsmWvv9al4u8CPadM2gfLryzDZa
         JeDd6hU0pNP4ZtYTQZQ4Tjj6vVncuIHDYLY5QJVKkmDFTAXJNEJRGCQlDun34n0nO2u+
         wfYk3qMlgwOYIwWiS/Vtx4fIgeXBeDIL/JOXEqh4hvFcNtJ3lbYR85/c1qlSEsQSaBdH
         SffQ==
X-Forwarded-Encrypted: i=1; AKwUvByjZRR0VBZWV1xomINcvoDjd5Sc4koHOfR4dlIQsnCRf/dzQ2BuKaUAL4jPTSO4bRoY6+qDs0wPuo2rHiI=@vger.kernel.org
X-Gm-Message-State: AFuF++mkIOM2m0GEiwM4QsQiIv1VtkhBqoYhbE+TwpDtSqrC+rlj0Wed
	mLBHGfoWXSUs2x6BXka7EMy8yDPFv2H/ExOyl8RiW3S/E2WTU3B/8I6ZaYxpwe0BZdd4rAq/Eqx
	GYRBUAA==
X-Received: from dyjt11.prod.google.com ([2002:a05:7300:7b0b:b0:337:a3b2:d113])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:168d:b0:3bf:b84c:2984
 with SMTP id adf61e73a8af0-3da39d14759mr32303334637.11.1788763162041; Sun, 06
 Sep 2026 23:39:22 -0700 (PDT)
Date: Sun,  6 Sep 2026 23:39:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907063918.3432401-1-surenb@google.com>
Subject: [PATCH v2 0/5] read proc/pid/smaps_rollup under per-vma lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@redhat.com, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
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

Changes since v1 [1]
- removed helper functions which are not needed after per-VMA locks
became unconditional in [2];
- added a cover letter, per Lorenzo Stoakes and David Hildenbrand;
- removed is_mmap_lock_contended() as it's no more needed after [2],
per David Hildenbrand;
- fixed typos, per Lorenzo Stoakes and David Hildenbrand;
- refactored duplicate error checks, per Lorenzo Stoakes;
- eliminated special case of start=0 in smap_gather_stats(),
per Lorenzo Stoakes;
- updated comments, per Lorenzo Stoakes;
- moved original comment about 4 possible cases when mmap lock is
dropped into patch 4 changelog;
- added smaps_rollup testing into proc-maps-race test.

[1] https://lore.kernel.org/all/20260606015729.1837935-1-surenb@google.com/
[2] https://lore.kernel.org/all/20260813193433.3318288-1-surenb@google.com/

Suren Baghdasaryan (5):
  proc/task_mmu: remove unnecessary helpers
  proc/task_mmu: remove unnecessary inlines in function definitions
  proc/task_mmu: remove special-casing of smap_gather_stats() start
    parameter
  proc/task_mmu: read proc/pid/smaps_rollup under per-vma lock
  selftests/proc: add /proc/pid/smaps_rollup tearing tests

 fs/proc/task_mmu.c                            | 280 +++++++-----------
 tools/testing/selftests/proc/proc-maps-race.c | 187 +++++++++++-
 2 files changed, 291 insertions(+), 176 deletions(-)


base-commit: e3fc12b08aadde9cec7b3799ac0e0c9a1aa245c4
-- 
2.55.0.979.g7e5102b832-goog

