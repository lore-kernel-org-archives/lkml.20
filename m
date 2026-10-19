Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438427;
	b=1xHb0+jawEnTemDm2jIV8e//nBb0lnwYTqu1ke7YJEgW67E/YP+/VnqU8JLGyVuEWW6H
	 KPMwedXad8Wh7nElbLzLufsRVaiZnFuVtDvEDPJo6GgfFI++SBJQa59L+UCYCjM1dc32n
	 N8tYf6trn5M2wznQATWA7DdceIWWVZsl5/QuOJfD6w63AHTMIceIUXxHhZz7qs584BdUw
	 OPTcHqnmzKRDkMfpsf8vUv3rLNlgQYNOQNJUmj7dkVYGWdJyFZjOC5w/yzdKuvQl6D0Fr
	 hgmk+5+L9khQ2W++aB1noBVOZVn7Fo0hmYLOk6ZEb1F18dxqfBKsl62GQbDdI5q//SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438427;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=NlVrJdJXjBpJ84o3fdZyAZZM5A3lU+0Jcv8qJ5BZH6g=;
	b=r/R+7Usv6jUDTBfZLTmkTcBgRKgUphaTsRPO1oy94YASgSl8NSEanC1SKQIHJ/OHKPJr
	 CKqYr31PGWMiLSKEC4pwJiiI8ZJrFsXPdTOca3Rj9bqUCy3hKHZw6ccF5uaSHg4zvDIbz
	 4DmYRchfW8J/TJUmjkYDWRlRkwKoGCXZ3W4pvFwUMvL2EJkOZ5P4qSlVhBkSbfk8BvmpI
	 oDtRZZ142oi92ujjxQdD1Vk6svwFrG3fS9Stng+mo2LB7NSbXiCAx14yY3tzY3OrNxPak
	 WeZWKhJSFx2uzR3GSxcVE0aKzwzhP6gfig5Gfs3lpWSga1pS7PzJBz1GaEuAgDty50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HZd/HfUA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F020606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZd/HfUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B441F000C6;
	Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438426;
	bh=NlVrJdJXjBpJ84o3fdZyAZZM5A3lU+0Jcv8qJ5BZH6g=;
	h=Date:From:To:Cc:Subject:References;
	b=HZd/HfUAC+hrdXu+CFdxCYZswNqTIoPoDOnsptIQxxma/rTRYzl5SQYgDEt4q+tb7
	 curgS3Yy2Zo2nHaY71TIlAdDfkyuGreNlgqUuZthyfaLRORBjeMgZICvzHUFB60ly5
	 Qey37o6eogTHCYtaqUlfbwPTstZM+wllin9kp0oCL/+e5JQZn2g57IwgeDefOX9HYK
	 QLmtSXjlOWD3RGRsY/gV6pYv5YhQ9UiZqD2G6OzDlfzicbIGcnYzUpkdTR81gvFqBm
	 B7UMocdZNx+EDNczMpKAmdrL+dbLxvH16A8JANtT+clnONIZVCbhh31+BeuQbNfzN3
	 WLzCyp3TX0xUA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIt7B-00000001efg-2uns;
	Mon, 19 Oct 2026 15:33:45 -0400
Message-ID: <20261019193345.501684622@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:33:33 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 3/5] ring-buffer: Clean up resize_disabled checks
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

ring_buffer_subbuf_order_set() checks for resize_disabled twice under
the same buffer->mutex hold. Moreover, this check duplicates the logic
in ring_buffer_resize(). Create a common helper rb_resize_disabled() to
factor out this code.

Link: https://patch.msgid.link/20260916152813.105082-2-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 63 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1b148cd891c8..15e3b9938e0f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3282,6 +3282,21 @@ static void update_pages_handler(struct work_struct *work)
 	complete(&cpu_buffer->update_done);
 }
 
+static bool rb_resize_disabled(struct trace_buffer *buffer, int cpu)
+{
+	lockdep_assert_held(&buffer->mutex);
+
+	if (cpu != RING_BUFFER_ALL_CPUS)
+		return atomic_read(&buffer->buffers[cpu]->resize_disabled);
+
+	for_each_buffer_cpu(buffer, cpu) {
+		if (atomic_read(&buffer->buffers[cpu]->resize_disabled))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * ring_buffer_resize - resize the ring buffer
  * @buffer: the buffer to resize.
@@ -3322,20 +3337,17 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 
 	nr_pages = rb_calculate_nr_pages(buffer, size);
 
-	if (cpu_id == RING_BUFFER_ALL_CPUS) {
-		/*
-		 * Don't succeed if resizing is disabled, as a reader might be
-		 * manipulating the ring buffer and is expecting a sane state while
-		 * this is true.
-		 */
-		for_each_buffer_cpu(buffer, cpu) {
-			cpu_buffer = buffer->buffers[cpu];
-			if (atomic_read(&cpu_buffer->resize_disabled)) {
-				err = -EBUSY;
-				goto out_err_unlock;
-			}
-		}
+	/*
+	 * Don't succeed if resizing is disabled, as a reader might be
+	 * manipulating the ring buffer and is expecting a sane state while
+	 * this is true.
+	 */
+	if (rb_resize_disabled(buffer, cpu_id)) {
+		err = -EBUSY;
+		goto out_err_unlock;
+	}
 
+	if (cpu_id == RING_BUFFER_ALL_CPUS) {
 		/* calculate the pages to update */
 		for_each_buffer_cpu(buffer, cpu) {
 			cpu_buffer = buffer->buffers[cpu];
@@ -3407,16 +3419,6 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 		if (nr_pages == cpu_buffer->nr_pages)
 			goto out;
 
-		/*
-		 * Don't succeed if resizing is disabled, as a reader might be
-		 * manipulating the ring buffer and is expecting a sane state while
-		 * this is true.
-		 */
-		if (atomic_read(&cpu_buffer->resize_disabled)) {
-			err = -EBUSY;
-			goto out_err_unlock;
-		}
-
 		cpu_buffer->nr_pages_to_update = nr_pages -
 						cpu_buffer->nr_pages;
 
@@ -7471,13 +7473,9 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 
 	old_capacity = rb_subbuf_capacity(buffer);
 
-	/* The mmap fast path reads subbuf_order without buffer->mutex. */
-	for_each_buffer_cpu(buffer, cpu) {
-		if (!cpumask_test_cpu(cpu, buffer->cpumask))
-			continue;
-		if (atomic_read(&buffer->buffers[cpu]->resize_disabled))
-			return -EBUSY;
-	}
+	/* Check it is resizable before we touch subbuf_order */
+	if (rb_resize_disabled(buffer, RING_BUFFER_ALL_CPUS))
+		return -EBUSY;
 
 	atomic_inc(&buffer->record_disabled);
 
@@ -7494,11 +7492,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 
 		cpu_buffer = buffer->buffers[cpu];
 
-		if (atomic_read(&cpu_buffer->resize_disabled)) {
-			err = -EBUSY;
-			goto error;
-		}
-
 		/* Update the number of pages to match the new size */
 		nr_pages = rb_calculate_nr_pages(buffer,
 						 old_capacity * buffer->buffers[cpu]->nr_pages);
-- 
2.53.0
