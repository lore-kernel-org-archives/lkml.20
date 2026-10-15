Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E852CCC2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071247; cv=none; b=VmP8irPmIt6Vm9HTabBYDvISACsU7dOh9B/xqPCqYAVSDXWzqb1ZnjjzKwU2puA3ZJ4l7Pc1FAxSlM8jw3tl8bHEBkQZ3tqbe09Lt38D228pUa6uS6ety8FZ9mnSoR4Lu2ILecuMWICbXNPg8fDwjQN+Coc4KBXk2zgy9lZaHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071247; c=relaxed/simple;
	bh=uIYxcsUshWcSwjnwidGMM9tKlzdhoUst0kBH7WH4lI8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sbgdX/yW9+ljqUK4+4PU7svyoTnbg+SxA4Le9szNGn7EVYbUSFXDzwB/PSVpb6xFnalAUe7cTohZEIWpJBR7KpuOxqZJEBEX+2Jo2yTaDAJUjVeNfaTAYM7Jhph4JXRmTyLXCXvfqqUHb3vHkp6Wh9ibhMXVq5unFBvJMhx6dlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWk7yR//; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWk7yR//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAEC1F000CE;
	Thu, 15 Oct 2026 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071245;
	bh=YSgbtHzO9NAWCrRclt7wMw80BTNAvZTRmuMKuAQqs2Q=;
	h=Date:From:To:Cc:Subject:References;
	b=jWk7yR//jOPeHYSC0KVjn+qsfSSl9Oz2eGhD/T3vQpjMZOa3Su5ZWO3Or6SvmGJRM
	 JSzXV4NEdyAZEaCuocFK3bW6EBSNCWdiWi4CKE9ivLtgftDtMCgl23uzL65hAT71ZA
	 PbeWgUz8ftssHkL4P/ecpwaaVK8eeRSjLsiciIrRrHtjjUMBAZjpQGT+ToYD0BuXbB
	 TreOa7HBqXpVdeLPOyCzex8+56O2RwM0EmvIbMBbi3FjMTssrjegoGfk5s/bzwW0lw
	 GYj70EfN7zClWGEzd2u3pR+9WHJ41LQ1jgdaW3c7TjnwphPHKqO2KMn3O+iqlYqU5f
	 OpxEoFDoHFLTg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLav-00000000Mho-0Y7l;
	Thu, 15 Oct 2026 09:34:05 -0400
Message-ID: <20261015133404.956481343@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:25 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 15/16] ring-buffer: Use subbuf_order in available memory estimation
References: <20261015133310.731003448@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

To avoid failing in the middle of an allocation of a ring-buffer,
__rb_allocate_pages() looks at the available memory estimation with
si_mem_available(). Use the subbuffer order with this estimation to fail
early if necessary for ring-buffers with an order > 0.

Link: https://patch.msgid.link/20261013102047.1488347-3-vdonnefort@google.com
Fixes: f9b94daa542a ("ring-buffer: Set new size of the ring buffer sub page")
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index cbf67183c2e7..9c4e40847e43 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2443,6 +2443,7 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			       unsigned long nr_pages, struct list_head *pages)
 {
 	struct trace_buffer *buffer = cpu_buffer->buffer;
+	unsigned int subbuf_order = buffer->subbuf_order;
 	struct ring_buffer_cpu_meta *meta = NULL;
 	struct buffer_page *bpage, *tmp;
 	struct ring_buffer_desc *desc = NULL;
@@ -2464,7 +2465,7 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 		 * not going to succeed.
 		 */
 		i = si_mem_available();
-		if (i < nr_pages)
+		if (i < (nr_pages << subbuf_order))
 			return -ENOMEM;
 
 		user_thread = current->mm != NULL;
@@ -2517,12 +2518,11 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			bpage->id = i + 1;
 			cpu_buffer->subbuf_ids[i + 1] = bpage;
 		} else {
-			bpage->page = alloc_cpu_data(cpu_buffer->cpu,
-						     cpu_buffer->buffer->subbuf_order);
+			bpage->page = alloc_cpu_data(cpu_buffer->cpu, subbuf_order);
 			if (!bpage->page)
 				goto free_pages;
 		}
-		bpage->order = cpu_buffer->buffer->subbuf_order;
+		bpage->order = subbuf_order;
 
 		if (user_thread && fatal_signal_pending(current))
 			goto free_pages;
-- 
2.53.0
