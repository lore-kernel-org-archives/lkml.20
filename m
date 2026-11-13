Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599805;
	b=03VFQScbChSrIFaTS+yCWZhdVP16yRg0219S1IwRfFCJkrKm5YRh7D8oDsNBHuVunfRl
	 ToRpTdiKPWteOtc4IzrGV6sRq3Cbl3s3xCmfccy5lcsm1i/R4fpxSy5B1qyImQ6ec8+QE
	 E2VuxgkKdmc3J7XTO/q/KLUN2Tu45Apk9HIGQTbIuX0Y0e3UYbdjko1PJAo+8GphpE7Mm
	 hbn2B/5Pwy6C93g9Pc2/CxVB19HZ1RoTmDI9z3cZc4ZRTjYTsG5ZdKAuRwAgQr0p43kr6
	 P/CO1sDDE/ID/ipH2CPIDhOhUaJrFI5dchARAmwXTw417GAjWhjEYkyV21iz3RxGhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=alUsT6tB8c3WBQ6I+4BYYZdSGxCj/aXdWbdqfV5rbso=;
	b=CWEjlJQcZewuMob8KqmKZ4KGjiQwRaT7ftTrnNNovZfQCllonFv7Q9JzeEpaEk1Da9gw
	 tJOwOLHqUMz1QBiG+S65Mf62hxO1cULE7SzhMnv88zup7c2xwQh/2FJ6zCa0JFKDKxzv4
	 O1HIRHpT2OrRtvePuAVWqMwVL7YWC6l4ErJSd86Rqc/tGEzplEBbL09ecUMVm/2+889yi
	 iFPNJQ27hzWReSeOkxX0+sZnPkusmnL3XMiGrObdifaVuXToq7dQiDMzaFyJyD8DBbyyn
	 6I7rSFaERjzjwed5keD0sLSEGa5JZDbv2yPU1Y/50V+Jtc3ygSFj6agbFz12nDZfEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSnl+4Gr;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF3607044C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AF3607044C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSnl+4Gr
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b29df78132so516278c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599804; x=1795204604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alUsT6tB8c3WBQ6I+4BYYZdSGxCj/aXdWbdqfV5rbso=;
        b=kSnl+4Gr0OVvvjlzZ1esfhWB3IuSwrmcWnG5c/Sv9kbwm03WcrOiP1miikFRWwfn/v
         QXKpxyK8rwGsnBdt9kSGXMUso6WxpcTpCC7byJEzzRUqSMPLVT55EviymeRY5Ovt7DBD
         Zx6hPkpxwcHT/v1NK1+7LxdkOwgcLTGooeK4/d+hq16YZje5KGuJ0SK7APdXwKvXIyll
         NJduLVVgPFQTlaFXGLkFjsDBHdzBmHZzJ+4tG47MThmJ+nFCyKJcYns8jj59oEt4DBGO
         EqOMGlJzrTSaE4pK9H93u/V5ytQ2czAGdwe3/kS4naKBRa6TGTclim9pkTDQe7N4Flce
         UKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599804; x=1795204604;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alUsT6tB8c3WBQ6I+4BYYZdSGxCj/aXdWbdqfV5rbso=;
        b=gI1IN3npdMdpA1D3PyjNMtX2w98c9J2siovQDElKK49xqtkdDiLetQDSaLqkE94Wj2
         X/jm/zzG767CSaKE9IkwlfVrl8gxZMHlp170xtjO74AI0KyQwl1qwQ1AVFnDDF9W48hU
         eV/dHsPiAyBLdFBDl/yoGL7ud1+adzW80q/EqPXxHx9vXO+ki7q7acaSVsZmXOHm170e
         XP65+I597rtPKxGexTSI4z8CfE29rYgqwjnCLJScRoEU95lmy9TpyxJv3v8VEDU6glKR
         ol8bmap6/tK3/xp1PwL1qu53gzhs9EVL0rlj4ex+8pcoHtfcL+YU7ZgJ/yg5p0K1s24A
         bn1A==
X-Forwarded-Encrypted: i=1; AL+hErGKM7gtxruTkAriWuSOWjxdwW0bNStxKa6myzBR79WNJ/m1Wms3im7HTH+9ns8FdYmsDAMOTgRs0WMOYfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NCb79tx0UtE9LXm4COdyP/pneHvJJCIRji+yHXzDnHxqhwca9
	aYrnyGXOqqurUo3INYrYNlwlcocKHmGgPNNzuO9/+t2/o8pO32pjand8r0mAsziI3ZQkHwMpOVM
	EBk4K4EAqZg==
X-Received: from dlbsn7.prod.google.com ([2002:a05:7022:b907:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:205b:20b0:1b3:ad63:b9c2
 with SMTP id a92af1059eb24-1b5030f8819mr3223017c88.22.1794599803740; Fri, 13
 Nov 2026 11:56:43 -0800 (PST)
Date: Fri, 13 Nov 2026 11:56:00 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-16-irogers@google.com>
Subject: [PATCH v2 15/16] perf docs: Add perf-sysinfo man page
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the 'perf sysinfo' subcommand and its options in
Documentation/perf-sysinfo.txt and link it from Documentation/perf.txt.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-sysinfo.txt | 113 ++++++++++++++++++++++
 tools/perf/Documentation/perf.txt         |   2 +-
 2 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/Documentation/perf-sysinfo.txt

diff --git a/tools/perf/Documentation/perf-sysinfo.txt b/tools/perf/Documentation/perf-sysinfo.txt
new file mode 100644
index 000000000000..c72ac6d51551
--- /dev/null
+++ b/tools/perf/Documentation/perf-sysinfo.txt
@@ -0,0 +1,113 @@
+perf-sysinfo(1)
+===============
+
+NAME
+----
+perf-sysinfo - Display and probe PMU and system performance monitoring information
+
+SYNOPSIS
+--------
+[verse]
+'perf sysinfo' [<options>] [pmu_glob ...]
+
+DESCRIPTION
+-----------
+This command displays a summary of the performance monitoring capabilities of
+the current system or a perf.data file, including core PMU features (precise
+sampling, branch stack sampling, user-space counter reading, memory profiling,
+and hardware AUX trace PMUs), memory and PCIe/IO interconnect bus bandwidth
+monitoring support, total events and metrics, pipeline metric drill-down levels
+discovered via '<metric>_group' hierarchies, and an overall system rating.
+
+When '-p'/'--pmus' is specified (or when PMU filter globs, '-v'/'--verbose',
+'-a'/'--all', or '-j'/'--json' are given), it also displays detailed
+information for each PMU, including its perf_event_attr type, kind (core,
+uncore, software, auxtrace, tool, hwmon, drm), CPUs/cpumask, capabilities,
+sysfs format bitfields, event counts, and memory profiling events.
+
+When run on a live system (without '-i'/'--input' and with probing enabled),
+it also actively probes the kernel via 'perf_event_open' to determine:
+- Supported modes (counting, interrupt-based sampling, branch_stack sampling)
+- Supported precise sampling levels, skid semantics, and empirically measured
+  branch instruction skid (minimum, maximum, average instructions from the
+  branch and 'PERF_RECORD_MISC_EXACT_IP' ratio) at each supported precision
+  level:
+  0 ('SAMPLE_IP' can have arbitrary skid), ':p' / 1 ('SAMPLE_IP' must have
+  constant skid), ':pp' / 2 ('SAMPLE_IP' requested to have 0 skid), and
+  ':ppp' / 3 ('SAMPLE_IP' must have 0 skid, or uses randomization to avoid
+  sample shadowing effects)
+- Supported 'perf_event_sample_format' sample types ('ip', 'tid', 'time',
+  'addr', 'read', 'callchain', 'id', 'cpu', 'period', 'stream_id', 'raw',
+  'branch_stack', 'regs_user', 'stack_user', 'weight', 'data_src',
+  'identifier', 'transaction', 'regs_intr', 'phys_addr', 'aux', 'cgroup',
+  'data_page_size', 'code_page_size', 'weight_struct')
+- Supported user and interrupt registers for 'PERF_SAMPLE_REGS_USER' and
+  'PERF_SAMPLE_REGS_INTR', listing separately the interrupt registers that
+  can only be sampled with precise sampling (e.g. x86 XMM registers captured
+  by PEBS)
+- Supported memory profiling events ('ldlat-loads', 'ldlat-stores', 'mem-ldst')
+  and their supported memory sample types ('data_src', 'addr', 'weight', etc.)
+- Supported privilege/exclusion modifiers ('exclude_user', 'exclude_kernel',
+  'exclude_hv', 'exclude_idle', 'exclude_host', 'exclude_guest')
+- Supported execution features ('leader_sampling', 'sw_grouping', 'inherit',
+  'sample_freq', 'write_backward', 'callchain', 'data_src', 'weight',
+  'pinned', 'exclusive', 'format_lost', 'auto_counter_reload',
+  'aux_start_paused', 'aux_pause', 'aux_resume', 'aux_sample', 'user_rdpmc',
+  'user_time', 'user_time_zero', 'user_time_short') and hardware counter
+  bit-width ('pmc_width') when user-space counter reading is supported
+- Maximum number of events in a group counted simultaneously, without
+  multiplexing, and for core PMUs the maximum number of general-purpose
+  counter events. Groups larger than this may be accepted by
+  'perf_event_open' but can't be counted together
+
+At the end of the text output, a summary section reports overall core PMU
+capabilities (including hardware AUX trace PMUs), memory and PCIe/IO
+interconnect bus bandwidth monitoring support, total events and metrics, and
+pipeline metric drill-down levels discovered via '<metric>_group' hierarchies.
+
+By default, numbered uncore PMU instances sharing a common prefix are collapsed
+into a single entry showing the instance count, unless '-v'/'--verbose' is
+specified.
+
+OPTIONS
+-------
+-i::
+--input=::
+	Input file name to read PMU information from (e.g. perf.data).
+
+-f::
+--force::
+	Don't complain, do it (when reading input perf.data file).
+
+-o::
+--output=::
+	Output file name.
+
+-p::
+--pmus::
+	Display detailed information for each PMU in addition to the system
+	summary.
+
+-j::
+--json::
+	Encode PMU information as JSON.
+
+-a::
+--all::
+-v::
+--verbose::
+	Display all PMUs including all similar PMUs with alphanumeric suffixes
+	instead of collapsing numbered uncore PMU instances.
+
+--probe::
+--no-probe::
+	Enable or disable active kernel probing of PMU capabilities on the live
+	system (default: enabled).
+
+--debug::
+	Enable debugging output.
+
+SEE ALSO
+--------
+linkperf:perf-list[1], linkperf:perf-evlist[1], linkperf:perf-stat[1],
+linkperf:perf-record[1]
diff --git a/tools/perf/Documentation/perf.txt b/tools/perf/Documentation/perf.txt
index cbcc2e4d557e..0890dd5a1794 100644
--- a/tools/perf/Documentation/perf.txt
+++ b/tools/perf/Documentation/perf.txt
@@ -92,5 +92,5 @@ linkperf:perf-help[1], linkperf:perf-inject[1],
 linkperf:perf-intel-pt[1], linkperf:perf-iostat[1], linkperf:perf-kallsyms[1],
 linkperf:perf-kmem[1], linkperf:perf-kvm[1], linkperf:perf-lock[1],
 linkperf:perf-mem[1], linkperf:perf-probe[1], linkperf:perf-sched[1],
-linkperf:perf-script[1], linkperf:perf-test[1],
+linkperf:perf-script[1], linkperf:perf-sysinfo[1], linkperf:perf-test[1],
 linkperf:perf-trace[1], linkperf:perf-version[1]
-- 
2.56.1.703.gf848ed807c-goog

