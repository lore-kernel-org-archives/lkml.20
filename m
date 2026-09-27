Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48D35AC07
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486256; cv=none; b=V9zIL3UcFSGK8O7va0KTfZDwk9Q9lO9267xUbGN5VDy4a28FVFsF8qNS/MDU7uk/O9zj+Qd67QyLTMj4jvR8f/018w1ysYLL+HVD79tWluddtKnF3FkniBxfoO1KG78EkMfqdI42hw0s2lj4pTBM0jww7rw9q5BZhrGuBpQi8Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486256; c=relaxed/simple;
	bh=bQMwWM6/AZ89zp7CCDYwtmkkCqgqc1BuIJtcVMvLioA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbfP67fVblBKm6f/StueY8Me2sl3b9C6USinVABCt6U8xUnrVXnDlj0LrBwHaLJ605Sr5nN71SCJvh2IdDXcDmMKneAZtN6o95990Zx5CGf6sFm0bDd19iaxvaGiLv+1IjJQgxRyEeMf0+FGSGHhRmyBgmZXpjrAC2qCwmJpUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYrZuUBy; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYrZuUBy"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso2476259eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486253; x=1791091053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j+qmirMlaROvYJ+1n7dY0Ko2fZrBnqEhZBiYJG8nwEk=;
        b=AYrZuUByDcGntwb8H2fqUGlDiWsFSxg/fYoS6nxlZ1DbxlPs1L+mrCO8AMXRcQCS6I
         Y1gxLXkBIWx8dz50343c2ig4XGScL5D3ffY/HA71U3+Z6zKrxBefCyDQy0UssHokcg7D
         P81A6oBOVBhA435mAsIfM+MVdIdKBEge5XOck5Obhu/PRTbTUAiIyTOm/6Ol3FsWqVGP
         ub8DAKtU/eur1U4Kx2b+46jl8eTtWCDVv5Qa2vFnzXfWcskAptZ0oH3SRgEBApGzVerd
         54+K5pL04jMnFuG9YAa1GhQ8564aIcKRpSy7m6Q0JKrwozTMvdVYahUXGBzXGb7kNtM1
         zmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486253; x=1791091053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+qmirMlaROvYJ+1n7dY0Ko2fZrBnqEhZBiYJG8nwEk=;
        b=RpmRvrkL6CAQ2j5R81LTjOlINFyRTSlbhF8VoOZJBhYjdzAcv+m7M6QhbkJstnulyU
         x+b/RetobNI/vKwqgNOxYQqRC152dMSp6k/QdZsxbMTGkV+fGbYdoH7W/LvPioI08roT
         4GpWdYMmfjCIVqLtMbkNO0Iy3rcUzHZh1WOzPLIAvuvq+C/GjO8dfqy3oqI3CQsiqXpX
         cjhZcKSIM2e0cglbmYupJNWL2RVI69IxfkG5zGcJb4rWuR5lBbfXtWvIBAPPbcYHL/xT
         p0jYseFitNVFMoSJs4EqWWH8e2LOQAK/J0gF0/tzhQI+4oX8yMSXxsyP71DEoQYZpBqO
         ANNg==
X-Forwarded-Encrypted: i=1; AKwUvBw+2NL6oB+48IzsHLt7GQC2FwdUfYbItuFgtl+zUKSnl/WuMKvfHMH8aRkinCkMtV7Vzut2HgqUK+xRzo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhMewNEnCwyn7zon3lmH9PvcWOzN8FZtCxLd0lpRgoCaWLGBDu
	8HxZWI9WaLsScqg/EtHyYLFbVWpuMZhBlI3U+f8jrIQ8Ewq9JSaaonym
X-Gm-Gg: AYBFou0c4otCh+vSVsV2WgEzLAjyMoHiHNT14H01+GD99alYGoOlGezb5GZPyIaWK4d
	jk3RLVZhA5OeBJ0KcNOXrmJenwvK16cCeZninTj92bBFSwXbcu0gGqXgqXocbj9SmIXsMmA30zM
	RTr+lb/VsFep2Nsw808mpx/lBfunQ8JGbmg7UphAj8PnIQV+KwABBE5GG+B6KB5nprrpDdDgLoO
	sV4d19JYJHMbS//x2OWmRAyjnd+uWilXWP+wRBAqprE958BmJ7EPBlcndEyV3cnb4B1OjhQqmAV
	QGPNEVfQ3bRPyx7/LtbyAO3HH17J3yg3naLm6daYNjFQokqQFqFTpwX+J+K4UAutiWWYeB3Z8P3
	C5e6EMT521+hKM4qCE2W9J0foRX/akjVqSOpppv04AzIkcb0edrTh+kbivcYSrgXA4dXnB88chV
	YdZ/IyAn1bLf0XhEd9o3zF+hN+/ZD/B7Ld7hkeuzxLTnNfhAtYJr7OuNM4RuJ6YkByvh+8Auc/B
	+UMAu70oLYsW1ee03wY/AxlBl1s9YwSvddNSo7g4hnUkXDgMc/0cScB3lEaWblVEKdCOu3m5Pfb
	aUzqd/Mb8tDv/Be3pG912gZYpg2aPV3t9GUk5qv3F7tmX73oCwFwY0YjFCrbxly661QROcQ/zw=
	=
X-Received: by 2002:a05:7301:db8b:b0:33b:fe7b:460e with SMTP id 5a478bee46e88-3426febc80fmr5822057eec.7.1790486253039;
        Sat, 26 Sep 2026 22:17:33 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm20713863eec.6.2026.09.26.22.17.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 22:17:32 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Thomas Maarseveen <maarseveent@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] errseq: fix lost writeback errors in errseq_check_and_advance()
Date: Sun, 27 Sep 2026 10:47:24 +0530
Message-ID: <20260927051726.71337-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

errseq_check_and_advance() advances the caller's cursor to the value it
tried to store even when its cmpxchg() failed. If errseq_set() stored a
different errno in the meantime, the cursor holds a value that was
never in the errseq_t. errseq_set() does not bump the counter while the
current error is unseen, so recording the first errno again recreates
exactly that value, and once another subscriber has marked it seen, the
cursor's next check returns 0. For fsync() (file->f_wb_err) and
syncfs() (sb->s_wb_err) this means that a writeback error recorded
after the previous call returned is not reported. The race is rare: it
needs two different errnos, an error recorded while the check runs, and
a second subscriber consuming the value. There is no user report; it
was found with a model checker.

Patch 1 retries with the value found when the cmpxchg() fails, so the
cursor is only ever advanced to a value that was stored with
ERRSEQ_SEEN set. Patch 2 adds a KUnit case that races errseq_set()
against errseq_check_and_advance() on two CPUs.

Two behaviour changes are visible to callers, both intended. When a
writer wins the race, the call now returns the newer errno (still "the
latest error", as documented). And when two threads race on the same
unserialised cursor (syncfs() does not lock f_sb_err), the loser may
now return 0 where both used to return the error, so each open file
description gets one report.

Dependencies: patch 1 applies to mainline (fd179f8a05be) on its own and
carries Cc: stable. Patch 2 extends the errseq KUnit suite from commit
b52f5c1605f2 ("lib/tests: add KUnit tests for errseq"), which is only
in mm-nonmm-unstable, so the series is based on mm-nonmm-unstable
(e8d6475e77a7). Patch 1 could go through mm-hotfixes and patch 2
through mm-nonmm-unstable.

The bug was found with a TLA+ model of lib/errseq.c checked with TLC.
The patches were prepared with Claude Code (Anthropic), model Claude
Opus 5.5 (claude-opus-5-5).

Tested:
- KUnit on UML x86_64 (kunitconfig with CONFIG_ERRSEQ_KUNIT_TEST=y,
  CONFIG_SMP=y and CONFIG_NR_CPUS=8, run with --kernel_args seccomp=on
  --kernel_args ncpus=4). Without patch 1 the new case loses the error
  in 21,957 to 116,003 of 2,000,000 rounds (1-6% over 8 runs,
  depending on host load), in 44,886 with ncpus=2, and in 30,353 on
  UML i386 with ncpus=4. With patch 1 it loses none (8 runs with 4
  CPUs, 1 with 2 CPUs, 1 on i386). All other errseq cases pass. On a
  single CPU the new case is skipped.
- A userspace replay of the unmodified lib/errseq.c, with a hook before
  the cmpxchg() standing in for the other CPU, loses the error every
  time.
- TLC: the current code violates "an error recorded after a check
  returned is reported by the next check"; with patch 1 the property
  holds exhaustively for 2 subscribers x 3 checks and either 1 writer
  x 4 errors (1,364,445 distinct states) or 2 writers x 2 errors
  (141,055,253 distinct states).
- W=1 builds of lib/errseq.o and lib/tests/errseq_kunit.o for UML
  x86_64 and i386 without warnings, and checkpatch --strict.

Not tested: fsync() or syncfs() on a real failing device, weakly
ordered hardware (the model is sequentially consistent; the fix adds no
ordering requirement beyond cmpxchg()), and architectures other than
UML x86_64 and i386.

Shashank Mohan Jain (2):
  errseq: don't let errseq_check_and_advance() hide later errors
  lib/tests: errseq: add a concurrent check_and_advance test

 lib/errseq.c             |  29 +++++++----
 lib/tests/errseq_kunit.c | 110 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 123 insertions(+), 16 deletions(-)


base-commit: e8d6475e77a75b7a84e42c9d23e238e002f2758f
-- 
2.43.0

