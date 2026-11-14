Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626193;
	b=y/62/RUay7+N+THjwcf7jOKJ9e2kXmO9tufV4efs9p0os5Fy/MEQhKjp09UVQZhPEnJ7
	 T8NybTVyC2APbGQLr5mFFkVExY2qTHSWC3rB1OmRhy7G5GFgQVfLcoA0LshQtzAAR/giU
	 hDTQBlqDEZTcJszzgaGSr/Xjxpq7OfL+aq+4K+y2XIb8NGuaSPElBoEZrKFgG/kd9dHxK
	 XKWee+wTLbXXZQbmXw+bLce9g52Je41AZAau/H2iTb1iSNlgww2nMGs0x4HibyOHTC9S9
	 nc12CUNgIghL5GLiXdR5dUzvgC0HagsmCgRZc0d271sJ0WlLlwAwEozYrUWQpZ7aEeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
	b=SWyz8wT0soyRzW6ZVT6qdnT6LxBFFssMUrc2geYyApTp3jKgmV6tHYasPBsP79bq0wD3
	 YapTpX8VUA3XfS581HkhubQajLM503x/T276zyeCbpPkgyWoxJE+rFEyxY+CSqbViy4P1
	 J7teDykktlc7+gCVaJn4SyjY2aU2XAj1lolcbY7NAz3H1Jve/tW8OWhTkee5Z1TghC416
	 v9L/gg9XqEXdEJXJqsR7v6LTJZ1k5YIt3LA2+0MreEsxaU5Bb8eA3hCHgfJ8wNx0tWgUB
	 jeN3Qvkum4C/Gc704UxpyprGtO5whEBIwxV6uaGJHUK0lXycLlI0iE9JED6kbA9bbHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DyXEYzpK;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8040606A8B1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8040606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DyXEYzpK
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso209442a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626188; x=1795230988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
        b=DyXEYzpKPqKRz5b2woll3HBvFoNtyTGCXekbuWf/DMNmadrLdgr+tdW6n09w+qbZip
         VfJsY9iT/1f/q/s0zILRVwOgqEJ3L8px+oDpCKjfPfnGT2UdfS71qXWT/jK7H9VouVgB
         0jr8nxe1yXsBz2+9hpShLiUXBCJefZogxgurAByIn/D+jBqAI/W1zU2hl9MjcWKcBSsS
         UOm1pMvILHI3Z5FrvjYz2VkyGZYk9OeNQqFIsE1QV4Yu2OLQnyHaULUTxnncXBvXOvA6
         YjVi/NZzIdbWbA1HcHtpelHya8uzxl5EEaO+LH82LIx/moKrjEcC3Jf5+vv4cMADBWpE
         nrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626188; x=1795230988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
        b=Jj8o4oMAuBGyA5+Jc8Qv8KmeMdNH/xrlC9UiQRSsrMaW0QldOaO7HJC7C5vomyL0mg
         Sa4/cG5NKGvcsQxGWqhWHYnVKSIAT3mJ/1kR0yPekCtmI4RqrWVz/ZZDXk5LGtkWfr+W
         +ENsj8daUJ4mxgYiHTmhJzUC8B1bSmszhpRy7trlPQ9lRebnCUV3Cstpb8QmERuALg6A
         bWxh1Ro2C1MK4WMkiXB2S90o4lKokH3ki8WvepFDtmDKy1cNPZHpWbAGgq/nKLdf2oft
         VKlzf2PgMeXXMlcnCxIHj26j9USEYAJvLxyOv6ZvhvgHYaGIbhaj0HQhQQnjl8Y/15hH
         Dr5Q==
X-Forwarded-Encrypted: i=1; AL+hErH2VUOApKLqBMbVKTIr8GpPDcByI1PY65tFBSmMNSmSUYKsP1oKwVWvDiYyEuYn2iDNKL2d7bYgkRowEpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NSJ1iaaPpyJKOZmTC5Cve+kOo0Zn6ttrpP9MorbZ3zRqMk6z1
	zA30xJ1NdhstsLQJtPuJCH3DoSK+I5HQ839qVdZg1p8tXppRVWPiV3ZfdfFQ1J56LNLCbpQCR/t
	w0xiwLdqO/EcsJlecryJtAyWq2AQH88qjcGfsjKoLZjQGvmo9GYkE
X-Gm-Gg: AYBFou01diUvx7k1PUpcuWYR3AqqzVa8A+VqtY95x75OcmquZt3choMlDL1fNL/+/ZZ
	NbaPQHmgTvCGrPCe6nPneCarKqtZM5bu7EswcIwhJGIdkhgg34PJ9sWSZf611WtP5T7vd5t4gE1
	bXe5SAW0ja2ePhfEN6ONwUtx7+pId8lJ+85V5t1L7TlRKtTU40NZl5MjtYl6RTzc/wDPUN0F2cV
	QK7dlFZmEhngvWajkzQPXtZkkG8tjxcQr+xg1n78fRJWdykSWjF90pnkc7bcTq6GJj5q044nRqB
	+sbIZbKA3tFOK+ziKtl9fv+GJBfeX3+U93r10BO6q0wIg5xHsrH4rKwuRPa/QGF/FuTKiq4ihKG
	3MvewGgOxfJJxMeYd
X-Received: by 2002:a17:90b:3d44:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b1b0cb038dmr6416244a91.6.1794626187936;
        Fri, 13 Nov 2026 19:16:27 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24385dcsm2420787a91.0.2026.11.13.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:27 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 1E3AE40159;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 1372AE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/4] io_uring: avoid req->flags store-to-load forwarding failures
Date: Fri, 13 Nov 2026 20:16:17 -0700
Message-ID: <20261114031621.2924144-1-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
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

clang likes to set/clear req->flags bits using the narrowest possible or/and
instructions (e.g. an 8-bit or if all flag bits are in the same byte). This
causes store-to-load forwarding failures on subsequent wider req->flags loads.

For example, clang compiles the req->flags |= REQ_F_ASYNC_DATA in
io_uring_cmd_prep() -> io_uring_alloc_cached_async_data() on x86_64 into an
orb $0x40, 0x4a(%rdi) instruction, since REQ_F_ASYNC_DATA = 0x40 << 16 and
offsetof(struct io_kiocb, flags) = 0x48. The subsequent 64-bit req->flags load
for unlikely(req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC | REQ_F_FAIL))
in io_submit_sqe() is extremely hot because it can't be served from the store
buffer and must wait for the REQ_F_ASYNC_DATA set to hit the L1 cache. On a
thread issuing ublk and NVMe passthrough commands, that one req->flags load
consumes around 1% of all CPU cycles.

Introduce io_req_set_flags() and io_req_clear_flags() helpers to set req->flags
using volatile writes so clang won't emit a store to only part of the field.
The downside of volatile writes is that consecutive req->flags updates must
store to req->flags multiple times. Where possible, convert these updates to
pass multiple flags to io_req_set_flags(), io_req_clear_flags(), or an extra
helper io_req_switch_flags() which can do both. An extra store would still be
much cheaper than a store-to-load forwarding stall.

Alternatively, -mllvm -combiner-reduce-load-op-store-width=false could be used
to disable the clang "optimization". It seemed ugly to refer to such an internal
optimization pass, and I wasn't sure what other impacts this flag might have
(even if restricted to io_uring). But I'm happy to implement that approach if
it's preferred.

Caleb Sander Mateos (4):
  io_uring: return io_req_flags_t from io_slot_flags()
  io_uring: add multishot_flags constant in io_wq_submit_work()
  io_uring: add io_req_{set,clear,switch}_flags()
  io_uring: use io_req_{set,clear,switch}_flags()

 include/linux/io_uring.h | 35 +++++++++++++++++++++++++-----
 io_uring/advise.c        |  4 ++--
 io_uring/cancel.c        |  2 +-
 io_uring/dma-buf.h       |  4 ++--
 io_uring/filetable.h     |  2 +-
 io_uring/fs.c            | 25 +++++++++-------------
 io_uring/futex.c         |  4 ++--
 io_uring/io_uring.c      | 41 +++++++++++++++++------------------
 io_uring/io_uring.h      |  8 +++----
 io_uring/kbuf.c          | 31 +++++++++++++++------------
 io_uring/kbuf.h          |  4 ++--
 io_uring/msg_ring.c      |  4 ++--
 io_uring/net.c           | 46 ++++++++++++++++++++--------------------
 io_uring/nop.c           |  2 +-
 io_uring/openclose.c     |  6 +++---
 io_uring/poll.c          | 20 +++++++++--------
 io_uring/refs.h          |  4 ++--
 io_uring/rsrc.c          | 10 ++++-----
 io_uring/rw.c            | 28 ++++++++++++------------
 io_uring/splice.c        |  4 ++--
 io_uring/statx.c         |  3 +--
 io_uring/sync.c          |  6 +++---
 io_uring/timeout.c       |  8 +++----
 io_uring/truncate.c      |  2 +-
 io_uring/uring_cmd.c     |  8 +++----
 io_uring/xattr.c         |  8 +++----
 26 files changed, 170 insertions(+), 149 deletions(-)


base-commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9
-- 
2.56.1

