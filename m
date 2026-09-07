Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4C42467E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767925; cv=none; b=ct1rK4UgBzh/BxKd+oOGgIndHpsu6pNRqIm6vgqsFKv+pVR5rAfcv6qSm42ApUMFy/43NB7XvYj82C1dg6HsY4aFkjTv7mRIq28LJ0oY5PjS3n+DP2HTGApIZ3WH7xcqOWmF5J6Mobj/VZpfpK5aYgfrcWTaDsWWrAQ/C14B0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767925; c=relaxed/simple;
	bh=1mi1sSG1PVDArQh/a0HO6FvPy3+9LwKcOd0df0B8rHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EvIkDfHfbEqJU2g2UwOykSnl1JjBtpu1KSOohz5jATzJilPTf7M4W9p0/arOSOV2PucKWPQRYvlzuqvGZF66rGN4IsYoQbWaGf6GidFQdAngXjgr3brBjlWg3hRDa2+OOOszR9dPZzVGfLW+or3ypifV+cKC9TCw5w3lBZvORjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gqf4nY2n; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gqf4nY2n"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d58efc7356so40720285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767922; x=1789372722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxc8R48qLM7BEgjt6r51DucmEwVVWY83jnrPGmsGhs8=;
        b=Gqf4nY2nXEB1WE3T0bozlmZDtX4q03QOD04JcB9p5Ze7fIt5T9YK6928BC5UKTXmFx
         jqzeIE4QggU9Lawi1oaUxT+++roXJegPmhIS2hdrXszQNkJSZNexPPiHgCU+8Jx109ET
         Q/zGX1BMZEYd8VjDnlhbNCsmkv9pR1yQjRdYCK7Ts2IIt8WfjFC7YOXsmg+X44eM+Lkm
         UVgT5QHgQ6rLRdJPoda4lgmlWcPJKqdKbX1q2LtCs5fgcbl8dCrtqJguFJAh4DLyxjb6
         bP5EeLgs1+mJ16D7OwbX3ELp3Q7XimKcq96FZEyzpVbrXm06FLHGz4YalYJkoo4VwG9d
         q47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767922; x=1789372722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxc8R48qLM7BEgjt6r51DucmEwVVWY83jnrPGmsGhs8=;
        b=UpB+0yTAKxxgr8JYm+BJ3WDEwnNVA44nbIqbLXYdB9A/dpQT19kCx2M5DlGcAbSrIO
         f88hQipH1YwpO+4WvNEjOY6DlHaVICvwC4b6ATBeaf3L2fOxC6oYA3z/9aVmc8QS84Bq
         QsojAWdAjn87EAydS66z8N8cBww7/jg704HmnP9dhae3WRCtfu3khAgmGuqD8iSJjP03
         qazR2qUmYCnwjTFFBbOVHeCXsWMf2/5pAL1HlfAWNoHPxYggOw+SHUfNNpBUbX88eO6K
         tnaKcTjPJpGaV3os+EaxPVUwksDewlyBMPc5RqOkmMa0fpMsvk1X8+rCeD5J25kGys9j
         ITsg==
X-Forwarded-Encrypted: i=1; AKwUvByKk//axt/swcmlYUYmcH4iJh97/2zsWx7c6vQ8DsRWQPKwLIBy1PCoIuCbORWyegWn0MVk7a0qReWHxvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lMWWwxq+NUFE5VjYXywbTew5Bvi7S7k1t4qOHdFO40AyowJ7lO
	gUQrqgvVjLiSn/YB4PgSdDnQ2FjQufUyujDNxHg5v40rOZde7CuEaprv
X-Gm-Gg: AYBFou21LaP555f5p51Rf1fKgLBz9LI9lKM0lSE1nydeU421leF+cM+wizuYarnWZAp
	v2RWFf2AYJidLB0QbhILUhxPcQftHHj1WfJ2S1mfD+PbQVVUpiSd/Ht88Trs1sshb2sPca8zv2w
	H6QXRnharqCTmuPWUrqHUf97Zz3PAbRw2vUAyV5fqHgRvtozihSt0+FtanIiHnd8FuQJGYRaANk
	wVH1hH9zoofutcg1zQJZfQWEBwOnBIyd8I1JgbsiYXHz8qmLTqAryVveDSDKT3aT716Irv+bAk7
	v8F/fq8EajZc/sC0fe4H5TzR9fVLCROL3WoZ6aZvstglom//JC48IWauAz3YhU28eIFMmYEwlLF
	/6ttdrtSEU45TF2LmRH8rnPdGzGd3xS69BHuE/VSrC8xLWAWBS4DXOQoEpWtuhL2YOlC89aoI2r
	FfEN9btpTXPTDpRRdhvDmlinOz84lXjcbeb32h2sI2Yf+g0Qu3Q1+J4LycHDDH+DYIk8d4RfATI
	NtW3uYm
X-Received: by 2002:a17:902:d587:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2db1265add0mr316562505ad.7.1788767921900;
        Mon, 07 Sep 2026 00:58:41 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:58:40 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 00/13] srcu: Round out atomic SRCU support
Date: Mon,  7 Sep 2026 15:58:16 +0800
Message-ID: <20260907075829.2073224-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

This series rounds out atomic SRCU support with a reader-free fastpath,
some atomic-context fixes, and additional test coverage.

The core change is a reader-free fastpath for synchronize_srcu_atomic().
Atomic SRCU's read-side critical sections disable preemption, so when
the summed lock and unlock counts match for both ranks,
synchronize_srcu_atomic() can end the grace period immediately, without
the index flip or the srcu_advance_state() scans.  Correctness depends
on the grace-period anchor written by srcu_gp_start() preceding the
lock-count scan; two LKMM litmus tests (patches 1-2) verify that
ordering.

The series is:

 1-2  LKMM litmus tests for the reader-free fastpath ordering.
   3  srcutree: add the reader-free fastpath.
   4  rcutorture: add --do-atomic-srcu to torture.sh.
 5-7  srcutree: honor and propagate is_atomic so atomic SRCU never
      transitions to big.
   8  srcutree: forbid srcu_expedite_current() on atomic SRCU.
   9  rcutorture: disable srcu_expedite_current() for atomic SRCU.
  10  srcutree: skip callback scheduling for atomic SRCU grace periods.
  11  srcutree: drop the srcu_barrier() sleep for atomic SRCU.
  12  srcutree: remove leftover debug pr_alert()s.
  13  srcu: restrict the non_block annotation to task context, fixing a
      KCSAN data race.

The KCSAN race in patch 13 is a data race on the interrupted task's
->non_block_count when a timer callback runs atomic-SRCU readers in
inline softirq context.

Tested with herd7 7.58 (litmus tests), torture.sh --do-atomic-srcu, and
torture.sh --do-atomic-srcu --do-kcsan (KCSAN+PROVE_LOCKING).

Kunwu Chan (13):
  litmus: Add SRCU fastpath anchor-before-scan test
  litmus: Add SRCU fastpath scan-before-anchor test
  srcutree: Add reader-free fastpath to synchronize_srcu_atomic()
  rcutorture: Add atomic-SRCU support to torture.sh
  srcutree: Honor is_atomic in check_init_srcu_struct()
  srcutree: Make init_srcu_struct_atomic() prevent transition to big
  srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
  srcutree: Forbid srcu_expedite_current() on atomic SRCU
  rcutorture: Disable srcu_expedite_current() for atomic SRCU
  srcutree: Skip callback scheduling for atomic SRCU grace periods
  srcutree: Remove srcu_barrier() sleep for atomic SRCU
  srcutree: Remove debug pr_alert()s
  srcu: Restrict atomic-SRCU non_block annotation to task context

 include/linux/srcu.h                          | 10 +-
 kernel/rcu/rcutorture.c                       |  1 +
 kernel/rcu/srcutree.c                         | 95 ++++++++++++++-----
 tools/memory-model/litmus-tests/README        | 16 ++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 56 +++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 53 +++++++++++
 .../selftests/rcutorture/bin/torture.sh       | 24 +++++
 7 files changed, 229 insertions(+), 26 deletions(-)
 create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-scan-before-anchor.litmus


base-commit: ef15070f96c5f07de3a9b593c36f6e83bc9e3d58
-- 
2.43.0

