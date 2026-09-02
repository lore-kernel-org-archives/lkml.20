Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDEE4A5EC2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364145; cv=none; b=DBGDklSpvDOCLCDZco2qalBIcmAKdNhVGAyq111Z7OURU18ki5PfnO1qPB0flc9noR+hMBgqZK4rBBD36lHJRQPSfYQ2cMA1zxC8CZgePo7iJ+RPRSRoi/mepU5zo1vpfooMNkvHmE2SlFUWE7rOp70M3jJB3v3+tz4LC4YEJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364145; c=relaxed/simple;
	bh=7vAxRRbJLQbGjzYhZfE8GOaSa9he4WmrA/5IM4MQBt4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=fdT++eQWN3pA3/B4uO4KhQmsgh4h+XlTPQld0s2QN1LRzSeYP4lPWm9CRt2e1s06jFkIRfMhjpngIN4BLny7AIe7PYkzck+T5Ey0GJLWsgPMhXJ27iOBF42/yaDrj1FOmec9Hu9srxAWATzHSkxz86utxehD3iVfWKRZbWLJhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=thSvBrCZ; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="thSvBrCZ"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso13762a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788364142; x=1788968942; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BjTye98IgOGmelm/cLqooPf13I/e9bRqoz8Zlbwjvx4=;
        b=thSvBrCZEsx6wbkeNQMEjROAhCJLvWFjtg0zunL0u1MhghHML38tubA5vCI/9aYkaO
         GRqHZ3Q9hxMetc5X5BmEQ3EKYU3V6cEP17LQZfOJpE8s3VEADUyGI7GQG2tw685HXujO
         tn6KMmkgWftQQKtfuD/dT/5bY4kbilSsL2vrLxrdgSyEP1lzWC/X/PDyeA8d1tUIaa89
         UdD+oBlW78FWstD4fK1tF4Dxz4xuas1IMV5ZkMtjiK616foE5WOl0IwzKcRUnD6vdU3w
         FNj82clanUCCrfJ8rtQfLz2L3eCs0yH/ERBaLZVjGP1JrtYXSKetSSQkLyZ9Jgshg5n6
         S21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364142; x=1788968942;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjTye98IgOGmelm/cLqooPf13I/e9bRqoz8Zlbwjvx4=;
        b=FNXR1u6Uy83eb7bKB8PMmK5KzF60I/EmSmbfAApaYHT27xtApAviYxfrlaq9zGn4Fe
         rekq+qESbisKqyJf60M6540vHfXaLB73GVfagQmVKCtXWj0PcxR2niKo/d21vqp3DiCL
         5fd5Re94D+cln6K4OwY6gptr8Z3TyOPYOzdEeYJ7GGyUBf2WTWol/mp4w6viR4FIG0Dx
         Lod+rMdBruT0VjIpILonBVsKo5CP4sfPNHIpza6XnFCfYXWH+98oYdj3TlXb12WLn6tY
         JgjTq8vRB8bdxHdrCBvSNXFca/k9Ojjd/Flh8bw+4SvjEbYX0SRkZ66tXOuE8cST9p0y
         dnOg==
X-Forwarded-Encrypted: i=1; AKwUvBxDdfjzRFHGiXGVuSd6uSjNoxjFQGN9qvTilrSaNVU5gN9I1LTkCdpFH78P7xV48GA1u/zF3VLqS+f3850=@vger.kernel.org
X-Gm-Message-State: AFuF++ms7hCw3LuECB/TGAyR2305Mm5Ge+7fgaRGzylQKq1nhaWB9734
	w5jll6RKp7XKV0N/Yp3cgpZ1/xUTjs9/+cfM4DM5W6rF4MgzrU7JLl6RDp0AA+spxlf5olukqy+
	iVnQMyvXW4g==
X-Received: from dlag8.prod.google.com ([2002:a05:701b:2508:b0:141:4a59:5b22])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d44:b0:38f:cab0:9aa9
 with SMTP id 98e67ed59e1d1-39b0803b0efmr157324a91.13.1788364142054; Wed, 02
 Sep 2026 08:49:02 -0700 (PDT)
Date: Wed,  2 Sep 2026 08:48:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902154858.2078885-1-irogers@google.com>
Subject: [PATCH v3 0/6] perf tool: Build dependency tidy up
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Tianyou Li <tianyou.li@intel.com>, 
	Jiebin Sun <jiebin.sun@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In doing some work on bazel building of perf (bazel being stricter on
how header files are used), rather than just making the bazel BUILD
files more generous in how they accept header file issues like
transitive dependencies it felt cleaner to address them. These patches
tackle the most severe issues such as cache.h pulling in UI code,
hist.h bringing in UI code, unused header files, transitive
dependencies, etc.

While cleaning up the dependencies in perf.c, change how missing
commands are handled to give a more meaningful error message at run
time about missing build time dependencies.

v1 and v2 were previously sent just addressing the cache.h issue:
https://lore.kernel.org/linux-perf-users/20260828222045.1314766-1-irogers@google.com/

Ian Rogers (6):
  perf tool: Remove util/cache.h
  perf tool: Tidy up util/cache.h header file users
  perf tool: Remove unused includes in perf.c
  perf tool: Move usage strings and functions to perf.c
  perf tool: Add fallback stubs for missing dependencies
  perf hist: Remove keysym.h include from hist.h

 tools/perf/builtin-annotate.c      |  57 +++++++++------
 tools/perf/builtin-c2c.c           |   1 +
 tools/perf/builtin-config.c        |  18 +++--
 tools/perf/builtin-help.c          |  30 ++++----
 tools/perf/builtin-kvm.c           |   1 +
 tools/perf/builtin-report.c        |   1 +
 tools/perf/builtin-top.c           |   1 +
 tools/perf/builtin.h               |   3 +
 tools/perf/perf.c                  | 114 ++++++++++++++++++-----------
 tools/perf/ui/browsers/annotate.c  |   1 +
 tools/perf/ui/browsers/hists.c     |   1 +
 tools/perf/ui/browsers/scripts.c   |   1 +
 tools/perf/ui/libslang.h           |   2 +
 tools/perf/util/Build              |   1 -
 tools/perf/util/cache.h            |  31 --------
 tools/perf/util/config.c           |  38 ++++++----
 tools/perf/util/help-unknown-cmd.c |  15 +++-
 tools/perf/util/hist.h             |   6 --
 tools/perf/util/path.c             |  10 +--
 tools/perf/util/path.h             |   6 +-
 tools/perf/util/strbuf.c           |  14 ++--
 tools/perf/util/usage.c            |  34 ---------
 tools/perf/util/util.h             |   4 -
 23 files changed, 194 insertions(+), 196 deletions(-)
 delete mode 100644 tools/perf/util/cache.h
 delete mode 100644 tools/perf/util/usage.c

-- 
2.55.0.966.g6673acef38-goog

