Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421044AA014
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364155; cv=none; b=fziiJjMwLOTjnA1sgqNIxlm+OuYATSY4uEAl5mB3NzK8SV92xxm1b7uz0YnijjM3q/VrgfQfcJMwG6bjMXmw4AZ+VwdepXXlHhXM9V9PjVLBUlLF0YjUtb45xzsOlSaKzPOsOq0JyNNppIoYwwuD+uiopR9r4Bmv4dQR8B0pV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364155; c=relaxed/simple;
	bh=hcb+YsYktGD5DAT9O/TDu5c3+MGTfAHeFGUSy/g2LNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Ie8EbziVOUQijXA1G626Zy4o+206BwZDn4QhcqwUecFYBd/PpTm3RZ6+hO/jMDWfsTtcLxKFbJBuBOGicWiVE3bMKSXBKmxyLwVmJx6bigqtWQuRd4BQvGmnz6Hox/Qme7/jvWjz/eIZABgRSODQRLXvKZA1qJbdb05CmqiKZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9Ab7Jex; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9Ab7Jex"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so2943102a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788364152; x=1788968952; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDA7hQcC28A9PrfAF9PzfBXNfTQslOisMIggbz4Lwoc=;
        b=D9Ab7JexvAClT5ihXA1mVbn/UnLd7YLVsrc3SpA+iING8+FHs6atajArs86+SEGrJM
         nT7tFh6s600aCcOmHVe4Tv7R/xk86+Nmlz+rEAeM3MY6r6kfcqzaETz/089pmqhci0kh
         Calh9RRcMHDnAQrr7qp64Aba0qkmS4wFcfSHVOQ/m0bq+y1G2EtKC2qZPKwKVHxv2sad
         dwmuMwe78YcMfZlIeS4r1pL35WVyD+NmTGDlFzW8Gj39iczcWi9FCxxRT5BDeo5ghHsO
         20eQIo4rx6Ja1SvOBp8cTKtlC2vou9wr8xzLqcbHPIsF/MdTBxdeNdnny807SMcFrqBj
         Fkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364152; x=1788968952;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDA7hQcC28A9PrfAF9PzfBXNfTQslOisMIggbz4Lwoc=;
        b=MufweexehpXV5E7DvXTa6ayA23oB+hoPEumdN7rvpcnwVzrqqyFKKj2h21Cv4lGKXR
         UdztjMAI/9yGbRairVTAI4lKF/D10uxKNYCmrRzuMma6BoYCZiTwywzoxbXFab++V6P+
         8mir/nQBJ3oWPYjL9vpEew5SnLv8xVuTjZ5duLHlN1G42AjsY8z7nA4vFF11l3G1BH0v
         9sC22qdbdVehqPT0KfyBaBwIMW+6TdItxGBMvSPXfr75IGi060pNP0+CySTtXktvQ2az
         TUB9jzjAVCyJUtyMU381iecPNNzrhRe5/O8YX09Q2gpTUJneN5iU6emPU2T4uXlXGR37
         Liqw==
X-Forwarded-Encrypted: i=1; AKwUvBwDvdXpUc1zV2xkd87jF3rOSY7bpCH7TyzbqiIHAiA9L3sHUvwhXsMpxToSTL3txJnlE6at5LUwA2ALJVI=@vger.kernel.org
X-Gm-Message-State: AFuF++lspyjbwX3OL4EB5SMosBrFHjUv7v6WuYl3DTB4/we8ycpll/BB
	Zbfe0hHy0CoXfcEtEKTBzeqPc2KygG9Pb9IfG+CTAsTUrfDl7IJZabLEmzbfttaR4nd24sc9y87
	cB7bXbi/tEw==
X-Received: from dlag8.prod.google.com ([2002:a05:701b:2508:b0:141:4a59:5b22])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2785:b0:398:9be5:b41e
 with SMTP id 98e67ed59e1d1-39aee285570mr9664000a91.25.1788364151428; Wed, 02
 Sep 2026 08:49:11 -0700 (PDT)
Date: Wed,  2 Sep 2026 08:48:57 -0700
In-Reply-To: <20260902154858.2078885-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902154858.2078885-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902154858.2078885-6-irogers@google.com>
Subject: [PATCH v3 5/6] perf tool: Add fallback stubs for missing dependencies
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Tianyou Li <tianyou.li@intel.com>, 
	Jiebin Sun <jiebin.sun@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Declare stubs directly inside perf.c for commands that have library
dependencies sometimes omitted at build time, such as libtraceevent
(timechart, sched, kmem, lock, trace, kwork) and libelf (probe).

By unconditionally including these commands in the commands[] array,
users will receive a clear, unified warning indicating the missing
dependency instead of the command silently being absent.

Running `perf trace` with libtraceevent missing. Before:
```
perf: 'trace' is not a perf-command. See 'perf --help'.

Did you mean this?
        ftrace
```

After:
```
'trace' command not available: missing libtraceevent devel package at build time.
```

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/perf.c | 51 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index 65bdfd71f626..6c5baa285b13 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -7,6 +7,7 @@
  * perf top, perf record, perf report, etc.) are started.
  */
 
+#include <linux/compiler.h>
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -53,6 +54,38 @@ static void __noreturn usage(const char *err)
 static int use_pager = -1;
 static FILE *debug_fp = NULL;
 
+
+#ifndef HAVE_LIBTRACEEVENT
+#define DECLARE_LIBTRACEEVENT_STUB(_cmd) \
+	int cmd_##_cmd(int argc __always_unused, const char **argv __always_unused) \
+	{ \
+		fprintf(stderr, \
+			"'" #_cmd "' command not available: missing libtraceevent " \
+			"devel package at build time.\n"); \
+		return -1; \
+	}
+
+DECLARE_LIBTRACEEVENT_STUB(timechart)
+DECLARE_LIBTRACEEVENT_STUB(sched)
+DECLARE_LIBTRACEEVENT_STUB(kmem)
+DECLARE_LIBTRACEEVENT_STUB(lock)
+DECLARE_LIBTRACEEVENT_STUB(trace)
+DECLARE_LIBTRACEEVENT_STUB(kwork)
+#endif
+
+#ifndef HAVE_LIBELF_SUPPORT
+#define DECLARE_LIBELF_SUPPORT_STUB(_cmd) \
+	int cmd_##_cmd(int argc __always_unused, const char **argv __always_unused) \
+	{ \
+		fprintf(stderr, \
+			"'" #_cmd "' command not available: missing libelf " \
+			"devel package at build time.\n"); \
+		return -1; \
+	}
+
+DECLARE_LIBELF_SUPPORT_STUB(probe)
+#endif
+
 struct cmd_struct {
 	const char *cmd;
 	int (*fn)(int, const char **);
@@ -76,36 +109,24 @@ static const struct cmd_struct commands[] = {
 	{ "report",	cmd_report,	0 },
 	{ "bench",	cmd_bench,	0 },
 	{ "stat",	cmd_stat,	0 },
-#ifdef HAVE_LIBTRACEEVENT
 	{ "timechart",	cmd_timechart,	0 },
-#endif
 	{ "top",	cmd_top,	0 },
 	{ "annotate",	cmd_annotate,	0 },
 	{ "version",	cmd_version,	0 },
 	{ "script",	cmd_script,	0 },
-#ifdef HAVE_LIBTRACEEVENT
 	{ "sched",	cmd_sched,	0 },
-#endif
-#ifdef HAVE_LIBELF_SUPPORT
 	{ "probe",	cmd_probe,	0 },
-#endif
-#ifdef HAVE_LIBTRACEEVENT
 	{ "kmem",	cmd_kmem,	0 },
 	{ "lock",	cmd_lock,	0 },
-#endif
 	{ "kvm",	cmd_kvm,	0 },
 	{ "test",	cmd_test,	0 },
-#if defined(HAVE_LIBTRACEEVENT)
 	{ "trace",	cmd_trace,	0 },
-#endif
 	{ "inject",	cmd_inject,	0 },
 	{ "mem",	cmd_mem,	0 },
 	{ "data",	cmd_data,	0 },
 	{ "ftrace",	cmd_ftrace,	0 },
 	{ "daemon",	cmd_daemon,	0 },
-#ifdef HAVE_LIBTRACEEVENT
 	{ "kwork",	cmd_kwork,	0 },
-#endif
 };
 
 struct pager_config {
@@ -514,15 +535,9 @@ int main(int argc, const char **argv)
 		argv[0] = cmd;
 	}
 	if (strstarts(cmd, "trace")) {
-#ifndef HAVE_LIBTRACEEVENT
-		fprintf(stderr,
-			"trace command not available: missing libtraceevent devel package at build time.\n");
-		goto out;
-#else
 		setup_path();
 		argv[0] = "trace";
 		return cmd_trace(argc, argv);
-#endif
 	}
 	/* Look for flags.. */
 	argv++;
-- 
2.55.0.966.g6673acef38-goog

