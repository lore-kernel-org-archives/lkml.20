Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472AB29408
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195327; cv=none; b=CWxRTRf01eFMSJ3Or/cFF8AkxNZ5DyVQqDm2APmHY4RyX41IXgPudsXB8hCvFJL8VIYQff/+0vXGjz2eyfhQLlcwkYbIgctlSmlwtbtWlPEQ/q1maNLIVY+AubRZQslFTS2csagtzXaPoVKeaRfpr82BeA/cODnq9YBgJcQmdhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195327; c=relaxed/simple;
	bh=POXTrNGv+GCsq3rpGkOZHzhbXVWYTVD57aU2fqPlwHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzoLI4UvZuPJw2njo/atXHsPM8+xSZK94f7uylCGHRYBUWJiMwh96c1TBEgjMWPua20dXsPv06XSfcy46n/hGeW9I4xkXdk5+XkmwxHIaWT3KDY3/BAvLD1VhirBILT5c5wKyRtVef8f5gcW+mZ4nmQK0eHJ9/ntTu4VPlW9ktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAcG/L6f; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAcG/L6f"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab432273c5so3962777b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195325; x=1792800125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kb5ovXG39HlSm9ZP0WcMH+pOxW4KkuHVqzsRFfblPd0=;
        b=HAcG/L6fKC8XZyM/9O7Pipvwi1y7j3cqLvXeXz598VKC2zpT+pT9dT03fJWxYUAWkt
         4I6I8AAoPqq24NSpbw24+9LR4WuoiyIMkjMacH0VuvM3O4zTLLXYUWRvDsvvO+BhTUHZ
         GjU131Rn/+h9WUOFH02u35ZJpv2NBWu9asZuyXWmSYOkCDRAlwYdYygH+pJESNL4XhPA
         X9PXwY4nmDGFQn+IV36iEuChz3WuEmYM/aJqprO8/BkbZRplh3oUUBR7BDPnad7bu/+w
         rlQy6KZjUQgU+cmgYMAxtga+Vhlg1eGNMIrNUfSE3Rxgr99KbjpzhmeJZmjEBjxtsgpm
         DAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195325; x=1792800125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kb5ovXG39HlSm9ZP0WcMH+pOxW4KkuHVqzsRFfblPd0=;
        b=UGuotVUDXkLx37zt5QmNv26SCxiUdsYYnsuXUmyksaMi015BPljsVN2blNCVlARS45
         Gxktx6+RLku8AJ7D0vqRXrsxvYCIjIGdKkchK/j0AVdm6q8kOhRR/n7OeEykYNQ6mUhW
         lq1hFe3JLPQOxWziLwY1xHQPehPbOPFu/ysh+eUmzTYAr6iW3PqcbADYv4e8PakIyU/m
         tZAdd7EreUrA+ar8yx0n7ML8uxb8LuMtcX93whuc5DUx7Gz1UHvvMRyDwTiH5v6+6U8T
         Xaa0RqywktFrFIhXBAWGUPB4FYCMtosMggOVLxh//ZJuERh5EA9OlDliZ2WbN8wZuifr
         5ndw==
X-Forwarded-Encrypted: i=1; AKwUvBy3WHu1rzvMqsmLCPrvsJGMHlm14FMenQKxFGElSZl9C+nE77C2+dtpPCdxlFY+TtMLGTkOw43RSqnuD84=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIGJ2naVFUiJ/VvTPhJEqLc13TCLStDlnZtQa7uYSfoiKVYHPd
	GyFn73WuQZmuY/IVL97KzqlAjvyz4VVHscEPrYFjZWeiimhUjEt9vib0
X-Gm-Gg: AYBFou2CrAJ7WPReIMT4nG6Taeo5VR2/UIkklIY2rvR9ELWsZNihcZOyZuDBPOjn2m0
	nRtqwJa2rPydRrHTQqUatEMR7OSlEzaVq6/CPgyiGRkrbgqx8egmn3GLd1ulbQQJ1CTdsrFgzdK
	qNYXLqf719Mrorg3GAmwVABqSdIWm3TCUhh55CrbIm1mU1S2JGnCjjSN+sC3jf7TI/sPh+4Sw8k
	kOCt7dWPBWdrxxkqhxvGUgRKsPcclnc/meHKgZ+JWBKJ2s6HrbG0zPnlH0AGIDwXg6GYtUdyUFX
	nFSRQJPuRbqfQ7z11Naks9VltwpXyBKtDpmAc04NMn+gX4j+LL72gxHyRVr6g30pW2Ea/bztW+G
	DIVGMR5BgUCwdFjZGxMRqIqWIUixZKfQTAl1xAapszy4mDZi/V25YvhEvK7M0B9AO7CChgcw0ep
	RiAkFoGmo2KMWROCtyNFF5HWBFpl3GopZveSNHgzJed4Kx6sN7ocnXsNkt7qSJue6w6f6TqQ==
X-Received: by 2002:a53:ac9c:0:b0:679:b16a:8dc8 with SMTP id 956f58d0204a3-679ca756264mr354465d50.20.1792195324916;
        Fri, 16 Oct 2026 17:02:04 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1c91e8esm1729279d50.2.2026.10.16.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:02:04 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] perf unwind: Don't load symbols when the caller doesn't need them
Date: Fri, 16 Oct 2026 17:01:51 -0700
Message-ID: <20261017000158.1178269-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When perf only needs to know which DSOs a callchain passes through, as
build-id marking does at the end of 'perf record' and in 'perf inject
-b', it resolves the callchain without symbols. The DWARF unwinders
ignore that and look up the symbol of every frame anyway, which loads
and demangles the whole symbol table of each DSO they visit.

On arm64 every frame pointer sample also gets a short DWARF
unwind to find the leaf function's caller; since v6.17 (commit
29be60c93d2d, "perf build-id: Mark DSO in sample callchains") the end of
'perf record -a --call-graph fp' loads the symbols of every user binary
it sampled. On a 128-CPU arm64 host,

  perf record -a -e cycles:u --call-graph fp -- sleep 2

never finishes writing perf.data, with over 1GB of heap growth in 5
seconds.

Just skipping the symbol lookup isn't enough, because loading the
symbols had two side effects that the unwinders depended on:

 - it set dso__symsrc_filename(), which is how both unwinders find a
   separate debuginfo file, for instance to use its .debug_frame;

 - it read a missing build-id from inside the DSO's mount namespace,
   which libdw needs to fall back to the build-id cache.

Patches 1 and 2 provide both without loading symbols, so the frames
that come back don't change:

  1: move dso__read_build_id() from 'perf inject' to dso.c
  2: add dso__find_debuginfo() and use it in both unwinders
  3: pass the symbols flag down to the unwinders and honour it, which
     also makes the arm64 leaf frame caller unwind skip symbols

Testing compared v7.3-rc7 with this series, on x86 and natively on a
CentOS Stream 10 arm64 host:

 - The 'perf test' dwarf unwind and 'perf inject' DWARF callchain
   conversion tests pass on both. The libdw multi-threaded unwind test
   passes on x86 and is skipped on the arm64 host.

 - 'perf inject -b' on an x86 'perf record --call-graph dwarf' profile
   of a Python workload goes from 0.24s and 58.5MB max RSS to 0.04s and
   15.5MB, with the same build-ids injected.

 - A test library built with -fno-asynchronous-unwind-tables, so that
   its CFI is only in .debug_frame, then split with 'objcopy
   --only-keep-debug', sits between two other DSOs in the sampled
   stacks. With libdw, on both architectures, and with the debuginfo
   found either through .gnu_debuglink or only in perf's build-id cache,
   'perf script' output for --call-graph dwarf profiles, and on arm64
   for fp profiles, is unchanged, and 'perf inject -b' still unwinds
   past the library and marks the same DSOs. An earlier version that
   only passed the flag down lost every frame past the library in all
   but 5 of 4045 samples in 'perf script' on x86, and unwound 10127
   instead of 33738 frames in 'perf inject -b'.

 - libunwind on arm64 returns no frames with or without this series:
   since v7.2, libunwind-arm64.c checks HAVE_LIBUNWIND_ARM64_SUPPORT,
   but Makefile.config defines HAVE_LIBUNWIND_AARCH64_SUPPORT. With that
   macro defined by hand, and a cast to make its .debug_frame code
   build, libunwind results for the test library are the same with and
   without this series. Neither gets past the library: the .debug_frame
   code looks broken, as the table that dwarf_find_debug_frame() returns
   is passed back to libunwind as a remote table. On x86, EL9's
   libunwind lacks .debug_frame support, so only the lookup could be
   exercised there: libunwind now finds the debuginfo from the first
   sample, instead of once the DSO's symbols have been loaded. These
   libunwind problems are independent of this series.

Not tested: the build-id cache fallback for DSOs in another mount
namespace when the MMAP2 events don't carry build-ids.

Changes since v1:
  - Complete re-work on approach based on feedback
  - Link: https://lore.kernel.org/linux-perf-users/20261014151326.4142140-1-thepacketgeek@gmail.com/

Matthew Wood (3):
  perf dso: Move dso__read_build_id() from perf inject to dso.c
  perf unwind: Find separate debuginfo without loading symbols
  perf unwind: Don't look up symbols when the caller doesn't want them

 tools/perf/builtin-inject.c                   | 25 --------
 tools/perf/tests/dwarf-unwind.c               |  3 +-
 .../util/arm64-frame-pointer-unwind-support.c |  7 ++-
 tools/perf/util/dso.c                         | 60 +++++++++++++++++++
 tools/perf/util/dso.h                         |  2 +
 tools/perf/util/machine.c                     |  7 +--
 tools/perf/util/unwind-libdw.c                | 43 ++++++++++---
 tools/perf/util/unwind-libdw.h                |  1 +
 tools/perf/util/unwind-libunwind.c            | 43 +++++++------
 tools/perf/util/unwind.c                      |  7 ++-
 tools/perf/util/unwind.h                      | 11 +++-
 11 files changed, 140 insertions(+), 69 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
--
2.53.0-Meta
