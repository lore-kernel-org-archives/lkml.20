Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492897;
	b=fSB6qQhfndbnWai5fz3gD6V4p6D8gJcrG7KL+KkIpBmqpbanFi25FhYjOdQos+raIvkX
	 45nprlhrWyPv52CsTZNvnmy4X9yVNOI7daitmxHH8lebIrvelOdg0gJ3yBbW8UZWvB5eN
	 f8j0Jc1ASWYdmyf6fhH2D/KzjBcFQUhCgcvbhiZlBXH8S/F3xOBvQIzK2C6Dg6hXfuno8
	 q4/sWH/wFz/u4Kegr9X37K/2wh7YmmIJrUouK75Evr0dmqcxJmS93nftm5VS1HMWQe2i2
	 NBRCs4EW8PVl3zHgxgV2N0PglXeyRJpUnTEs7FrmhjS2LmCm3H617uvv62j2qCvkXfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bPHhNNq7w/fLlY4o/ckTx7aGLsEqj2ZGBXvYDna7FMk=;
	b=FPfIXQNCuWgotQth5+kXOGdVnZs0nKHWZfWR5RoyXWISZdDQD9bayrc2KcpdMg4uQm67
	 +FCqEwVe9fRhYcJEqz2m5d8vSTECctY4O3ub63aRfd0HX1j+5CNZhnPbznkxfEwc/wb/K
	 uKM9cmQZtc34UP9UWkfnNFUx9weDIzo1tZs+qdIHzIZ9YwK4GGqILWX9CUAsgXmDr4sKB
	 69PUePXE/M2cVE/OcT2oXvnm0BIKwo+GjYtXEeacsA6H40UK4V3G1Ipf+sz5hWXmZ/ZqP
	 52jkW55MP/1QzFUBGsT/ANe3avzo1rhGKlLXyilRf1n7Kc5X+jYsT1iT1hu4CBHOyzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aBPMgolY;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590860A2608
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3590860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aBPMgolY
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso29570045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492896; x=1795097696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPHhNNq7w/fLlY4o/ckTx7aGLsEqj2ZGBXvYDna7FMk=;
        b=aBPMgolYjE2oADuB7AKiBZJRZOnizT6HeL4Izkn1t4dkeYYC0AFYzRrlsyBGBaMy/8
         vRArOmlI9Ot+jpQ56oHnNMXgOun01OF90FG2GTC/5xac70a1Q6EMaCNqatb2u7jH+Xh2
         ZwQrfa8clbNKTgz0Sa/5F4C3jUp8ssChVmY2+768XFiDTTmcDXVWFL504jg6M/p5Nhry
         2CYjYzkR0QDORIrkVOYdq23TpXcCOH7rqvw8/cWQ0gOoU7IWdikM/xnYHAb8khCuShUc
         EQtnFAxb0GnxNZyyMJ9kVBhwGfbfhnEeu8bukUyB1wWgHm7rXwWAOAK1O7ME8QeilPKm
         x6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492896; x=1795097696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPHhNNq7w/fLlY4o/ckTx7aGLsEqj2ZGBXvYDna7FMk=;
        b=aXBYO6RvY6JtTHgxGg695zfqcUq5k3jjrPmzbZfFgE38W8etZxkBGLqzw/WQB65b4J
         nnKN1a/y4G+a0ueT/xt+6pq809EvkZUt97+caC2Y0ecJ6DyDATqUqLP77oLr7JXwKoUa
         GLnDRRAJ8uQQLVSo7Ee74FFjCHhMd1dgb/NriYfsCLXhyMYl2jtBmLgyuNvc1Iz83oha
         sdLHpfXmn9hP78Hs/8JmbwKFl9RISqBMFQ4GdtNsPA0pF550TjhV8LfMWgMvpvYnYe1E
         OKwCMN+Jt9r9mkCEHu8c96vouqCw59Ajmdsfzl/odFc4d1W/S71eUqbfB0cAJ28iOuKB
         CNuw==
X-Forwarded-Encrypted: i=1; AL+hErFeKOwuIpQRl3ThpEGNupFooJYoi3i4AHTpvRX34N3mvWVgTDQhbKubjzASLyaslkUnqNHquUKmQVgB7Ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fpDnxW9jZX7X+QggB53ox/yG0ohNM3GtA5F//l2hCu7hvltqC
	aa7T/PK3Xqtj3DY3KVIt4MIMCrdXN6gnMQaUv0Haj6qcood5UuKqda3i9WIYKX+yFJc9+TcASq+
	dLCYEa4DYtAGuHywy0OMYhQ==
X-Received: from wmqf8.prod.google.com ([2002:a05:600c:4e88:b0:4a1:f37f:7f0b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b24:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4ba09383fd2mr99227395e9.35.1794492895472;
 Thu, 12 Nov 2026 06:14:55 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:37 +0000
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
Message-ID: <20261112141440.3050124-7-vdonnefort@google.com>
Subject: [PATCH v1 6/9] ring-buffer: Introduce rb_start_write() and rb_end_write()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Factor the common write-context entry (preemption disabling, disabled
checks, cpumask testing, recursive locking) and exit paths shared by
ring_buffer_lock_reserve() and ring_buffer_write() into a pair of
functions: rb_start_write() and rb_end_write().

No functional change intended.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 106 ++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 55 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9834f9dae440..02d3cc193d1e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4495,6 +4495,45 @@ trace_recursive_unlock(struct ring_buffer_per_cpu *cpu_buffer)
 		cpu_buffer->current_context - (1 << cpu_buffer->nest);
 }
 
+static __always_inline struct ring_buffer_per_cpu *
+rb_start_write(struct trace_buffer *buffer)
+{
+	struct ring_buffer_per_cpu *cpu_buffer;
+	int cpu;
+
+	/* If we are tracing schedule, we don't want to recurse */
+	preempt_disable_notrace();
+
+	if (unlikely(atomic_read(&buffer->record_disabled)))
+		goto out;
+
+	cpu = raw_smp_processor_id();
+
+	if (unlikely(!cpumask_test_cpu(cpu, buffer->cpumask)))
+		goto out;
+
+	cpu_buffer = buffer->buffers[cpu];
+
+	if (unlikely(atomic_read(&cpu_buffer->record_disabled)))
+		goto out;
+
+	if (unlikely(trace_recursive_lock(cpu_buffer)))
+		goto out;
+
+	return cpu_buffer;
+
+out:
+	preempt_enable_notrace();
+
+	return NULL;
+}
+
+static __always_inline void rb_end_write(struct ring_buffer_per_cpu *cpu_buffer)
+{
+	trace_recursive_unlock(cpu_buffer);
+	preempt_enable_notrace();
+}
+
 /* The recursive locking above uses 5 bits */
 #define NESTED_BITS 5
 
@@ -4563,9 +4602,7 @@ int ring_buffer_unlock_commit(struct trace_buffer *buffer)
 
 	rb_wakeups(buffer, cpu_buffer);
 
-	trace_recursive_unlock(cpu_buffer);
-
-	preempt_enable_notrace();
+	rb_end_write(cpu_buffer);
 
 	return 0;
 }
@@ -5027,38 +5064,16 @@ ring_buffer_lock_reserve(struct trace_buffer *buffer, unsigned long length)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
-	int cpu;
 
-	/* If we are tracing schedule, we don't want to recurse */
-	preempt_disable_notrace();
-
-	if (unlikely(atomic_read(&buffer->record_disabled)))
-		goto out;
-
-	cpu = raw_smp_processor_id();
-
-	if (unlikely(!cpumask_test_cpu(cpu, buffer->cpumask)))
-		goto out;
-
-	cpu_buffer = buffer->buffers[cpu];
-
-	if (unlikely(atomic_read(&cpu_buffer->record_disabled)))
-		goto out;
-
-	if (unlikely(trace_recursive_lock(cpu_buffer)))
-		goto out;
+	cpu_buffer = rb_start_write(buffer);
+	if (!cpu_buffer)
+		return NULL;
 
 	event = rb_reserve_next_event(buffer, cpu_buffer, length);
 	if (!event)
-		goto out_unlock;
+		rb_end_write(cpu_buffer);
 
 	return event;
-
- out_unlock:
-	trace_recursive_unlock(cpu_buffer);
- out:
-	preempt_enable_notrace();
-	return NULL;
 }
 EXPORT_SYMBOL_GPL(ring_buffer_lock_reserve);
 
@@ -5143,11 +5158,7 @@ void ring_buffer_discard_commit(struct trace_buffer *buffer,
 	rb_decrement_entry(cpu_buffer, event);
 	rb_try_to_discard(cpu_buffer, event);
 	rb_end_commit(cpu_buffer);
-
-	trace_recursive_unlock(cpu_buffer);
-
-	preempt_enable_notrace();
-
+	rb_end_write(cpu_buffer);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_discard_commit);
 
@@ -5170,31 +5181,16 @@ int ring_buffer_write(struct trace_buffer *buffer,
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
-	void *body;
 	int ret = -EBUSY;
-	int cpu;
+	void *body;
 
-	guard(preempt_notrace)();
-
-	if (atomic_read(&buffer->record_disabled))
-		return -EBUSY;
-
-	cpu = raw_smp_processor_id();
-
-	if (!cpumask_test_cpu(cpu, buffer->cpumask))
-		return -EBUSY;
-
-	cpu_buffer = buffer->buffers[cpu];
-
-	if (atomic_read(&cpu_buffer->record_disabled))
-		return -EBUSY;
-
-	if (unlikely(trace_recursive_lock(cpu_buffer)))
+	cpu_buffer = rb_start_write(buffer);
+	if (!cpu_buffer)
 		return -EBUSY;
 
 	event = rb_reserve_next_event(buffer, cpu_buffer, length);
 	if (!event)
-		goto out_unlock;
+		goto out;
 
 	body = rb_event_data(event);
 
@@ -5206,8 +5202,8 @@ int ring_buffer_write(struct trace_buffer *buffer,
 
 	ret = 0;
 
- out_unlock:
-	trace_recursive_unlock(cpu_buffer);
+out:
+	rb_end_write(cpu_buffer);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ring_buffer_write);
-- 
2.56.0.567.gdb80ae8cd5-goog

