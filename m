Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD233CF95A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540420; cv=none; b=Uv0N/7fFuf2UHJgHeBsKSVTXhW/1e9EVpmsSO8FOebTlVzWgN4NrgEnXDJHqaRKWD7wfD6pRC/JuhwhM75EjKPTVR1h6z+eTCELMFVlT+DI9h9tcwtGet+UUsF5qj3g8daJANed4pav4EwUpFtjs7GYtAuhYHFmlXCZCIsRG5uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540420; c=relaxed/simple;
	bh=lI/RQu6O/Yb93xR3KS65rHWnDrsCP/2IZ0ZL5uBvCg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=erY3H4RqwGbnjXFYCl83aEDfs0jQMdEZ1jDieHckPuC/99MX3M6E592Z+b3TxPuPbKX6Ee/djpDISqWVq9WVPp6SyR5WsNcLaWvQgDHK5m8Hdr0BCJuqS9P+RvU2c2f+RNcsL27IneExYfTTDO6+yg6hwyHaeoJjG/UCuV+UQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0CnsHLb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0CnsHLb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2470742a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540418; x=1790145218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6wWh08cQpRqAyjRlMP1xTwungU5tZmwZOqcT2GQWo=;
        b=m0CnsHLbr3rkpZcFgX81D+ZzF4QaWts7E2hsC341PJDA4jC02FAqFH2QtSppPFeArz
         wtCGlumZouGtH3ULuoPeZEJwO0AeTMmUAB628dnfrX8e10nXlCJ/HtjKaBGXRGYukAOk
         qgW9lETuoRs2P0RcWQGiyo1n3hsPuoey6TVCkWgGokFzOk9u6cQbM3++yQAHeJLT6D4P
         ujO9ecuNmOl8fGk1pxoEvBM3/hvuMuZwOp5Gvn8g8mivh4qpj4997z0GPGqc2S+IsUeD
         nz6rd2+6NVFpC2/6mAL1OW3xyzk8EP6D6jkVa1T0asU1U8K90i3RwqOkHkVWzRNW16LN
         phJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540418; x=1790145218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6wWh08cQpRqAyjRlMP1xTwungU5tZmwZOqcT2GQWo=;
        b=HTBsCOefhKhDEvb38MuiGd/t3BMR94Akc9QmatP79xGBEs/cex+xzZRI+yjBwec8XG
         tKxrk8iAeoSBYTXQrw3ORAWTqYMES3873ui5021L+xWvmsM0tKY8F0ySOTqoWMlQtZh8
         cHc6FBwmlTQq3Coa4rEaE2CdTf8XvmmWZxzWxUVXh66ryf+LwVIojqmV0R4h1iExL6bd
         SBEbfmFJLE4tzqitojpDx+Xua6HEYebSof4BjqpKIadQcPyEWz/PNpNP5oCULeLrumlB
         jm3q6xLIzD5OaYWfY4tNKQzZvviSPUEfpCl1E7Euq2OrIRYzpAXhAhxe6Ju93VhofZv6
         lEIw==
X-Forwarded-Encrypted: i=1; AKwUvBzi9e0zOBHLJ6v1VvGYOUn0vgWXbp/kjoIrXCStIfAg2hjYY1aa+PR1h8E5vSpo3EqArJHw406Zw/q7JP8=@vger.kernel.org
X-Gm-Message-State: AFuF++ma68Xc+51KBQlbEvHlT5WVqHJqGkdWC0P8Ypxnvm/Q1dt4nVLb
	AUoFFek1DsdkrUNTgiNV8B3zL8FyDwZ3qyx/UI+ksXimzaVvDuXQHKXv
X-Gm-Gg: AYBFou3oZwNJHgLz6jcbZhFYagFD4veZoMllYClvBf18s4D5Rp5eYg0vkaswj4mY56a
	6Sb13+teztYMUHRUINYpnrIY0CinkT4bVz38aEoGSSnJlyxkMeWQB0f0OrRc4Dq494j1YAt0swY
	4XhAkLJWgTACdAuKG0NNd3xjTrF53P/U8LB94QZXjZ+EnD23tsvIO4qv0M6L6mu/c363EPW6uyA
	TnCuNW40KjC3dbqGruc9V4Rvabz6U5pJpuvYuJPUgnqw3gP3b8AqqTLqiiLF8qTZPUhePGZI/Nt
	l0Yt0eBPhqpw21aEI/My/qGYzNeMl37khCj6TQiQwWhm6FdPhA1kJQDTDcEc9Sv+MJmtZloxpfX
	mv7JwMoe4zgfdbDp1F+UI7mHVvSstVoZva2JjvS4/GkW5qJDytTp1HK9UkAtjnYwSIeVJM8ixBD
	uwjKfQetdE0JAPR84xo/ipVyxufmC2IFaJBE+6iXKGbBN7dIJJbX5h4BHzV/c/CCuqubci1WH0S
	hs/5GhqFYoOnD1LPiMPgexAgqWWslqOnzLD6boh
X-Received: by 2002:a05:6a21:3b48:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3db4fb85076mr8790859637.7.1789540418176;
        Tue, 15 Sep 2026 23:33:38 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aba87basm1005550a12.23.2026.09.15.23.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:33:37 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v3 2/2] tracing: add per-CPU memory usage statistics in tracefs
Date: Wed, 16 Sep 2026 14:33:22 +0800
Message-Id: <20260916063322.472172-3-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
References: <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
 <20260916063322.472172-1-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a per-CPU view of the tracing ring-buffer memory usage under
trace_stats/per_cpu/cpuN/memory_usage_kb, using the same format as the
aggregate file. Each file reports only the buffers belonging to that CPU
across the global trace array and all tracing instances.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 Documentation/trace/ftrace.rst |  3 ++
 kernel/trace/trace.c           | 50 +++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 99ddfe26b7cd..e53cdd8d6702 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -230,6 +230,9 @@ of ftrace. Here is a list of some of the key files:
 	    buffers: ...
 	    snapshot_buffers: ...
 
+	The same file is provided under trace_stats/per_cpu/cpuN/, reporting
+	only the buffers belonging to that CPU.
+
   buffer_subbuf_size_kb:
 
 	This sets or displays the sub buffer size. The ring buffer is broken up
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 796e239fbaf9..280003916677 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5827,6 +5827,35 @@ static int trace_mem_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(trace_mem);
 
+static struct trace_mem_stats trace_buffers_memory_cpu(int cpu)
+{
+	struct trace_mem_stats stats = {};
+	struct trace_array *tr;
+
+	guard(mutex)(&trace_types_lock);
+
+	list_for_each_entry(tr, &ftrace_trace_arrays, list)
+		trace_array_buffer_memory(tr, cpu, &stats.buffers,
+					  &stats.snapshot);
+
+	/* Account for the bootstrapping temp_buffer as well. */
+	if (temp_buffer)
+		stats.buffers += ring_buffer_memory_size(temp_buffer, cpu);
+
+	return stats;
+}
+
+static int trace_mem_per_cpu_show(struct seq_file *m, void *v)
+{
+	struct trace_mem_stats stats = trace_buffers_memory_cpu((long)m->private);
+
+	seq_printf(m, "buffers: %lu\n", stats.buffers >> 10);
+	seq_printf(m, "snapshot_buffers: %lu\n", stats.snapshot >> 10);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(trace_mem_per_cpu);
+
 #define LAST_BOOT_HEADER ((void *)1)
 
 static void *l_next(struct seq_file *m, void *v, loff_t *pos)
@@ -9343,7 +9372,9 @@ static struct notifier_block trace_module_nb = {
 
 static __init void init_trace_stats_tracefs(void)
 {
-	struct dentry *stats_dir;
+	struct dentry *stats_dir, *per_cpu_dir, *cpu_dir;
+	char cpu_dir_name[30];
+	int cpu;
 
 	stats_dir = tracefs_create_dir("trace_stats", NULL);
 	if (!stats_dir)
@@ -9351,6 +9382,23 @@ static __init void init_trace_stats_tracefs(void)
 
 	trace_create_file("memory_usage_kb", TRACE_MODE_READ, stats_dir,
 			  NULL, &trace_mem_fops);
+
+	per_cpu_dir = tracefs_create_dir("per_cpu", stats_dir);
+	if (!per_cpu_dir)
+		return;
+
+	for_each_tracing_cpu(cpu) {
+		snprintf(cpu_dir_name, 30, "cpu%d", cpu);
+		cpu_dir = tracefs_create_dir(cpu_dir_name, per_cpu_dir);
+		if (!cpu_dir) {
+			pr_warn("Could not create tracefs '%s' entry\n",
+				cpu_dir_name);
+			continue;
+		}
+
+		trace_create_file("memory_usage_kb", TRACE_MODE_READ, cpu_dir,
+				  (void *)(long)cpu, &trace_mem_per_cpu_fops);
+	}
 }
 
 static __init void tracer_init_tracefs_work_func(struct work_struct *work)
-- 
2.34.1

