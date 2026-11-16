Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812470;
	b=CrohLf+Zf5pzU92oHHMKdBUN6I6wcDFBRT1oTy93UVu9Pegx9oYkpjkvC9XMth+Gk75r
	 r4IIZ4MJXoUJhmUMAXAxbVx9qIqMXzkIDwcGZHahorDhtWKRWNy8zhKt1EelWeF7dXEsO
	 XigXY6j+pOWMJB8mAf6PUObZoI1qVtoGZVeqCANtntjSOeQYsMg6hcxHd5iX3SEA+IeeD
	 EuoZbLGlwaoSk3sa17bCWNUj+m5/5AgiX9/HFflgucoNbcdt6uSDQz1kV52kNqTOSOA8h
	 OueYteoCPMNb/kFg4/hGSHE2vRED9+rIKLuCiqWyDtP0mA3QJxBaglWDpca6pqzA8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=l87qNe2gCFMnCequO/xk6r+49OIRAbJukp+a4aoGAGg=;
	b=u3TJV1TudUcDjmsPPLYt+OBVkTm1hOtVT2y4RgdtlLMTqCRMECqJt/NAuEc8NLTgGRa+
	 zJQO5g1vWYoS97Rc6b+tGm6npZczJojOSZYfNT9bwUyO7kZRoBAI6vcY+4ZLlkPMrmc2I
	 HiNX8Vb7gOVnjDo1fp+dUwBv6S5P35q7REeyOMjloiBuGOPufTApkEvHBj2aXZ/Y/qpjF
	 sKdWECn63kbvv3y+yzKCfEUv8mzLIHOJeELswuYC2ff9JASzCYHiLXMMftPJvcTY7PDZI
	 aK83SAr8rYr5BZlkizPYGfXNfkfD73krdn/kRjOBlIhUONPHnvYFbd6XW+GCK7JzVgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BZLCgEQ8;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA999606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA999606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BZLCgEQ8
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-378722fd4a3so3656573eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794812469; x=1795417269; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l87qNe2gCFMnCequO/xk6r+49OIRAbJukp+a4aoGAGg=;
        b=BZLCgEQ8tezqDyR1vVE+LO6AjL31cHcMHBLlI6fH5OwgOVLGhYsGHeS+WEjeDTS9b9
         /6VIv9HWSQ8wsdAUoYP/AVo+CCmeqLTyjV1P5f9m8cmCcMKyZW2bv/7U9gzXlprSnE7U
         nf4WYrDHvnUP9u77hvQ8LYupQ09gvUcwf2J7zXwavb0LuIfWRHRa5q/WmIz2HSweDQjh
         IlfWAvt7uMzI/HbO0O/8A/vB6cZUiAkCJuVKy/U3ybUUkZcaaby+3d6hYr0eIo0IRXbw
         hDhmbIwtRD0q9q8G2k2Ll4BGt91S7vyYwZRjXRonWzVUQDV3kf5yIiBKjz8jx7u1R+Ew
         u+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812469; x=1795417269;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l87qNe2gCFMnCequO/xk6r+49OIRAbJukp+a4aoGAGg=;
        b=pRG/bQ41Sf6y2AnVUOTaHh3q3WQr9IQRtJ2znC7T4TwxX+akP1E06o3FqNOMDSIo93
         E44u6HJSe7Zz2LyscqpIpDXIoosD4+lW62KzI9nfR5JIIuGfgjrdwDLX4b0wKvXQkZ19
         FZhysF/gRpdyBnWQ30W4M4ysYt/nnYm8WZkfQG9Q/r79g57nDQNdjkO39Na9tItppYqd
         uUAcLCSj9/8Mx0iF7+wLACpzIVKh8O6JpSNKpyUXc7KaITGcgWbUa3BafXNhDCzi8FTv
         lV+iKNGNK9GcORG4YkHJevuWzx8t4uUi8DXWNjtFz5BAyQIQYddCgTmIwHy/yM2I84FM
         H5ew==
X-Forwarded-Encrypted: i=1; AL+hErE2vk/tiLJdmgEgeblTUhh7B/t5OHRDA+f7dNdLbQXa0Jj5nOfG2anQbbnmZabHu3LRvf22fGWoW927euc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aoLCCGDmpdZtNb+rL1y/BCj3YELmZkdeSP3lWfu1WQPh19DJi
	Yk779qDHAgJNT/4SBIp0g0K4lowvkMXDiUyZwqFyRTrC/IrhmejSYpul0aY2xTlPf46IdxPGZBO
	pFc5c9x37bw==
X-Received: from dybpi7.prod.google.com ([2002:a05:7301:4207:b0:369:f3e9:e087])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db8c:b0:36e:20ee:b297
 with SMTP id 5a478bee46e88-37965ca8716mr8484135eec.6.1794812468691; Sun, 15
 Nov 2026 23:01:08 -0800 (PST)
Date: Sun, 15 Nov 2026 23:00:35 -0800
In-Reply-To: <20261116070038.2968725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116070038.2968725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116070038.2968725-9-irogers@google.com>
Subject: [PATCH v2 08/10] perf build: Enable jevents string compression when available
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Pass --compress=<available> to jevents.py during regular builds to
enable block-indexed string compression (packing generated PMU event and
metric strings into independently compressed ~8 KiB blocks decompressed
on demand by (block_id << 16) | sub_offset), constructing the fallback
list from CONFIG_ZSTD, CONFIG_ZLIB, CONFIG_LZMA, and none so jevents.py
only emits decompression C code for libraries actually linked into perf
(e.g. falling back to zlib when built with NO_LIBZSTD=1, or uncompressed
strings when all three are disabled).

Expose JEVENTS_COMPRESS=<zstd|zlib|lzma|none> (or a comma-separated
preference list) in Makefile.perf to override or disable compression, and
track NO_JEVENTS, JEVENTS_ARCH, JEVENTS_MODEL, and the active compression
selection in $(OUTPUT)pmu-events/jevents-flags so changing build flags
triggers regeneration without rerunning jevents.py on incremental no-op
builds. Also cover JEVENTS_COMPRESS=none in tools/perf/tests/make.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/.gitignore       |  1 +
 tools/perf/Makefile.perf    | 10 +++++++-
 tools/perf/pmu-events/Build | 47 ++++++++++++++++++++++++++++++++-----
 tools/perf/tests/make       |  2 ++
 4 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/tools/perf/.gitignore b/tools/perf/.gitignore
index 3b968c5158b8..faf88857abff 100644
--- a/tools/perf/.gitignore
+++ b/tools/perf/.gitignore
@@ -39,6 +39,7 @@ trace/beauty/generated/
 pmu-events/arch/common/common/legacy-cache.json
 pmu-events/pmu-events.c
 pmu-events/pmu-events-string.c
+pmu-events/jevents-flags
 pmu-events/jevents
 pmu-events/metric_test.log
 pmu-events/empty-pmu-events.log
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b74b534e1153..53ab82681569 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -129,6 +129,12 @@ include ../scripts/utilities.mak
 # Define NO_MYPY if you do not want to run mypy during build
 #
 # Define NO_PYLINT if you do not want to run pylint during build
+#
+# Define JEVENTS_COMPRESS=<zstd|zlib|lzma|none> to select or disable
+# block-indexed compression of generated PMU event and metric strings, where
+# strings are packed into ~8 KiB blocks compressed independently and
+# decompressed on demand by (block_id << 16) | sub_offset (defaults to the best
+# enabled library among zstd, zlib, lzma, or none).
 
 # As per kernel Makefile, avoid funny character set dependencies
 unexport LC_ALL
@@ -593,7 +599,7 @@ strip: $(PROGRAMS) $(OUTPUT)perf
 
 PERF_IN := $(OUTPUT)perf-in.o
 
-export NO_JEVENTS
+export NO_JEVENTS JEVENTS_ARCH JEVENTS_MODEL JEVENTS_COMPRESS
 
 build := -f $(srctree)/tools/build/Makefile.build dir=. obj
 
@@ -1036,6 +1042,7 @@ pmu-events-clean:
 ifeq ($(OUTPUT),)
 	$(call QUIET_CLEAN, pmu-events) $(RM) \
 		pmu-events/pmu-events*.c \
+		pmu-events/jevents-flags \
 		pmu-events/metric_test.log \
 		pmu-events/test-empty-pmu-events.c \
 		pmu-events/empty-pmu-events.log
@@ -1044,6 +1051,7 @@ ifeq ($(OUTPUT),)
 else # When an OUTPUT directory is present, clean up the copied pmu-events/arch directory.
 	$(call QUIET_CLEAN, pmu-events) $(RM) -r $(OUTPUT)pmu-events/arch \
 		$(OUTPUT)pmu-events/pmu-events*.c \
+		$(OUTPUT)pmu-events/jevents-flags \
 		$(OUTPUT)pmu-events/metric_test.log \
 		$(OUTPUT)pmu-events/test-empty-pmu-events.c \
 		$(OUTPUT)pmu-events/empty-pmu-events.log
diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 5147139bbb6f..88b6b47951e0 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -22,19 +22,48 @@ $(OUTPUT)pmu-events/pmu-events-string.o: $(PMU_EVENTS_STRING_C)
 # the destination to save space in the build log.
 quiet_cmd_cp   = COPY    $(patsubst %$<,%,$@) <- $<
 
+JEVENTS_FLAGS_FILE := $(OUTPUT)pmu-events/jevents-flags
+
 # --- NO_JEVENTS=1 build ---
 ifeq ($(NO_JEVENTS),1)
-$(PMU_EVENTS_C): $(EMPTY_PMU_EVENTS_C)
+JEVENTS_FLAGS_STR := $(NO_JEVENTS)
+
+$(PMU_EVENTS_C): $(EMPTY_PMU_EVENTS_C) $(JEVENTS_FLAGS_FILE)
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,cp)cp $< $@
 else
 # --- Regular build ---
 
-# Setup the JEVENTS_ARCH and JEVENTS_MODEL
+# Setup the JEVENTS_ARCH, JEVENTS_MODEL and JEVENTS_COMPRESS
 ifeq ($(JEVENTS_ARCH),)
 JEVENTS_ARCH=$(SRCARCH)
 endif
-JEVENTS_MODEL ?= all
+ifeq ($(JEVENTS_MODEL),)
+JEVENTS_MODEL=all
+endif
+
+JEVENTS_COMPRESS_AVAIL :=
+ifeq ($(CONFIG_ZSTD),y)
+JEVENTS_COMPRESS_AVAIL += zstd
+endif
+ifeq ($(CONFIG_ZLIB),y)
+JEVENTS_COMPRESS_AVAIL += zlib
+endif
+ifeq ($(CONFIG_LZMA),y)
+JEVENTS_COMPRESS_AVAIL += lzma
+endif
+JEVENTS_COMPRESS_AVAIL += none
+
+ifeq ($(JEVENTS_COMPRESS),)
+JEVENTS_COMPRESS := $(subst $(space),$(comma),$(strip $(JEVENTS_COMPRESS_AVAIL)))
+endif
+
+JEVENTS_COMPRESS_ACTIVE := $(filter $(JEVENTS_COMPRESS_AVAIL),$(subst $(comma),$(space),$(JEVENTS_COMPRESS)))
+ifeq ($(JEVENTS_COMPRESS_ACTIVE),)
+$(error JEVENTS_COMPRESS='$(JEVENTS_COMPRESS)' requires libraries not enabled in this build (available: $(strip $(JEVENTS_COMPRESS_AVAIL))))
+endif
+JEVENTS_COMPRESS_ARG := $(subst $(space),$(comma),$(strip $(JEVENTS_COMPRESS_ACTIVE)))
+JEVENTS_FLAGS_STR := $(NO_JEVENTS):$(JEVENTS_ARCH):$(JEVENTS_MODEL):$(JEVENTS_COMPRESS_ARG)
 
 # The input json/csv files
 SRC_DIR		:= pmu-events/arch
@@ -181,7 +210,7 @@ $(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_EVENTS_C)
 
 
 # Dependencies for jevents.py
-JEVENTS_DEPS := $(OUT_JSON) $(GEN_JSON) $(JEVENTS_PY) $(METRIC_PY) $(EMPTY_PMU_EVENTS_TEST_LOG) $(METRIC_TEST_LOG)
+JEVENTS_DEPS := $(OUT_JSON) $(GEN_JSON) $(JEVENTS_PY) $(METRIC_PY) $(EMPTY_PMU_EVENTS_TEST_LOG) $(METRIC_TEST_LOG) $(JEVENTS_FLAGS_FILE)
 
 # If there are orphaned files remove them.
 ifneq ($(strip $(ORPHAN_FILES)),)
@@ -204,14 +233,20 @@ endif
 # and inputs are dependencies.
 $(PMU_EVENTS_C): $(JEVENTS_DEPS)
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $(JEVENTS_MODEL) \
-            $(OUT_DIR) $(PMU_EVENTS_C) $(PMU_EVENTS_STRING_C)
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) --compress=$(JEVENTS_COMPRESS_ARG) \
+            $(JEVENTS_ARCH) $(JEVENTS_MODEL) $(OUT_DIR) $(PMU_EVENTS_C) $(PMU_EVENTS_STRING_C)
 
 $(PMU_EVENTS_STRING_C): $(PMU_EVENTS_C)
 	@:
 
 endif # ifeq ($(NO_JEVENTS),1)
 
+$(JEVENTS_FLAGS_FILE): FORCE
+	$(call rule_mkdir)
+	@if [ "$$(cat $@ 2>/dev/null)" != "$(JEVENTS_FLAGS_STR)" ]; then \
+		printf '%s' "$(JEVENTS_FLAGS_STR)" > $@; \
+	fi
+
 ifneq ($(NO_JEVENTS),1)
   PY_TESTS := $(wildcard pmu-events/*.py)
 else
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 7524de522802..5a04f67257ac 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -77,6 +77,7 @@ make_clang_nondistro := CC=clang BUILD_NONDISTRO=1
 make_extra_tests    := EXTRA_TESTS=1
 make_no_jevents     := NO_JEVENTS=1
 make_jevents_all    := JEVENTS_ARCH=all
+make_jevents_compress_none := JEVENTS_COMPRESS=none
 make_no_bpf_skel    := BUILD_BPF_SKEL=0
 make_gen_vmlinux_h  := GEN_VMLINUX_H=1
 make_no_python_module := NO_PYTHON_MODULE=1
@@ -172,6 +173,7 @@ endif
 run += make_extra_tests
 run += make_no_jevents
 run += make_jevents_all
+run += make_jevents_compress_none
 run += make_no_bpf_skel
 run += make_gen_vmlinux_h
 run += make_no_python_module
-- 
2.56.1.703.gf848ed807c-goog

