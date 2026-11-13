Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604141;
	b=zCEyp8WcJ5gMuopx90ts3Ojia/ZBZBhpLO3Psr13Svavl1wkD9Xch9rUtDjWitVDOuyc
	 5chYuUmfgXFC/RrwyW6AfnxK4CflEFZqT55/3/r62XYCoqvL/xzL1ntLDfgofWSAnWGqq
	 UdlFPN/UnbQk+apImaQr5qKdRYCxLxmtVSROkl5vmzpNfEMQTN0QtrEkvpCpxqDYXFZUN
	 MPuolRil3DvYGToxUp6TWGJR1qzonuJWSe4OD8ToCRNZnn/IdzK9hDG5jCW7WYaFbxiRt
	 a5n+5/4wGzWVrXcEHP4/DQ0n1l7pqHy3uiYWozuQwvHquytbGKhILqw4A1Ln4fsJOmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bii9amTscW3OiRnhlO30jawc6UkXtGMoD9aSHOraYfA=;
	b=yt34UEGz7P0OYFaZbfJlwBV7L6AWG4cwOwg9ds604b10wmQYuge5QXwq4rUGIPuQ4sjf
	 TC6l7MLIpyJgiHkdOpomqf0mcgyYAWLK7M88S8XvAa993PpUcbebFzZJeLnbmcGHHLVJs
	 Voo6xo19VTcGt1QDFav45p3slwsEv/1vxx8s2piP97Hc9Gms+xkX10ZAmsuJvYX8OTzCe
	 gX0Ydfpk2Yr3mVL7fW+C6uwL0flJCTUv+n6irQ4wkso0YjmekhCnlec58Odane0eDXGZz
	 esAQnGI5S0hGydPJIaPlR9tDtwgBnyL6NHnhDm9EBhr3uLFFqhqkBzKsFAt95Moh9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mLSV5C1P;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2D60A5BFD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C2D60A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mLSV5C1P
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2125895eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794604140; x=1795208940; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bii9amTscW3OiRnhlO30jawc6UkXtGMoD9aSHOraYfA=;
        b=mLSV5C1PUglmLVqgAzko8QNE4DG2RAkCb+9hOZzPOgJoHzLO74GherwjKKPoJ+3wyr
         80DhPgoIXoBS+TItQk6UZFC/wH2natAHCMccK5GcF2KkTYP8ICnlk9FiTrtj326uOV4B
         3LlFkd1LFVBEhfuy7fPAdffJOucWxzBUGVWjtiA/32mxkmqDwzYsLVYaE1I4CEE21WbF
         QlAfXDoCxy4E8iGMrIDvX2Mqg0jemjitVPJumwS3AdV6Lxy7KrTMnw+5lihawpRYCVMd
         yp4S83rOb1oiEMgMYOhhBZQhSZcLxyl6PJSD17uh9QRZFGkvZuI/1jUE2RkTHYqA//DP
         liZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604140; x=1795208940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bii9amTscW3OiRnhlO30jawc6UkXtGMoD9aSHOraYfA=;
        b=VI08fsh+2Zwqs0p294by/ksVW7w18Msg26AhvG2XaHOJPlAgK+MdE5C7dh2MKhb6Y5
         Yu65WMgMShhC0Wd4fHuM9j0Sd30IPbk/O60qA0nJQEfgJEzK7WZozw3Qzxq1GjWPb86Y
         QuKpMvZDtlOerwQoirnMvuwrQma9nQFHdcu7OLoZwtGLQaOUCK0ehr5nKcd6GTfQIaeE
         zOH1JploreIzX892eYaJdkNZVlEdwI+Y8jbYJ5bvuTL0kbeLbZprnRkc0qIuHw7At1mc
         zz12abo1YqJyNHxlT+O68mkemXRP1Jg6kTEsRbHZl+9d9936ezRT0MDG1XkJJtaAYF9B
         +8rA==
X-Forwarded-Encrypted: i=1; AL+hErE4B0DtYKK3wni5KU93tmZZJm2AkVr8S+/0ph181p9PsRDGFzBkKPYz7W40akZXm7Kl8mpLclZl39X1XI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D6etSgh2/CDhMdoutlkf57yXZwqbWz2thzp8QNhkG/+KGlZ6e
	pj7vx4WUYkzpGobV/bD7scykU9fNiKD2TFPWhVkM2pz0qFRhy8wbO/QtHUvvxTXCgONbfO6LJfQ
	I3L3uXEigbQ==
X-Received: from dycnm5.prod.google.com ([2002:a05:7300:d185:b0:35a:c4b6:314b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c01a:20b0:36d:4135:cd7
 with SMTP id 5a478bee46e88-37966292657mr3506079eec.18.1794604139933; Fri, 13
 Nov 2026 13:08:59 -0800 (PST)
Date: Fri, 13 Nov 2026 13:08:22 -0800
In-Reply-To: <20261113210822.3112700-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113210822.3112700-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113210822.3112700-11-irogers@google.com>
Subject: [PATCH 10/10] perf build: Default JEVENTS_ARCH to all
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Because block-indexed string compression packs PMU event and metric
strings into independently compressed ~8 KiB blocks decompressed on
demand via (block_id << 16) | sub_offset, bundling non-host
architectures' compressed blocks in .rodata incurs zero runtime
decompression CPU or heap memory unless those architectures are queried.
With zstd enabled, bundling PMU event and metric tables for all
architectures (JEVENTS_ARCH=all) is 5.77 MiB smaller overall than an
uncompressed x86-only build (JEVENTS_ARCH=x86 JEVENTS_COMPRESS=none),
cutting the stripped perf binary nearly in half (-45.4%) while enabling
cross-architecture perf.data analysis out of the box:

  Component                   x86 + none      all + zstd      Delta
  -----------------------------------------------------------------
  pmu-events-string.o (dec)   6,901,987 B      794,032 B    -88.5%
  pmu-events.o (dec)            257,987 B      314,940 B    +22.1%
  pmu-events-in.o (dec)       7,160,005 B    1,109,002 B    -84.5%
  perf stripped (file size)  13,321,832 B    7,276,200 B    -45.4%
  perf unstripped (file)     24,526,816 B   18,494,088 B    -24.6%

Adding every non-x86 architecture (arm64, powerpc, riscv, s390, nds32)
only adds +55.6 KiB of compact tables in pmu-events.o and +194.6 KiB of
compressed string blocks in pmu-events-string.o (785,912 B .text for all
vs 586,654 B for x86).

Runtime decompression overhead is minimal. Measured on a hybrid Intel
Core i7-14700 (cpu_core + cpu_atom) across 100 interleaved rounds of
'perf stat true' (which parses default events and Default/TopdownL1
metrics across both core PMUs plus common):

  Build mode    Wall med   Delta wall   User med   Sys med   MinFlt
  -----------------------------------------------------------------
  none (x86)    27.10 ms           --   12.01 ms  16.52 ms    4,036
  zstd (x86)    29.93 ms     +2.83 ms   12.65 ms  17.92 ms    4,583
  zlib (x86)    31.13 ms     +4.03 ms   13.96 ms  17.65 ms    4,548
  lzma (x86)    35.05 ms     +7.95 ms   19.25 ms  17.87 ms    4,555
  all + zstd    30.25 ms     +3.15 ms   14.05 ms  18.04 ms    4,652

Where the ~2.8-3.1 ms in 'perf stat true' (zstd) goes:
1. Pure decompression CPU (+0.64 ms user time on x86, +2.04 ms on all):
   Digesting the 64 KiB ZSTD_DDict once and decompressing the touched
   8 KiB blocks takes ~640 us in user space on x86 (compared to +1.95 ms
   with zlib and +7.24 ms with lzma).
2. Anonymous heap page faults (~1.4 ms sys time, +547 to +616 minor
   faults): In a warm-cache benchmark, uncompressed mode faults
   pre-populated page-cache pages from .rodata, whereas compressed mode
   allocates malloc() buffers (~2.1 MiB across ~265 decompressed 8 KiB
   blocks), incurring kernel zero-page minor faults. On a cold-disk
   invocation, reading ~6 MB less .rodata from disk offsets this.
3. Why ~265 blocks are touched on 'perf stat true': Resolving Default
   metricgroups (TopdownL1, Default2, Default3, Default4) calls
   pmu_metrics_table__for_each_metric() across both cpu_core and
   cpu_atom (alderlake) plus common, linearly scanning every metric in
   those tables (~190 metric blocks) before binary-searching the ~30
   referenced events (~75 event blocks).

On 'perf list' (100 interleaved rounds), user CPU time only increases
from 32.10 ms (none) to 34.09 ms (zstd, +2.00 ms) and is unchanged at
32.08 ms for all+zstd, negligible next to the ~850 ms spent scanning
sysfs PMUs and tracepoints.

Default JEVENTS_ARCH to all in Makefile.config and pmu-events/Build,
allow single-architecture builds via JEVENTS_ARCH=<arch> (falling back
to NO_JEVENTS=1 if that architecture lacks mapfile.csv), and update
tools/perf/tests/make to exercise JEVENTS_ARCH=$(SRCARCH) alongside the
new default.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config  | 9 +++++++--
 tools/perf/Makefile.perf    | 3 +++
 tools/perf/pmu-events/Build | 2 +-
 tools/perf/tests/make       | 3 ++-
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index b4764f69f47f..6051d7c7dee8 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -872,9 +872,14 @@ else
   endif
 endif
 
+ifeq ($(JEVENTS_ARCH),)
+  JEVENTS_ARCH := all
+endif
 ifneq ($(NO_JEVENTS),1)
-  ifeq ($(wildcard pmu-events/arch/$(SRCARCH)/mapfile.csv),)
-    NO_JEVENTS := 1
+  ifneq ($(JEVENTS_ARCH),all)
+    ifeq ($(wildcard pmu-events/arch/$(JEVENTS_ARCH)/mapfile.csv),)
+      NO_JEVENTS := 1
+    endif
   endif
 endif
 ifneq ($(NO_JEVENTS),1)
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 53ab82681569..e9b8945b5622 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -130,6 +130,9 @@ include ../scripts/utilities.mak
 #
 # Define NO_PYLINT if you do not want to run pylint during build
 #
+# Define JEVENTS_ARCH=<arch|all> to select which architecture(s) PMU event and
+# metric tables are generated for (defaults to all).
+#
 # Define JEVENTS_COMPRESS=<zstd|zlib|lzma|none> to select or disable
 # block-indexed compression of generated PMU event and metric strings, where
 # strings are packed into ~8 KiB blocks compressed independently and
diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 88b6b47951e0..32fc1378ef3a 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -36,7 +36,7 @@ else
 
 # Setup the JEVENTS_ARCH, JEVENTS_MODEL and JEVENTS_COMPRESS
 ifeq ($(JEVENTS_ARCH),)
-JEVENTS_ARCH=$(SRCARCH)
+JEVENTS_ARCH=all
 endif
 ifeq ($(JEVENTS_MODEL),)
 JEVENTS_MODEL=all
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 5a04f67257ac..b69ddc9e1489 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -77,6 +77,7 @@ make_clang_nondistro := CC=clang BUILD_NONDISTRO=1
 make_extra_tests    := EXTRA_TESTS=1
 make_no_jevents     := NO_JEVENTS=1
 make_jevents_all    := JEVENTS_ARCH=all
+make_jevents_arch   := JEVENTS_ARCH=$(SRCARCH)
 make_jevents_compress_none := JEVENTS_COMPRESS=none
 make_no_bpf_skel    := BUILD_BPF_SKEL=0
 make_gen_vmlinux_h  := GEN_VMLINUX_H=1
@@ -172,7 +173,7 @@ endif
 endif
 run += make_extra_tests
 run += make_no_jevents
-run += make_jevents_all
+run += make_jevents_arch
 run += make_jevents_compress_none
 run += make_no_bpf_skel
 run += make_gen_vmlinux_h
-- 
2.56.1.703.gf848ed807c-goog

