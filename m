Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4404908B7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990267; cv=none; b=WXUtH0PVQTjH/a8vsJjUCc+Puko7hHk8Mic1PMYsWBOJQaYgdSWrrdf3PV08q4dYBziC0/iyFzjZsiVjsoicOmOJh08Ec85Xc6nh1+Eeg0sLpOlHOOHNRMYP31t10lgaKwpKbv+ryUpVff92jFBGMIUL4+Pwz17Ey9TmQIWwk5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990267; c=relaxed/simple;
	bh=UIFR8tf0jH+Z6/LeosPsUYyPZl7jf62BEMiT9Hkjlsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KJ+CwTDuhrbhG1ECYua8gnEf1igSyOsEBIS9U9In6QLLRXIILAE4aM8U6kZrz8hTM9CnKQLXyrO0JzY3kn9KIy8teH3KZVJ2oQysPwz63nR4pZWnY/X4VIEXg6jcPAbuKoYqGA68+woFbPBkCAxdBxhulWlv63HhBvtCzmZxbcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnUd6eyg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnUd6eyg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1912893a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990265; x=1790595065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXwttS8OODeGfpP/NZhHTaRMy64nJjuxHH+rjyaVcUM=;
        b=OnUd6eygD9nqsmYym8wo8sibEIzBqc0gufypcgIaTJR2EBzDxIFrisRHiZfIdEQ9oD
         bi17dqttKHDaRse4T6E0OvTghs0eA8/IsDBZmiGssOxdMa3Qipq4eEz7tJsC5ytGBH2S
         88/PGoRPyGtTiaD+wl15Or5c1Ffft8eCn8JvWgHCqpLyA3Fy+H+S6W/7Kk3TjO+Q8jsi
         BXm93KQNjtnPvjc6OUr2eBjFQMiprPsiKsMyBkRXKbY2MgQ7nmb9OC8rn+ZD6+5x2p6C
         3Q9XY5QRv/acJPjyuOn/XaFY4NP9nV8kZTzKM7V5GIHTUbkDBxhKSp919yMhBgL5Rut2
         Y3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990265; x=1790595065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXwttS8OODeGfpP/NZhHTaRMy64nJjuxHH+rjyaVcUM=;
        b=Dmfj6byyC941GcjsOuBMHk5bB2PSPShJ4D5GHZCl8m6dMSQBlMJAiXQKdDfYFYO2Cj
         7ijbmFcnA2USqgia4Dm8/y30wL5QsvLs/D5vYyK5MRUMyAgOC8pU0uCFbyrzIpVrygKh
         zMoFOazpw3pgU/UyKolxdIjKrygrObZVOdDMftTQVPpxYhfSV1oFSc0kb2f1O0XaOiaZ
         6FyoYaoimKrRyqrj2aSx3lYuCnG/L1o6f+CD8zchjDDB2dgP+RJhKaSWGZW8lTMYO4As
         5ll2S+nWpE646UTVmiuATkDOz+3DoufWguwlWneKPSsGbI6Blv7uGqJOzFDjSSp9fFze
         QjVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0HM8u/okebozJ3uO9Lmx9ViMNbsc8QdlfMhIm+7pF0j0fAXoq7y4qoEZr++b+WtT4RPPmTIH0UFsE2t8=@vger.kernel.org
X-Gm-Message-State: AFuF++mBTr5epVUaAiu8JXJwjmRMlXToeJYK7jE77+pub7x+0Ai/YtoS
	bOCGDF5W5vyC5iSBe1jOHF1gYpfajTxNs/qV9+05bucIl+MhLCX+TIUu
X-Gm-Gg: AYBFou1t4Dh8QNStwaffWUNdW1fbXDuXqkt+LTvdibbHhU75GIebljfoL3Am2S36V7/
	CIuWzIF/P0DhTOo5erNxApgFvqg6wdMhOMLtEEIOz99FfxR35AXSbilDV0MHCm0gRSUhXvg9F/B
	ZoyCGzu7TXp/hkIozHG3MGDUYijPEj4CSi62hnQqcr34Vz+epZ2skN4WcWlYb0soYPKcSUd/eJS
	d9XVg6porrJebztYu4UnSHPSFJWLV+O4iUcKCJMaXWa9UNNYZ4JIZhnQ0fyCCFqAg+aTm/yP+Tn
	KNVVzGDWIGIaOHfGdICEgeC3UP17s+PyS8BKFvrhvkLnNxGZpaPwktLRetreuVK//9USJzo+A8L
	vY+CKdt/g6fcvzyCssS6kXt62l654OtwT+Hhd7VuB/Dfx1foRMON6EvwGjFIIvDIosz22/1jHvf
	oRNTC8qKkZO8G/509lddch5gckrifhA0i5MnfKKH+MYviYvwHvuCBgSHoT9xtJUPa4fM+EqO2tL
	PA07GiKwgwh8T4h2afK29uOm0m6WXVLWo2+kdk=
X-Received: by 2002:a17:90b:562c:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3a0516da897mr2088846a91.13.1789990264908;
        Mon, 21 Sep 2026 04:31:04 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca86d83sm14003444a91.6.2026.09.21.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:31:04 -0700 (PDT)
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
Subject: [PATCH v4 2/2] tracing: add per-CPU memory usage statistics in tracefs
Date: Mon, 21 Sep 2026 19:30:46 +0800
Message-Id: <20260921113047.1152602-3-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921113047.1152602-1-gaoxiang17@xiaomi.com>
References: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
 <20260921113047.1152602-1-gaoxiang17@xiaomi.com>
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
 kernel/trace/trace.c           | 67 +++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)

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
index d4a913ff8a69..4010f28f3ebf 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5844,6 +5844,52 @@ static const struct file_operations trace_mem_fops = {
 	.release	= single_release,
 };
 
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
+
+static int trace_mem_per_cpu_open(struct inode *inode, struct file *file)
+{
+	int ret;
+
+	ret = tracing_check_open_get_tr(NULL);
+	if (ret)
+		return ret;
+
+	return single_open(file, trace_mem_per_cpu_show, inode->i_private);
+}
+
+static const struct file_operations trace_mem_per_cpu_fops = {
+	.open		= trace_mem_per_cpu_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 #define LAST_BOOT_HEADER ((void *)1)
 
 static void *l_next(struct seq_file *m, void *v, loff_t *pos)
@@ -9360,7 +9406,9 @@ static struct notifier_block trace_module_nb = {
 
 static __init void init_trace_stats_tracefs(void)
 {
-	struct dentry *stats_dir;
+	struct dentry *stats_dir, *per_cpu_dir, *cpu_dir;
+	char cpu_dir_name[30];
+	int cpu;
 
 	/*
 	 * tracer_alloc_buffers() frees tracing_buffer_mask and temp_buffer
@@ -9376,6 +9424,23 @@ static __init void init_trace_stats_tracefs(void)
 
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

