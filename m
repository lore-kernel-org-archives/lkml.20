Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670435202A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659057; cv=none; b=GUPtfSObbSxlb8Uj3l1jfflVGqLG+XTBmtnObMFaoEpyT2/d2c2ct5Ol7Kqn8stJEs5sfxfbB5a01ngqYZCDztwPgDsxn1v6+LYjxnoWC0oK6VIsLAmhlhF58gmbhBJR38LiK1ZJXwTCbK9P38SSPD3obKc7jVBaxBCeiZc7HeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659057; c=relaxed/simple;
	bh=d435VnZOzrrH2rPG5AX1NWYNf20yXTSkwuew4D4FkHI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=T4j47N1k3TcD77b6ekp55HO6wMPsMLNtXkpiK+QiGACgL6c1YqqBF0tctAhxBXR6dSMgfZe4gvSlrLtHiB0102hGYNOPUToE/6W/abSBEy/4HcfCOdWyp3/ayO9R6fk3roNnAmHe7lB2WXCfi9aBTrCOi0+kiq544L4PeoDzwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtmA8M4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtmA8M4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B761F00A3D;
	Sun,  6 Sep 2026 01:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659055;
	bh=3p0f1YA0YMYemkiQzWv4tPMOkk68SoOlGOuPphnLWXY=;
	h=Date:From:To:Cc:Subject:References;
	b=JtmA8M4Qf1KAF1XyAYukij6oL0Fy18+uyrix6GqANoMTZGYfdt0E10+l5l/73sQvc
	 52ehpUeNId3kSo1wOA3MS+1F/ddUDt9JeqOUIImJ12gjRWYu/WqTLltxcHa0Xhc9Ku
	 eEAlBCiohQvYHd2SxU5OqIMXTRrdEQCHTGiTRNf9FT8ru6phUH4iAYYHEojJ5XZG87
	 OiW7gJA0tzKxQbJOdhzTm8XkhpdWTpNAB9ecGtrMBK78Ak3ZBwFo3QEE0Tx32WubM/
	 bZEdq8qwpScxi5d1gnz/W5IcQVrdVTD8zU5VAjwRrwoWHEmnTteDNhRBG6W2l8bx9V
	 Yd/Bd6egCz9ZA==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whQ-00000006JDB-1vzs;
	Sat, 05 Sep 2026 16:09:16 -0400
Message-ID: <20260905200916.331062125@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:37 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 10/12] ring-buffer: Prevent truncation of nr_pages / nr_subbufs
References: <20260905200827.773347757@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Although ring_buffer_per_cpu::nr_pages is defined as unsigned long, it
is capped to 32-bits in a few places, limiting the operations possible
on a very large buffer. Use `unsigned long` where appropriate and
prevent truncation of values using nr_pages (or nr_subbufs).

While at it, subbuf_size must be at least `unsigned int`.

Note that persistent, remote and user-mapped ring buffers are capping
the number of pages to 30 bits already, making "int" safe in many
places.

Link: https://patch.msgid.link/20260904164450.1345852-5-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 61 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 76fed01f1c49..220b8405adfc 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1683,7 +1683,7 @@ static void rb_check_pages(struct ring_buffer_per_cpu *cpu_buffer)
  * This is used to help find the next per cpu subbuffer within a mapped range.
  */
 static unsigned long
-rb_range_align_subbuf(unsigned long addr, int subbuf_size, int nr_subbufs)
+rb_range_align_subbuf(unsigned long addr, unsigned int subbuf_size, unsigned long nr_subbufs)
 {
 	addr += sizeof(struct ring_buffer_cpu_meta) +
 		sizeof(int) * nr_subbufs;
@@ -1693,13 +1693,12 @@ rb_range_align_subbuf(unsigned long addr, int subbuf_size, int nr_subbufs)
 /*
  * Return the ring_buffer_meta for a given @cpu.
  */
-static void *rb_range_meta(struct trace_buffer *buffer, int nr_pages, int cpu)
+static void *rb_range_meta(struct trace_buffer *buffer, unsigned long nr_pages, int cpu)
 {
-	int subbuf_size = rb_subbuf_size(buffer);
+	unsigned int subbuf_size = rb_subbuf_size(buffer);
 	struct ring_buffer_cpu_meta *meta;
 	struct ring_buffer_meta *bmeta;
-	unsigned long ptr;
-	int nr_subbufs;
+	unsigned long ptr, nr_subbufs;
 
 	bmeta = buffer->meta;
 	if (!bmeta)
@@ -1745,7 +1744,7 @@ static void *rb_range_meta(struct trace_buffer *buffer, int nr_pages, int cpu)
 /* Return the start of subbufs given the meta pointer */
 static void *rb_subbufs_from_meta(struct ring_buffer_cpu_meta *meta)
 {
-	int subbuf_size = meta->subbuf_size;
+	unsigned int subbuf_size = meta->subbuf_size;
 	unsigned long ptr;
 
 	ptr = (unsigned long)meta;
@@ -1757,11 +1756,11 @@ static void *rb_subbufs_from_meta(struct ring_buffer_cpu_meta *meta)
 /*
  * Return a specific sub-buffer for a given @cpu defined by @idx.
  */
-static void *rb_range_buffer(struct ring_buffer_per_cpu *cpu_buffer, int idx)
+static void *rb_range_buffer(struct ring_buffer_per_cpu *cpu_buffer, unsigned long idx)
 {
 	struct ring_buffer_cpu_meta *meta;
+	unsigned int subbuf_size;
 	unsigned long ptr;
-	int subbuf_size;
 
 	meta = rb_range_meta(cpu_buffer->buffer, 0, cpu_buffer->cpu);
 	if (!meta)
@@ -1777,7 +1776,7 @@ static void *rb_range_buffer(struct ring_buffer_per_cpu *cpu_buffer, int idx)
 
 	ptr = (unsigned long)rb_subbufs_from_meta(meta);
 
-	ptr += subbuf_size * idx;
+	ptr += (unsigned long)subbuf_size * idx;
 	if (ptr + subbuf_size > cpu_buffer->buffer->range_addr_end)
 		return NULL;
 
@@ -1854,13 +1853,12 @@ static bool rb_meta_init(struct trace_buffer *buffer, int scratch_size)
  * must be the same.
  */
 static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
-			      struct trace_buffer *buffer, int nr_pages,
+			      struct trace_buffer *buffer, unsigned long nr_pages,
 			      unsigned long *subbuf_mask)
 {
-	int subbuf_size = PAGE_SIZE;
 	unsigned long buffers_start;
 	unsigned long buffers_end;
-	int i;
+	unsigned long i;
 
 	if (!subbuf_mask)
 		return false;
@@ -1876,7 +1874,7 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 	}
 
 	buffers_start = meta->first_buffer;
-	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
+	buffers_end = meta->first_buffer + (meta->nr_subbufs * PAGE_SIZE);
 
 	/* Is the head and commit buffers within the range of buffers? */
 	if (meta->head_buffer < buffers_start ||
@@ -2114,8 +2112,8 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	struct buffer_page *head_page, *orig_head, *orig_reader;
 	struct rb_validation_state state = { 0 };
 	bool skip = false;
+	unsigned long i;
 	int ret;
-	int i;
 
 	if (!meta || !meta->head_buffer)
 		return;
@@ -2166,7 +2164,7 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 		rb_validate_buffer(head_page, cpu_buffer, meta, &state, 0, state.ts);
 	}
 	if (i)
-		pr_info("Ring buffer [%d] rewound %d pages\n", cpu_buffer->cpu, i);
+		pr_info("Ring buffer [%d] rewound %lu pages\n", cpu_buffer->cpu, i);
 
 	/* The last rewound page must be skipped. */
 	if (head_page != orig_head)
@@ -2250,7 +2248,8 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	}
 }
 
-static void rb_range_meta_init(struct trace_buffer *buffer, int nr_pages, int scratch_size)
+static void rb_range_meta_init(struct trace_buffer *buffer, unsigned long nr_pages,
+			       int scratch_size)
 {
 	struct ring_buffer_cpu_meta *meta;
 	unsigned long *subbuf_mask;
@@ -2350,8 +2349,8 @@ static int rbm_show(struct seq_file *m, void *v)
 			   rb_meta_subbuf_idx(meta, (void *)meta->head_buffer));
 		seq_printf(m, "commit_buffer: %d\n",
 			   rb_meta_subbuf_idx(meta, (void *)meta->commit_buffer));
-		seq_printf(m, "subbuf_size:   %d\n", meta->subbuf_size);
-		seq_printf(m, "nr_subbufs:    %d\n", meta->nr_subbufs);
+		seq_printf(m, "subbuf_size:   %u\n", meta->subbuf_size);
+		seq_printf(m, "nr_subbufs:    %u\n", meta->nr_subbufs);
 		return 0;
 	}
 
@@ -2436,7 +2435,7 @@ static void *ring_buffer_desc_page(struct ring_buffer_desc *desc, unsigned int p
 }
 
 static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
-		long nr_pages, struct list_head *pages)
+			       unsigned long nr_pages, struct list_head *pages)
 {
 	struct trace_buffer *buffer = cpu_buffer->buffer;
 	struct ring_buffer_cpu_meta *meta = NULL;
@@ -2564,7 +2563,7 @@ static int rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 }
 
 static struct ring_buffer_per_cpu *
-rb_allocate_cpu_buffer(struct trace_buffer *buffer, long nr_pages, int cpu)
+rb_allocate_cpu_buffer(struct trace_buffer *buffer, unsigned long nr_pages, int cpu)
 {
 	struct ring_buffer_per_cpu *cpu_buffer __free(kfree) =
 		alloc_cpu_buffer(cpu);
@@ -2721,8 +2720,8 @@ static void rb_test_inject_invalid_pages(struct trace_buffer *buffer)
 	struct ring_buffer_cpu_meta *meta;
 	struct buffer_data_page *dpage;
 	unsigned long entry_bytes = 0;
+	unsigned int subbuf_size;
 	unsigned long ptr;
-	int subbuf_size;
 	int invalid = 0;
 	int cpu;
 	int i;
@@ -2792,8 +2791,8 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 					 struct ring_buffer_remote *remote)
 {
 	struct trace_buffer *buffer __free(kfree) = NULL;
-	long nr_pages;
-	int subbuf_size;
+	unsigned int subbuf_size;
+	unsigned long nr_pages;
 	int bsize;
 	int cpu;
 	int ret;
@@ -5882,12 +5881,12 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 static struct buffer_page *
 __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	int max_loops = cpu_buffer->ring_meta ? cpu_buffer->nr_pages : 3;
+	unsigned long max_loops = cpu_buffer->ring_meta ? cpu_buffer->nr_pages : 3;
 	struct buffer_page *reader = NULL;
+	unsigned long nr_loops = 0;
 	unsigned long overwrite;
 	unsigned long flags;
 	int missed_events = 0;
-	int nr_loops = 0;
 	bool ret;
 
 	local_irq_save(flags);
@@ -6205,8 +6204,8 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	struct trace_buffer *buffer;
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
-	int nr_loops = 0;
-	int max_loops;
+	unsigned long nr_loops = 0;
+	unsigned long max_loops;
 
 	if (ts)
 		*ts = 0;
@@ -7446,8 +7445,8 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct buffer_page *bpage, *tmp;
 	unsigned int old_capacity;
+	unsigned long nr_pages;
 	int old_order;
-	int nr_pages;
 	int psize;
 	int err;
 	int cpu;
@@ -7629,10 +7628,10 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
-	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
+	unsigned long nr_subbufs = cpu_buffer->nr_pages + 1;
 	struct buffer_page *first_subbuf, *subbuf;
-	int cnt = 0;
-	int id = 0;
+	unsigned int cnt = 0;
+	unsigned int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
 	subbuf_ids[id++] = cpu_buffer->reader_page;
-- 
2.53.0


