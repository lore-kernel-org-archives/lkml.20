Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBD345EA4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659154; cv=none; b=EVLzLo4dXwyyf/uejSNjKeDHSg32OqWZjMwlEFfwHFziPN02NsWPhlwLcwvegSjSZKXVXAS5GENIhL5c2ye78e6NqDr8pJ2394gJyy1AGaL4D2evmnEKxrLu33tkmRjArKRuzPx0E+FKApmSDY5qM7NePZsh1s7j3NGm4pR2wa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659154; c=relaxed/simple;
	bh=bSPDSHIygvKCiRrnE82uvbInemfYCf5MqRiL/4o1WGA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Pv9dNgkPGeJx+11P2IFgUpSHMayMnMdJUFDWqpI0cNfHopxq8CzuCyFDhJm2T1lv8bxDPlcACcS1g3tYy+LsA3KR19PgJBlpKYBlfFYXmyckcRoOqpcBrW6eU4oen3o1Cy2JGpARW7oT9MebWJpxJk78SSMpitlqHwkPfi6H8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYIbA+PM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYIbA+PM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFEC1F01558;
	Sun,  6 Sep 2026 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659147;
	bh=UhoUYFnbdEHZsMIHAyDXcXcLz9YQcvlkaeH9qXWpWKc=;
	h=Date:From:To:Cc:Subject:References;
	b=cYIbA+PMlyF1Q5zG+nxEp4JZcNeqrwqWNdyL0C1R42/oP6hBNnOXJ0LcvILjV4S5o
	 GiT8JoymcEHhGtvoV21SpJ105mRWSgM+E10IibKZPQ1/DwprPY0n0JVDYf0Lq1tjrn
	 nyl7wwaLR/s6a5RWnzAUJpoui6Z12hDVZ7tCuX8FpHjbr65m78TW0N7bkxRXs2127M
	 RyzaIVcJ4bI+ogVkvlwnVQIJvEEdqf6D8ahtrM5VKLBgKL90TxJNshMMKs3ygtu+8y
	 Zb1KvcQ76imjmg911s2yB85YVaFZ/uqXBB2Z718oo63OoLrYTa7a2kuy4ytbZ+q9A+
	 6ttooqPSGnbAg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yC-00000006PRb-2fU5;
	Sat, 05 Sep 2026 21:46:56 -0400
Message-ID: <20260906014656.508919614@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:40 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 09/12] ring-buffer: Cap static ring buffer nr_pages
References: <20260906014531.720267751@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Static ring buffers (i.e. persistent, user-mapped and remote) rely on
the bpage::id field. The number of pages for those ring buffers must fit
into that variable. Enforce this limit on ring buffer creation or
user-mapping.

While at it, prevent nr_pages underflow when allocating a persistent
buffer.

Link: https://patch.msgid.link/20260904164450.1345852-4-vdonnefort@google.com
Fixes: be68d63a139b ("ring-buffer: Add ring_buffer_alloc_range()")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 077d6940af0c..76fed01f1c49 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -657,6 +657,15 @@ static bool rb_is_static(struct ring_buffer_per_cpu *cpu_buffer)
 	return cpu_buffer->user_mapped || cpu_buffer->remote || cpu_buffer->ring_meta;
 }
 
+static unsigned long rb_static_max_pages(void)
+{
+	/*
+	 * Static ring buffers are using bpage::id and must account for the
+	 * reader page.
+	 */
+	return (1UL << 30) - 1;
+}
+
 struct ring_buffer_iter {
 	struct ring_buffer_per_cpu	*cpu_buffer;
 	unsigned long			head;
@@ -2838,6 +2847,8 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		size = end - buffers_start;
 		size = size / nr_cpu_ids;
 
+		if (size < sizeof(struct ring_buffer_cpu_meta))
+			goto fail_free_buffers;
 		/*
 		 * The number of sub-buffers (nr_pages) is determined by the
 		 * total size allocated minus the meta data size.
@@ -2847,6 +2858,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		 */
 		nr_pages = (size - sizeof(struct ring_buffer_cpu_meta)) /
 			(subbuf_size + sizeof(int));
+
+		if (nr_pages > rb_static_max_pages())
+			goto fail_free_buffers;
+
 		/* Need at least two pages plus the reader page */
 		if (nr_pages < 3)
 			goto fail_free_buffers;
@@ -2879,6 +2894,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		/* The writer is remote. This ring-buffer is read-only */
 		atomic_inc(&buffer->record_disabled);
 		nr_pages = desc->nr_page_va - 1;
+
+		if (nr_pages > rb_static_max_pages())
+			goto fail_free_buffers;
+
 		if (nr_pages < 2)
 			goto fail_free_buffers;
 	} else {
@@ -7841,6 +7860,9 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	/* prevent another thread from changing buffer/sub-buffer sizes */
 	guard(mutex)(&buffer->mutex);
 
+	if (cpu_buffer->nr_pages > rb_static_max_pages())
+		return -E2BIG;
+
 	err = rb_alloc_meta_page(cpu_buffer);
 	if (err)
 		return err;
-- 
2.53.0


