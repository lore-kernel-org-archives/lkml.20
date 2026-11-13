Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583654;
	b=c0LbSk3M0MHda1i7nx3/l4DY9NOp3DgUJlwAsZ7S1aPlFtdUbkWNS9BJpJeKpMuUsA3S
	 7eOsOlAjpDqLqAy0bTsu+EXIhWK1QllguQY28qXuD1DnAe3zsEhTPBkdDw4i2xQMDrbBt
	 3HSCzVZdOiPkFE1rJNq9ZQBfhUAW7UOUb6Rj09HJmf4VN+BtUK/ENWAWQRxHEruGVzlim
	 Xegn84gNoXrFcKNgJvZNY7nXXqPJZkSPCQ+4tVFCqpUqByPZ+aBx4DEvsznzGWOKU/wod
	 OMyJRRtl21wr9+e00wvovSY0wt8sYYjSMU8QeBvfnqvb4w9PMLgehMbcE8OhcGoGtXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Kb6BNBHWUZprPI1vwsmUapLJRh7sJ5t4OJsDs7YS7EQ=;
	b=xfHIkVe00ZGqvUReprZLAXpt1veXHSl7ZrIz9phT+fhGa55aGYirQndxJq1kSWeccaCQ
	 gJMgEzm3UxhS9uGLjf+d0wmApRCE76xf5YFQrE/VXQGaxSfm61jgUU/9mvNfSDn4vIOpD
	 wWTlc54+WA8FtG3SvHTkqs9eHdMtobAylrmJBdnDRar6mYp9BMZE+wNKD6kNZ72h7DMj7
	 2NFtOziZshC32jZakLIi5yYETp9QG1qAt+XaptBAGIQ/1rNafaK4ouPkCm6c0E9LiSIXw
	 RTtC7jQohUR+1mDlabkn43kCihf/v6EPGd42qpHYxL7QeJTG6PUpvWYb5inh1ggHCkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QOzMZnPV;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F9606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QOzMZnPV
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso992226a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794583652; x=1795188452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kb6BNBHWUZprPI1vwsmUapLJRh7sJ5t4OJsDs7YS7EQ=;
        b=QOzMZnPVto8tgdXcMbvPKEhrJUGqQbsXRc7uAdZ+tx0cvxcmT1cuJCd7iVsAodAN7I
         wUP69KTYU+WcrQycjo4OiMGFAuNNTJA2ACmhz5FVbOCdhl2ItdvYbZENmxS5Mknz6QN7
         odB0LC/3drK4ReNgAwDGidlLv2C6q+cwi37HFigDF9fjRtSXoDNERz+bsyr/9xIJcxRj
         rnZ8QstDHWA5+HsG4otQIoWpOqrlEU3VAcnWut8co2Nck7L2+2FcqvEkRdr75vcHJu8l
         3hLKnVYqkoVzTx1cZsFlbprplA+5GfW+1Y/6vkiq6QEtS7vwptF3PvAGEfgSSjckntMI
         IGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583652; x=1795188452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb6BNBHWUZprPI1vwsmUapLJRh7sJ5t4OJsDs7YS7EQ=;
        b=MZEppmS2AnT7FzrPMOqSfczpsgUzPfUFUsQgRE8gpoKFC6kejVw25SCiaDR9xATTMF
         XtqLNZSaVVrQs9HOBgRGfuGnmdLhr+k2C34tlZ1/AB7cdXY0knT4IfyndaB/Yw4Ck0K9
         ItWwNd9UtSyBe6aj4CL5GbOiLoCOvlX6zm2JjlRlHq8gcKBUZdIFtCfcljxjiWSoTo3Q
         Hl3JrDXniXT9igj0uoTp7uRuNXU3hX8WHwRTJbofTq7Gx6AgGUuHCTO40/I4P0dLK19e
         lHVKHJcKeYRrtO7Gu9HEsPGJRZNrjmgoCtm7CTiFH5JNnrWjeV+P/LZPvtKO3KP97XeI
         QN5w==
X-Forwarded-Encrypted: i=1; AL+hErHvb6yc0AaCYwJzWeEFhB1gcrJJ2LhPH94NRJ29D4PdtoMLVKDoq/d8iabaqAasChKXCL25PPoM7+Oo36k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dWZ+iyyAzdkrw/NtjJFGViWBVdhjg4Ga9UNWJV9/wNCinUtzV
	KjDP9OJqyKXZbxKXg7nrTVvB9An2XSzhYCKq4ltYoJNvA5kEolLSQV1OojDCvhXsFpqj0FQDIYQ
	L5PB6VYFqDBiJ3Xjx6w1K6A==
X-Received: from edgd14.prod.google.com ([2002:a05:6402:a50e:b0:6b5:7fe9:bce9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1511:b0:6b4:be3f:51b3 with SMTP id 4fb4d7f45d1cf-6b7c0958100mr1868438a12.12.1794583652187;
 Fri, 13 Nov 2026 07:27:32 -0800 (PST)
Date: Fri, 13 Nov 2026 15:27:10 +0000
In-Reply-To: <20261113152729.837429-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113152729.837429-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113152729.837429-2-vdonnefort@google.com>
Subject: [PATCH v1 1/4] ring-buffer: Skip remote reader page swap when on tail
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bgrzesik@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the reader page is also the tail, swap should not be permitted or
it would insert the tail behind the head, breaking the integrity of the
ring buffer. While __rb_get_reader_page() does correctly prevent this
situation, the simple_ring_buffer implementation misses it.

Once the reader catches up with the tail, make
simple_ring_buffer_swap_reader_page() return 0. The remote reader now
can expect an unchanged reader. When it is the case, there's nothing
more to read.

Also, when the simple_ring_buffer writer moves the tail to a new page,
it resets the new tail counters and more specifically page::commit. As
moving the tail unblocks page swap, order the page reset before the
tail_page update. This ensures the reader can't swap the reader page
with the new tail and observe a stale commit value.

Cc: stable@vger.kernel.org
Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Fixes: 34e5b958bdad ("tracing: Introduce simple_ring_buffer")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c        |  3 ++-
 kernel/trace/simple_ring_buffer.c | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..3c7aa982d43e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5848,7 +5848,8 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
 	new_reader = cpu_buffer->subbuf_ids[cpu_buffer->meta_page->reader.id];
 
-	WARN_ON_ONCE(prev_reader == new_reader);
+	if (prev_reader == new_reader)
+		return NULL;
 
 	prev_head = new_reader;  /* New reader was also the previous head */
 	new_head = prev_head;
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index abfaf9bee12e..d5c84af01925 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -139,6 +139,13 @@ int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)
 
 	reader = cpu_buffer->reader_page;
 
+	/*
+	 * The reader is already the tail page. See simple_rb_move_tail() for
+	 * memory ordering.
+	 */
+	if (reader == smp_load_acquire(&cpu_buffer->tail_page))
+		return 0;
+
 	do {
 		/* Run after the writer to find the head */
 		ret = simple_rb_find_head(cpu_buffer);
@@ -196,7 +203,13 @@ static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *
 	}
 
 	simple_bpage_reset(new_tail);
-	cpu_buffer->tail_page = new_tail;
+
+	/*
+	 * Setting a new tail may unblock the swap in
+	 * simple_ring_buffer_swap_reader_page(). Ensure the reader observes the
+	 * page::commit reset.
+	 */
+	smp_store_release(&cpu_buffer->tail_page, new_tail);
 
 	simple_rb_meta_inc(cpu_buffer->meta->pages_touched, 1);
 
-- 
2.56.0.611.g1030f0b940-goog

