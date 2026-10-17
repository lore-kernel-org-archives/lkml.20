Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C924BBEE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195331; cv=none; b=JAeMUmg+AdCr+1MH7zGN6tb4YD5TPl/3ogjC4RkgRWy89cjBpv8egGGMIHS/q7Avo0StWw0QLfcYMvceIH5AIekYQqzhHFWBRCLpvhaKjJD2Ay1H9QTzcseq8B6zhGQcYpPoHNw31FonbU2VqQ88G7SVl9R4+KSI6yewUScueaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195331; c=relaxed/simple;
	bh=k6r0AJR89YjyP0fjCZ1YgqwPxcvCPNj4qjuByXkwZIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3d0jTBdJnTJW98/J08XVcx5shrkiwfgnM0ASo+lsFjQAmEDsp2xGMu/KeqUmISu/tvTgyGxYCuHsS90Ao1ufbc+Bdr+YfTLfKu95dCdihqtc0N9UfFfrd+9rGgi4RZ2RHYquaOdpGQeF+xvk88xUiWZsADcmRBBl2Wz+c6kDM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8zL8UHg; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8zL8UHg"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67992884b02so305418d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195329; x=1792800129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDzSuLlOZfzZXkkbQiHl90718fhT7blKGstRf1pHXhM=;
        b=D8zL8UHgxOKhgM3EE/QiOjXs6vVCxYmk4U0nxIEfZMoSaqiuPcwEitkQT0YUr292Bf
         tU3wrSmaVxBMpm02X7terfhfjcnwTG1RLnUJSDn2UDO/w/NKS4ihNbZ25hZQtSH8Mb3t
         i6u2PTH30h0iUc8o/MDNwR9DrkYOq8yOIZHp2fScIy4oaAz0nFzkEVqszUaPvcAzooTX
         mxzyZrc68BEcbyfVE5wici6qb9A0OPWn/v7TmuOKVwA3US2sCLedBpin14vQbtCgDjXs
         wzr76L+0XzFGKuE5qPdS4Invm+6LvDg1516ts7FQ+JuunosrfEju2ORQ4aM3y6K54GYm
         kkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195329; x=1792800129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDzSuLlOZfzZXkkbQiHl90718fhT7blKGstRf1pHXhM=;
        b=weWKDQhw3Jp9KCBLZPbVCuKhI9IZ92vAB3nFIQXkDfcgRWeoxFYUqGMUbPosMWNYgj
         psgvW7DJvZvYRN8GefVypEN36Xo11h1NXhin5Y1VxgK/1CKSUwTVtU5VAT/Egnmhr44N
         I3rKb1sUEMAu68N9elEp93AXCkxgKG9SPUKcf7LuB7TGIGT1/QE06Es3/55mYCSw44l2
         /+RcwIuwBXMlJo2LDqKGc6upu5+gh+vPkUPXEuXOsTE9DS+5SZkKDpS0mteXq9mGRDiF
         HUAzyQGdsYRCUVJWxHBiu2irB1NHlYKEI6V7inQzEmhViUvS4++hR230zXWAxvfalVUP
         fldA==
X-Forwarded-Encrypted: i=1; AKwUvBx4TBRsgWXqCLMOsYbM/+Qdqkr7MPHwH2cpXv6IVJoJsokfb+lt8YnoS8m68YpAnkyq5TrvaAT6sz+Px3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGBsUaG/YXxoecAkfmYtB3HnxZOWFnsJVLL4ROCLmZVJzgl+pr
	+SX22tXRhNNWI11WUwS1L1PukpoUZvWRlVH6FZE/lHQq8BQFK0h1gnCG
X-Gm-Gg: AYBFou0PFWYQZB1pm0qgJucQbS0rVBBT3KDwkH2/61fVp1yW/HLh/DYDeTU2v+U2OMX
	OBPM8etw4fPP5qKvptfseCn0lG23+WZ4pqxa9ipKDQDg9zo/WXaXggN1IvgK4QKDjffpu3Ak9wp
	SfPJIM67Qto27dejJVLx4ULErDy5q7TaEs4h8ZlDOiC4Fi8x9a0agQc1T0UKT5q9Rx3hyxDdLo1
	o8CIc7LbY5wLEXTxoSWcjKThAB+oNRk557j/V6tJ5/ry4FXimhedMKrhtohIsBHM8xli7Ad5G2/
	1cbDd5iOHGaRSlVAQ7vIQYI87D8oNSVuIJNUY4fUIZRl4yOd66tr0BJ0lyV/8QSnKeFiH3YTb92
	znEh+VuOfRoSZNr65C46W5sn68sV0sLBrYoE8yV4xTaGhjjguUXc172TGejDAjWh0lvlu0CFbk/
	eil2HOBEo8I4QN3XwsMfxG/XCDrD1o7EYDo24V73x2diaJgK/hkSWEzmhI2N83Ou8+HzPPUV8ft
	QIQN44Gjr6ay4U0eJFeDl6UW40vh/Rz7OiQyWSLYkQ5UWrT6AndwbAJPSxwvu3u8fYMmFJ5bbdp
	Nw==
X-Received: by 2002:a05:690e:804:20b0:679:bad8:7dbf with SMTP id 956f58d0204a3-679ca4d6342mr190104d50.6.1792195328752;
        Fri, 16 Oct 2026 17:02:08 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1ed564fsm1675150d50.16.2026.10.16.17.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:02:08 -0700 (PDT)
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
Subject: [PATCH v2 2/3] perf unwind: Find separate debuginfo without loading symbols
Date: Fri, 16 Oct 2026 17:01:53 -0700
Message-ID: <20261017000158.1178269-3-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017000158.1178269-1-thepacketgeek@gmail.com>
References: <20261017000158.1178269-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both DWARF unwinders find the .debug_frame in a separate debuginfo file
through dso__symsrc_filename(), which only dso__load() sets, when it
finds a file with a symbol table. libdw's __find_debuginfo() hands out
nothing else, and libdw doesn't ask again for a module after a failed
lookup. libunwind's read_unwind_spec_debug_frame() falls back to
following .gnu_debuglink, which misses debuginfo that is only reachable
by build-id, such as under /usr/lib/debug/.build-id/ or in perf's
build-id cache.

The unwinders load the symbols of every frame they visit today, so this
mostly works, although libunwind can't use such a debuginfo file until
an earlier sample has loaded the DSO's symbols. A following patch lets
callers that don't need symbols skip loading them, and then nothing
would set dso__symsrc_filename().

Add dso__find_debuginfo(), which looks for a separate debuginfo file in
the places dso__load() would, reading the build-id first so that the
build-id based locations can be checked, but without loading symbols.
Use it in __find_debuginfo() when dso__symsrc_filename() isn't set, and
in read_unwind_spec_debug_frame() instead of only following
.gnu_debuglink. Don't open() a NULL dso__symsrc_filename(), which
becomes the common case once symbols aren't loaded.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 tools/perf/util/dso.c              | 31 ++++++++++++++++++++++++++++++
 tools/perf/util/dso.h              |  1 +
 tools/perf/util/unwind-libdw.c     | 16 ++++++++++++---
 tools/perf/util/unwind-libunwind.c | 28 ++++++++++-----------------
 4 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index e03e2cb9212b..36f5ab94c7e7 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -598,6 +598,37 @@ int dso__read_build_id(struct dso *dso)
 	return dso__has_build_id(dso) ? 0 : -1;
 }
 
+/*
+ * Look for a separate debuginfo file for a user space DSO in the places
+ * dso__load() would, without loading its symbols. Returns an allocated path,
+ * or NULL if none was found.
+ */
+char *dso__find_debuginfo(struct dso *dso)
+{
+	static const enum dso_binary_type debuginfo_types[] = {
+		DSO_BINARY_TYPE__DEBUGLINK,
+		DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO,
+		DSO_BINARY_TYPE__FEDORA_DEBUGINFO,
+		DSO_BINARY_TYPE__UBUNTU_DEBUGINFO,
+		DSO_BINARY_TYPE__BUILDID_DEBUGINFO,
+		DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO,
+		DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO,
+	};
+	char filename[PATH_MAX];
+
+	/* The build-id cache and /usr/lib/debug/.build-id need the build-id. */
+	dso__read_build_id(dso);
+
+	for (size_t i = 0; i < ARRAY_SIZE(debuginfo_types); i++) {
+		if (dso__read_binary_type_filename(dso, debuginfo_types[i], /*root_dir=*/"",
+						   filename, sizeof(filename)))
+			continue;
+		if (is_regular_file(filename))
+			return strdup(filename);
+	}
+	return NULL;
+}
+
 static char *dso__get_filename(struct dso *dso, const char *root_dir,
 			       bool *decomp)
 {
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index ece54b9b8552..88d8674f6247 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -806,6 +806,7 @@ static inline bool dso__has_symbols(const struct dso *dso)
 
 char *dso__filename_with_chroot(const struct dso *dso, const char *filename);
 int dso__read_build_id(struct dso *dso);
+char *dso__find_debuginfo(struct dso *dso);
 
 bool dso__sorted_by_name(const struct dso *dso);
 void dso__set_sorted_by_name(struct dso *dso);
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 63a5c2253174..a2e70e4f206f 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -5,6 +5,7 @@
 #include <elfutils/libdwfl.h>
 #include <inttypes.h>
 #include <errno.h>
+#include <string.h>
 #include "debug.h"
 #include "dso.h"
 #include <dwarf-regs.h>
@@ -39,11 +40,20 @@ static int __find_debuginfo(Dwfl_Module *mod __maybe_unused, void **userdata,
 			    const char *file_name, const char *debuglink_file __maybe_unused,
 			    GElf_Word debuglink_crc __maybe_unused, char **debuginfo_file_name)
 {
-	const struct dso *dso = *userdata;
+	struct dso *dso = *userdata;
 
 	assert(dso);
-	if (dso__symsrc_filename(dso) && strcmp(file_name, dso__symsrc_filename(dso)))
-		*debuginfo_file_name = strdup(dso__symsrc_filename(dso));
+	if (dso__symsrc_filename(dso)) {
+		if (strcmp(file_name, dso__symsrc_filename(dso)))
+			*debuginfo_file_name = strdup(dso__symsrc_filename(dso));
+	} else {
+		char *debuginfo = dso__find_debuginfo(dso);
+
+		if (debuginfo && strcmp(file_name, debuginfo))
+			*debuginfo_file_name = debuginfo;
+		else
+			free(debuginfo);
+	}
 	return -1;
 }
 
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index 73d191ce51a5..d92f1d485285 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -283,8 +283,9 @@ static int read_unwind_spec_debug_frame(struct dso *dso,
 	/* debug_frame can reside in:
 	 *  - dso
 	 *  - debug pointed by symsrc_filename
-	 *  - gnu_debuglink, which doesn't necessary
-	 *    has to be pointed by symsrc_filename
+	 *  - a separate debuginfo file, which symsrc_filename doesn't
+	 *    necessarily point to, or isn't set yet when the symbols
+	 *    haven't been loaded
 	 */
 	if (ofs == 0) {
 		if (dso__data_get_fd(dso, machine, &fd)) {
@@ -292,7 +293,7 @@ static int read_unwind_spec_debug_frame(struct dso *dso,
 			dso__data_put_fd(dso);
 		}
 
-		if (ofs <= 0) {
+		if (ofs <= 0 && dso__symsrc_filename(dso)) {
 			fd = open(dso__symsrc_filename(dso), O_RDONLY);
 			if (fd >= 0) {
 				ofs = elf_section_offset(fd, ".debug_frame");
@@ -301,19 +302,10 @@ static int read_unwind_spec_debug_frame(struct dso *dso,
 		}
 
 		if (ofs <= 0) {
-			char *debuglink = malloc(PATH_MAX);
-			int ret = 0;
-
-			if (debuglink == NULL) {
-				pr_err("unwind: Can't read unwind spec debug frame.\n");
-				return -ENOMEM;
-			}
+			char *debuginfo = dso__find_debuginfo(dso);
 
-			ret = dso__read_binary_type_filename(
-				dso, DSO_BINARY_TYPE__DEBUGLINK,
-				machine->root_dir, debuglink, PATH_MAX);
-			if (!ret) {
-				fd = open(debuglink, O_RDONLY);
+			if (debuginfo) {
+				fd = open(debuginfo, O_RDONLY);
 				if (fd >= 0) {
 					ofs = elf_section_offset(fd,
 							".debug_frame");
@@ -326,12 +318,12 @@ static int read_unwind_spec_debug_frame(struct dso *dso,
 						"%s: overwrite symsrc(%s,%s)\n",
 							__func__,
 							dso__symsrc_filename(dso),
-							debuglink);
+							debuginfo);
 					dso__free_symsrc_filename(dso);
 				}
-				dso__set_symsrc_filename(dso, debuglink);
+				dso__set_symsrc_filename(dso, debuginfo);
 			} else {
-				free(debuglink);
+				free(debuginfo);
 			}
 		}
 
-- 
2.53.0-Meta

