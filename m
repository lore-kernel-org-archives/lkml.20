Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9207649E5D4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261922; cv=none; b=BMrdZmQFkGz3TbFNx9O1nv15aXwEg7dw1LhQysdxTKL4P8+jqC6Tz5IC3gpywkbIbGFu6h1sLuX2LRZiISpHQVF15QUChySG7jFjS6IAriGnhD7GLrQkf122qiDTWUbT3Fvy4d1EFyEriCp3wqQKW6gVs6NEJErTd8njCHC2weE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261922; c=relaxed/simple;
	bh=95PAoWhYs9fl55L20UPN13Q1UjKONr8ycP+35DM6Vz8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LRmw92xPY+if7bb5h/5WUDiEBmP8+MPzSYxshnU9UN4xieyhUipjPFLnTAEu8oxQZ5PT52+lI8CTn3/qVxdOPvgoWc19FD5qpjoti3Fhkqcq9VBI4oJoxu7wP6861d6tAoa2tZ2dF6DHOzltTnyAQUKRttTd+nLRKNp1SGlLdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERjxKx7I; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERjxKx7I"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aa47eed2c3so2735770a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261917; x=1790866717; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHfIQa3c5HGjai+QOtcEMEXeF4Yu9XjOtKwEKN+u8bI=;
        b=ERjxKx7IUXMRJFnazRMRTAmhmYasLvErje4O86LiVQhragrUKT2rRDuomHhl8rvs8H
         1JO4ynLejBJaUfqLd3SEscoNw+UyH3iVKxXLQrj+DUkKIUHRvnTw8/cOUEa0IODUufYq
         9gOSaL1Lb3bFPGp3xsHfM/Bql0KjM2Oa9+6LdFtPi68nGhlTfGIQyJlKWzrCSRXcVP1Q
         DR+uRa4uOLKdX2L1QW+kUJ5fRMJf/bMP/OqxPjqNyJio+BllRQa5A2RqUtLl3enBt7Cd
         So3EVcbPqunoi08Jhft5mHqynlSGzD5K1niLjizi00hKbmf2QHeVon+OeHNfv+7liUcv
         c+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261917; x=1790866717;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHfIQa3c5HGjai+QOtcEMEXeF4Yu9XjOtKwEKN+u8bI=;
        b=lpNVqf+dHJL3ZM8YGRA7l92qtFcuZq5JUVJbeueVeyhequ26vRip6/zi2XuC0ZYGQM
         M6rBnQ/fQi33D8lsMu7EMBMGsbgBMhKnswBba4kIFjCFdggqOdyMjgjw86UTqHk1YkdQ
         xUCexIKCWfubLgQslH12WRPZkhlWo6Z/bEXrIGvWbLGXRZBFzNtTZ7vn9noVwmCChnXC
         r5+PjeHbRWcxNXC0A2kTQx2DIzlu77Uh7yCO/Lz+ezceqnGq06DqcWW1xA0dkNEmGWOo
         d7fPxXL4zvf4xLmd4I1PcuP81Yc+XQ7chnX4ihkh88Bhu/DMif/sioJ9gtnvE9WpH6mY
         9Fag==
X-Forwarded-Encrypted: i=1; AKwUvBxt6pMz8SJ+n5dNIxh5nI559yeG4P4Uk4pd26E7qwSjNJgB0yMw/HLFkSc8/c1IbMpBokDZGPY+U72OBJk=@vger.kernel.org
X-Gm-Message-State: AFuF++nuwjNiCS/E1jY5PFYl0E1G1oHFdQVynGdiZp/NYzZxD22RygIA
	BEvxgpNERUBmE+u7LPir8nHKZlu9U2bn9iReFqPFIGMu+UA+P9D3uMcEAQquV68JZuUEN92T8my
	PyHtEucPLYDt+4MRJZTw3AA==
X-Received: from edcpl8.prod.google.com ([2002:a05:6402:c148:b0:6a8:1d4c:399])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4390:b0:6a5:fbc6:cad1 with SMTP id 4fb4d7f45d1cf-6aac8f22fcemr2498337a12.7.1790261916925;
 Thu, 24 Sep 2026 07:58:36 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:46 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-13-vdonnefort@google.com>
Subject: [PATCH v7 12/20] ring-buffer: Use panic-friendly locking in
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
index 507ab1fab0fd..f9533a97e2f4 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5687,6 +5687,9 @@ static void rb_iter_reset(struct ring_buffer_iter *iter)
 	}
 }
 
+static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer);
+static inline void rb_reader_unlock(struct ring_buffer_per_cpu *cpu_buffer, bool locked);
+
 /**
  * ring_buffer_iter_reset - reset an iterator
  * @iter: The iterator to reset
@@ -5698,15 +5701,18 @@ void ring_buffer_iter_reset(struct ring_buffer_iter *iter)
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
 
@@ -6386,11 +6392,14 @@ ring_buffer_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
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
@@ -6536,12 +6545,15 @@ void ring_buffer_iter_advance(struct ring_buffer_iter *iter)
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
2.56.0.rc1.310.g51773c2048-goog

