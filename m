Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988479;
	b=exFNWw/+ddjQXGmbVysZUs8kMrdtnEi+/lsBCWRn3GhROw5ZmbuPjCrdM3w77YZG+wPE
	 1fmmqd6Kh8j/deTfGIIH3qyKT8ABnnwZ55r738rrL3SvESd54E/dgqvq/V0CFEa9EpCw7
	 0ZAveVTAosl7OxUyaGCuOngNmakRtV6dRjNiz4UrZv+x0Y+GIJA6xoN+Kodfrt7Cx3GOQ
	 GzhOq+L1WDw+N+zTT2Hw1GAD53jQIGurjbCf/PiIUDezg4O2OCm9W7zYfDFDIlsEGECuv
	 rBBjQ55W5rzUh6QEcpCbpwbOpxJ97q/KyoZRPl9PlYgKgn+HAVFG5sqZOa0cgdId56w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cC3M+M7HNGl6VpKhALDRkxF/MNtxhDncWW/zm3AEr1c=;
	b=4FDb5/jpOjUIfb8MrGYU4qqQSBZEQRsBIgqgtMMGq9KzsGSdbwUID0Uax1pCmvSr+oX2
	 H82QLX6aODHkncYG8ZHDbVHZfhS9z5pI3/4y1hEFOM3QK+SS5jaTy1tfuy0/hcCks9gLY
	 QRGItrCAS2BwluikLw5hEyGTsEwOlD8rNIrnIenKAmct9kEzmveS+8TO8RBt5wdfMsfoL
	 7+Ri48y7EbxpCg9eDKTL2OiSzdH496aRMCVFTsa4VjRF1cdsqzeIk2WZZdKd1r/rI8QNk
	 A2B0aWV7OUwT3Cd5IQCn1YVgrNQ0eUp/q+iU2+PB3n74jdxRBpwQi0BskfE4KT5moyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0xZork3;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621EC606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621EC606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0xZork3
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25edb54d22so130445266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988478; x=1794593278; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cC3M+M7HNGl6VpKhALDRkxF/MNtxhDncWW/zm3AEr1c=;
        b=b0xZork3SYlyK2remk0H5QpDeh2x/bs44/W72/gP2JghKBAMrnx7XdgTqihJNirgwT
         m+NsnQQRpTa1XUug8JRuwAZj/6efhU1LSDkjLWaszO6wGbsDRomCmUpr0JiD2+EyH9AM
         nB27l/Wlf+sDCDEjNtyZesRcVfr6XoPECSCQdbO1DBS3IgMTARCxG6yXGCTYDzxi9FxJ
         RXQP88q+vG4AdW+YgC+/ffU+uSRsT5egWPcD46whdGt0jRddWbDQlwrGgwpz+0eYE67F
         vE/o8Jl40BQ/5YAFGElxpOAHJotWF1CJE1gkhWyqPDtsw9u9Jg0ql9NNkAdrWa4tVpFV
         3MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988478; x=1794593278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC3M+M7HNGl6VpKhALDRkxF/MNtxhDncWW/zm3AEr1c=;
        b=vRJx0sp2Euixt5jsrqPzN8s66dfpD75flVtq0BfvbOCoed1QQ/6K++/KVaSh01lN8k
         uVpT5spPI1DDmgtFn4QbLf6eoiBUUOGpsak3ZH6nUjObIhWHfOUrF4cfoXDvl1lGs4YF
         vj3jtZcFru1wJ2XfBZ3Oe/qSBUvzuO0zGLLawmMVd+VG3xSzvzAgpfdkMBSXO/g+X0QV
         ry5PfMXiUzQFviN2UrURKpgehSK5wPDR7hBIqnCYOpMTutA2iv+5ivMlWKKHvnuwXtgV
         MOEcXBe7EBkffNyqeQAQDT3YxBfgO9pliZ5D4GrRCEN1J5oCnN4nF/7TYtsSgq6F3pld
         TB0g==
X-Forwarded-Encrypted: i=1; AKwUvBzwADAIfWLlKKyxrmbDT6R1V2ORo9zd7O+OBw23xIfP3sPcPTVyLGljh3nt2B0SiPvxLDdASHk1llEhrRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oUJHBxTRiZjqcTvtpI+7nmT+plA1LXm7TBAZUdNZMDU0Glq++
	0yE0TA1+SLUyzbxdQGkRb4O4jjeDXD7dToa4lDJ6p8KyLJWbVCkIp3IFOfLJK/YQntxRaFa3sEP
	73Qo3ODHc8srIz39If8sMOw==
X-Received: from ejcjx18.prod.google.com ([2002:a17:907:7612:b0:c3f:741d:2c1d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:728f:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c4d3536d200mr269675566b.36.1793988477702;
 Fri, 06 Nov 2026 10:07:57 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:49 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-14-vdonnefort@google.com>
Subject: [PATCH v8 13/21] ring-buffer: Use panic-friendly locking in
 ring_buffer_iter interface
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

In preparation for allowing trace_remote to dump the buffer on panic,
make the non-consuming iterator functions panic-friendly.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 0dc661a95d67..9c707cb751ba 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5690,6 +5690,9 @@ static void rb_iter_reset(struct ring_buffer_iter *iter)
 	}
 }
 
+static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer);
+static inline void rb_reader_unlock(struct ring_buffer_per_cpu *cpu_buffer, bool locked);
+
 /**
  * ring_buffer_iter_reset - reset an iterator
  * @iter: The iterator to reset
@@ -5701,15 +5704,18 @@ void ring_buffer_iter_reset(struct ring_buffer_iter *iter)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
 	unsigned long flags;
+	bool dolock;
 
 	if (!iter)
 		return;
 
 	cpu_buffer = iter->cpu_buffer;
 
-	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
+	local_irq_save(flags);
+	dolock = rb_reader_lock(cpu_buffer);
 	rb_iter_reset(iter);
-	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
+	rb_reader_unlock(cpu_buffer, dolock);
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_iter_reset);
 
@@ -6389,11 +6395,14 @@ ring_buffer_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	struct ring_buffer_per_cpu *cpu_buffer = iter->cpu_buffer;
 	struct ring_buffer_event *event;
 	unsigned long flags;
+	bool dolock;
 
  again:
-	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
+	local_irq_save(flags);
+	dolock = rb_reader_lock(cpu_buffer);
 	event = rb_iter_peek(iter, ts);
-	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
+	rb_reader_unlock(cpu_buffer, dolock);
+	local_irq_restore(flags);
 
 	if (event && event->type_len == RINGBUF_TYPE_PADDING)
 		goto again;
@@ -6539,12 +6548,15 @@ void ring_buffer_iter_advance(struct ring_buffer_iter *iter)
 {
 	struct ring_buffer_per_cpu *cpu_buffer = iter->cpu_buffer;
 	unsigned long flags;
+	bool dolock;
 
-	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
+	local_irq_save(flags);
+	dolock = rb_reader_lock(cpu_buffer);
 	iter->missed_events = 0;
 	rb_advance_iter(iter);
 
-	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
+	rb_reader_unlock(cpu_buffer, dolock);
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_iter_advance);
 
-- 
2.56.0.455.g6c5a503b38-goog

