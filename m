Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166C377A83
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161096; cv=none; b=QMes+NU1Jvp11MCVWXwP6dQZn7I/mPB3WO00WmLHCVhFjlRcBRvU4ir8j1EpxJ1a1y49AdhJh0PGVfWlppdUhGVzqlJZ2hXJGxdVznfQv0zwo7J38rCL0tHIuhwRHNkl2H+mamzVBCCMtx5DcKJ+ALUT0H4CLeg83p9nDpltkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161096; c=relaxed/simple;
	bh=IFf2r7e5tp6/DV7vI21+27ds867Jq0lAaYanbHYyYZg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sMyBygEWTjPFG4gwJATgW8wCPWJkqZstCxzHnwdXNg1qwHXsK/oJjD7yhEP3OOigSdGeN1pmyTcdYwejUbTLoCV0s4ZqRd7c9vlq3a5kbg/3LWj+X6ekejXz6CyfNrg5ijjjlALwPHX5fV0tNKRCrlNifWRWmfbW/HLOuoG1TEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bouqfkmg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bouqfkmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B2F1F000C6;
	Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=0MPg8QOaNfxs2ot/GqbJDDu97d5ycWYmeTJbXNNt5Ks=;
	h=Date:From:To:Cc:Subject:References;
	b=BouqfkmgUuzhNiCFkg72xNlU0ADDi8q2e//9iNyqkpDzhOagvOOJhyriTG40njIBU
	 x/RVpQeeeXwKHIiL+76HTztVVIAUcwZWMpr5kXFAM0gAI0pK658WJDYFiUEPaxUxW2
	 HfZ/mxHxBK+ol2EkP2LxDtIlrnTh69E0/WLfN4dNSH/roFLYcN3/swAD1OFL15znCA
	 Nu73L0B1chIVJ4VMrSRdNVTg3aPlJ7ih+8Feky/VHJIHH/XiuRbbZC0g2oYg13liYb
	 egBiVWrmHP04c2v8dhxf5gsKurkk44pMysfm2QhpYXJicceQiFTRr6NS0XqPBmvuTw
	 /JMlXYDNnjkDw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy6-00000000Xgw-1qHw;
	Fri, 16 Oct 2026 10:31:34 -0400
Message-ID: <20261016143134.243847058@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:16 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Jun <chenjun102@huawei.com>
Subject: [for-next][PATCH 01/18] tracing: Add "within" filter for call-stack-based event filtering
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Chen Jun <chenjun102@huawei.com>

Low-level kernel functions are called from many different paths.
When debugging, it is often useful to filter trace events to only
those occurring within a specific call chain.

Add a "within" filter predicate that tests whether a given function
appears in the current call stack at event time. The function name
is resolved to its address range via kallsyms during filter setup;
at runtime, stack_trace_save() captures the call stack and compares
each return address against the stored range.

Example:
  echo 'within == "vfs_read"' > events/sched/sched_switch/filter

Only "==" and "!=" operators are supported. The filter depends on
CONFIG_STACKTRACE.

Link: https://patch.msgid.link/20260821233050.335986786@kernel.org
Link: https://patch.msgid.link/20260608145556.94931-1-chenjun102@huawei.com
Signed-off-by: Chen Jun <chenjun102@huawei.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/events.rst     | 12 +++++++++
 include/linux/trace_events.h       |  1 +
 kernel/trace/trace.h               |  3 ++-
 kernel/trace/trace_events.c        |  3 +++
 kernel/trace/trace_events_filter.c | 41 ++++++++++++++++++++++++++++--
 5 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
index 581f2260614b..a1a219208ecc 100644
--- a/Documentation/trace/events.rst
+++ b/Documentation/trace/events.rst
@@ -243,6 +243,18 @@ the function "security_prepare_creds" and less than the end of that function.
 The ".function" postfix can only be attached to values of size long, and can only
 be compared with "==" or "!=".
 
+The special field "within" can be used to filter events based on whether
+a specific function appears in the current call stack::
+
+  within == "function_name"
+  within != "function_name"
+
+For example, to only trace events where "vfs_read" is in the call stack::
+
+  # echo 'within == "vfs_read"' > events/sched/sched_switch/filter
+
+The within field supports only the "==" and "!=" operators.
+
 Cpumask fields or scalar fields that encode a CPU number can be filtered using
 a user-provided cpumask in cpulist format. The format is as follows::
 
diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 5cbd09c8be8d..d0259a515a83 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -872,6 +872,7 @@ enum {
 	FILTER_COMM,
 	FILTER_CPU,
 	FILTER_STACKTRACE,
+	FILTER_WITHIN,
 };
 
 extern int trace_event_raw_init(struct trace_event_call *call);
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 3749485a7d85..0af2b32619d5 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1826,7 +1826,8 @@ static inline bool is_string_field(struct ftrace_event_field *field)
 	       field->filter_type == FILTER_RDYN_STRING ||
 	       field->filter_type == FILTER_STATIC_STRING ||
 	       field->filter_type == FILTER_PTR_STRING ||
-	       field->filter_type == FILTER_COMM;
+	       field->filter_type == FILTER_COMM ||
+	       field->filter_type == FILTER_WITHIN;
 }
 
 static inline bool is_function_field(struct ftrace_event_field *field)
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 30c0ddf90887..1bd227282729 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -201,6 +201,9 @@ static int trace_define_generic_fields(void)
 	__generic_field(char *, comm, FILTER_COMM);
 	__generic_field(char *, stacktrace, FILTER_STACKTRACE);
 	__generic_field(char *, STACKTRACE, FILTER_STACKTRACE);
+#ifdef CONFIG_STACKTRACE
+	__generic_field(char *, within, FILTER_WITHIN);
+#endif
 
 	return ret;
 }
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2b46ca536045..89f606643388 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -72,6 +72,7 @@ enum filter_pred_fn {
 	FILTER_PRED_FN_CPUMASK,
 	FILTER_PRED_FN_CPUMASK_CPU,
 	FILTER_PRED_FN_FUNCTION,
+	FILTER_PRED_FN_WITHIN,
 	FILTER_PRED_FN_,
 	FILTER_PRED_TEST_VISITED,
 };
@@ -1009,6 +1010,22 @@ static int filter_pred_function(struct filter_pred *pred, void *event)
 	return pred->op == OP_EQ ? ret : !ret;
 }
 
+/* Filter predicate for within. */
+static int filter_pred_within(struct filter_pred *pred, void *event)
+{
+#ifdef CONFIG_STACKTRACE
+	unsigned long entries[16];
+	unsigned int nr_entries;
+	int i;
+
+	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
+	for (i = 0; i < nr_entries; i++)
+		if (pred->val <= entries[i] && entries[i] < pred->val2)
+			return !pred->not;
+#endif
+	return pred->not;
+}
+
 /*
  * regex_match_foo - Basic regex callbacks
  *
@@ -1618,6 +1635,8 @@ static int filter_pred_fn_call(struct filter_pred *pred, void *event)
 		return filter_pred_cpumask_cpu(pred, event);
 	case FILTER_PRED_FN_FUNCTION:
 		return filter_pred_function(pred, event);
+	case FILTER_PRED_FN_WITHIN:
+		return filter_pred_within(pred, event);
 	case FILTER_PRED_TEST_VISITED:
 		return test_pred_visited_fn(pred, event);
 	default:
@@ -2003,10 +2022,28 @@ static int parse_pred(const char *str, void *data,
 
 		} else if (field->filter_type == FILTER_DYN_STRING) {
 			pred->fn_num = FILTER_PRED_FN_STRLOC;
-		} else if (field->filter_type == FILTER_RDYN_STRING)
+		} else if (field->filter_type == FILTER_RDYN_STRING) {
 			pred->fn_num = FILTER_PRED_FN_STRRELLOC;
-		else {
+		} else if (field->filter_type == FILTER_WITHIN) {
+			unsigned long func;
+
+			if (op == OP_GLOB)
+				goto err_free;
 
+			pred->fn_num = FILTER_PRED_FN_WITHIN;
+			func = kallsyms_lookup_name(pred->regex->pattern);
+			if (!func) {
+				parse_error(pe, FILT_ERR_NO_FUNCTION, pos + i);
+				goto err_free;
+			}
+			/* Now find the function start and end address */
+			if (!kallsyms_lookup_size_offset(func, &size, &offset)) {
+				parse_error(pe, FILT_ERR_NO_FUNCTION, pos + i);
+				goto err_free;
+			}
+			pred->val = func - offset;
+			pred->val2 = pred->val + size;
+		} else {
 			if (!ustring_per_cpu) {
 				/* Once allocated, keep it around for good */
 				ustring_per_cpu = alloc_percpu(struct ustring_buffer);
-- 
2.53.0
