Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910504;
	b=SrEc4rSI9DkuIf9T0X9GbFvH4iDqVYQ4TXAlc6KeDC2FxE/DwogpgL8lZrYDYrOnAf4L
	 //meP77yIyPM0jdLDOP+pzrJYc78aBWSZlVclFWxyEG4ULfnLBo1JzHv66Yst8E7X1S83
	 tmDvNJ2L4nO2+8uicClnql8kAG6DVDKhGAIVjXJlV5NqIybFolTc0Ae4jEHB26N23O2/K
	 0XNiU7kbeepSKKTERm9BjGIroHQQvn4ckB9/1h/AczVrNIW50gxWGy6kt75IcPPC80LVZ
	 fhuCUJ9TKibdDhiOIX0pelLRmFkBFAr3BSIJk0Z87VFjtm9O5/fc9HlCiMwFvKL9eeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=n+pdcSKB2hbL9DIktYA+7nnGdShz/qXB7kgGJDzRDL4=;
	b=QSRzlLDWLZ9Ag0zDdxm819QniS6DcNGp8bN+s2AfmKwDoB0tZKWvDbIV67rjHVInqQ/Q
	 PYZCL9n8TKyUa8vY16OPxd/b6qpLMAU8sg9HJRtyrxLt8Ym+Kf5lBaAyZYgCr/LTyr91U
	 3FPsIM39E1not5IMRVD2D/PsUhOrj2csstzmctzwBzsGCmksSLaYZko26sKnQx0BXEDcI
	 YztvJTYV/IxGx4FwTYrM7YoJo/ninpDO2HGs7pSH7EI63fpI4N76V2Rx7lvo1xLElXFzX
	 YPE5THCI23H6/4FAFbXGLPJ0RRdbeGcMHuLMvcs2O3qrpLwZoN0E7pKmK7mvsZF1ccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D4+UrsOI;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E26606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E26606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D4+UrsOI
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso25023915e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793910503; x=1794515303; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+pdcSKB2hbL9DIktYA+7nnGdShz/qXB7kgGJDzRDL4=;
        b=D4+UrsOI9xnBPvvqZ05pf9E1WG4jdo4EZ+XF87R8oKsmpr9X6D88B2OzUduRpeLv0R
         PAg9bzy20MRQiu1c64FNEQ96LhDPPg+PAKrqBb6dW4jovbvN327XCIrqlKoa0d/gl+2f
         GbCJR332EKh3bxR2svf8pgLx6Juj/bEO0wGZ9LQxKCCBAfSamrUosgb+FkRFKRMzSm4O
         GsWK65/LRD2Q4c3xKJxRLrc2A3/NJbHDGSUpd4mJHP+KvSQsih/i1+3tapBif0t6Kcz+
         tVPopuzWLbVbnnmu0uuD91Z33rfoI38xKZW12Gi5DriEhZvcO0Px4LZR4ZLo2ZBq14eL
         j5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910503; x=1794515303;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+pdcSKB2hbL9DIktYA+7nnGdShz/qXB7kgGJDzRDL4=;
        b=f1zVGmFcRKP0t5DlyCaoBsc/HpG4cAHli3ldXKw5U3+3CTvuUIkDe7+npfLH147Pn/
         qawRL5zbB3Mv1BV7+FoF5ug6ELkVWkzzwZnYsb74sFaNRBDYv5xtTAGSd2T5sd+RAMgU
         W2+mE+ZucyrQdgnKULbNgEBLb5vtxPqkNcdi+/2z0Ef3xpwyYzgF9qtZ7O2dAA5IEik8
         vSLeS19LEDSjhsG8KnxrrCVNHv+tPCZ2tGoRaMCrvuoplq11LmzaMBiym0pOPxqeErr+
         SBEmq0aijC6+Z270AXq2SVlarmYPJT/spoeS0Dv2m7bSMbTnEWwiG8WySnZ38UIiWzyx
         QUQw==
X-Forwarded-Encrypted: i=1; AKwUvBwbE+9iCj5tylgQLO0YDx7Cr2kYJJ2VqzT42c2CpUeZGrJpCfOnJ3nD0WYpiNP9gpHuV5og4d5CXRiueS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jMdWfxiHNseIm5tHjErrfn1NCMHNOR9wMaxdpF4AH5vdj/azT
	fnWTT7UIBf5w8Erg64wKCZRg556haigrm9CngwtD5XUK9fUhX/Hh6cA85UusyzQr+IEXSYc5yFx
	LxSN8LzXdK5GNaJvqEOy51g==
X-Received: from wmhj10.prod.google.com ([2002:a05:600c:300a:b0:4a2:df9b:ef74])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608a:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4b6dc6dec3emr4549635e9.4.1793910502519;
 Thu, 05 Nov 2026 12:28:22 -0800 (PST)
Date: Thu,  5 Nov 2026 20:28:13 +0000
In-Reply-To: <20261105202814.1350312-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105202814.1350312-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105202814.1350312-2-vdonnefort@google.com>
Subject: [PATCH 1/2] ring-buffer: Remove unused absolute timestamp mode
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit b94bc80df648 ("tracing: Use a no_filter_buffering_ref to
stop using the filter buffer") dropped the last user of
ring_buffer_set_time_stamp_abs(), there's been no one enabling absolute
timestamps on the ring buffer.

Drop the support to simplify the ring buffer code. Keep the read-only
tracefs timestamp_mode file to preserve the ABI.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 Documentation/trace/ftrace.rst | 19 ++-------
 include/linux/ring_buffer.h    |  2 -
 kernel/trace/ring_buffer.c     | 77 ++++++++++------------------------
 kernel/trace/trace.c           | 10 +----
 4 files changed, 26 insertions(+), 82 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 9423722848c6..88c0de3619be 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -712,27 +712,16 @@ of ftrace. Here is a list of some of the key files:
 
   timestamp_mode:
 
-	Certain tracers may change the timestamp mode used when
-	logging trace events into the event buffer.  Events with
-	different modes can coexist within a buffer but the mode in
-	effect when an event is logged determines which timestamp mode
-	is used for that event.  The default timestamp mode is
-	'delta'.
-
-	Usual timestamp modes for tracing:
+	Shows the timestamp mode used when logging trace events into
+	the event buffer.
 
 	  # cat timestamp_mode
-	  [delta] absolute
+	  [delta]
 
 	  The timestamp mode with the square brackets around it is the
 	  one in effect.
 
-	  delta: Default timestamp mode - timestamp is a delta against
-	         a per-buffer timestamp.
-
-	  absolute: The timestamp is a full timestamp, not a delta
-                 against some other value.  As such it takes up more
-                 space and is less efficient.
+	  delta: Timestamp is a delta against a per-buffer timestamp.
 
   hwlat_detector:
 
diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 649b2276b557..378d336effca 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -220,8 +220,6 @@ void ring_buffer_normalize_time_stamp(struct trace_buffer *buffer,
 				      int cpu, u64 *ts);
 void ring_buffer_set_clock(struct trace_buffer *buffer,
 			   u64 (*clock)(void));
-void ring_buffer_set_time_stamp_abs(struct trace_buffer *buffer, bool abs);
-bool ring_buffer_time_stamp_abs(struct trace_buffer *buffer);
 
 size_t ring_buffer_nr_dirty_pages(struct trace_buffer *buffer, int cpu);
 
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..7852f36a0dc6 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -480,14 +480,12 @@ struct rb_event_info {
  * Used for the add_timestamp
  *  NONE
  *  EXTEND - wants a time extend
- *  ABSOLUTE - the buffer requests all events to have absolute time stamps
  *  FORCE - force a full time stamp.
  */
 enum {
 	RB_ADD_STAMP_NONE		= 0,
 	RB_ADD_STAMP_EXTEND		= BIT(1),
-	RB_ADD_STAMP_ABSOLUTE		= BIT(2),
-	RB_ADD_STAMP_FORCE		= BIT(3)
+	RB_ADD_STAMP_FORCE		= BIT(2)
 };
 /*
  * Used for which event context the event is in.
@@ -595,7 +593,6 @@ struct trace_buffer {
 	u64				(*clock)(void);
 
 	struct rb_irq_work		irq_work;
-	bool				time_stamp_abs;
 
 	unsigned long			range_addr_start;
 	unsigned long			range_addr_end;
@@ -3052,16 +3049,6 @@ void ring_buffer_set_clock(struct trace_buffer *buffer,
 	buffer->clock = clock;
 }
 
-void ring_buffer_set_time_stamp_abs(struct trace_buffer *buffer, bool abs)
-{
-	buffer->time_stamp_abs = abs;
-}
-
-bool ring_buffer_time_stamp_abs(struct trace_buffer *buffer)
-{
-	return buffer->time_stamp_abs;
-}
-
 static inline unsigned long rb_page_entries(struct buffer_page *bpage)
 {
 	return local_read(&bpage->entries) & RB_WRITE_MASK;
@@ -4070,8 +4057,7 @@ static void rb_add_timestamp(struct ring_buffer_per_cpu *cpu_buffer,
 				      u64 *delta,
 				      unsigned int *length)
 {
-	bool abs = info->add_timestamp &
-		(RB_ADD_STAMP_FORCE | RB_ADD_STAMP_ABSOLUTE);
+	bool abs = info->add_timestamp & RB_ADD_STAMP_FORCE;
 
 	if (unlikely(info->delta > (1ULL << 59))) {
 		/*
@@ -4752,8 +4738,7 @@ static void check_buffer(struct ring_buffer_per_cpu *cpu_buffer,
 	if (tail == CHECK_FULL_PAGE) {
 		full = true;
 		tail = rb_data_page_commit(dpage);
-	} else if (info->add_timestamp &
-		   (RB_ADD_STAMP_FORCE | RB_ADD_STAMP_ABSOLUTE)) {
+	} else if (info->add_timestamp & RB_ADD_STAMP_FORCE) {
 		/* Ignore events with absolute time stamps */
 		return;
 	}
@@ -4818,26 +4803,22 @@ __rb_reserve_next(struct ring_buffer_per_cpu *cpu_buffer,
 	barrier();
 	info->ts = rb_time_stamp(cpu_buffer->buffer);
 
-	if ((info->add_timestamp & RB_ADD_STAMP_ABSOLUTE)) {
-		info->delta = info->ts;
+	/*
+	 * If interrupting an event time update, we may need an
+	 * absolute timestamp.
+	 * Don't bother if this is the start of a new page (w == 0).
+	 */
+	if (!w) {
+		/* Use the sub-buffer timestamp */
+		info->delta = 0;
+	} else if (unlikely(info->before != info->after)) {
+		info->add_timestamp |= RB_ADD_STAMP_FORCE | RB_ADD_STAMP_EXTEND;
+		info->length += RB_LEN_TIME_EXTEND;
 	} else {
-		/*
-		 * If interrupting an event time update, we may need an
-		 * absolute timestamp.
-		 * Don't bother if this is the start of a new page (w == 0).
-		 */
-		if (!w) {
-			/* Use the sub-buffer timestamp */
-			info->delta = 0;
-		} else if (unlikely(info->before != info->after)) {
-			info->add_timestamp |= RB_ADD_STAMP_FORCE | RB_ADD_STAMP_EXTEND;
+		info->delta = info->ts - info->after;
+		if (unlikely(test_time_stamp(info->delta))) {
+			info->add_timestamp |= RB_ADD_STAMP_EXTEND;
 			info->length += RB_LEN_TIME_EXTEND;
-		} else {
-			info->delta = info->ts - info->after;
-			if (unlikely(test_time_stamp(info->delta))) {
-				info->add_timestamp |= RB_ADD_STAMP_EXTEND;
-				info->length += RB_LEN_TIME_EXTEND;
-			}
 		}
 	}
 
@@ -4865,8 +4846,7 @@ __rb_reserve_next(struct ring_buffer_per_cpu *cpu_buffer,
 		 * will be different and then next event will just be forced
 		 * to use an absolute timestamp.
 		 */
-		if (likely(!(info->add_timestamp &
-			     (RB_ADD_STAMP_FORCE | RB_ADD_STAMP_ABSOLUTE))))
+		if (likely(!(info->add_timestamp & RB_ADD_STAMP_FORCE)))
 			/* This did not interrupt any time update */
 			info->delta = info->ts - info->after;
 		else
@@ -4919,8 +4899,7 @@ __rb_reserve_next(struct ring_buffer_per_cpu *cpu_buffer,
 	 * If this is the first commit on the page, then it has the same
 	 * timestamp as the page itself.
 	 */
-	if (unlikely(!tail && !(info->add_timestamp &
-				(RB_ADD_STAMP_FORCE | RB_ADD_STAMP_ABSOLUTE))))
+	if (unlikely(!tail && !(info->add_timestamp & RB_ADD_STAMP_FORCE)))
 		info->delta = 0;
 
 	/* We reserved something on the buffer */
@@ -4951,7 +4930,6 @@ rb_reserve_next_event(struct trace_buffer *buffer,
 	struct ring_buffer_event *event;
 	struct rb_event_info info;
 	int nr_loops = 0;
-	int add_ts_default;
 
 	/*
 	 * ring buffer does cmpxchg as well as atomic64 operations
@@ -4984,17 +4962,8 @@ rb_reserve_next_event(struct trace_buffer *buffer,
 
 	info.length = rb_calculate_event_length(length);
 
-	if (ring_buffer_time_stamp_abs(cpu_buffer->buffer)) {
-		add_ts_default = RB_ADD_STAMP_ABSOLUTE;
-		info.length += RB_LEN_TIME_EXTEND;
-		if (info.length > rb_subbuf_max_data_size(cpu_buffer->buffer))
-			goto out_fail;
-	} else {
-		add_ts_default = RB_ADD_STAMP_NONE;
-	}
-
  again:
-	info.add_timestamp = add_ts_default;
+	info.add_timestamp = RB_ADD_STAMP_NONE;
 	info.delta = 0;
 
 	/*
@@ -5012,7 +4981,7 @@ rb_reserve_next_event(struct trace_buffer *buffer,
 	event = __rb_reserve_next(cpu_buffer, &info);
 
 	if (unlikely(PTR_ERR(event) == -EAGAIN)) {
-		if (info.add_timestamp & (RB_ADD_STAMP_FORCE | RB_ADD_STAMP_EXTEND))
+		if (info.add_timestamp)
 			info.length -= RB_LEN_TIME_EXTEND;
 		goto again;
 	}
@@ -6574,10 +6543,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_capacity);
  */
 unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer)
 {
-	/* If abs timestamp is requested, events have a timestamp too */
-	if (ring_buffer_time_stamp_abs(buffer))
-		return rb_subbuf_max_data_size(buffer) - RB_LEN_TIME_EXTEND;
-
 	return rb_subbuf_max_data_size(buffer);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_max_event_size);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e8c4efa8107b..760c872fc452 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4220,7 +4220,6 @@ static const char readme_msg[] =
 #endif
 	"\n  timestamp_mode\t- view the mode used to timestamp events\n"
 	"       delta:   Delta difference against a buffer-wide timestamp\n"
-	"    absolute:   Absolute (standalone) timestamp\n"
 	"\n  trace_marker\t\t- Writes into this file writes into the kernel buffer\n"
 	"\n  trace_marker_raw\t\t- Writes into this file writes binary data into the kernel buffer\n"
 	"  tracing_cpumask\t- Limit which CPUs to trace\n"
@@ -6567,14 +6566,7 @@ static int tracing_clock_open(struct inode *inode, struct file *file)
 
 static int tracing_time_stamp_mode_show(struct seq_file *m, void *v)
 {
-	struct trace_array *tr = m->private;
-
-	guard(mutex)(&trace_types_lock);
-
-	if (ring_buffer_time_stamp_abs(tr->array_buffer.buffer))
-		seq_puts(m, "delta [absolute]\n");
-	else
-		seq_puts(m, "[delta] absolute\n");
+	seq_puts(m, "[delta]\n");
 
 	return 0;
 }
-- 
2.56.0.455.g6c5a503b38-goog

