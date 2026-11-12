Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446134;
	b=xJxynfAby6SKpv2K4bHw5VR5Ujl28QvtVbfGue5qQq2/nn47Aiav2gmZWNIya7ZOnTRn
	 XF3MOSlqcAhIVZfPdikEocZfXzyxU6j4vOHW1sk91osfIjESXAKofx0aPx9suZ8PyfyMM
	 +tGX2+RLe1sMtC1mHFi/x068do4JPH46nwrXE4LDcSmeJSETb7J8ipB8ZYXVjJYXx62Nk
	 vpcIsuiUWF2PJMNlhogOjriLRKpBMU6JwOZJayttEVgZkE8whvlkR5oOMtbl2tXaQCOG9
	 wiMERyvj7TpSfIokPC8ZyUsZ584wcH7iQdQ8290s0W5ZSvsDIhRsU46wvUicQ/l4XjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6gJ0enIvGj2VOxXjOeZMsTugR40jH3+l87nC+iPQ3i8=;
	b=BIvA+V0UQddOM7CCUb0GDxGab+YcVbNqAAxlXS8PdYF+E0Zb7FeIMCh8cpIevUsBAX3/
	 TvH+8Aoe6tJwBMZE7xtSUSM1le9H/fTwkr4nKfuoHQFMyqJ/V+j+mHHQdoviZ+JmXgNzo
	 o2qnEVPImroTk0TH6egDzjZ1KwOKmL1utoF5WMuKx58Zh2AJizOeH14ELaWUj//ZBhfVQ
	 HvpjhZDT54FC22K6HrTB2KO+aE4x7PB2iKit+rG+DQu9GMjUCRhdWpsolUatmyNcL2Me8
	 4ny6yWHdV1kPTcjKrAB8uXyqf+k4pyO/TPO0cUU0E8/uNysX2p+VE4wH1+9Ev1xWpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3UGKCXu;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F3606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593F3606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3UGKCXu
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so4680132c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794446132; x=1795050932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gJ0enIvGj2VOxXjOeZMsTugR40jH3+l87nC+iPQ3i8=;
        b=i3UGKCXuh4jQ5xx/QUi6vtxanKdwH7arYwsDjOiZD8Tc7C3EZ+eVw2Tl1B49aAdZjv
         yS2ApxMs7Eynpl3vtfleCcHJqfK5LARK4DesFc6ueodytiHSDu0nitfpx3TolN9VoaVy
         MmHO0kqowD3W80HGN1bE78Z0iABKR2wnPO3rnmI+McsesyIsVIKo5Qea/yc0WITPWAeY
         V86Jq22OSYB9KYcszAx64Oj+hPrFBDDBeo2C9OfBDEh8DQh1cZVcA7RDL/IXLlpbOFV2
         aHTL0NuQU1FW+I/QY++zSU4xOcKTqT5tpZW5EdKIbGlE/N495ZUiM5VwCLV/Loai4aMe
         rrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446132; x=1795050932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gJ0enIvGj2VOxXjOeZMsTugR40jH3+l87nC+iPQ3i8=;
        b=c+TEbcv6vfCV665fnLtPlmiMeoC8n0OcI75IBYlH4Esmd9Cg3qDuCS79Cqu2O9m218
         cobKCSNdE5q8euCpnR354W03O7SLrLywoFRYRJClZvj+XKFBFqJrjxBXtl1Ze7BdrT75
         fI4DZyXcjgULpoR0K+0NmzqoiHTe3FN0DJy4x1HCLR7LyouOqo/Sz1w+0nSrJi9QpE+v
         PyvaiCQz6PotIsOIIA+LmtQeWmj2IE9YfE59Z35QIUG6NXS86gX4giZc6k+/wlkCUpHG
         DNRRFk/tiBMkxeQ83CugnjhJhKwtB54vP8QNqAfn6rmWdoJ3WPk24Ei/dwhON5eG0/9x
         KPMA==
X-Forwarded-Encrypted: i=1; AL+hErFIMQklPReGGOg207ADW72rOPD8FTWvGzKx/T3352vCVx+3dpxuQM7DfXyUv4n0YM4FAMtscYzL0l3tLtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4v8rRMrLpAqANOT+x2KiGj7VDnarq4IC1D94E5sNC2teRyVVg
	17yEEf+qg4UdCK4HSmjWNFKDFTUHTziVDWy9Ns29J4WIVMS5sJYHUHnB6kH9SfY5XZgCUrURLxz
	55LdO+faXVQ==
X-Received: from dlbov2.prod.google.com ([2002:a05:7022:1182:b0:1b2:41fa:646b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:21c3:b0:187:c940:21b9
 with SMTP id a92af1059eb24-1b3c032e0f4mr3086207c88.30.1794446132039; Wed, 11
 Nov 2026 17:15:32 -0800 (PST)
Date: Wed, 11 Nov 2026 17:15:14 -0800
In-Reply-To: <20261112011514.4032822-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022204627.1813821-1-irogers@google.com> <20261112011514.4032822-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112011514.4032822-6-irogers@google.com>
Subject: [PATCH v4 5/5] perf test make: Add BPF skeleton build tests for clang
 and bpf-gcc
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, cupertino.miranda@oracle.com, 
	eddyz87@gmail.com, james.clark@linaro.org, jolsa@kernel.org, 
	jose.marchesi@oracle.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Add make_bpf_skel_clang (CLANG=$(CLANG) BPF_GCC=) and
make_bpf_skel_bpf_gcc (BPF_GCC=$(BPF_GCC) CLANG=) targets to
tools/perf/tests/make when the corresponding compiler and BPF skeleton
dependencies (libelf, zlib, bpf, and libopenssl via Makefile.feature)
are available on the host.

Verify with 'perf check -q feature bpf_skeletons' that BPF skeleton
support is enabled for both targets and disabled (exit code 1) for
make_no_bpf_skel.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/make | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 805d1074cfa8..f17bba53939d 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -54,6 +54,7 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)/tools/scripts/utilities.mak
 
 # FIXME looks like x86 is the only arch running tests ;-)
 # we need some IS_(32/64) flag to make this generic
@@ -65,6 +66,7 @@ endif
 
 has = $(shell which $1 2>/dev/null)
 python_perf_so := $(shell $(MAKE) python_perf_target|grep "Target is:"|awk '{print $$3}')
+BPF_GCC ?= bpf-gcc
 
 # standard single make variable specified
 make_clean_all      := clean all
@@ -78,6 +80,8 @@ make_extra_tests    := EXTRA_TESTS=1
 make_no_jevents     := NO_JEVENTS=1
 make_jevents_all    := JEVENTS_ARCH=all
 make_no_bpf_skel    := BUILD_BPF_SKEL=0
+make_bpf_skel_clang := CLANG=$(CLANG) BPF_GCC=
+make_bpf_skel_bpf_gcc := BPF_GCC=$(BPF_GCC) CLANG=
 make_gen_vmlinux_h  := GEN_VMLINUX_H=1
 make_no_python_module := NO_PYTHON_MODULE=1
 make_no_scripts     := NO_PYTHON_MODULE=1
@@ -135,7 +139,8 @@ saved_OUTPUT_origin := $(origin OUTPUT)
 saved_OUTPUT := $(OUTPUT)
 override OUTPUT := $(FEATURE_OUTPUT)/
 FEATURE_DISPLAY_DEFERRED := 1
-FEATURE_TESTS :=
+FEATURE_TESTS := libelf zlib bpf libopenssl
+FEATURE_CHECK_CFLAGS-bpf = -I. -I$(srctree)/tools/include -I$(srctree)/tools/arch/$(SRCARCH)/include/uapi -I$(srctree)/tools/include/uapi
 include $(srctree)/tools/build/Makefile.feature
 
 # binutils 2_42 and newer have bfd_thread_init()
@@ -147,6 +152,26 @@ ifneq ($(call has,$(LLVM_CONFIG)),)
   $(call feature_check,llvm-perf)
 endif
 
+ifeq ($(feature-libelf)$(feature-zlib)$(feature-bpf)$(feature-libopenssl),1111)
+  ifneq ($(call get-executable,$(CLANG)),)
+    CLANG_VERSION := $(shell $(CLANG) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
+    ifneq ($(call version-lt3,$(CLANG_VERSION),12.0.1),1)
+      $(call feature_check,clang-bpf-co-re)
+      ifeq ($(feature-clang-bpf-co-re),1)
+        have_clang_bpf := 1
+      endif
+    endif
+  endif
+  ifneq ($(call get-executable,$(BPF_GCC)),)
+    BPF_GCC_VERSION := $(shell $(BPF_GCC) -dumpfullversion 2>/dev/null)
+    ifneq ($(BPF_GCC_VERSION),)
+      ifneq ($(call version-lt3,$(BPF_GCC_VERSION),14.0.0),1)
+        have_bpf_gcc := 1
+      endif
+    endif
+  endif
+endif
+
 $(shell rm -rf -- "$(FEATURE_OUTPUT)")
 ifeq ($(saved_OUTPUT_origin),undefined)
 override undefine OUTPUT
@@ -185,6 +210,12 @@ run += make_extra_tests
 run += make_no_jevents
 run += make_jevents_all
 run += make_no_bpf_skel
+ifeq ($(have_clang_bpf),1)
+run += make_bpf_skel_clang
+endif
+ifeq ($(have_bpf_gcc),1)
+run += make_bpf_skel_bpf_gcc
+endif
 run += make_gen_vmlinux_h
 run += make_no_python_module
 run += make_no_scripts
@@ -325,6 +356,13 @@ test_make_clang_nondistro     := $(test_make_clang)
 test_make_clang_nondistro_O   := $(test_make_clang_O)
 endif
 
+test_make_no_bpf_skel         := test -x $(PERF_O)/perf && ($(PERF_O)/perf check -q feature bpf_skeletons; test $$? -eq 1)
+test_make_no_bpf_skel_O       := test -x $$TMP_O/perf && ($$TMP_O/perf check -q feature bpf_skeletons; test $$? -eq 1)
+test_make_bpf_skel_clang      := test -x $(PERF_O)/perf && $(PERF_O)/perf check -q feature bpf_skeletons
+test_make_bpf_skel_clang_O    := test -x $$TMP_O/perf && $$TMP_O/perf check -q feature bpf_skeletons
+test_make_bpf_skel_bpf_gcc    := test -x $(PERF_O)/perf && $(PERF_O)/perf check -q feature bpf_skeletons
+test_make_bpf_skel_bpf_gcc_O  := test -x $$TMP_O/perf && $$TMP_O/perf check -q feature bpf_skeletons
+
 test_make_python_perf_so_O    := test -f $$TMP_O/python/perf.so
 test_make_perf_o_O            := test -f $$TMP_O/perf.o
 test_make_util_map_o_O        := test -f $$TMP_O/util/map.o
@@ -457,7 +495,7 @@ $(FEATURES_DUMP_FILE_STATIC):
 # The clang tests exist to run feature detection with a compiler other than
 # the default one, so they have to do their own and are left out of both the
 # dependency and the 'FEATURES_DUMP=' append below.
-no_features_dump := make_clang make_clang_nondistro
+no_features_dump := make_clang make_clang_nondistro make_bpf_skel_clang make_bpf_skel_bpf_gcc
 no_features_dump += $(addsuffix _O,$(no_features_dump))
 
 # Add feature dump dependency for run/run_O targets
-- 
2.56.0.567.gdb80ae8cd5-goog

