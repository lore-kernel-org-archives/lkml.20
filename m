Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492898;
	b=FAye1sc8bf4ENbf1Lwzf4Gnx5ohLsT5Cf6bbf1+KOn5f5q0S6il9P7LEQhPlRQrzh2ny
	 RSsO26j4YsMHxQq/OcN0hb7Ot9OVPwwoNA94rXASeKjojkhjY8nTRvDIa11mQ7FiT0/OJ
	 HaTuFoIv5rnic16TiuOrYpHq04USfi4BBcRenXR/T4YkMNxJo5uo75VTD68qrr4Xu/UtC
	 exwvN3Hj67nsiID/AxstKL7XpXvJWBrr1Hjint+TLctaiFTa35PQX7NKA690F9ABbHskn
	 Vf980Hk9oed92h6JlndxxveJ/KMLDyFc+fzAoKAUxM1znW2Q4v0grYA3b8ovubVW9ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ArsgCa0wLe96LZrSL4fRyMpuyHeakqWG1fz50dFcxk8=;
	b=O9iFxmPr3EX8HJxeXb7/8rsW7KSvGgyGKpnZDhPV64w4VI9KAC/H2mX3BrkDqbjFfjs+
	 Ww0/+qRn6TcFkfm8LT6nkoGhs2n9mQo/CTsQ0e3abauBjiNjzNGaPQZOff1ZbZsN9lalO
	 TAdJFKiXjlCSEXaMy+h4Wk36nzYq4UtiXV0zK7KtKRsg21Uf5dWMAfHjHzxhyGQh+VvJG
	 T7Zvh56sTwkJ/VhklP79Fj0jfiMVc0as/02vlOeCrDWH9Gao+UwU4ug3Nj6s4HjqBbWQa
	 7axhYTVjvbiU43dtDCdH/7n4xyHV3OJORUQ+oh9dcKEKo1SKdiD7Pey7OEAZFiBMBAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aVRVSSOY;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6F60A2617
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF6F60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aVRVSSOY
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso3252293f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492897; x=1795097697; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArsgCa0wLe96LZrSL4fRyMpuyHeakqWG1fz50dFcxk8=;
        b=aVRVSSOY96a8xDYF2bBbVwHSJUM2WeNZqhtD0q5SAXptPggCQrd+UGl12uWVCq7Kab
         1bjzLTeK5FqLM7O9wgjnDHgCHFiV3re1+QgzeWPiQ1+1ptH+IKf9GYNy09QUUTSIjc9Y
         6pW1SUYe69IddU8Ses5V+RNbsngOinQrf48dgktpUaqlCUHZIm0vgJn524sHZcEzfnmI
         QGajffOFhRaKDRUKgccKMuTy/C2OIHHdej7j7Nb9ua8oEVKbybbHkH36KSgWx1iGdI7j
         wEcuz8Y1kNEapU88gDCcukROHrLnUJ6LW0Qpxr4dFqqiyb6++3beKXTUMWdhQ7/Dga11
         ndjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492897; x=1795097697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArsgCa0wLe96LZrSL4fRyMpuyHeakqWG1fz50dFcxk8=;
        b=L7CVz56k+J+82Oqkyk/dv7+2ilX6mYCMM08ZfFGrpLH0Sw8rZVxXjc2sgJd8wM2VEw
         /ra5QmCE3W89MHT6aD+tnFjUBx7/GC47ALNN0i+sPp/QiApW4DZaWjWyI1JudyI2dgf3
         jSSety47kXbYj3mlmcMDIn2ujrBQoZwIv0uWOy1jkpv5l1aCeFesXdQN7etD0OdhM4Sb
         LoOH9IowMiDblgYpFg6xk20vyq89lrWYiQ557z+LFM/xONCqAIPDU+VmFNJysF8XJBSH
         hebcMjdkU0YUu6H26aQla8gElvDjdHSMXKMFuDvq/Knd4Ek/CtPZWKQj3YJaRvOzcUKH
         7TCg==
X-Forwarded-Encrypted: i=1; AL+hErHJbiU/VYn9VFZ/8/K1kIL6nGrqhT/GHYUyU6qjONlEM6BqiBPYAYrXGCMA/t+O9dQ0SnrMaf9ECM07Im8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kXb2QvQyhhTp5u5jw3spmx4BkdXj7EPpPedNp5ti5o2MRAmMs
	pt1IhoVuJx3lRcleKKGDRVEt/EhbF8vqn7znSqoUuy2Wx0yTEQpqTDRuU0WqA+TMzAQWGBQSb1l
	/Y/z3+dORf6RgiFm0x3YyPg==
X-Received: from wrbdh16.prod.google.com ([2002:a05:6000:a90:b0:48e:579c:a0fa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-499c75528cdmr10521761f8f.17.1794492896488;
 Thu, 12 Nov 2026 06:14:56 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:38 +0000
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
Message-ID: <20261112141440.3050124-8-vdonnefort@google.com>
Subject: [PATCH v1 7/9] ring-buffer: Avoid reading buffer::subbuf_order on the
 write path
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

buffer::subbuf_order is protected by buffer::mutex, which cannot be
held on the write path. While reading it is safe because writers are
disabled during order changes, reading the order from commit_page (which
is pinned for the duration of the commit) avoids confusing context
analysis.

Because rb_subbuf_size() and rb_subbuf_capacity() are no longer on the
write hot path, drop their __always_inline annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 02d3cc193d1e..82f6e3df4627 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -606,7 +606,7 @@ struct trace_buffer {
 	unsigned int			subbuf_order;
 };
 
-static __always_inline unsigned int rb_subbuf_size(struct trace_buffer *buffer)
+static unsigned int rb_subbuf_size(struct trace_buffer *buffer)
 {
 	return PAGE_SIZE << buffer->subbuf_order;
 }
@@ -620,7 +620,7 @@ static __always_inline unsigned int rb_subbuf_size(struct trace_buffer *buffer)
  *
  * Return: The maximum size available for events in a trace buffer subbuffer.
  */
-static __always_inline unsigned int rb_subbuf_capacity(struct trace_buffer *buffer)
+static unsigned int rb_subbuf_capacity(struct trace_buffer *buffer)
 {
 	return rb_subbuf_size(buffer) - BUF_PAGE_HDR_SIZE;
 }
@@ -632,15 +632,15 @@ static unsigned long rb_calculate_nr_pages(struct trace_buffer *buffer, unsigned
 
 /**
  * rb_subbuf_start - Get the start address of a subbuffer
- * @buffer:	A trace buffer
+ * @cpu_buffer:	A per-CPU ring buffer
  * @addr:	An address of an event on a subbuffer
  *
  * Return: The start of the subbuffer for where @addr sits
  */
 static __always_inline
-unsigned long rb_subbuf_start(struct trace_buffer *buffer, unsigned long addr)
+unsigned long rb_subbuf_start(struct ring_buffer_per_cpu *cpu_buffer, unsigned long addr)
 {
-	return addr & ~((unsigned long)(rb_subbuf_size(buffer) - 1));
+	return addr & ~((unsigned long)(PAGE_SIZE << cpu_buffer->commit_page->order) - 1);
 }
 
 static bool rb_is_static(struct ring_buffer_per_cpu *cpu_buffer)
@@ -3582,7 +3582,7 @@ rb_event_index(struct ring_buffer_per_cpu *cpu_buffer, struct ring_buffer_event
 {
 	unsigned long addr = (unsigned long)event;
 
-	addr &= (unsigned long)rb_subbuf_size(cpu_buffer->buffer) - 1;
+	addr &= (unsigned long)(PAGE_SIZE << cpu_buffer->commit_page->order) - 1;
 
 	return addr - BUF_PAGE_HDR_SIZE;
 }
@@ -4168,7 +4168,7 @@ rb_try_to_discard(struct ring_buffer_per_cpu *cpu_buffer,
 
 	new_index = rb_event_index(cpu_buffer, event);
 	old_index = new_index + rb_event_ts_length(event);
-	addr = rb_subbuf_start(cpu_buffer->buffer, (unsigned long)event);
+	addr = rb_subbuf_start(cpu_buffer, (unsigned long)event);
 
 	bpage = READ_ONCE(cpu_buffer->tail_page);
 
@@ -5091,7 +5091,7 @@ rb_decrement_entry(struct ring_buffer_per_cpu *cpu_buffer,
 	struct buffer_page *bpage = cpu_buffer->commit_page;
 	struct buffer_page *start;
 
-	addr = rb_subbuf_start(cpu_buffer->buffer, addr);
+	addr = rb_subbuf_start(cpu_buffer, addr);
 
 	/* Do the likely case first */
 	if (likely(bpage->page == (void *)addr)) {
-- 
2.56.0.567.gdb80ae8cd5-goog

