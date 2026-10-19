Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437841;
	b=Bo/7l07CRb2RB27Z+P0PWNt6Kk27HFMXjkbgeAc67zktVNAO55l1giePW6nZ3VO93F/T
	 YOgnGzMgaXOwNIvLUr0cRM3jmhXaUyluJU00aHTu0cVnNJynkQivgzHd1qadF3wIB4Gbt
	 K8CyEdHks4NDbkDT42ZSZJZzoBcorwbyYUor/Y+cIIg4sy6wQIrfbOZPoRN8qJTOLEgAS
	 keP/J5o8V62QRxa50JNGoBYUHwcbXRwIXDUuAHLLwfUmQ+kLjysNGTgn0iGIodTj2CAsj
	 8MlIFjAQURtj21TcRbhaTUVRwSx3NtmcseZ4Xe09zd/Nd4n/EeAfyma2GMZYUuso8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437841;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=1l+NSDEg0mbWnKD0TVkI/2jP7dHYzJ01A+CqdGtXGZU=;
	b=tfKbRiPdzO9qREXhbz4r/FUOJh0nsDWff79Gt2NK9ryIL5pbJCxSWhpSjsAq2It30eBN
	 7M0BJaHkT/FtuNCtElAp1iEhn4IJLDOAiQ3VwNazCETH4HmbqcJqHuhHyfrjAORpJPKMW
	 4Msq/+0bs3pU8nCdA+6amQVK/5mrWW+hmmVRMDGaqOodtwMK8WkRvfVVbrZKQsyWguEXo
	 AIf3pjOysK/x6RO98NzTNjCH7Kk9Mkm3hPtKxzuClowLOUrjCa6XrWrAyGiYL/fKb51zx
	 KsJw5xXbTaDakv//1dryFK2IYso4gwTLoKkAiLyvr8oZT8yGel/yBXjLrxFDGTZLLag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E64TtYGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66E606A333
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E64TtYGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319E41F000C6;
	Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437841;
	bh=1l+NSDEg0mbWnKD0TVkI/2jP7dHYzJ01A+CqdGtXGZU=;
	h=Date:From:To:Cc:Subject:References;
	b=E64TtYGgKOgxinn7FKKWuLjYsCWx5XOGeoKPmXgYD0di4XW13glQAIV2q5O6o+J56
	 6ETIcWml0uIjHRzd4YWRgWUt2F/gGEpIkVeT3sWOPyjxCNUr9pI2MHXxe8cPYPLnpM
	 yX9XWk6ZYOGkuP9DJPn72wi7/OEwZvacG9epTe6F1fDm1aOx9OPK2VJroL+Q/xro9d
	 Y+ecswfdKVOkUuC7Zf9zc8vqAfVshS0YIAYSrkkkofCJqZy9adOr9ICxlH+I0ffMqA
	 Yr2NFWOAvF9gnqWD5yR5zAhhgMjTIDJVi/78kHL4ZyJ+R5Swgm0+BhkVQB0YGHHSMC
	 BHIvKwM3kMYAQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxk-00000001eI6-1Vvx;
	Mon, 19 Oct 2026 15:24:00 -0400
Message-ID: <20261019192400.157640772@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:50 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yun Zhou <yun.zhou@windriver.com>
Subject: [for-next][PATCH 6/9] ftrace: Add max field to function profiler stats
References: <20261019192344.004592683@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Yun Zhou <yun.zhou@windriver.com>

The function profiler (trace_stat/function<cpu>) reports Hit, Time,
Avg and s^2 per function. Add a "max" field recording the maximum
single-call duration, which is valuable for real-time tuning and for
investigating occasional latency spikes.

Like Time/Avg, it honors the graph-time and sleep-time options, so it
reflects entry-to-return wall-clock latency.

Link: https://patch.msgid.link/20260924030108.2673654-1-yun.zhou@windriver.com
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 673a54fdf392..98535f5533db 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -428,6 +428,7 @@ struct ftrace_profile {
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	unsigned long long		time;
 	unsigned long long		time_squared;
+	unsigned long long		time_max;
 #endif
 };
 
@@ -530,9 +531,9 @@ static int function_stat_headers(struct seq_file *m)
 {
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	seq_puts(m, "  Function                               "
-		 "Hit    Time            Avg             s^2\n"
+		 "Hit    Time            Avg             s^2             max\n"
 		    "  --------                               "
-		 "---    ----            ---             ---\n");
+		 "---    ----            ---             ---             ---\n");
 #else
 	seq_puts(m, "  Function                               Hit\n"
 		    "  --------                               ---\n");
@@ -613,6 +614,8 @@ static int function_stat_show(struct seq_file *m, void *v)
 	trace_print_graph_duration(avg, &s);
 	trace_seq_puts(&s, "    ");
 	trace_print_graph_duration(stddev, &s);
+	trace_seq_puts(&s, "    ");
+	trace_print_graph_duration(rec->time_max, &s);
 	trace_print_seq(m, &s);
 #endif
 	seq_putc(m, '\n');
@@ -920,6 +923,8 @@ static void profile_graph_return(struct ftrace_graph_ret *trace,
 	if (rec) {
 		rec->time += calltime;
 		rec->time_squared += calltime * calltime;
+		if (calltime > rec->time_max)
+			rec->time_max = calltime;
 	}
 }
 
-- 
2.53.0
