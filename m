Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283278;
	b=jRoBROrIM6ykISksE8i6o3SpHYLurT7HKK5+3SQ+PQ2EJG5f3rlcSoUzxnWjKDi7er+N
	 o58vuqyM97/VZCKEwYWF1WIyaOrnzApzR6n93RPXPfFyd06rQyP2BeWRXkk+wtWdHf8X1
	 zFu+IjgQ4hsY88Hitcz9loD54u10RwURngVdTWq+gdsRNea1sIkcqA+6C5QiQm2p+HQ3P
	 c2D/d4uAnMFvjDJ6a7kPKk7uFhOEjuL+Fu+d4/1TYslbWn67RU/QH5nlD/rtTVxty6Mo5
	 1mvoMJ1234Q5hmM5q36rC/OePJJeJFIJTVOamMNThIfX53vD33YwWxHASM+tY4c3rGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
	b=kaYoyrm4iHm782nohYrleD1uHXHeC5kqt4rga2EZu9grbpoD5HZx/d/I6Z5T1t4l9dax
	 j1JShW2fevZG93YhpL8HZpjZDbBw8eMu40C/46nuxPP+i7j8gOeY/vf42Tf3UCnJiahP2
	 meQuT44/wOLKubkYO33chl2ATqt59hihLqhIfWEhQhLJX4TRcmc9cF2UYmsTFvURHhaIs
	 e92KKF5hmu6vCBSFYIFX1fIitu39R1AuZqV+fUmmSIClVkL3nCkotgvpVBV5Ud4ukjYWb
	 RsuLsZ1JOv5C6o2U/W8Z2ErXELp4RZ6/QV5pJlyBGee0ibSx7q/kYsc+1MUUM3pMI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3BWaixN;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B76606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3BWaixN
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2954869c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283278; x=1793888078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
        b=R3BWaixN1eD9vuL/jz8jm13HByyV1w9hNC1cFaaMnRM5wpIGoXaIVvOkyAF54YFdjE
         Xp4JXOLFK9iQn8gJxYw49o96O9iAMn09C4/j8nrovnE6tVsMkM5jD4qHZP/fhIznFlHc
         zqvqi0uwe8hpbWdIB6ebhK8Ci+b9ApV4th2A7I8rFovZP9H8fLzWl1+CE9/V+5/WzrRN
         wgBDF/b49ZHZ8XRBPV4kCwhpg5Tkp6lA9TkQ6KM103jccJTLZveRbZzyZtm1GnZ8Kyk+
         QagMNnGqqb5ULuP+f5uHiC916YJ2+PtbodXgo1mie6Ajhjv2IFFOea3vg6bTebh8ChFS
         MYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283278; x=1793888078;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
        b=UYdYasfl1wF2DTfRJCkbpbBa6jE0ZB2hX69vpndVbW1iJ/a/pmyEx5yAiZtnbiitvJ
         zu6zdUc1NKIs5k3aWlFeO9Tr5aF2SWwx6ZL8zkQ8SffgghBKRSwrAKYaYePiiZU4PzWQ
         cyqRGrmEzvmviDfO3l/hFgev1MjLoMLIv1UV+MjZ4If9SZVEOWDcG9VbHMLrLEIKhUya
         TCvB0ORydjeZgHCMPULIRiqmJQFkv0AYf67QglMRp9F8IGewwvkytE5Y0oLJatWE2Mz/
         M7TlmHqbYgXlICamHpka6aAsE7jCYpnWTXY56ER+riIj32rv5DzcX+jvvW7XWxmiP+jF
         7j2A==
X-Forwarded-Encrypted: i=1; AKwUvBx/Ls8fuJPJZzp215+Ol7ZhgT6MHTmS6GoSaiVlzph9rjyzs49DmQiYYn4us35HfTmKCDX5X1H/XCO9kcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlrlFRlCOEccKeKjU0NkRpOOlOO1306GtgX129ZbVrungt8b0k
	uUWAt93YyQpDqxcA7XnJQLCBHBpabHRfzHq1LomNTVus7vfDDG+XefJX
X-Gm-Gg: AYBFou0CCdagLc8ZDyyhQaxXET3pfdu/Nh9ucmR32Ne5l7POYUy4ZXl5p+JfTwNCabW
	BBcjSTfOifCJx9b378aTXQ7aSRL5mnQprKMvqMuV3ZxkYuLQc+jBOaLbQye70hPVKJCtGJUiO+Z
	tNrnuzfksmlgywLJAq54qCGDU6lVaK/HVEAbi/enJLak1l8PNG9Xir+ANqZ7wrvfz9VJg77JOcJ
	4voeUoH+3UQBzChTA0ZxNN8b8eg+9T0fwN4rl66QUUrIjl/Us1RcBoPbm5rW/ZM6cKEHYVFSKKY
	tKMXENzuKmuS/URQZfWfIXVEXmWSfVIZN6U5Z/IoebjnFl3vySQCK6NQt7ZEDy2eMYQW2/36Bnv
	wC8YD9lBF/hi0re6WqpoJv5zxLr4WPwUOe6gvFRRCHn14n/19L9FSRhUqG6LpGkAHl0qz1gha8S
	lGVCkT60m8XRoEmnc27Cv68D8sgnSmLFcRwCOgGB3Mst4CW9ZotVVd3Vgwg6sIOC9j6m3ylIP97
	CA6iFhsSxoN74AS3RXv/7qJmrKBl5sc7vn20XRx9GlFeJHT78sUnfxruTGQdHlkZ0C7+b3RCwiP
	a98nLt3qpIBoTZzElm9+P/YqQVXbJckOYycO8FW65srPXS8GDyKOXByjjd3JMTyQxfY220ix1GA
	=
X-Received: by 2002:a05:7022:1102:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a6ce2feba2mr6785845c88.37.1793283277417;
        Thu, 29 Oct 2026 07:14:37 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:35 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/timeout: count cancelled timeouts in cq_timeouts
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314078.648427.13761781546953594668@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

io_timeout_cancel() posts the cancelled timeout's -ECANCELED CQE without
advancing ctx->cq_timeouts.  io_timeout_fn() and io_kill_timeout()
advance it for every timeout CQE they post, and io_flush_timeouts()
computes the number of non-timeout completions as

    seq = cached_cq_tail - cq_timeouts

to compare against each off timeout's target_seq.  The cancelled
timeout's CQE is therefore counted as a regular completion, so every
cancellation makes an already armed off timeout fire one completion
early.

A ring with a keep-alive timeout of off=4 completes it after two NOPs
when one off=100 victim is cancelled through IORING_OP_ASYNC_CANCEL,
and before any NOP when two victims are cancelled.  The cancel CQE
should count, but the cancelled timeouts' -ECANCELED CQEs must not: the
expected counts are three and two NOPs respectively.

Advance cq_timeouts when io_timeout_extract() succeeds, under
timeout_lock and before the -ECANCELED completion is queued, matching
io_timeout_fn() and io_kill_timeout().  The -ENOENT and -EALREADY paths
post no new timeout CQE and keep their accounting.  Both the
ASYNC_CANCEL and the TIMEOUT_REMOVE path go through io_timeout_cancel().

Fixes: bfe68a221905 ("io_uring: off timeouts based only on completions")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 io_uring/timeout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 8a2108a..fa7b0d9 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -370,6 +370,9 @@ int io_timeout_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 	req = io_timeout_extract(ctx, cd);
+	if (!IS_ERR(req))
+		atomic_set(&ctx->cq_timeouts,
+			   atomic_read(&ctx->cq_timeouts) + 1);
 	raw_spin_unlock_irq(&ctx->timeout_lock);
 
 	if (IS_ERR(req))
-- 
2.34.1

