Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812454;
	b=dCwwTFaSH0nQrSItm6ZI4AOivthFLvYnOtAVAeSc5YgFhiMLvSPx2JZiBymnj0QTBPL0
	 0iFp/AdJcKlRJWYugMFmefT7xEnBLsoHOcQhs46x8hLK2sleih7KiseUcQZy25pxJ13nC
	 p0kdj6+nyICFCtyS9z/F/VnibWc8hyD5Okob9c5+SJrt+l2mFjnJCIwmXTWcCJcNrlSsj
	 ESXk6oyTw/rInIwtfEX2gvaQcQRIJVngUvA37wWt/A0auZGXx5KlKbsned//zK0U3yTxw
	 kFxKcWlHeN9ITdbKmz/qLhHLWUibkjGvM1PWrIiogiaw6KUV7MofX2l/g16ZPkrdupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kh6UlnWztI3zIgcftIH9P4UlRyIS0R7gY9R2lXWQmVM=;
	b=fZc9IXvwbdmL049qAzG4/E5Vm1gYZg9hSJSujVtUcNp4UFp0JJmr8DDByLTOpPvRzO4C
	 H5wmjhkTdZeyk80dbB07cwI6evQkhVXPBXnqz4AC8M3vTuusHKdI/Qn9cBi1JMGCe88T/
	 7dnxGu8g4ulG+JEgByq7TQ+flwc9yOb15qhv6KysIGAq4zS16uW2Zbmpp+198QDoNJKrL
	 2UKFADu16tMPhbGOduz4TfGC/oM6tTub1SIo6iZBdwYAyvJ5UNE0VX61TNn9fJeWwCwJ8
	 twEma8KN3SZgYbn5RpWSt3kA+80XDMtmrNcCJDvx8VAC9iNmCUrOScNApjJoOjs8Zrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="FPXsc6/Y";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684AE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684AE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPXsc6/Y
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so2463934c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794812452; x=1795417252; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kh6UlnWztI3zIgcftIH9P4UlRyIS0R7gY9R2lXWQmVM=;
        b=FPXsc6/YYHPUANe6YRfnNKcurPGcVKZs7fZ+VMLxDYFz6p5tjrk3djH3XhauzR8Obk
         1ZdG34bGLLE6OW34lSXYceF4OHRcf9kkm4XltLCYgrY+TJw3y00c7mGuqU96ZPslc4ki
         zvNG6WkMaTnBeZvYOCQTv1TOKKoj9W9TRPfLSdTXZqDiT80vZWKu0lRr/0N7RN/AArKx
         qr4cAmg2uJ56emfW34ChnyPWkkdMxOBfiuJDnOlZwzVrFMrrEQKt3/dpUnb3P7yfWQAa
         XwH5rqA/FYjFhJIVNuRX8vNgcIv9XjqcCJopbn6La+M5blUv2oaROTtX5lzHm/CP9/LS
         eD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812452; x=1795417252;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kh6UlnWztI3zIgcftIH9P4UlRyIS0R7gY9R2lXWQmVM=;
        b=cWKIiqWEcLqHw2iiXuiEPn0jQy4FeuuDECcV8a0QnPFPtUqvVFqBPnpsi1Lciohe7J
         r6oga+ciJafFde6Nr/FuiHfy6NrO8bVqf32jqrOo7MinoPahRmDMnuooOIjDk1d3gcUr
         qFXaDkOuPXA7uGQsadskUI6IVEJqShJh7xVsXmQcEFCEolHIadReBwG+HraTk5hcmAST
         CSfH+SpOQiyq4U4jHM/LKx2R39mOCV01rdIGnjtK8Nxkec0f8C5+HeT67CXid0ONrKcC
         pkJcVRlh5UijHseb0hI/wmtdoxvQ6I3VKyJAl0GXp4q1bo5mxKs0vQINa85I8BsKgu+L
         5FrQ==
X-Forwarded-Encrypted: i=1; AL+hErEt1lipTYoXGRcLFSCtCdxYtt5P5DrP5SrBICkgERG/4kxQ1C2vm/nwAlsVsHEfPVgZY0gWae0o+n3+zoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WIbJTwRD5WMhH91Wz8ErQ1oW3xDBK4gTnF5Fq8hYixCySNhLz
	4f9pXqQfiyb10sTeGZOoUlDq4KSM5qj5QmOXkMKayk9iYQlB1v5gRwu71drY+QQRPU7VAMmGOjM
	YYk8sNsUJKA==
X-Received: from dybrt9.prod.google.com ([2002:a05:7301:4709:b0:369:f2bd:5ab6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4293:20b0:187:efba:9ba2
 with SMTP id a92af1059eb24-1b5031562cemr9996482c88.44.1794812452079; Sun, 15
 Nov 2026 23:00:52 -0800 (PST)
Date: Sun, 15 Nov 2026 23:00:27 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116070038.2968725-1-irogers@google.com>
Subject: [PATCH v2 00/10] perf jevents: Block-indexed string compression and
 default JEVENTS_ARCH=all
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Compiled-in PMU event and metric tables (pmu-events-in.o) currently
store ~6.9 MiB of uncompressed string data in .rodata on x86 alone,
causing JEVENTS_ARCH to default to $(SRCARCH) rather than all and
preventing out-of-the-box cross-architecture perf.data event/metric
resolution unless explicitly built with JEVENTS_ARCH=all.

Compressing big_c_string as a single whole-table stream would force perf
to allocate and decompress megabytes of unused CPU models' strings on
startup just to resolve a single event, whereas compressing individual
short strings suffers from poor compression ratios and per-string
framing overhead.

Instead, this series introduces "block-indexed string compression":
sorted, suffix-folded event and metric byte records are packed into
~8 KiB blocks without splitting records across block boundaries, each
block is compressed independently (sharing a single preset or trained
dictionary across blocks so ~8 KiB blocks retain high compression
ratios), and every uint32_t string offset is encoded as
(block_id << 16) | sub_offset. An ~8 KiB target block size sits at the
knee of the compression vs. random-access curve (smaller 1-4 KiB blocks
pay 22-128% more .rodata for per-block entropy headers and index
entries, while larger 16-64 KiB blocks yield <15% extra savings at 2-8x
higher decompression and page-fault cost per binary-search probe). At
runtime, pmu_events__get_string() uses a lock-free atomic block pointer
cache to decompress only the touched ~8 KiB blocks on demand, leaving
untouched CPU models' and non-host architectures' blocks compressed in
.rodata at zero runtime CPU or heap cost.

The series starts with a standalone BigCString raw-byte fix for
describe_metricgroup() binary-search ordering, prepares the string and
PMU table layout, adds the zlib, lzma, and zstd block compression
backends, and switches the default JEVENTS_ARCH to all:

- Bug fix, string layout, and hot-path isolation (Patches 1-4):
  - Patch 1 stores raw NUL-delimited UTF-8 bytes in BigCString instead
    of C-escaped strings, fixing suffix folding and describe_metricgroup()
    binary-search ordering on prefix-overlapping names (such as "Bad" vs
    "BadSpec"; Fixes: 66c6e0c10027) without changing empty-pmu-events.c
    so it can be cherry-picked standalone.
  - Patch 2 partitions non-folded BigCString event strings before metric
    strings and sorts entries lexicographically by their raw UTF-8 byte
    sequence within each partition so identically prefixed event names,
    encodings, descriptions, and metric expressions cluster into
    adjacent ~8 KiB blocks, improving block compression ratios by
    ~20-23%.
  - Patch 3 stores PMU names directly as const char *pmu_name string
    literals in struct pmu_table_entry (only 68 unique PMU names / 536 B
    across ~443 rows across all architectures, already in .data.rel.ro)
    so the compiler/linker merge them in .rodata.str1.1 and hot PMU
    wildcard scans never touch big_c_string or trigger block
    decompression.
  - Patch 4 encapsulates big_c_string offset lookups behind
    pmu_events__get_string(uint32_t offset) across pmu-events.c and
    pmu-events-string.c.
- On-demand block decompression backends (Patches 5-8):
  - Patch 5 packs big_c_string into ~8 KiB record-aligned blocks indexed
    by (block_id << 16) | sub_offset, adds lock-free thread-safe atomic
    per-block decompression on demand, and adds --compress=zlib using
    raw Deflate with a <= 32 KiB preset dictionary.
  - Patch 6 adds --compress=lzma using raw LZMA2 per block with a 64 KiB
    dictionary window.
  - Patch 7 adds --compress=zstd using ZSTD_decompress_usingDDict() per
    block with a once-digested shared 64 KiB ZSTD_DDict (~26% smaller
    .rodata than dictionary-free ~8 KiB zstd blocks).
  - Patch 8 wires JEVENTS_COMPRESS into Makefile.perf and
    pmu-events/Build, preferring zstd, then zlib, then lzma, and falling
    back to none.
- Testing and JEVENTS_ARCH=all default (Patches 9-10):
  - Patch 9 adds prefix-overlapping metricgroups.json test coverage and
    an 8-thread concurrent event/metric/metricgroup stress test in
    perf test pmu-events.
  - Patch 10 switches the default JEVENTS_ARCH to all. Bundling all
    architectures (x86, arm64, powerpc, riscv, s390, nds32) with zstd
    shrinks pmu-events-in.o from 7.16 MiB (x86 + none) to 1.11 MiB
    (all + zstd, -84.5%) and cuts the stripped perf binary from
    13.32 MiB to 7.28 MiB (-45.4%), with ~3 ms median wall-clock
    overhead on 'perf stat true'.

v2:
- Patch 1: Avoid rebinding pmu_name from str to bytes in
  print_pending_events() and print_pending_metrics() (use
  pmu_name_bytes) and annotate _args as Optional[argparse.Namespace] so
  mypy type-checks functions guarding on 'assert _args is not None'
  (Sashiko).
- Patch 10: Remove the unreferenced make_jevents_all definition in
  tools/perf/tests/make (Sashiko).
- Rebase onto latest perf-tools-next.
- v1: https://lore.kernel.org/linux-perf-users/20261113210822.3112700-1-irogers@google.com/

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Antigravity coding assistant and Sashiko automated patch
  review.
- Summary of prompts and assistance: Interactive design and
  implementation of the BigCString raw-byte fix and alphabetical
  sorting, struct pmu_table_entry PMU name string literals, lock-free
  8 KiB block-indexed decompression across zlib, lzma, and zstd,
  Makefile.config/Build integration, multithreaded unit tests,
  size/latency benchmarking, and Sashiko review fixes.
- Testing performed: Built and tested JEVENTS_COMPRESS={none,zlib,lzma,zstd}
  and NO_JEVENTS=1, JEVENTS_ARCH={x86,all}, AddressSanitizer +
  LeakSanitizer, perf test (pmu-events, make, metric parsing), and
  scripts/checkpatch.pl.

Ian Rogers (10):
  perf jevents: Store raw bytes in BigCString instead of C-escaped
    strings
  perf jevents: Sort BigCString entries alphabetically
  perf jevents: Store PMU names as string literals in struct
    pmu_table_entry
  perf jevents: Encapsulate big_c_string lookups behind
    pmu_events__get_string()
  perf jevents: Add block-indexed string packing and --compress=zlib
  perf jevents: Add --compress=lzma block compression backend
  perf jevents: Add --compress=zstd block compression backend
  perf build: Enable jevents string compression when available
  perf tests pmu-events: Test metricgroup descriptions and concurrent
    lookups
  perf build: Default JEVENTS_ARCH to all

 tools/perf/.gitignore                         |    1 +
 tools/perf/Makefile.config                    |    9 +-
 tools/perf/Makefile.perf                      |   13 +-
 tools/perf/pmu-events/Build                   |   49 +-
 .../arch/test/test_soc/cpu/metricgroups.json  |    4 +
 tools/perf/pmu-events/empty-pmu-events.c      | 7804 +++++++++--------
 tools/perf/pmu-events/jevents.py              |  969 +-
 tools/perf/tests/make                         |    6 +-
 tools/perf/tests/pmu-events.c                 |  209 +-
 9 files changed, 5016 insertions(+), 4048 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/test/test_soc/cpu/metricgroups.json


base-commit: b7ff10b9ddec8da75304c40fe4abf1ee4f9f0a43
-- 
2.56.1.703.gf848ed807c-goog

