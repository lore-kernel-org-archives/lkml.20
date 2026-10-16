Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3D44E038
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161099; cv=none; b=accX8M05tzYEmxX3vqTskDpcFWrts3i/F+RlPB7duyw85uV1gTVcMVkBAS2TPYUP+hXOggPmVQdpAF8Odnrj36AwPn2w78CYNYyvFFaXCebI8vRoqDOtNmUoNkTSeQMSssUFqfIR0HQDGX1e7xAwQv58JjvBULsDThmrEXMWx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161099; c=relaxed/simple;
	bh=6CSW1oi6BvJJNUz8CQnuFVSiePuJL6ATRHlofsEh/7w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Lpw3/Edr9F7tgnyFD5UDu7JaU+2KATxxIgTZPJ4JbX2P0B2kMUgbMvt0vlBTIB2DFJh8avVzqzbMae0rqFpF6ev9ByWzaihPjnlb/6l99nma/uebUHTBE8+64/oH7fUKLn1OQ+3WYosbdVLexmqRfnBVeV2XQ4aF/6V6ZTphEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf5zwqyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf5zwqyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D3C1F000C9;
	Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161097;
	bh=rxv4MDNHp1Zp/mNSVsvzpkEi/qzAV1Jt6EEqSo28/cg=;
	h=Date:From:To:Cc:Subject:References;
	b=kf5zwqywrdi1Z8+b1o29VmsChsAtnWo3AsBnWdGleIq+6YBI9oB1/VqgF1dTTT8Ph
	 9xNuNNmQQpSROwWTpMhrfXHN1PWYIm5kvK7oka8T8SrGDB98Kz8GLd7mZIOZ2n8Xf+
	 mlFCWOPlMsx25xp3pwLvAs2S4qmsm0eUBBdqYD7kCYOVC5GfIzVMcvdSsVDwRVQ0NH
	 dlGgnDDYTQ+0ay6UZBbSHKm/Su3EbNJLnWrOV73QxwvliYe4IxqZTmlxCZYCMoH8cw
	 PAWsoWp+vvZbFpPq3Ox/C5aDsrCkCBrjSr85qh/pHFc0miiCriIpOYeIGxu1SVQdsb
	 HgzN2BplB/y+g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy8-00000000XmX-2JD8;
	Fri, 16 Oct 2026 10:31:36 -0400
Message-ID: <20261016143136.353392185@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:26 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 11/18] tracing: Rename tracing_entries_fops to tracing_capacity_fops
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Since commit 8a5f63637890 ("ring-buffer: Fix subbuf resize race with
ring buffer readers"), "capacity" refers to the memory available for
events, while "entries" refers to the number of events in a ring buffer.
As a consequence, rename trace_array::entries to capacity to align with
this convention.

While at it, rename also tracing_total_entries_fops. It is the aggragate
of all ring buffer capacities.

Link: https://patch.msgid.link/20260908090937.838544-4-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 9e1b5c35f6a9..48ecc4bb55e4 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5672,8 +5672,7 @@ tracing_syscall_buf_write(struct file *filp, const char __user *ubuf,
 }
 
 static ssize_t
-tracing_entries_read(struct file *filp, char __user *ubuf,
-		     size_t cnt, loff_t *ppos)
+tracing_capacity_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
 {
 	struct inode *inode = file_inode(filp);
 	struct trace_array *tr = inode->i_private;
@@ -5720,8 +5719,7 @@ tracing_entries_read(struct file *filp, char __user *ubuf,
 }
 
 static ssize_t
-tracing_entries_write(struct file *filp, const char __user *ubuf,
-		      size_t cnt, loff_t *ppos)
+tracing_capacity_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
 	struct inode *inode = file_inode(filp);
 	struct trace_array *tr = inode->i_private;
@@ -5748,8 +5746,7 @@ tracing_entries_write(struct file *filp, const char __user *ubuf,
 }
 
 static ssize_t
-tracing_total_entries_read(struct file *filp, char __user *ubuf,
-				size_t cnt, loff_t *ppos)
+tracing_total_capacity_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
 {
 	struct trace_array *tr = filp->private_data;
 	char buf[64];
@@ -6600,10 +6597,10 @@ static const struct file_operations tracing_pipe_fops = {
 	.release	= tracing_release_pipe,
 };
 
-static const struct file_operations tracing_entries_fops = {
+static const struct file_operations tracing_capacity_fops = {
 	.open		= tracing_open_generic_tr,
-	.read		= tracing_entries_read,
-	.write		= tracing_entries_write,
+	.read		= tracing_capacity_read,
+	.write		= tracing_capacity_write,
 	.llseek		= generic_file_llseek,
 	.release	= tracing_release_generic_tr,
 };
@@ -6623,9 +6620,9 @@ static const struct file_operations tracing_buffer_meta_fops = {
 	.release	= tracing_seq_release,
 };
 
-static const struct file_operations tracing_total_entries_fops = {
+static const struct file_operations tracing_total_capacity_fops = {
 	.open		= tracing_open_generic_tr,
-	.read		= tracing_total_entries_read,
+	.read		= tracing_total_capacity_read,
 	.llseek		= generic_file_llseek,
 	.release	= tracing_release_generic_tr,
 };
@@ -7653,7 +7650,7 @@ tracing_init_tracefs_percpu(struct trace_array *tr, long cpu)
 				tr, cpu, &tracing_stats_fops);
 
 	trace_create_cpu_file("buffer_size_kb", TRACE_MODE_WRITE, d_cpu,
-				tr, cpu, &tracing_entries_fops);
+				tr, cpu, &tracing_capacity_fops);
 
 	if (tr->range_addr_start)
 		trace_create_cpu_file("buffer_meta", TRACE_MODE_READ, d_cpu,
@@ -8998,10 +8995,10 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
 			  tr, &tracing_pipe_fops);
 
 	trace_create_file("buffer_size_kb", writable_mode, d_tracer,
-			  tr, &tracing_entries_fops);
+			  tr, &tracing_capacity_fops);
 
 	trace_create_file("buffer_total_size_kb", TRACE_MODE_READ, d_tracer,
-			  tr, &tracing_total_entries_fops);
+			  tr, &tracing_total_capacity_fops);
 
 	trace_create_file("trace_clock", writable_mode, d_tracer, tr,
 			  &trace_clock_fops);
-- 
2.53.0
