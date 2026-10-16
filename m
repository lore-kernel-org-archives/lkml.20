Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE838BF75
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161097; cv=none; b=qUxxJKHNlbcBVP/43XO2RZH2hN9VKS57uNYBJDK3mW/u/whpJ0pfOKbqdKmP3ZZ5nUTz7UUUMdWi+9p8pjCGY4HuJOOlySgNwQVzfzlU4vZE2EmsFf0Qr2jIh32nFB6qPSgzL6dd3tN+nP4vk3jMWHKvY3TbmGN7r4fV0a55lak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161097; c=relaxed/simple;
	bh=A6+hwyNhVk1N2pE8BICREQlF1gzzqZy7sCHtVpqYoOM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=JhoR9rm55ySn5t7L/HMJTq1L72RZsWhbTCB1vPBwjkIk1qe2ShED8qZSWp2Via98g5prBKWHRVG4BEFlsxaW6bqyGloYzE0F7bcQSCMfytu7iY3Qx77fQyWc6OdaEY/ox2mxMJDFpegdmOrnvf3LLa+bIE8MPTZFeI6M+jHxN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeDNvNmu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeDNvNmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61EF1F000C8;
	Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=VmTxN0Bbpjbgz/L0Fa5CQa4/YAz/9VwyRo6oDK8+FJg=;
	h=Date:From:To:Cc:Subject:References;
	b=LeDNvNmurlZ6vL60fyBL+hoAlqKHf72ogD2qVaFYiBKakxMv6HKxq4cTKW31N/5gE
	 c35CE+MTZVTvuKf+GGrzc/r+GTX4+C8gMKNCfn0InCD2F3GZAkNP/uZ5X4LQVIOmCj
	 ta2a8lVwHwSFGnaPRRgF4frZpkXLcWIah1PYlBvNiJtFiO+Y2+FXR3qMVhj7vVhwTg
	 JuvI677bNpQ9FG/Ga97Twh4u8p8mLjZqzlZAY11KijyIddA0iUhk7ml84DiluRrEVW
	 fiYjk9vUN38GMj0NxV/crnc9oCL+9YRZHJWJsjDB8E00uNXnk+SrzkpYmW0Zhb9a48
	 ZwKqllF8tJq/w==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy7-00000000XjA-1Elb;
	Fri, 16 Oct 2026 10:31:35 -0400
Message-ID: <20261016143135.104339329@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:20 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 05/18] tracing: Split the event string parsing logic into a dedicated
 function
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

This new function can be tested with a KUnit test to prevent regressions
when adding new fields to the format.

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-4-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 61 +++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index de964dd2878b..288b90b207ca 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1443,25 +1443,18 @@ static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 	return ret;
 }
 
-int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
+static void
+ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod)
 {
-	char *event = NULL, *sub = NULL, *match, *mod;
-	char *buf;
-
-	if (!tr)
-		return -ENOENT;
-
-	char *dupped_buf __free(kfree) = kstrdup(arg_buf, GFP_KERNEL);
-	if (!dupped_buf)
-		return -ENOMEM;
-	buf = dupped_buf;
+	*event = NULL;
+	*sub = NULL;
 
 	/* Modules events can be appended with :mod:<module> */
-	mod = strstr(buf, ":mod:");
-	if (mod) {
-		*mod = '\0';
+	*mod = strstr(buf, ":mod:");
+	if (*mod) {
+		**mod = '\0';
 		/* move to the module name */
-		mod += 5;
+		*mod += 5;
 	}
 
 	/*
@@ -1476,21 +1469,35 @@ int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
 	 *  the name <name> or any event that matches <name>
 	 */
 
-	match = strsep(&buf, ":");
+	*match = strsep(&buf, ":");
 	if (buf) {
-		sub = match;
-		event = buf;
-		match = NULL;
-
-		if (!strlen(sub) || strcmp(sub, "*") == 0)
-			sub = NULL;
-		if (!strlen(event) || strcmp(event, "*") == 0)
-			event = NULL;
-	} else if (mod) {
+		*sub = *match;
+		*event = buf;
+		*match = NULL;
+
+		if (!strlen(*sub) || strcmp(*sub, "*") == 0)
+			*sub = NULL;
+		if (!strlen(*event) || strcmp(*event, "*") == 0)
+			*event = NULL;
+	} else if (*mod) {
 		/* Allow wildcard for no length or star */
-		if (!strlen(match) || strcmp(match, "*") == 0)
-			match = NULL;
+		if (!strlen(*match) || strcmp(*match, "*") == 0)
+			*match = NULL;
 	}
+}
+
+int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
+{
+	char *event, *sub, *match, *mod;
+
+	if (!tr)
+		return -ENOENT;
+
+	char *dupped_buf __free(kfree) = kstrdup(arg_buf, GFP_KERNEL);
+	if (!dupped_buf)
+		return -ENOMEM;
+
+	ftrace_parse_event_string(dupped_buf, &match, &sub, &event, &mod);
 
 	return __ftrace_set_clr_event(tr, match, sub, event, set, mod);
 }
-- 
2.53.0
