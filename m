Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492892;
	b=VHLZQGokrGG9irXZnFEKj3vB8xy6CeFYSh+cVZRTsrCdY9stwR1v5qeeatzU2wIMUIf8
	 mMxVZiiCk5uDECPeIvWjc2ONEHBPeu8toK5fPZuj13RUnttxwEWF+8iVGce5+3MnSXn68
	 Anh4oUm/d02lQFTt6RNne444XeSELyOkTpUM10Zs9cu9z6IAC9VbgxIHd9KavLf8V5rWr
	 Gv743yWK2qF86ya3bPF1LQ6mEmLIv6ffJubq4Dfh/NI0iumrmaW58T6ldfzS911oz6HOT
	 68adML8kYKEXkHV7qWol40eYvPFEUn8XCO5myk3GpaMJpCKw2QFdS+QRJuF+d8/SYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qPYxO8yb9cFKKsz6ALKUIcminvOwQueZf2m4pspgC6M=;
	b=hmVVPgwyqk4FFw5rJ4raM5qnAsW931eudEyJwuSp/KhmCkmRHyw6j1MW/g0FyPz67Z0t
	 gocesQmb1aML/rJ6ivHPxIJ8zt3Y2bSAgTLSBt+O0ncPoG5/8Yim+FA1d3OhWxoEj0bLR
	 XS6Qnan2ZqPwmcDxzbSbtFG/Tpf4vkTJ0Dp22ASiwVflanODm0byczt5JBa+GkgZ9qwb6
	 Mktj5V0QwuOwg+vS7z/qH2KjE1jvcgddOkNPEW9YgcqpJLamiRbUhFMuHiQqiGx6mX0Se
	 LBlPGjiDfFe4Xc+E1BTQy9exuHAuST5JFGIFcv2DX3ouXnamFeJoSTIVhxH9nCK1miw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+VoHntu;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F918606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F918606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+VoHntu
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so3583488f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492890; x=1795097690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPYxO8yb9cFKKsz6ALKUIcminvOwQueZf2m4pspgC6M=;
        b=j+VoHntuU4igrsmP6TE1OXCUM1JRlm8fXK456qTbFwNlDde40bQ21lOzivIdAbyVzS
         Y0L44Xp0XPVQI1+XwKk83yluGoJmW0sLUeMQcKcPRd1b98j1c2ApsrZb/5h3I2MEdfjL
         gGceVSYiKQLYZBraUJFUyyXoFdVFUgbqhriymQeyPBI4XgR2D9uStqt8DGW/VjuM0K3t
         cNVNlmLme/bcw98AqojzrVAhWyhwqQpggTQlB6P1nTRgEjOpeCHuhGu3KOEG7p8wJy/x
         rCvilkjR0J8RWe3WNo6Or1viY5v3MJbuA74gwTLIR214sEtRZK1AhNe5tlnEfMpSedSY
         Yeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492890; x=1795097690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPYxO8yb9cFKKsz6ALKUIcminvOwQueZf2m4pspgC6M=;
        b=DrZhMTHuZO/uasgF8veh44yJvxaqecRoPVehtwe8QAskz72qwpljxd6P4oLxuKJ1vY
         iYF2rO6FqEVu5twCdFERBY94eQ5GyLQQrNuwk710DXZSzU5dPCXAyj91AZEkrON8K2Zx
         5wdPgUHeS41ZFSphSfEuvXzixqtV/ysA+EWaqqJ1IOSRtGYqB2B0QbvypdHdSn7MGFFc
         bxKBvUyfwWqe9ED0FmbLYiQyllwXQQp41Swd0DVJpaG22S8B8HTqokBGnmlTRsncvWe1
         OGpqtvzO9tGQJXiZvutB1KOmWOGFmU+2//Lp87C24VzCCUFSuqKsmdTXdkniuSFko2IJ
         Gapg==
X-Forwarded-Encrypted: i=1; AL+hErFU8K/DDOXo2H0Xrr8tN/uvI2c2zjzgyhcDsuc/ojQxTQn9sYTlJx4IjqhUZevms2u9qsah0AWHioRrIEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7fu0eCN1NiVdPPM8mwA1O3bl4y6I2j1NcWs3Q5GqWSXcGpOoi
	VvvBPSD1n5zwZw2g29FA+JegK2ME37CAtfaXEKDCBVbykxsqKUpo+Z7B08WaGtgKcHwwRrogjmh
	OPQXvS7l0Ix1GddBf5WBsAw==
X-Received: from wrnw1.prod.google.com ([2002:adf:ec41:0:b0:48d:efe0:5ddd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:250a:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-499c8c6703cmr11900707f8f.50.1794492890294;
 Thu, 12 Nov 2026 06:14:50 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:32 +0000
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
Message-ID: <20261112141440.3050124-2-vdonnefort@google.com>
Subject: [PATCH v1 1/9] ring-buffer: Always read buffer->buffers after testing
 the cpumask
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_reset_cpu() reads buffer->buffers[cpu] before testing the
cpumask. If trace_rb_cpu_prepare() sets the bit in between, the cpumask
check passes while cpu_buffer contains a stale value. Read
buffer->buffers[cpu] after the cpumask test passes.

While ring_buffer_peek() and ring_buffer_read_page() cannot hit this
race because callers already check the cpumask, apply the same pattern
for consistency.

Fixes: 554f786e284a ("ring-buffer: only allocate buffers for online cpus")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..bd8126f6353b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6340,7 +6340,7 @@ struct ring_buffer_event *
 ring_buffer_peek(struct trace_buffer *buffer, int cpu, u64 *ts,
 		 unsigned long *lost_events)
 {
-	struct ring_buffer_per_cpu *cpu_buffer = buffer->buffers[cpu];
+	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
 	unsigned long flags;
 	bool dolock;
@@ -6348,6 +6348,8 @@ ring_buffer_peek(struct trace_buffer *buffer, int cpu, u64 *ts,
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
+	cpu_buffer = buffer->buffers[cpu];
+
  again:
 	local_irq_save(flags);
 	dolock = rb_reader_lock(cpu_buffer);
@@ -6740,11 +6742,13 @@ static void reset_disabled_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
  */
 void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu)
 {
-	struct ring_buffer_per_cpu *cpu_buffer = buffer->buffers[cpu];
+	struct ring_buffer_per_cpu *cpu_buffer;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return;
 
+	cpu_buffer = buffer->buffers[cpu];
+
 	/* prevent another thread from changing buffer sizes */
 	mutex_lock(&buffer->mutex);
 
@@ -7198,7 +7202,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 			  struct buffer_data_read_page *data_page,
 			  size_t len, int cpu, int full)
 {
-	struct ring_buffer_per_cpu *cpu_buffer = buffer->buffers[cpu];
+	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
 	struct buffer_data_page *dpage;
 	struct buffer_page *reader;
@@ -7211,6 +7215,8 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return -1;
 
+	cpu_buffer = buffer->buffers[cpu];
+
 	/*
 	 * If len is not big enough to hold the page header, then
 	 * we can not copy anything.
-- 
2.56.0.567.gdb80ae8cd5-goog

