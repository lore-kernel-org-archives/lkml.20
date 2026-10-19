Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443021;
	b=tskMbWl10Z1e8i3s072tMMUuouWCxQ3+SksVF39QRsUpv+1cBNGp0OIpWen1U6twBC+V
	 gIGVQai260P/LIsaR3cWPeYVn5YZPby5Q0vLtX4oJjM07YqF8uxdifrCpGtZdWNHFGBnB
	 n/8YehJEPJBU5m++WfqAQNy9Zm9u/XkbqNQ971O276RUXI8CxUNFdaLMTKDf8rzAeDCTz
	 HO+bsz8mWJUuiXJ7t5hULsRwvlDjSn1/dZphRvKsoRaMQXzdKPa3CZ1PU20Rp9KvHey1p
	 3WCeI03Kpg9wJFsfTyNZu4WktEEYMa1vgpMh545YSJ0Uge2sXtNNy9qlDJdNCDfT+WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
	b=vLsJgg3fG57cUrKeQtFj10k55LPNcwcjJWRnr680Z3/LnevgYCrUUNyZWl63QKe87v0k
	 +5aQT9QO8H5v0ionzNaM2CKhcsPqcirMuTqgsUmLHORkad6FN5nh7iR9F2aoP6R3Ym0Vt
	 agv5Vk1qoe7wJ4mnNY2UzdY7ewEiwfadVMQVNyCBpDQ7czPNyx7vsNNMEquIgvFAZpm70
	 OMfFT/GySWbAUQz7Z4iWX2tn8zOoPFHuLXomea8MLwovjyAG0lWJ8wL9iiE4nd/+A5dcQ
	 lAxLEUDGHVCn3zJVg2+n8ouYyFD65wgJfBVylGGsUlSmJ90OJ2DlmFhnuSPth4vreSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D2qI8ybo;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4E606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC4E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D2qI8ybo
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so790922b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443019; x=1793047819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
        b=D2qI8ybojJaYnKrA4OFIxtEcVB3pWIt4dCIyUVr5sblRAQ3c+gyI+n5e7cCuoQOmMV
         5Qt1xJdb5+ZCjFNyXmSf7Fkv86rA32zHk14hov8mZmlQCFz5G3Bs1KKis8+/VxXJDOFf
         gLJnRytXa7VjK62P6U2/LHUd/RQ+bwomWsygAN4ZDXrCi9fFB9Guni6NaBiTVjk2Hyzq
         F2rmoW4E7u4OflDaVKvfuTCTKky8ZMs8naDLs23J11TysPlGDtHa98qy8u6QltP2qU37
         H/0bSTkAIHfpSZnj1tmERaUr0jNO5Xg+4o7cdXvRFUAAFbtWQimySJferJVJnEyzTcZA
         Pi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443019; x=1793047819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
        b=qQf1CLD5Re9AawIhtEVLjXjw8uQ5wZVcwW+bs1VcomAT0NqZTkU11Mm49OMTY+tSaR
         m5j0Klq0uPzo8RChKxp+1W7zzstWMCV0QRqJKqHlv0O45l5t8vR+vgNzmJB20MAS1L/a
         G9fKkFCvjcGE4rrB31VlunVD8YYoUfyrDVrDkMgSBUv/yW4fFHPW51kGp/N5Ku5bLSNj
         3WNQpT7xaGflrID2Zu0YkN7+/6eE1qELXRxNrEKI+Ayo/oeQt9OGk4eZGoeJ0nPmbQC9
         9b8qsgWnQCflH+ueM/ww/RXTUjqJVkpZE8GbcDnsTO0XmDn6eIwmzkyeXG3M4aEo10jr
         f5sg==
X-Forwarded-Encrypted: i=1; AKwUvBwHodN7ADTsfXwx6q2ANShAxpmwICoR41XCq6AQ6Q1iGe6zHkGG3P2hFauVRkc1LjZNEl6tDMTSnTPMl0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcz4dRRLk+MvSBv8SyLEubJtCCryFobQqob9KXpsjMW+gaLmws
	HgDh/j+PNopFNEF7jmheYjt3Leinhf1DI7P/t9lAGXr2DVYL9dvo/LYhdHRpdNE0go0=
X-Gm-Gg: AYBFou0L9hlzFYB8SeB/KYETFF2JVK4xNFyWdkzl36/u2W+MM7khXMjGhOvujHgtzAz
	6kB2I8pSlfmU51pS25SAmqdv0eK6EmP7ybtuH9iSFCJ5E/UlPABX1zEiI8a5YEfz4H592pOoZ1g
	uECLzH0vxewQXesP9KgyglcdatP+LCni/dv73g/3gilNvDoF71bizXDyj52zwDUQavjz2yDAoSf
	MIsR9WF5IBR1dHDI98nbGG8oJq+qbGxXbeIg5eoKlAJMHtHeNOeQU9lW4H9hoLRDvsEP0m66290
	d+7R4yEAhY4iwjYYYqQ149lGhXjgsoKDKgMmCTgbwaAnNN9s36r9TeRGVpcTL7wQB4IguoFSdkv
	nEwmLJhtVF2Tu4Mp11rp7I4P8UFhBASQIXOXohNA2KaMvy7YVxT22FDBIjSL42krGg4Ph7A+3S5
	0uKdjg5dRIE+vu7LrCM9egQKJbc2CBWbdeM54Q8dA76uaGJBOs1NhxlfPWYvg64bLHq6AK+CfNk
	FsPrBGK/nn8PTH2uFAC84ZpOLVXqMivzEVJo+UdHIZgbeytbMgph/E=
X-Received: by 2002:a05:6808:181b:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-53cd120291bmr6982795b6e.43.1792443019392;
        Mon, 19 Oct 2026 13:50:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388f6ed365sm8270131b6e.16.2026.10.19.13.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 13:50:18 -0700 (PDT)
Message-ID: <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
Date: Mon, 19 Oct 2026 14:50:16 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
To: Wei Gao <wegao@suse.com>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018070154.16944-1-wegao@suse.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261018070154.16944-1-wegao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 1:01 AM, Wei Gao wrote:
> Fix:
> Make io_queue_deferred() return a bool indicating whether any drain
> request was active or deferred. In __io_submit_flush_completions(), track
> whether any completing request had REQ_F_IO_DRAIN. Clear
> IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
> (has_drain), no drain was active or deferred (!drain_dispatched), and
> ctx->defer_list is empty. This prevents premature clearance if an
> unrelated completion flushes while a drain request is still executing
> in io-wq.

Didn't quite feel right to me, below is with some LLM assistance
to try and get to the bottom of it.

Thanks for digging into this. I don't think it's just a race with a
slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
every time, even if the drain request is freed in time.een read.

Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
enough:

- A drain request marked REQ_F_REISSUE counts as has_drain, but
  io_free_batch_list() punts it back to io-wq in that same flush. With
  an empty defer list, we clear DRAIN_ACTIVE while the drain is still
  pending.

- A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
  has run gets completed via io_req_defer_failed() right away. If that
  happens while an earlier drain is still running in io-wq, we end the
  drain, and the next request is issued before the earlier drain
  completes.

It also only works if the drain request completes through the flush.
Without DEFER_TASKRUN, io-wq posts the CQE directly from
io_req_complete_post(), so the application can see the CQE and submit
before anything clears the flag.

A drain request dispatched from the defer list always runs alone, so
we can just remember which one it is and end the drain when its CQE is
flushed, and have io-wq complete drain requests via task_work so that
happens under ->uring_lock. Something like the below. Can you give it
a spin with your reproducer?

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 7c5d99a8f75d..2e5a786f2a2a 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -524,6 +524,8 @@ struct io_ring_ctx {
 	atomic_t			poll_wq_rcu_pending;
 	struct list_head		defer_list;
 	unsigned			nr_drained;
+	/* drain request dispatched from ->defer_list, until it completes */
+	struct io_kiocb			*drain_req;
 
 	/* protected by ->completion_lock */
 	unsigned			nr_req_allocated;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index e6569c204917..8ffe0c9a4e29 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -480,6 +480,9 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 	lockdep_assert_held(&ctx->uring_lock);
 	__io_req_caches_free(ctx);
+	/* nothing outside of ->defer_list is alive */
+	if (ctx->nr_req_allocated == ctx->nr_drained)
+		ctx->drain_req = NULL;
 
 	while (!list_empty(&ctx->defer_list)) {
 		struct io_defer_entry *de = list_first_entry(&ctx->defer_list,
@@ -491,6 +494,9 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 		list_del_init(&de->list);
 		ctx->nr_drained -= io_linked_nr(de->req);
+		/* it runs alone, track its completion unless it's a link */
+		if ((de->req->flags & REQ_F_IO_DRAIN) && !de->req->link)
+			ctx->drain_req = de->req;
 		io_req_task_queue(de->req);
 		kfree(de);
 		first = false;
@@ -980,9 +986,11 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 
 	/*
 	 * Handle special CQ sync cases via task_work. DEFER_TASKRUN requires
-	 * the submitter task context, IOPOLL protects with uring_lock.
+	 * the submitter task context, IOPOLL protects with uring_lock. A drain
+	 * request ends the drain under uring_lock as its CQE is posted.
 	 */
-	if ((ctx->int_flags & IO_RING_F_LOCKLESS_CQ) || (req->flags & REQ_F_REISSUE)) {
+	if ((ctx->int_flags & IO_RING_F_LOCKLESS_CQ) ||
+	    (req->flags & (REQ_F_REISSUE | REQ_F_IO_DRAIN))) {
 defer_complete:
 		req->io_task_work.func = io_req_task_complete;
 		io_req_task_work_add(req);
@@ -1185,11 +1193,33 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 	} while (node);
 }
 
+/*
+ * The dispatched drain request ran alone, and anything submitted after it was
+ * deferred. Once it completed, new requests may run if nothing is waiting.
+ */
+static __cold bool io_drain_req_completed(struct io_ring_ctx *ctx)
+{
+	struct io_wq_work_node *node;
+
+	__wq_list_for_each(node, &ctx->submit_state.compl_reqs) {
+		struct io_kiocb *req = container_of(node, struct io_kiocb,
+					    comp_list);
+
+		/* a requeued request hasn't completed */
+		if (req == ctx->drain_req && !(req->flags & REQ_F_REISSUE)) {
+			ctx->drain_req = NULL;
+			return true;
+		}
+	}
+	return false;
+}
+
 void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	__must_hold(&ctx->uring_lock)
 {
 	struct io_submit_state *state = &ctx->submit_state;
 	struct io_wq_work_node *node;
+	bool drain_done = false;
 
 	/*
 	 * Drop the files before the CQEs are posted, so they're released by
@@ -1224,13 +1254,19 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	}
 	__io_cq_unlock_post(ctx);
 
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE) && ctx->drain_req)
+		drain_done = io_drain_req_completed(ctx);
+
 	if (!wq_list_empty(&state->compl_reqs)) {
 		io_free_batch_list(ctx, state->compl_reqs.first);
 		INIT_WQ_LIST(&state->compl_reqs);
 	}
 
-	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)) {
 		io_queue_deferred(ctx);
+		if (drain_done && list_empty(&ctx->defer_list))
+			ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
+	}
 
 	ctx->submit_state.cq_flush = false;
 }

-- 
Jens Axboe
