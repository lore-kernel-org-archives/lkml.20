Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC734FF79
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774184; cv=none; b=In9IQfTUWcb1xfdcSnf1V9mvym34DhGV8BfRn2KPm9qwxOx61gt5qYyYYH5LieppfXPjJlwwlb0/pURqdH3fqUu9JqWEV5wgPdHJSmaASbu0utQTuRcUrB6+IAKVLYBo15CGjqf56UQKABmqVCM/WN3Dw6vqlpAA+msUVc5+Ctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774184; c=relaxed/simple;
	bh=uDq11k/rXkHA+TsuM739e/4WFoKrhhA393kZJdFyy3c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TjTpcvkcA2dLaz5IlCILint4PivpvRm2uWSjpr9lLxDxbo4avkrtFhpTthEbSfMCVBH0dmfVuYdl0Y7PCZwfJjByKD6GloA3K+U029oMk8pWzvafYUOw8Y7BPCjrLPu0d62h6hvT3Z6xyHxp5uwfxcvdoaQBOE6AGqGFjJq8WPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQXeqzh1; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQXeqzh1"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48436db95e1so2281354f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774180; x=1789378980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lZ6K3arAX2g5RNC4qtLfEijgSqmPC4MVV8qXWFmH9w=;
        b=fQXeqzh1Co9BTpkqWbBfJvT4iDpZuU0G2JVB0wRFNzjs0S0UTGaxiNsUXbn7vKqkIY
         EVR9/gRlB8tsJwAF/hvyUYBP2uJXde1+ZZNTc4JMp+uJlz0JSTeU3PZg59a7iJZkf1G4
         BujJLSVGZ5L+JYSUdCSYqcKtPxRtVkpUPbbxItVF1+pUltQR7VtGya3Q+7/Ya7qtuj9r
         FZc0JrxpvsKcd4ukn/RhtRbnqI79aNHCbr1aB6RsOOuQiL+jFEouH2iBoAV4sHaY80tM
         sIsl2feXKrgWuPrNskbMNpQDnCPhyowd9I0JPk70ULa/SpNYAr50jbMku/Y8ENFUAFQq
         Rvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774180; x=1789378980;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lZ6K3arAX2g5RNC4qtLfEijgSqmPC4MVV8qXWFmH9w=;
        b=imQj4Cph5tj6kWqliS9/mk+zMRRGEORlVobFxH5611ZQvDmUyP0cR4I4ML82LO8WGK
         1I95Wq/SqK9hsOel5csxcLSICFf7USx0CYnFWydX/NHCjgz+Z2z97jzhzcDHJ84DLIHC
         qO+67toXxTocXC2ARM4NSVayQnIjWgadvaUxaL9KnEM0D08rpW/PgAvEx8o4MkJaV5u7
         +LCk0S4i8+eenDN3HW6yXth9vRJ6QFoszE47BriZYYZOyOA8aTcXVsblpskLGKijYeuJ
         1VU9VoDy0vmwYcY0jOtf13TcREcC6dGf7SF96cm6VVXVTY+WvrDMtEV7ddD5NOi0BhmP
         RscA==
X-Forwarded-Encrypted: i=1; AKwUvBzx10OcgznMm/BK0dHiCq2c9mwAE/jDADtwFbXtikHcHKMUB8NlEy+ApiY4TbIaCaGH3C9HOTJrg5UY2dc=@vger.kernel.org
X-Gm-Message-State: AFuF++mL66WwJaFN9NfQKV6EUNjGDex7Nc+0SaEXQkIydzwDI6qTEcl0
	TLvDR8AFbb2TQkjJ1nSjTPaasSCTuAT+p1OKwnvNcScj3fXXMYqTun82o9o4ZEpk/OCanvCZ58f
	r34IkIsQ1tyNXNfWyVDROSg==
X-Received: from wmfq3.prod.google.com ([2002:a05:600c:2e43:b0:49d:fcd:8a44])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8711:b0:49c:fc6e:a3dd with SMTP id 5b1f17b1804b1-49cfc6ea7bfmr219193155e9.28.1788774180154;
 Mon, 07 Sep 2026 02:43:00 -0700 (PDT)
Date: Mon,  7 Sep 2026 10:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907094238.3624013-1-vdonnefort@google.com>
Subject: [PATCH v1] ring-buffer: Rename ring_buffer_size() to ring_buffer_capacity()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit 8a5f63637890 ("ring-buffer: Fix subbuf resize race with ring
buffer readers"), "capacity" refers to the memory available for events
(excluding subbuffer headers) while "size" refers to the raw allocation.
ring_buffer_size() actually calculates this event capacity. Rename it to
ring_buffer_capacity() to align with this convention.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index afc7daa6ee7d..9e23ab66176b 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -165,7 +165,7 @@ void ring_buffer_iter_reset(struct ring_buffer_iter *iter);
 int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
 bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
 
-unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
+unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
 unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
 
 void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c03a555a6ba..2940ff763354 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6547,18 +6547,23 @@ void ring_buffer_iter_advance(struct ring_buffer_iter *iter)
 EXPORT_SYMBOL_GPL(ring_buffer_iter_advance);
 
 /**
- * ring_buffer_size - return the size of the ring buffer (in bytes)
+ * ring_buffer_capacity - return the capacity of the ring buffer (in bytes)
  * @buffer: The ring buffer.
- * @cpu: The CPU to get ring buffer size from.
+ * @cpu: The CPU to get ring buffer capacity from.
+ *
+ * Capacity is the total memory available for recording event data in the
+ * ring buffer. It excludes subbufer headers.
+ *
+ * Returns the capacity in bytes, or 0 if the CPU is not set in the buffer mask.
  */
-unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
+unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
 {
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return 0;
 
 	return rb_subbuf_capacity(buffer) * buffer->buffers[cpu]->nr_pages;
 }
-EXPORT_SYMBOL_GPL(ring_buffer_size);
+EXPORT_SYMBOL_GPL(ring_buffer_capacity);
 
 /**
  * ring_buffer_max_event_size - return the max data size of an event
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8658cad53cb5..f0251788ec75 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4712,9 +4712,9 @@ void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val)
 static void update_buffer_entries(struct array_buffer *buf, int cpu)
 {
 	if (cpu == RING_BUFFER_ALL_CPUS) {
-		trace_set_buffer_entries(buf, ring_buffer_size(buf->buffer, 0));
+		trace_set_buffer_entries(buf, ring_buffer_capacity(buf->buffer, 0));
 	} else {
-		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_size(buf->buffer, cpu);
+		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_capacity(buf->buffer, cpu);
 	}
 }
 
@@ -8476,7 +8476,7 @@ int allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int
 
 	/* Allocate the first page for all buffers */
 	trace_set_buffer_entries(&tr->array_buffer,
-				 ring_buffer_size(tr->array_buffer.buffer, 0));
+				 ring_buffer_capacity(tr->array_buffer.buffer, 0));
 
 	return 0;
 }

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.979.g7e5102b832-goog

