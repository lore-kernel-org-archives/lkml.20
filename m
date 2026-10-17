Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63EB28E0F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195336; cv=none; b=iL/BFVvAh6UFeYhSfRlSud5ByoYLSN2uYI1lV5emTY/2RKNt9L+UwMXZ6sbj+YY62G+1IrrYn4R2MUg83AsVQ4gFa7ETD3R53dENSqrkXjyXA2MMHWdyg5B4MWXlDNjusHtQslVtdu2dRze/BxaJ62Zjjdcdcl7oPwsaJVDCwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195336; c=relaxed/simple;
	bh=HCZXe7UPTVjTvUPUzo28QBbR875vkKy7Xx3LGL942o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2btbUm+0/kRfTzPDT9WAhEOplaJv9sBZCxXzuqgD5K+u95f2yWXn41hEKaj2Eb52ya0UaK6MmLHnZB/8UI6AVPTHq0rWDL4eP+wh/BjkQ8OEPwrtPrOss+KDntBhQUWQs88PfBktEcAQqJ5Dr1fYO8sTtdxL69q+XftGfQa2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmjJT2qj; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmjJT2qj"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6740e7ae219so467781d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195332; x=1792800132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWW1/FcULxYL94UZSxhGM17LHyzFhRGAQVGGbEVLgEs=;
        b=EmjJT2qjwvjPhkLHredVf9mX8RM1sAh2zHGh378YKzkyU3yPiYWRPM2RpcfRA192Ni
         Czp2Y1AXMMjgAyPuRZ7hm37sKYphKAzwlTPVoOxcXDq+lp2btZRcLQL2WVlqzbcXi1u0
         R0OaPsS4sGoAyadMP/p9vj/ZjH73PRo1p2QIJWzFSZ4ZHfa0phiLGhyEDJXwnb3yQweN
         8d7vSKCRJd3lJH0VcdD3C2MG/UMUxrv5voWA3udQVeH6YhE5c9Bbl3N7Na5VTEcR3YFS
         aNfhzG8eU3lxRseYWc6pCEluIoHa/J9xu5W4M33kyjLhJQ3QTe6xDsuB2CrV9tkog445
         pPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195332; x=1792800132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWW1/FcULxYL94UZSxhGM17LHyzFhRGAQVGGbEVLgEs=;
        b=bXkCYdNabcibCn1rEQgd09+uTiGcyMKeYwoLNSVttkNIwFHTjzheMO9Rzyxr/lC4mu
         7HhIAexul+To2s1tn126vB0wkrVtt+4bf8bFYqgLT7HnENHUBj54hYz63GkNWRz1TYA7
         32zOr04ArRgqbm88w+qm9DYzue18yUZCq3ACGEhA0coS7w50U8ZPfy2OZLLd27NzrDZv
         2JVJZNVuJAZzAvaocqX4ObcqvPykLeYTmI8pUD7H5t0h5YBxC5ZrfrrgxWmGrDWA3fov
         LqgW63XT4Esvfa/mebl0CWv44eT8dl9UWbVPuUnkYF3czBXWwoNheLDoXW4SSpB8n+Bo
         nhyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFqW2bTe5ZFcvW5ryV6+CPQkFdvI4+eUEHkisRWmZLeZMikXyGb1Zken4V4Xw8ChVZjvDgEhTDGqnlWEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJllqIoK7foCHVgzFJBtdtAqL0f6Q8BFgBvmVXmbv8zmY/P7Y0q
	TkX4l/ojmiN3epzShKy8z2HzrhNcJ/ETJp+Vrdlazv/6h/X3/UpJ6Occ
X-Gm-Gg: AYBFou00BsrnN9KNNrXhOr7eK99qz2SUla62jDcQu4HxiyaophOGCm/PcaRDV7laKt0
	gAtVIomtRJnKHqvee7NHzhmYGRHTshcgR/sCsdj4e2RdVKpNv8drwMc3aYNFg1T2dKKEe2Exvcu
	o/Dc7suyluJU2WOtZ7b6UmCsdr6X1JXdswJTeXyS5S/YZGKJHJwFf3HngIZZwN0BR7r/ydviKsG
	uC8RctBZuTLPmwxaiJex8CkDQiuZ2yOW3flDL8aE9rCmUc4xjsWFCLbZD+MnCuNq2v+X6f6KjLA
	UnisUMEN99loMBPOWsdGJLvSmX/YUydnOPspRKXx+dJozRFuYngfhqINulRVba/O0OlKZ02FhN/
	bVYkXw9o9yWKKtNHsUaO8ObW7QFEJncgGoqOZT3EAsqis60S9UNdbYI0EtbGYK4q9huLhe7E0vz
	gSjETm4RIvbPQMOfzY2mdyNDK4M5796JbCKS8UBxGqLUei675JWtYWu/l+YLDHJSw1vl38g0Nf6
	hyxIf8=
X-Received: by 2002:a05:690e:d8a:b0:679:89e5:c1b5 with SMTP id 956f58d0204a3-679ca8c02cfmr240483d50.85.1792195331485;
        Fri, 16 Oct 2026 17:02:11 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1ed36cesm1733296d50.14.2026.10.16.17.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:02:11 -0700 (PDT)
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] perf unwind: Don't look up symbols when the caller doesn't want them
Date: Fri, 16 Oct 2026 17:01:54 -0700
Message-ID: <20261017000158.1178269-4-thepacketgeek@gmail.com>
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

Commit 02b2705017d2 ("perf callchain: Allow symbols to be optional when
resolving a callchain") let callers that only need maps, such as
build-id marking in 'perf record' and 'perf inject', resolve callchains
without loading symbols. The DWARF unwinders were left out:
thread__resolve_callchain_unwind() just notes that "Not resolving
symbols with an unwinder isn't currently supported", and both libdw and
libunwind look up the symbol of every frame they visit. The first lookup
in a DSO loads its whole symbol table and demangles every name in it.

On arm64 this happens even for frame pointer callchains, because
get_leaf_frame_caller_aarch64() runs a two frame DWARF unwind for every
sample to recover the leaf function's caller. Since commit 29be60c93d2d
("perf build-id: Mark DSO in sample callchains"), process_buildids()
does that for every sample at the end of 'perf record', so with -a it
loads and demangles the symbol tables of every user binary sampled on
the system. A C++ binary with a pathological mangled name sent
__cxa_demangle() into exponential time and memory, and

  perf record -a -e cycles:u --call-graph fp -- sleep 2

never finished writing perf.data after the workload exited.

Pass a symbols flag down to the unwinders. When it is false, look up
only the map of each frame and leave entry->ms.sym NULL, which
unwind_entry() already handles just as add_callchain_ip() does for
symbols=false. get_leaf_frame_caller_aarch64() uses nothing but the
addresses, and its caller looks up the leaf frame caller's symbol
through add_callchain_ip() when it wants it, so it never asks for
symbols.

Loading the symbols also had side effects that the unwinders relied on.
In libdw, both report_module() and entry() follow the flag, so with
symbols the module's symbols are still loaded before libdw first asks
__find_debuginfo() for its debuginfo, which it does while unwinding the
frame to find out whether it is an activation. Without symbols, libdw's
__find_debuginfo() and libunwind's read_unwind_spec_debug_frame() find
the debuginfo file themselves since the previous patch, and
__report_module() reads a missing build-id with dso__read_build_id()
before trying the build-id cache. The frames returned are unchanged.

With libdw, 'perf inject -b' on an x86 'perf record --call-graph dwarf'
profile of a Python workload goes from 0.24s and 58.5MB max RSS to 0.04s
and 15.5MB, with the same build-ids injected.

Fixes: 02b2705017d2 ("perf callchain: Allow symbols to be optional when resolving a callchain")
Fixes: 29be60c93d2d ("perf build-id: Mark DSO in sample callchains")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 tools/perf/tests/dwarf-unwind.c               |  3 ++-
 .../util/arm64-frame-pointer-unwind-support.c |  7 ++++-
 tools/perf/util/machine.c                     |  7 ++---
 tools/perf/util/unwind-libdw.c                | 27 ++++++++++++++-----
 tools/perf/util/unwind-libdw.h                |  1 +
 tools/perf/util/unwind-libunwind.c            | 15 +++++++----
 tools/perf/util/unwind.c                      |  7 +++--
 tools/perf/util/unwind.h                      | 11 +++++---
 8 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/tools/perf/tests/dwarf-unwind.c b/tools/perf/tests/dwarf-unwind.c
index 9ed78d00fb87..1d46c629eeee 100644
--- a/tools/perf/tests/dwarf-unwind.c
+++ b/tools/perf/tests/dwarf-unwind.c
@@ -104,7 +104,8 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__thread(struct thread *thr
 	}
 
 	err = unwind__get_entries(unwind_entry, &cnt, thread,
-				  &sample, MAX_STACK, false);
+				  &sample, MAX_STACK, /*symbols=*/true,
+				  /*best_effort=*/false);
 	if (err)
 		pr_debug("unwind failed\n");
 	else if (cnt != MAX_STACK) {
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/tools/perf/util/arm64-frame-pointer-unwind-support.c
index 3af8c7a466e0..c16eeee34211 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
@@ -67,7 +67,12 @@ u64 get_leaf_frame_caller_aarch64(struct perf_sample *sample, struct thread *thr
 		regs->cache_regs[PERF_REG_ARM64_SP] = 0;
 	}
 
-	ret = unwind__get_entries(add_entry, &entries, thread, sample, 2, true);
+	/*
+	 * Only the addresses are used. The caller looks up the leaf frame
+	 * caller's symbol itself if it wants it, so don't load symbols here.
+	 */
+	ret = unwind__get_entries(add_entry, &entries, thread, sample, 2,
+				  /*symbols=*/false, /*best_effort=*/true);
 	memcpy(regs, &old_regs, sizeof(*regs));
 
 	if (ret || entries.length != 2)
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index f86b3b7df742..16847e26ea09 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -3061,11 +3061,8 @@ static int thread__resolve_callchain_unwind(struct thread *thread,
 	    !sample->user_stack.size)
 		return 0;
 
-	if (!symbols)
-		pr_debug("Not resolving symbols with an unwinder isn't currently supported\n");
-
-	return unwind__get_entries(unwind_entry, cursor,
-				   thread, sample, max_stack, false);
+	return unwind__get_entries(unwind_entry, cursor, thread, sample,
+				   max_stack, symbols, /*best_effort=*/false);
 }
 
 int __thread__resolve_callchain(struct thread *thread,
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index a2e70e4f206f..c8675484625b 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -78,16 +78,22 @@ static const Dwfl_Callbacks offline_callbacks = {
 };
 
 static int __report_module(struct addr_location *al, u64 ip,
-			    struct unwind_info *ui)
+			    struct unwind_info *ui, bool symbols)
 {
 	Dwfl_Module *mod;
 	struct dso *dso = NULL;
 	Dwarf_Addr base;
+
 	/*
-	 * Some callers will use al->sym, so we can't just use the
-	 * cheaper thread__find_map() here.
+	 * Some callers will use al->sym. Loading the symbols also reads a
+	 * missing build-id, needed below, and sets dso__symsrc_filename(),
+	 * needed by __find_debuginfo(). Without symbols, both are found
+	 * separately.
 	 */
-	thread__find_symbol(ui->thread, PERF_RECORD_MISC_USER, ip, al);
+	if (symbols)
+		thread__find_symbol(ui->thread, PERF_RECORD_MISC_USER, ip, al);
+	else
+		thread__find_map(ui->thread, PERF_RECORD_MISC_USER, ip, al);
 
 	if (al->map)
 		dso = map__dso(al->map);
@@ -129,6 +135,13 @@ static int __report_module(struct addr_location *al, u64 ip,
 	if (!mod) {
 		char filename[PATH_MAX];
 
+		/*
+		 * Finding the DSO in the build-id cache needs its build-id.
+		 * Loading the symbols reads it, so read it here if they
+		 * weren't loaded.
+		 */
+		if (!symbols)
+			dso__read_build_id(dso);
 		if (dso__build_id_filename(dso, filename, sizeof(filename), false))
 			mod = dwfl_report_elf(ui->dwfl, dso__short_name(dso), filename, -1,
 					      base, false);
@@ -150,7 +163,7 @@ static int report_module(u64 ip, struct unwind_info *ui)
 	int res;
 
 	addr_location__init(&al);
-	res = __report_module(&al, ip, ui);
+	res = __report_module(&al, ip, ui, ui->symbols);
 	addr_location__exit(&al);
 	return res;
 }
@@ -166,7 +179,7 @@ static int entry(u64 ip, struct unwind_info *ui)
 	struct addr_location al;
 
 	addr_location__init(&al);
-	if (__report_module(&al, ip, ui)) {
+	if (__report_module(&al, ip, ui, ui->symbols)) {
 		addr_location__exit(&al);
 		return -1;
 	}
@@ -371,6 +384,7 @@ int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data,
 			int max_stack,
+			bool symbols,
 			bool best_effort)
 {
 	struct maps *maps = thread__maps(thread);
@@ -399,6 +413,7 @@ int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 		.max_stack	= max_stack,
 		.e_machine	= e_machine,
 		.e_flags	= e_flags,
+		.symbols	= symbols,
 		.best_effort    = best_effort
 	};
 
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 6423bf5a2492..ab37bf5cb105 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -22,6 +22,7 @@ struct unwind_info {
 	int			idx;
 	uint32_t		e_flags;
 	uint16_t		e_machine;
+	bool			symbols;
 	bool			best_effort;
 	struct unwind_entry	entries[];
 };
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index d92f1d485285..30d3c494f45a 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -581,14 +581,19 @@ void unwind__finish_access(struct maps *maps)
 	libunwind_arch__finish_access(maps);
 }
 
-static int entry(uint64_t ip, struct thread *thread, unwind_entry_cb_t cb, void *arg)
+static int entry(uint64_t ip, struct thread *thread, bool symbols,
+		 unwind_entry_cb_t cb, void *arg)
 {
 	struct unwind_entry e;
 	struct addr_location al;
 	int ret;
 
 	addr_location__init(&al);
-	e.ms.sym = thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
+	if (symbols)
+		thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
+	else
+		thread__find_map(thread, PERF_RECORD_MISC_USER, ip, &al);
+	e.ms.sym = al.sym;
 	e.ip     = ip;
 	e.ms.map = al.map;
 	e.ms.thread = thread__get(al.thread);
@@ -606,7 +611,7 @@ static int entry(uint64_t ip, struct thread *thread, unwind_entry_cb_t cb, void
 int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			 struct thread *thread,
 			 struct perf_sample *sample, int max_stack,
-			 bool best_effort)
+			 bool symbols, bool best_effort)
 {
 	struct unwind_info *ui;
 	uint64_t first_ip;
@@ -632,7 +637,7 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 
 	if (max_stack == 1) {
 		/* Special case for a single entry. */
-		ret = entry(first_ip, thread, cb, arg);
+		ret = entry(first_ip, thread, symbols, cb, arg);
 		return ret ? (ret == -ENOMEM ? -ENOMEM : 0) : 1;
 	}
 
@@ -654,7 +659,7 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 		int j = callchain_param.order == ORDER_CALLEE ? i : ui->cur_ip - i - 1;
 
 		if (ui->ips[j]) {
-			ret = entry(ui->ips[j], thread, cb, arg);
+			ret = entry(ui->ips[j], thread, symbols, cb, arg);
 			if (ret)
 				break;
 			entries++;
diff --git a/tools/perf/util/unwind.c b/tools/perf/util/unwind.c
index 4ed4b1d55c69..8555ece4b6f3 100644
--- a/tools/perf/util/unwind.c
+++ b/tools/perf/util/unwind.c
@@ -10,6 +10,7 @@ int unwind__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_u
 			struct thread *thread __maybe_unused,
 			struct perf_sample *data __maybe_unused,
 			int max_stack __maybe_unused,
+			bool symbols __maybe_unused,
 			bool best_effort __maybe_unused)
 {
 	int ret = 0;
@@ -29,10 +30,12 @@ int unwind__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_u
 	for (size_t i = 0; i < ARRAY_SIZE(symbol_conf.unwind_style); i++) {
 		switch (symbol_conf.unwind_style[i]) {
 		case UNWIND_STYLE_LIBDW:
-			ret = libdw__get_entries(cb, arg, thread, data, max_stack, best_effort);
+			ret = libdw__get_entries(cb, arg, thread, data, max_stack,
+						 symbols, best_effort);
 			break;
 		case UNWIND_STYLE_LIBUNWIND:
-			ret = libunwind__get_entries(cb, arg, thread, data, max_stack, best_effort);
+			ret = libunwind__get_entries(cb, arg, thread, data, max_stack,
+						     symbols, best_effort);
 			break;
 		case UNWIND_STYLE_UNKNOWN:
 		default:
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index a2d4af694fde..59dfb234cbea 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -23,6 +23,9 @@ int unwind__configure(const char *var, const char *value, void *cb);
 int unwind__option(const struct option *opt, const char *arg, int unset);
 
 /*
+ * When symbols is false, only the map of each frame is looked up and
+ * entry->ms.sym is left NULL, so that no symbol tables are loaded.
+ *
  * When best_effort is set, don't report errors and fail silently. This could
  * be expanded in the future to be more permissive about things other than
  * error messages.
@@ -30,19 +33,20 @@ int unwind__option(const struct option *opt, const char *arg, int unset);
 int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data, int max_stack,
-			bool best_effort);
+			bool symbols, bool best_effort);
 
 #ifdef HAVE_LIBDW_SUPPORT
 int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 		       struct thread *thread,
 		       struct perf_sample *data, int max_stack,
-		       bool best_effort);
+		       bool symbols, bool best_effort);
 #else
 #include "debug.h"
 static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_unused,
 				     struct thread *thread __maybe_unused,
 				     struct perf_sample *data __maybe_unused,
 				     int max_stack __maybe_unused,
+				     bool symbols __maybe_unused,
 				     bool best_effort __maybe_unused)
 {
 	pr_warning_once("Error: libdw dwarf unwinding not built into perf\n");
@@ -55,7 +59,7 @@ static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_unused, void *
 int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			   struct thread *thread,
 			   struct perf_sample *data, int max_stack,
-			   bool best_effort);
+			   bool symbols, bool best_effort);
 int unwind__prepare_access(struct maps *maps, uint16_t e_machine);
 void unwind__flush_access(struct maps *maps);
 void unwind__finish_access(struct maps *maps);
@@ -66,6 +70,7 @@ static inline int libunwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
 					 struct thread *thread __maybe_unused,
 					 struct perf_sample *data __maybe_unused,
 					 int max_stack __maybe_unused,
+					 bool symbols __maybe_unused,
 					 bool best_effort __maybe_unused)
 {
 	pr_warning_once("Error: libunwind dwarf unwinding not built into perf\n");
-- 
2.53.0-Meta

