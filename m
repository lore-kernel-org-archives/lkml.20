Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887379;
	b=BfvRtg18y5QgxeF48HvVdebxMh4LE/RgfTxJCA0kzrMn6APYTfO/CfkT+bfHO+bCCe5V
	 SnCmK4SdRDvoo8oXd25VGdaHIc2JEo6OYSWWL+2KzHvk7HZzhRSU8wyktD7xHh1mpbvvB
	 gCh1NCnD99TSN8ohY7ri4fzW0w6GHaXW2Nk8aJIs2qV4vD4hhfTAewK2PRhIdLP79YDv3
	 hVCmieGKIMZY1R6HSwZi3lgM+Dd55Jrixm41tIRvQLbeqQ86rxp6AOOglHUV2A3GRR38m
	 kGHTAkfQKUhd+qgZgluGoj41duCGo7v+Q5WzRe75/3vbTmlTO6xOObfpfjeXmDpuXCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zWzdUkniK2DubaKSt9KrrXa9DMcVat1kchWBMsUic1M=;
	b=gAzU2iTuKXTXSSWSlEB2mbKK1pMDX0jPso/rFsnETKXAvxvtfiyPkHWpOr5hw4yxjmyW
	 ylzn0FHZQ+BNGf2+zyja4NpMKXv+gJh0SQmNsXDz8BlATCmQmh7HgBPk0ntRZ/AT6NQZn
	 23SS1q8Y8gwRv26cAXNDrvK0sVG6cSosST+N5ZQLIc8SPwpKx9xiUWI+939mH0xN19vdd
	 qg8xibou2Y/xTYYy3sws3py+356edhfujtOoltS9LhijSTl3v68f3XzOnFHL327SwjXAe
	 V9TcWqccRudMh2W7RtEX5JUwvuN0hXs2Tr6RJZHmHKOugM03//IG8H7MatqPVHs3ZgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5YxSlFJ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB042606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB042606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5YxSlFJ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b1ce85287aso1661527c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887378; x=1794492178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWzdUkniK2DubaKSt9KrrXa9DMcVat1kchWBMsUic1M=;
        b=H5YxSlFJNdaOdzfHiMdkN5TABx+o3DT8+eJOGATLpz78twsSJBtb9smSPQc9CXySQH
         bDIq+8oqHdtYhkZrmBC/7muPctZEud7dUB6/m8iRL9G60TCfUjTFrTefOwYumL2mlXAc
         ygsS+jn37vO7PeTnzKjsVjs6NL/31aUEsh1piWdNW21X88A5AJsLbe+OSzZKwbb5Efsk
         qCafV+FFL+HHhPu1/xTs7fRhpUKZvnS3ECPhQIviOQyFHVrh4JgqQ4p0AMOCZ5fpwmBn
         YoMmW7rjOgSzGT/yIyEU/5BV7yj4y07Y+TlBA4V72ZAxkidx5HOWvg0MOR9jjK6WhE7s
         npQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887378; x=1794492178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWzdUkniK2DubaKSt9KrrXa9DMcVat1kchWBMsUic1M=;
        b=VlqtFRO1flt3cPTbbH6Q/4cVcf1SW87PqX/UH2/7JdZMnkalpLpKP0vmgZq1STmK3x
         mSVZhMhBnyZ9EjMiy33rHfCCLBB4ufxIE0wf929Y3KBo+oHRVx5Cvkf1f3TMIoa7Zy8p
         l9lMMRy0JxRQGF5dBDJfvnVtJxsF6Q+gtCMsk8/vq4VmBAbB5aEYKxIAYYxeag7EcbEo
         /0mErHyNv0F42xdkzSD0J9HJu4m1PEBm1SNl69UqKi0NI0LeV/p43+t8j9ABGYytBExL
         86tZRg8P8LT3SV59uP0dCR4mmG7xmn2X3Gpqolq1WBB31nBC2EWuChdvbh31CVXRxSdz
         fl+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzP0tnTOf899fbK1UzwUv8FQQPmmdwOZrYoIJI3mN9fRYRWTflcaWSZ+Inxe5RQ405AO2ev08ppllaQKyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iXATG1Hggw9wz9g4tXl+LYuyL3nra5Lh575lIl86xc9PrLN2r
	8sV74d5UqG660ZDnBq81At0UOW+Lq1EFm8E0H3ViAY+UaC6aSg7NRhFw
X-Gm-Gg: AYBFou32fuh5OX8gSc6GHtO92ivCUMRs1zULCNB1mUWoHIgyWW7CDFxIEtSmnJYuTSI
	aQAWaDNqaxBnmsefn+QlUDmVHt/y0oCCxeSxuyg/J7VykO4c2D+H6Ly0hQfduvc7qtdXUuxz5W0
	vehSZc4iv/cP4TJJ32OndaMe/6OKPECwuxKh3FfAhY0yzFQMuD7qOr/rsy9W6aNrRCnVb35B5/A
	BQurLfAZUADQXkZ5qWgm+8jRwd30IdDEDF7TsEOtHNx+ZZ6KDznQwgZEFXPdJZirZ98i6hvtjTP
	IrT9x1JA+p52W1YyK6LEu/zsPW8xAd5ZKLRndfu6+U8tBWMzvgmYt4M/i+MTymsJOzWx4BKoq8j
	klqxF/70rAiqZHwuyMOteolniGbllVHDNs3qMvNkTpXdrT2Ala2JYfui2weh7nMhqblblC8L1B+
	wbejO0vgyXYMIniTbEk23ecMQkAqYoHjZt88GSv/xyrcHyBMFfdnD+fL1IOvSBU40JOmBn4V/aQ
	cOtgZ87tZTqyZN4/jwGElMlCBKD6B3cNSyoFOM9NZMx/hCmbv5VJpePmtC6midR5r10zcfV5yml
	Q88rIPgKNNbzvpHpH7+tRyPBUBtBnLGt5Ni+YRvdy9cOkUG676RbNC+AR7Nv92ltRHI8iw==
X-Received: by 2002:a05:7022:1104:b0:19d:6484:869f with SMTP id a92af1059eb24-1ac5c369c59mr24480342c88.7.1793887377455;
        Thu, 05 Nov 2026 06:02:57 -0800 (PST)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm20969616eec.24.2026.11.05.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:57 -0800 (PST)
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
Subject: [PATCH v5 2/4] tracing: add aggregate buffer memory usage statistics
Date: Thu,  5 Nov 2026 22:02:19 +0800
Message-Id: <20261105140221.44614-3-gaoxiang17@xiaomi.com>
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

Add a trace_stats directory with memory_usage_kb reporting the page
memory consumed by the tracing ring buffers, categorized by buffer type
and memory source:

  global:
  instances:
  snapshots:
  persistents:
  remotes:
  total_system:
  total_carveout:

The global, instances, and snapshots values come from the page
allocator. Persistent buffers use reserved memory and are reported under
persistents, while the backup instance uses vmalloc and is skipped since
it is already accounted in VmallocUsed. Remote buffers are not yet
enumerated and report zero.

total_system is the page-allocator memory that contributes to lost RAM,
while total_carveout is reserved memory that was never in the free pool.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 kernel/trace/trace.c | 115 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e8c4efa8107b..6036e368fe10 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5797,6 +5797,107 @@ tracing_total_capacity_read(struct file *filp, char __user *ubuf, size_t cnt, lo
 	return simple_read_from_buffer(ubuf, cnt, ppos, buf, r);
 }
 
+struct trace_mem_stats {
+	unsigned long	global;
+	unsigned long	instances;
+	unsigned long	snapshots;
+	unsigned long	persistents;
+	unsigned long	remotes;
+	unsigned long	total_system;
+	unsigned long	total_carveout;
+};
+
+static void
+trace_array_buffer_memory(struct trace_array *tr, int cpu,
+			  struct trace_mem_stats *stats)
+{
+	if (tr->range_addr_start) {
+		/*
+		 * Persistent buffers use reserved memory (carveout). The
+		 * backup instance uses vmalloc and is already accounted in
+		 * VmallocUsed, so skip it.
+		 */
+		if (!(tr->flags & TRACE_ARRAY_FL_VMALLOC))
+			stats->persistents +=
+				ring_buffer_memory_size(tr->array_buffer.buffer, cpu);
+	} else if (tr->flags & TRACE_ARRAY_FL_GLOBAL) {
+		stats->global +=
+			ring_buffer_memory_size(tr->array_buffer.buffer, cpu);
+	} else {
+		stats->instances +=
+			ring_buffer_memory_size(tr->array_buffer.buffer, cpu);
+	}
+
+#ifdef CONFIG_TRACER_SNAPSHOT
+	if (tr->snapshot_buffer.buffer)
+		stats->snapshots +=
+			ring_buffer_memory_size(tr->snapshot_buffer.buffer, cpu);
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
+			trace_array_buffer_memory(tr, cpu, &stats);
+	}
+
+	/*
+	 * temp_buffer is allocated in tracer_alloc_buffers() and is never
+	 * attached to a trace array. It temporarily holds event data for
+	 * triggers when tracing is off. Account for its pages too.
+	 */
+	if (temp_buffer) {
+		for_each_tracing_cpu(cpu)
+			stats.global += ring_buffer_memory_size(temp_buffer, cpu);
+	}
+
+	stats.total_system = stats.global + stats.instances +
+			     stats.snapshots + stats.remotes;
+	stats.total_carveout = stats.persistents;
+
+	return stats;
+}
+
+static int trace_mem_show(struct seq_file *m, void *v)
+{
+	struct trace_mem_stats stats = trace_buffers_memory();
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
+static int trace_mem_open(struct inode *inode, struct file *file)
+{
+	int ret;
+
+	ret = tracing_check_open_get_tr(NULL);
+	if (ret)
+		return ret;
+
+	return single_open(file, trace_mem_show, inode->i_private);
+}
+
+static const struct file_operations trace_mem_fops = {
+	.open		= trace_mem_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 #define LAST_BOOT_HEADER ((void *)1)
 
 static void *l_next(struct seq_file *m, void *v, loff_t *pos)
@@ -9313,6 +9414,18 @@ static struct notifier_block trace_module_nb = {
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
 	/*
@@ -9327,6 +9440,8 @@ static __init void tracer_init_tracefs_work_func(struct work_struct *work)
 	init_tracer_tracefs(&global_trace, NULL);
 	ftrace_init_tracefs_toplevel(&global_trace, NULL);
 
+	init_trace_stats_tracefs();
+
 	trace_create_file("tracing_thresh", TRACE_MODE_WRITE, NULL,
 			&global_trace, &tracing_thresh_fops);
 
-- 
2.34.1

