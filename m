Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44231D757
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659049; cv=none; b=pBgLJA+ys1LPeTXHfYCwHSZ9avcGo5PQ+bm7omJgapUlBILz8Fhhb7+rW3JO2xUj7kOZARCaLdPv/ubR9gKzSE2HwrJK0I0pl7Z6z7obE4BjVBS2K0itDPS5NVCsdlGyOLHR9VgW6i2PKBiLepALAdkcRa50H9Ro4QqCxifsdvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659049; c=relaxed/simple;
	bh=bSPDSHIygvKCiRrnE82uvbInemfYCf5MqRiL/4o1WGA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lhRZsJ3u7dCvlwhRyx33fyEUJpaumSHZHKr+aNA+NXz2ms2c0GllbTc8hcTWYF1PaqpRDJOkwd6MJefEvTQXQClGD1cnfqqoV+ZzX+JsdbJp9lYBCw/MUd4B8gfx40w9u34CYvX2BETq7cr2EXws2sqT9R9WrtLO96XyN+zl9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4VWTB1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4VWTB1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5941F00A3D;
	Sun,  6 Sep 2026 01:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659047;
	bh=UhoUYFnbdEHZsMIHAyDXcXcLz9YQcvlkaeH9qXWpWKc=;
	h=Date:From:To:Cc:Subject:References;
	b=h4VWTB1/5O8iGT+mqxp+v2wb5KSjUlIW5GCIxcw1PEDJ4+fogbv1aLUskhLO5wOOj
	 73NJ3qnuMZ1wvrdXygjdfIUAl4e4xP1KoQqIWZ7B4iOAl55GvZxmfTso5RXDV7oF6i
	 JJY+h01uY4jjjLksMlCOkIr2LEVNvqdXVgNXqo5B9Ec0rxJ18+IK3jyzY6GsgVUv/i
	 Wy/XKVlWa1fN2OyZeyD+Pz5gXb+r321MJd24pXyBri6bAvHagSG50CRyZZYiLn7AN+
	 ZXSizQ0fS8JS4jRaE2CGN1KysMOQmVYbXWf4NVsAOeezQefU3/5dxwJAA/tre8lbMC
	 Dwgy1pbqPjH1A==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whQ-00000006JCg-1JJr;
	Sat, 05 Sep 2026 16:09:16 -0400
Message-ID: <20260905200916.180343779@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:36 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 09/12] ring-buffer: Cap static ring buffer nr_pages
References: <20260905200827.773347757@kernel.org>
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


