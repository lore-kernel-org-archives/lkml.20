Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A135E1CE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977442; cv=none; b=p0Mb+jZrvtXnsGD3Fy1HcTlLik5uQTgsJo7Cjhz8vcrfuf/qobIgfLPEvHT6kXxvqROuzsRbf0YW2pF4W/JeYuKt6egOs6GofHNcYk3VzF3/n2m3vJGstvpb0FyJuWp8WP2Zy7+q53vVtWC62il9QmnKUVruTo8mfHHrPIzz0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977442; c=relaxed/simple;
	bh=TRy9Gliv/FzTpN1SrKHqnFfZhY0XCIQdEdLMOrMQR1g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GTS2QZNuKUyubaBgzK7Me1xylQUmz2xyq9K5YC4T2ZwRl3/Yx+/id9gywclq1kfMg9d9gy+yRIW87rwBho8SfkuqmFlpBmB68NxS/z7niEjHQieyfth5804TaPScGNzRINDfDmouNW+C1yp5qACinnFYbihW+cvPxYICIVkW8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPvQ3rgH; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPvQ3rgH"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so88666925ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788977440; x=1789582240; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjnxEfr3Uzi7pXtCU8OB5Dtvf84yJ4YLU6mP71jvHvQ=;
        b=DPvQ3rgHEitp4diGzRBZwQCYemUQsc4DZ/b3ZsSZxM5bXJUmTDbASs5UZOzeSGHj+b
         SJmZA6rXjNH9WhG04AhW64C5KgSYjEXlFQ0aN5v4A3AUfqDK1Mlx8M5ZkipFQrW74q74
         tbEr5aeLbEIKWL5YWtENPBFoYbmJENAH+pJK1RpodYPQlS/0GSJLloQrg54E1YqOixW8
         kYbwl7pB6yPjpA1iR79rQMLhQNUXniF8WfCPAClnsrtCudDPq44sP7nmUf/u3w5+xopr
         2a9oChPV4kKRli1BMcY9CWdCjwLW01Fkkgm0m8jzLVfbPkU0iCS4oPR/qmyjRhpkM5T8
         Nm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977440; x=1789582240;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjnxEfr3Uzi7pXtCU8OB5Dtvf84yJ4YLU6mP71jvHvQ=;
        b=MotpmaOs2WcP7V9a/ft6eLgLqMRrTc1mt/GoAjm1+W3nvb10lwfg4/BL+kUl9BNCwi
         CsO3cXPUn+XRPjFE+lbGnOo3ft35o7kmjMYo1+hZHBG3KNLfgLzMi3RuXX0d6OlIVfWt
         zsGDa7fxwyBSC5zrPMLp8qXv/bzJQmQ7mbaNAZ9AGCOISQVli+kD90tKkAaOpaV37Djs
         tSnarX3Y2jeEQZwBozbhEfYw7+uouMCKIFp4lX9ktZwRYeK0smi8186AiGsecXPvyg5E
         1wuowgAYRC6V1DdUQA/Q+UizjZzGYg2usLnq9TvltItGZ3ZyqTnlECC+3d3izZW+IC+O
         7ilA==
X-Forwarded-Encrypted: i=1; AKwUvBwCMhUD4DZ8FH4/VjUgw1JsKW9C+6lfusbb6Tu1h2vJkn96/F02qmvOfsiS+BqHwGrXD8FUbCEMCYlT6U4=@vger.kernel.org
X-Gm-Message-State: AFuF++nhz2x/lTc5qDU+hXwRfDk1gR67kqChbddOpiKOVJuFpAANv/oh
	LxvUfsQhe6/CKCgu5oQzuUtt/JhlMei0iq2UK2S9LjfcrQjSTLy4QU0NjaMmCkD/wSWp6AruS4r
	9JMXJOtbV/g==
X-Received: from dlbrj9.prod.google.com ([2002:a05:7022:f409:b0:140:f3bd:b2fa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f87:b0:38e:250b:122f
 with SMTP id 98e67ed59e1d1-39b261e75femr54573828a91.16.1788977439844; Wed, 09
 Sep 2026 11:10:39 -0700 (PDT)
Date: Wed,  9 Sep 2026 11:10:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909181030.1870496-1-irogers@google.com>
Subject: [PATCH v1] tools build: Add explicitly sequenced -lzstd to libbfd
 feature fallback
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, Tomas Glozar <tglozar@redhat.com>, 
	Michael Jeanson <mjeanson@efficios.com>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Costa Shulyupin <costa.shul@redhat.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, 
	Leo Yan <leo.yan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Distributions like Fedora currently ship a statically compiled binutils
libbfd that natively depends on zstd to decompress sections (e.g.
undefined reference to 'ZSTD_decompress').

Since libbfd generally does not reliably distribute a .pc file for
pkg-config (e.g. 'binutils-dev' evaluates missing on standard PKG_CONFIG_PATH
checks), perf historically supplements manual linker flags in fallback
chains (-lbfd -ldl -liberty -lz).

Extend the testing cascade in tools/build/feature/Makefile and
tools/perf/Makefile.config to probe for '-lz -lzstd' when the basic
fallback variants fail, natively supporting statically compiled binutils on
recent distributions.

Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/build/Makefile.feature |  3 ++-
 tools/build/feature/Makefile | 12 +++++++++---
 tools/perf/Makefile.config   |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 99eb0ea09537..1268ac6f130e 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -121,6 +121,7 @@ FEATURE_TESTS_EXTRA :=                  \
          libcheck                       \
          libbfd-liberty                 \
          libbfd-liberty-z               \
+         libbfd-liberty-z-zstd          \
          libopencsd                     \
          libperl                        \
          llvm                           \
@@ -161,7 +162,7 @@ FEATURE_DISPLAY ?=              \
 # Declare group members of a feature to display the logical OR of the detection
 # result instead of each member result.
 #
-FEATURE_GROUP_MEMBERS-libbfd = libbfd-liberty libbfd-liberty-z
+FEATURE_GROUP_MEMBERS-libbfd = libbfd-liberty libbfd-liberty-z libbfd-liberty-z-zstd
 
 #
 # Declare list of feature dependency packages that provide pkg-config files.
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 7d165018116a..410987df3a48 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -21,6 +21,7 @@ FILES=                                          \
          test-reallocarray.bin			\
          test-libbfd-liberty.bin                \
          test-libbfd-liberty-z.bin              \
+         test-libbfd-liberty-z-zstd.bin         \
          test-cplus-demangle.bin                \
          test-cxa-demangle.bin                  \
          test-libcap.bin			\
@@ -272,15 +273,17 @@ $(OUTPUT)test-libbfd.bin:
 	$(BUILD_BFD)
 
 $(OUTPUT)test-libbfd-threadsafe.bin:
-	$(BUILD_BFD) || $(BUILD_BFD) -liberty || $(BUILD_BFD) -liberty -lz
+	$(BUILD_BFD) || $(BUILD_BFD) -liberty || $(BUILD_BFD) -liberty -lz || $(BUILD_BFD) -liberty -lz -lzstd
 
 $(OUTPUT)test-disassembler-four-args.bin:
 	$(BUILD_BFD) -lopcodes || $(BUILD_BFD) -lopcodes -liberty || \
-	$(BUILD_BFD) -lopcodes -liberty -lz
+	$(BUILD_BFD) -lopcodes -liberty -lz || \
+	$(BUILD_BFD) -lopcodes -liberty -lz -lzstd
 
 $(OUTPUT)test-disassembler-init-styled.bin:
 	$(BUILD_BFD) -lopcodes || $(BUILD_BFD) -lopcodes -liberty || \
-	$(BUILD_BFD) -lopcodes -liberty -lz
+	$(BUILD_BFD) -lopcodes -liberty -lz || \
+	$(BUILD_BFD) -lopcodes -liberty -lz -lzstd
 
 $(OUTPUT)test-reallocarray.bin:
 	$(BUILD)
@@ -291,6 +294,9 @@ $(OUTPUT)test-libbfd-liberty.bin:
 $(OUTPUT)test-libbfd-liberty-z.bin:
 	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz
 
+$(OUTPUT)test-libbfd-liberty-z-zstd.bin:
+	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz -lzstd
+
 $(OUTPUT)test-cplus-demangle.bin:
 	$(BUILD) -liberty
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4d5993da9f94..24a99545c9bc 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -906,6 +906,8 @@ ifdef BUILD_NONDISTRO
     EXTLIBS += -lbfd -lopcodes -liberty
   else ifeq ($(feature-libbfd-liberty-z), 1)
     EXTLIBS += -lbfd -lopcodes -liberty -lz
+  else ifeq ($(feature-libbfd-liberty-z-zstd), 1)
+    EXTLIBS += -lbfd -lopcodes -liberty -lz -lzstd
   endif
 
   CFLAGS += -DHAVE_LIBBFD_SUPPORT
-- 
2.55.0.1003.g10538fe699-goog

