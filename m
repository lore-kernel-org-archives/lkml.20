Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740242;
	b=qqG01vDdL4LGY+QDTuBf8PK02cI/uluYycGeXJDNOvkVUoKLg+Sg4iVKeCwHXrCVP0Hw
	 ocHdsVPrg/xxL9Qgmqy4C1DPMlvB0Pp/XramA6HRRfIJCw5bMC8XwPOhB0pT+rFlZB8uX
	 H+zwNurwmb4ScGbDLpqTUBVEq1imkf9V2c9wkG31Z0ekxQXNDRYwJ5UYmzmB/WUBp6abv
	 d81TvIzGBhVvlclOsExKZjEJ0lJZxZIUqWVTfnCxzEaKgQQQv8zH70Qlq8wCyeDt/TigE
	 CpZzzgLkKsLOuWOs8Q4g2UvLFGrnYmcsjmQd6wsSC0O5JzNPD/dJ/uiB+HacwJ2PGeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
	b=ue23b0g//mM28k/l4UcflupesuW1Us6NE6P3DShmrRcV6auxUbPCuhflxkyvGXhMXAY1
	 mMSw/XapPzRnD9a1tr3z7YbzYUEL4n2+kQKHT4xmVLQ0JW6+Qh3qUHaqhOpdzYgFgPWpl
	 Qdn8hm7VRR+HjTf1jvU9p/81mAqMzC+iFrMr9o/lQ7fJBzFdNr/MZYrR5ia6klEJ9/9hy
	 ARh55bYajVMLINc1xFWoYoIhy72rO6f/Ms4fOzltGhQ0GK3soNr/sBIRmdWWVCIRBUoAU
	 fPt5TAJOZLT+6Osjsu1w6HtM6rUuhzzuRAs7JypjttiGjEzD93S3nHy92vWsd4CtHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ounw8mkg;
	arc=none smtp.remote-ip=209.85.208.99
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com [209.85.208.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99064606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99064606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ounw8mkg
Received: by mail-ed1-f99.google.com with SMTP id 4fb4d7f45d1cf-6b547eacb53so197556a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740239; x=1794345039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
        b=Ounw8mkgFtf6+zH3alwTPHKUO/74YIZJGseoLYrfw6gV0XbXrarH92plKAN0HRJi57
         FIiPfPlivLg2rswJSEMcZWe04RaKEFJ2q99S+ZQ7nPtbIDLndpQx4C9I9xX9Om5q8JzM
         6UsO9ceubdM+4oSDTpkzTpAiJJ+Ustuhcphw+b0JD9q/rJaNRMaEAvLKN4b3uXMbTptz
         gJ7ImwXkMD+ofePSQnB7DJzp5ZFjh9mTxbCwuKDmFH0/jESXuDE/rSLBoK7v/uiiGS3D
         jh62QVkYoTh5IWjCqk3bvJB+nsPRI4AKpV3G9ub3tFU4PRQ63YKvWu09iNqHCvYbh8yA
         gPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740239; x=1794345039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
        b=vIMYdyG1o9lM6defn3dddEqu3G9w8nItuXBaSvasKGpHlqyV1eozjnL7JzDQ+DVOlX
         fRkd+3ddstZvBYg1ju0mnB5YHepoitBvYtwsN997JTMWJnTb114WuvPqDJMhYejXqtMP
         vbtvLRutkaKQinYxehG+qwpt1xzoYmNroJMbDFnzPMAd44hFxC5M+dwnuwdczWB6FzJo
         jtK0oGitB8oZAa7HATOpp+FaCL/I+d1sllspWtwFWH2hdsjQEVggA8lp8ou6YTqwvkRs
         i9caN/Cm949co9dCwE5IYD2QKge+pnpZV+mNRbtl0ndnlJZf+GZ143Q3FW2W9NtQiudT
         o4Nw==
X-Forwarded-Encrypted: i=1; AKwUvByFE+114iPtD/swDNDv63Blf44XO28Dm3O4UCD7i5nMU4W0W8seNnTvcoOOOfpsWlB7LLkeqQfTEWWbhkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z987pCqEXJ5PitUZVEmC/PIze7Kg2AdcWdouVfqXNn1WEd2w4/3
	hIFNAAVFsknhi5fmUfPmdj0Cydd9WSTD2Kv0O+U8aQnSvhBNlGnpti59yo6rwUcvYkH/RHOhSxP
	BIAKlOcs+oEfp5gYiIdkzl7r0GOxWc2ePdNTJ63jkhdDngfSq7BDe
X-Gm-Gg: AYBFou3g4nhlFlEr8ZX1RDqDBSJHTvxBwG4S4xmGoX08e20ekfGvOC6tq0aN7S4NQJc
	nGxJRhQbQQEuIPosK5NSbTH80sCv0E8s2gyW2oHjmk/XkCC9OyWwNhNZmMDdz90GCM3Uzp+zact
	xvIf/piXypBq4JEpDsW+LlRE1z/0xgzP/IT+Rb9LG534SbNUdyQkFwfQVP1MafDlQUzdOPhclli
	Q5paw4xs0LoLxX9Rm0JfWw+nRqTaTwMvmzJ+MV60QGX7TDwP+jVI1M3eO1d2HZtOdWtklKR/7Vn
	g8VXk5MZNx92OfJIfzLdxde3wPmKMa0ABGZcwBHlTVpnu/o2T68eunrWjsPv621Pmv7XKc4jn0m
	GUmkesaR1Oi96fNuo
X-Received: by 2002:a05:6402:c4cd:10b0:6b1:b5b8:b695 with SMTP id 4fb4d7f45d1cf-6b4d32859c0mr11809190a12.0.1793740238934;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b55ac1beefsm12173a12.4.2026.11.03.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 90CCB4041F;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8DC1DE40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/4] io_uring: split io_uring_alloc_async_data()
Date: Tue,  3 Nov 2026 14:10:28 -0700
Message-ID: <20261103211031.592745-2-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

io_uring_alloc_async_data() accepts an optional struct io_alloc_cache *
argument to use for the allocation in place of kmalloc(). All callers
either always pass NULL or a non-NULL io_alloc_cache. However, the
compiler still emits a NULL check for callers passing a non-NULL
io_alloc_cache. Split out a separate io_uring_alloc_cached_async_data()
for the non-NULL io_alloc_cache cache. This avoids the NULL check at the
cost of duplicating the code to set REQ_F_ASYNC_DATA.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/io_uring.h  | 23 ++++++++++++++---------
 io_uring/net.c       |  6 +++---
 io_uring/rw.c        |  2 +-
 io_uring/timeout.c   |  2 +-
 io_uring/uring_cmd.c |  2 +-
 io_uring/waitid.c    |  2 +-
 6 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 32247529076c..a36a177559f4 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -335,21 +335,26 @@ static inline ssize_t io_fixup_restart_res(ssize_t ret)
 	default:
 		return ret;
 	}
 }
 
-static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
-					      struct io_kiocb *req)
+static inline void *
+io_uring_alloc_cached_async_data(struct io_alloc_cache *cache,
+				 struct io_kiocb *req)
 {
-	if (cache) {
-		req->async_data = io_cache_alloc(cache, GFP_KERNEL);
-	} else {
-		const struct io_issue_def *def = &io_issue_defs[req->opcode];
+	req->async_data = io_cache_alloc(cache, GFP_KERNEL);
+	if (req->async_data)
+		req->flags |= REQ_F_ASYNC_DATA;
+	return req->async_data;
+}
 
-		WARN_ON_ONCE(!def->async_size);
-		req->async_data = kmalloc(def->async_size, GFP_KERNEL);
-	}
+static inline void *io_uring_alloc_async_data(struct io_kiocb *req)
+{
+	const struct io_issue_def *def = &io_issue_defs[req->opcode];
+
+	WARN_ON_ONCE(!def->async_size);
+	req->async_data = kmalloc(def->async_size, GFP_KERNEL);
 	if (req->async_data)
 		req->flags |= REQ_F_ASYNC_DATA;
 	return req->async_data;
 }
 
diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335627..e5f7c13519fb 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -187,11 +187,11 @@ static void io_netmsg_recycle(struct io_kiocb *req, unsigned int issue_flags)
 static struct io_async_msghdr *io_msg_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_msghdr *hdr;
 
-	hdr = io_uring_alloc_async_data(&ctx->netmsg_cache, req);
+	hdr = io_uring_alloc_cached_async_data(&ctx->netmsg_cache, req);
 	if (!hdr)
 		return NULL;
 
 	/* If the async data was cached, we might have an iov cached inside. */
 	if (hdr->vec.iovec)
@@ -1846,11 +1846,11 @@ int io_connect_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	conn->addr = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	conn->addr_len =  READ_ONCE(sqe->addr2);
 	conn->in_progress = conn->seen_econnaborted = false;
 
-	addr = io_uring_alloc_async_data(NULL, req);
+	addr = io_uring_alloc_async_data(req);
 	if (unlikely(!addr))
 		return -ENOMEM;
 
 	return move_addr_to_kernel(conn->addr, conn->addr_len, addr);
 }
@@ -1944,11 +1944,11 @@ int io_bind_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 
 	uaddr = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	bind->addr_len =  READ_ONCE(sqe->addr2);
 
-	addr = io_uring_alloc_async_data(NULL, req);
+	addr = io_uring_alloc_async_data(req);
 	if (unlikely(!addr))
 		return -ENOMEM;
 	ret = move_addr_to_kernel(uaddr, bind->addr_len, addr);
 	if (unlikely(ret))
 		return ret;
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 61bd0641dd77..4a9538157d94 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -191,11 +191,11 @@ static void io_req_rw_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 static int io_rw_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_rw *rw;
 
-	rw = io_uring_alloc_async_data(&ctx->rw_cache, req);
+	rw = io_uring_alloc_cached_async_data(&ctx->rw_cache, req);
 	if (!rw)
 		return -ENOMEM;
 	if (rw->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	rw->bytes_done = 0;
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa7b0d9a81d6..fa54846ed4ce 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -638,11 +638,11 @@ static int __io_timeout_prep(struct io_kiocb *req,
 	if ((flags & IORING_TIMEOUT_MULTISHOT) && off > 0)
 		timeout->repeats = off;
 
 	if (WARN_ON_ONCE(req_has_async_data(req)))
 		return -EFAULT;
-	data = io_uring_alloc_async_data(NULL, req);
+	data = io_uring_alloc_async_data(req);
 	if (!data)
 		return -ENOMEM;
 	data->req = req;
 	data->flags = flags;
 
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index b5486b56ee0c..6f417bda52ea 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -188,11 +188,11 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    !!(req->flags & REQ_F_BUFFER_SELECT))
 		return -EINVAL;
 
 	ioucmd->cmd_op = READ_ONCE(sqe->cmd_op);
 
-	ac = io_uring_alloc_async_data(&req->ctx->cmd_cache, req);
+	ac = io_uring_alloc_cached_async_data(&req->ctx->cmd_cache, req);
 	if (!ac)
 		return -ENOMEM;
 	if (ac->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	ioucmd->sqe = sqe;
diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 986fb46639e8..0d3c248f375c 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -292,11 +292,11 @@ int io_waitid_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	struct io_waitid_async *iwa;
 
 	if (sqe->addr || sqe->buf_index || sqe->addr3 || sqe->waitid_flags)
 		return -EINVAL;
 
-	iwa = io_uring_alloc_async_data(NULL, req);
+	iwa = io_uring_alloc_async_data(req);
 	if (unlikely(!iwa))
 		return -ENOMEM;
 	iwa->req = req;
 
 	iw->which = READ_ONCE(sqe->len);
-- 
2.56.0

