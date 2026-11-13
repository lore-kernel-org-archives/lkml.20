Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597185;
	b=c04YmsYc1PE0vKivraSAlRpVegGGvmV8fA00ZPqa3JR3ipwOJ5vne7IuTroXrg14kiyy
	 dqP0vMcJTmmnnlfdCtTIVb8vk1tcCVKKQY9Q2KI+tUJH5sfzt93rcJO22GC7gPXLBrbTy
	 WCp5q6RT1KZeiOibjuYJdkp7jU9vjZnS1dkwWWhSzDki/8ELsafFuLwGBE3XV3dHvZdwq
	 NK5OPTcKllbnJIQLWPa6H4O8h6836s+PfXiN9tgua5rUc4fJ3YejtbSlKHQs9ewWV0dvY
	 P9Y7mRXKInD4NyhBioA5cK7eBZUWMYXgdkBnzR/eBQ8hebYRMoCl46QLb3m3YMSr9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EpSUjkvVyuVjTU8V73krPKRXpvbCCfxf8Z/PrENmWGc=;
	b=mZstn2ha5u5Y08liLB3E3NIiUGzv2m3Qrjy2ham72Rwv15xCH72H1xh8FalIXjzwvVg+
	 q6lUvU43aWSWbkHCIu3WzTllBcT3NW2nVWaDmn2s2+FVb9QdYUbNCcEoAQyft9pIwtRJx
	 T3Adsf0y+LPETjaI4e+qX4TGWUqKh1AJ6WwdEpzBj5hk8LzOrnKuywi0Aeco9vy6JaHvt
	 Ki+bv4MnrvfnSQcpTz+uhyIReN3ZQjH4Nbcf2vW9oJPDEi6QK+BibXh6L4iuWihcwZssg
	 WqZrbfw+YcGu8R7fsC7EhoRcOtAKaWWN+EUmVUyj2rPAmOb8Yc+5AgnNLzq1ZrujIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZEPnpthF;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9C606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C9C606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZEPnpthF
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so785495eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794597184; x=1795201984; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpSUjkvVyuVjTU8V73krPKRXpvbCCfxf8Z/PrENmWGc=;
        b=ZEPnpthFu/RN0A5d0q9akS6WlJLNBN8iJel4HGST0UwMRuTNcKQpvt2WMN+bj3KjIw
         jkKIAhbRFBgOC6KKZFxvGU0bfLs43dX2sg7ikTdizhf1aPxGSHNmuXgYRs9b6sjreSEG
         5OFe0wZJ8YTLqxmCiScs1L/3RYeve4v0nJAdXRVRL1C8VNDXc3TGYmB3cIL2PRqac1uP
         vrJuk600qjguKkiBdOMgpJeBIei80J4EPOOqjrsUt/kXjfd8klgf26UbmE2pS6mBIozT
         h4HoUeCDF3QPm4nvBdTFCt4ZqIzh/8fTbXrK4ouNeWwWh1rr9YXRXTvb+D2v0wdTGO1q
         e6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597184; x=1795201984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpSUjkvVyuVjTU8V73krPKRXpvbCCfxf8Z/PrENmWGc=;
        b=pOEUXd1ZNXNhqx/n9Kow+pXEpwsWO6PmBAapecd5zy7PBCn2CrUFJSwGbSfOEXUdXC
         sCELUWa0eqtqH6eFu2pzH2zyr5WgOct0k7q8vmixYTxS9UdplHLsX2a4xUFtUnNxU2+X
         vb9mJaBq+nkdShZnPeVYx2kcNXTseVxFq6CxxxQH+B/E9Jo5PF+mgtE0FNxbrWeSHs6N
         dVw3doUeWl1026wsFlDz5+m98gJ2SRCkW2EuRFfebIdC2hYExZ4Vco3jN/BUd1nabiO4
         2roROxM49BN31IzUmbroU3VBr8wTpsaS8Aa0wvm04NH8zI0ojEVF1keEEvyarcmTuB3N
         wueQ==
X-Forwarded-Encrypted: i=1; AL+hErG1IQUy6+B/AxwA4HJG+KK02ECu3L5JSbvijtAhsZM3etBsJ41FZ5/xm8oE3lQZRx+54y322rvw6rQDms0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1T7V1CD4l6PUozAUnu6F+r2faf+nJjxSx2nF0DBQp2Xl2JtY8
	d3Zq3lwYvwCFopplU5CfYTCadqS9RnBJh/C9pBBi1Jm7j2rir1Dm99JGblzsM2OVYR2bS1fK6uP
	0mjx5Ku3N2A==
X-Received: from dyax25-n1.prod.google.com ([2002:a05:693c:4199:10b0:36a:16ac:9308])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4544:b0:364:377c:cabe
 with SMTP id 5a478bee46e88-377e1af656dmr5493378eec.24.1794597183856; Fri, 13
 Nov 2026 11:13:03 -0800 (PST)
Date: Fri, 13 Nov 2026 11:12:32 -0800
In-Reply-To: <20261113191234.2509964-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113191234.2509964-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113191234.2509964-2-irogers@google.com>
Subject: [PATCH v3 1/3] perf build: Add libnvme feature detection
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, Daniel Wagner <dwagner@suse.de>, Yuzhuo Jing <yuzhuo@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Tomas Glozar <tglozar@redhat.com>, Michael Jeanson <mjeanson@efficios.com>, 
	Dmitrii Dolgov <9erthalion6@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, 
	Leo Yan <leo.yan@arm.com>, German Gomez <german.gomez@arm.com>, 
	Anubhav Shelat <ashelat@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce a feature check for libnvme using pkg-config so that the
tool-provided NVMe PMU can be conditionally compiled when libnvme is
available.

Add libnvme to FEATURE_TESTS_BASIC, FEATURE_DISPLAY, FEATURE_PKG_CONFIG,
and test-all.c so fast-path discovery and individual feature checks stay
consistent with the pkg-config flags used during linking.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature       |  5 ++++-
 tools/build/feature/Makefile       |  4 ++++
 tools/build/feature/test-all.c     |  5 +++++
 tools/build/feature/test-libnvme.c | 11 +++++++++++
 tools/perf/Makefile.config         | 12 ++++++++++++
 5 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 tools/build/feature/test-libnvme.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 4d37d11f674c..54b51251c4c3 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -73,6 +73,7 @@ FEATURE_TESTS_BASIC :=                  \
         libbfd                          \
 	libbfd-threadsafe		\
         libelf                          \
+        libnvme                         \
         libelf-getphdrnum               \
         libelf-gelf_getnote             \
         libelf-getshdrstrndx            \
@@ -143,6 +144,7 @@ FEATURE_DISPLAY ?=              \
          libdw                  \
          glibc                  \
          libelf                 \
+         libnvme                \
          libnuma                \
          numa_num_possible_cpus \
          python-module          \
@@ -168,7 +170,8 @@ FEATURE_GROUP_MEMBERS-libbfd = libbfd-liberty libbfd-liberty-z
 FEATURE_PKG_CONFIG ?=           \
 	 babeltrace2-ctf-writer \
          libtraceevent          \
-         libtracefs
+         libtracefs             \
+         libnvme
 
 feature_pkg_config = $(eval $(feature_pkg_config_code))
 define feature_pkg_config_code
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 10340a537224..851f458163f6 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -24,6 +24,7 @@ FILES=                                          \
          test-cxa-demangle.bin                  \
          test-libcap.bin			\
          test-libelf.bin                        \
+         test-libnvme.bin                       \
          test-libelf-getphdrnum.bin             \
          test-libelf-gelf_getnote.bin           \
          test-libelf-getshdrstrndx.bin          \
@@ -147,6 +148,9 @@ $(OUTPUT)test-libcap.bin:
 $(OUTPUT)test-libelf.bin:
 	$(BUILD) -lelf
 
+$(OUTPUT)test-libnvme.bin:
+	$(BUILD) # -lnvme provided by $(FEATURE_CHECK_LDFLAGS-libnvme)
+
 $(OUTPUT)test-eventfd.bin:
 	$(BUILD)
 
diff --git a/tools/build/feature/test-all.c b/tools/build/feature/test-all.c
index 4a6890290f74..155f92efc2c8 100644
--- a/tools/build/feature/test-all.c
+++ b/tools/build/feature/test-all.c
@@ -150,6 +150,10 @@
 # include "test-libopenssl.c"
 #undef main
 
+#define main main_test_libnvme
+# include "test-libnvme.c"
+#undef main
+
 int main(int argc, char *argv[])
 {
 	main_test_python_module();
@@ -183,6 +187,7 @@ int main(int argc, char *argv[])
 	main_test_libzstd();
 	main_test_libtraceevent();
 	main_test_libopenssl();
+	main_test_libnvme();
 
 	return 0;
 }
diff --git a/tools/build/feature/test-libnvme.c b/tools/build/feature/test-libnvme.c
new file mode 100644
index 000000000000..3fefad70a680
--- /dev/null
+++ b/tools/build/feature/test-libnvme.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
+#include <libnvme.h>
+
+int main(void)
+{
+	nvme_root_t r = nvme_scan(NULL);
+
+	if (r)
+		nvme_free_tree(r);
+	return 0;
+}
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index b4764f69f47f..d82273dadf39 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1065,6 +1065,18 @@ ifndef NO_CAPSTONE
   endif
 endif
 
+ifndef NO_LIBNVME
+  ifeq ($(feature-libnvme), 1)
+    CFLAGS += -DHAVE_LIBNVME_SUPPORT $(shell $(PKG_CONFIG) --cflags libnvme)
+    LDFLAGS += $(shell $(PKG_CONFIG) --libs-only-L libnvme)
+    EXTLIBS += $(shell $(PKG_CONFIG) --libs-only-l libnvme)
+    $(call detected,CONFIG_LIBNVME)
+  else
+    $(warning No libnvme found, disables NVMe PMU support, please install libnvme-dev/libnvme-devel)
+    NO_LIBNVME := 1
+  endif
+endif
+
 ifdef EXTRA_TESTS
     $(call detected,CONFIG_EXTRA_TESTS)
     CFLAGS += -DHAVE_EXTRA_TESTS
-- 
2.56.1.703.gf848ed807c-goog

