Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437840;
	b=Xzs06L5du2Ore705nDxtHH2Bo230rIqQwf0ZQyH8xcWpd124tObOIkHjvpnIc+2jWHcV
	 w3xTYzvZQWN6375VxZ1B3QqsMBxI7im12TUlVFswubjUmBdA6WUp3r3kc8QIE/K9np8TP
	 xWGaKZbbJBmhfr8AI8HYweEtoIoxNWurV7oa/2MnPgTdC7qogbWZPNU5Vnu1p0tTxli/w
	 55ejxOHpGgiTkfUmZXETse6feu2kbKz8/KoXTeXFkKYqSEqepkzbXJiE9sNo22ou9/9su
	 GtLuotT/EecGVVrOphdunXgWZvxKqa2wf0wBTbNhOKsRDBGpdzlcbFL8wUpv3LCzL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437840;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=459kuKB1b+17lJ4lns0LLD9p6b/pQluJod5IZf8SiR4=;
	b=gInt8kUi76Mcfr5xJaM4MoLnQrV74Y08MeKRblW5uO/AvdPLBrULvY71NIwg0L00bFFH
	 XcDhuNgEZLcPtMrqN/ZMEG+sOwweSH2dLP0DArqIHC1UsinVKJYjoF82xGtDtPYYfpoe7
	 EYcpnaws6sHgdkJorRaGFSEtkR3dujiaW0FVlUXHX+obVg1xZHbfd4/Cjjwwk7IvqFwuA
	 /0Y2XgvTY/DpSy9cm49mt9OzHUQ5zD74rgh2kfDBCdRCA+cpgV+qiYtX5U0WdPeWR9+jP
	 RgfqD6TwUPbIYKatvdLkyRx88FD+SreC1GA7UkteBQHk+OtrundZFX53hUBXscUxTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOff1bBM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A511606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOff1bBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8EF1F000C5;
	Mon, 19 Oct 2026 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437840;
	bh=459kuKB1b+17lJ4lns0LLD9p6b/pQluJod5IZf8SiR4=;
	h=Date:From:To:Cc:Subject:References;
	b=FOff1bBMYaUgNqlPu8w2wkbIR0z8Z24SXbFfiZ8p06lT3oFVNfBFBqJezsG7poKE7
	 p+kXX3b1lefMeyZHDZ9/Ip9daC3Pw0j/Ks057BcD04rH+pUKoqcAH+lPnLj6P2nwpI
	 0tjGh6wCfzS+/VZUvtGGKaAyQExicvxuzlyNocv0+dEYb9ZpeAQ7cLjvKVJAaZ6Kg8
	 zw3zCvqiInWNhi9/HwfuBYLczRN0MVJeW783gTd/lY+tMJmSRDhcvbQasExFMOvg2v
	 1hQzA8GuOEz4QOdReU3HI3iRVnfd7m5VOwA/BECAw7kOEB3QCSGdV7Q8uIMWQmbZlN
	 RHqxRmczBj2vQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxj-00000001eFK-1GvS;
	Mon, 19 Oct 2026 15:23:59 -0400
Message-ID: <20261019192359.110757402@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:45 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 1/9] ftrace: Have stacktrace option work with func-args
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

From: Steven Rostedt <rostedt@goodmis.org>

When both the func_stack_trace option is enabled first, the func-args
option can not be enabled. Same if the func-args option is enabled first,
the func_stack_trace option can not be enabled.

Allow the two to work together. The stack trace is already slow and
testing the current tracer flags should be in the noise of overhead.

Link: https://patch.msgid.link/20260825191036.11b19036@gandalf.local.home
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_functions.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index c879d43a5fbb..acaba990aaaa 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -121,6 +121,7 @@ static ftrace_func_t select_trace_function(u32 flags_val)
 	case TRACE_FUNC_OPT_ARGS:
 		return function_args_trace_call;
 	case TRACE_FUNC_OPT_STACK:
+	case TRACE_FUNC_OPT_STACK | TRACE_FUNC_OPT_ARGS:
 		return function_stack_trace_call;
 	case TRACE_FUNC_OPT_NO_REPEATS:
 		return function_no_repeats_trace_call;
@@ -295,7 +296,9 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
 
 	if (likely(disabled == 1)) {
 		trace_ctx = tracing_gen_ctx_flags(flags);
-		trace_function(tr, ip, parent_ip, trace_ctx, NULL);
+		if (!(tr->current_trace_flags->val & TRACE_FUNC_OPT_ARGS))
+			fregs = NULL;
+		trace_function(tr, ip, parent_ip, trace_ctx, fregs);
 #ifdef CONFIG_UNWINDER_FRAME_POINTER
 		if (ftrace_pids_enabled(op))
 			skip++;
-- 
2.53.0
