Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753A4FC8D1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062199; cv=none; b=i/jSwxzdDaQRYa6YbYdmofwTct/StPpeY574SW3N2jazmmaPk0ZaGEOB+OZo9XdrGlnxeTYyhHj3KQCg5/XZ1TXZpDIxkS3809uvqmDGRAGHUn6HQmu1+8IzrxrParUVfoShch1QDS0yCSgCAPNY2yA2ISXoimLN3SwnunZRVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062199; c=relaxed/simple;
	bh=d4W1CAKZqJFP+rhzc/mGkXmSM4enJRB9Jj4NgZnjZbc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XXwq797pXGf/iVH+qYnm2mHigw/+2HV4e7OrGe4KH0RIyBnL2/gro9jdWqNaGZdBzpV1dkE+hIBjFkUhYqvy2JpRQOGOc4OLc0XMOjZrktnIBfkuQ/3BAyjRSWxxE5AWoe/0fg7YKyPy+JW6IPfCyMxAqLBmsPsqRRb+PdO4Lz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/Ik0XL7; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/Ik0XL7"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso28239485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790062196; x=1790666996; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1G2B+1jiMpXjFmSkI0X0frbWg2TCjpXRk9JIZopsjE=;
        b=G/Ik0XL73T6Ln+9drxC5PWRNnCyhPGJztUXGtf1kJBuwJS8jF5d9Kfh+gUK2rAsZLC
         1y7lOSG3WLo+AGpdD/i0oA94wCwg4+R0ggMWVC/i19tiTQTYiH/rF/R6o7gG4sIptmY9
         B5zw6Ofu0rLfrgAlxvB3HYYV5lasCS1Xog93klxnldeD8XPDXApUtPjxhxxyz2L15QSO
         UI5QAVi+EUcCGskSFJYpG78m4AdVeC8cfV4WuKitzZc+Zsn+CjRxVJXwj7bnViFKeCSU
         WwvDv6eMNediewj7KZTrmPczqeDEYqEC0qCXUZ1+E/2FOlsILgt9bnoDhJzdZ3iiwDd/
         qYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062196; x=1790666996;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1G2B+1jiMpXjFmSkI0X0frbWg2TCjpXRk9JIZopsjE=;
        b=gDTdz8cfm1K86sEbF+Q34lAnvzS7pTvj/z9t2ZHVf0AN5DtuFrmqW5zR7O0xFKAWgU
         ba5KIILLtNjifWRSBG2PvUFYP17/kmC0EI4RvuxXhwzKnSFuhykqZtKuEVL6BUITX92O
         JKZVPWB0fqd1U4WTa4UZrQECV2wcGAiJd+FzsyhL8EatkBD5bKChHQ6HeP5bhtxM2J2Y
         4mv7ToBOZzQk1qa+vNZtcJv8T9/Rcz6AckhHonoKOco5DQIkG3n5ROeEMlxvi6xpJfRi
         yMOVZ0KZqEMM05BVkCy9IF/6zCp2WF7+UoBjnTmi5lWcklXtv8AybsEfAYjOOUg8xNeZ
         Zm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw92qH4m2J45zQ83rpJuapTfdnU5bvzSkVOMcSgToerxlTn1gGjhSbXi1Ex4d5Mi6BLlKPJawW2nuVz/jw=@vger.kernel.org
X-Gm-Message-State: AFuF++lalXHLsFey24uL33UER7yUYaRxLYmeKAqZO4de98vH+CevLZaP
	fyLYU5h54T1OUD67QnfRdlN6mfH1+s9K04uw5gVI+TDmrS8kG29Ufz/nWz1frkFHBrOkd+1OSAt
	d6XSB5XdYG9Bpis7KHas9dg==
X-Received: from wmxe3-n1.prod.google.com ([2002:a05:600d:6503:10b0:49e:6ad9:14a2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e07:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49fc58594d0mr181580785e9.32.1790062196167;
 Tue, 22 Sep 2026 00:29:56 -0700 (PDT)
Date: Tue, 22 Sep 2026 08:29:43 +0100
In-Reply-To: <20260922072944.1281427-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922072944.1281427-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922072944.1281427-4-vdonnefort@google.com>
Subject: [PATCH 3/4] ring-buffer: Drop redundant ring_buffer_iter::event_size
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

event_size contains the maximum size the iterator can read for each
event. It corresponds to the maximum capacity of a ring-buffer page.
During non-consuming read, resizing is disabled. It is therefore safe to
just use rb_subbuf_capacity(), making event_size redundant. Remove it.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1a158a24b3c8..3129589e2d0e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -680,7 +680,6 @@ struct ring_buffer_iter {
 	u64				read_stamp;
 	u64				page_stamp;
 	struct ring_buffer_event	*event;
-	size_t				event_size;
 	int				missed_events;
 };
 
@@ -3558,9 +3557,11 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
 	 */
 	barrier();
 
-	if ((iter->head + length) > commit || length > iter->event_size)
+	if ((iter->head + length) > commit ||
+	    length > rb_subbuf_capacity(iter->cpu_buffer->buffer)) {
 		/* Writer corrupted the read? */
 		goto reset;
+	}
 
 	memcpy(iter->event, event, length);
 	/*
@@ -6488,8 +6489,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 		mutex_unlock(&buffer->mutex);
 
 	/* Holds the entire event: data and meta data. */
-	iter->event_size = rb_page_capacity(READ_ONCE(cpu_buffer->reader_page));
-	iter->event = kmalloc(iter->event_size, flags);
+	iter->event = kmalloc(rb_subbuf_capacity(buffer), flags);
 	if (!iter->event) {
 		atomic_dec(&cpu_buffer->resize_disabled);
 		return NULL;
-- 
2.55.0.1082.g2b9226bbc0-goog

