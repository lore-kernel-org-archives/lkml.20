Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777596;
	b=1uCWgdvaRw9zUV6Cn3FetMKwfEH26H9dsp1AeZ6nNnGEmpFnwXcBynQ9lYBeYpryYUH/
	 VJvSgutJqzCPwV25UyOuXP4ZblCIoqV45lR0xeoyaS7/jGy7ydAtb/iLR932pc5kW7LYF
	 gUhTc3s7+C4rWq2vqdLQDSsjT4HXGpBfNBxweIzz75S5toZQ0/5AI13gr2uTQh1LY2qu0
	 muF19uzDdP963nJhmWD9voC7A0ndrXSflV5PAFoyBmyjPZfzv1I870aEx5BpCmU7/aus7
	 htD+Vu9bcZkgmK8sOCh4J3RNL+Zznir6gzmvZ03hgbVyJcH7PbkxevAa7WK3cNVyRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xlzj9+7VUiD0rDPjj9xsdhl6VeuEJi64iOeLJzH8Fak=;
	b=vWp5R0Su2G08jyxPLLXlLE+m1SGLLpBAMR2VxoeZsYcl8F52adpXvodwixXphCa8eAFH
	 nNXTjSfxv1evVvml+pi1PVd6xBBCSIVzFbA8IpSqPdwoSU3f1hUKxauSHgTfYcWKth4Mo
	 OPGecji77d4tq1RqQwp5KVuccpguB40L8SlEbuuz/zYq6qRytjhFwCG6S7rgkBxGYDWQ6
	 XRDJwNmxUeYyY3bBfcKVZLngp9fMzzEpi8Xl/bPqz7+oH8aHjXgYc1umibSVtf+MS+0rh
	 giuJsW3pRq70GtXUbyeIP6hhYCafYEIrQ/XdwVJbpyvTwQzIcMtNVdX1h/bTS2zK2Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=YxiS9C1Q;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C42F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=YxiS9C1Q
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6f74f6b46abso564458eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792777595; x=1793382395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlzj9+7VUiD0rDPjj9xsdhl6VeuEJi64iOeLJzH8Fak=;
        b=YxiS9C1QOQiQj62KnEdVaa4HjaEBExW5bp5Ol+/YPk+f2I+3STcUEaRI1aixJFSIVQ
         foZtdo93KcXjp+UKIWW7nmoC0ZCH4CyhqCW+I/QewtnJZBg1/bONh7uFQO3PyIDaFftP
         Cul9W/M1VUsKfdYKyQllyYvirVbrAe3fb5DeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777595; x=1793382395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlzj9+7VUiD0rDPjj9xsdhl6VeuEJi64iOeLJzH8Fak=;
        b=q0UBRBpg24s53Ge0J6b7RxdnJIfO8EOCo3TBt7uZmQnyPN6N52sJJSUYnvrL6zt+Rg
         RJrqdaM1F1BpWI5n5Zi3R0Q11YtAW6s20p9djgBPa9a+pDo6Jtqwi/ihnCUHkFqYxwbo
         8sl8Q7/t8qA0QrDw1EBp+CLC/Y5M7yE3Xwytf1zPrxT1+P8eIAUmpmG2L5VPFhMZH2TI
         egEiTYqu51ekkkhhHadMfHCJBifstVOlys9M+pMJQndpGSc845e8HoVuDIg3D1VG467b
         llveHtcIZnoQQo+6MUCFAz8/mWhCp1JBq5n0wjvw7zY4tSxq3tb2uZSUBWvzDDQ4ayWP
         Mpkw==
X-Gm-Message-State: AFq9FYLWIEqAS9Te8jjrQXSzGEeCh2HxvIilPfCkHQh40Q5l78rsTZ0e
	xdaUpdKXDBQUfC5P0iL4KItPAvIJ97aB+BHMaJzXcMxQN/4G5jUW7+LDnxwctOysL1o=
X-Gm-Gg: AYBFou23SqbTKNA7DAmR1r259G3McRUzVHS1jAlH+kwzbniNlAXNsB7QJT3++675htU
	PotfJa0fWtl/VtmA7xhYYX9Ium8Z6XGKcm5KYTRIjSGXYM2Td5ziedd+LspDXcIavsEO7kTm3gl
	UfUR4R41GyEIQA6pWdOEVPllXow7eUh4oJp8NfHEJRAOisDD+Z5MVcR0WFQ87rkQGX0C4DliAdt
	onT2y843rKwQQa0H60T+tEGz69CYOlfgn5iFGUTK2FEL6Zkua88MghfpDo0fzbhY2Pbnh3bSxW7
	M82UJdztLuZEcUFTOv6U4S3jJdf0rfdRgG9w6cm44t9qv/JSSAl9+564bR0lvhZxZsgmoRRzrzo
	Cv3aOYpqW4Nnrzf3k6JZGmQcYdWrnyGiJiq0Cxdshbk2QyHJpv8tORbtQ0D0BmClERygVvjUP2O
	pclbG19jRsfr2Myr2e9lmncimHXPgC8y5r+DWq+FN/ikL9ZOQux4JCECuFirleCrtQzS/057g5Y
	zerR+slxKZdpZuklAGw6XjKryToPgOZPsp3QdJoJHMvPmaNgxVz1lCq2wLjbEf5T0jZ0hW0zPJE
	+Tfc50SJKkmNDEztQ+AMHNlpisiccRO1jc4Quhekn/m8ZexWWrDnclnZvw==
X-Received: by 2002:a05:6820:2215:b0:70b:980e:454 with SMTP id 006d021491bc7-70b980e054bmr960802eaf.6.1792777595042;
        Fri, 23 Oct 2026 10:46:35 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aec6172sm565349eaf.11.2026.10.23.10.46.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 10:46:34 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Reject incomplete event filter expressions
Date: Fri, 23 Oct 2026 10:46:20 -0700
Message-ID: <20261023174620.91969-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

A non-empty expression normally finishes in predicate_parse()'s inner
loop, which resolves the pending logical operators before jumping to
finalization. If the input ends after an operator, possibly followed by
unary '!' tokens, the outer loop instead falls through with unresolved
operator state.

For example, "common_pid == 1 || common_pid == 2 &&" leaves
prog[0].target equal to -1. The second pass then reads prog[-1] before
the forward-jump check can reject it. Depending on adjacent slab
contents, it can also copy an out-of-bounds word into a branch target
that passes the forward-only check. A self-targeted perf tracepoint
counting event can reach this path through PERF_EVENT_IOC_SET_FILTER.

Reject the outer-loop fallthrough when a predicate has already been
parsed. This ensures that non-empty expressions only reach finalization
after the inner loop has resolved their operators. Keep the existing
no-filter error for input that has no predicates. Add a regression test
for trailing logical operators and unary negations.

Fixes: 80765597bc587 ("tracing: Rewrite filter logic to be simpler and faster")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/trace/trace_events_filter.c            |  6 +++++
 .../test.d/filter/event-filter-incomplete.tc  | 24 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/filter/event-filter-incomplete.tc

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2b46ca536045..405651be9c93 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -596,6 +596,12 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 			top--;					/* #12 */
 		}
 	}
+	/* Only the inner loop can complete a non-empty expression. */
+	if (N) {
+		ret = -EINVAL;
+		parse_error(pe, FILT_ERR_INVALID_FILTER, ptr - str);
+		goto out_free;
+	}
  out:
 	if (top != op_stack) {
 		/* Too many '(' */
diff --git a/tools/testing/selftests/ftrace/test.d/filter/event-filter-incomplete.tc b/tools/testing/selftests/ftrace/test.d/filter/event-filter-incomplete.tc
new file mode 100644
index 000000000000..cc6df762845f
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/filter/event-filter-incomplete.tc
@@ -0,0 +1,24 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: event filter - reject incomplete logical expressions
+# requires: events/sched/sched_switch/filter
+# flags: instance
+
+filter=events/sched/sched_switch/filter
+
+for base in \
+    'common_pid == 1' \
+    'common_pid == 1 || common_pid == 2' \
+    'common_pid == 1 && common_pid == 2' \
+    '!(common_pid == 1 || common_pid == 2)'
+do
+    printf '%s' "$base" > "$filter"
+    for tail in '&&' '||' '&& !' '|| !' '&& !! ' '|| !! '; do
+        if printf '%s' "$base $tail" > "$filter" 2>/dev/null; then
+            echo "Accepted incomplete filter: $base $tail"
+            exit_fail
+        fi
+    done
+done
+
+echo 0 > "$filter"

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
