Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5B2857FA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659155; cv=none; b=mLa0fpiXWjNoMVsPJYKor4nfN99izkT1jljcpXN+qONzQ2u4xCnoldmz/ySU/3ggrCAaod3PryGTGU8BfrbcxPnRLxBhjNq8tPgUK7rGTBT2WDzoNvSnarNEWEcPIYRXBzuUuTcu0+PiLYBh30cxDfAipFLDy5S9xqZy8rvkzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659155; c=relaxed/simple;
	bh=s8VewIXQRESO+xpFC2geZOOuNucSJeTyCQcPzvqOyMs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Zw5+CYTnRtZXTn44sKmYc+GfO1BkkA0Kqf/KQWcpdI4muKTm43FOJrgfS+Of4Fd3eNZaBqcWyayedH+6lap9cAk1GKp6/GD+D4b5GV10oDmgDRpthsLEM3nyBRwqydGJ6zo2cZ5As15PFG4eotCrjb24epezvSi4mVQJjprW4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amZ2o2vM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amZ2o2vM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7B01F00ACF;
	Sun,  6 Sep 2026 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659147;
	bh=4XfKs8SSmD+uqs4xIojGoUWGbWSOTdcOrN/NQUdHhtM=;
	h=Date:From:To:Cc:Subject:References;
	b=amZ2o2vMqK0Nnpj8SxCG4kMgLW+KV+4ieTNr7LuJboE9tj1M+NeKBeNO4yDmU7433
	 rjBdGBh2CbRJOrJnvTUDsFZbxeycEWx4Y3gBNINDh3r9dZOqbNEE6MTyMeVRkbQSmW
	 v1AzrUZ1jlJKle6QJC4P+mcSTZxqW0U41V7nuNCVVbZkOHJvN/jEfpRmOIsqqsE3NV
	 RyCEG7ckWvlCwF8NgNy2OQ+z8e3onMJ53tSrki47/k//GotdRpQSgONA/IwWlUIgaM
	 9vOYuVc9+UFh+P3TRWcypSPxaUlrlHzBfEetCJU1VXOvop48NBdzHjiVcH2r+EzkzV
	 kFdoJ6PT/Ha5w==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yC-00000006PR7-22z7;
	Sat, 05 Sep 2026 21:46:56 -0400
Message-ID: <20260906014656.357681406@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:39 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 08/12] tracing: Fix subbuf resize races with trace_pipe_raw readers
References: <20260906014531.720267751@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Concurrent subbuffer resizes may crash trace_pipe_raw readers or leak
uninitialized memory to userspace due to stale size values.

Modify ring_buffer_alloc_read_page() to handle the resizing of an
existing buffer_data_read_page if necessary and add a new
ring_buffer_read_page_size(). This new function enables ring-buffer
buffer_data_read_page users to not call the racy
ring_buffer_subbuf_size_get(). This makes the spare_size member of
ftrace_buffer_info redundant.

Finally, handle buffer_data_read_page/reader_page order discrepancy in
ring_buffer_read_page(). On a mismatch simply copy manually the data to
the buffer_data_read_page.

Link: https://lore.kernel.org/all/20260817140812.2C7D41F00A3A@smtp.kernel.org/
Link: https://patch.msgid.link/20260904164450.1345852-3-vdonnefort@google.com
Fixes: bce761d75745 ("ring-buffer: Read and write to ring buffers with custom sub buffer size")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/ring_buffer.h          |   5 +-
 kernel/trace/ring_buffer.c           | 135 ++++++++++++++++++---------
 kernel/trace/ring_buffer_benchmark.c |   6 +-
 kernel/trace/trace.c                 |  97 +++++++++----------
 kernel/trace/trace.h                 |   9 +-
 5 files changed, 144 insertions(+), 108 deletions(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 0670742b2d60..afc7daa6ee7d 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -218,14 +218,15 @@ bool ring_buffer_time_stamp_abs(struct trace_buffer *buffer);
 size_t ring_buffer_nr_dirty_pages(struct trace_buffer *buffer, int cpu);
 
 struct buffer_data_read_page;
-struct buffer_data_read_page *
-ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu);
+int ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu,
+				struct buffer_data_read_page **rpage);
 void ring_buffer_free_read_page(struct trace_buffer *buffer, int cpu,
 				struct buffer_data_read_page *page);
 int ring_buffer_read_page(struct trace_buffer *buffer,
 			  struct buffer_data_read_page *data_page,
 			  size_t len, int cpu, int full);
 void *ring_buffer_read_page_data(struct buffer_data_read_page *page);
+unsigned int ring_buffer_read_page_size(struct buffer_data_read_page *rpage);
 
 struct trace_seq;
 
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index ff0a44aa578d..077d6940af0c 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -330,6 +330,11 @@ struct buffer_data_read_page {
 	struct buffer_data_page	*data;	/* actual data, stored in this page */
 };
 
+static __always_inline unsigned int rb_read_page_capacity(struct buffer_data_read_page *rpage)
+{
+	return (PAGE_SIZE << rpage->order) - BUF_PAGE_HDR_SIZE;
+}
+
 /*
  * Note, the buffer_page list must be first. The buffer pages
  * are allocated in cache lines, which means that each buffer
@@ -6998,56 +7003,78 @@ EXPORT_SYMBOL_GPL(ring_buffer_swap_cpu);
  * ring_buffer_alloc_read_page - allocate a page to read from buffer
  * @buffer: the buffer to allocate for.
  * @cpu: the cpu buffer to allocate.
+ * @rpage: pointer to pass in an already allocated page (can be NULL)
+ *         and returns the allocated page.
  *
- * This function is used in conjunction with ring_buffer_read_page.
+ * This function is used in conjunction with ring_buffer_read_page().
  * When reading a full page from the ring buffer, these functions
  * can be used to speed up the process. The calling function should
  * allocate a few pages first with this function. Then when it
  * needs to get pages from the ring buffer, it passes the result
- * of this function into ring_buffer_read_page, which will swap
+ * of this function into ring_buffer_read_page(), which will swap
  * the page that was allocated, with the read page of the buffer.
  *
+ * If @rpage is provided, and it has a different order than the current
+ * subbuffer order, its payload will be freed and re-allocated. If it
+ * already matches the order, it is simply returned.
+ *
  * Returns:
- *  The page allocated, or ERR_PTR
+ *  0 on success, < 0 on error
  */
-struct buffer_data_read_page *
-ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu)
+int ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu,
+				struct buffer_data_read_page **rpage)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	struct buffer_data_read_page *bpage = NULL;
 	unsigned long flags;
+	unsigned int order;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
-	bpage = kzalloc_obj(*bpage);
-	if (!bpage)
-		return ERR_PTR(-ENOMEM);
+	if (!rpage)
+		return -EINVAL;
+
+	order = READ_ONCE(buffer->subbuf_order);
 
-	bpage->order = buffer->subbuf_order;
+	if (*rpage) {
+		if ((*rpage)->order == order)
+			return 0;
+
+		/* We can reuse rpage, but we discard the payload */
+		free_pages((unsigned long)(*rpage)->data, (*rpage)->order);
+		(*rpage)->data = NULL;
+	} else {
+		*rpage = kzalloc_obj(**rpage);
+		if (!*rpage)
+			return -ENOMEM;
+	}
+
+	(*rpage)->order = order;
 	cpu_buffer = buffer->buffers[cpu];
+
 	local_irq_save(flags);
 	arch_spin_lock(&cpu_buffer->lock);
 
 	if (cpu_buffer->free_page.data) {
-		*bpage = cpu_buffer->free_page;
+		**rpage = cpu_buffer->free_page;
 		cpu_buffer->free_page.data = NULL;
 	}
 
 	arch_spin_unlock(&cpu_buffer->lock);
 	local_irq_restore(flags);
 
-	if (bpage->data) {
-		rb_init_data_page(bpage->data);
+	if ((*rpage)->data) {
+		rb_init_data_page((*rpage)->data);
 	} else {
-		bpage->data = alloc_cpu_data(cpu, bpage->order);
-		if (!bpage->data) {
-			kfree(bpage);
-			return ERR_PTR(-ENOMEM);
+		(*rpage)->data = alloc_cpu_data(cpu, (*rpage)->order);
+		if (!(*rpage)->data) {
+			kfree(*rpage);
+			*rpage = NULL;
+			return -ENOMEM;
 		}
 	}
 
-	return bpage;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(ring_buffer_alloc_read_page);
 
@@ -7055,21 +7082,30 @@ EXPORT_SYMBOL_GPL(ring_buffer_alloc_read_page);
  * ring_buffer_free_read_page - free an allocated read page
  * @buffer: the buffer the page was allocate for
  * @cpu: the cpu buffer the page came from
- * @data_page: the page to free
+ * @rpage: the buffer_data_read_page to free
  *
  * Free a page allocated from ring_buffer_alloc_read_page.
  */
 void ring_buffer_free_read_page(struct trace_buffer *buffer, int cpu,
-				struct buffer_data_read_page *data_page)
+				struct buffer_data_read_page *rpage)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	struct buffer_data_page *dpage = data_page->data;
-	struct page *page = virt_to_page(dpage);
+	struct buffer_data_page *dpage;
 	unsigned long flags;
+	struct page *page;
 
 	if (!buffer || !buffer->buffers || !buffer->buffers[cpu])
 		return;
 
+	if (!rpage)
+		return;
+
+	dpage = rpage->data;
+	if (!dpage)
+		goto out;
+
+	page = virt_to_page(dpage);
+
 	cpu_buffer = buffer->buffers[cpu];
 
 	/*
@@ -7077,14 +7113,14 @@ void ring_buffer_free_read_page(struct trace_buffer *buffer, int cpu,
 	 * is different from the subbuffer order of the buffer -
 	 * we can't reuse it
 	 */
-	if (page_ref_count(page) > 1 || data_page->order != buffer->subbuf_order)
+	if (page_ref_count(page) > 1 || rpage->order != READ_ONCE(buffer->subbuf_order))
 		goto out;
 
 	local_irq_save(flags);
 	arch_spin_lock(&cpu_buffer->lock);
 
 	if (!cpu_buffer->free_page.data) {
-		cpu_buffer->free_page = *data_page;
+		cpu_buffer->free_page = *rpage;
 		dpage = NULL;
 	}
 
@@ -7092,8 +7128,8 @@ void ring_buffer_free_read_page(struct trace_buffer *buffer, int cpu,
 	local_irq_restore(flags);
 
  out:
-	free_pages((unsigned long)dpage, data_page->order);
-	kfree(data_page);
+	free_pages((unsigned long)dpage, rpage->order);
+	kfree(rpage);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_free_read_page);
 
@@ -7164,10 +7200,9 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	if (!dpage)
 		return -1;
 
-	guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
+	len = min_t(size_t, len, rb_read_page_capacity(data_page));
 
-	if (data_page->order != cpu_buffer->reader_page->order)
-		return -1;
+	guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
 
 	reader = rb_get_reader_page(cpu_buffer);
 	if (!reader)
@@ -7182,16 +7217,18 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	/* Check if any events were dropped */
 	missed_events = cpu_buffer->lost_events;
 
-	/*
-	 * If this page has been partially read or
-	 * if len is not big enough to read the rest of the page or
-	 * a writer is still on the page, then
-	 * we must copy the data from the page to the buffer.
-	 * Otherwise, we can simply swap the page with the one passed in.
-	 */
+	 /*
+	  * It is not possible to swap the reader page if:
+	  *   - It has been partially read
+	  *   - len is not big enough to read it entirely
+	  *   - A writer is still on it
+	  *   - The ring buffer is static
+	  *   - The order doesn't match
+	  */
 	if (read || (len < (size - read)) ||
 	    cpu_buffer->reader_page == cpu_buffer->commit_page ||
-	    rb_is_static(cpu_buffer)) {
+	    rb_is_static(cpu_buffer) ||
+	    data_page->order != reader->order) {
 		struct buffer_data_page *rpage = cpu_buffer->reader_page->page;
 		unsigned int rpos = read;
 		unsigned int pos = 0;
@@ -7285,7 +7322,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 		 * missed events, then record it there.
 		 */
 		if (missed_events > 0 &&
-		    rb_page_capacity(reader) - size >= sizeof(missed_events)) {
+		    rb_read_page_capacity(data_page) - size >= sizeof(missed_events)) {
 			memcpy(&dpage->data[size], &missed_events,
 			       sizeof(missed_events));
 			local_add(RB_MISSED_STORED, &dpage->commit);
@@ -7305,8 +7342,8 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	/*
 	 * This page may be off to user land. Zero it out here.
 	 */
-	if (size < rb_page_capacity(reader))
-		memset(&dpage->data[size], 0, rb_page_capacity(reader) - size);
+	if (size < rb_read_page_capacity(data_page))
+		memset(&dpage->data[size], 0, rb_read_page_capacity(data_page) - size);
 
 	return read;
 }
@@ -7324,6 +7361,18 @@ void *ring_buffer_read_page_data(struct buffer_data_read_page *page)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_read_page_data);
 
+/**
+ * ring_buffer_read_page_size - get size of the read page.
+ * @page:  the page to get the size from
+ *
+ * Returns size of the page in bytes.
+ */
+unsigned int ring_buffer_read_page_size(struct buffer_data_read_page *rpage)
+{
+	return rpage ? PAGE_SIZE << rpage->order : 0;
+}
+EXPORT_SYMBOL_GPL(ring_buffer_read_page_size);
+
 /**
  * ring_buffer_subbuf_size_get - get size of the sub buffer.
  * @buffer: the buffer to get the sub buffer size from
@@ -7409,7 +7458,7 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	/* Make sure all commits have finished */
 	synchronize_rcu();
 
-	buffer->subbuf_order = order;
+	WRITE_ONCE(buffer->subbuf_order, order);
 
 	/* Make sure all new buffers are allocated, before deleting the old ones */
 	for_each_buffer_cpu(buffer, cpu) {
@@ -7513,7 +7562,7 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	return 0;
 
 error:
-	buffer->subbuf_order = old_order;
+	WRITE_ONCE(buffer->subbuf_order, old_order);
 
 	atomic_dec(&buffer->record_disabled);
 
diff --git a/kernel/trace/ring_buffer_benchmark.c b/kernel/trace/ring_buffer_benchmark.c
index 593e3b59e42e..c3d34c0e64e2 100644
--- a/kernel/trace/ring_buffer_benchmark.c
+++ b/kernel/trace/ring_buffer_benchmark.c
@@ -104,7 +104,7 @@ static enum event_status read_event(int cpu)
 
 static enum event_status read_page(int cpu)
 {
-	struct buffer_data_read_page *bpage;
+	struct buffer_data_read_page *bpage = NULL;
 	struct ring_buffer_event *event;
 	struct rb_page *rpage;
 	unsigned long commit;
@@ -114,8 +114,8 @@ static enum event_status read_page(int cpu)
 	int inc;
 	int i;
 
-	bpage = ring_buffer_alloc_read_page(buffer, cpu);
-	if (IS_ERR(bpage))
+	ret = ring_buffer_alloc_read_page(buffer, cpu, &bpage);
+	if (ret < 0)
 		return EVENT_DROPPED;
 
 	page_size = ring_buffer_subbuf_size_get(buffer);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 138e983c3c2f..b26c4c277ce5 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -7082,8 +7082,8 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
 {
 	struct ftrace_buffer_info *info = filp->private_data;
 	struct trace_iterator *iter = &info->iter;
+	unsigned int spare_size;
 	void *trace_data;
-	int page_size;
 	ssize_t ret = 0;
 	ssize_t size;
 
@@ -7093,36 +7093,22 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
 	if (iter->snapshot && tracer_uses_snapshot(iter->tr->current_trace))
 		return -EBUSY;
 
-	page_size = ring_buffer_subbuf_size_get(iter->array_buffer->buffer);
+	spare_size = ring_buffer_read_page_size(info->spare);
 
-	/* Make sure the spare matches the current sub buffer size */
-	if (info->spare) {
-		if (page_size != info->spare_size) {
-			ring_buffer_free_read_page(iter->array_buffer->buffer,
-						   info->spare_cpu, info->spare);
-			info->spare = NULL;
-		}
-	}
+again:
+	/* Do we have previous read data to read? */
+	if (info->read < spare_size)
+		goto read;
 
-	if (!info->spare) {
-		info->spare = ring_buffer_alloc_read_page(iter->array_buffer->buffer,
-							  iter->cpu_file);
-		if (IS_ERR(info->spare)) {
-			ret = PTR_ERR(info->spare);
-			info->spare = NULL;
-		} else {
-			info->spare_cpu = iter->cpu_file;
-			info->spare_size = page_size;
-		}
-	}
-	if (!info->spare)
+	ret = ring_buffer_alloc_read_page(iter->array_buffer->buffer, iter->cpu_file,
+					  &info->spare);
+	if (ret)
 		return ret;
 
-	/* Do we have previous read data to read? */
-	if (info->read < page_size)
-		goto read;
+	spare_size = ring_buffer_read_page_size(info->spare);
+	info->read = spare_size;
+	info->spare_cpu = iter->cpu_file;
 
- again:
 	trace_access_lock(iter->cpu_file);
 	ret = ring_buffer_read_page(iter->array_buffer->buffer,
 				    info->spare,
@@ -7148,8 +7134,9 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
 	}
 
 	info->read = 0;
+
  read:
-	size = page_size - info->read;
+	size = spare_size - info->read;
 	if (size > count)
 		size = count;
 	trace_data = ring_buffer_read_page_data(info->spare);
@@ -7190,26 +7177,24 @@ int tracing_buffers_release(struct inode *inode, struct file *file)
 
 	__trace_array_put(iter->tr);
 
-	if (info->spare)
-		ring_buffer_free_read_page(iter->array_buffer->buffer,
-					   info->spare_cpu, info->spare);
+	ring_buffer_free_read_page(iter->array_buffer->buffer, info->spare_cpu, info->spare);
 	kvfree(info);
 
 	return 0;
 }
 
 struct buffer_ref {
-	struct trace_buffer	*buffer;
-	void			*page;
-	int			cpu;
-	refcount_t		refcount;
+	struct trace_buffer		*buffer;
+	struct buffer_data_read_page	*rpage;
+	int				cpu;
+	refcount_t			refcount;
 };
 
 static void buffer_ref_release(struct buffer_ref *ref)
 {
 	if (!refcount_dec_and_test(&ref->refcount))
 		return;
-	ring_buffer_free_read_page(ref->buffer, ref->cpu, ref->page);
+	ring_buffer_free_read_page(ref->buffer, ref->cpu, ref->rpage);
 	kfree(ref);
 }
 
@@ -7268,25 +7253,15 @@ ssize_t tracing_buffers_splice_read(struct file *file, loff_t *ppos,
 		.ops		= &buffer_pipe_buf_ops,
 		.spd_release	= buffer_spd_release,
 	};
+	unsigned int page_size = 0;
 	struct buffer_ref *ref;
 	bool woken = false;
-	int page_size;
 	int entries, i;
 	ssize_t ret = 0;
 
 	if (iter->snapshot && tracer_uses_snapshot(iter->tr->current_trace))
 		return -EBUSY;
 
-	page_size = ring_buffer_subbuf_size_get(iter->array_buffer->buffer);
-	if (*ppos & (page_size - 1))
-		return -EINVAL;
-
-	if (len & (page_size - 1)) {
-		if (len < page_size)
-			return -EINVAL;
-		len &= (~(page_size - 1));
-	}
-
 	if (splice_grow_spd(pipe, &spd))
 		return -ENOMEM;
 
@@ -7306,25 +7281,37 @@ ssize_t tracing_buffers_splice_read(struct file *file, loff_t *ppos,
 
 		refcount_set(&ref->refcount, 1);
 		ref->buffer = iter->array_buffer->buffer;
-		ref->page = ring_buffer_alloc_read_page(ref->buffer, iter->cpu_file);
-		if (IS_ERR(ref->page)) {
-			ret = PTR_ERR(ref->page);
-			ref->page = NULL;
+
+		ret = ring_buffer_alloc_read_page(ref->buffer, iter->cpu_file, &ref->rpage);
+		if (ret) {
 			kfree(ref);
 			break;
 		}
 		ref->cpu = iter->cpu_file;
 
-		r = ring_buffer_read_page(ref->buffer, ref->page,
-					  len, iter->cpu_file, 1);
+		page_size = ring_buffer_read_page_size(ref->rpage);
+
+		r = -EINVAL;
+		if (IS_ALIGNED(*ppos, page_size) && len >= page_size) {
+			r = ring_buffer_read_page(ref->buffer, ref->rpage, len, iter->cpu_file, 1);
+		} else if (!i) {
+			/*
+			 * We failed to read because the length is too small
+			 * or unaligned. If this is the first iteration, it's
+			 * an invalid userspace input. Otherwise, this is due
+			 * to a subbuf order change. Do not report an error
+			 * and just finish the read.
+			 */
+			ret = -EINVAL;
+		}
+
 		if (r < 0) {
-			ring_buffer_free_read_page(ref->buffer, ref->cpu,
-						   ref->page);
+			ring_buffer_free_read_page(ref->buffer, ref->cpu, ref->rpage);
 			kfree(ref);
 			break;
 		}
 
-		page = virt_to_page(ring_buffer_read_page_data(ref->page));
+		page = virt_to_page(ring_buffer_read_page_data(ref->rpage));
 
 		spd.pages[i] = page;
 		spd.partial[i].len = page_size;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 3c111ca88e32..5e76f94e7a80 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -745,11 +745,10 @@ static inline int tracing_get_cpu(struct inode *inode)
 void tracing_reset_cpu(struct array_buffer *buf, int cpu);
 
 struct ftrace_buffer_info {
-	struct trace_iterator	iter;
-	void			*spare;
-	unsigned int		spare_cpu;
-	unsigned int		spare_size;
-	unsigned int		read;
+	struct trace_iterator		iter;
+	struct buffer_data_read_page	*spare;
+	unsigned int			spare_cpu;
+	unsigned int			read;
 };
 
 /**
-- 
2.53.0


