Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B493E5A2F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161098; cv=none; b=qP1E4kFeJL89xYIgu3ivd4rNDPJvdkh2ZblmwZNAXeIE5mgKs6P2Sc4qCvlHN7xPXMQHA9qP+/2g4gvFFk3sa+RxWpWiefBVnc80cJUnqEgQz/D3jc6JtdFNiqk5MSn9jsllxGBS/hxeC7b9MkvCgpTbC0O+bWaZ0CGKAITgrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161098; c=relaxed/simple;
	bh=vRqyePzXSGR4tKuoIKteIcUpYt8Nyg299P4AcbgNSlc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=O6rKUXjoF3ldWv9N/sdW0k359oLiXhRwMqBnHh3s7iVklIJcn/+c6WLFl6EjHJohdcEGemMGwcPWs2Ib87dx3yDbXG7xzNP3D88HE/H3+qXFTSzZbyJsy1k9WmAZwOrQENx9B0XXghZzIIymlutNDZe6aW1Qv4Uv3o7w6+Slerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0AG5EbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0AG5EbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C618D1F000C5;
	Fri, 16 Oct 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161096;
	bh=d3RmsGujCQW2wwVTfLTMDo7/s0dpsegfHFrwZ9Dww4U=;
	h=Date:From:To:Cc:Subject:References;
	b=Z0AG5EbY7StbvQMOddR4pzjPyEKGbMV2Qo//Y+z+voD+tNXpYqK00JmmrpFt7Wd5Y
	 3XsVuBObvIxC4R7JEqKf9W8jdZ3IECmcgRAo1Z1rLacRW0e5cgLYFKHKtz8l5irdmM
	 A+ruFCIjrFIv8dl0MGcdB23gcivzb8VWXwCVbr/bbJxmdNzH2GgoQ/WadsC/+98Ha6
	 MgoZZjTPjoBHPSTBmgrOgsHMhvCIXQu7iMCDvo9iMUAOM1Ro3LGbhsLJqI7/+7QKlR
	 T8btGm6GeYotdotGbqzuHz1BlZsxlv9SyKfMudftgvDQJtaV1RvraTWBUVNmyCirQq
	 DMVr62V+8vctQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy8-00000000XlP-0YKn;
	Fri, 16 Oct 2026 10:31:36 -0400
Message-ID: <20261016143135.930816404@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:24 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 09/18] ring-buffer: Rename ring_buffer_size() to ring_buffer_capacity()
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
events (excluding subbuffer headers) while "size" refers to the raw
allocation.  ring_buffer_size() actually calculates this event capacity.
Rename it to ring_buffer_capacity() to align with this convention.

Link: https://patch.msgid.link/20260908090937.838544-2-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/ring_buffer.h |  2 +-
 kernel/trace/ring_buffer.c  | 13 +++++++++----
 kernel/trace/trace.c        |  6 +++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index eac3e9080c3c..9855c7365f67 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -166,7 +166,7 @@ void ring_buffer_iter_reset(struct ring_buffer_iter *iter);
 int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
 bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
 
-unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
+unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
 unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
 
 void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..289bae003d7f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6546,18 +6546,23 @@ void ring_buffer_iter_advance(struct ring_buffer_iter *iter)
 EXPORT_SYMBOL_GPL(ring_buffer_iter_advance);
 
 /**
- * ring_buffer_size - return the size of the ring buffer (in bytes)
+ * ring_buffer_capacity - return the capacity of the ring buffer (in bytes)
  * @buffer: The ring buffer.
- * @cpu: The CPU to get ring buffer size from.
+ * @cpu: The CPU to get ring buffer capacity from.
+ *
+ * Capacity is the total memory available for recording event data in the
+ * ring buffer. It excludes subbuffer headers.
+ *
+ * Returns the capacity in bytes, or 0 if the CPU is not set in the buffer mask.
  */
-unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
+unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
 {
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return 0;
 
 	return rb_subbuf_capacity(buffer) * buffer->buffers[cpu]->nr_pages;
 }
-EXPORT_SYMBOL_GPL(ring_buffer_size);
+EXPORT_SYMBOL_GPL(ring_buffer_capacity);
 
 /**
  * ring_buffer_max_event_size - return the max data size of an event
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e4a490d3d08c..1054c9b29aed 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4712,9 +4712,9 @@ void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val)
 static void update_buffer_entries(struct array_buffer *buf, int cpu)
 {
 	if (cpu == RING_BUFFER_ALL_CPUS) {
-		trace_set_buffer_entries(buf, ring_buffer_size(buf->buffer, 0));
+		trace_set_buffer_entries(buf, ring_buffer_capacity(buf->buffer, 0));
 	} else {
-		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_size(buf->buffer, cpu);
+		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_capacity(buf->buffer, cpu);
 	}
 }
 
@@ -8520,7 +8520,7 @@ int allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int
 
 	/* Allocate the first page for all buffers */
 	trace_set_buffer_entries(&tr->array_buffer,
-				 ring_buffer_size(tr->array_buffer.buffer, 0));
+				 ring_buffer_capacity(tr->array_buffer.buffer, 0));
 
 	return 0;
 }
-- 
2.53.0
