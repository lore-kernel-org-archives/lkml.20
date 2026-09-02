Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70B41F5D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341536; cv=none; b=ata/Ympi0xoMXjMLznp388ZldCrHBK/P2yOozyYz+mEzaZmKkuTXvB1Babbuex7CMl+WYGUsxbUdQJiRUoO4gmvK8jpebRQHeezG0BQ+Qy/VmfHMNO9mzbHGB3B0XIsiF7onhd8DI71Rbm4mPdMxMYoWR7J/00ECnmLHTpZDUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341536; c=relaxed/simple;
	bh=3q+Racj061pHQzMirxpOck8ORqOP9kZiS847UMRPx/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0jmpfT4RO/GcsAlCrFkA3Bq9lY2rz4G7HnBsaj95oN5SiKf/i2+wy6Im7NLE87zIYLCHyfTelkFIx1x4g6THQlw1B5HyDlLz35uhT7kMEXEBCRNsocJL0APXf4ZFtnvVDd1sr3O/1lkMSq0TfjEjSiRSMN5b2A2hWhjIorgmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Jrc1RJtT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Jrc1RJtT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1034659a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788341534; x=1788946334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xiOd++yN59iYM002z+jiLpYNo4lUzruGc+dFpShCWO4=;
        b=Jrc1RJtTtMZ+EPHcsKH6FGhYyWr04DBihR1rZ1FGUpuw+rQheessggHWfv9brU/B6h
         Cs+TUYXK4QYx0k+M98k9PvhtmuEPC099x1Gi6Su3W43a8Lz87XrMgStL+YC3wi7gXaAg
         iIcTb4jSPYSZSGP1owWXKPk/DhwQjtc5723xmMmD3C0Ol7tH3FnIQlEe7jCE1Aaf7Zdd
         S4KmRdIFMwM80zphLgLhGsDcZdyAP+rQU07lgZultEPJqy8pEnozx3OCcZUf/joIoWtq
         zEZ6Zx+q4jtBtb1yv7geJDFOlH6es+s7ndYiNsVMLHdxwkkrKSWliffAhudQNSTyc/5G
         S9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341534; x=1788946334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiOd++yN59iYM002z+jiLpYNo4lUzruGc+dFpShCWO4=;
        b=KFYhiz59SkPa3HI6d3eFVMs+BzjqLwuKszEi13952vJ2sl6EJB2iOUF4X/EpTS4fMY
         /F8ahZx5Gx/hvMF9Oh12ZqraPVCZ2ubxeSqwMXY+MCApBp/bvkRnIOlev5zLKrmPIktV
         ONOiCHShvy3GT6JbYDZgjdlcWn3H+ip80nQ2fCYQ7SYb+O8y5RmfErZ2QTxgEBQawfxp
         Qrc+ibsV7ctyHbhlO/PbTdm6OMwb1bc5+x0CoyQjkdgLmbQrNl65YbZLrY3FTkllIDFO
         IVFCERCXX9Hho175D5+e9KfmCdEb0WWYlKPDpciGp72Ok7PlPakoXU1AYBwEkJSL+vdh
         jQmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzatAnOWSfz4025XSGoo1KhrMqv9dmggygq1fsYaNbj1DBKNJQkzwcBxAJ+fpebIfzDe8k0T8uucv0MXF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mPW+AbtD4O1QK169hvomgDnInXP/7fBRZCmmf5R/Xj6r0p3/fb
	spNliD5fxnwxE1Jpb1i8PCAaaZW5qqspu/FRTJKbVgQCX8isDDzHDC2zfxmmqSwVEt8=
X-Gm-Gg: AYBFou1DkhnnOjTfn8OjHnzP3uUZOtjI5AyCEme8m4EidlRSix4MYY/vQ3GjpN0asBw
	hfT1ELi03ggMlJFTD7mcB3ydTUOtUG9iBaV7AWHhWyXHNrvydIu/ZfseHYWesS9SOcO1eCCuFAB
	tTMSrZtnyvS+rgRt8JAcXzmyhm2+EEMmteNL7obRK/rg6CAYhjaybP6pfuGkLGfsSZHA/407gH6
	XcxxdGIFyVgejVdQbLQ2nusXJMOGydbEhSe6hu1NKM9VO/AfRSx9RsZ2LpnTVAh6LSSoXUVyGVO
	uiS7ZY2vPKTxpckw/Pe/+7Ss+vgOqCJSdnVumBUMLz0TMX8uUe44ohcrnfCpyboAysQkICOeg/K
	EJOm2q46qNaBlQCqjxpVPL09cRJOErMLzzy2O68r5XzyRytcr+eEW1K86V7e0aV0ythGjvhEXxx
	BQiaNXje0eGz0TgmobnMOfLpKY9jHU/mD3TLzcq3jS9cjFPFBmILrAWZk19EEWNMMkSmH/B1AFo
	9la
X-Received: by 2002:a17:90b:1806:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39af650d689mr1807389a91.30.1788341534076;
        Wed, 02 Sep 2026 02:32:14 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdee2asm4525497eec.28.2026.09.02.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:32:13 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH] perf bench futex: Define SYS_futex on 32-bit arches with 64-bit time_t
Date: Wed,  2 Sep 2026 02:32:10 -0700
Message-ID: <20260902093210.3571958-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel does not provide sys_futex() on 32-bit architectures that lack
a 32-bit time representation, such as riscv32. Consequently glibc does not
define SYS_futex there, only SYS_futex_time64, and perf bench's futex
benchmarks fail to build:

  bench/futex.h: In function 'futex_syscall':
  bench/futex.h:77:18: error: 'SYS_futex' undeclared (first use in this function)

Define SYS_futex as SYS_futex_time64 when only the latter is available.
The guard and its comment are taken verbatim from
tools/testing/selftests/futex/include/futextest.h, where they were added by
commit 04850819c65c ("selftests/futex: Define SYS_futex on 32-bit
architectures with 64-bit time_t"), keeping the two futex userspace headers
in sync.

No timespec conversion helper is needed on top of this. glibc lays out
struct timespec on 32-bit architectures with 64-bit time_t as
{ int64 tv_sec; int32 tv_nsec; 32-bit pad }, which is compatible with
struct __kernel_timespec, and every futex_wait()/futex_lock_pi()/
futex_wait_requeue_pi() call site in perf bench passes a NULL timeout
anyway, so no timespec ever crosses the syscall boundary here.

Note that an earlier and more ambitious attempt at this was
commit c1ff12dac465 ("perf bench futex: Add support for 32-bit systems
with 64-bit time_t"), reverted by
commit ba4026b09d83 ("Revert "perf bench futex: Add support for 32-bit
systems with 64-bit time_t"") because it included linux/time_types.h,
which is unavailable on older distributions. This change deliberately
avoids that dependency and adds only the one guard needed to fix
compilation.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 tools/perf/bench/futex.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index fcb72d682cf8..6df8837b365b 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -14,6 +14,17 @@
 #include <sys/types.h>
 #include <linux/futex.h>
 
+/*
+ * SYS_futex is expected from system C library, in glibc some 32-bit
+ * architectures (e.g. RV32) are using 64-bit time_t, therefore it doesn't have
+ * SYS_futex defined but just SYS_futex_time64. Define SYS_futex as
+ * SYS_futex_time64 in this situation to ensure the compilation and the
+ * compatibility.
+ */
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 struct bench_futex_parameters {
 	bool silent;
 	bool fshared;

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.7

