Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E838A72C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161098; cv=none; b=cQy7oRT7Gzk2TZok2ELdcku30uzRfR6uddAIUBBNzjYrUi0fdYRusG3beg2jWoocmE19XlYWApt1TgRL8b+fxTWEHKvyGDc/6A29WnFoTo2otmszhxoUwY9H8s4Hnv7L7ffJoJOe2nUzWCudAnTGK3M0mQm5UOKwSpany399XG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161098; c=relaxed/simple;
	bh=eWKQp7GXOuceUCw1Rgo8LbExbd+moDA2VQhbPRSAAJw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Sfb91jwiToK/LDncgP9Tc3+ZGOMx4U/lFKYNWj9TZJ7OL0k2dRGSk7gpjRX+gihayFRYvWkYvMNrSCz16neJllzq18tsCavHBW6UjNWuUGtTSNrRhCSC95WbB4k8sIUGgafjw+1k7j4Jt34hwVfwuYfhMT1cZ61SEP5IyZskPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkLSHv3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkLSHv3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BD31F000D0;
	Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161096;
	bh=xFiCI6aIjRlZTmK3yKA88OBjonrKlVZkVDks6rBqWhs=;
	h=Date:From:To:Cc:Subject:References;
	b=RkLSHv3jq6bcuInNIXe/Plpm0t19CHyqMKrC7IoYCGMy3ZJarS8kpjq0iNZvwymQo
	 FElPlngARp5sRbyilLYRUfefBijk5QQS1kF6AKUhMcyQtp7dfCnwccd+mGtueUTIt3
	 yZHeEgyoJcv5bM1Nd9rzlJ0uu2eqBGeBqHkkPeU9vDAzh1PPkxhCJC+NxDcDUQ3Dii
	 3VxxUeT9QfEqb4bsa1jSiL6cNCu8HPvKm2ldmazAHb5oxuQCqVeRtKxHUWYRPMQYzS
	 sqRsBbcdUMPXC8Pfif9CcwBU8LWMPfKBOdj14gho69pY8bYl1edPQEz2nYe9PCczl4
	 c3pCtJj82rGcA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy7-00000000Xjj-25vl;
	Fri, 16 Oct 2026 10:31:35 -0400
Message-ID: <20261016143135.313254129@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:21 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 06/18] tracing: Add a test for ftrace_parse_event_string()
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

The parsing logic is a bit complicated and about to become more so.

Add a unit test to avoid regressions.

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-5-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/Kconfig             |   8 +++
 kernel/trace/Makefile            |   1 +
 kernel/trace/trace.h             |   4 ++
 kernel/trace/trace_events.c      |   5 +-
 kernel/trace/trace_events_test.c | 102 +++++++++++++++++++++++++++++++
 5 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 kernel/trace/trace_events_test.c

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 0ab5916575a9..430a4152095e 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -151,6 +151,14 @@ config EVENT_TRACING
 	select GLOB
 	bool
 
+config EVENT_TRACING_TEST
+	tristate "Test for event tracing" if !KUNIT_ALL_TESTS
+	depends on EVENT_TRACING
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit test for the event tracing implementation.
+
 config CONTEXT_SWITCH_TRACER
 	bool
 
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..7bef5a84ce47 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_EVENT_TRACING) += blktrace.o
 endif
 obj-$(CONFIG_EVENT_TRACING) += trace_events.o
 obj-$(CONFIG_EVENT_TRACING) += trace_export.o
+obj-$(CONFIG_EVENT_TRACING_TEST) += trace_events_test.o
 obj-$(CONFIG_FTRACE_SYSCALLS) += trace_syscalls.o
 ifeq ($(CONFIG_PERF_EVENTS),y)
 obj-$(CONFIG_EVENT_TRACING) += trace_event_perf.o
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index e05216479913..31718ef337dc 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -2509,3 +2509,7 @@ static inline int rv_init_interface(void)
 	})
 
 #endif /* _LINUX_KERNEL_TRACE_H */
+
+#if IS_ENABLED(CONFIG_KUNIT)
+void ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod);
+#endif
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 288b90b207ca..f6da4eea5ca2 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -25,6 +25,8 @@
 #include <linux/delay.h>
 #include <linux/btf.h>
 
+#include <kunit/visibility.h>
+
 #include <trace/events/sched.h>
 #include <trace/syscall.h>
 
@@ -1443,7 +1445,7 @@ static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 	return ret;
 }
 
-static void
+VISIBLE_IF_KUNIT void
 ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, char **mod)
 {
 	*event = NULL;
@@ -1485,6 +1487,7 @@ ftrace_parse_event_string(char *buf, char **match, char **sub, char **event, cha
 			*match = NULL;
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(ftrace_parse_event_string);
 
 int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
 {
diff --git a/kernel/trace/trace_events_test.c b/kernel/trace/trace_events_test.c
new file mode 100644
index 000000000000..515d2e668c31
--- /dev/null
+++ b/kernel/trace/trace_events_test.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/module.h>
+
+#include <kunit/test.h>
+
+#include "trace.h"
+
+struct parse_event_string_test_case {
+	const char *input;
+
+	const char *match, *sub, *event, *mod;
+};
+
+static const struct parse_event_string_test_case parse_event_string_test_cases[] = {
+	{
+		"",
+		.match	= "",
+	},
+	{
+		"*:event",
+		.event	= "event",
+	},
+	{
+		":event",
+		.event	= "event",
+	},
+	{
+		"sub:*",
+		.sub	= "sub",
+	},
+	{
+		"sub:",
+		.sub	= "sub",
+	},
+	{
+		"sub:event",
+		.sub	= "sub",
+		.event	= "event",
+	},
+	{
+		"match",
+		.match	= "match",
+	},
+	{
+		":mod:module",
+		.mod	= "module",
+	},
+	{
+		"sub:event:mod:module",
+		.sub	= "sub",
+		.event	= "event",
+		.mod	= "module",
+	},
+};
+
+static void
+parse_event_string_test_desc(const struct parse_event_string_test_case *params, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "'%s'", params->input);
+}
+
+KUNIT_ARRAY_PARAM(parse_event_string, parse_event_string_test_cases, parse_event_string_test_desc);
+
+#define EXPECT_NULL_OR_STR_EQ(test, left, right)		\
+({								\
+	if ((left) != NULL)					\
+		KUNIT_EXPECT_STREQ(test, (left), (right));	\
+	else							\
+		KUNIT_EXPECT_NULL(test, (right));		\
+})
+
+static void parse_event_string(struct kunit *test)
+{
+	const struct parse_event_string_test_case *params = test->param_value;
+	char *input, *match, *sub, *event, *mod;
+
+	input = kunit_kstrdup(test, params->input, GFP_KERNEL);
+	if (!input)
+		kunit_skip(test, "ENOMEM");
+
+	ftrace_parse_event_string(input, &match, &sub, &event, &mod);
+
+	EXPECT_NULL_OR_STR_EQ(test, match, params->match);
+	EXPECT_NULL_OR_STR_EQ(test, sub, params->sub);
+	EXPECT_NULL_OR_STR_EQ(test, event, params->event);
+	EXPECT_NULL_OR_STR_EQ(test, mod, params->mod);
+}
+
+static struct kunit_case trace_events_test_cases[] = {
+	KUNIT_CASE_PARAM(parse_event_string, parse_event_string_gen_params),
+	{}
+};
+
+static struct kunit_suite trace_events_test_suite = {
+	.name = "trace-events",
+	.test_cases = trace_events_test_cases,
+};
+kunit_test_suite(trace_events_test_suite);
+
+MODULE_DESCRIPTION("KUnit test for the event tracing implementation");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
-- 
2.53.0
