Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905449;
	b=humKKg2fLWMBXuWTsByAmOrX1f7m8Pe6PbzRodf8qv8LNez+iOYL/H1LF6INJV6uTrqm
	 Liikl+ZEbSp9CWfRgbLWpi+MgkQXSTVlD810CbAFjhrSofOsfGImSt9WlVLhgwTtCjofZ
	 e0AJyLu1UdXXZW1OmRwJ6vlWUCIIql3p8hLJ6IdE079oaUTpD2DaIblinovY2UOYV9whE
	 l0fDrLvF5an/A2w+w4/syKgzdaNR/faASU0/bW2M6UBUTqgQrP4FNgSl6JP+E2+mKMObt
	 3Bs8Mfus3OiBUMTiav//lsM7Nc1RN5CBV9HIsw5KTVoPepo6+yUy5uSSFCMmK66iCWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
	b=COOX/4mXU5O9zFCsDY+K1Lm19OM7dNhsBjHD4vlzd5Shvvl7fvDxonpPfqghSEAkQJBL
	 n4QbzE7cf/PQagNOHgamUwVwPqbZOkJYTmmoXTJ/EhbyBsUOShf0rfKW4Q61H62y3rCEP
	 090ZSG7LjXZTm2Rzz47jwAyCVb2WkyMwRtEoucZCa6caysUXS5ovSUedqmO0hOp9OtJm2
	 5Ou5LSJkxGWYCay4wLlpWNKpQ54a9PnimJOYyoY+ggoGoKZdtFadUoeRH4kV1ysYD94Bh
	 XBp5HCaRRlPwl4sordDO+8mbrOxicUz3TrygI+kse25/IsafmmqNolNXXCR73qusnJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtVHR++P;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D876F606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D876F606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtVHR++P
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2313441a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905447; x=1795510247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
        b=CtVHR++PiF/zKaqArhbp8D7yfYXz4VNoBlKeIx/chEyYFfhFm4Fk6J+YjXLURHhDx6
         qMq1kNKCNk36QA+JnUde9AfnHUAmh+hIFf7wxeCCPb/x41aXYKNkvOSrpj15y0kegMhG
         UL3fzxhlWsPNmcYSRZmdiOrqqdwqdLYx9QjptcIfgivFDktJwaA/bfQQ9WXUs4PNWovl
         Ek2ELjFHpYZEdvb0lMjLQce71NwmRVAIx7BFd39/DQ2+mHRe9VJ9aaWHjxvYACU+/TFG
         RFPKvk+tj07JbXAC3FLUHwJkeoV8ruqq//B8DSv2JNcoWFPizZww7jKc1kIjGOkXhasm
         oa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905447; x=1795510247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
        b=QkhNitlRxMCdA3jjA3Jv7bcPMbM/EknNJP+8XTkVqFnHEpEXe6KA4HguR79KZOH3Yp
         WnEl9ryCLU4EEL+ZBwAiM/Fjwj5gx2730FITIjsTgxvb4zFu6y4oPBWRAsMj3k1POkVL
         FCyln1mMmYx3m+hKRY6PfDuFNt3alns7p+Zgk8iTtgqyDPqdISkS74XJn/7KCYtLEAaM
         kcN9lYR71W8a/DAwRFn9Xi/tgZH35DZogcBDv3soOmXWdp099VHHxKvaSwKFAEEJfLCW
         SdWTZ35ZMujuPnXKvHAxKpX43Co54RTHkOHkcqOUWu0XGbo7kRDXeq6N25UFDIKyRkQR
         ONiw==
X-Forwarded-Encrypted: i=1; AL+hErFL8tYXytYO2oq6a8tlXzeegPee/zEyrxrjmOslIr1t0PCOs3AL8sP5jsPt3ioUZ1jjPUPLFukmvHL3728=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D6/joW4UlNdZzCCnlXLC2XLwSr4SsYUXVoCHwucaWsxvnDYa7
	pIHp22er7vYJkoRpAi2zM7FT6cGDXyZFiRiA6X8P2A6xcMIi5U4saGly
X-Gm-Gg: AZFdTZeB4fzGfiPWI415zIvvq+EHHh6Iu3cZPOXUxZnX2r4Jlnpu3bYm13G+q03O1PS
	N/iMwCRjomanwOSbH6XU/+C/IMiR+svJt1ZrPP+ctZl2hHWTd6d0lhTd6tAckvcKhsAWWr46yLa
	hmFCIrD2LiD00ZJEe61c6sHa2lGjuT8LXpo5HmSfscxJrQpzRLCaErMv3cV/Vn/0r5klDBVmx0r
	L8z2fpsaZCSDYQgV3AM14a7quRcobFS00VOzsaNyIi6Da7b06xfyR25TojLY+I4cIYPrA7d5xwX
	SYBs1jzY3o1RUaRQe2Sc6EAmlSuLriII+KDbU4jN+61j6IFhCu9iBIezLC93PGWv60FU/iQjilI
	CcZl79Dpf9q9E03axHJBCWxYkGQiJZ1tAo1GP/1O9lVTdtfGr8IXv+moH2qd1LXZSaq9j6JdoGT
	zcAgX1EJ4qYmnM/iN7cQD8+USVEh7lsbr7LpGTwrOPd1eX+w/kgMhjPnAvXqc8Eqo6cPoJ/Ud+c
	BuuMMAqjKYK76N4gmb1hcoG1x3im/gJVSsRQVOxuNsWXsvkUIjoJ15Toleh1nakYywxKTgU8eCa
	ueEext96MFPLCdik8VbAmXFgVARl9LjRNMksXJLqo9wZ+ACmtCjzNdPKMDpRXUsuW808XxDqUpq
	o
X-Received: by 2002:a17:90b:2b4b:b0:3b3:c18f:d8e3 with SMTP id 98e67ed59e1d1-3b3c18fd9f7mr117575a91.20.1794905446882;
        Tue, 17 Nov 2026 00:50:46 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3006240a91.5.2026.11.17.00.50.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 00:50:46 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] io_uring: clear IO_RING_F_DRAIN_ACTIVE when all drains have finished
Date: Tue, 17 Nov 2026 16:50:33 +0800
Message-ID: <20261117085033.98363-3-zhiqizhangg@gmail.com>
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

io_queue_deferred() only sets ctx->drain_req for standalone drain
requests, leaving ctx->drain_req NULL when a linked drain request is
dispatched. If a non-drain request is waiting in ->defer_list behind
the linked drain:

  1. P0 in flight
  2. Linked drain [D0 (IOSQE_IO_DRAIN | IOSQE_IO_LINK), D1] queued
  3. Non-drain P1 (e.g. POLL_ADD) queued to ->defer_list
  4. P0 completes, [D0, D1] is dispatched with ctx->drain_req == NULL
  5. [D0, D1] completes and frees; drain_done stays false
  6. io_queue_deferred() pops P1 (non-drain) and empties ->defer_list

Because drain_done is false, __io_submit_flush_completions() leaves
IO_RING_F_DRAIN_ACTIVE set permanently after all drain requests have
finished. Any subsequent non-drain submission (e.g. a WRITE or cancel
targeting P1) is forced through io_drain_req() and deadlocks behind P1.
The same happens for a standalone io-wq drain request if its CQE is
flushed while P1 stays deferred awaiting the worker's final reference
drop, because ctx->drain_req is already cleared before the later flush
that frees the request and starts P1.

When io_queue_deferred() observes ctx->nr_req_allocated ==
ctx->nr_drained before dequeuing (nothing outside ->defer_list is
alive), all prior drains have completed and been freed. If the loop
drains ->defer_list without starting another REQ_F_IO_DRAIN request,
clear IO_RING_F_DRAIN_ACTIVE. That also subsumes the !drain clearing in
io_drain_req().

Fixes: ecb6817b769f ("io_uring: end the drain when the drain request completes")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 io_uring/io_uring.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 4e8b93a584b4..1fb2b9bb601f 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -498,11 +498,13 @@ unsigned io_linked_nr(struct io_kiocb *req)
 static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 {
 	bool drain_seen = false, first = true, drain_queued = false;
+	bool nothing_alive;
 
 	lockdep_assert_held(&ctx->uring_lock);
 	__io_req_caches_free(ctx);
 	/* nothing outside of ->defer_list is alive */
-	if (ctx->nr_req_allocated == ctx->nr_drained)
+	nothing_alive = ctx->nr_req_allocated == ctx->nr_drained;
+	if (nothing_alive)
 		ctx->drain_req = NULL;
 
 	while (!list_empty(&ctx->defer_list)) {
@@ -525,6 +527,9 @@ static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 		kfree(de);
 		first = false;
 	}
+
+	if (nothing_alive && !drain_queued)
+		ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 	return drain_queued;
 }
 
@@ -1473,7 +1478,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_defer_entry *de;
 	bool drain_next = false;
-	bool drain;
 
 	de = kmalloc_obj(*de, GFP_KERNEL_ACCOUNT);
 	if (!de) {
@@ -1506,7 +1510,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	if (unlikely(drain_next))
 		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
 	req->flags |= REQ_F_FORCE_ASYNC;
-	drain = req->flags & REQ_F_IO_DRAIN;
 
 	io_prep_async_link(req);
 	trace_io_uring_defer(req);
@@ -1515,8 +1518,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	ctx->nr_drained += io_linked_nr(req);
 	list_add_tail(&de->list, &ctx->defer_list);
 	io_queue_deferred(ctx);
-	if (!drain && list_empty(&ctx->defer_list))
-		ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 }
 
 #define REQ_ISSUE_SLOW_FLAGS	(REQ_F_CREDS | REQ_F_ARM_LTIMEOUT)
-- 
2.43.0

