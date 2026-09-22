Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791845187FE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062201; cv=none; b=Owj4OyeQIVuVyoXAZBUm3SQX7UBTVJZNBgz05ZALh/fD7PFPgPB+uZnMPdjSnfQyRnUzDvQG/BkKRlUu21o0aLdj7LabARlsvzXMH+QnnAbUFl/OEiOzhJU1a0QmwPog3gO+eAjHlZZgiy9CVyP5rao+7EZXLhgYiXbr9rUNwwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062201; c=relaxed/simple;
	bh=P2j4H5OOPy1kkyjHKrQvlylI3nUgsfi679sciLI2LvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VQrlBd5Uc+/xufrN5iAZzmYDgF4JSBbIp87Z9fgmj0UQlKUNjCyNDer/vcxNTsLb9V2SEpYLmUqefmyZxDhh9P1ydxm3bZvoTCrwiVt184FUVkkWaEL7bTx+rSUJLbGJ+f6PQRkV+Fet+vayIIE3fqI4Lp42K3KErqkw2W+3uo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GKw2hUpK; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GKw2hUpK"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e73659ac5so53779265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790062198; x=1790666998; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUOBcf3HiZT7N7pYBnaY6Oqumehc4v9l69pjwog+28Y=;
        b=GKw2hUpK1KlAnsENgfyDU403oG1jLrMMd1pw/auFrSnyYryauoB5zTuxEp+RXdyBrD
         PIgPpTQxmSk196m1KHf0LHjg9LA7N1WizDS17eiaagdGxXYSU6ZOsjQh7eG0AkNLSufg
         VYqROB+t7E0moIn5HokpevLNuxZnYcE15b4M8zv+DENwMxW3RTdGG8sy2NZZ7jdfSC7x
         ve6k6T4t1H0TvNm2+eRkuF3zpyzaZ+418UV+RmIPdSJIn41VlWxroRsCyioxJhPh1j+0
         B4enxD/YU03XyZkc4B3BlCQnxxPKBGF5jjKQrExI2FpptvvrH0ZTu1vq32NbvJHzXpBs
         bdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062198; x=1790666998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUOBcf3HiZT7N7pYBnaY6Oqumehc4v9l69pjwog+28Y=;
        b=pURgBYlNRbaj+j/KHP5hqG9SQunqzIylNO98F6tBsAv0wF2WiuFnUrqHJ26zI31i46
         Q8eW0K3V1OLBgO99XSJsD9Vs7zTJWEBT366LfaLUPcZjT5M5kQkRq0lx5mO0aCBciPKd
         cZEMrEPcd+VllgL/MinboIpbrgYt/gz1mzVHZr2iOGx2EmcHJXCOqRf46ZQlKgQm4BEH
         WFh3iimw7wa0xgkBMkucKuUHlNgtXiRJzqPNMLQ/EFumLCTC+2FpE3OfsdGZb3r1X9K7
         xHqVUAuTEr6VyJpm/GOZj9ErUmZVieIVe5D7KtkQ6mf8liSeraWNajbZlRkoePXr2h6m
         ovwg==
X-Forwarded-Encrypted: i=1; AKwUvBwjsHfloAYz24m/xMe5KmwxMPJ4PrhU51FU1RUgvGh2DAWJckWQg4msdFTE6dY21QzRn4wz4SOlrFmdFjw=@vger.kernel.org
X-Gm-Message-State: AFuF++kCijr82/z0/o31bxlpqEerI1rwLqz2d/PYqCFuQjMucJLpyv1M
	v1Ojx86SEx+903onWVl/nGvrfnGZl6GM9JPS6UQ5M9Rjcyy1HOq6227TQLVcbHf9RWlojtJbqVw
	bMf075L5Tetujx8TEADxhEQ==
X-Received: from wmsl27.prod.google.com ([2002:a05:600c:1d1b:b0:49e:7d32:b790])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b05:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fc574194amr168813245e9.32.1790062197497;
 Tue, 22 Sep 2026 00:29:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 08:29:44 +0100
In-Reply-To: <20260922072944.1281427-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922072944.1281427-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922072944.1281427-5-vdonnefort@google.com>
Subject: [PATCH 4/4] ring-buffer: Use kvmalloc for ring_buffer_iter::event
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The maximum size for an event correspond to the capacity of a single
ring buffer subbuf, which could be multiple pages, making this
contiguous allocation likely to fail with memory fragmentation

Switch it to kvmalloc() to use the vmalloc fallback under memory
pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 3129589e2d0e..f03fb9ed3372 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6467,6 +6467,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 {
 	struct ring_buffer_iter *iter __free(kfree) = kzalloc_obj(*iter, flags);
 	struct ring_buffer_per_cpu *cpu_buffer;
+	unsigned int max_event_size;
 
 	if (!iter)
 		return NULL;
@@ -6489,7 +6490,9 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 		mutex_unlock(&buffer->mutex);
 
 	/* Holds the entire event: data and meta data. */
-	iter->event = kmalloc(rb_subbuf_capacity(buffer), flags);
+	max_event_size = rb_subbuf_capacity(buffer);
+	iter->event = gfpflags_allow_blocking(flags) ?
+		kvmalloc(max_event_size, flags) : kmalloc(max_event_size, flags);
 	if (!iter->event) {
 		atomic_dec(&cpu_buffer->resize_disabled);
 		return NULL;
@@ -6520,7 +6523,7 @@ ring_buffer_read_finish(struct ring_buffer_iter *iter)
 	rb_check_pages(cpu_buffer);
 
 	atomic_dec(&cpu_buffer->resize_disabled);
-	kfree(iter->event);
+	kvfree(iter->event);
 	kfree(iter);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_read_finish);
-- 
2.55.0.1082.g2b9226bbc0-goog

