Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA64357D0C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607679; cv=none; b=Dg+oOvDukGQiVM1eRXIyhjemenkXVVSqjNRcQj++MhBjmAk1eLCvjBKsDX8Cw1nLl/FmAQ+HVhv+Wah1u9+dJolLQaWZMCG6MZVo+5t5ZN7Pg9kL4fwvWkMj24BJei26DzIU3t1rZz0oWBvM3RdzYP78Sk38vcy+drP1V3C7WnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607679; c=relaxed/simple;
	bh=WjYK3pzeawJSBXL1J2JOmg+my2lNZqZrxPiPYoz/Tl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W9DpDVGjrIbiJHV7G5nDwF0vDt2VK8cGg8ZeyCIE7S8DgRezEIDCBhD4u2kHtww+viWqAKxRgzSqtOSZSZyT9aaBaEP48Uv1uOAcf1QHyaGt3QKPJXR30Gxmp7K+nWloh0CwPLCWetBm7TI3YPZlFiihALnXPMcFFT18Noc8BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqyGPXR3; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqyGPXR3"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2157109b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788607677; x=1789212477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ncv0qza4n7xU/ePfsTNxTo8wWj87uTeUF7PMp8e4PA=;
        b=nqyGPXR3xHd1juHLW/YnZb+9IZQ96DbnWTilkPOJzzBE3LrdpslTNLl5663Ed5t7xg
         tkexMyBB33el8kZvt2P/abmrOZva7eERHgOlCdlWKxJOD77PQRtjkwnyKFJZelCgxqmA
         q2hGwmsy7+zLGjTonVCMQMZIiq3Vd32R1P7wViG6y1OJ+IzEQjZWZeuIwKdcK7MMO4If
         4CyZnnnyIgH4Xdfwk4GmlNCGM6IyNazncPNJDdMfy/h8QaLRdzXRjP+7Pzdoynf1BAwA
         /c33zpwMGRcd3nq/DNllmbjbhXTPhfPts7bV762dkbTPsfvj143mohqBnEgIudooJ1+F
         o9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607677; x=1789212477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ncv0qza4n7xU/ePfsTNxTo8wWj87uTeUF7PMp8e4PA=;
        b=QHCTXpxZkyXE8dVhGwGck+rltMxJTvY5WsVa5eKLLUd2yLPIIGZhtTL/lhg2xtpofg
         EzRGOnFD4D0ipL40hLvz9vRMyyKq8f1+jEojTy2+PoTAe+T+8C8tXI6Sv3akrhUxDtuj
         hlIt9J8H0zrT/jUpNXV4hcBrLAqFQsICVvvW/0AE+eyJhVwPvzfIRxjC/mkoy8Edzpwx
         FEDmZy6vY45325SciKGKrYOqu3PHm1TccwZUr0UCJkVyHHGAb9axbDVyWlNz52Vw18Co
         G4W3XpgGz8+pxxsh8X7p0qX1HsEJ4KE/OQVo8GL+ev4iCJy9ycPW2NbKsaiHik6p7t5v
         zVkA==
X-Forwarded-Encrypted: i=1; AKwUvBx07ovyv55qdbZFyiK0CjCAV12wRXhEmEivRwl9RHRibu8h+wj6VH13H0qFuN9IVuN7JnjUrvXqMLoTPPg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8VFn0UJd+d6Qr4oTf/SQyWAfvIYnVHmO4+wHh48xgf5JQnKtw
	/rF4e9US7aqxZitJywDQlUnYForOSv7NjwdcpNPAzXRbRgMJpPSV9SJv
X-Gm-Gg: AYBFou1Iu9s8NozTGVwWj6qZncsdZm9FnvnQRfq1j+xOvrVQTh/ludq2itCxCHCF49v
	tPFipQoIyEVtc0K2id3oUdv/SzdknBgQ8R5EV6G8M+5ptkCUlqPNf/wmRFCGXUhwjMiUqn/j/SL
	oZNxTzZWOBh8YpOWNoaRueS/h3QkRzub81QohVXKZCnxQjs1S1D2HsdtEqn/DzoELnn6c/uKEsY
	Ivk3evOJZyMIFjQmeNc0sBdfK5koXJT08XFalWv9rfEI2wgnRcWrRoRRfarv1DcOT6+hNSZ4l5C
	awDUW5Oo9E3FnajQNDljStkxjKnNOU1BOY2p62xT7PSANnCnKSp9/eMt1GU2xiv1G8Y2cQIwTFy
	k13vXDSucZuB5ZIb0idjYBCG4Vk4MjjSTElfGO7D9LEcDEDBe/IzsUnupcWumq0FaVXDyaONXEf
	BTfYiLh1ywFMAlZ2PccjCf7TT9yE4Zd7C5oS/0VsSvsJIs1/koj6FSa3ijbBotLzdTnOKgPMzRX
	hGmGOsl6Gweij3UmnRbP3D7D5DP
X-Received: by 2002:a05:6a00:a204:b0:852:5f99:1866 with SMTP id d2e1a72fcca58-861653da118mr14724734b3a.0.1788607677497;
        Sat, 05 Sep 2026 04:27:57 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e39a38sm2228779b3a.39.2026.09.05.04.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 04:27:56 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH 2/2] tracing: add per-CPU memory usage statistics in tracefs
Date: Sat,  5 Sep 2026 19:27:32 +0800
Message-Id: <20260905112732.3705405-3-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
References: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
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
 Documentation/trace/ftrace.rst |  3 +++
 kernel/trace/trace.c           | 46 +++++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index ff9d604dd1b8..694c9ed8f241 100644
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
index b343e03a6cf8..ea05077af4a0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5815,6 +5815,31 @@ static int trace_mem_show(struct seq_file *m, void *v)
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
@@ -9236,7 +9261,9 @@ static struct notifier_block trace_module_nb = {
 
 static __init void init_trace_stats_tracefs(void)
 {
-	struct dentry *stats_dir;
+	struct dentry *stats_dir, *per_cpu_dir, *cpu_dir;
+	char cpu_dir_name[30];
+	int cpu;
 
 	stats_dir = tracefs_create_dir("trace_stats", NULL);
 	if (!stats_dir)
@@ -9244,6 +9271,23 @@ static __init void init_trace_stats_tracefs(void)
 
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

