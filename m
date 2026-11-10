Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316828;
	b=ce+GDB+GEviTIeRzGwZMKmRck05ae1wnp7xc7YZIg2i0XDfz3cQTru08ufCv4doM+vFV
	 vlgUQb1KvmsdWViYh3dBSJx8jAmXwAOgX+HkXIxxCcxnqehZY8qp5AZsvvYvvv6f+Gr02
	 hM7Wf3v+rcTLRdeBzhaFsF2pcortDo5JhM1VbO4af07E56wFw6zi8/VLNYDY39ITZ9vpf
	 ubUiDOQLrilLK+LQHISmzpJnFl63W5s8YgCHQS1fQ/dMwMwP6VVVzeySWVvhBef06FXtT
	 0sCrLE+qxI3mUEOY66a0xn0Oz13WNM0JHTXr4w9/NroJSjwPva+ixLcds5gw1Tdrfpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316828;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
	b=iL8DztscZ0+5WeCQyycPCkV5u2TpMsqkuZJP+Ab0u1W3CDhyNBvYhEdiLNiKFFyTlXIn
	 SBlITZhYOPaGTA761sGlH8Gh/MwOq44GCLBekImOLRNCnCzTiOzAqTZGemZRtVZF18gOM
	 /83B2WwZIysZxApkg6sne0qYUcALzcIye5mpjLVzyVXPshJDIMmZaUtvqw7m9xVTUn4TY
	 o5+g7SIqhFd/8TjATZzSBIjLYkFiAO6l18k8X2QsEK9HYdIo0IGwLthF2iKpXCps97FNw
	 tnYNQiX2CQCeiogk6cYjJyLW2a0aI1MCk6MySX2JavfukomV5SsTzjIa6teTJhtn40Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hh6L3gkO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hUMLiVhB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB16076800
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EB16076800
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hh6L3gkO;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hUMLiVhB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
	b=Hh6L3gkOReoFbhs5zs0CTGhzR7/VIdf6BBFiibBlRWHq97nRnIXN4IFiTNrgDLXBfVgLya
	3hB5REsQLdWY7hTdBZHYq5r1Z6/I3Vs0Blug6HIsC8w3lRHyJQPiyEElYxmCP72tZ3w4V2
	Q3j6Mcdtx60jJkjOBbOOymANTMX6qyM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-YP3C3nU9NXqv5Q8rjXOuGg-1; Tue, 10 Nov 2026 08:20:26 -0500
X-MC-Unique: YP3C3nU9NXqv5Q8rjXOuGg-1
X-Mimecast-MFC-AGG-ID: YP3C3nU9NXqv5Q8rjXOuGg_1794316825
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c505ee610feso13094566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316825; x=1794921625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
        b=hUMLiVhB3b5felEGYP7ZkbJVKx0PY/bkp9rLFsBttkA/1svEW9RMoxcwcCKtPo5Ce+
         ViRj8EatoIkNF/SGH/N9b3+dU50yutnldBAIgqS/sy5/cRMI6jy28J5/mQ8D5fQtTZDq
         0JeJtS3U9jja5w0/fJtkyLlq3c8M2vzWCFYzJje3BALD/hUbcRpT5MHmBJfTg5WVRqeM
         UceObruuEzGQUnRtwYma40rbdkHEZdward9SYs3UqPm8X7sD3etehy0Fj/lcBk4+qqQu
         3BjYbqD76VecfbAcB9yGB9ciwPTmMCeJOEWMMRopch6LnP6OtGLXlPhNekgTSobFlIOV
         hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316825; x=1794921625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
        b=p9xY03bIriecc9pucMdu2B0ETEqz9dj8dPZ0jjRDCrirtmKdYkMLJiBOmh6NKQKkEp
         3d0Pb7/psuqsr1NQvb4uh5Fb9FkcVZCS4jhAyaOfeSSrUzK1Eek7sZjGR1Wu3YN/b2fQ
         Z5E8BMjgkZY1jnUD9z9/D7iqBCuSxUsV/nrPAdmto0Nplk8S9t5dCJrCDaGNsJ1OuD9j
         O5dzXDLMabDGvVawVow4nYpnkAgqgjDK2S2lonJrE1csIvbXueSfZ2bPE2+V0ItX58qY
         bibRDrNFdp5Tq1zTe039gZSLqeQB4eQa0mPlwIzY9p9tEwFOhiH+Z2bzRxlUfW8Xgcsm
         s4jg==
X-Forwarded-Encrypted: i=1; AL+hErFhnEgxIdpQVnf3iVwxLNynEFWybWNOeFfueDDe34f8GnruD2axhYt0WjfO4ng61OimW9/zEdR7vtDyZeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YRHjqF3TnL+F24eBRFCbu2oK+HSYma/hxX1dD/5k76rLbo8ra
	mK7S4huGUj9SPsm5GqnFNxTXrMZuwuyFo5tutsCSPSvZrDv+ceFXPRqXGuoH0ZkigbdaSmUEO5s
	0L7JoMPAGYTYGD0wzewEDtnPq52gX2HQmG2Cr5jQQZ88kGzfoWupzI0QuTrwubO3Uuw==
X-Gm-Gg: AYBFou3VmIZ5oqIBRQ674fODbXy/atdRzy5tyEgR4S8rjh+yd2emIIAjZO5+YJaP9z7
	X6415l2mWxHOJYtyHKLdKcvyagxIqXffGkhvxC4iBKntXGE/LYPZmk/HSyxgCDTiJfOQzQWOQyA
	HAYTC65zqwryOjSkSI67BsUDcr64NyglKI5rt5+GqNMI71RrLZjyC0F20X0rrBo+SG6C8FPQb1d
	58VZGFhdeLtdjby32XGKRhgqQ8E395c0vvsiqitPyNQhzb3uC65m5PfBULe7Lrfjp7QdppHcYmc
	ixfXlPj4wpHe7IgJ00XUthLP1T2WrdQLbg9BHkvrji+yPcNlnQyClc1zbgVXvJdwmwxFgekvuEY
	oRWxu+v+ZQHaRQL/+zlgjNa8JwRdXg6fsgBwgP06PZxvKge84TYtWklaiczXVcAEr+hU5gT0Uzd
	epWqhjx+vu3hFnA3GfhJVnrWl8gNk4WV8S/yFH/phZZUVq8kknurk+8XSM32qb6d9qbkxzLmsgi
	3am8N5sj5m49jVkPScoYdAltiaMRO8QVAj1dwsEJ0MwNU5JtYN9
X-Received: by 2002:a17:907:96ab:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c505a93483fmr107229666b.3.1794316824611;
        Tue, 10 Nov 2026 05:20:24 -0800 (PST)
X-Received: by 2002:a17:907:96ab:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c505a93483fmr107225166b.3.1794316824074;
        Tue, 10 Nov 2026 05:20:24 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:22 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	io-uring@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 10/12] io_uring/opaque: add IORING_OPAQUE_CREATE
Date: Tue, 10 Nov 2026 13:20:04 +0000
Message-Id: <20261110132006.3280986-11-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110132006.3280986-1-amarkuze@redhat.com>
References: <20261110132006.3280986-1-amarkuze@redhat.com>
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

Allow an application to populate an immutable object from its own memory,
for example to retain a generated reply for repeated sends. Add CREATE
to IORING_OP_OPAQUE_OBJ; its objects support the same reads, sends and
FREE as received objects.

sqe->addr3 points to the source and len supplies 1 to INT_MAX bytes;
addr and off must be zero. Preparation rejects malformed fields, sizes
beyond the store's object or capture limits, and inaccessible or
overflowing source ranges. Source memory remains valid through execution.

Issue reserves an object slot and page-rounded backing charge, then
copies synchronously under the ring lock. It uses the compaction page
allocator, preferring compound allocations and falling back to smaller
orders. Each allocation owns an extent and part of the reservation.
Copying proceeds by base page and yields between destination allocations.
CREATE fails immediately on budget exhaustion rather than waiting.

Success returns the length, handle and forwarding-only flag; OBJECT_STAT
marks the dense version as compacted. STAT counts the copied bytes. On
failure no handle is published, and cleanup releases the slot, backing
and unused reservation. A large CREATE holds the ring lock through the
copy and can delay other requests of that ring. There is no per-store
pending-request limit.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 io_uring/opaque.c | 129 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/io_uring/opaque.c b/io_uring/opaque.c
index 4610e212a800..78ae19a6ad82 100644
--- a/io_uring/opaque.c
+++ b/io_uring/opaque.c
@@ -1884,7 +1884,6 @@ int io_opaque_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    READ_ONCE(sqe->buf_index) || READ_ONCE(sqe->__pad2[0]) ||
 	    cmd > IORING_OPAQUE_AVAILABLE ||
 	    cmd == IORING_OPAQUE_COMPACT || cmd == IORING_OPAQUE_SET_POLICY ||
-	    cmd == IORING_OPAQUE_CREATE ||
 	    (req->flags & (REQ_F_CQE_SKIP | REQ_F_FIXED_FILE)))
 		return -EINVAL;
 	op = io_opaque_req_alloc(req, store);
@@ -1899,6 +1898,21 @@ int io_opaque_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	op->offset = READ_ONCE(sqe->off);
 	op->length = READ_ONCE(sqe->len);
 	op->addr = u64_to_user_ptr(READ_ONCE(sqe->addr3));
+	if (cmd == IORING_OPAQUE_CREATE) {
+		u64 pointer = READ_ONCE(sqe->addr3);
+
+		if (op->handle || op->offset || !op->length ||
+		    op->length > INT_MAX || !pointer)
+			return -EINVAL;
+		if (op->length > store->config.max_object_size ||
+		    ALIGN((u64)op->length, PAGE_SIZE) > io_opaque_rx_limit(store))
+			return -EMSGSIZE;
+		if (check_add_overflow(pointer, (u64)op->length, &end) ||
+		    pointer > ULONG_MAX || end > ULONG_MAX ||
+		    !access_ok(op->addr, op->length))
+			return -EFAULT;
+		return 0;
+	}
 	if (check_add_overflow(op->offset, (u64)op->length, &end))
 		return -EOVERFLOW;
 	if (cmd <= IORING_OPAQUE_READ_OBJECT || cmd == IORING_OPAQUE_AVAILABLE) {
@@ -2046,12 +2060,110 @@ static int io_opaque_stat(struct io_opaque_req *op)
 	return io_opaque_stat_copy(op, &stat, sizeof(stat));
 }
 
+/* Construction is synchronous under the ring lock, like READ_OBJECT copies. */
+static int io_opaque_create_build(struct io_opaque_req *op)
+{
+	struct io_opaque_store *store = op->store;
+	struct mem_cgroup *old = set_active_memcg(store->memcg);
+	u64 done = 0;
+	int ret = 0;
+
+	while (done < op->length) {
+		u64 pages_left = DIV_ROUND_UP_ULL(op->length - done, PAGE_SIZE);
+		struct io_opaque_extent *extent;
+		unsigned int order;
+		struct page *page;
+		u32 chunk, written = 0;
+
+		page = io_opaque_dest_page(store, pages_left, &order);
+		if (!page) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		chunk = min_t(u64, op->length - done, PAGE_SIZE << order);
+		extent = io_opaque_extent_new(store, page, 0, chunk, done, true);
+		if (IS_ERR(extent)) {
+			put_page(page);
+			ret = PTR_ERR(extent);
+			goto out;
+		}
+		op->create_reserved -= page_size(page);
+		extent->backing->copied = true;
+		list_add_tail(&extent->list, &op->data->extents);
+		while (written < chunk) {
+			u32 bytes = min_t(u32, chunk - written, PAGE_SIZE);
+			unsigned long left;
+			void *mapped;
+
+			mapped = kmap_local_page(page + (written >> PAGE_SHIFT));
+			left = copy_from_user(mapped, op->addr + done + written, bytes);
+			kunmap_local(mapped);
+			atomic64_add(bytes - left, &store->copied);
+			if (left) {
+				ret = -EFAULT;
+				goto out;
+			}
+			written += bytes;
+		}
+		done += chunk;
+		op->data->length = done;
+		cond_resched();
+	}
+	ret = io_opaque_vector(op->data);
+	if (!ret)
+		op->data->dense = true;
+out:
+	set_active_memcg(old);
+	return ret;
+}
+
+static int io_opaque_create(struct io_opaque_req *op, unsigned int issue_flags)
+{
+	struct io_ring_ctx *ctx = op->req->ctx;
+	u64 charge = ALIGN((u64)op->length, PAGE_SIZE);
+	u64 object_flags = 0;
+	struct mem_cgroup *old;
+	int ret;
+
+	io_ring_submit_lock(ctx, issue_flags);
+	if (READ_ONCE(op->store->dead)) {
+		ret = -ESHUTDOWN;
+		goto unlock;
+	}
+	old = set_active_memcg(op->store->memcg);
+	op->data = io_opaque_data_alloc();
+	set_active_memcg(old);
+	if (!op->data) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	ret = io_opaque_slot_reserve(op);
+	if (ret)
+		goto unlock;
+	if (!io_opaque_charge(op->store, charge, true)) {
+		ret = -ENOBUFS;
+		goto unlock;
+	}
+	op->create_reserved = charge;
+	ret = io_opaque_create_build(op);
+	if (!ret)
+		ret = io_opaque_publish(op, &object_flags);
+unlock:
+	io_req_set_res32(op->req, ret, 0, ret >= 0 ? op->handle : 0, object_flags);
+	if (ret < 0)
+		req_set_fail(op->req);
+	io_ring_submit_unlock(ctx, issue_flags);
+	return IOU_COMPLETE;
+}
+
 int io_opaque_issue(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_opaque_req *op = req->async_data;
 	struct io_opaque_store *store = op->store;
 	int ret;
 
+	if (op->op == IORING_OPAQUE_CREATE)
+		return io_opaque_create(op, issue_flags);
 	io_ring_submit_lock(req->ctx, issue_flags);
 	/* Pair with the cancellation search before any opaque wait enrollment. */
 	if (io_wq_cancel_seen(req, issue_flags)) {
@@ -2224,6 +2336,16 @@ bool io_opaque_cancel_all(struct io_ring_ctx *ctx, struct io_uring_task *tctx,
 	return found;
 }
 
+static void io_opaque_create_release(struct io_opaque_req *op)
+{
+	io_opaque_data_put(op->store, op->data);
+	op->data = NULL;
+	if (op->create_reserved) {
+		io_opaque_uncharge(op->store, op->create_reserved);
+		op->create_reserved = 0;
+	}
+}
+
 void io_opaque_cleanup(struct io_kiocb *req)
 {
 	struct io_opaque_req *op = req->async_data;
@@ -2287,7 +2409,10 @@ void io_opaque_cleanup(struct io_kiocb *req)
 	}
 	if (unlikely(op->vec))
 		io_opaque_vec_cleanup(op);
-	io_opaque_data_put(store, op->data);
+	if (op->op == IORING_OPAQUE_CREATE)
+		io_opaque_create_release(op);
+	else
+		io_opaque_data_put(store, op->data);
 	io_opaque_stream_put(op->stream);
 	lockdep_assert_held(&req->ctx->uring_lock);
 	io_opaque_req_free(req->ctx, op);
-- 
2.34.1

