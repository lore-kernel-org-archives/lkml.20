Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388772;
	b=CNXzKmW1w72U4ZWYh2vdMmr2zj/rzxknsqDN+bUUzM35Vt5Y1471MFB+2MjHN7uy59IK
	 nJ43xccNIaIkl1XAD0NSKY2udDgJKR6DLMgUkTLKiohQ/X5wccUoG26wfaXn1Pb6Jooft
	 UKcz1lJVl2aqwbCE02ernopqCVFv7fON0epyjNzNVtSYB2zJeAQOpJaZ0xVyggK5tKynm
	 Eg9FdpJjZHa1AImJ1+V6jk5C50QgS1IjskyKXG99+kg08V1SsPgLykYUR6MXr6vGFNPG/
	 L876JM4ZsUZ7gy7CfqP41/Kgz6W6exRf9tpVvfQ2YKnU23JRSEss5dF61+JmVu54YiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kziFYy/eWa7GbPeapnKYCdL0r2cjvVX4oj7u0OCrPiA=;
	b=ebVTBNmZ/5blR41ViZoX8/RJ2OKQS1+Kw8P1LRoJZK6i8TA/Qo19MFSiGkzUSTU4w7jY
	 q3p23fUlgIh0ESinYER35Yicnn8Ydx9Tk9VC5/hsvfIy61NoI6PpZLCCtjMcxn/gZeAsS
	 KtzMI8Y6F1mo4mB+PGGKA6AaR5tS1VAJ7Hlfs4pD5I496mG6KbuV8y6ggX/m8Hvo7RQzs
	 ADk9HMrzThFc3VsCgRaNCn/z93VasgCmvdiYwpZ84Ys5lY13GfcTbZBZqT7a4Q8G4v0XO
	 UsZN+GDHHpHmO9+MaTllv0h+3a9RR48Li+7X2kOWe4qK87ZF3hWtEzF6zuyR/B0qf8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW07ygd8;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57385606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57385606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW07ygd8
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b10d24345dso10549647b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388771; x=1793993571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kziFYy/eWa7GbPeapnKYCdL0r2cjvVX4oj7u0OCrPiA=;
        b=tW07ygd86fMBYUFSzmeP5NsVR1FMWSB/sU4qdpGPlVNJNzxwLbL7wHoUx7gf22oqHE
         /VvJMEG3nH9VHymjQjyZLAyZMt4s6aEbm73hcoZVs0/xMg1a8ly1UmIrlvk+xw2gQIT2
         P8sNs3zS5GVROGrF1j3FIGsNuYQotkw/qtLYsPaAPrlZZJwgKbsnZYgd6Oechz3+KAdq
         WGv/1YWEg6I2o0iflvCxi8KQ142EN7GqioVHR4zhJfx5FRz+eJISaFw9CrqkEMoV4fy7
         lenTaGf9dKRr1Kv8NBeuoLo5EM21MhnwELWIhcEQ/KRaDHkZaMvS4o2HOiMpeNd9iPy+
         2/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388771; x=1793993571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kziFYy/eWa7GbPeapnKYCdL0r2cjvVX4oj7u0OCrPiA=;
        b=sWMtpM0fJasv9Sep11yfT9cjQC9yT9MY99UA/GFIc3VMOHk8OEmNoKOVMz0+hFEA09
         0JSOFmwjfv8x4mIS1GVx79zR11+MjbvuskoK4EiQHVvT+BukA4Vod+kC6Hdgv973IRg/
         SywtjTO4cVkt/L+WvXSZXEpMUJUzMSQygBKy2EpbBk+3uPqFnS9JWXNNKaAvjVKhbevN
         WlM6Q78TWV6BIlZx/bu0+EiX/l/oyVNZ1a7tY4zkcKHBm+TObwURMM4e9KJeVVg81O0i
         yiIofxZXh8MT+3KeJK5/kg2jfDkINBxwlM0OJwSP2rpRidPhJKa1FFLVqp9ZkZRmEHS3
         00DQ==
X-Gm-Message-State: AFq9FYIEQHYmhZD0LhUX10N8kL2q7DwXFMxbsJAvjbReNtgbB/axqH+b
	YGyAqEivEBkNwehgvlTXDZFLD4aVZh+ymmulM3ZZWJh92+HwEG+Rxly1
X-Gm-Gg: AYBFou2CyCb/Wp1ZIJ5sqWEaXBLwughreXnt5oKOSG2qocx8hKi95gWoaE7Q0WjzmrK
	gqRoay6H7q0gyUVTXDeOQoNdvqzIyGSRs08cAfnkSqFuR/qWn1ktH0pSzpJYU8+7QiM04DrwQmN
	etbl3//58Wmdam7bOqBYgt+CtidAKXaG+zrOBzVlwpSWAfw26rtR75WpGGgrdYlrHu6eHrJsTAA
	QbFCQuaUPkjwwsBjuLltDyqc1eTwPrjQE4CNpCdlrkD1v2Tdh7jvj09MYB4LQa/HVyQj93gQeGX
	Ie5UrwIp1WC9D2YpWg7Dk+6Vg0Ra3c1SaVXaEXuHs2S4s7e2eRnZnVSSVXHMgeXNL9QXf9mQ/xf
	DFWDUno5yQVFXt/sFDfM6h1L3bgw8h/CyIbvLr5x1KuJPhmpylx9SyQL8R7FL2RZ1Fpli5PZiwG
	8b71OayM1J9ItNl+b3zVepZWOhflG5tr+mbd0V1z0zm3R5SmNaAdyWjz7sPdiBS2hYDPzf4mKH0
	5US9txtXfZkqWJrkLSZGa+Zlr2FWwwea/4iAgVzHdTxRKTN4/6OpANozDhNPlcZI6Anzdn5xSAK
	QQ2my810zddCICDXvOFn1SaD
X-Received: by 2002:a05:690c:389:b0:8ab:37e5:6678 with SMTP id 00721157ae682-8b2b679d88cmr20934607b3.44.1793388771167;
        Fri, 30 Oct 2026 12:32:51 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704cd14sm13571167b3.6.2026.10.30.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:32:50 -0700 (PDT)
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
Cc: linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 2/2] perf unwind: Don't look up symbols when the caller doesn't want them
Date: Fri, 30 Oct 2026 12:32:34 -0700
Message-ID: <20261030193237.1440673-3-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030193237.1440673-1-thepacketgeek@gmail.com>
References: <20261030193237.1440673-1-thepacketgeek@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
loads and demangles the symbol tables of every user binary it sampled.
A C++ binary with a pathological mangled name sent __cxa_demangle() into
exponential time and memory, and

  perf record -a -e cycles:u --call-graph fp -- sleep 2

never finished writing perf.data after the workload exited.

Pass a symbols flag down to the unwinders. When it is false, look up
only the map of each frame and leave entry->ms.sym NULL, which
unwind_entry() already handles just as add_callchain_ip() does for
symbols=false. get_leaf_frame_caller_aarch64() only uses the addresses,
and its caller looks up the leaf frame caller's symbol through
add_callchain_ip() when it wants it, so it never asks for symbols.

The unwinders still need what loading the symbols used to find: the
DSO's build-id and any separate debuginfo, through
dso__symsrc_filename(). Without symbols, they get those from
dso__load_symsrc(). libdw does that before reporting each module, and
both its report_module() and entry() follow the flag, so with symbols
the module's symbols are still loaded before libdw first asks
__find_debuginfo() for its debuginfo, which it does while unwinding the
frame to find out whether it is an activation. libunwind does it in
entry(), where it used to load the symbols. The frames returned are
unchanged.

The dwarf unwind test now unwinds without symbols first, checking that
no symbols get loaded, and then checks that unwinding with symbols
returns the same addresses and maps.

With libdw, 'perf inject -b' on an x86 'perf record --call-graph dwarf'
profile of a Python workload goes from 0.19s and 69MB max RSS to 0.10s
and 33MB, with the same build-ids injected.

Fixes: 02b2705017d2 ("perf callchain: Allow symbols to be optional when resolving a callchain")
Fixes: 29be60c93d2d ("perf build-id: Mark DSO in sample callchains")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 tools/perf/tests/dwarf-unwind.c               | 71 ++++++++++++++++---
 .../util/arm64-frame-pointer-unwind-support.c |  7 +-
 tools/perf/util/machine.c                     |  7 +-
 tools/perf/util/unwind-libdw.c                | 17 ++++-
 tools/perf/util/unwind-libdw.h                |  1 +
 tools/perf/util/unwind-libunwind.c            | 22 ++++--
 tools/perf/util/unwind.c                      |  7 +-
 tools/perf/util/unwind.h                      | 11 ++-
 8 files changed, 116 insertions(+), 27 deletions(-)

diff --git a/tools/perf/tests/dwarf-unwind.c b/tools/perf/tests/dwarf-unwind.c
index 9ed78d00fb87..2cbb95c577a9 100644
--- a/tools/perf/tests/dwarf-unwind.c
+++ b/tools/perf/tests/dwarf-unwind.c
@@ -15,6 +15,7 @@
 #include "map.h"
 #include "symbol.h"
 #include "thread.h"
+#include "dso.h"
 #include "callchain.h"
 
 /* For bsearch. We try to unwind functions in shared object. */
@@ -53,9 +54,38 @@ int test__dwarf_unwind(struct test_suite *test, int subtest);
 
 #define MAX_STACK 8
 
+struct unwind_test_data {
+	unsigned long cnt;
+	unsigned long nr;
+	u64 ips[MAX_STACK];
+	struct map *maps[MAX_STACK];
+	bool check_unloaded;
+};
+
+static int unwind_entry_maps(struct unwind_entry *entry, void *arg)
+{
+	struct unwind_test_data *data = arg;
+	unsigned long idx = data->cnt;
+
+	if (idx >= MAX_STACK || entry->ms.sym || !entry->ms.map) {
+		pr_debug("failed: invalid entry without symbols\n");
+		return -1;
+	}
+	if (data->check_unloaded && dso__loaded(map__dso(entry->ms.map))) {
+		pr_debug("failed: unwinding loaded symbols\n");
+		return -1;
+	}
+
+	data->ips[idx] = entry->ip;
+	data->maps[idx] = map__get(entry->ms.map);
+	data->cnt++;
+	return 0;
+}
+
 static int unwind_entry(struct unwind_entry *entry, void *arg)
 {
-	unsigned long *cnt = (unsigned long *) arg;
+	struct unwind_test_data *data = arg;
+	unsigned long *cnt = &data->cnt;
 	char *symbol = entry->ms.sym ? entry->ms.sym->name : NULL;
 	static const char *funcs[MAX_STACK] = {
 		"test__arch_unwind_sample",
@@ -85,16 +115,26 @@ static int unwind_entry(struct unwind_entry *entry, void *arg)
 		return -1;
 	}
 
-	(*cnt)++;
+	if (*cnt >= data->nr || entry->ip != data->ips[*cnt] ||
+	    !RC_CHK_EQUAL(entry->ms.map, data->maps[*cnt])) {
+		pr_debug("failed: unwinding with symbols changed the callchain\n");
+		return -1;
+	}
+
 	pr_debug("got: %s 0x%" PRIx64 ", expecting %s\n",
 		 symbol, entry->ip, funcs[idx]);
-	return strcmp((const char *) symbol, funcs[idx]);
+	if (strcmp(symbol, funcs[idx]))
+		return -1;
+	(*cnt)++;
+	return 0;
 }
 
 NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__thread(struct thread *thread)
 {
 	struct perf_sample sample;
-	unsigned long cnt = 0;
+	struct unwind_test_data data = {
+		.check_unloaded = callchain_param.order == ORDER_CALLER,
+	};
 	int err = -1;
 
 	perf_sample__init(&sample, /*all=*/true);
@@ -103,17 +143,32 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__thread(struct thread *thr
 		goto out;
 	}
 
-	err = unwind__get_entries(unwind_entry, &cnt, thread,
-				  &sample, MAX_STACK, false);
+	/* Resolve maps first so symbol loading cannot hide a regression. */
+	err = unwind__get_entries(unwind_entry_maps, &data, thread,
+				  &sample, MAX_STACK, /*symbols=*/false,
+				  /*best_effort=*/false);
+	if (err || data.cnt != MAX_STACK) {
+		pr_debug("unwind without symbols failed\n");
+		err = -1;
+		goto out;
+	}
+
+	data.nr = data.cnt;
+	data.cnt = 0;
+	err = unwind__get_entries(unwind_entry, &data, thread,
+				  &sample, MAX_STACK, /*symbols=*/true,
+				  /*best_effort=*/false);
 	if (err)
 		pr_debug("unwind failed\n");
-	else if (cnt != MAX_STACK) {
+	else if (data.cnt != MAX_STACK) {
 		pr_debug("got wrong number of stack entries %lu != %d\n",
-			 cnt, MAX_STACK);
+			 data.cnt, MAX_STACK);
 		err = -1;
 	}
 
  out:
+	for (unsigned long i = 0; i < MAX_STACK; i++)
+		map__put(data.maps[i]);
 	zfree(&sample.user_stack.data);
 	zfree(&sample.user_regs->regs);
 	perf_sample__exit(&sample);
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
index 63a5c2253174..bc6b8fd40110 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -73,11 +73,17 @@ static int __report_module(struct addr_location *al, u64 ip,
 	Dwfl_Module *mod;
 	struct dso *dso = NULL;
 	Dwarf_Addr base;
+
 	/*
-	 * Some callers will use al->sym, so we can't just use the
-	 * cheaper thread__find_map() here.
+	 * Callers that want symbols will use al->sym. Loading the symbols
+	 * also finds the DSO's build-id and any separate debuginfo, which
+	 * are needed below and by __find_debuginfo(), so look for those
+	 * without loading the symbols when they aren't wanted.
 	 */
-	thread__find_symbol(ui->thread, PERF_RECORD_MISC_USER, ip, al);
+	if (ui->symbols)
+		thread__find_symbol(ui->thread, PERF_RECORD_MISC_USER, ip, al);
+	else
+		thread__find_map(ui->thread, PERF_RECORD_MISC_USER, ip, al);
 
 	if (al->map)
 		dso = map__dso(al->map);
@@ -85,6 +91,9 @@ static int __report_module(struct addr_location *al, u64 ip,
 	if (!dso)
 		return 0;
 
+	if (!ui->symbols)
+		dso__load_symsrc(dso);
+
 	/*
 	 * The generated JIT DSO files only map the code segment without
 	 * ELF headers.  Since JIT codes used to be packed in a memory
@@ -361,6 +370,7 @@ int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data,
 			int max_stack,
+			bool symbols,
 			bool best_effort)
 {
 	struct maps *maps = thread__maps(thread);
@@ -389,6 +399,7 @@ int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
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
index 73d191ce51a5..3c5acc052715 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -589,14 +589,26 @@ void unwind__finish_access(struct maps *maps)
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
+	if (symbols) {
+		thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
+	} else {
+		/*
+		 * Still find the DSO's separate debuginfo, which loading
+		 * the symbols would have, for read_unwind_spec_debug_frame().
+		 */
+		thread__find_map(thread, PERF_RECORD_MISC_USER, ip, &al);
+		if (al.map)
+			dso__load_symsrc(map__dso(al.map));
+	}
+	e.ms.sym = al.sym;
 	e.ip     = ip;
 	e.ms.map = al.map;
 	e.ms.thread = thread__get(al.thread);
@@ -614,7 +626,7 @@ static int entry(uint64_t ip, struct thread *thread, unwind_entry_cb_t cb, void
 int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			 struct thread *thread,
 			 struct perf_sample *sample, int max_stack,
-			 bool best_effort)
+			 bool symbols, bool best_effort)
 {
 	struct unwind_info *ui;
 	uint64_t first_ip;
@@ -640,7 +652,7 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 
 	if (max_stack == 1) {
 		/* Special case for a single entry. */
-		ret = entry(first_ip, thread, cb, arg);
+		ret = entry(first_ip, thread, symbols, cb, arg);
 		return ret ? (ret == -ENOMEM ? -ENOMEM : 0) : 1;
 	}
 
@@ -662,7 +674,7 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
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

