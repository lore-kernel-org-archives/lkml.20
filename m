Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336657;
	b=bPPD9yCx/gqwznwCHCt1I0DSdraNAmhQCeZlcSUEH88DDwdcpjm/mJNwd5Oj5CNv5woz
	 hxzuP6uk/udFJloFTlG2BNLx2rJJle9NJyxcC9iF7YNa7wfQWeSYbMLS7/wCZJ8JN5gS6
	 CXAL68BJfoXrm7NeYPURLNPGQ7arQz0avnwBBFzEQm1e+XH50jN/4qsff/K0UIHYdrLYL
	 lv6V6S5rCNbSCyjXQ13/NBgZ2qxtrpfwVTPkKgQSoCsCQk6X1Q3SAuv93DKBPFuqO/Ur5
	 cYJywPf/PG5dvmyHtbaOWWMZCcZJwBhBjSHIePd1dthjCytvuFiZNeJCUbolVA1eXFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336657;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=;
	b=dmpsqs9TPBpa4DnS1QubCs1oF069+bnkiSy9uVRucqmuRK4GeKrTP4R3TyFW/gOut65o
	 8aZA9A+3eMzbnctQD3sZvvHIXLliOr/al1wA6CFkbTsRr93wn4EkKYPGtb+5XH62o8RMN
	 911i+HHjyToZP5Ds/Hjp8tGtDwrHOnDRyaC4H9HW4Z6R+OBkwQsZ5sOMAOEsYiAqzglsz
	 zyX9foJ/Td6lnzWQaVdcRviBlIlzH46C6ArzaNrevWbeZBK8CatCTKGUyKumeBkQf03LQ
	 DxQuETuX79wFpccEVTX6EA+4LpPiRZaaAR9EUGVxYVXot1Su57PhChI9IaStzvaT79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=XffDLMmN;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=TkmV40Nd;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44455606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44455606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=XffDLMmN;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=TkmV40Nd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793337557; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=; b=XffDLMmNao9qx1DuQPv+GXJaC0
	olqDYKPI3jbOa4KP6pkaeDvFXCgz22zhch5wzlIIiSOydYQM4aUESfNDQHUMFDqxvpPUQKe4B7AUO
	KhlssTnJfCQg02VGLzIiAJD4Z+xn98j0EJ4SYJIsRhB20lAnU1HUiFCAk7g3mENhO4Ze/BWKqaFGx
	9JIqK7Tfeu7EF8wO0NzT5MuJAYsID+XzM7n66gJDSShFyWyPM1Kh0q9cUyjJXiMbVMay62Tp05cGF
	nWU/UacCL3Gu8lv9JxIOvlUWoXtcnRhPpHC98iHr+K6ywhczwuLnVjCLHAv1cPG23PCgKoUIbO4WO
	ezx3YExQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793336656; h=from : subject :
 to : message-id : date;
 bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=;
 b=TkmV40NdqbPg9+4v0AV3JX6ZAj9cKJyKVXgNCO0TUlx4t2cwGn4LAmNzg5fY7fX+b1O+n
 c2On8OCoYz1ouuE5ev1Vjqsa7wFeK9r7XolcJphsG1iRqbBq8/4woLZugUN6uzQGlSh7WhR
 HFJjrRf04Mlt1BwmlZKSgr11tMNo51H2c1Bbm2TnDC0DSPU/VGc/4MIMySjm9mD1TjkVCOH
 3/nZEB3KFS0JvXXRIFV7vxjU6xqgoVSzTxNnuX1HuPZz2bR+rn29xXIdZiwKHybwzv4Ekte
 m+r0mmLVTqxjFsRv0ZQ3rVpQx1HpXjmujDOfOctjti06/Trzmn3xSTcbnAsw==
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xMemT-gL4QLv-P3; Fri, 30 Oct 2026 05:03:57 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xMemT-FnQW0hPtGB2-hP6T; Fri, 30 Oct 2026 05:03:57 +0000
From: Shang En Sim <sim@shangen.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Shang En Sim <sim@shangen.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 2/2] io_uring/poll: cancel all matching requests in one pass
Date: Fri, 30 Oct 2026 00:03:17 -0500
Message-ID: <20261030050319.1448530-3-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
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
X-Smtpcorp-Track: S4SdvA1hVvE4.ybS9w-iLRJBy.yVi4Nwm8cJv
Feedback-ID: 879706m:879706aL5FzMA:879706sz-CVcCaXL
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

With IORING_ASYNC_CANCEL_ALL, __io_async_cancel() calls io_try_cancel()
until nothing is found, and io_poll_cancel() cancels one request per
call, starting each lookup at the beginning of the hash. A cancelled
request stays hashed until its task work runs, so every lookup walks
past the ones already cancelled. Cancelling K of N pending polls visits
about K*N/2 requests in one io_uring_enter(), with uring_lock held.

A single CANCEL_FD|ALL on 80000 polls on one eventfd takes 17.06s,
0.02s with this change. With voluntary preemption the soft lockup
watchdog fires:

  watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [repro:100]
  RIP: 0010:io_cancel_req_match+0x19/0xa0
   io_poll_cancel+0x73/0x170
   io_try_cancel+0x7b/0xf0
   __io_async_cancel+0x41/0x110

Walk the hash once and cancel every match, as io_cancel_remove() does
for futex and waitid. Cancel by user_data only needs its own bucket.
__io_async_cancel() still loops until nothing is found, so a request
that io-wq parks in the poll hash meanwhile is still cancelled.

A cancel that matches one request now walks the whole hash twice instead
of stopping at the match.

Cc: stable@vger.kernel.org
Fixes: 8e29da69fead ("io_uring: add support for IORING_ASYNC_CANCEL_ALL")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
 io_uring/cancel.c |  2 +-
 io_uring/poll.c   | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 50a65fbc6ff0..e3d9fe8fc982 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -198,7 +198,7 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 			break;
 		if (!all)
 			return ret;
-		/* futex and waitid return how many they cancelled */
+		/* poll, futex and waitid return how many they cancelled */
 		nr += max(ret, 1);
 	} while (1);
 
diff --git a/io_uring/poll.c b/io_uring/poll.c
index 4f04bda42f7f..9b73b0d88a0e 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -827,12 +827,47 @@ static int io_poll_disarm(struct io_kiocb *req)
 	return 0;
 }
 
+/*
+ * Cancel every request matching @cd in one pass. Cancelled requests stay
+ * hashed until their task work runs, so finding them one at a time would
+ * walk past all the earlier ones on each lookup.
+ */
+static int io_poll_cancel_all(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
+{
+	unsigned int nr_buckets = 1U << ctx->cancel_table.hash_bits;
+	unsigned int i = 0;
+	struct hlist_node *tmp;
+	struct io_kiocb *req;
+	int nr = 0;
+
+	if (!(cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP |
+			   IORING_ASYNC_CANCEL_ANY))) {
+		/* keyed by user_data, so only one bucket can match */
+		i = hash_long(cd->data, ctx->cancel_table.hash_bits);
+		nr_buckets = i + 1;
+	}
+
+	for (; i < nr_buckets; i++) {
+		struct io_hash_bucket *hb = &ctx->cancel_table.hbs[i];
+
+		hlist_for_each_entry_safe(req, tmp, &hb->list, hash_node) {
+			if (!io_cancel_req_match(req, cd))
+				continue;
+			io_poll_cancel_req(req);
+			nr++;
+		}
+	}
+	return nr ?: -ENOENT;
+}
+
 static int __io_poll_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 {
 	struct io_kiocb *req;
 
-	if (cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP |
-			 IORING_ASYNC_CANCEL_ANY))
+	if (cd->flags & (IORING_ASYNC_CANCEL_ALL | IORING_ASYNC_CANCEL_ANY))
+		return io_poll_cancel_all(ctx, cd);
+
+	if (cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP))
 		req = io_poll_file_find(ctx, cd);
 	else
 		req = io_poll_find(ctx, false, cd);
-- 
2.56.0

