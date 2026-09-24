Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C503AE6F5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231730; cv=none; b=fbe0fTX/0ir6FzDSldVp6eRVzRNdu4dLRUW0QqxyQ0gK+syESBrjsNoltCjpKVtCYFx3oTzYrDgf2J4CBT6Ynzvap7oaNUYYa5+cRq7V90IrrDAcUS0S9cBevyhQYu8pe+YVoGh2k/+mQSF8Nji2RqwT1/0W0UJISnI4zif7muo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231730; c=relaxed/simple;
	bh=GoE6o8P/d0Va/Z0LlIUQKz5h1yWkYNQVcuM2L4eXEIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3bHO9g8PsE5FEhEED/PCt1B+1xPH40fUaB01XfpukT2M9MiXlDZHiaSCOfO+PadW0PEAVQGi/Vw2DdqfjrRMyHlF0aI+8h+TChS2TorK3A+989gEVU3Ko2EQUxOI6hvj8WQCnWD7LlTKCfJPVJVDlfBRnZ//++Q996Xju95bOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEgo2/yv; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEgo2/yv"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso686493a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231728; x=1790836528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KB3JUcp+hPnUpMcJXhgcWxJ6rdRHTjTvXdKQKWbtEA=;
        b=UEgo2/yvjFd9M6whhXNTGY3N2B/S++bCqtrkMwxri+rL/bx3EwqFQNJnn7EenKcxSz
         UTuxQLNaU5FXyI1XJ8ILY1DMYYb1Z6qKh81kS6jjFtAz0G54m8QQVX9peVTf0dmB701K
         SWaLNQC12TurlSfImdpg3ORtFBefUQVSskxHK4ig92KGFjwErohkWVQ3TvxU8RS+zN5J
         Nxm69kEgTpOEWPCovFdAfo+7/EFZ6ELxtpsK4VsvsdEboDwunqxbM73kyZTViNiLXLmR
         7v3O2KkfmMlpgNbLtYX9j/9vsOsLrNo1nUu1hz9G8Mg2y1JeCn88l5Rp79gag6PRAJGv
         Mpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231728; x=1790836528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KB3JUcp+hPnUpMcJXhgcWxJ6rdRHTjTvXdKQKWbtEA=;
        b=Zq1q415aOzboyfh272xZ+vu1Rgt+knhG+pm9wIOYrioYfiKbnSlDq/pM15ywK2gaZz
         zfoZXWG8M1YsgQEBY/We/8/BBWxaXVd4QGK5u1kF+s/f5syqjNFMXfO/mIPMYjO5d1Yp
         IxnK1vbpOBZ/qFaynygfFsH3SJWZxsKb9KLUDq/OFp3GoQuc3j7yxdoS5evcv7yIAgQr
         vLO1C3ebmp7vAVoK/Ar49/ZK3V15eMXkcjTYW3Y9zCG7jk20lDrKmL5XhXnRjgk3Tslc
         PHEMSUyVJ3tFzT4byoQSxHR3oYGiYFHlBdtsjmcxp0dt+hbtXzns0epP6sDK9LU6QG2n
         2hDA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3Wyq3xd+8Xb5hJiZEmox6UxcO10X+WUXdqxLLx+9akJbhDa9JmFtFmOBMM0jvES+Ybp9862JWE7XUdo=@vger.kernel.org
X-Gm-Message-State: AFuF++nTJCtNMU8qtFuDDQ5VCj75TDgNyqZTLXGX+W8qHZRvCImv9DvH
	OVo+cscX8i7b/5o0lK7NQBnRjxLN9ieg86m4T96tSELCCzKw2oGWHigDt3a6utLM
X-Gm-Gg: AYBFou1ZQWAYGGD1mwRt8nYzi84n3zHVLXLmIa9nIa7BFpKRSv3lk40Zv3tsekq5FLm
	UzAkB+TrCsB8CVLK75SL0AldvPnlTxEaoTQn22DLdYoJoM7LzsvZMQWtKAhr3Gmn5dpGNeFE+B1
	YwMjx5CP1PIesAHxQgxD5yUwjzVRs+8GJm1vxFu3XqRSVQ72LQqedFffnS1fXrFBhaVqau1s7/Y
	FmkfhnPIPVWkEtbZuKg1Drv5DQBAh5HZ6ONa00cXIsMRNAIOngYlqGi1w9nJOjBGiPCB24Sg9RD
	YCGoO1DiFsuV6JwWxg9BlJ0devPSW6o9gKWZdFeWaaE0C0y0ueCGu44qpos/eJgm2KpfUp9d069
	KEL6vGKNGs17syBnS8bSmFiFcDOn0PNOcSbcvy8PCJppUJv7P76JR3NZJ1pamIYmYx3gX3RsGBr
	GTQ7oisF7A1iginpU2gbaQJO6vrT9VR5NCyRSYOt+OymjiAjJ2ZRg/i72F6ERA9VyziUM2Zs5KX
	4zLIJyqsWJAuSBerT4ucCoTb9G9+FcIjuSjtxVtrmUudI3nAix1YUOkeDgE/w7OI2KSKUF0eZIK
	4JUXu5/+Fw==
X-Received: by 2002:a17:90b:4c0f:b0:39e:3dad:684f with SMTP id 98e67ed59e1d1-3a09860fe27mr933896a91.4.1790231728114;
        Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm3109897a91.0.2026.09.23.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 2/2] io_uring: require 3 free CQ slots for 32b CQE in io_fill_nop_cqe()
Date: Thu, 24 Sep 2026 06:35:25 +0000
Message-ID: <20260924063525.2500081-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924063525.2500081-1-benquike@gmail.com>
References: <20260919203516.2581409-1-benquike@gmail.com>
 <20260924063525.2500081-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When io_cqe_cache_refill() is called for a 32-byte CQE at the last slot
of an IORING_SETUP_CQE_MIXED ring (off + 1 == ctx->cq_entries),
io_fill_nop_cqe() writes an IORING_CQE_F_SKIP CQE at the last slot and
increments cached_cq_tail, consuming 1 free slot, after which the 32-byte
CQE itself requires 2 more contiguous free slots at index 0.

Currently, io_fill_nop_cqe() only checks io_cqring_queued(ctx) <
ctx->cq_entries (free >= 1). When free is 1 or 2, io_fill_nop_cqe()
succeeds and increments cached_cq_tail for the skip CQE, and then
io_cqe_cache_refill() computes len = min(free, ctx->cq_entries - off) < 2
and returns false because len < (cqe32 + 1). This leaves an orphan skip
CQE in the ring with cached_cq_tail already incremented while the 32-byte
CQE is deferred to cq_overflow_list.

Require at least 3 free slots (io_cqring_queued(ctx) + 3 <=
ctx->cq_entries) in io_fill_nop_cqe() before emitting the skip CQE.

Tested in QEMU against Linux 7.3.0-rc3 on a 4-entry IORING_SETUP_CQE_MIXED
ring with 2 queued CQEs (head = 1, tail = 3, free = 2, off = 3) followed
by a 32-byte NOP (IORING_NOP_CQE32): on the unfixed kernel cq_tail
advances to 4 due to the orphan skip CQE while the 32-byte CQE overflows,
whereas with the fix applied cq_tail remains at 3 and both slots remain
consistent.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 2/2 as requested by Jens Axboe.

 io_uring/io_uring.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ae7c77158c58..b430301fead9 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -698,7 +698,12 @@ static unsigned int io_cqring_queued(struct io_ring_ctx *ctx)
  */
 static bool io_fill_nop_cqe(struct io_ring_ctx *ctx, unsigned int off)
 {
-	if (io_cqring_queued(ctx) < ctx->cq_entries) {
+	/*
+	 * Creating a skip CQE and posting a 32b CQE requires 3 free CQ slots
+	 * in total (1 for the skip CQE at the end of the ring and 2 for the
+	 * 32b CQE at the start of the ring).
+	 */
+	if (io_cqring_queued(ctx) + 3 <= ctx->cq_entries) {
 		struct io_uring_cqe *cqe = &ctx->rings->cqes[off];
 
 		cqe->user_data = 0;
-- 
2.55.0.1082.g2b9226bbc0-goog
