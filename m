Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8EB3D525B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881784; cv=none; b=WRJNJyRJIpmWW+QVS0kcTqeB6Q1RaF2G3oQnDCCPGTg/z0vNIV2OqSRlSyUQ0G2OT0YRfEJ7VMUGkOalZL6i6roRvE2ohO9M4Z8C0VK+8WDheC0+nM2IKguakSJbuafebFagmr7j+D0LlNW3b7JmucOWDI9uPyxzJNTakbygmKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881784; c=relaxed/simple;
	bh=S6mL8H/b3NpwzuCBgaGKWVjxzCruzeEOAud4VZhZBww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FbdXms6PQx9s5dT9YVTG0E1RdZXDZ0M3pVJyF7PUO4hMTEwBEDBuM/Vm6WdBFORHkohHe3FQVsVN/0phi+0uvu0l0ypAk30rnr6/SgsNp7caUTHCyoobbUxGgI6YiJonpluQlcsHPYiDz8HoNaDRNBKBM2WDL8IBUgwtFuLSBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ChwU/CGm; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ChwU/CGm"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso38490925ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881781; x=1790486581; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuebB8yjUONaP5k4givMWNJoLg+Rg6Sf1ayYARW2BaQ=;
        b=ChwU/CGmYqz5CWgGlIXcKk03Pk5cjC3Ffx59CN+QJRwrp4aNhFcsNtnEaQ9Za00XwO
         Fn6U6YZFQAVT/Zaykuc92oT9ea3WIfn1nTxjDUXXZraTbiifCO3v97GTMbtT1vKgaUqR
         ng4oXpaz0wqBrjNh72LCb7pCO/OIVfH1LVCDJuUW/q2caOfngfNEKITgE7vu+oN6Q+T5
         vMdE6LZRTsj0ZWp3x9tvbvMFaoS47EmuX7byOO43cckUz40pmIOBPrs2Q2yFdVwXJQWs
         QdDD5G14loW9E+nR9nZTBM2Moe3DSYezINWXMqQC50TT38vRTBx9ES2mKXaGgMx8V1LV
         Xz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881781; x=1790486581;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuebB8yjUONaP5k4givMWNJoLg+Rg6Sf1ayYARW2BaQ=;
        b=vsetzGA4GI3gPLQnvMzvaFZkYDQpvVCgk+E1EOlJQyMsqauBgHHPSosRgfFfk2WDhq
         /A3jgA0kb5NTnw4oMs9YX3pKkMB32Umun+33Tr380qtZ5xS1WtLnwlqDDsq0YfIYMkFf
         7Zo87+1754MitdzSRw8mNlbuWFf5/SIbdqaLw15DzdcwhMPPSUbCCh4pHgwv828Z1hD8
         5qoU4MWI7i702rA983BCJbxvGtq8JBzkv+LA2dPg8/RQdjP5a9CSU3mpqMU3eGdzmelU
         s70K6iAFsKLliSfEk7r0MMTyMsuTcD8vqQAwn7rXpR1W5ZqvwrFT6C9u5Yh33sLD/j9G
         U/7g==
X-Forwarded-Encrypted: i=1; AKwUvBz+aspZbiGbPsBCMS/ierMr3CdWDzhoK2GiljV/z94hthG/eI2aWa8mdb5mvXFv9iacE5gcf2RhpUlB0L4=@vger.kernel.org
X-Gm-Message-State: AFuF++n3C/1Yg2fjAxXWXj6BPhLi1u+E41amY3bbazGUoWYfxuAEFXDV
	iDkr1dvisrG21IHsxoSno/wRKJSGY0SAopgpg0qRI51xi7EfJ2VDtqVKGiOzMfg5KKluOg6breL
	1HUfWZFcmfw==
X-Received: from dycac1.prod.google.com ([2002:a05:7301:5501:b0:33c:2c49:add8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:13d0:b0:2dd:c100:a5e2
 with SMTP id d9443c01a7336-2ddc100a6cfmr53588585ad.54.1789881781392; Sat, 19
 Sep 2026 22:23:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:21:05 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <ce0228594dc98299f205bbba86e1cb8220e78a34.1789880842.git.irogers@google.com>
Subject: [PATCH v1 13/49] perf build: Make mypy build test opt-out (NO_MYPY=1)
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Commit 168910d0f937 ("perf build: Add mypy build tests") added mypy as an
opt-in compile-time check (MYPY=1) because of existing mypy errors across
perf Python scripts.

Now that all Python scripts in tools/perf have been cleaned up and pass
mypy without errors, make the mypy build test opt-out (default on when
mypy is installed, disabled with NO_MYPY=1), matching NO_SHELLCHECK=1.
Set MYPYPATH to tools/perf/python so local imports resolve during type
checking, and clean *.mypy_log files in 'make clean'.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Build            |  2 +-
 tools/perf/Makefile.perf    | 20 +++++++++++++++++---
 tools/perf/pmu-events/Build |  2 +-
 tools/perf/tests/Build      |  2 +-
 tools/perf/util/Build       |  2 +-
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index e18c80a5c1bc..37d603faea6d 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -88,7 +88,7 @@ endif
 
 $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,test)mypy "$<" > $@ || (cat $@ && rm $@ && false)
+	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
 perf-y += $(MYPY_TEST_LOGS)
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 2438b40eaaec..f22eda3d2852 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -129,6 +129,8 @@ include ../scripts/utilities.mak
 # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
 #
 # Define NO_SHELLCHECK if you do not want to run shellcheck during build
+#
+# Define NO_MYPY if you do not want to run mypy during build
 
 # As per kernel Makefile, avoid funny character set dependencies
 unexport LC_ALL
@@ -263,8 +265,19 @@ ifneq ($(SHELLCHECK),)
 endif
 
 # Runs mypy on perf python files
-ifeq ($(MYPY),1)
-  MYPY := $(shell which mypy 2> /dev/null)
+MAKEOVERRIDES := $(filter-out MYPY=%,$(MAKEOVERRIDES))
+ifeq ($(NO_MYPY),1)
+  override MYPY :=
+else
+  ifeq ($(MYPY),1)
+    override MYPY := $(shell which mypy 2> /dev/null)
+  else
+    MYPY ?= $(shell which mypy 2> /dev/null)
+  endif
+endif
+
+ifneq ($(MYPY),)
+  override MYPY := MYPYPATH=$(srctree)/tools/perf/python $(MYPY)
 endif
 
 # Runs pylint on perf python files
@@ -948,7 +961,8 @@ clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(
 	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive \
 		$(OUTPUT)perf-iostat $(LANG_BINDINGS)
 	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '*.a' -delete -o \
-		-name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
+		-name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete -o \
+		-name '*.mypy_log' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
 	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 \
 		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 372773b998e4..c3542e5ae46f 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -187,7 +187,7 @@ JEVENTS_DEPS := $(OUT_JSON) $(GEN_JSON) $(JEVENTS_PY) $(METRIC_PY) $(EMPTY_PMU_E
 ifdef MYPY
 define MYPY_RULE
 $(2): $(1)
-	$$(Q)$$(call echo-cmd,test)mypy $(1) > $(2) || (cat $(2) && rm $(2) && false)
+	$$(Q)$$(call echo-cmd,test)$$(MYPY) $(1) > $(2) || (cat $(2) && rm $(2) && false)
 endef
 $(foreach src,$(wildcard pmu-events/*.py), \
     $(eval dest := $(patsubst pmu-events/%,$(OUTPUT)pmu-events/%.mypy_log,$(src))) \
diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 406e48eed1c8..98b05b68fc14 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -104,7 +104,7 @@ endif
 
 $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,test)mypy "$<" > $@ || (cat $@ && rm $@ && false)
+	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
 perf-test-y += $(MYPY_TEST_LOGS)
 
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index d08f2af7d970..71d1f7289d03 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -426,7 +426,7 @@ endif
 
 $(OUTPUT)%.mypy_log: %
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,test)mypy "$<" > $@ || (cat $@ && rm $@ && false)
+	$(Q)$(call echo-cmd,test)$(MYPY) "$<" > $@ || (cat $@ && rm $@ && false)
 
 perf-util-y += $(MYPY_TEST_LOGS)
 
-- 
2.55.0.1082.g2b9226bbc0-goog

