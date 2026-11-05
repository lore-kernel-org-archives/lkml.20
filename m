Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887384;
	b=4d+DecucLMSssUJTlsA4L5Am6HkTyIgy6WKPP9y820mO6xWN8xdlH0VMSCzFDZFF6GJP
	 1RVD8oGmmuYRdhjho0gITKpxB0l7tkIGNzz/ZCNAScaXlFgEujKbbb3f7YbOQ8zjSKC1u
	 An4oYyYrpUzLPCukSCu0i/qrZWYHeZ1ZMaAJG4ZCWj/5+yjxqyl/6FIlUE7jeO0/CEhPr
	 NNcA6/+shD15USv9neKDMm9tG/OeKi4iQrgSCzwd5bAcUqG792yPPc3f+ge3OieGNsw/o
	 6M3VK7CjEht33aaDRRN8tmq6o+PLp8hGqiVG93QUUB2zJJxc0FLAd6za6xZw3oAZr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OIhsjHfY+91mLh5ERTBbgCaSdhXDfj6pOLcBVrpf7dE=;
	b=p9TAod7kpFafKSeQqQLoc0HRIIBigXDQGOrPYt1FWf8QvRKNfra4m6CsEiamj0AsdhoY
	 7OfTT6IdHCSgqJX+DcwnIq4oBUoYtwaPEEsl3SW7ST9aIggM7DPxxkFmuGjI6B3+m2igj
	 ejgrn3PP6Dkftr0xlN4ty04H6vAQjC/pUBNlEhdMOeVKyUmIRIS+D4AvybDacOiRyyXph
	 7Fmc5W2URvuKqFvfka7GJ7KppI8xumJOKknkKUOL+vFJp92VUIsstiTk7iQifD9wDR2Si
	 /q6js6SyP1pQwufxAvDTDXr+Vd3pw2Tn8cMlr7+e6P56bSOwb5dEhtSi6bU1+Sf3qfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENP4g7uM;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FD606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9FD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENP4g7uM
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5170287eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887383; x=1794492183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIhsjHfY+91mLh5ERTBbgCaSdhXDfj6pOLcBVrpf7dE=;
        b=ENP4g7uMSMbYhu+BBPFSM+ov1cl3TLtkiv+NR5Zm9o66PfPSzGvWMAxPq1hEgdoAbj
         Q0u0gj0v5qXQl5pzvyMTkOvhMQsoPvda+9KglkcOwQeAWpghklVsQFGcXP2W7vs62Qat
         S8p2imnpd2cTIImdDGNX+4EquTWoMwOO4M4+rhTtKQAIjXx5D5VXDJXaJtFyMRiXuHo0
         SI6/S/YoBs6X7ix120CCdosaLh9FynSQrs996AYrLRmSvNt8/ZPdtNzt//M68NxgezzS
         /a6I1t33fP5R8lu29JQzwRAZknEeyN457PJfOD+aOCTNXSrftL6/hq7F75HK9/0i3XQ/
         vt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887383; x=1794492183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIhsjHfY+91mLh5ERTBbgCaSdhXDfj6pOLcBVrpf7dE=;
        b=BROZq64NIeuo1+Rvo4WSJhWNpMClBQUhR0n9qQrntX1kmfbPUFnGnn5kUU8Jq71Y5G
         WFJNoK/agV3QuiFo3zWioSJR/cbY6HLC7AvIXjIHhfxtnHEOuV4SRO6sbZfgbJMSPEPu
         9gAA8NykabU1y6PuqVO3d95e3GV9pZpFHYCZPqOI6nSAqQnFxLt3ge1i8eGC5eXCbFmq
         Kx3t+tWYQDaRuzbJ+RGhwKP90/cvmAlsdDrKINR7xFUVAevVbtKZKyxZWG4k70jCUUkw
         xCpjIXJmCbhVVcVmJ48rohEZDMxkhILs1JPZLjWRAyy5NWezWRA8Wt1ENHWW1x/TW9U+
         Q1cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx7cOkKekxkREQUTCS2ngZQrdbdvWqv6h75urvq5NHKt2mzZaTQ4ZXMHHMyiRQQMSpZBCTqN06Nrdiltw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X/OPWV3IJs6k3rLGb+cKqKfEuYV7Zdi6O0uH6//67qJNS+LD3
	cEpR6gpn86qUqW0U8n15ymj195oQz8LUs97lsHi9Ksg7RqHcq5DzhnBI
X-Gm-Gg: AYBFou1+ss8VB9NmK0lPxNK23oY/Vepq4KcaBKtU4iZ5YkAozqQYq50nCOIA5ngNOSp
	e1ZgxRCsEAw9UCPKBvOF9Fc2pN5hwrtHwAOQ05wUOgWDQph/3ZhbNmj1M0uCOh2A1L+6dAk20SA
	P24sgy20oEbVAW3yWxQ6w++Y/j1lE4erwplDkkVSWG3RS6WRY3kLHBmHeDCdmWaCZpdGQqytdQz
	VWf43SkBpFNCJd5sRZ6SVooGVb94UcDAL0wnCrjF6ChKc3xbzy+9fwdLJxFiInTX00R6SRIxvk2
	uKohxgwwvqYBj+A6yO5r+eGxQse1wSyheuyg9DVCTve1SEj2c5WocBeJcghiWdXem46/P/jc+iO
	U3o6V7JnRoDB5NDICJzoZTaNNBNY3MLMy9MD1FrYuiN9H85BW4ja6kzT77sA4nd27+aPsHwoZkF
	BfuAs5K3iJSABUrK7ydqSlNqD3WJazlbyc7h5wqTZ6KE8Gx7he5ypm4tL9MUpu4N9crqhe2v3NF
	dFmF6XkWlbLzBELw75NDtWB7CM47c87EbI80BFmA0mmHlv+qUxNiR/d+DSMIz2h9IyuaXNh/jqP
	kpGagQAzuhYgVRheNFx68dRIVjglfv1LDwxsGWxxpv0+WHOBBTHIbLuNEZXuYSq75oxvjg==
X-Received: by 2002:a05:701a:c907:b0:195:1a77:85f4 with SMTP id a92af1059eb24-1ac5ceee102mr26982844c88.24.1793887382662;
        Thu, 05 Nov 2026 06:03:02 -0800 (PST)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm20969616eec.24.2026.11.05.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:03:02 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v5 3/4] tracing: add per-CPU buffer memory usage statistics
Date: Thu,  5 Nov 2026 22:02:20 +0800
Message-Id: <20261105140221.44614-4-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
References: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a per-CPU view of the tracing ring-buffer memory usage under
trace_stats/per_cpu/cpuN/memory_usage_kb, using the same categorized
format as the aggregate file. Each file reports only the buffers
belonging to that CPU.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 kernel/trace/trace.c | 75 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6036e368fe10..e7e23ff38105 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5898,6 +5898,60 @@ static const struct file_operations trace_mem_fops = {
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
+		trace_array_buffer_memory(tr, cpu, &stats);
+
+	/* Account for the bootstrapping temp_buffer as well. */
+	if (temp_buffer)
+		stats.global += ring_buffer_memory_size(temp_buffer, cpu);
+
+	stats.total_system = stats.global + stats.instances +
+			     stats.snapshots + stats.remotes;
+	stats.total_carveout = stats.persistents;
+
+	return stats;
+}
+
+static int trace_mem_per_cpu_show(struct seq_file *m, void *v)
+{
+	struct trace_mem_stats stats = trace_buffers_memory_cpu((long)m->private);
+
+	seq_printf(m, "global: %lu\n", stats.global >> 10);
+	seq_printf(m, "instances: %lu\n", stats.instances >> 10);
+	seq_printf(m, "snapshots: %lu\n", stats.snapshots >> 10);
+	seq_printf(m, "persistents: %lu\n", stats.persistents >> 10);
+	seq_printf(m, "remotes: %lu\n", stats.remotes >> 10);
+	seq_printf(m, "total_system: %lu\n", stats.total_system >> 10);
+	seq_printf(m, "total_carveout: %lu\n", stats.total_carveout >> 10);
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
@@ -9416,7 +9470,9 @@ static struct notifier_block trace_module_nb = {
 
 static __init void init_trace_stats_tracefs(void)
 {
-	struct dentry *stats_dir;
+	struct dentry *stats_dir, *per_cpu_dir, *cpu_dir;
+	char cpu_dir_name[30];
+	int cpu;
 
 	stats_dir = tracefs_create_dir("trace_stats", NULL);
 	if (!stats_dir)
@@ -9424,6 +9480,23 @@ static __init void init_trace_stats_tracefs(void)
 
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

