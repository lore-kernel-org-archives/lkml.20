Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E613783C5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161099; cv=none; b=FwrjIN4uW0MSyXFXqpP9zr4Y+awSSuQ0Wi7XWufv4IdA+MmE4o/X6N1zyV7vSz2vJuDS+a8zeNTfCaqxl/vvpxPQmcC9dRo9SbBdqhFcH7tulXECUybQShULhuUJ7WKvWIRSp57QaUDp3C2ma/FxO6uzdOQltpmViseXxoL6L6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161099; c=relaxed/simple;
	bh=/MUSBn+c+CwtcskmWdGRJIqcPSIlaZ9sQ/D6oXhNJ6A=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=OWE95ShqRoplB/npnhSNKHirv1oRxXqlcMj+bOswp4cE/o6CLn8yWNukNbUenCBE1SwZ/+l8IMC5gYpROFLTQ5V0bBlvTohLsZ4Cs2Q6msF0uuD+aHOaGaJjyaWAWgZQZ09Nd0VOsW4xQ1KkvEVkYowA4eD91QzO0g9kTQUlPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILKe3FNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILKe3FNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E2F1F000C7;
	Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161097;
	bh=rrywJ4I8LZphuKOWyehQL+cgrUNdU2pohj36KRjZ7kc=;
	h=Date:From:To:Cc:Subject:References;
	b=ILKe3FNabLrrN2z8jHWhSwquBxHV///1Xa977A6F4MTc+ioFwG0TpyFN7E89aC7mY
	 1ADPZxo/ddz6dTssym79Hnd8qEJcZmD/+gm+eQ2FXRgK99KBIPttFzI+1Qy8KL4msV
	 Vi9+3L03ReTDXEh4n1XuZnDOpoNE3AcRD9EVDSQoA+muwJ+gUWvoHM7AOkJ4H6mt3w
	 4bYuDO8LR1DGFQGhI2NbGRvd8ugm3izGFkG9BdDeSbIlr97ZaW6sOtizHlxAbL9YpZ
	 5rJaJV6yxi/3CvggbvVlDMhWBlTKzx15KinS2sBo5/DqwQCfDvHreAtfiyKDIawbSc
	 x+0eOOItfW8mQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy8-00000000Xlz-1P9d;
	Fri, 16 Oct 2026 10:31:36 -0400
Message-ID: <20261016143136.150275717@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:25 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 10/18] tracing: Rename trace_array::entries to capacity
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
this convention and avoid any confusion.

Rename also the helper functions trace_set_buffer_entries and
update_buffer_entries.

Link: https://patch.msgid.link/20260908090937.838544-3-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c          | 26 +++++++++++++-------------
 kernel/trace/trace.h          |  4 ++--
 kernel/trace/trace_snapshot.c | 14 +++++++-------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 1054c9b29aed..9e1b5c35f6a9 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4701,20 +4701,20 @@ int tracer_init(struct tracer *t, struct trace_array *tr)
 	return t->init(tr);
 }
 
-void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val)
+void trace_set_buffer_capacity(struct array_buffer *buf, unsigned long val)
 {
 	int cpu;
 
 	for_each_tracing_cpu(cpu)
-		per_cpu_ptr(buf->data, cpu)->entries = val;
+		per_cpu_ptr(buf->data, cpu)->capacity = val;
 }
 
-static void update_buffer_entries(struct array_buffer *buf, int cpu)
+static void update_buffer_capacity(struct array_buffer *buf, int cpu)
 {
 	if (cpu == RING_BUFFER_ALL_CPUS) {
-		trace_set_buffer_entries(buf, ring_buffer_capacity(buf->buffer, 0));
+		trace_set_buffer_capacity(buf, ring_buffer_capacity(buf->buffer, 0));
 	} else {
-		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_capacity(buf->buffer, cpu);
+		per_cpu_ptr(buf->data, cpu)->capacity = ring_buffer_capacity(buf->buffer, cpu);
 	}
 }
 
@@ -4770,12 +4770,12 @@ static int __tracing_resize_ring_buffer(struct trace_array *tr,
 		goto out_start;
 	}
 
-	update_buffer_entries(&tr->snapshot_buffer, cpu);
+	update_buffer_capacity(&tr->snapshot_buffer, cpu);
 
  out:
 #endif /* CONFIG_TRACER_SNAPSHOT */
 
-	update_buffer_entries(&tr->array_buffer, cpu);
+	update_buffer_capacity(&tr->array_buffer, cpu);
  out_start:
 	tracing_start_tr(tr);
 	return ret;
@@ -5694,8 +5694,8 @@ tracing_entries_read(struct file *filp, char __user *ubuf,
 		for_each_tracing_cpu(cpu) {
 			/* fill in the size from first enabled cpu */
 			if (size == 0)
-				size = per_cpu_ptr(tr->array_buffer.data, cpu)->entries;
-			if (size != per_cpu_ptr(tr->array_buffer.data, cpu)->entries) {
+				size = per_cpu_ptr(tr->array_buffer.data, cpu)->capacity;
+			if (size != per_cpu_ptr(tr->array_buffer.data, cpu)->capacity) {
 				buf_size_same = 0;
 				break;
 			}
@@ -5711,7 +5711,7 @@ tracing_entries_read(struct file *filp, char __user *ubuf,
 		} else
 			r = sprintf(buf, "X\n");
 	} else
-		r = sprintf(buf, "%lu\n", per_cpu_ptr(tr->array_buffer.data, cpu)->entries >> 10);
+		r = sprintf(buf, "%lu\n", per_cpu_ptr(tr->array_buffer.data, cpu)->capacity >> 10);
 
 	mutex_unlock(&trace_types_lock);
 
@@ -5758,7 +5758,7 @@ tracing_total_entries_read(struct file *filp, char __user *ubuf,
 
 	mutex_lock(&trace_types_lock);
 	for_each_tracing_cpu(cpu) {
-		size += per_cpu_ptr(tr->array_buffer.data, cpu)->entries >> 10;
+		size += per_cpu_ptr(tr->array_buffer.data, cpu)->capacity >> 10;
 		if (!tr->ring_buffer_expanded)
 			expanded_size += trace_buf_size >> 10;
 	}
@@ -8519,8 +8519,8 @@ int allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int
 	}
 
 	/* Allocate the first page for all buffers */
-	trace_set_buffer_entries(&tr->array_buffer,
-				 ring_buffer_capacity(tr->array_buffer.buffer, 0));
+	trace_set_buffer_capacity(&tr->array_buffer,
+				  ring_buffer_capacity(tr->array_buffer.buffer, 0));
 
 	return 0;
 }
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 26390e06969e..0f0786700f99 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -191,7 +191,7 @@ struct trace_array;
 struct trace_array_cpu {
 	local_t			disabled;
 
-	unsigned long		entries;
+	unsigned long		capacity;
 	unsigned long		saved_latency;
 	unsigned long		critical_start;
 	unsigned long		critical_end;
@@ -731,7 +731,7 @@ ssize_t tracing_nsecs_read(unsigned long *ptr, char __user *ubuf,
 ssize_t tracing_nsecs_write(unsigned long *ptr, const char __user *ubuf,
 			    size_t cnt, loff_t *ppos);
 
-void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val);
+void trace_set_buffer_capacity(struct array_buffer *buf, unsigned long val);
 
 /*
  * Should be used after trace_array_get(), trace_types_lock
diff --git a/kernel/trace/trace_snapshot.c b/kernel/trace/trace_snapshot.c
index 07b43c9863a2..d7308f3b505f 100644
--- a/kernel/trace/trace_snapshot.c
+++ b/kernel/trace/trace_snapshot.c
@@ -142,18 +142,18 @@ int resize_buffer_duplicate_size(struct array_buffer *trace_buf,
 	if (cpu_id == RING_BUFFER_ALL_CPUS) {
 		for_each_tracing_cpu(cpu) {
 			ret = ring_buffer_resize(trace_buf->buffer,
-				 per_cpu_ptr(size_buf->data, cpu)->entries, cpu);
+				 per_cpu_ptr(size_buf->data, cpu)->capacity, cpu);
 			if (ret < 0)
 				break;
-			per_cpu_ptr(trace_buf->data, cpu)->entries =
-				per_cpu_ptr(size_buf->data, cpu)->entries;
+			per_cpu_ptr(trace_buf->data, cpu)->capacity =
+				per_cpu_ptr(size_buf->data, cpu)->capacity;
 		}
 	} else {
 		ret = ring_buffer_resize(trace_buf->buffer,
-				 per_cpu_ptr(size_buf->data, cpu_id)->entries, cpu_id);
+				 per_cpu_ptr(size_buf->data, cpu_id)->capacity, cpu_id);
 		if (ret == 0)
-			per_cpu_ptr(trace_buf->data, cpu_id)->entries =
-				per_cpu_ptr(size_buf->data, cpu_id)->entries;
+			per_cpu_ptr(trace_buf->data, cpu_id)->capacity =
+				per_cpu_ptr(size_buf->data, cpu_id)->capacity;
 	}
 
 	return ret;
@@ -193,7 +193,7 @@ void free_snapshot(struct trace_array *tr)
 	 */
 	ring_buffer_subbuf_order_set(tr->snapshot_buffer.buffer, 0);
 	ring_buffer_resize(tr->snapshot_buffer.buffer, 1, RING_BUFFER_ALL_CPUS);
-	trace_set_buffer_entries(&tr->snapshot_buffer, 1);
+	trace_set_buffer_capacity(&tr->snapshot_buffer, 1);
 	tracing_reset_online_cpus(&tr->snapshot_buffer);
 	tr->allocated_snapshot = false;
 }
-- 
2.53.0
