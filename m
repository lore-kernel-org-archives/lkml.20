Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492899;
	b=xdCk30kYDguu8PqNMrUh3p2MZjJD7HhNVxNVpMJ3FrfyvI6Qzf5XIbfVH9OkhwZ4bxOe
	 sAvRKcyfiaq6TDUTCrXQ0t/krepN9RlJYOGMIVjW0CifaWyW9SS5T+cPcSwL4TXlykbkX
	 wW/X7f8Ht4NrTM6Hykk9prSlCxEcxxv+PlRUH90mx/XCmL1j9rjWVrZqrDjprdekTwGZG
	 cq+tCDuL3MSDHiLAbcbGNXyMqaPO3OqyQzHe1pPoenGrwC55d8l4EMh1+yhtbutbnTWMh
	 lb98DcA4NycgdN5eOs9PHvpp9DjId9aMtGiEnllBA/WmVSy0icRb+frCgu5sBCeKxQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9uS4NoQ2nMhjahxuNe5/uvsqBY+OcQYdFdWqhYfOXqA=;
	b=pyGNLhplAovkJxLBE23ulmZw5JoxhyNYJqV/b+TI+Mb+GWr45jhZQ7N8COm3UFUfcvr/
	 2C53sRxJ8VXqFpOo6tG3mZne6Dxpu4p+2jrEh5H+FfppH8m7tBYn1oXeH4qru6mrGLgVV
	 wxGhGueagxhAgytR1x5VtcqcpymqmDQLZaU2PA+qoPmZXgTssxFjDeYthKo7ncN0uqCPq
	 oM2x9+UAyTdSDZNrMcc3zpoOVqvFNdleqa4cCFI9m8msoraeSg9laDQEytdTPMCfDccCv
	 ON+ONsMrj4zBqs1Ilf0WqngwjuT01EAp3hkPr9LOKA1loU5YG+NULe7JxF4BF2A2YPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b9T26bG9;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD760A261D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CD760A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b9T26bG9
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba01393800so25244485e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492897; x=1795097697; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uS4NoQ2nMhjahxuNe5/uvsqBY+OcQYdFdWqhYfOXqA=;
        b=b9T26bG9kiVAIrHPJf8UbfbHemxkC6sOuvJG+pwWPWyzyzkZH3IKzaJAMseGOe2DDO
         JoSeuK/Nwe/Z75bHIJUV+Ap5lBubKAibLR6QYfGlPh2NCyXFnWgBRq2GAft2TlyXVskq
         H42MBu8Wcb/WEDa+Z35XXTb3t6O0667AWSGWXAfY6mv4f8p0HRgzTACFAE3PsMY/MwBO
         FRaXa3DRhsW46ikybuudZd1UHXgpGiuKcf7Tpnf/rWks+67GxjKlbmADn5YcL/Izp9tY
         uRivop5CsMNULGKjqWiuYEBVuMRV14AvD/nQnZ1XTAYV9jecsy7uhG5txAp7WNLI6WEI
         PV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492898; x=1795097698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uS4NoQ2nMhjahxuNe5/uvsqBY+OcQYdFdWqhYfOXqA=;
        b=P7KpJYog0sVkc8/wH2jTuzHrVCi9wYgQkuyalKi82e9nYcDE5rr5Hjv1iPwpBP3QjZ
         eNQYldAhSbQ1dFjLc4UIaxqaYIoQ2KPMQRW/UHfY9NJ3II2rmo0xX1/Uy7FqDCiOhzBE
         B9dYJXXUGxGVVe1E1UXtRymBalEqb7fu2DRFXEQ4+ZthSJSmKiUtoxIxa6ue5sFW4We5
         Qu2XYjxj9N5xlyNyNEk2wYRGuCMq8jfs9cpt5eITRbPitHaec2Ztt0aCXWqT1tqcv26n
         hpQjRjwGhvsjBV8cG8pMOxXjECmA+dPzwUnxTHdZO56iLnOLjonGGGNcDAD+o1jjYcAu
         +Hew==
X-Forwarded-Encrypted: i=1; AL+hErFSg1mE57N64S54YrJtOCZtapcRNdxxtf6uroMAWNLuP6gddNYCcUi76BbKw0q7gLX15l5jrvv2leQ0o/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UYTYhhkABovWb8jSnfUpzCLYoRat19892aYU4LfcBcFEWn9T6
	iF2xY/kpBG+f4KvxVikq4WS18LQAsqdjAYK66zeXRAq+mTyiLDg4X4snwfb7zm8dnszhsNCPTPi
	JsHqEPJJ2ymWuFJYXCWG7Aw==
X-Received: from wmgg7.prod.google.com ([2002:a05:600d:7:b0:4a3:5d77:a650])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474f:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ba09379d3fmr110106505e9.11.1794492897435;
 Thu, 12 Nov 2026 06:14:57 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:39 +0000
In-Reply-To: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112141440.3050124-9-vdonnefort@google.com>
Subject: [PATCH v1 8/9] ring-buffer: Enable context analysis
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"

Locking of some variables has proven to be fiddly recently. To mitigate
further issues, enable context analysis for the ring buffer.

This comes at the expense of a few annotations and the removal of the
helpers rb_get_mapped_buffer() and rb_put_mapped_buffer(), used in a
single place anyway.

No functional change intended.

Cc: Marco Elver <elver@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/Makefile      |  2 ++
 kernel/trace/ring_buffer.c | 50 ++++++++++++++++----------------------
 2 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index b0c44f438999..165593ec4c03 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -53,6 +53,8 @@ endif
 KCOV_INSTRUMENT_trace_preemptirq.o := n
 KCOV_INSTRUMENT_trace_irqsoff.o := n
 
+CONTEXT_ANALYSIS_ring_buffer.o := y
+
 CFLAGS_bpf_trace.o := -I$(src)
 
 CFLAGS_trace_benchmark.o := -I$(src)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 82f6e3df4627..99ade8b41b53 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6269,6 +6269,7 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 EXPORT_SYMBOL_GPL(ring_buffer_iter_peek);
 
 static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer)
+	__acquires(&cpu_buffer->reader_lock)
 {
 	if (likely(!in_nmi())) {
 		raw_spin_lock(&cpu_buffer->reader_lock);
@@ -6289,14 +6290,18 @@ static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer)
 
 	/* Continue without locking, but disable the ring buffer */
 	atomic_inc(&cpu_buffer->record_disabled);
+	__acquire(&cpu_buffer->reader_lock);
 	return false;
 }
 
 static inline void
 rb_reader_unlock(struct ring_buffer_per_cpu *cpu_buffer, bool locked)
+	__releases(&cpu_buffer->reader_lock)
 {
 	if (likely(locked))
 		raw_spin_unlock(&cpu_buffer->reader_lock);
+	else
+		__release(&cpu_buffer->reader_lock);
 }
 
 /**
@@ -6458,11 +6463,15 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	 */
 	if (gfpflags_allow_blocking(flags))
 		mutex_lock(&buffer->mutex);
+	else
+		__acquire(&buffer->mutex);
 
 	atomic_inc(&cpu_buffer->resize_disabled);
 
 	if (gfpflags_allow_blocking(flags))
 		mutex_unlock(&buffer->mutex);
+	else
+		__release(&buffer->mutex);
 
 	/* Holds the entire event: data and meta data. */
 	iter->event_size = rb_page_capacity(READ_ONCE(cpu_buffer->reader_page));
@@ -7648,31 +7657,6 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	rb_update_meta_page(cpu_buffer);
 }
 
-static struct ring_buffer_per_cpu *
-rb_get_mapped_buffer(struct trace_buffer *buffer, int cpu)
-{
-	struct ring_buffer_per_cpu *cpu_buffer;
-
-	if (!cpumask_test_cpu(cpu, buffer->cpumask))
-		return ERR_PTR(-EINVAL);
-
-	cpu_buffer = buffer->buffers[cpu];
-
-	mutex_lock(&cpu_buffer->mapping_lock);
-
-	if (!cpu_buffer->user_mapped) {
-		mutex_unlock(&cpu_buffer->mapping_lock);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return cpu_buffer;
-}
-
-static void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
-{
-	mutex_unlock(&cpu_buffer->mapping_lock);
-}
-
 /*
  * Fast-path for rb_buffer_(un)map(). Called whenever the meta-page doesn't need
  * to be set-up or torn-down.
@@ -7948,9 +7932,17 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
 	unsigned long reader_size;
 	unsigned long flags;
 
-	cpu_buffer = rb_get_mapped_buffer(buffer, cpu);
-	if (IS_ERR(cpu_buffer))
-		return (int)PTR_ERR(cpu_buffer);
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
+		return -EINVAL;
+
+	cpu_buffer = buffer->buffers[cpu];
+
+	mutex_lock(&cpu_buffer->mapping_lock);
+
+	if (!cpu_buffer->user_mapped) {
+		mutex_unlock(&cpu_buffer->mapping_lock);
+		return -ENODEV;
+	}
 
 	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
 
@@ -8031,7 +8023,7 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
 	rb_update_meta_page(cpu_buffer);
 
 	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
-	rb_put_mapped_buffer(cpu_buffer);
+	mutex_unlock(&cpu_buffer->mapping_lock);
 
 	return 0;
 }
-- 
2.56.0.567.gdb80ae8cd5-goog

