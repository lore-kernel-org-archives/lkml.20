Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F84F3B71DB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822076; cv=none; b=AEHlL/t2+YasQtT8RS46bS4/pKXeOR9jVcDCV9swR2XuvhEzRW1l62cOADIQ+FIE7rq5nIKXWQYtpQJp95akOCYjibD3yh/VCOLKReACS730Br+o/dSUPYohg23t5wTNnbRtbG56gP8hM0l0Av1u6runB/GKkPpNqB4qXc2Mpcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822076; c=relaxed/simple;
	bh=+tEZE5h2fHaQzDQGRdzRZc/MD8Sy2ypzqamusSQdf1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=bK76kYJ0nGl8To3FOdx/VcSDRWhbGSMZAPgT/y4DfcYLH7GGv9MYtoy6TMBfhYRSru3rziZclg6xhkWMWfyOGSCik3BEcW/MijE0ogbfy91qBqnoJiIZzZOOJtIEztXZeOv/n39vobHmP8D17CnI2XPtUhNesMTRLYZR9yMyEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LlTkeHc3; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LlTkeHc3"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-146e698b8adso238067c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790822073; x=1791426873; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhs3xsPTL5XVCDWLzT5Op8joIxVA5j1ckW7/R2Q8qoY=;
        b=LlTkeHc3XorAkbqqQ6lkn34xqwR+oeOUNJIIdyB70laoBlnBBrv3FoJFyy/8bBe53B
         uzVA1995Fn3Z0LYMszGahAiIX5NhPK0JcL4bi2hQBBYBOtHjdG7CSKW421ndxw84WhRk
         /FvisOyrfI2zga/wpTzE67JU1cCF6gqOxXHFKeaT9mXGhVLfHisk+FOLmzPlV5TffzSV
         6t+PEjkb3imk0F0Uq7a64/Z79iZdYJin93u5Ax+tJJ8Kp8YheIBN7khWFkcRK7So2Hny
         uebEMqlNgq42l6lY6uYqipNpQbEhmlNqrN9s3autXDVXhyMol+LX7fX6hXFOaJVcqNG4
         Z+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822073; x=1791426873;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhs3xsPTL5XVCDWLzT5Op8joIxVA5j1ckW7/R2Q8qoY=;
        b=ppD9SkaDHYU8X/c4EC4GPgtAfFIKOiF03WG4Rp89keK7pauSTHF0L5iDUajg+xRr7m
         yC5yxIc5s+cNO94zGyeRj+6RlFpnY5yB4/w4WTCn3lo2heFN9NX7pUxDI1mq4jK1VtS2
         ubaoDbzdCsf2w8mYK8SblrM3CIWUjH7Zk1FBoY5fSRqd7SHgfJuF+Ig41JrWUQtv3hDk
         h11zWGAIIfByfDbHMNUGV9hKsIeeLUQoBbRBuAiMMlJ2AhTHCepWEksRBMZJ4aFkYv8f
         dqHI8NjhgbsMWGTv1Htm1BfL5gxqfX/vVCXZrKvXjzb5yLrvQwfWUJ0gQIWFCxiN5wDo
         1e+g==
X-Forwarded-Encrypted: i=1; AKwUvBxwQUZcODA52udUax2pz/3qcjjSNaBntb3VNSHnwIc1/pQqwAT7I8wNMTlcw4XahXp5MsVN1InvjkGn7gw=@vger.kernel.org
X-Gm-Message-State: AFuF++nEBXJcYQPuV0e2OPZpL3e1F83NKxmr6xR9YAOwW2EbnGWXMmKr
	p08/8LBRPxiusjKVX6frniuRq/Hm5Bw0dI+p+qrlC3rMCQ4zFlXr4PpJOBCEoXcnrZgnbslcAIC
	LALDoVZUI/g==
X-Received: from dlbur14.prod.google.com ([2002:a05:7022:ea4e:b0:13f:c1b7:470])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:240b:b0:149:7f69:a3c5
 with SMTP id a92af1059eb24-14dcdd512e7mr1310125c88.5.1790822072609; Wed, 30
 Sep 2026 19:34:32 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:34:21 -0700
In-Reply-To: <20261001023423.1225713-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001023423.1225713-3-irogers@google.com>
Subject: [PATCH 2/4] perf build: Run shellcheck, mypy, and remaining pylint
 checks in parallel
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Following the approach used for pylint on standalone scripts and tests,
move the shellcheck and mypy checks in tools/perf/Build and
tools/perf/tests/Build, as well as the mypy and pylint checks in
tools/perf/util/Build and tools/perf/pmu-events/Build, into dedicated
phony targets invoked as top-level sub-makes from Makefile.perf.

Also add 'perf' to pylint's --ignored-modules (leaving perf module
type-checking to mypy via perf.pyi), since astroid's ImportlibFinder
only resolves .pyi stubs for package directories (__init__.pyi) rather
than single-file stubs like perf.pyi and does not introspect C
extensions by default. This removes the need for pylint to wait on
building $(LANG_BINDINGS).

This avoids blocking jevents code generation, archive creation
(libperf-util.a, libperf-test.a, libpmu-events.a), and final linking of
the perf binary and Python extension on linter execution.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Build            |  8 +++--
 tools/perf/Makefile.perf    | 56 ++++++++++++++++++++++++++-----
 tools/perf/pmu-events/Build | 66 +++++++++++++++++++------------------
 tools/perf/tests/Build      |  8 +++--
 tools/perf/util/Build       |  8 +++--
 5 files changed, 99 insertions(+), 47 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index 09fd88f5aca5..dcba5ba55206 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -76,7 +76,9 @@ $(OUTPUT)%.shellcheck_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(SHELLCHECK) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-y += $(SHELL_TEST_LOGS)
+.PHONY: shellcheck
+shellcheck: $(addprefix $(OUTPUT),$(SHELL_TEST_LOGS))
+	@:
 
 ifdef MYPY
   PY_TESTS := $(shell find python -type f -name '*.py')
@@ -89,7 +91,9 @@ $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-y += $(MYPY_TEST_LOGS)
+.PHONY: mypy
+mypy: $(addprefix $(OUTPUT),$(MYPY_TEST_LOGS))
+	@:
 
 ifdef PYLINT
   PY_TESTS := $(shell find python -type f -name '*.py')
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 7ceefc1da774..836225b08649 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -283,8 +283,12 @@ ifneq ($(force_fixdep),1)
 endif
 
 # Runs pylint on perf python files.
-# Require pylint >= 2.16.0 (which introduced W0718 broad-exception-caught and
-# astroid .pyi stub support for perf.pyi).
+# Require pylint >= 2.16.0 (which introduced W0718 broad-exception-caught).
+# Note: astroid's ImportlibFinder only resolves .pyi stubs for package
+# directories (__init__.pyi), not single-file stubs like perf.pyi, and does not
+# introspect C extensions by default. Pass 'perf' in --ignored-modules (leaving
+# perf module type-checking to mypy via perf.pyi) so pylint does not depend on
+# building the perf Python C extension first.
 # Disabled warnings:
 #   W0123 (eval-used): Use of eval()
 #   W0311 (bad-indentation): Non-4-space indentation
@@ -310,9 +314,9 @@ ifneq ($(force_fixdep),1)
       $(warning Warning: pylint version is older than 2.16.0, skipping pylint checks.)
       override PYLINT :=
     else
-      override PYLINT := PYTHONPATH=$(abspath $(OUTPUT)python):$(srctree)/tools/perf/python:$(srctree)/tools/perf/pmu-events \
+      override PYLINT := PYTHONPATH=$(srctree)/tools/perf/python:$(srctree)/tools/perf/pmu-events \
         $(PYLINT) --disable=all --enable=E,W --disable=W0123,W0311,W0511,W0603,W0622,W0718 \
-        --ignored-modules=textual,setproctitle
+        --ignored-modules=perf,textual,setproctitle
     endif
   endif
 endif
@@ -634,18 +638,52 @@ $(SCRIPTS) : $(OUTPUT)% : %.sh
 $(OUTPUT)PERF-VERSION-FILE: .FORCE-PERF-VERSION-FILE
 	$(Q)$(SHELL_PATH) util/PERF-VERSION-GEN $(OUTPUT)
 
-ifdef PYLINT
-# Run Python checks after the extension is ready, independently of C builds.
-all: pylint-perf pylint-tests
-.PHONY: pylint-perf pylint-tests
+ifdef SHELLCHECK
+# Run shellcheck independently of C builds.
+all: shellcheck-perf shellcheck-tests
+.PHONY: shellcheck-perf shellcheck-tests
+
+shellcheck-perf:
+	$(Q)$(MAKE) $(build)=perf shellcheck
+
+shellcheck-tests:
+	$(Q)$(MAKE) $(build)=perf-test dir=tests shellcheck
+endif
+
+ifdef MYPY
+# Run mypy independently of C builds.
+all: mypy-perf mypy-tests mypy-util mypy-pmu-events
+.PHONY: mypy-perf mypy-tests mypy-util mypy-pmu-events
+
+mypy-perf:
+	$(Q)$(MAKE) $(build)=perf mypy
+
+mypy-tests:
+	$(Q)$(MAKE) $(build)=perf-test dir=tests mypy
 
-pylint-perf pylint-tests: | $(LANG_BINDINGS)
+mypy-util:
+	$(Q)$(MAKE) $(build)=perf-util dir=util mypy
+
+mypy-pmu-events:
+	$(Q)$(MAKE) $(build)=pmu-events dir=pmu-events mypy
+endif
+
+ifdef PYLINT
+# Run pylint independently of C builds.
+all: pylint-perf pylint-tests pylint-util pylint-pmu-events
+.PHONY: pylint-perf pylint-tests pylint-util pylint-pmu-events
 
 pylint-perf:
 	$(Q)$(MAKE) $(build)=perf pylint
 
 pylint-tests:
 	$(Q)$(MAKE) $(build)=perf-test dir=tests pylint
+
+pylint-util:
+	$(Q)$(MAKE) $(build)=perf-util dir=util pylint
+
+pylint-pmu-events:
+	$(Q)$(MAKE) $(build)=pmu-events dir=pmu-events pylint
 endif
 
 # These can record PERF_VERSION
diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 01f5a00f2125..5147139bbb6f 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -183,38 +183,6 @@ $(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_EVENTS_C)
 # Dependencies for jevents.py
 JEVENTS_DEPS := $(OUT_JSON) $(GEN_JSON) $(JEVENTS_PY) $(METRIC_PY) $(EMPTY_PMU_EVENTS_TEST_LOG) $(METRIC_TEST_LOG)
 
-# Rules to run mypy if enabled.
-ifdef MYPY
-define MYPY_RULE
-$(2): $(1)
-	$$(Q)$$(call echo-cmd,test)$$(MYPY) $(1) > $(2) || (cat $(2) && rm $(2) && false)
-endef
-$(foreach src,$(wildcard pmu-events/*.py), \
-    $(eval dest := $(patsubst pmu-events/%,$(OUTPUT)pmu-events/%.mypy_log,$(src))) \
-    $(eval $(call MYPY_RULE,$(src),$(dest))) \
-)
-
-MYPY_INPUTS := $(wildcard pmu-events/*.py)
-MYPY_OUTPUTS := $(patsubst pmu-events/%,$(OUTPUT)pmu-events/%.mypy_log,$(MYPY_INPUTS))
-JEVENTS_DEPS += $(MYPY_OUTPUTS)
-endif
-
-# Rules to run pylint if enabled.
-ifdef PYLINT
-define PYLINT_RULE
-$(2): $(1)
-	$$(Q)$$(call echo-cmd,test)$$(PYLINT) $(1) > $(2) || (cat $(2) && rm $(2) && false)
-endef
-$(foreach src,$(wildcard pmu-events/*.py), \
-    $(eval dest := $(patsubst pmu-events/%,$(OUTPUT)pmu-events/%.pylint_log,$(src))) \
-    $(eval $(call PYLINT_RULE,$(src),$(dest))) \
-)
-
-PYLINT_INPUTS := $(wildcard pmu-events/*.py)
-PYLINT_OUTPUTS := $(patsubst pmu-events/%,$(OUTPUT)pmu-events/%.pylint_log,$(PYLINT_INPUTS))
-JEVENTS_DEPS += $(PYLINT_OUTPUTS)
-endif
-
 # If there are orphaned files remove them.
 ifneq ($(strip $(ORPHAN_FILES)),)
 .PHONY: prune_orphans
@@ -243,3 +211,37 @@ $(PMU_EVENTS_STRING_C): $(PMU_EVENTS_C)
 	@:
 
 endif # ifeq ($(NO_JEVENTS),1)
+
+ifneq ($(NO_JEVENTS),1)
+  PY_TESTS := $(wildcard pmu-events/*.py)
+else
+  PY_TESTS :=
+endif
+
+ifdef MYPY
+  MYPY_TEST_LOGS := $(PY_TESTS:%=%.mypy_log)
+else
+  MYPY_TEST_LOGS :=
+endif
+
+$(OUTPUT)%.mypy_log: %
+	$(call rule_mkdir)
+	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
+
+.PHONY: mypy
+mypy: $(addprefix $(OUTPUT),$(MYPY_TEST_LOGS))
+	@:
+
+ifdef PYLINT
+  PYLINT_TEST_LOGS := $(PY_TESTS:%=%.pylint_log)
+else
+  PYLINT_TEST_LOGS :=
+endif
+
+$(OUTPUT)%.pylint_log: %
+	$(call rule_mkdir)
+	$(Q)$(call echo-cmd,test)$(PYLINT) "$<" > $@ || (cat $@ && rm $@ && false)
+
+.PHONY: pylint
+pylint: $(addprefix $(OUTPUT),$(PYLINT_TEST_LOGS))
+	@:
diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 05c545aac732..395f2866094a 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -93,7 +93,9 @@ $(OUTPUT)%.shellcheck_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(SHELLCHECK) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-test-y += $(SHELL_TEST_LOGS)
+.PHONY: shellcheck
+shellcheck: $(addprefix $(OUTPUT)tests/,$(SHELL_TEST_LOGS))
+	@:
 
 ifdef MYPY
   PY_TESTS := $(shell find tests/shell -type f -name '*.py')
@@ -106,7 +108,9 @@ $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-test-y += $(MYPY_TEST_LOGS)
+.PHONY: mypy
+mypy: $(addprefix $(OUTPUT)tests/,$(MYPY_TEST_LOGS))
+	@:
 
 ifdef PYLINT
   PY_TESTS := $(shell find tests/shell -type f -name '*.py')
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 512f2ca0cd1a..2c1f880c4c47 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -425,7 +425,9 @@ $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-util-y += $(MYPY_TEST_LOGS)
+.PHONY: mypy
+mypy: $(addprefix $(OUTPUT)util/,$(MYPY_TEST_LOGS))
+	@:
 
 ifdef PYLINT
   PYLINT_TEST_LOGS := $(PY_TESTS:%=%.pylint_log)
@@ -437,7 +439,9 @@ $(OUTPUT)%.pylint_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)$(PYLINT) "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-util-y += $(PYLINT_TEST_LOGS)
+.PHONY: pylint
+pylint: $(addprefix $(OUTPUT)util/,$(PYLINT_TEST_LOGS))
+	@:
 
 ifeq ($(CONFIG_PERF_BPF_SKEL),y)
 include $(srctree)/tools/perf/bpf_skel.mak
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

