Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446124;
	b=oQCQhLd93iOdFT4Kl3d70bWFVoVXJxQO5SArqxifc1IUNNLcsW4RRx2ee0nP2rQj4c32
	 wBmkYQI1YjvLWxQQenNlHiVEa+awSV+XvUGNuaSJr8gw4uMUD/CDus7UDrPM/2yfk4GZh
	 D4e6kE6SVBpXZCPhuTJnPjHh2CCXT1mLjbVoRvEkVqcW2ETeJS1uc9ovOUjrbNkxVf1YH
	 2ks7W8iL+QBRT7AdPPsT/m5HLyJvowjvjv+scX9+DTtmaNgBtdQk5gK21OyrppUm1vy9F
	 /qp+OxlHPDXf1nl5fyIHT7ezhiUn0vMRR47rlPi2MB2O7wmiKNLzznDWaerpBbcO1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t4mmpYAAB5nspJI5JB7CDrr7JDrHcqy1ptTPlsjfoME=;
	b=vc8dF+p70JzKyiJosCiozuem/nFktEW577e+OK5ROSDtIigUMrWT6dA+eFmOLsq9mP9P
	 5028kZAkd7MvE+PXVt+aJNRfA2S5YGTu0ellMQv01b4YIe8syu5gIQKyl1upr5K3Gle1/
	 FRfSTBA0nmFU0x9DiRgwnzQvG8efwx6ryXNPYNg3IwuLorvyGjm6rPX4BFu3l34ezBrbx
	 MQerO4xCnc6z6FI3UG967IhQ0t4sLoijt4uW8CbMt9eQZChhLE4Aerj0H9Snclhc35uHB
	 TuUWwpDtJr37YZAmOUqWo/kO2azzJE24opLwY2RX4aXuO8SlrixvPxHXoVU8RP5O75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DdIukcm1;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20D606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D20D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DdIukcm1
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so511646eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794446123; x=1795050923; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4mmpYAAB5nspJI5JB7CDrr7JDrHcqy1ptTPlsjfoME=;
        b=DdIukcm1zK9hB5+kD1InlHwZdxZbFc0E+L4xbkQJtc0OmO28rTgJlUoOAeCUc7bT9J
         Yk2SBpfPe5R8AYtHW81umhIXzwPJ4u7q3W5jsvPHRp0JGPplPVeXLKSnj3EMM0JsLEam
         ctwYe+U7QI9UEMcA5mj1cBT8DmkOlqgocrXvD67L5O5q/5AuyxkpRdltqkSdM6mAsZ80
         /Jsu6YpDPcfbYWR7pbSlgu8cRAfBIn3LSkT/3cTEej36GPFi+aPxtpCPwBbghlLVzsOh
         wMG6AVM/mFdcX1a5MDCdysSyRDMYWPJ5jqSThOEwK/SnqfCUY7xlsikpOWFdQdWGFY3y
         tvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446123; x=1795050923;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4mmpYAAB5nspJI5JB7CDrr7JDrHcqy1ptTPlsjfoME=;
        b=ZwspDXrV6iXbYN5j51Bk29lWW1uEACJeawJzxFRY1CoU6uAUHPd2XVHEcdEkIT6IT5
         CoEERQAPzqqeGx+LP2XKlGfEIwMj386GKq1PlMJfrTJRAAfChpDqMVgNdDIg0MKMNEhS
         nq9rRCz4dsOOsKHerI1zzZUiuqYXhIJCly1110w/QjOnYj6felkQyTAxnU+rCP8ffgT1
         oxzLOR2ZYwczJJEt0IUwA6IwRqQ/oUUcEPdHNiVomW2CYfXRPsaQ5zCU7WEmWTE8zJlp
         jYkKpqhU5jBcVdOB4PYI3FH7buI4vr+DYTjPzVblw+n3joYrcZCIwlPGTOU91tt1pA4M
         cH3g==
X-Forwarded-Encrypted: i=1; AL+hErFLm9/01Yyv2qL7HX6bmOKcFy3424SxmcOtn3lCj9KWi6XNj0VhsWUMPivrxiYzhUfu5KbuINi3IUqSZpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Zfol/y8q3gK1YVuMXmkldoJ8KN5KsLZEyS8WCrSqKeUg5doG
	ecR9tdbva2wZ5GHQjA0Gsmu47MpzQqK89XjSW/6qmGXKUO7VyErdb8OS/i8XNuZ2UiiImuwOD04
	xxz9SeIO/jw==
X-Received: from dlbrx10.prod.google.com ([2002:a05:7022:170a:b0:143:7311:4b88])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2906:b0:143:271a:3df2
 with SMTP id a92af1059eb24-1b3c0361cc2mr3305997c88.44.1794446122041; Wed, 11
 Nov 2026 17:15:22 -0800 (PST)
Date: Wed, 11 Nov 2026 17:15:09 -0800
In-Reply-To: <20261022204627.1813821-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022204627.1813821-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112011514.4032822-1-irogers@google.com>
Subject: [PATCH v4 0/5] perf build: Support building BPF skeletons with bpf-gcc
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, cupertino.miranda@oracle.com, 
	eddyz87@gmail.com, james.clark@linaro.org, jolsa@kernel.org, 
	jose.marchesi@oracle.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently the perf build requires clang (>= 12.0.1) to compile BPF
skeleton programs (.bpf.c -> .bpf.o). bpf-gcc (>= 14.0.0) also supports
BPF CO-RE and BTF generation and is already supported in
tools/testing/selftests/bpf/Makefile.

This series updates the perf build to support both clang and bpf-gcc,
broken into small bisectable commits:
- Patch 1 fixes version-ge3 and version-lt3 in tools/scripts/utilities.mak
  so empty or fewer-than-3-component version strings do not shift awk
  fields across arguments.
- Patch 2 syncs bpf_skel.mak's get_sys_includes with
  tools/testing/selftests/bpf/Makefile for LoongArch and MIPS.
- Patch 3 updates Makefile.config, Makefile.perf, and bpf_skel.mak to
  prefer bpf-gcc when building perf with GCC (CC_NO_CLANG=1) and clang
  when building with Clang/LLVM (CC_NO_CLANG=0), while respecting
  explicit BPF_GCC=... or CLANG=... command-line overrides and falling
  back to whichever compiler is available.
- Patch 4 introduces tools/build/Makefile.feature in
  tools/perf/tests/make and switches the existing libbfd and llvm probes
  to reuse libbfd-threadsafe and llvm-perf.
- Patch 5 adds make_bpf_skel_clang and make_bpf_skel_bpf_gcc build-test
  targets to tools/perf/tests/make and verifies with
  'perf check -q feature bpf_skeletons' that BPF skeleton support is
  enabled (or disabled with exit code 1 for make_no_bpf_skel) as
  expected.

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v4:
  - Rebase onto perf-tools-next and drop Assisted-by tags per commit
    1e035297ffda ("docs: remove Assisted-by references").
  - Split the series into 5 smaller patches for bisection, separating
    the utilities.mak version-ge3/version-lt3 fix (requested by Namhyung
    Kim), the get_sys_includes sync, and the Makefile.feature
    refactoring in tools/perf/tests/make.
v3:
  - Reuse tools/build/Makefile.feature and tools/scripts/utilities.mak
    in tools/perf/tests/make rather than open-coding compiler feature
    probes, and explicitly check for exit code 1 from 'perf check' in
    make_no_bpf_skel so crashes are not masked by shell negation.
v2:
  - Pass only -dumpfullversion when querying BPF_GCC_VERSION, guard
    against an empty version string, and fix version-ge3 / version-lt3
    in tools/scripts/utilities.mak so empty or <3-component version
    strings do not shift awk fields and evaluate as false in version-lt3.

Ian Rogers (5):
  tools build: Fix version-ge3 and version-lt3 for <3-part versions
  perf build: Sync bpf_skel.mak get_sys_includes with selftests/bpf
  perf build: Support building BPF skeletons with bpf-gcc
  perf test make: Reuse Makefile.feature for libbfd and llvm probes
  perf test make: Add BPF skeleton build tests for clang and bpf-gcc

 tools/perf/Makefile.config     | 83 +++++++++++++++++++++++++++-------
 tools/perf/Makefile.perf       |  8 +++-
 tools/perf/bpf_skel.mak        | 36 ++++++++++-----
 tools/perf/tests/make          | 76 +++++++++++++++++++++++++------
 tools/scripts/Makefile.include |  1 +
 tools/scripts/utilities.mak    |  4 +-
 6 files changed, 164 insertions(+), 44 deletions(-)

-- 
2.56.0.567.gdb80ae8cd5-goog

