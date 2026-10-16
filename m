Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DEB3DC4C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161098; cv=none; b=hPhpTVYsFlVqek9u/tU4YqE6HycrTS5yFZJL/BTsHFjL6jTUqmk644xt9zCDYGYwYOTYyj8k/JsMKkvPaaSV3rSMpEFpLJE6+7lWbUyHbFrHkLeM6DBfSBfOXb92Zj1G6WPZklbwDuRQ74VAFdUm5gGs2gHhfZW/+5dbgfQP42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161098; c=relaxed/simple;
	bh=D4zlrXtVNFMr/YsUek1WgjTXQkTpGsROBWOh3llKygs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=qf3bZRVCKSIWeitOoJqJ4Dl1r0hrbXaWGJ+H3aBDCuZI1J8Epykv1rdfGuu8mhMZ+lP+xgzC49AZyxDnysmBkqbUkTdbOQnizmrGORmKFhcqYN31/VZ+8NLZ9cCzmVhTqHSdNNcEwzf+Js1eWhpuwgZWu7vb4SY0ZSiCMhgW2eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P75qDCT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P75qDCT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0371F000C4;
	Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161096;
	bh=SCdZHgy7aWsLgxdoxKhbflfwWJoHTNdJKjySNQD9uFk=;
	h=Date:From:To:Cc:Subject:References;
	b=P75qDCT3OxELmJHU0XtgVZSdVzCEgaYxgiR9mnDlU/PjdkUaTr+1i35gjcFiWYVoC
	 W0/e4lBfPwKyrKM0GDYK1+8k0hjZQ8tSr/3KAcY6mtqodY0h0/KeUvUmjLqd+ZnqTI
	 WeqDY0SMlHx2XY6coZ9ndneB0FElNYgMXmhWFF1JvJ02FgIesEN2/4vVIfEW0w930q
	 uqSOJN4OASLF5WkD2xWYQDzmjs2UBeQ28U3/TjPMMIlYneyErli5dL852JPr+VfJWZ
	 H/LgsqeftlhhA27O1+K/EU55DKnnWIQSfML8RrxkQ298aKU6kl77ZuuOan7p9MvOZa
	 A6PnoD5EiWlew==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy7-00000000Xkq-3pAn;
	Fri, 16 Oct 2026 10:31:35 -0400
Message-ID: <20261016143135.724893325@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:23 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 08/18] tracing: Parse filter from boot event string
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

Make it possible to specify a trace event filter from the
kernel command line.

Example:

	trace_event=syscalls:sys_enter_clock_nanosleep:filter:which_clock==0

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-7-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 .../admin-guide/kernel-parameters.txt         |  9 +++++--
 Documentation/trace/events.rst                |  5 ++++
 include/linux/trace_events.h                  |  2 +-
 kernel/trace/trace.h                          |  3 ++-
 kernel/trace/trace_boot.c                     |  2 +-
 kernel/trace/trace_events.c                   | 27 +++++++++++++------
 kernel/trace/trace_events_test.c              | 26 +++++++++++++++---
 7 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..524cad368767 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7733,8 +7733,13 @@ Kernel parameters
 			trace_event=:mod:<module>
 
 			The value before :mod: will only enable specific events
-			that are part of the module. See the above mentioned
-			document for more information.
+			that are part of the module.
+
+			To apply a filter, use the :filter: keyword:
+
+			trace_event=...:filter:<filter>
+
+			See the above mentioned document for more information.
 
 	trace_instance=[instance-info]
 			[FTRACE] Create a ring buffer instance early in boot up.
diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
index a1a219208ecc..88a9099f1688 100644
--- a/Documentation/trace/events.rst
+++ b/Documentation/trace/events.rst
@@ -118,6 +118,11 @@ In order to facilitate early boot debugging, use boot option::
 event-list is a comma separated list of events. See section 2.1 for event
 format.
 
+The boot option also supports the ``:filter:`` keyword to apply a filter.
+The ``:filter:`` keyword needs to be at the end of the event specification::
+
+	<system>:<event>:mod:<module>:filter:<filter>
+
 3. Defining an event-enabled tracepoint
 =======================================
 
diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 8a396ae51fef..321f2f3a6c8e 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -883,7 +883,7 @@ extern int trace_add_event_call(struct trace_event_call *call);
 extern int trace_remove_event_call(struct trace_event_call *call);
 extern int trace_event_get_offsets(struct trace_event_call *call);
 
-int ftrace_set_clr_event(struct trace_array *tr, const char *buf, int set);
+int ftrace_set_clr_event(struct trace_array *tr, const char *buf, int set, bool handle_filter);
 int trace_set_clr_event(const char *system, const char *event, int set);
 int trace_array_set_clr_event(struct trace_array *tr, const char *system,
 		const char *event, bool enable);
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 31718ef337dc..26390e06969e 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -2511,5 +2511,6 @@ static inline int rv_init_interface(void)
 #endif /* _LINUX_KERNEL_TRACE_H */
 
 #if IS_ENABLED(CONFIG_KUNIT)
-void ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod);
+void ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod,
+			       bool handle_filter, char **filter);
 #endif
diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
index 5da0a8bbb110..6ba70dac1f06 100644
--- a/kernel/trace/trace_boot.c
+++ b/kernel/trace/trace_boot.c
@@ -94,7 +94,7 @@ trace_boot_enable_events(struct trace_array *tr, struct xbc_node *node)
 			continue;
 		}
 
-		if (ftrace_set_clr_event(tr, buf, 1) < 0)
+		if (ftrace_set_clr_event(tr, buf, 1, false) < 0)
 			pr_err("Failed to enable event: %s\n", p);
 	}
 }
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index b27599c7d55d..a1ac2a02f4e2 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1458,10 +1458,21 @@ static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 }
 
 VISIBLE_IF_KUNIT void
-ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod)
+ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod,
+			  bool handle_filter, char **filter)
 {
 	*event = NULL;
 	*sub = NULL;
+	*filter = NULL;
+
+	/* event filters can be appended with :filter:<filter> */
+	if (handle_filter) {
+		*filter = strstr(buf, ":filter:");
+		if (*filter) {
+			**filter = '\0';
+			*filter += 8;
+		}
+	}
 
 	/* Modules events can be appended with :mod:<module> */
 	*mod = strstr(buf, ":mod:");
@@ -1501,9 +1512,9 @@ ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, cha
 }
 EXPORT_SYMBOL_IF_KUNIT(ftrace_parse_event_string);
 
-int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
+int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set, bool handle_filter)
 {
-	char *event, *sub, *match, *mod;
+	char *event, *sub, *match, *mod, *filter;
 
 	if (!tr)
 		return -ENOENT;
@@ -1512,9 +1523,9 @@ int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
 	if (!dupped_buf)
 		return -ENOMEM;
 
-	ftrace_parse_event_string(dupped_buf, &match, &sub, &event, &mod);
+	ftrace_parse_event_string(dupped_buf, &match, &sub, &event, &mod, handle_filter, &filter);
 
-	return __ftrace_set_clr_event(tr, match, sub, event, set, mod, NULL);
+	return __ftrace_set_clr_event(tr, match, sub, event, set, mod, filter);
 }
 
 /**
@@ -1596,7 +1607,7 @@ ftrace_event_write(struct file *file, const char __user *ubuf,
 		if (*parser.buffer == '!')
 			set = 0;
 
-		ret = ftrace_set_clr_event(tr, parser.buffer + !set, set);
+		ret = ftrace_set_clr_event(tr, parser.buffer + !set, set, false);
 		if (ret)
 			goto out_put;
 	}
@@ -4865,10 +4876,10 @@ static __init void __early_set_events(struct trace_array *tr, char *buf, bool en
 	while ((token = strsep(&buf, ","))) {
 		if (*token) {
 			if (enable) {
-				if (ftrace_set_clr_event(tr, token, 1))
+				if (ftrace_set_clr_event(tr, token, 1, true))
 					pr_warn("Failed to enable trace event: %s\n", token);
 			} else {
-				ftrace_set_clr_event(tr, token, 0);
+				ftrace_set_clr_event(tr, token, 0, true);
 			}
 		}
 
diff --git a/kernel/trace/trace_events_test.c b/kernel/trace/trace_events_test.c
index 515d2e668c31..4a2d77fa0f58 100644
--- a/kernel/trace/trace_events_test.c
+++ b/kernel/trace/trace_events_test.c
@@ -8,7 +8,7 @@
 struct parse_event_string_test_case {
 	const char *input;
 
-	const char *match, *sub, *event, *mod;
+	const char *match, *sub, *event, *mod, *filter;
 };
 
 static const struct parse_event_string_test_case parse_event_string_test_cases[] = {
@@ -37,6 +37,12 @@ static const struct parse_event_string_test_case parse_event_string_test_cases[]
 		.sub	= "sub",
 		.event	= "event",
 	},
+	{
+		"sub:event:filter:filter",
+		.sub	= "sub",
+		.event	= "event",
+		.filter	= "filter",
+	},
 	{
 		"match",
 		.match	= "match",
@@ -51,6 +57,19 @@ static const struct parse_event_string_test_case parse_event_string_test_cases[]
 		.event	= "event",
 		.mod	= "module",
 	},
+	{
+		"sub:event:mod:module:filter:filter",
+		.sub	= "sub",
+		.event	= "event",
+		.mod	= "module",
+		.filter	= "filter",
+	},
+	{
+		"sub:event:mod:module:filter:unexpected-filter",
+		.sub	= "sub",
+		.event	= "event",
+		.mod	= "module:filter:unexpected-filter",
+	},
 };
 
 static void
@@ -72,18 +91,19 @@ KUNIT_ARRAY_PARAM(parse_event_string, parse_event_string_test_cases, parse_event
 static void parse_event_string(struct kunit *test)
 {
 	const struct parse_event_string_test_case *params = test->param_value;
-	char *input, *match, *sub, *event, *mod;
+	char *input, *match, *sub, *event, *mod, *filter;
 
 	input = kunit_kstrdup(test, params->input, GFP_KERNEL);
 	if (!input)
 		kunit_skip(test, "ENOMEM");
 
-	ftrace_parse_event_string(input, &match, &sub, &event, &mod);
+	ftrace_parse_event_string(input, &match, &sub, &event, &mod, params->filter, &filter);
 
 	EXPECT_NULL_OR_STR_EQ(test, match, params->match);
 	EXPECT_NULL_OR_STR_EQ(test, sub, params->sub);
 	EXPECT_NULL_OR_STR_EQ(test, event, params->event);
 	EXPECT_NULL_OR_STR_EQ(test, mod, params->mod);
+	EXPECT_NULL_OR_STR_EQ(test, filter, params->filter);
 }
 
 static struct kunit_case trace_events_test_cases[] = {
-- 
2.53.0
