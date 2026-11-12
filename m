Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492894;
	b=aHzVwpNErmyWv8rcNuMm9gr/nuyvkeJfUpkvGh3tUP0kybT8vz3tWPuoffYWRL89S1DK
	 EfaCerjJAd+TSRRDJmW9u1rcuycvu+TDJbs+mP7++DIxIAUzJf1cD/sb+6pqpMMx+jOrd
	 kMPl3fgt8PwuPTo3cEtOC8klo4dyJn3/mc5/zy+xLD2v2mc0ctaReRGuvDZsyVUQnGgHs
	 DtpRF/kzB+cLYeNXAwiLSPZjKoiJ2uJSBTAzJm7l97yvgzQIuS4uC/8QvrT6AL/7JDCnP
	 fMs2dmG+g1vV2OS4T2YD2ctDxfp/N89GjD9Bd0mfkmDtgmBOARIecG4dn8iQr6poACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xAClSiqpxgiWtN6dUqngBZJDx0kh28kPHWYf1nhrDXA=;
	b=42Vz8z7derI1rtx2THTalxUHyL190szkGFzzVqCke5pGul86tCKPe4uv3QjNVK80eeOP
	 tror1w8KUwVBQ95JyjMQYQb8ajp2uGn4koaUgNL946ZK48xRvkajsG1ZNZbEJJKAW4Nq/
	 atSmZR01u0cU4ESG8r6c7q+OdY5gXXdU9TObfc4NaIlnM+AoUzXwaUS3c6CB8AsTWG7Sl
	 O9PTB4tuL6Nr1e3EceHDdD8s8rSnLFNRXEzk1P/ttF2IR3+f+xIM6gVVi8H/1/rcpLp+V
	 YHGwXt7wKDTzmZGcjSnrG3Oulrhb18xnbK888uFQzOp9J8W8fRyWvGg7CcdehIPCb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jfrnVgTz;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E554606A88B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E554606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jfrnVgTz
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49337a224a8so3583504f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492893; x=1795097693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAClSiqpxgiWtN6dUqngBZJDx0kh28kPHWYf1nhrDXA=;
        b=jfrnVgTzpxLUTf/eoqYwvOS2cAv8xZz8nodQW6ZnOEkjIqMsKK4HwbX/AnnnP9uFa3
         fjJ49ZWwutbFXu0cKoML/jqLSjljRv/B7n8VsCpnuymjV57R+pj1L49nqUgzWiU1AuVA
         /eLPWVmcEewRSMj0OTTkezz89TJbNUwpnsazNv9gdOEVQee8s7yjwepxaTCBPXYc4acs
         jHsymJXwk9Z/NelXTT1L0yQn6Am27pOkRbeeKrKwDHO1weQ9m/7NoTSKKb9fV9MKi6Q9
         fDnhCEct5mNFMIri322dAkKoDQwQJbIXvtQF8d1ZkiGHsVrP/ipAFqReRfw2tHXT7Hpk
         5FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492893; x=1795097693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAClSiqpxgiWtN6dUqngBZJDx0kh28kPHWYf1nhrDXA=;
        b=2fcnciGrfg5OkLAvl5nNoN9iNtJfrF3JrTrzPbxdqgwCYykOPLxcm/linjxXkRGXrd
         EKYn1jcvj3f/XboEzWacEAEge5qq8a4M3ryC6U2jXXmDBu4K0Iv6/wSq6FP4sx+Ja7H+
         ioT1+mG+aX7W9MGwXXtNULAMJ3LEvtf790lkxPecKjOgNwkRXsYpHPDJLvLBSkDJJruK
         ZQoa8NsPqZpvuk13fJxMjvlOQ8ryrE3k/B2okrnWOMFt6nJe6/nd821MCS6YbxNfwHpi
         jN9J4RRN6qM19/YsgjQDd4xy+IMj6uKWa43nHzRTwMsR/knT7UUMgjdbGbzoeg/3wppG
         blNA==
X-Forwarded-Encrypted: i=1; AL+hErFW/svwjEZplnAS4tJVSPHd6kxNR3Lqmq8BaBssb9w/oi4SjZcYqh8Z10Xi2LP2AH2HTqgKtcj4ruaqNyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yvd18KalUVao1xMXSzJ0ATCwW3j7DM3p/cgZH2J22e3SszL/R
	eIQO5GXwCF7pCg0XIfiXoeKgXnkgddHnNPD10e2REeId5nLN2QOcvVRFVd+w8heMrSB7g+jKw56
	w7rOarxzjfn/KUQ3BIDk18w==
X-Received: from wrol12.prod.google.com ([2002:adf:f48c:0:b0:48e:55f9:4a97])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4013:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-499c77414eemr9585917f8f.21.1794492892370;
 Thu, 12 Nov 2026 06:14:52 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:34 +0000
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
Message-ID: <20261112141440.3050124-4-vdonnefort@google.com>
Subject: [PATCH v1 3/9] ring-buffer: Hold buffer->mutex in trace_rb_cpu_prepare()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_reset() walks buffer->cpumask twice across synchronize_rcu()
under buffer->mutex. If trace_rb_cpu_prepare() adds a CPU in between,
the second loop resets an undisabled buffer.

Hold buffer->mutex in trace_rb_cpu_prepare() to synchronise it with the
ring buffer reset instead of locking the entire hotplug path. As a
consequence, the cpus_read_lock() in ring_buffer_subbuf_order_set() can
be dropped. The one in ring_buffer_resize() still stands because it
schedules insertion or deletion of ring buffer pages on each CPU.

Fixes: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 32d3c47dbdf0..80f500ffd7ac 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2824,10 +2824,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 	buffer->clock = trace_clock_local;
 	buffer->reader_lock_key = key;
 
+	mutex_init(&buffer->mutex);
 	init_irq_work(&buffer->irq_work.work, rb_wake_up_waiters);
 	init_waitqueue_head(&buffer->irq_work.waiters);
 
-
 	bsize = sizeof(void *) * nr_cpu_ids;
 	buffer->buffers = kzalloc(ALIGN(bsize, cache_line_size()),
 				  GFP_KERNEL);
@@ -2923,8 +2923,6 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 	if (ret < 0)
 		goto fail_free_buffers;
 
-	mutex_init(&buffer->mutex);
-
 	/* Persistent ring buffer needs to flush cache before reboot. */
 	if (start && end) {
 		buffer->flush_nb.notifier_call = rb_flush_buffer_cb;
@@ -3330,8 +3328,9 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 		return 0;
 
 	/*
-	 * Keep CPUs from coming online while resizing to synchronize
-	 * with new per CPU buffers being created.
+	 * Insertion or removal of pages in a ring buffer is scheduled on its
+	 * own CPU if online, so cpu_online_mask must stay stable. Must be taken
+	 * before buffer->mutex.
 	 */
 	guard(cpus_read_lock)();
 
@@ -7475,8 +7474,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	if (psize > RB_WRITE_MASK + 1)
 		return -EINVAL;
 
-	guard(cpus_read_lock)();
-
 	/* prevent another thread from changing buffer sizes */
 	guard(mutex)(&buffer->mutex);
 
@@ -8077,6 +8074,8 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct hlist_node *node)
 	if (cpumask_test_cpu(cpu, buffer->cpumask))
 		return 0;
 
+	guard(mutex)(&buffer->mutex);
+
 	nr_pages = 0;
 	nr_pages_same = 1;
 	/* check if all cpu sizes are same */
-- 
2.56.0.567.gdb80ae8cd5-goog

