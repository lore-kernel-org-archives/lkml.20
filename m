Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F89496D26
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141340; cv=none; b=Str21fgi6XzfBD1yWj4bnN7MFwCH7zhrQWhblYPQKkgwzlQZ8pyOYtUUIPy0D6oo08kuVEX6MOU4zYap31RoDYjBogX+B9zIkx5k9c4GmSw7BsewGhQIJMR/TAIGTj1U71AFXU3fNvOib63TC4/3bgofKSqTHIGrX6IBGvaSzPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141340; c=relaxed/simple;
	bh=5A1wu8NEeK9mJoM9/OY+CglS8dpgeZrlo6DgdNg46HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTQoYbpVAKq6Dj/qulAbfnOKf/JpHEiENewwVHIzUl6GJT2zBJ4PMuo0cTIyftSEO9ZFOC34AXh6QLiyGUvfuB0s6vykYJYDytNPPJhFSkb/zS7PlJaIH5dYeGm+C21XbrGVSPST5wtA+lgtawGMRW3KbxVWEQe3m8ouj99EK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=GdCuJ436; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="GdCuJ436"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6b200fso713332eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141336; x=1789746136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=GdCuJ436yBQPGmZmv0GkA1LKAVy0QL/LDG1+alUkOkMSCpTPAhG+dKJPJuNkbCQyge
         vQk4wFjY8CFZXuXB6VVANodNvSNNRHNnlw4pf26ZOWq6E98n7o5oDEQqU1WNwkjSiQjm
         olNH8hDPutJiP2MDuKB+Ti6NF1eyZ4DK38nQXW+agzjJaAhc8cZML7+kSv2oRO/PIYAK
         LnfjFm+vhMu02NiBVZXc6qCw7leT3hsjaIpI8pca0rGSYCHNn3Wb0OWIAfTTY1untzVF
         uIAypQj7+5jjIXYGptlEBXPBDaBS9hWpffmyvGXJkpLkWIQIG65qVS6zIAg91rKhgwcs
         olPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141336; x=1789746136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=Gibd8w7SAWTh1pU7/uvw2wCPIQ0ieeZH39B1ItfyeQ3hSuRusgR/cSxEq4xzksJbrP
         o+eG0BKmDbMxE+ozhcByPVhpi8wKoiGgI0C86HDd77MRpZyvFaT2eiNVsI+oYMAo55XX
         lueZ89G3D9QHTUnzTvG9uGqjIokbAd0maQu0H7gude6UTTxIv5IU9QSpseU4zRw20gDX
         caosh9j2FcO/Sr0FL0Lmj1LTCViJtpQXSyGZaXYYhnAg6f7YT3UMAF5FmZPKFFpPN4t/
         RF3b+xuFxNFegGD9xAwEWp6G5QeU9BnslX5aDEv490z54xNRjduEtBZAmLn4FYPHaHrk
         NQIA==
X-Forwarded-Encrypted: i=1; AKwUvBztVaUkzf8/V+XRqeX8Ar/yhmOO1YG+oJB+3ayOnL/gvhU5MX+bCZ5E/BaEAVtmKHTyplE4Vkqasqs9QeI=@vger.kernel.org
X-Gm-Message-State: AFuF++kV6EJulhx2cKHNsAIyrW5XMBeQFU8qCYdEBo2x8IXpRJvki7/X
	bl6hYWARgs9CFf5VAEQeesn1ZDwq+WJ4PHM6/PC+3oUDqXYTWEwJfq8DvIJSCYl1vRc=
X-Gm-Gg: AYBFou2sH/TTMgv3LWwjTQZuAj48bN3zrq+GXYJ5lp8L3ubDRKaY9y/Y2/fKNkv50S8
	7QI5HFjETnuExijcg0QUet9EwpeawFNRk/XWOWZ8itQlgAa6eYpgOQztqrGDQZX1gNskkI3+Lwx
	cL/aFW3Hcq9zVx2waiihAsoOQperrhCB5NyIzBbruprScdvNXykI00p2sRC2bI4khISH7K9RHRy
	80LFpusF+8k3lBQY/zkWa+VQnqgKHV1uGc0/4GaL9JilIgBZgsMIjnLCOttlQ61xhsizrOgVWqS
	vfujuZLSVX0oVJMWb+hmOs/qsg5SpIV/UXY0sziyGTGf5O1/Y3phWuzR2zOHgrwmc3tU5xqf1Cb
	SS16AC993/IlV2ZrsDwfq1pojGdvvOPjsvS3qFTco6TwUy6FDxdIZ50yt76ljHu/Nhjp1u404Ra
	lWiTJpMaxZJ93RE9kMi/gSFOefjMKhaZMJWbPFgNJGYAJQomiuEXAn2nWzbnu/ZPy8KVby8Ycyx
	oueA7A/6L/Ur18w8/wwx3F6IGChQQiJjLmmqZkpajo=
X-Received: by 2002:a05:6820:f00b:b0:6bd:cd33:b885 with SMTP id 006d021491bc7-6c0bc4c8a27mr3367535eaf.42.1789141335900;
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/15] io_uring: issue IOSQE_ASYNC requests inline when a handoff is possible
Date: Fri, 11 Sep 2026 09:41:05 -0600
Message-ID: <20260911154148.644489-16-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOTE: undecided if this should be the behavior.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 3 ---
 io_uring/io_uring.c            | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 37c56ad37e05..dadbe3655138 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -651,7 +651,6 @@ enum {
 	REQ_F_IMPORT_BUFFER_BIT,
 	REQ_F_SQE_COPIED_BIT,
 	REQ_F_IOPOLL_BIT,
-	REQ_F_ASYNC_USER_BIT,
 	REQ_F_HANDOFF_BIT,
 
 	/* not a real bit, just to check we're not overflowing the space */
@@ -748,8 +747,6 @@ enum {
 	REQ_F_SQE_COPIED	= IO_REQ_FLAG(REQ_F_SQE_COPIED_BIT),
 	/* request must be iopolled to completion (set in ->issue()) */
 	REQ_F_IOPOLL		= IO_REQ_FLAG(REQ_F_IOPOLL_BIT),
-	/* IOSQE_ASYNC was set on the SQE, not just by prep */
-	REQ_F_ASYNC_USER	= IO_REQ_FLAG(REQ_F_ASYNC_USER_BIT),
 	/* vetted at submit for an inline blocking issue with a handoff */
 	REQ_F_HANDOFF		= IO_REQ_FLAG(REQ_F_HANDOFF_BIT),
 };
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 7c2aa0cfacc8..04e2fbdcb3dd 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1771,8 +1771,6 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	/* same numerical values with corresponding REQ_F_*, safe to copy */
 	sqe_flags = READ_ONCE(sqe->flags);
 	req->flags = (__force io_req_flags_t) sqe_flags;
-	if (sqe_flags & IOSQE_ASYNC)
-		req->flags |= REQ_F_ASYNC_USER;
 	req->cqe.user_data = READ_ONCE(sqe->user_data);
 	req->file = NULL;
 	req->tctx = current->io_uring;
@@ -1919,9 +1917,6 @@ static bool io_req_force_async(struct io_kiocb *req)
 		return true;
 	if (!(req->flags & REQ_F_FORCE_ASYNC))
 		return false;
-	/* userspace asked for it, keep the explicit offload */
-	if (req->flags & REQ_F_ASYNC_USER)
-		return true;
 	if (req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
 		return true;
 	/* the file decides on pollability, resolve it now if fixed */
-- 
2.55.0

