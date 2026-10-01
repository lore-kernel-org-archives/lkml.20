Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0143F0B2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833297; cv=none; b=U/+oN30CpFP0acHTR9B5xDAxoHEHWqA8vMcVBKZWOeqPg4/JDXoQDk6oyORsgymAXhgBh23iuls1rgVnuXpj9vj4bcaK7LVbDQnwLQJcJllfRPu1hr0FKvVbUb880l9VeIg5KH99gl/5HeVfU6MTyweGBfC6+0SVGvGbbKcJ3Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833297; c=relaxed/simple;
	bh=WJck80GJbWlZ6IK+PHNcyI79odQvn6d3F8tCS7ruQmc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d2j5MrKjStoERCk1uDIecUuexRv74gWLFk9NxdGjAHDT8kBHNNNMrvwje7/xqTxxIMEuqKhJuD+dNSv0uHu2PI67T0FaUx08IFw2HM925yTb54lHZCdjDUq+STaihIK7XQSrxQS88DSTDz8vwhaWnWcf/jHC0KVXfseCP0CVTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWzZh6jY; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWzZh6jY"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so6661353eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790833294; x=1791438094; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkPMC7WWjzYDHx6JCTWMQn/89Bm4VcQ5VbZnxeDmdV8=;
        b=JWzZh6jYErw+CgmIzxSf1Zd9lQzafkfWGPo7bdRAjYc/F0KoQxms6tHPHBipY8nWpD
         OydF4fjWUgyaXinnQ9qrYKmMF10QXWLl5uBdkcHoHbLplJa6U0cyGn1hERFX3FiCDWYi
         KI28oSbVNdBZk8OIEzjYQL3QrffE/mKCx7SvcrEV9S2Hx2+Pjne/63JotbfnqS3H4K+1
         TjfVH8yX1ZnnwC19v0/sQaX08Su7fCaxN9dEXPfqHQ2x+k5OPjGlAlGu2IuDXhqaJSVL
         lEkL/sXIozA4/ur6W0c6tLz/4NOlrfGDfXppHo+05YTR/uSmzKuGXNik+14nhBUUdDMX
         qEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833294; x=1791438094;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkPMC7WWjzYDHx6JCTWMQn/89Bm4VcQ5VbZnxeDmdV8=;
        b=PaUh+SZQ8mzKaqBsygtJU84fZb/Rv5tQzjSPRcGhgPLGk+Fqpx0DWZOqXH6acK99kE
         pCJXJgtrgCr8RMs1taNwMyDmyxV9raOZlmqQd28noMitULRHXsu5dKZ013/47KmiYtzD
         sfLSe+HTC1A+vB5xdXvnUnOmgUu6gcSJqxlQ3tUy/2KxkDEa5FidBF/90dxEVXaRT3RU
         z81pF0iNQTDt1avLjboD7FkAqRCHZxKK/6d1fD5cbNGUj+83NscAaLiWM7GJShJNL7ft
         OJKLcJdEMNkCtZBOn+6S87E0rgQLX4C6xhtUTwmEJaQNtKBZvzNj/FnCAWC1Tqq+AwBn
         h4EQ==
X-Forwarded-Encrypted: i=1; AKwUvByqdQXSKIbXVeXeZh0tQKDDxddAF2TeBOmpRQUay33UORMpzayvnezWHya8CS2nbgIiIoNebDO3nGT2PLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU3cmF5PmSugmy1MO+fXLV9v0b6oefsL46s7utNhTEw5EiP4K5
	/OGk8iO4xU/6xQMKaKQ+JfhZ44u3hbjqM6eaZ/Vndrlq93A8q+9wO+h4Xxn1E1MQ0+LcCh6Huoe
	njMN/54ucDA==
X-Received: from dycpv1.prod.google.com ([2002:a05:7300:de01:b0:34c:8931:6a4a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8296:b0:34b:101f:cdb5
 with SMTP id 5a478bee46e88-34cdbfd8bc2mr3968546eec.19.1790833293911; Wed, 30
 Sep 2026 22:41:33 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:41:20 -0700
In-Reply-To: <20261001054120.1570943-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com> <20261001054120.1570943-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001054120.1570943-5-irogers@google.com>
Subject: [PATCH v2 4/4] perf build: Fix clean and install target dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, leo.yan@arm.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Fix several missing dependencies and ordering issues for clean and
install targets:

1. In tools/perf/Makefile, order 'install*' goals (excluding
   'install-build-deps', which is ordered before build/install goals)
   after 'all' when both are passed on the command line (e.g.
   'make -j clean all install') so two concurrent Makefile.perf
   sub-makes do not race in the same build directory, and mark 'all' and
   'clean' as .PHONY.

2. In tools/perf/Makefile.perf, when 'clean' is passed alongside build
   or install goals (e.g. 'make -f Makefile.perf clean install'), run
   'clean' sequentially before 'fixdep' and 'sub-make' rather than
   running 'clean' in parallel with the build inside 'sub-make'.

3. Ensure '$(OUTPUT)python' is created inside the recipe for
   '$(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX)' rather than only at
   Makefile parse time, in case 'clean' removed the directory.

4. Add '$(LANG_BINDINGS)' as a prerequisite of 'install-python_ext' so
   the Python C extension is built with the proper compiler/linker flags
   and perf libraries before 'setup.py install' runs.

5. Add 'install-bin', 'install-tools', 'install-tests',
   'install-python_ext', '$(DOC_TARGETS)', and '$(INSTALL_DOC_TARGETS)'
   to .PHONY in Makefile.perf.

6. Prefix targets emitted by Documentation/build-docdep.perl with
   '$(OUTPUT)' so '$(OUTPUT)doc.dep' matches out-of-tree documentation
   targets when 'O=' is specified.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/build-docdep.perl |  2 +-
 tools/perf/Makefile                        | 16 +++++++++++++++-
 tools/perf/Makefile.perf                   | 19 +++++++++++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/perf/Documentation/build-docdep.perl b/tools/perf/Documentation/build-docdep.perl
index ba4205e0302a..f19f5107fe0f 100755
--- a/tools/perf/Documentation/build-docdep.perl
+++ b/tools/perf/Documentation/build-docdep.perl
@@ -41,6 +41,6 @@ while ($changed) {
 while (my ($text, $included) = each %include) {
     if (! exists $included{$text} &&
 	(my $base = $text) =~ s/\.txt$//) {
-	print "$base.html $base.xml : ", join(" ", keys %$included), "\n";
+	print "\$(OUTPUT)$base.html \$(OUTPUT)$base.xml : ", join(" ", keys %$included), "\n";
     }
 }
diff --git a/tools/perf/Makefile b/tools/perf/Makefile
index b8d38728306a..c1818bd5f287 100644
--- a/tools/perf/Makefile
+++ b/tools/perf/Makefile
@@ -93,6 +93,20 @@ ifeq ($(has_clean),1)
 $(rest): clean
   endif # rest
 endif # has_clean
+
+ifneq ($(filter install-build-deps,$(MAKECMDGOALS)),)
+  after_deps := $(filter-out clean install-build-deps,$(MAKECMDGOALS))
+  ifneq ($(after_deps),)
+$(after_deps): install-build-deps
+  endif
+endif
+
+ifneq ($(filter all,$(MAKECMDGOALS)),)
+  install_goals := $(filter-out install-build-deps,$(filter install%,$(MAKECMDGOALS)))
+  ifneq ($(install_goals),)
+$(install_goals): all
+  endif
+endif
 endif # MAKECMDGOALS
 
 #
@@ -130,4 +144,4 @@ check-headers:
 	$(print_msg)
 	$(make)
 
-.PHONY: tags TAGS FORCE Makefile build-test build-test-tarball check-headers
+.PHONY: all clean tags TAGS FORCE Makefile build-test build-test-tarball check-headers
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 836225b08649..d90bdd319c72 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -327,9 +327,17 @@ export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT CONFIG_PERF_BPF_SK
 include $(srctree)/tools/build/Makefile.include
 
 ifeq ($(force_fixdep),1)
-goals := $(filter-out all sub-make, $(MAKECMDGOALS))
+goals := $(filter-out all sub-make clean, $(MAKECMDGOALS))
 
-$(goals) all: sub-make
+ifneq ($(filter clean,$(MAKECMDGOALS)),)
+clean-make:
+	$(Q)$(MAKE) -f Makefile.perf -j1 clean
+
+fixdep: clean-make
+.PHONY: clean-make
+endif
+
+$(goals) all clean: sub-make
 
 sub-make: fixdep
 	$(Q)$(MAKE) FIXDEP_BUILT=1 -f Makefile.perf $(goals)
@@ -565,6 +573,7 @@ $(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): util/python.c util/setup.py pyth
         CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS) $(LIBS_PY)' \
 	  $(PYTHON_WORD) util/setup.py \
 	  $(python_setup_quiet) build_ext; \
+	$(MKDIR) -p $(OUTPUT)python; \
 	cp $(PYTHON_EXTBUILD_LIB)perf*.so $(OUTPUT)python/; \
 	if [ "$(abspath python/perf.pyi)" != "$(abspath $(OUTPUT)python/perf.pyi)" ]; then \
 		cp python/perf.pyi $(OUTPUT)python/; \
@@ -994,7 +1003,7 @@ install: install-bin try-install-man
 install-build-deps:
 	$(Q)$(SHELL) $(srctree)/tools/perf/scripts/install-build-deps.sh $(INSTALL_BUILD_DEPS_ARGS)
 
-install-python_ext:
+install-python_ext: $(LANG_BINDINGS)
 	$(PYTHON_WORD) util/setup.py $(python_setup_quiet) \
 		$(if $(OUTPUT),egg_info --egg-base $(OUTPUT)) \
 		install --root='/$(DESTDIR_SQ)'
@@ -1070,7 +1079,9 @@ endif
 
 FORCE:
 
-.PHONY: all install install-build-deps clean config-clean strip install-gtk
+.PHONY: all install install-bin install-tools install-tests install-build-deps
+.PHONY: install-gtk install-python_ext $(DOC_TARGETS) $(INSTALL_DOC_TARGETS)
+.PHONY: clean config-clean strip
 .PHONY: shell_compatibility_test please_set_SHELL_PATH_to_a_more_modern_shell
 .PHONY: .FORCE-PERF-VERSION-FILE TAGS tags cscope FORCE prepare bpf-skel-prepare
 .PHONY: python_perf_target
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

