Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905443;
	b=ZB0wUHKApMNXLXDx0bF9dACiMcDg3w/Nva4UUBiT3ugbfS0PyuQRr+Zr6uRtG+8+SaEz
	 v4UnhBNs++5t43ZD5XRthk+tYppj+ZS6KjH6v27jYnbihR+8rXJmyBnXgUoK6bBy6bAMC
	 rkBTPjjk2PcDbM+7EZOMB/ewpCUI/vzZokT0hL6T30x0lFj7hJ4loUfNBN80WZTlxzhCx
	 02R5Mk9FU1AqCW8VQMaJ4OjJekzuxpFTgbQ9k39Nc0xtT9gY/pIWRpVTqStL5xLwWhDqe
	 6ZzRnBjh+LaMcH7IhQmwmtKheHTDo9vn7ze1dtNGbGIXyylyPNCcWCxni01TliU+viA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
	b=YgsLmketFuady6qUi6AYkknb1IQgIIk3+dgbST3hChNouTvJRtXftb3NWBuSebhWBFAZ
	 ++uA0BUxyAyUT1EaR2ey9eh8Gb0cPxgOV2Im2kNyMljQa+NkuDxzjSN3uFZTYwV4bjaCm
	 zsF27uzwDi2nQ0SWKNeQUIukCcjj9Ic30t2QAjz5i3mEEOzsGsXwLX104YhHu1pmPf22R
	 8IxPsWByQwqbUDpZCOBoY2XrtCKga7ETgDwrLQVm+b8DYobq6A06oKYac4isz+eV44lNh
	 9ZQP0JxRhiAtzDW3MM64b+WHf8ZIY6LxxW6CNs0Uhxt1NngKeX0jdFANzMpWHMlqkgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO5O9DeC;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA54606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA54606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO5O9DeC
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso2243175a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905442; x=1795510242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
        b=gO5O9DeCgd3HRuujgGdklYqnNTZWm54iRYZFen9tHeY8fw6CKfSGi96zr4Tyfyim1G
         ie9PLHQsc8JysuACVG+ot57kHX5W4W5PLnB3H73cV2YGjPCGPE5KZIvexKQSnR/DeLMo
         92bo7MzEW+bxsSiUzd7MP/C9GczoQv+Xf7LyVWWys7Qdc3RXgheM3WVJXQkivsAVALoz
         hBa9f7XoHOwr5ygSARcqN5YOVXmLZbOBs6ieJTIx2+8mohasemGWy5zMEODFLAYbzebO
         tEM6Rx+zXyhHzUBjr1i7iLvYNUP+8AagCzQUxGlwcLUrTemVe7qUnIRg/fj6f+V9r1rp
         fVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905442; x=1795510242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
        b=bUizncvXgQfV8V4V7ajmjQCPj/xL+O1YcjlxPTIJE6RJ/gRPLxTpUKgfmB2VP/el6v
         RnS44b8DCmgOWm16MegCTXHz+TUxMUeyHYEik6QUdlIkJlF+pCk34D20HX1bxxNMX4J+
         8IxgYssUG0cJ/dXf7KRNlK2lyC+y3YfanFIUQmDPkckUhoJdIZlnfwt9pWYNDL2dHGNt
         s7CMH/K4qUj2owD1u0uTpffwRw17Xh72LqIJfgdsXn4DOCdow/sT5vUYqFbMeQzgFacw
         mujqXxzsKNlvMt2iC/Kor9JKT8DC7UFhdqAvG5knFl+V4MzGgW+DkI5T1xp6zjjdVqsk
         qNkA==
X-Forwarded-Encrypted: i=1; AL+hErEoZkDJbRSXCN5e8XEd5OdLOQetC12e4qJGuAZTAHF6rMuHuGFy/OC5bV25A5W8EZCxK40r/zBkCIDVSAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/asTZifNlFJiV0p1syI/O4gnh1uD6WxBwP7ECUAoI+qR/kMw7h
	Sj7/hUvPgv1y41AKvn1ltYcPpCOTBLuQUiM3WqxXxagzPk1DszDr4N6vUBJbNxKM
X-Gm-Gg: AZFdTZe1ZslMSdVQIfQgIBUGyyEjTZDtO6k674sW0jhZpKJ3kxh6KERYlmuTnMPXTA4
	algYrkyRhRWi5LKDu/UKMBGnOYycyY/7lDyOWwn0Vgj+GFzMZubfGP6Ni3SqYYZmUaIP+b19lZv
	Khe/nv4iSw7it+zyTRALD47PIKWnb/0LIbSEvlYU1v+Kptghkv1S2PeBEF55q8ky9DVvPqHSC4l
	MfIu56ivWRKlFrLr+z+Ra25xm3t3yen0BxWy1kLg60cszijYiRHF2ymmp5Pc2Y9/7w/GRFhTyKk
	FqaMZAbq4BWCkDmd/leUroHO6zi0cCmiZYdiLLIOpntXf/kw8b0mzn917sG6tfEwo/AEUv5jPQw
	aF3zVCpD4154K94D5h7W1vXj7u0tziZTf2VS0b8fKa7aOt3xVAyRtkQ7psXyKyp0acSXgbXWr4g
	5YObGObkasOrU2Vp5vUhP3fg2sQ3oWH683mkJok9gw7c6nIUwGFv6y2ynUJ0eWMp4kg3nrCT+c3
	OafCjfTM+PqUwxOu0cV0/GGd7bKLzeTxt8PQpTvuODlsli+eAnkCB1ZPmGhPQHT5x7khyAA5N4N
	x7GeHPHQpfeF02fZGESzRliOfTDm11j20iYnjXxElOtcdtX7iMSDepRYWyyZ23qip3m3gnQmd7H
	w
X-Received: by 2002:a17:90b:2e8d:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b3c00e56d4mr241802a91.42.1794905442058;
        Tue, 17 Nov 2026 00:50:42 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3006240a91.5.2026.11.17.00.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 00:50:40 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] io_uring: avoid activating drain for failed requests or links
Date: Tue, 17 Nov 2026 16:50:32 +0800
Message-ID: <20261117085033.98363-2-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117085033.98363-1-zhiqizhangg@gmail.com>
References: <20261117085033.98363-1-zhiqizhangg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_init_req() currently calls io_init_drain() and consumes
IO_RING_F_DRAIN_NEXT before request initialization and BPF filter
checks have completed. If io_init_req(), io_uring_run_bpf_filters(),
or a later request in the same link fails, io_submit_fail_init()
completes the request or link via io_req_defer_failed(), bypassing
io_drain_req().

This can leave IO_RING_F_DRAIN_ACTIVE or IO_RING_F_DRAIN_NEXT set on
the ring with no deferred drain request and ctx->drain_req == NULL:

  1. P0 (e.g. POLL_ADD) is in flight
  2. Invalid IOSQE_IO_DRAIN SQE sets IO_RING_F_DRAIN_ACTIVE, then fails
     with -EINVAL and frees immediately
  3. Subsequent non-drain SQE sees IO_RING_F_DRAIN_ACTIVE, is forced
     through io_drain_req(), and blocks in ->defer_list behind P0

Similarly, a failed link containing an IOSQE_IO_DRAIN SQE leaks
IO_RING_F_DRAIN_ACTIVE and IO_RING_F_DRAIN_NEXT onto the next
unrelated request, or an -ENOMEM failure allocating io_defer_entry in
io_drain_req() fails the request with IO_RING_F_DRAIN_ACTIVE still set.

Do not touch IO_RING_F_DRAIN_ACTIVE or IO_RING_F_DRAIN_NEXT in
io_init_req(). During link assembly, only propagate REQ_F_IO_DRAIN to
a non-failing link head, and move drain flag activation into
io_drain_req() after struct io_defer_entry allocation succeeds. Also
clear state->link.head before flushing an unterminated link in
io_submit_state_end().

Fixes: 8fb7aee05591 ("io_uring: drain based on allocates reqs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 io_uring/io_uring.c | 100 +++++++++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 43 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..4e8b93a584b4 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1471,8 +1471,9 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	__must_hold(&ctx->uring_lock)
 {
 	struct io_ring_ctx *ctx = req->ctx;
-	bool drain = req->flags & IOSQE_IO_DRAIN;
 	struct io_defer_entry *de;
+	bool drain_next = false;
+	bool drain;
 
 	de = kmalloc_obj(*de, GFP_KERNEL_ACCOUNT);
 	if (!de) {
@@ -1480,6 +1481,33 @@ static __cold void io_drain_req(struct io_kiocb *req)
 		return;
 	}
 
+	/*
+	 * If a request in the middle or end of a link needs draining, drain
+	 * the link head (propagated at link assembly) and the next request/link
+	 * after the current link.
+	 */
+	if (unlikely(req->link)) {
+		struct io_kiocb *cur;
+
+		io_for_each_link(cur, req->link) {
+			if (cur->flags & REQ_F_IO_DRAIN) {
+				drain_next = true;
+				break;
+			}
+		}
+	}
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_NEXT)) {
+		ctx->int_flags &= ~IO_RING_F_DRAIN_NEXT;
+		ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
+		req->flags |= REQ_F_IO_DRAIN;
+	}
+	if (unlikely(req->flags & REQ_F_IO_DRAIN))
+		ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
+	if (unlikely(drain_next))
+		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	drain = req->flags & REQ_F_IO_DRAIN;
+
 	io_prep_async_link(req);
 	trace_io_uring_defer(req);
 	de->req = req;
@@ -1801,6 +1829,13 @@ static inline void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
 		io_queue_async(req, issue_flags, ret);
 }
 
+static inline bool io_drain_needed(const struct io_ring_ctx *ctx,
+				   const struct io_kiocb *req)
+{
+	return (ctx->int_flags & (IO_RING_F_DRAIN_ACTIVE | IO_RING_F_DRAIN_NEXT)) ||
+	       (req->flags & REQ_F_IO_DRAIN);
+}
+
 static void io_queue_sqe_fallback(struct io_kiocb *req)
 	__must_hold(&req->ctx->uring_lock)
 {
@@ -1815,7 +1850,7 @@ static void io_queue_sqe_fallback(struct io_kiocb *req)
 	} else {
 		/* can't fail with IO_URING_F_INLINE */
 		io_req_sqe_copy(req, IO_URING_F_INLINE);
-		if (unlikely(req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
+		if (unlikely(io_drain_needed(req->ctx, req)))
 			io_drain_req(req);
 		else
 			io_queue_iowq(req);
@@ -1847,24 +1882,6 @@ static inline bool io_check_restriction(struct io_ring_ctx *ctx,
 	return true;
 }
 
-static void io_init_drain(struct io_ring_ctx *ctx)
-{
-	struct io_kiocb *head = ctx->submit_state.link.head;
-
-	ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
-	if (head) {
-		/*
-		 * If we need to drain a request in the middle of a link, drain
-		 * the head request and the next request/link after the current
-		 * link. Considering sequential execution of links,
-		 * REQ_F_IO_DRAIN will be maintained for every request of our
-		 * link.
-		 */
-		head->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
-		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
-	}
-}
-
 static __cold int io_init_fail_req(struct io_kiocb *req, int err)
 {
 	/* ensure per-opcode data is cleared if we fail before prep */
@@ -1937,25 +1954,13 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		}
 		if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
 			ctx->int_flags |= IO_RING_F_DRAIN_DISABLED;
-		if (sqe_flags & IOSQE_IO_DRAIN) {
-			if (ctx->int_flags & IO_RING_F_DRAIN_DISABLED)
-				return io_init_fail_req(req, -EOPNOTSUPP);
-			io_init_drain(ctx);
-		}
-	}
-	if (unlikely(ctx->int_flags & (IO_RING_F_OP_RESTRICTED | IO_RING_F_DRAIN_ACTIVE | IO_RING_F_DRAIN_NEXT))) {
-		if (!io_check_restriction(ctx, req, sqe_flags))
-			return io_init_fail_req(req, -EACCES);
-		/* knock it to the slow queue path, will be drained there */
-		if (ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
-			req->flags |= REQ_F_FORCE_ASYNC;
-		/* if there is no link, we're at "next" request and need to drain */
-		if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_NEXT) && !ctx->submit_state.link.head) {
-			ctx->int_flags &= ~IO_RING_F_DRAIN_NEXT;
-			ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
-			req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
-		}
+		if ((sqe_flags & IOSQE_IO_DRAIN) &&
+		    (ctx->int_flags & IO_RING_F_DRAIN_DISABLED))
+			return io_init_fail_req(req, -EOPNOTSUPP);
 	}
+	if (unlikely(ctx->int_flags & IO_RING_F_OP_RESTRICTED) &&
+	    !io_check_restriction(ctx, req, sqe_flags))
+		return io_init_fail_req(req, -EACCES);
 
 	if (!def->ioprio && sqe->ioprio)
 		return io_init_fail_req(req, -EINVAL);
@@ -2065,17 +2070,22 @@ static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		io_req_sqe_copy(req, IO_URING_F_INLINE);
 		link->last->link = req;
 		link->last = req;
+		if (unlikely((req->flags & REQ_F_IO_DRAIN) &&
+			     !(link->head->flags & REQ_F_FAIL)))
+			link->head->flags |= REQ_F_IO_DRAIN;
 
 		if (req->flags & IO_REQ_LINK_FLAGS)
 			return 0;
 		/* last request of the link, flush it */
 		req = link->head;
 		link->head = NULL;
-		if (req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL))
+		if ((req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL)) ||
+		    io_drain_needed(ctx, req))
 			goto fallback;
 
-	} else if (unlikely(req->flags & (IO_REQ_LINK_FLAGS |
-					  REQ_F_FORCE_ASYNC | REQ_F_FAIL))) {
+	} else if (unlikely((req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC |
+					   REQ_F_FAIL)) ||
+			    io_drain_needed(ctx, req))) {
 		if (req->flags & IO_REQ_LINK_FLAGS) {
 			link->head = req;
 			link->last = req;
@@ -2097,8 +2107,12 @@ static void io_submit_state_end(struct io_ring_ctx *ctx)
 {
 	struct io_submit_state *state = &ctx->submit_state;
 
-	if (unlikely(state->link.head))
-		io_queue_sqe_fallback(state->link.head);
+	if (unlikely(state->link.head)) {
+		struct io_kiocb *head = state->link.head;
+
+		state->link.head = NULL;
+		io_queue_sqe_fallback(head);
+	}
 	/* flush only after queuing links as they can generate completions */
 	io_submit_flush_completions(ctx);
 	if (state->plug_started)

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.43.0

