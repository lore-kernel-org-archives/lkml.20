Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EFB49B1F8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141835; cv=none; b=ITgG7MfhB8Fn0AnnueSKFmlRK9ohgWb26laDurd5Cd7jbq0VqsH7EKHlG0NJP8zGhoG4QDQpNaP0FJLx99iIPLHWOIDxA9dYpupEJ35DgcCsTV2EE/ClS0D92vnNiWmUbk24y2QcDTVQRmQoMoACrMwVnV4GithuLsVC310/Tz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141835; c=relaxed/simple;
	bh=7SJy+10+B1JqbGMkduX8APfF0bqZ1tN+8AgCM22hBt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvY9P1SG39orBsu68XIZ/vSXBjjJHkHuE7pm12KllcU726aExgnoECTGhRAL6i8TYxsgKxE6l/Ywb2K9QdFvSUbP1S/4Tv7siP88HZ1CFHvSuCYB3ehoFnVTeg/9SQATqbJG3RgxGc1+CtS0BbWycYIrfujnD3Ccfn/B1/Xd6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYYvcQ9/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYYvcQ9/"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so13206825ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141831; x=1789746631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDM41NOz5tQjdYkYAiZ0PWoFJhzzxuqUe+1JSWXFyHc=;
        b=MYYvcQ9/8FRvxNHdnIMHzpn7nxl79fjvT4EIcT7VSJ+FSzMqyTiyFmd1bIDPn4wt/o
         L/hpy8SSXirW3I0WRk58xjAfkGGZSuN4I08fSffgyBrqX+lIGcKLOKuH75Pi/QiTlWTF
         s1uNFc7x13twVtjqeAA2/ZFSxl67Q+kdJCyf3Sl5szHiU9Y7tKgStRNKmNMpQ2zqBDn+
         Nr/HMqLYgNy7VzeTTLnIi+3hMByAfYerCKdnL0GRB1pLsl2iW6v2yvRynJjJbQTbfYNx
         4Hournav7iw7wWrj2Kab2209FYLzOWN91apXuTV2p+XmQbQgNmLkKfFOAKKomZmcM2Ta
         zLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141831; x=1789746631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDM41NOz5tQjdYkYAiZ0PWoFJhzzxuqUe+1JSWXFyHc=;
        b=TExVVNaKsfz5ZkdvIqIHujtPqpRWfw3j6+c2Y2mzfuSCkWwEFRYbovg06ewLUgPtwF
         yjuwpe2hPrIwdTaZXDRLb6dhqjA04mWdXsQgquXb3ggDd966+sc2muvvUX77JGDHYxHS
         CtSz9LhurUYGTFVGj3PfheiPhFUmuFbNkNJQVKdd76I/hag711oESbngd8+wbTUp45x7
         p3LsX28DiIobaCfbPe3WjgazaU+zKzyUWvdnK6E1ADGdTnOWtb8OW41wzDMJmL/K9lIK
         9NsEFaePRlAhcyUAAFMeonWJ9WykJ6IwRwt7B1ttU7Iy2E4o+nmtLSMekhpXI2/fU2A9
         r9Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzD/mcPRUHkNhNMYCAXeDe+29dME6WJy3a5DL1y2w9M/Q8FC8RkaEvhDG8ugW9Dl9SXhAJUjDnWYgP/Uo0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldSapCdNjPvWyGPzvv+bYA+q03fzXfajm81C/bwRnjX2kqKf2W
	roAyARqB8FIMdOsnu5OzdoSj/XUfqFYeYwhxu6rcLDX7Dsbl6y66uTmt
X-Gm-Gg: AYBFou1+hIKKCKIAwLX8kP0SdbYB+VEnBJ4TNzJfL42ez9JyXs7HP+vHvnXIDVLeVmz
	x0KTIH+5zpN8hHnzLaPlY+dban1QLyjUmr7GHor8+QUG7F6bCVzkpFVXOws9uonOiQ6ajXMUnHg
	HOKd2ksnEfjOguZNidTqNEjViwsLvjx4Y4YSpeYLaZ7nvdc6XRrFgBHtMaGa42nf2PP5KMLm4fF
	bfwh3psl88pF5sQ/NtSFVhIvtXUPVgK9J7J6rZcJmix057CVwbj+fIil0rYhOJcyZWIaWwL1u+0
	LEtHGcrtZSD3J2nZWvgKYJBrtdN5WCOuKCehOOMMONaF1GxOY1+CrX/SvEWtSbq69V9f3SCRNoh
	KB/8uMz5wTJJK5XyHVJ1zEqq98IMLo4l/v2edWCN1rThow61qIib6isPh4rcx4XzISLmTVS3SXZ
	zVOdLaW0V4d40FeAEapmM4EH3VUt05PWjQzKvqbQCDWljh4jwOc4RxzIxwMPwBLjPOEFNO8EL6d
	1MDD+LS+Vq0sUt8GjY/HAtSLaKueKzfJfKkbgE=
X-Received: by 2002:a17:902:ecd0:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2dd2a1c6251mr86219225ad.1.1789141830459;
        Fri, 11 Sep 2026 08:50:30 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13634895ad.56.2026.09.11.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:50:30 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v2 1/2] tracing: add ring-buffer memory usage statistics in tracefs
Date: Fri, 11 Sep 2026 23:50:16 +0800
Message-Id: <20260911155017.3377254-2-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
References: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
 <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the memory consumed by the tracing ring buffers, rather than the
usable data capacity exposed by buffer_size_kb. Android low-memory
diagnostics need this to attribute the memory used by tracing when
calculating lost RAM.

The buffers can be spread across the global trace array, dynamically
created instances, and snapshot buffers. Userspace currently has to
discover and sum every instance, and snapshot memory is not exposed by
the per-instance totals.

Add a trace_stats directory with memory_usage_kb reporting:

  buffers:
  snapshot_buffers:

covering the global trace array and all instances across all CPUs.

The values account for the full pages backing the data sub-buffers and
reader page, plus the cached read page and mmap metadata page when
present. Slab-allocated ring-buffer metadata is not included, as it is
already reported through Slab and would be double-counted when
subtracting tracing memory from lost RAM. Remote buffers, whose pages
are externally owned, report zero.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 Documentation/trace/ftrace.rst | 12 +++++++
 include/linux/ring_buffer.h    |  1 +
 kernel/trace/ring_buffer.c     | 41 +++++++++++++++++++++++
 kernel/trace/trace.c           | 60 ++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 84f06bf0da9b..ff9d604dd1b8 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -218,6 +218,18 @@ of ftrace. Here is a list of some of the key files:
 
 	This displays the total combined size of all the trace buffers.
 
+  trace_stats/memory_usage_kb:
+
+	This reports the memory consumed by the ring buffers, as opposed to
+	the usable data capacity shown by buffer_size_kb. The value covers the
+	main and snapshot buffers of the global trace array and all tracing
+	instances. It does not include slab-allocated ring-buffer metadata.
+
+	Output::
+
+	    buffers: ...
+	    snapshot_buffers: ...
+
   buffer_subbuf_size_kb:
 
 	This sets or displays the sub buffer size. The ring buffer is broken up
diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 0670742b2d60..64eded40222c 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -166,6 +166,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
 bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
 
 unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
+unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
 unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
 
 void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 8e2485bb3aa8..292af4807c70 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6464,6 +6464,47 @@ unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_size);
 
+/**
+ * ring_buffer_memory_size - return the memory used by the buffer (in bytes)
+ * @buffer: The ring buffer.
+ * @cpu: The CPU to get ring buffer memory from.
+ *
+ * Returns the page-allocator memory consumed by @cpu, including the data
+ * sub-buffers, the reader page, the cached read page, and the mmap
+ * metadata page. Unlike ring_buffer_size(), which reports the usable data
+ * capacity, this accounts for the full pages allocated to the buffer.
+ * Remote buffers do not own page-allocator memory and report zero.
+ */
+unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu)
+{
+	struct ring_buffer_per_cpu *cpu_buffer;
+	unsigned long subbuf_size;
+	unsigned long size;
+
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
+		return 0;
+
+	/* Remote buffers use externally owned memory. */
+	if (buffer->remote)
+		return 0;
+
+	cpu_buffer = buffer->buffers[cpu];
+	subbuf_size = PAGE_SIZE << READ_ONCE(buffer->subbuf_order);
+
+	/* Data sub-buffers plus the reader page. */
+	size = (cpu_buffer->nr_pages + 1) * subbuf_size;
+
+	/* The cached read page, if present, is a full sub-buffer page. */
+	if (cpu_buffer->free_page)
+		size += subbuf_size;
+
+	/* The mmap metadata page is a single system page. */
+	if (cpu_buffer->meta_page)
+		size += PAGE_SIZE;
+
+	return size;
+}
+
 /**
  * ring_buffer_max_event_size - return the max data size of an event
  * @buffer: The ring buffer.
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 01a5e87af299..b343e03a6cf8 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5769,6 +5769,52 @@ tracing_total_entries_read(struct file *filp, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, cnt, ppos, buf, r);
 }
 
+struct trace_mem_stats {
+	unsigned long	buffers;
+	unsigned long	snapshot;
+};
+
+static void
+trace_array_buffer_memory(struct trace_array *tr, int cpu,
+			  unsigned long *buffers, unsigned long *snapshot)
+{
+	if (tr->array_buffer.buffer)
+		*buffers += ring_buffer_memory_size(tr->array_buffer.buffer, cpu);
+
+#ifdef CONFIG_TRACER_SNAPSHOT
+	if (tr->snapshot_buffer.buffer)
+		*snapshot += ring_buffer_memory_size(tr->snapshot_buffer.buffer, cpu);
+#endif
+}
+
+static struct trace_mem_stats trace_buffers_memory(void)
+{
+	struct trace_mem_stats stats = {};
+	struct trace_array *tr;
+	int cpu;
+
+	guard(mutex)(&trace_types_lock);
+
+	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
+		for_each_tracing_cpu(cpu)
+			trace_array_buffer_memory(tr, cpu, &stats.buffers,
+						  &stats.snapshot);
+	}
+
+	return stats;
+}
+
+static int trace_mem_show(struct seq_file *m, void *v)
+{
+	struct trace_mem_stats stats = trace_buffers_memory();
+
+	seq_printf(m, "buffers: %lu\n", stats.buffers >> 10);
+	seq_printf(m, "snapshot_buffers: %lu\n", stats.snapshot >> 10);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(trace_mem);
+
 #define LAST_BOOT_HEADER ((void *)1)
 
 static void *l_next(struct seq_file *m, void *v, loff_t *pos)
@@ -9188,6 +9234,18 @@ static struct notifier_block trace_module_nb = {
 };
 #endif /* CONFIG_MODULES */
 
+static __init void init_trace_stats_tracefs(void)
+{
+	struct dentry *stats_dir;
+
+	stats_dir = tracefs_create_dir("trace_stats", NULL);
+	if (!stats_dir)
+		return;
+
+	trace_create_file("memory_usage_kb", TRACE_MODE_READ, stats_dir,
+			  NULL, &trace_mem_fops);
+}
+
 static __init void tracer_init_tracefs_work_func(struct work_struct *work)
 {
 
@@ -9196,6 +9254,8 @@ static __init void tracer_init_tracefs_work_func(struct work_struct *work)
 	init_tracer_tracefs(&global_trace, NULL);
 	ftrace_init_tracefs_toplevel(&global_trace, NULL);
 
+	init_trace_stats_tracefs();
+
 	trace_create_file("tracing_thresh", TRACE_MODE_WRITE, NULL,
 			&global_trace, &tracing_thresh_fops);
 
-- 
2.34.1

