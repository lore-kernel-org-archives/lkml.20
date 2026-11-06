Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962118;
	b=lQlHlTbYbDmbJStCs0q5zJ00cAa9Eyfyd/r/uxC8oDbM6Rjc7bg+R5ru9mLShU872OlR
	 aHUf9+2bDpZ/fQP16UguJ1qgRUbX5ehAQtMwLazSq5vXN5v9p1MjSUmfPOaONlLkdCvU+
	 uB8jSKpuLCwa7riEyJ34q/II0U9fQQMDwa3dC4jyiFrmpubmPgh7Wuhil9xGCLafc8Vr2
	 JwSh/BLj/0YX4GbnHHnXjCmZ8dy0JVRNwFxjZsWobP6A/LpuJHzxi+OIBrajB8fzpAIpq
	 ez8uYKEiBUCuw6o/mvv6/V5MoGvPOi07sAO88zGEjX80hctD39Jy5ujcj/rHVbOKNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AIQ55/dcKZN2IJAZH63I7acCXZ9upAaCZhaczPqmRgk=;
	b=vKT9wGzAzqxwo17ngt5OaxWRT+wBJJo92Jtk16QHa590JcUekZJejSOMt8cBht+SoSDS
	 eJRUkvtN58392lRCQZg8JHvlJamecDtoS/WjjnEJ4jHyn+fKDL6xm/KvOvsGyiMC7fdO6
	 QA0IxuIdo8ZS5qaki79+vellD0n7jc70VDsruZgVN2cnpK74VhaewC6Txre7CkvpNMwm7
	 D5ggBAu9zkhoHv4zsvyNXJJuP4UMp+ksiBY0qs/KVwkuAZ+ZRfiLxC8/GzT8p/sIoFEM+
	 g3k0R0i8Pk8rNNl9g83GVzuTwjM2dhKuk3t8R/zAXx/3h7IUf52n4XpwD0G+pw4ku1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wmdTOFat;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A7606EE89
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020A7606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wmdTOFat
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so222299f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962116; x=1794566916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIQ55/dcKZN2IJAZH63I7acCXZ9upAaCZhaczPqmRgk=;
        b=wmdTOFath3dR+6YrTw1JScCFvcHlF0Zwg0kyl5X2HoNEOIWRR+laIi8u4Vc8JIinJ3
         0CYHfKsCxI/pxgNCiw3Vsshqk/lH+zJYi0B97OUrJ48QhF/JFFIa3d+0oVa7YSnvLpd0
         erTowhryvCUOfb+pKTNN+AgaTLlVrO910cNI6ee7gT/8J90WyIJVEvDa1lbqw8iXrJuE
         5qDDLMkn5aRC+UZR4DkAKXfK+KmoRL0iXHx4PLtJ5heN7wai4fhzG/7p6enaDu6pbcFP
         X3ACXoQ/GTBFV1rNXmecqh/ueOnDszdy5jf5CmLBCgUxhvtbsjeRfO9obOC4MN/A0tiH
         XdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962116; x=1794566916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIQ55/dcKZN2IJAZH63I7acCXZ9upAaCZhaczPqmRgk=;
        b=cXCEzhjjClaJO6jb+6p5K89BEGUv8TP9AVLFgjOCZ4MT0XvGiTjm90xsZCFBDgT3C3
         nstlm4cIIwBZfwbLAbM+996caCF8Wsd7Bp5m0V20hCQE5ihZMBJjiS3f167sWO9w9k7Z
         gTf0LNV3lIJzj7Oh/qXhAWUxj7c0odPRBmHf2QG8ubssYvk/FLQwpaHXmoXapzUd5pUz
         uQeCA+RtPX1mNuNb5+IiLrKZquayc5/XmirkgEyNanBS371Fbm23kfyPr7N49m6+yaMv
         lQThr/UPhN+j+rYtseDMMgqJZ6rty/+oemnDseY3ETwuqSwgaqXVmT+mC2ZpFmdqL1q8
         5mHQ==
X-Forwarded-Encrypted: i=1; AL+hErFieMDDH38BJEAWzl217h+0hI1P2IlQX0ljiV1yIYgc3WifdbD5ey+UIW9JkhBFVhiUM7oLHs5myIcFQsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HBsgoE+Uj1uj7I2wDy7tpjI5UpEfdcRgNdmHizyE+DT8/GSGI
	+yLgvBcnL6df4ZpaKHCQKGfSa6VYuVFHG9iAz3w5RXqEhRkhdTBSgipZW06QgycGGXM=
X-Gm-Gg: AYBFou1bZ3TwVPGoTQhKActev1Rzfjz4m5+6emw8OlfQwk1fbnc4UqgSPTC1e1faTmV
	yYlIztfekQCYpZb0thT7PVsmrbWUNig2ghAI2eQIYaq+XoSx3epWFJNW7AQocGbWFJaEENd0f1g
	rBJWBH2LHWYF1vxvEu1a/oBzXACsO6MXYWtMkmekdlKOd5kMxIBXGgy9KCiZPD4YNnBrOvlPfAv
	aRLoAuaWhkj8IVUHPTSfDQhIVC6HtMaiWuI+HL39LIBqxByv43nFS9h2nbc5UN5CuhGMwks93W2
	HFUENy2VVeOgtvBoA22JpaHhBuKfzQE2801u9J5JmI3wrmGgOaWoXcfPIYRUc5mExLz23qIhFHu
	7iVWyTiVbymjkWZQGteRTsE7MsWLllvyjueHvZPz6Q2FBjUdmdokb01RAAd1S9h3RLRaBHmsy1c
	riUoEMW0thbwHHiji5DS+mBmUMvR1bO2222Z/1MI803mXshbNkcYxScFd2Y6ALV7/ZQA8PESbyE
	2DV5bAY2bzScDDyNWWKjyv6L05IKewI5+eYNScaEEZ8Rlzr0+dYWOhInTHeEuINcoAyQou09cMt
	g507OeKnR9EGLrxZerw/julKpUB7DopH
X-Received: by 2002:a05:6000:2f83:b0:48c:4553:790b with SMTP id ffacd0b85a97d-4927fb63ecfmr3551895f8f.48.1793962116294;
        Fri, 06 Nov 2026 02:48:36 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3232248f8f.11.2026.11.06.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Nov 2026 10:48:07 +0000
Subject: [PATCH v2 1/4] perf libdw: Find the CU by iterating all CUs when
 aranges are missing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-james-perf-test-fixes-v2-1-9a912662f822@linaro.org>
References: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
In-Reply-To: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

libdw__addr2line() finds the CU with dwfl_module_getsrc() and
dwfl_module_addrdie(), which use dwarf_getaranges(). In elfutils 0.190
this only reads .debug_aranges, which can be partial. For example, when
Perf is built with LLVM=1, clang doesn't emit .debug_aranges by default
so the lookup then fails and no source lines are found for most of the
Perf binary.

This used to be hidden by falling back to the next addr2line style, but
now missing information stops the fallback since commit (62d7cdc8d587
"perf libdw: Optimize fallback logic for missing DWARF").

find_cu_die() in annotate-data.c already handles partial aranges by
iterating all CUs in .debug_info and checking them with dwarf_haspc().
Move it to dwarf-aux.c, then look up the line in that CU with
dwarf_getsrc_die() and use the same CU for unwinding inlines. While
moving it, don't treat a dwarf_haspc() error as a match.

This fixes the "test addr2line inline unwinding" test when Perf is built
with LLVM:

  $ perf test -vvv "test addr2line inline unwinding"
  ...
  Inline unwinding fp verification test [Failed missing inlined functions]
  ...
  Inline unwinding dwarf verification test [Failed missing inlined functions]
  ...
  Inline unwinding lbr verification test [Failed missing inlined functions]
  ---- end(-1) ----
   79: test addr2line inline unwinding : FAILED!

Fixes: 88c51002d06f ("perf addr2line: Add a libdw implementation")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/annotate-data.c | 27 +--------------------------
 tools/perf/util/dwarf-aux.c     | 37 +++++++++++++++++++++++++++++++++++++
 tools/perf/util/dwarf-aux.h     |  3 +++
 tools/perf/util/libdw.c         | 19 ++++++++++---------
 4 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 25e3169ea8ad..8092ef9d2045 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -523,31 +523,6 @@ static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
 	return result;
 }
 
-static bool find_cu_die(struct debuginfo *di, u64 pc, Dwarf_Die *cu_die)
-{
-	Dwarf_Off off, next_off;
-	size_t header_size;
-
-	if (dwarf_addrdie(di->dbg, pc, cu_die) != NULL)
-		return cu_die;
-
-	/*
-	 * There are some kernels don't have full aranges and contain only a few
-	 * aranges entries.  Fallback to iterate all CU entries in .debug_info
-	 * in case it's missing.
-	 */
-	off = 0;
-	while (dwarf_nextcu(di->dbg, off, &next_off, &header_size,
-			    NULL, NULL, NULL) == 0) {
-		if (dwarf_offdie(di->dbg, off + header_size, cu_die) &&
-		    dwarf_haspc(cu_die, pc))
-			return true;
-
-		off = next_off;
-	}
-	return false;
-}
-
 enum type_match_result {
 	PERF_TMR_UNKNOWN = 0,
 	PERF_TMR_OK,
@@ -1827,7 +1802,7 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 	pc = map__rip_2objdump(dloc->ms->map, dloc->ip);
 
 	/* Get a compile_unit for this address */
-	if (!find_cu_die(dloc->di, pc, &cu_die)) {
+	if (!cu_find_by_addr(dloc->di->dbg, pc, &cu_die)) {
 		pr_debug_dtp("cannot find CU for address %"PRIx64"\n", pc);
 		ann_data_stat.no_cuinfo++;
 		return -1;
diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 54f8b5ec74a2..742fccba5376 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -106,6 +106,43 @@ static Dwarf_Line *cu_getsrc_die(Dwarf_Die *cu_die, Dwarf_Addr addr)
 	return line;
 }
 
+/**
+ * cu_find_by_addr - Find the CU DIE that contains an address
+ * @dbg: a Dwarf handle
+ * @addr: An address
+ * @cu_die: a buffer to store the found CU DIE
+ *
+ * Find the CU DIE whose ranges contain @addr. dwarf_addrdie() uses
+ * dwarf_getaranges() which didn't work until elfutils 0.191. Release notes:
+ *
+ *   * NEWS *
+ *   libdw: dwarf_addrdie now supports binaries lacking a .debug_aranges
+ *   section.
+ *
+ * Clang doesn't emit them by default, so fall back to iterating all CUs in
+ * case it's missing.
+ *
+ * Return @cu_die if found, otherwise NULL.
+ */
+Dwarf_Die *cu_find_by_addr(Dwarf *dbg, Dwarf_Addr addr, Dwarf_Die *cu_die)
+{
+	Dwarf_Off off = 0, next_off;
+	size_t header_size;
+
+	if (dwarf_addrdie(dbg, addr, cu_die) && dwarf_haspc(cu_die, addr) == 1)
+		return cu_die;
+
+	while (dwarf_nextcu(dbg, off, &next_off, &header_size,
+			    NULL, NULL, NULL) == 0) {
+		if (dwarf_offdie(dbg, off + header_size, cu_die) &&
+		    dwarf_haspc(cu_die, addr) == 1)
+			return cu_die;
+
+		off = next_off;
+	}
+	return NULL;
+}
+
 /**
  * cu_find_lineinfo - Get a line number and file name for given address
  * @cu_die: a CU DIE
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index 6f9145510adc..cc3fd61374c4 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -23,6 +23,9 @@ const char *cu_find_realpath(Dwarf_Die *cu_die, const char *fname);
 /* Get DW_AT_comp_dir (should be NULL with older gcc) */
 const char *cu_get_comp_dir(Dwarf_Die *cu_die);
 
+/* Find the CU DIE that contains the given address */
+Dwarf_Die *cu_find_by_addr(Dwarf *dbg, Dwarf_Addr addr, Dwarf_Die *cu_die);
+
 /* Get a line number and file name for given address */
 int cu_find_lineinfo(Dwarf_Die *cudie, Dwarf_Addr addr,
 		     const char **fname, int *lineno);
diff --git a/tools/perf/util/libdw.c b/tools/perf/util/libdw.c
index e660623338d5..90767361f485 100644
--- a/tools/perf/util/libdw.c
+++ b/tools/perf/util/libdw.c
@@ -170,7 +170,9 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 {
 	Dwfl *dwfl;
 	Dwfl_Module *mod;
-	Dwfl_Line *dwline;
+	Dwarf_Line *dwline;
+	Dwarf_Die cu_mem, *cudie;
+	Dwarf *dw;
 	Dwarf_Addr bias;
 	const char *src;
 	int lineno = 0;
@@ -197,7 +199,8 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 	 * between the regular ELF addr2line addresses and those to use with
 	 * libdw.
 	 */
-	if (!dwfl_module_getdwarf(mod, &bias)) {
+	dw = dwfl_module_getdwarf(mod, &bias);
+	if (!dw) {
 		/*
 		 * Free the Dwfl session so the mmap'd ELF binary is unmapped
 		 * immediately, and mark the DSO as lacking srcline/DWARF info
@@ -211,7 +214,8 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 	}
 
 	/* Find source line information for the address. */
-	dwline = dwfl_module_getsrc(mod, addr + bias);
+	cudie = cu_find_by_addr(dw, addr, &cu_mem);
+	dwline = cudie ? dwarf_getsrc_die(cudie, addr) : NULL;
 	if (!dwline) {
 		/* conclusively missing information -> abort fallbacks */
 		ret = 0;
@@ -219,8 +223,8 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 	}
 
 	/* Get line information. */
-	src = dwfl_lineinfo(dwline, /*addr=*/NULL, &lineno, /*col=*/NULL, /*mtime=*/NULL,
-			    /*length=*/NULL);
+	src = dwarf_linesrc(dwline, /*mtime=*/NULL, /*length=*/NULL);
+	dwarf_lineno(dwline, &lineno);
 
 	if (file)
 		*file = src ? strdup(src) : NULL;
@@ -229,8 +233,6 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 
 	/* Optionally unwind inline function call chain. */
 	if (unwind_inlines && node) {
-		Dwarf_Addr unused_bias;
-		Dwarf_Die *cudie = dwfl_module_addrdie(mod, addr + bias, &unused_bias);
 		struct libdw_a2l_cb_args args = {
 			.dso = dso,
 			.sym = sym,
@@ -248,8 +250,7 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		}
 
 		/* Walk from the parent down to the leaf. */
-		if (cudie)
-			cu_walk_functions_at(cudie, addr, libdw_a2l_cb, &args);
+		cu_walk_functions_at(cudie, addr, libdw_a2l_cb, &args);
 
 		if (!args.leaf_srcline_used)
 			free(args.leaf_srcline);

-- 
2.43.0

