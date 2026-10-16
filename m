Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD0C3CB56E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161098; cv=none; b=WO4VPy62tzcFlZqUqLDoHXhu6ED47pfrYalEGDp2CDw/p/KLC3D5f96iodsol2cHyGbufO9RF/xNt1Ww9HTWbwnE1JG94VcH1xJHZOt5+1Btq/Jy+/rDQlPSWL7Z+XHuuzE+mVUM+B5Yd5ojmCqYdqZoPMS9/WhblrKDA4VwEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161098; c=relaxed/simple;
	bh=e8JMy/Ub9Y8hh+x9B3xc8oczN3SFnt4SCMTJjz9CIdQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rZQdN5XMW7QAZkpeuDyFOHDZC4bf8xrWC/IoJ4SIxLBpOrPIoEinD0yuPUMX/1VzMtrExcHZD1vgXBW7mpitVJUd3BTTUZxweMsJctvLgEE9ivdPV+gndLvAmRcRgG8YAMZUgvU42ffkJGTsV7CrzRQqqWb+73cFYrQnySPL3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ/q8AHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ/q8AHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952301F000C6;
	Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161096;
	bh=itzUZa5e7HKV35fI+4Oul2LEqGTI93h5aNqHkfy6elw=;
	h=Date:From:To:Cc:Subject:References;
	b=cQ/q8AHVTAydZve9AlFPw+nHEqQ58ra4Dqc/qNdNYBY9jLQW3Qnbv8ZTicqDw+BX8
	 8+la0GsmBnXEM1gWu5KULvInTfucpWSbYIdY6V56VXxIjakbpkEQUZyX1fJL/9/ahe
	 mYIOPlgiV3DtWU1ifJ+i7U3BWtVUZVm2fnCqCaW0aR5sTMYOh63bTwZQSuh7NYJoM9
	 g/WaRc9urFP+IgonzT4XqkiV0b7SE+d1/95qCHKkNKVh8gwbcPY1xjMjq86PifPTom
	 P4xJETtyQUyTV0de6YV+/kR/6cKkG2QEFtYTm/2cxNoyek/WXkCT+RpvYRc+kYqTmB
	 CRjPjwu74i3LQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy7-00000000XkH-2xXR;
	Fri, 16 Oct 2026 10:31:35 -0400
Message-ID: <20261016143135.517166030@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:22 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 07/18] tracing: Add a filter argument to __ftrace_set_clr_event()
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

Make it possible to directly enable a filter when enabling an event.

For now this is unused, an upcoming patch will wire it up.

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-6-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 47 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index f6da4eea5ca2..b27599c7d55d 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -946,6 +946,7 @@ struct event_mod_load {
 	char			*match;
 	char			*system;
 	char			*event;
+	char			*filter;
 };
 
 static void free_event_mod(struct event_mod_load *event_mod)
@@ -955,6 +956,7 @@ static void free_event_mod(struct event_mod_load *event_mod)
 	kfree(event_mod->match);
 	kfree(event_mod->system);
 	kfree(event_mod->event);
+	kfree(event_mod->filter);
 	kfree(event_mod);
 }
 
@@ -996,7 +998,7 @@ static int remove_cache_mod(struct trace_array *tr, const char *mod,
 }
 
 static int cache_mod(struct trace_array *tr, const char *mod, int set,
-		     const char *match, const char *system, const char *event)
+		     const char *match, const char *system, const char *event, const char *filter)
 {
 	struct event_mod_load *event_mod;
 
@@ -1035,6 +1037,12 @@ static int cache_mod(struct trace_array *tr, const char *mod, int set,
 			goto out_free;
 	}
 
+	if (filter) {
+		event_mod->filter = kstrdup(filter, GFP_KERNEL);
+		if (!event_mod->filter)
+			goto out_free;
+	}
+
 	list_add(&event_mod->list, &tr->mod_events);
 
 	return 0;
@@ -1047,7 +1055,7 @@ static int cache_mod(struct trace_array *tr, const char *mod, int set,
 #else /* CONFIG_MODULES */
 static inline void clear_mod_events(struct trace_array *tr) { }
 static int cache_mod(struct trace_array *tr, const char *mod, int set,
-		     const char *match, const char *system, const char *event)
+		     const char *match, const char *system, const char *event, const char *filter)
 {
 	return -EINVAL;
 }
@@ -1356,7 +1364,7 @@ static void remove_event_file_dir(struct trace_event_file *file)
 static int
 __ftrace_set_clr_event_nolock(struct trace_array *tr, const char *match,
 			      const char *sub, const char *event, int set,
-			      const char *mod)
+			      const char *mod, char *filter)
 {
 	struct trace_event_file *file;
 	struct trace_event_call *call;
@@ -1406,7 +1414,11 @@ __ftrace_set_clr_event_nolock(struct trace_array *tr, const char *match,
 		if (event && strcmp(event, name) != 0)
 			continue;
 
-		ret = ftrace_event_enable_disable(file, set);
+		if (filter)
+			ret = apply_event_filter(file, filter);
+
+		if (!filter || !ret)
+			ret = ftrace_event_enable_disable(file, set);
 
 		/*
 		 * Save the first error and return that. Some events
@@ -1424,14 +1436,14 @@ __ftrace_set_clr_event_nolock(struct trace_array *tr, const char *match,
 	 * check if the module was loaded. If it wasn't cache it.
 	 */
 	if (module && ret == -EINVAL && !eret)
-		ret = cache_mod(tr, module, set, match, sub, event);
+		ret = cache_mod(tr, module, set, match, sub, event, filter);
 
 	return ret;
 }
 
 static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 				  const char *sub, const char *event, int set,
-				  const char *mod)
+				  const char *mod, char *filter)
 {
 	int ret;
 
@@ -1439,7 +1451,7 @@ static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 		return -EACCES;
 
 	mutex_lock(&event_mutex);
-	ret = __ftrace_set_clr_event_nolock(tr, match, sub, event, set, mod);
+	ret = __ftrace_set_clr_event_nolock(tr, match, sub, event, set, mod, filter);
 	mutex_unlock(&event_mutex);
 
 	return ret;
@@ -1502,7 +1514,7 @@ int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
 
 	ftrace_parse_event_string(dupped_buf, &match, &sub, &event, &mod);
 
-	return __ftrace_set_clr_event(tr, match, sub, event, set, mod);
+	return __ftrace_set_clr_event(tr, match, sub, event, set, mod, NULL);
 }
 
 /**
@@ -1524,7 +1536,7 @@ int trace_set_clr_event(const char *system, const char *event, int set)
 	if (!tr)
 		return -ENODEV;
 
-	return __ftrace_set_clr_event(tr, NULL, system, event, set, NULL);
+	return __ftrace_set_clr_event(tr, NULL, system, event, set, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(trace_set_clr_event);
 
@@ -1550,7 +1562,7 @@ int trace_array_set_clr_event(struct trace_array *tr, const char *system,
 		return -ENOENT;
 
 	set = (enable == true) ? 1 : 0;
-	return __ftrace_set_clr_event(tr, NULL, system, event, set, NULL);
+	return __ftrace_set_clr_event(tr, NULL, system, event, set, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(trace_array_set_clr_event);
 
@@ -2070,7 +2082,7 @@ system_enable_write(struct file *filp, const char __user *ubuf, size_t cnt,
 	if (system)
 		name = system->name;
 
-	ret = __ftrace_set_clr_event(dir->tr, NULL, name, NULL, val, NULL);
+	ret = __ftrace_set_clr_event(dir->tr, NULL, name, NULL, val, NULL, NULL);
 	if (ret)
 		goto out;
 
@@ -4045,7 +4057,8 @@ static void update_mod_cache(struct trace_array *tr, struct module *mod)
 
 		__ftrace_set_clr_event_nolock(tr, event_mod->match,
 					      event_mod->system,
-					      event_mod->event, 1, mod->name);
+					      event_mod->event, 1, mod->name,
+					      event_mod->filter);
 		free_event_mod(event_mod);
 	}
 }
@@ -4819,7 +4832,7 @@ int event_trace_del_tracer(struct trace_array *tr)
 	__ftrace_clear_event_pids(tr, TRACE_PIDS | TRACE_NO_PIDS);
 
 	/* Disable any running events */
-	__ftrace_set_clr_event_nolock(tr, NULL, NULL, NULL, 0, NULL);
+	__ftrace_set_clr_event_nolock(tr, NULL, NULL, NULL, 0, NULL, NULL);
 
 	/* Make sure no more events are being executed */
 	tracepoint_synchronize_unregister();
@@ -5129,7 +5142,7 @@ static __init void event_trace_self_tests(void)
 
 		pr_info("Testing event system %s: ", system->name);
 
-		ret = __ftrace_set_clr_event(tr, NULL, system->name, NULL, 1, NULL);
+		ret = __ftrace_set_clr_event(tr, NULL, system->name, NULL, 1, NULL, NULL);
 		if (WARN_ON_ONCE(ret)) {
 			pr_warn("error enabling system %s\n",
 				system->name);
@@ -5138,7 +5151,7 @@ static __init void event_trace_self_tests(void)
 
 		event_test_stuff();
 
-		ret = __ftrace_set_clr_event(tr, NULL, system->name, NULL, 0, NULL);
+		ret = __ftrace_set_clr_event(tr, NULL, system->name, NULL, 0, NULL, NULL);
 		if (WARN_ON_ONCE(ret)) {
 			pr_warn("error disabling system %s\n",
 				system->name);
@@ -5153,7 +5166,7 @@ static __init void event_trace_self_tests(void)
 	pr_info("Running tests on all trace events:\n");
 	pr_info("Testing all events: ");
 
-	ret = __ftrace_set_clr_event(tr, NULL, NULL, NULL, 1, NULL);
+	ret = __ftrace_set_clr_event(tr, NULL, NULL, NULL, 1, NULL, NULL);
 	if (WARN_ON_ONCE(ret)) {
 		pr_warn("error enabling all events\n");
 		return;
@@ -5162,7 +5175,7 @@ static __init void event_trace_self_tests(void)
 	event_test_stuff();
 
 	/* reset sysname */
-	ret = __ftrace_set_clr_event(tr, NULL, NULL, NULL, 0, NULL);
+	ret = __ftrace_set_clr_event(tr, NULL, NULL, NULL, 0, NULL, NULL);
 	if (WARN_ON_ONCE(ret)) {
 		pr_warn("error disabling all events\n");
 		return;
-- 
2.53.0
