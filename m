Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE96374A0E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965617; cv=none; b=GUmn2qfXtAn0udkQ7cP7zzDN7JAIsy84JYabOz9iKRFgTE98DWTN88jGVYT3yanG7NY5BEUWS1OibezLE7qojZ6Q831dr5kNMs0eJ7qgwOTVVbikMgV/xHpjH8Mg8HKOysrnq23//T/RqthX79+Q0xn4UowZikD2ooUmCACRRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965617; c=relaxed/simple;
	bh=g0GyOwewiKm4KFOlzqRQCAtrtf8EN3ovGx6G7yO1wy8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=HNm1dRBMH1+TmDLVqEZ5jtp55JQK//bN5Ewk/tB7o241kHcn6lDP34K78LXM8B5kCG02NGf7o0gx6Yi7YREuF1gjOQEYhJuFLuyNiZT67Mh1qPSDlz1DIUKzQxqSJ6Hriakmm6OlSxNPIAwW/ECMAHDKUz8TOXKWCJpkxp3NB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsiuOcpT; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsiuOcpT"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e676375d9so1678673eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790965614; x=1791570414; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g91waQbjvf78Q7TEpkLcmdZM/4XvXhkFKly0O9VpCVo=;
        b=jsiuOcpTmRGTrmNeh0vSibGPktk4Q+icB5/LWaZJPWreeiziKWd7cjTvY8t/W+wpKd
         F1THbjLwJ6NwCWV1JQnLE4DQzIM0TgI30Ih9h7D8FG3+3mqcPAg+L8Bfv/QvREgYUiuC
         +fBUaHDb0PS/Quoy9Alhn5tBUM8ztyxsuZp+rofuiv6ObhXSwtp3xle6teOmRCDMjSE3
         KWm2YAGeK6W2ARf3NmI0TgJ1wR0BcLDTYtS5uXpsXsF30Y93bcTS+a8IkiQ1uSrZ5qLu
         Gs5iIObwP/SMGePYokgtPeI9m9czEeRGekDQt0mVWwhempnO8HgNanDbwO7qOd1XINIT
         3hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965614; x=1791570414;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g91waQbjvf78Q7TEpkLcmdZM/4XvXhkFKly0O9VpCVo=;
        b=APrCKdueGFM091DxfZ/y4NgMwway7l2uz7J4tp472N1PVRlp1unQ8PgtS7C2e8lxiD
         prWXMX/cb6Lq2OtT/R4RoesiakYWbab7QHh4gyJ0OKr/yjL3MBjqfR+1tVAAYT+UsmPk
         hahck8nHeXfTFZBpqzznGwzzzhnv3l47oOzeq0bUCVAFzqjYvoHqA7mbLnYbE4cEr0h0
         U/1BHAIQXySBCckPagO8vyIyd6H1tmdpWOUqCDnfLSUNKZi187MLyXbSzFVzzQjdMy6j
         lS+aRf/fPD+zHITS7Nm8ODWzZxxu5vbhUKJ5M94+lean8A9NM0+KOjWTVOUNpnYihfJN
         TXtg==
X-Forwarded-Encrypted: i=1; AKwUvBxxc8bRWXkdX58P6u4vXXtoBkRvPgvNISdBnwpHKyiyC4PbHUsLsD6uLYpMgP9Iqa6mFn5BiEPV8BPQ1IU=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ1m24jZsLvQB0Qu1FOJdo8/Vmyg3CoCDbM/3zYtG84N56bUNj
	ZnYJnuRgcSDFhbQ0PUPP/j6zrGzUvLWntownIlUJZQzssCQTdVXAGziD6kyOXZqBAakq7Z1GgZN
	n2OcLxojl3w==
X-Received: from dyblf46.prod.google.com ([2002:a05:7301:a2e:b0:33c:28de:54ad])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:428a:10b0:143:f79:f662
 with SMTP id a92af1059eb24-14dce22d73emr7298591c88.1.1790965613495; Fri, 02
 Oct 2026 11:26:53 -0700 (PDT)
Date: Fri,  2 Oct 2026 11:26:15 -0700
In-Reply-To: <20261002182624.3259797-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002182624.3259797-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002182624.3259797-7-irogers@google.com>
Subject: [PATCH v1 06/13] perf list: Add a --tui option to launch ilist
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Falcon <thomas.falcon@intel.com>, 
	Alice Rogers <alice.mei.rogers@gmail.com>, Changbin Du <changbin.du@huawei.com>, 
	Tengda Wu <wutengda@huaweicloud.com>, tanze <tanze@kylinos.cn>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a --tui option to perf list that launches the textual based ilist
script through perf script, similar to perf timechart --tui. Rather
than printing the events, the PMUs, events and metrics can be browsed
interactively and the selected event or metric is counted on each CPU.
Arguments after '--' are passed to the script.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-list.txt | 10 ++++++++
 tools/perf/builtin-list.c              | 34 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/tools/perf/Documentation/perf-list.txt b/tools/perf/Documentation/perf-list.txt
index a4378a0cd914..17e582998474 100644
--- a/tools/perf/Documentation/perf-list.txt
+++ b/tools/perf/Documentation/perf-list.txt
@@ -10,6 +10,7 @@ SYNOPSIS
 [verse]
 'perf list' [<options>]
             [hw|sw|cache|tracepoint|pmu|sdt|metric|metricgroup|event_glob]
+'perf list' --tui [-- <ilist options>]
 
 DESCRIPTION
 -----------
@@ -51,6 +52,15 @@ Output in JSON format.
 --output=::
 	Output file name. By default output is written to stdout.
 
+--tui::
+Rather than printing the events, interactively browse the PMUs, events and
+metrics in the terminal using the 'ilist' python script (see
+linkperf:perf-script[1]). Selecting an event or metric shows its description
+and counts it on each CPU. The script requires the perf python module and the
+python 'textual' library. Other options are ignored, arguments after '--' are
+passed to the script, for example 'perf list --tui -- -I 0.5' to update the
+counts every 0.5 seconds.
+
 [[EVENT_MODIFIERS]]
 EVENT MODIFIERS
 ---------------
diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
index 4118424cb364..47668d66c395 100644
--- a/tools/perf/builtin-list.c
+++ b/tools/perf/builtin-list.c
@@ -24,8 +24,10 @@
 #include <subcmd/parse-options.h>
 #include <linux/zalloc.h>
 #include <ctype.h>
+#include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
+#include <stdlib.h>
 
 /**
  * struct print_state - State and configuration passed to the default_print
@@ -538,6 +540,31 @@ static bool default_skip_duplicate_pmus(void *ps)
 	return !print_state->long_desc;
 }
 
+/*
+ * Launch the interactive textual based ilist python script via 'perf script'
+ * that finds the script and sets up the python environment. Arguments are
+ * passed to the script.
+ */
+static int list__tui(int argc, const char **argv)
+{
+	const char **script_argv;
+	int script_argc = 0, ret;
+
+	script_argv = calloc(argc + 4, sizeof(*script_argv));
+	if (!script_argv)
+		return -ENOMEM;
+
+	script_argv[script_argc++] = "script";
+	script_argv[script_argc++] = "ilist";
+	script_argv[script_argc++] = "--";
+	for (int i = 0; i < argc; i++)
+		script_argv[script_argc++] = argv[i];
+
+	ret = cmd_script(script_argc, script_argv);
+	free(script_argv);
+	return ret;
+}
+
 int cmd_list(int argc, const char **argv)
 {
 	int i, ret = 0;
@@ -562,6 +589,7 @@ int cmd_list(int argc, const char **argv)
 	const char *unit_name = NULL;
 	const char *output_path = NULL;
 	bool json = false;
+	bool use_tui = false;
 	struct option list_options[] = {
 		OPT_BOOLEAN(0, "raw-dump", &default_ps.name_only, "Dump raw events"),
 		OPT_BOOLEAN('j', "json", &json, "JSON encode events and metrics"),
@@ -578,6 +606,8 @@ int cmd_list(int argc, const char **argv)
 			   "Limit PMU or metric printing to the given PMU (e.g. cpu, core or atom)."),
 		OPT_STRING(0, "unit", &unit_name, "PMU name",
 			   "Limit PMU or metric printing to the specified PMU."),
+		OPT_BOOLEAN(0, "tui", &use_tui,
+			    "Interactively browse and count events and metrics with ilist"),
 		OPT_INCR(0, "debug", &verbose,
 			     "Enable debugging output"),
 		OPT_END()
@@ -588,6 +618,7 @@ int cmd_list(int argc, const char **argv)
 #else
 		"perf list [<options>] [hw|sw|cache|tracepoint|pmu|sdt|metric|metricgroup|event_glob]",
 #endif
+		"perf list --tui [-- <ilist options>]",
 		NULL
 	};
 
@@ -598,6 +629,9 @@ int cmd_list(int argc, const char **argv)
 	argc = parse_options(argc, argv, list_options, list_usage,
 			     PARSE_OPT_STOP_AT_NON_OPTION);
 
+	if (use_tui)
+		return list__tui(argc, argv);
+
 	if (json)
 		ps = &json_ps.common;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

