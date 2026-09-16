Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1C52BE2F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572523; cv=none; b=R5bLw7/uLsOmXnDGfxxBVxLgwvxb+7fvSRlofTjumJFILuj6ODl9kWtJNqbF8ET+2QU6t1/heLalJcy1IJLJgPqKNGwsRjp8D8o9tMchTu0hzAhW4sVqQ2gWlgCU9qfSTRYsTm6Q3Cf8HfLLlQI3fK2Kjb+tjIgqWkSie4vjacA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572523; c=relaxed/simple;
	bh=TXteeCRtix+xVHTlNUBmPxcBgoC0nsHNPU9LRC6hnbk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BDWIMB0W+axfglNVCGwlnltDESSM5/EbHJ/I8DK7zouQvLFJzXMVaNyZZIFmclhE7CeMhGQzOrfQAuG/GzWkfrSNYI70VUh6LqDmldt7GFLD0s7R3a9wDL4AWeojlTkY7BiqPD8UjSiNnajaLFNqLZ3+r/4WUs4+PFY8BfSGTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bX5D34qQ; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bX5D34qQ"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e76a80fe5so44105805e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789572507; x=1790177307; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSH0k2F7aL4twNq/bkwjKNFeVoAS1hGzVzxlltkMSZU=;
        b=bX5D34qQs8qZZ6UbwCCvYRRFvXFu6GhJ0WDxXjbJxjht+GB0OEEmtXN8hOnIXXyoof
         GKVldWK3HJ7M7nKwzLfmvHq0Q6vNlC39JrCXJb0MRUpj8D9kV9pxoSnFE07JyQxLjwNM
         NpiLnOKky0OC3JitzidKHExWa5LAb/TAsaG1z5l1bb7ktXiL0rzJ0s5s2h6v660DsFk+
         37KYSxjHFd/+8aKpmFfGIOs95H1AYdUzFveIQt3D9T7BuG/aLjfWPbonfhBTX0AdilXS
         RMxPl9N48yFz05DbtenRcZoY4/bGgUTYefqkzegRVOzEKiO7JHZmNWtyyXN/lwtQ57qJ
         v+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572507; x=1790177307;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSH0k2F7aL4twNq/bkwjKNFeVoAS1hGzVzxlltkMSZU=;
        b=o1DGbGKzDbJF5ej4TaK76jrrVviD64pjCkGF/DIbQeC/YtYb9RSc7sYFYYtmH6G1mR
         sdhVOWvKWaE214puV0KcZ0Fb9E2JkhPDgqVtEpTF5RS4UNrLceVClICGSroSN3TXR5G0
         QtVVsX3+wDXyz2RaeeO8nHMVXddu1YFFBzFHr4a3jYtnEc75RssUPSr7Sbs0WA5cu6Xk
         gcjU3YJntfLuQ53d9Q4pd+eiwuDT/rmF04q5I9nWuYcGN0BbENYyBV38EdhUTi4QjKPk
         vyS0GNDnq4mmXLHjLjwl43/AgYIjR40F39fj0gLnyiuJZ1t14BC44+/xgfycJ6bup33D
         bC2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx72frvYkFYeNltRg8pQxfUuWstZSW73OnyC+7cEz/v/pNjmLuTcHcd3qZ2rcVFBBdc3s57qfIfB1sixx8=@vger.kernel.org
X-Gm-Message-State: AFuF++mbhrFR4woe6SidKItHKagSKYS4Uc0Kh2aw+XlVt0Rugtp6/eHt
	JugKfrqgXd9Ib+pZwjlJIqkWojqZLHOGBbsoM2cCQdSWmioQKKqCmVDvywKmwvRPR593GlkDONH
	WrZDRJRzexpYvCP07xCTB2g==
X-Received: from wmsk7-n2.prod.google.com ([2002:a05:600d:8487:20b0:49d:f3f:1e8b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548f:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49ec0543ce6mr39073525e9.31.1789572507438;
 Wed, 16 Sep 2026 08:28:27 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:28:12 +0100
In-Reply-To: <20260916152813.105082-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916152813.105082-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916152813.105082-2-vdonnefort@google.com>
Subject: [PATCH v2 1/2] ring-buffer: Clean up resize_disabled checks
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devnexen@gmail.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_subbuf_order_set() checks for resize_disabled twice under
the same buffer->mutex hold. Moreover, this check duplicates the logic
in ring_buffer_resize(). Create a common helper rb_resize_disabled() to
factor out this code.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 63 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..73311c4fc556 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3280,6 +3280,21 @@ static void update_pages_handler(struct work_struct *work)
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
@@ -3324,20 +3339,17 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 	if (nr_pages < 2)
 		nr_pages = 2;
 
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
@@ -3409,16 +3421,6 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
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
 
@@ -7473,13 +7475,9 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 
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
 
@@ -7496,11 +7494,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 
 		cpu_buffer = buffer->buffers[cpu];
 
-		if (atomic_read(&cpu_buffer->resize_disabled)) {
-			err = -EBUSY;
-			goto error;
-		}
-
 		/* Update the number of pages to match the new size */
 		nr_pages = old_capacity * buffer->buffers[cpu]->nr_pages;
 		nr_pages = DIV_ROUND_UP(nr_pages, rb_subbuf_capacity(buffer));
-- 
2.55.0.1082.g2b9226bbc0-goog

