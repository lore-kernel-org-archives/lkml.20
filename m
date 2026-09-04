Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB42749E6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511743; cv=none; b=YoEFM9COnoVXxvI25R3EEB11Yy+e+NhXqcNdJkgn+etPm4R9mE125nfmc1bSvMJIG+P97AQeS9rrOUq/EgZlTm8v3wM99mAVrIWL/fTOp7B8KrOC0ecTdha8OosV3HgYx6gzx1f+J0MerLp64Hj8ojsLnWz6NM3Mf3t+V8EisMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511743; c=relaxed/simple;
	bh=C2oxbiw/ORD+y5L2PU8oP5x/Gt4za60GxyVRdYT2OpA=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=EdTgVNsDbpAamzopnFyN62xiFDlj75bF+nxEtbyxGD1BobWJurfKrpaARBR4uV04ZDQklvnaQQxsOCRcGQioWSTYK98H150Ojg3wvd1doEILsCz53WPsSLkFHi+8moLOtucYauJdnriJhP3+OhAz7xrU4jc6yN5IvDh4FWioztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqaKpYbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqaKpYbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B1D1F00A3D;
	Fri,  4 Sep 2026 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788511741;
	bh=wqgft0Gb5Z3B/WN3/dc9mf362oi12yNlzITK4koJGLA=;
	h=Date:From:To:Cc:Subject;
	b=JqaKpYbg0xzycH1bO1HlnsEeB6MjmCKTzoK9Doh+nnp6S3gugU8/3WtBe2wh3jF6U
	 /hEBSuvRGHMMSn5s+F4rT7JSisNn9nP+UVeAK124kOBoW+cu54Kji2uFMPvWFEzlT1
	 UqrUxdo9lt559WpYzFjAFA9+jcekUbX1R46T/nYCWdgeApOqxagLZ2DLbdGTBjjJ62
	 sNhZ4Cg/cH9mpKixQ/k5g3rNN6VdudqtGPw479O1WVjLdziVIbDF+HJr9Vru997Oi7
	 5keVR9b241SJ2SzrA3gfO7HpjbjEhLS7xsHPfmWprL1X3E78YJQzhYK7JjXi7/zi+n
	 vQ1A022IK267A==
Date: Fri, 4 Sep 2026 17:48:56 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andi Kleen <ak@kernel.org>, Henry Martin <bsdhenrymartin@gmail.com>,
 Masami Hiramatsu (Google) <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.3-rc1
Message-Id: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Linus,

Probes fixes for v7.3-rc1:

- kprobes: Protect kprobe_blacklist with RCU
  . RCU-protect kprobe_blacklist and use kfree_rcu() to prevent UAF
    races during module unloading and enable safe atomic lookups.
- tracing/probes: Fix multi-probe field use-after-free and BTF parsing
  . Multi-probe UAF fix: Duplicate field and type strings on
    trace_probe_event to prevent UAF when freeing primary probe.
  . BTF member lookup fixes:
    - Check the containing inner struct/union kflag when resolving
      anonymous members to ensure correct bitfield offset calculation.
    - Prevent unnamed bitfields from being pushed to anon_stack in
      btf_find_struct_member(), avoiding false lookup errors.
    - Fix code block indentation in get_bitoffset_of_field().
- uprobes: Error pointer safety
  . Guard free_trace_uprobe() with IS_ERR_OR_NULL() to avoid crashing
    during automatic cleanup when an error pointer is returned.


Please pull the latest probes-fixes-v7.3-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.3-rc1

Tag SHA1: af3575e771353db2aef2a03f8b91a3a80d7ec513
Head SHA1: 0c4256196b3a105307e2235fbfd85e768bbcdd0f


Andi Kleen (1):
      uprobes: guard trace cleanup against error pointers

Henry Martin (1):
      tracing/probes: Fix use-after-free on field name/type of events with multiple probes

Masami Hiramatsu (Google) (4):
      tracing/probes: Fix anon_stack check for unnamed bitfields in btf_find_struct_member
      tracing/probes: Fix BTF kflag check for anonymous struct member access
      tracing/probes: Fix code indent in get_bitoffset_of_field()
      kprobes: Protect kprobe_blacklist with RCU

----
 include/linux/kprobes.h     |  1 +
 kernel/kprobes.c            | 14 +++++++---
 kernel/trace/trace_btf.c    | 31 ++++++++++++----------
 kernel/trace/trace_btf.h    |  3 ++-
 kernel/trace/trace_probe.c  | 63 +++++++++++++++++++++++++++++++++++++++------
 kernel/trace/trace_probe.h  |  2 ++
 kernel/trace/trace_uprobe.c |  4 +--
 7 files changed, 89 insertions(+), 29 deletions(-)
---------------------------
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 8c4f3bb24429..e6de7ae55bda 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -181,6 +181,7 @@ struct kprobe_blacklist_entry {
 	struct list_head list;
 	unsigned long start_addr;
 	unsigned long end_addr;
+	struct rcu_head rcu;
 };
 
 #ifdef CONFIG_KPROBES
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index bfc89083daa9..6337da5cab9e 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1447,8 +1447,14 @@ static bool __within_kprobe_blacklist(unsigned long addr)
 	/*
 	 * If 'kprobe_blacklist' is defined, check the address and
 	 * reject any probe registration in the prohibited area.
+	 * Note: this can return true during transition period where
+	 * (start_addr, end_addr) in the black list is shrinking
+	 * but old entry has not been removed yet. This is acceptable
+	 * because the worst case is that we reject more probes than
+	 * we should.
 	 */
-	list_for_each_entry(ent, &kprobe_blacklist, list) {
+	guard(rcu)();
+	list_for_each_entry_rcu(ent, &kprobe_blacklist, list) {
 		if (addr >= ent->start_addr && addr < ent->end_addr)
 			return true;
 	}
@@ -2509,7 +2515,7 @@ int kprobe_add_ksym_blacklist(unsigned long entry)
 	ent->start_addr = entry;
 	ent->end_addr = entry + size;
 	INIT_LIST_HEAD(&ent->list);
-	list_add_tail(&ent->list, &kprobe_blacklist);
+	list_add_tail_rcu(&ent->list, &kprobe_blacklist);
 
 	return (int)size;
 }
@@ -2603,8 +2609,8 @@ static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
 	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
 		if (ent->start_addr < start || ent->start_addr >= end)
 			continue;
-		list_del(&ent->list);
-		kfree(ent);
+		list_del_rcu(&ent->list);
+		kfree_rcu(ent, rcu);
 	}
 }
 
diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index 00172f301f25..ee7a04886bf6 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -61,47 +61,50 @@ struct btf_anon_stack {
 
 /*
  * Find a member of data structure/union by name and return it.
- * Return NULL if not found, or -EINVAL if parameter is invalid.
- * If the member is an member of anonymous union/structure, the offset
- * of that anonymous union/structure is stored into @anon_offset. Caller
- * can calculate the correct offset from the root data structure by
- * adding anon_offset to the member's offset.
+ * Return NULL if not found, or ERR_PTR(-EINVAL) if parameter is invalid.
+ * If the member is a member of an anonymous union/structure, the bit offset
+ * of that anonymous union/structure is stored into @anon_offset.
+ * If @member_type is non-NULL, the actual containing structure/union type
+ * of the found member is stored into @member_type.
  */
 const struct btf_member *btf_find_struct_member(struct btf *btf,
 						const struct btf_type *type,
 						const char *member_name,
-						u32 *anon_offset)
+						u32 *anon_offset,
+						const struct btf_type **member_type)
 {
 	struct btf_anon_stack *anon_stack;
 	const struct btf_member *member;
+	const struct btf_type *mtype;
 	u32 tid, cur_offset = 0;
 	const char *name;
 	int i, top = 0;
 
+	if (!btf_type_is_struct(type))
+		return ERR_PTR(-EINVAL);
+
 	anon_stack = kzalloc_objs(*anon_stack, BTF_ANON_STACK_MAX);
 	if (!anon_stack)
 		return ERR_PTR(-ENOMEM);
 
 retry:
-	if (!btf_type_is_struct(type)) {
-		member = ERR_PTR(-EINVAL);
-		goto out;
-	}
-
 	for_each_member(i, type, member) {
 		if (!member->name_off) {
 			/* Anonymous union/struct: push it for later use */
-			if (btf_type_skip_modifiers(btf, member->type, &tid) &&
+			mtype = btf_type_skip_modifiers(btf, member->type, &tid);
+			if (mtype && btf_type_is_struct(mtype) &&
 			    top < BTF_ANON_STACK_MAX) {
 				anon_stack[top].tid = tid;
-				anon_stack[top++].offset =
-					cur_offset + member->offset;
+				anon_stack[top++].offset = cur_offset +
+					__btf_member_bit_offset(type, member);
 			}
 		} else {
 			name = btf_name_by_offset(btf, member->name_off);
 			if (name && !strcmp(member_name, name)) {
 				if (anon_offset)
 					*anon_offset = cur_offset;
+				if (member_type)
+					*member_type = type;
 				goto out;
 			}
 		}
diff --git a/kernel/trace/trace_btf.h b/kernel/trace/trace_btf.h
index 4bc44bc261e6..4bd26bceae23 100644
--- a/kernel/trace/trace_btf.h
+++ b/kernel/trace/trace_btf.h
@@ -8,4 +8,5 @@ const struct btf_param *btf_get_func_param(const struct btf_type *func_proto,
 const struct btf_member *btf_find_struct_member(struct btf *btf,
 						const struct btf_type *type,
 						const char *member_name,
-						u32 *anon_offset);
+						u32 *anon_offset,
+						const struct btf_type **member_type);
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index c4163904ba74..804442b2f7d2 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -625,6 +625,7 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 {
 	const struct btf_type *type = *ptype;
 	const struct btf_member *field;
+	const struct btf_type *mtype;
 	struct btf *btf = ctx_btf(ctx);
 	char *fieldname = *pfieldname;
 	int bitoffs = 0;
@@ -640,7 +641,7 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 
 		anon_offs = 0;
 		field = btf_find_struct_member(btf, type, fieldname,
-						&anon_offs);
+						&anon_offs, &mtype);
 		if (IS_ERR(field)) {
 			trace_probe_log_err(ctx->offset, BAD_BTF_TID);
 			return PTR_ERR(field);
@@ -653,7 +654,7 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 		bitoffs += anon_offs;
 
 		/* Accumulate the bit-offsets of the dot-connected fields */
-		if (btf_type_kflag(type)) {
+		if (btf_type_kflag(mtype)) {
 			bitoffs += BTF_MEMBER_BIT_OFFSET(field->offset);
 			ctx->last_bitsize = BTF_MEMBER_BITFIELD_SIZE(field->offset);
 		} else {
@@ -661,11 +662,11 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 			ctx->last_bitsize = 0;
 		}
 
-			type = btf_type_skip_modifiers(btf, field->type, NULL);
-			if (!type) {
-				trace_probe_log_err(ctx->offset, BAD_BTF_TID);
-				return -EINVAL;
-			}
+		type = btf_type_skip_modifiers(btf, field->type, NULL);
+		if (!type) {
+			trace_probe_log_err(ctx->offset, BAD_BTF_TID);
+			return -EINVAL;
+		}
 
 		if (next)
 			ctx->offset += next - fieldname;
@@ -2552,19 +2553,60 @@ int traceprobe_set_print_fmt(struct trace_probe *tp, enum probe_print_type ptype
 int traceprobe_define_arg_fields(struct trace_event_call *event_call,
 				 size_t offset, struct trace_probe *tp)
 {
+	struct trace_probe_event *tpe = trace_probe_event_from_call(event_call);
 	int ret, i;
 
+	/*
+	 * A field created by trace_define_field() only stores the name and
+	 * type pointers, it does not copy the strings. Here they point into
+	 * the probe_arg of @tp, which is freed when @tp is removed. For an
+	 * event with multiple probes attached, the field list is defined
+	 * once by the first probe but kept alive by the surviving siblings,
+	 * so removing that first probe would leave the fields referencing
+	 * freed memory. Duplicate the strings and anchor the copies on the
+	 * trace_probe_event, which lives as long as the field list itself.
+	 *
+	 * event_define_fields() ignores the return value of this hook, so
+	 * if a previous attempt failed before creating any field, it may
+	 * call here again. Release duplicates left behind by such an
+	 * attempt before starting over.
+	 */
+	for (i = 0; i < tpe->nr_field_strings; i++)
+		kfree(tpe->field_strings[i]);
+	kfree(tpe->field_strings);
+	tpe->field_strings = NULL;
+	tpe->nr_field_strings = 0;
+
+	if (tp->nr_args) {
+		tpe->field_strings = kcalloc(tp->nr_args * 2, sizeof(char *),
+					     GFP_KERNEL);
+		if (!tpe->field_strings)
+			return -ENOMEM;
+	}
+
 	/* Set argument names as fields */
 	for (i = 0; i < tp->nr_args; i++) {
 		struct probe_arg *parg = &tp->args[i];
 		const char *fmt = parg->type->fmttype;
 		int size = parg->type->size;
+		char *name, *type;
 
 		if (parg->fmt)
 			fmt = parg->fmt;
 		if (parg->count)
 			size *= parg->count;
-		ret = trace_define_field(event_call, fmt, parg->name,
+
+		name = kstrdup(parg->name, GFP_KERNEL);
+		type = kstrdup(fmt, GFP_KERNEL);
+		if (!name || !type) {
+			kfree(name);
+			kfree(type);
+			return -ENOMEM;
+		}
+		tpe->field_strings[tpe->nr_field_strings++] = name;
+		tpe->field_strings[tpe->nr_field_strings++] = type;
+
+		ret = trace_define_field(event_call, type, name,
 					 offset + parg->offset, size,
 					 parg->type->is_signed,
 					 FILTER_OTHER);
@@ -2576,6 +2618,11 @@ int traceprobe_define_arg_fields(struct trace_event_call *event_call,
 
 static void trace_probe_event_free(struct trace_probe_event *tpe)
 {
+	int i;
+
+	for (i = 0; i < tpe->nr_field_strings; i++)
+		kfree(tpe->field_strings[i]);
+	kfree(tpe->field_strings);
 	kfree(tpe->class.system);
 	kfree(tpe->call.name);
 	kfree(tpe->call.print_fmt);
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index fba1af092a9b..d1fb3520700f 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -264,6 +264,8 @@ struct trace_probe_event {
 	struct trace_event_call		call;
 	struct list_head 		files;
 	struct list_head		probes;
+	char				**field_strings;
+	int				nr_field_strings;
 	struct trace_uprobe_filter	filter[];
 };
 
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 861d857adadb..22cc3c8181b8 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -368,7 +368,7 @@ alloc_trace_uprobe(const char *group, const char *event, int nargs, bool is_ret)
 
 static void free_trace_uprobe(struct trace_uprobe *tu)
 {
-	if (!tu)
+	if (IS_ERR_OR_NULL(tu))
 		return;
 
 	path_put(&tu->path);
@@ -533,7 +533,7 @@ static int register_trace_uprobe(struct trace_uprobe *tu)
 	return ret;
 }
 
-DEFINE_FREE(free_trace_uprobe, struct trace_uprobe *, if (_T) free_trace_uprobe(_T))
+DEFINE_FREE(free_trace_uprobe, struct trace_uprobe *, free_trace_uprobe(_T))
 
 /*
  * Argument syntax:
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
