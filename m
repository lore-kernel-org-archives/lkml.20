Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7A5540BB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155725; cv=none; b=XyO26JCMOOwdGEeAPnmsOg8RJtZiEENDOBenDveZ2PWkDxc1aYK5NVJdo7HK09k5LRoy6wdYRy0wcB4xlfyR43Iix8wKwhKy7lqlVQxWZ/Uthml5Pk/hLJZYnR3Sq6+YrxSN4p2tWMVQM+j7sbd0dLGE0ah4vx1Kf0f+QMIj11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155725; c=relaxed/simple;
	bh=v8OiTYvm9jLxwoItXDWbhS4/9qcPWVaZ1YVyRZglHA0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N/7tBx4I+WeDU3OpUnwhTEt7jk5Vag3h8MtwF9THWMaiDr84enXFXXKU83GOqlkqZ9TVQrCpPzF4XnRMPdsmVh0mphpRH1V8X/lT7XlwDPVBX0MrXopOSLsa6A0T1LpWZ30aVXzIvZFrNwqk4b1qBTvsT4OZz15nOjpzc7uou0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GONemXH4; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GONemXH4"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1378048a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155709; x=1789760509; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFnX3s9ttQtORT13US/ARsVw733vFoBxkxITzrUPh78=;
        b=GONemXH4RWP5RrIgHpYK33E0H+Uz7nZrMV6O4OFKWlizAyZXnoQb1DXW8txFzWvQFa
         qXO9fKR2EWl8PAW2eWCBW2hYLQxKzgwSfa1nmXwLpCxeHNHKeKq7C5PAYt5gKp8dhoVx
         rr4/Xjtms9mIaZZ/ITkMyqQw6MDuXTUpfKGfc+BuxMnlJkRUMOeAOLeBobH7bHuCcvAI
         nTHamENzupCNX9zjiq3fFRd4I72mhwFY0v3/vValQLU2aTVK4dhSLoCxvDQXjijRl69b
         GGkX5yx81Op1bhAhqjUAt7wYFkAj7OfqfkFmj7XcFMgLk0/BWfzWMcqJeJGhTBwBuA+E
         uPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155709; x=1789760509;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFnX3s9ttQtORT13US/ARsVw733vFoBxkxITzrUPh78=;
        b=KJiYlVYSxU499QmSAfJmy1wjsl1PQIVrW8JdKS0twhYQsAxVrmcwMoRsW7+cIs5fOo
         ZYY+YlnKq0RBGQgm4T2dyO9S4OJDiqREBrPd7yDR9Cfyl5RNYKPo9AX39SogVx9OlQIt
         EtK1v97f8J23xVE/niuovIIDL6y9hOS2MYE5riWZOjItyCX+CG88VoVIItOLX5nJKTzk
         9YWiJRH7O4BDzB5S7vXYyC2S9vojH+p0Zt9XPTk5iHkNCGloDfiQCtEKr4LoSGYp3Qok
         3x9IhRRAFOXg5qCw/SJXpAgUjvKM6yyGaZ4cto3y54Kz1USueHhf3ztq7fTtEv6LDB9h
         EXgA==
X-Forwarded-Encrypted: i=1; AKwUvBy9dgqkojhiVLHSy8oGs2oulw+mIR3iE8Btqz0jOS/BC+zKe1fSPE9rswro54EniHD0xBcKMVvtf4/ixD0=@vger.kernel.org
X-Gm-Message-State: AFuF++k5JmRckgthi4XSWtkm8gPalrdBcWzB3iDueGisy4hvYY5hekOm
	MAOLcYOYUuEpnaizup8CGjfjsC6jgDTudqIXo3QcHuBU3/xxswNI3WwSrrWzsCnVBrqCw70g56a
	HAVIlnA==
X-Received: from dld34.prod.google.com ([2002:a05:7022:322:b0:141:6ffa:3579])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3391:b0:3cc:b26a:7686
 with SMTP id adf61e73a8af0-3daed1515f5mr11763572637.6.1789155709034; Fri, 11
 Sep 2026 12:41:49 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:41:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911194145.1781926-1-surenb@google.com>
Subject: [PATCH v4 0/7] read proc/pid/smaps_rollup under per-vma lock
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

Changes since v3 [1]:
Patch 2:
- Added Acked-by, per David Hildenbrand
Patch 3:
- Moved conversion of (start != 0) to is_partial into the next patch,
  per Lorenzo Stoakes
Patch 4:
- Moved conversion of (start != 0) to is_partial into the next patch,
  per Lorenzo Stoakes
- Converted multiple lines of arguments in modified functions to
  two-tab indents, per David Hildenbrand
- Introduced smap_gather_stats_range() for partial VMA walks,
  per Lorenzo Stoakes
Patch 5:
- Added Reviewed-by and Acked-by, per David Hildenbrand and
  Lorenzo Stoakes
- Added a comment explaining the check for SENTINEL_VMA_GATE in m_start,
  per Lorenzo Stoakes
Patch 6:
- Added Reviewed-by, per Lorenzo Stoakes
Patch 7:
- Converted multiple lines of arguments in modified functions to
  two-tab indents
- Added Acked-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20260910234737.1340642-1-surenb@google.com/

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

 fs/proc/task_mmu.c                            | 339 ++++++++----------
 tools/testing/selftests/proc/proc-maps-race.c | 186 +++++++++-
 2 files changed, 334 insertions(+), 191 deletions(-)


base-commit: 1f78f28a2945f9e856b4ea8428ac41a6788e4b67
-- 
2.55.0.1007.g17ff1f9808-goog

