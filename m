Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28B3ED5B9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540371; cv=none; b=lnB4LOeGfbd8NrNcKInP9VvCzHKWeviSax1cIXxD/uVciTz162xqQHz1JdE8BgtpbpaFDgZK2p1AEoOp72kYTyQRqMBhquYCvbmticuoDt9Vm+qsnyU+ux5of/76XSPHNH7fPR7dsQW53GfIw37ebJxioJbk6c0Jo6n6PRMn8YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540371; c=relaxed/simple;
	bh=zwkR7TgkVeDk0ytufotfdz2f4wLItmcCVvFEhb9aV88=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ROFF5I0jvVgh5D+Zqf2q0mwW1rC+0YyBCH1nrCKntHc3pnu37VkJMQ2ZWk1xBUWB9J3ejojdYXj0by8EMn9cyLHy0zN1qbJW2Bro96PD6WhQ59d9wq4BowlKma5uAfG1SGaWRfJZfbzy7nJpmbTD8hyx690jFnKfeCnXMFER3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sHmwk9Oc; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sHmwk9Oc"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso7819075e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788540363; x=1789145163; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfQOViLj37OZFcHE7Ja+dfLarOMI5STQSlwFxhzFw4w=;
        b=sHmwk9OcNdAFOT1YumMucnW+EwMwafdJ5pcyqfVU6XeFgP6iBzh4mtwcM01y8N59U8
         la6ZUU6PulrMG7qifI91RFWuQWcpzXjU8HKLOCWM3Qhg38/ONfWWsN0JQg4vBY1aZmZ9
         xLS/a0DsnRnZ6GB8iWXqi5D4y9FleFzINdZ4t0q6AkzNfnF1XGAcPQXTX9/aE6mzPsTN
         UX5/r/+4+N3/xzyJPlMkBb/dTwbrZxOKmD2cGtAD/GXAhVzWi6Ra9grFbdtKV7v2Ww3G
         MGXmV1UnX3TnQoNvS9kENdokuMFxAF6YKuHNbjh8BZhTboh3iPvE46b4S85BL+VxUCcw
         U5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540363; x=1789145163;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfQOViLj37OZFcHE7Ja+dfLarOMI5STQSlwFxhzFw4w=;
        b=mDqgZ8OgiN+B4WLq+bijLTncw4WxMH/6y+CIPO+iUxcBXacXxq24pSSlUg8vkwEwlV
         WRlsGqzvTfmVVHTR58QwA4zY1pY68kqc7AqZ26WOR9VKO68O2fIv8X3tlLf3AnWOCxqe
         Zv/JzAR5XqXu04ujJjWevl93vFMOdOCufh2qd6w95w0LMiAgjUkK90HOO72dlvJ7l79r
         1P4gLAHDKkS4djtcy0b/FGgYq1779M1MVUzARmjjZ8gQmE094v2poHPsAY41YD69zk37
         FOscPc4nrBMf63DredxA+7drvZIkjA5DFXzFjP+fvQVI7PdlxgSglx9Xskfw0nmcOO4X
         Tn3A==
X-Forwarded-Encrypted: i=1; AKwUvBySBWTXRayD8YEWMDz4S/8ZjOOuJWSOuFSqwx45B741vt/CWA1uhsLsYnHGnZdfiHnkGwrhvkTrVsscUAc=@vger.kernel.org
X-Gm-Message-State: AFuF++k2gyYbukGryCXPZwJSnYmmEYiYBO1OAMRkzIJgcC5sc8E3CWYk
	Lj4rNylhG7n7D2TLS3KnmAF7pGPdYgBQNJtlZ/suOi1wXX8lG2twByiHIKn4uIqSdiZl0JMHOCC
	Fe/VY28C2AbnP5tFfFxjDIw==
X-Received: from wrna6.prod.google.com ([2002:adf:e5c6:0:b0:484:3346:46c9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6214:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf823b95dmr84082495e9.6.1788540362432;
 Fri, 04 Sep 2026 09:46:02 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:44:49 +0100
In-Reply-To: <20260904164450.1345852-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904164450.1345852-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904164450.1345852-4-vdonnefort@google.com>
Subject: [PATCH v10 3/4] ring-buffer: Cap static ring buffer nr_pages
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Static ring buffers (i.e. persistent, user-mapped and remote) rely on
the bpage::id field. The number of pages for those ring buffers must fit
into that variable. Enforce this limit on ring buffer creation or
user-mapping.

While at it, prevent nr_pages underflow when allocating a persistent
buffer.

Fixes: be68d63a139b ("ring-buffer: Add ring_buffer_alloc_range()")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 2f61cb510b0a..6b914abd80e3 100644
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
@@ -2833,6 +2842,8 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		size = end - buffers_start;
 		size = size / nr_cpu_ids;
 
+		if (size < sizeof(struct ring_buffer_cpu_meta))
+			goto fail_free_buffers;
 		/*
 		 * The number of sub-buffers (nr_pages) is determined by the
 		 * total size allocated minus the meta data size.
@@ -2842,6 +2853,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
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
@@ -2874,6 +2889,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
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
@@ -7836,6 +7855,9 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	/* prevent another thread from changing buffer/sub-buffer sizes */
 	guard(mutex)(&buffer->mutex);
 
+	if (cpu_buffer->nr_pages > rb_static_max_pages())
+		return -E2BIG;
+
 	err = rb_alloc_meta_page(cpu_buffer);
 	if (err)
 		return err;
-- 
2.55.0.979.g7e5102b832-goog

