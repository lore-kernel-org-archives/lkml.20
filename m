Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438426;
	b=e8xYptfnM8Q7Z3OSOuv/ho50ZuvPtZKZBjhAFg4TpbjFA/woqEmT/ewotpWjPtQfwJEl
	 mxX480DbwQt2Tuy9+PP5NYJUDrBz9jpmC9MxTcQVj9zgnvbQFEmzknuId2iLmbJ0Jthk/
	 YnKf1Wj6zQQg7kNJB56bJiYuOU9vcWcibvC0o5dXRD2uE3syG2ro2RTnUt7h9xEf+TgAH
	 +7ZJcJzbrisy2UCcNhEEtvLAnN+Jgtx8Mn05ax+6wW+fJXS7XMtVGH9IVvtXKJIunD/cH
	 VJadFPt4M8muNAulo7tjMX7XTZKOZPC5OSt9c79AFlxF76vJBLwgco+1UBDDE9W2hEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438426;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=psCXjxhPEu/IOcKYYRZ7VQz6lj9QwLsGpkDlLv06GGk=;
	b=5jq6LzeFSsKJQEXBotkLzmq5+1Ap4V/q1pyGtPrka21a2vtU76UL2LBxEX2qPDPgjEr2
	 y4OAbfs8oVsaIj7gYWDNzU9UERBKISrAeNAvaZOzNTMeEWU1l+kw0RG+xPqk3qTNgVxSN
	 +NquaWQ5j3TsN79zPs2R4WhTgt4qAHT7zYMJr+e7gX4JBYNlpiYdUFL1f9nH4xq5t8Frb
	 kqQiLRXf7yvMExGI2IwwLTivkOjJ/s+N0LBfJfPyZtB2GcF8Nzb1ZgS/ibz+BhZDtquqj
	 A67buV1IRA0DOlwvAngDnViPlz2IQ0TRRrC5ssBxZvp92IkQ4abOpaXNQ1/qzND+jEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eLOboJ/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E2606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLOboJ/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295471F000C7;
	Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438426;
	bh=psCXjxhPEu/IOcKYYRZ7VQz6lj9QwLsGpkDlLv06GGk=;
	h=Date:From:To:Cc:Subject:References;
	b=eLOboJ/LYOfw9WSm8vLJF/XvfydDbbkdda5M0YpfCdCf2OzXq60xjbGtU69tmePmD
	 St77TKQZuQA8wtasfIluv6cTlfGQEmqiiHmaRt8QfTDh0XuE1lOHtjgXlQrKrX4x/o
	 SxVTFoPdEUT2Ug0Ccg1mbnrgPonjAvjk09pTKwjYbY5IXkevla1u8MXnUJ5lDXlboM
	 te1aUx/KRIi+LehnoqmKoynmBkxus/kRQR0EFFteHJBJWMKgzGn3UQmUXrCdZg6pDh
	 IuuO1X24ormuTgu/IIEcMTiL1l/Ipv/uBPIW06afvfl3iDfPC9sYkCPN3sKGJ/Si7l
	 haRVSipNOZZXg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIt7B-00000001ef8-20ey;
	Mon, 19 Oct 2026 15:33:45 -0400
Message-ID: <20261019193345.285303044@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:33:32 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 2/5] ring-buffer: Unify ring buffer minimum page calculations
References: <20261019193330.365764549@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

The codebase scatters hardcoded minimum page limits across multiple
places. Introduce RING_BUFFER_MIN_NR_PAGES and rb_calculate_nr_pages()
to formalize the requirement of two pages in a ring buffer.

Link: https://patch.msgid.link/20260911193937.602202-4-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/ring_buffer.h       |  9 ++++++++-
 kernel/trace/ring_buffer.c        | 32 +++++++++++++------------------
 kernel/trace/simple_ring_buffer.c |  4 ++--
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index eac3e9080c3c..e4370064273e 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -98,6 +98,13 @@ struct trace_buffer *__ring_buffer_alloc_range(unsigned long size, unsigned flag
 
 void *ring_buffer_meta_scratch(struct trace_buffer *buffer, unsigned int *size);
 
+/*
+ * A minimum of 2 pages ensures we can always swap a page out of the ring
+ * buffer. This does not account for the reader page or any other page
+ * containing meta data used by static ring buffers.
+ */
+#define RING_BUFFER_MIN_NR_PAGES 2UL
+
 /*
  * Because the ring buffer is generic, if other users of the ring buffer get
  * traced by ftrace, it can produce lockdep warnings. We need to keep each
@@ -287,7 +294,7 @@ static inline struct ring_buffer_desc *__first_ring_buffer_desc(struct trace_buf
 static inline unsigned long __calc_nr_pages_ring_buffer_desc(size_t size)
 {
 	/* Takes into account the reader page */
-	return max(DIV_ROUND_UP(size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
+	return max(DIV_ROUND_UP(size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), RING_BUFFER_MIN_NR_PAGES) + 1;
 }
 
 static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_cpus)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..1b148cd891c8 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -642,6 +642,11 @@ static __always_inline unsigned int rb_subbuf_max_data_size(struct trace_buffer
 	return rb_subbuf_capacity(buffer) - RB_EVNT_HDR_SIZE - sizeof(event->array[0]);
 }
 
+static unsigned long rb_calculate_nr_pages(struct trace_buffer *buffer, unsigned long size)
+{
+	return max(DIV_ROUND_UP(size, rb_subbuf_capacity(buffer)), RING_BUFFER_MIN_NR_PAGES);
+}
+
 /**
  * rb_subbuf_start - Get the start address of a subbuffer
  * @buffer:	A trace buffer
@@ -2864,7 +2869,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 			goto fail_free_buffers;
 
 		/* Need at least two pages plus the reader page */
-		if (nr_pages < 3)
+		if (nr_pages < RING_BUFFER_MIN_NR_PAGES + 1)
 			goto fail_free_buffers;
 
  again:
@@ -2876,7 +2881,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 			ptr += subbuf_size * nr_pages;
 		}
 		if (ptr > end) {
-			if (nr_pages <= 3)
+			if (nr_pages <= RING_BUFFER_MIN_NR_PAGES + 1)
 				goto fail_free_buffers;
 			nr_pages--;
 			goto again;
@@ -2899,13 +2904,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		if (nr_pages > rb_static_max_pages())
 			goto fail_free_buffers;
 
-		if (nr_pages < 2)
+		if (nr_pages < RING_BUFFER_MIN_NR_PAGES)
 			goto fail_free_buffers;
 	} else {
-		/* need at least two pages */
-		nr_pages = DIV_ROUND_UP(size, rb_subbuf_capacity(buffer));
-		if (nr_pages < 2)
-			nr_pages = 2;
+		nr_pages = rb_calculate_nr_pages(buffer, size);
 	}
 
 	cpumask_set_cpu(cpu, buffer->cpumask);
@@ -3318,11 +3320,7 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 	mutex_lock(&buffer->mutex);
 	atomic_inc(&buffer->resizing);
 
-	nr_pages = DIV_ROUND_UP(size, rb_subbuf_capacity(buffer));
-
-	/* we need a minimum of two pages */
-	if (nr_pages < 2)
-		nr_pages = 2;
+	nr_pages = rb_calculate_nr_pages(buffer, size);
 
 	if (cpu_id == RING_BUFFER_ALL_CPUS) {
 		/*
@@ -7502,12 +7500,8 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 		}
 
 		/* Update the number of pages to match the new size */
-		nr_pages = old_capacity * buffer->buffers[cpu]->nr_pages;
-		nr_pages = DIV_ROUND_UP(nr_pages, rb_subbuf_capacity(buffer));
-
-		/* we need a minimum of two pages */
-		if (nr_pages < 2)
-			nr_pages = 2;
+		nr_pages = rb_calculate_nr_pages(buffer,
+						 old_capacity * buffer->buffers[cpu]->nr_pages);
 
 		cpu_buffer->nr_pages_to_update = nr_pages;
 
@@ -8102,7 +8096,7 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct hlist_node *node)
 	}
 	/* allocate minimum pages, user can later expand it */
 	if (!nr_pages_same)
-		nr_pages = 2;
+		nr_pages = RING_BUFFER_MIN_NR_PAGES;
 	buffer->buffers[cpu] =
 		rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
 	if (!buffer->buffers[cpu]) {
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 49913bb0057a..abfaf9bee12e 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -383,8 +383,8 @@ int simple_ring_buffer_init_mm(struct simple_rb_per_cpu *cpu_buffer,
 	void *page;
 	int i;
 
-	/* At least 1 reader page and two pages in the ring-buffer */
-	if (desc->nr_page_va < 3)
+	/* At least RING_BUFFER_MIN_NR_PAGES and 1 reader page */
+	if (desc->nr_page_va < RING_BUFFER_MIN_NR_PAGES + 1)
 		return -EINVAL;
 
 	memset(cpu_buffer, 0, sizeof(*cpu_buffer));
-- 
2.53.0
