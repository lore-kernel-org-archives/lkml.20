Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC973546E9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161096; cv=none; b=uYStcWGfS7VXOlzES37ONweW0fafhK4k55c61j7Z79b8mtFrpVt2h8z0/LE1XumCKG3UCsJ0XsF/LQO9DpMf+uLCTDAR+7nXRmigF8NYjFz5zdj2McN/CLi/QCbpMTTM4TaNpBuBHpzT5wbj8RIc1ZnYGyQjyviuNIdAdkvgI0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161096; c=relaxed/simple;
	bh=43A/2CJy6ggbOm3PEnyg7zU7TDmnSOnlu2qSsR8Nh5I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BEQgcTFSZ7w1LnGeQn3CEShGX85XdygZ2ThCoQMzXUiPJjHhRbT1u1vNauCmZZpSvWyFYpKcWtTNXoIfV5F8AXOWGnuXxZDWT+MxBxpOL7wpJOqboRC9BIN+qTYiOhf3hKuPoiksmQh7yDh0xyCUvRVYyRsED73LxNoQoqYQ26s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdjFgb1e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdjFgb1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B281F000C5;
	Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=DMCsw3FAMPNMuvbR0vRBTb3l9HTmHRDzJtXgs2YGeRE=;
	h=Date:From:To:Cc:Subject:References;
	b=XdjFgb1eQqq3hXya81YvjiHRDefthzq4QbJX+g2CnuNx4R32Qz58MuQGSDbeHuk/t
	 Bge4F0EVfl/azwPdw9H49ZRAS7iq7GY+YcQvKSNzVUIRIg+jUhNrsOBfKwxWbG7weY
	 2F9W8p1+HPI05Y4Q7+iqGXLoKBi/TI8K4COGiHZqHaq/pMBWr+c37LicF151rZpbsj
	 ZtUZySWYbgxV6gzAEYxnSwKH7PxCP9rFkHhIbMOoQlgN1mVK8gibKBoeNqk8PjRNnb
	 exLE7f6jEDZe5Pp0gZTPFLWUgGhhRfWWiNiQKd+Vta2wdyeRhyw6OV8zJm/FARGPd+
	 heo6qOQNfVO1g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy6-00000000Xi2-3dc6;
	Fri, 16 Oct 2026 10:31:34 -0400
Message-ID: <20261016143134.669619155@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:18 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 03/18] tracing: Remove duplicate declaration of ftrace_set_clr_event()
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

The function is also declared in include/linux/trace_events.h which is
even included from kernel/trace/trace.h.

Having two declarations creates churn when changing the signature.

Remove the unnecessary, duplicate declaration.

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-2-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 0af2b32619d5..e05216479913 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -2290,7 +2290,6 @@ static inline const char *get_syscall_name(int syscall)
 void trace_event_init(void);
 void trace_event_update_all(struct trace_eval_map **map, int len, struct module *mod);
 /* Used from boot time tracer */
-extern int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set);
 extern int trigger_process_regex(struct trace_event_file *file, char *buff);
 #else
 static inline void __init trace_event_init(void) { }
-- 
2.53.0
