Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17037C929
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385281; cv=none; b=O8ktSTW6fPrQuITKxDGcEs+/SHS8IDChLO1yPV9pUAIgyrWPWcaou+xx0hlrQBUWDeJI6KQ4bCEY7p+ASnQZbZ5DFGuqzk2Py/+KbT3Icy/L31mYxCSbWwyPUXzoBc2jE2x0r8L2YVMX4NoM57SwuYmgf1waymZ9C87N6uRwfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385281; c=relaxed/simple;
	bh=+Q/r9VtgwE43/bNjNDFZadcuZgbsQLVges7hS/tJGdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0/+PCdtIqwdxIEbLufTS42IrrT8QYCTyWIkBJEC+lQ4cKHEvcqbBWtu166fRHOAc9yhyyPi/huL/mtz8tJySoNP8sY5K/GtHyUNWWDm+C98Jzwg7xLGxbouy0MiqVHr6/aR3wB4rFAek3Wl7525eTMIBMQq0OaawRuLAzvyKbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Www6lXGZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Www6lXGZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1947979a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791385275; x=1791990075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCVuSf7dl2NiMq0WjgbGPuLseqx6JkndalNFufVz1Tw=;
        b=Www6lXGZuw3Ro7bAcldxsGZipLQoXVrFORI4Hi+4YyBmeBN0tWSCp1wr1tJI1emKni
         yP2/cIs2+0vfJaWxowXzcjjuzzn4bo+GU8AcWS3pVQ+yuX45R5RnRlleQ8RFeoVaSZpo
         R/hsjOpkpemxeEUkVJaKepJWPF0uGy4DkGufuZJmIx8oX1ukujW0LM6YO5mO7ws7evVL
         gEFUMq6G7u50WTI0eNQKyfuwzHzW8vxuo8AVntvrMEg89QXsfOryT9lCzG065r/ezRW4
         POOKloMXitQMVPbO1m9mEl7WRnoVkFWpz9vmDUAtPy1Tt7UA/DOKMCopKEPTUdh0d5pt
         JgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385275; x=1791990075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCVuSf7dl2NiMq0WjgbGPuLseqx6JkndalNFufVz1Tw=;
        b=r+0EtdZ+1T+46c0MXhfq9G5RctmMO/hoZdMlJuNgcBhFYP0hFTVgBfXShBDGn4IVw2
         St9QiwU6lyn5NZibTBRpP+Hv1ka0ZsoXqd0LT/NUuMV/Hnry/X4x3RAwfYqA0dGMw7TP
         8JzR1GCpGF63f5/5Whgk4ntjgEcvaS4182xnU/+oCZFIl06uvMNW4COGSZrKGqBAIvEL
         GkZfipr1wH+D6uAMqq+mk7Hsfwt04b68Rpn73G4CkM0hyNDxbEX8QWJX9+Nz7wgavOtG
         n+0gidqVv+vtgEs2rhoBA90uyW5YwR3b6GklVhdGolDtw3lEehUdDVQXpPjN99unDlQZ
         apWA==
X-Forwarded-Encrypted: i=1; AKwUvBzbZHAZ+Jv+9AMBAOJAIKvxd8+S13RrCz7LLO45EoAs1ay8dYJmUfxbQrpNdIHc/AQstSHNWPPZmznAcXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI72Pi+2gfrv0zensmVegcODWe2IQv8Vwz2kdqH9kXNT9CusgwS
	wAQ+1JV/1zUsnIVuk9/u556cCYW7OqTzmEHRyTb5Ty4f91JQ4s5rMj+8OM1JGA03K7M=
X-Gm-Gg: AYBFou0dIFis9Frbg2HvxhcCVIU4Ampl8lHtRhvyQpRWQG5qIrHnG4f08Db7oRQhVrM
	0aNdZhLg4V8fmURpNCvVjTFn8vNEUWSj3QBCPUmC9FZKfm+fgXWI68cCKrPBfjb2hLnVxgxmKD6
	OMTc0PTvNACBezgWMlDQJcxNaz1KtcGfCbKVW8Ae3AP7+bbJ5yVDa2M/8DfQXQnykUYdLD9ZBjl
	kJ0uOiPKXgVlrressgt2RLY/4KKVOUWqYPnz0Z7By8VXrbUSDp+NmAT6XTUlfnxGfw+INE2EhLt
	G7XNGfo9pDWtiCQ9GjYGXrrnS+k6JL4Vu4fAEXflzSDZQ7sIz9TS3AVGMmT9ruhkhkdAiC8SvQd
	oVzqFray0Paxr8Gss3cmQlORFGjSuKPx2g3inTRYmTh9VCIAb2cFOadQ6idhKNp7oYWf6mfcQCi
	TWFgiybFeUlbp4HBpHX3hQ6N88vTI3it10FRdTuyjjyz4ItJKxp0qwDwO18911OAJcJwuVB3G49
	0zwNUmBK7qGLBGggFoLU8s5MJguCiYBpd6pa6pnb7rZ70qZTMsAbOI/zutb
X-Received: by 2002:a17:90b:58e8:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3a8a153a870mr1453009a91.37.1791385273896;
        Wed, 07 Oct 2026 08:01:13 -0700 (PDT)
Received: from localhost.localdomain (101.120.85.136.bc.googleusercontent.com. [136.85.120.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm5107544a91.5.2026.10.07.08.01.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 08:01:13 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: pl330: Fix lock-order inversion in the channel release path
Date: Wed,  7 Oct 2026 23:01:04 +0800
Message-ID: <20261007150104.38253-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pl330 uses two locks per transfer: the channel lock pch->lock and the
controller lock pl330->lock. My static analyzer reported that they can
be taken concurrently in opposite orders, leading to potential deadlocks.

The terminate/stop paths take pch->lock first and then pl330->lock, e.g.
  pl330_terminate_all()
    -> spin_lock_irqsave(&pch->lock, flags);
    -> spin_lock(&pl330->lock);
and
  pl330_pause()
    -> spin_lock_irqsave(&pch->lock, flags);
    -> spin_lock(&pl330->lock);

While on the other hand, the channel release path takes pl330->lock first 
and then pch->lock in pl330_free_chan_resources():
  pl330_free_chan_resources()
    -> spin_lock_irqsave(&pl330->lock, flags);
    -> pl330_release_channel(pch->thread);
    -> dma_pl330_rqcb()
      -> spin_lock_irqsave(&pch->lock, flags);

Freeing a channel (dma_release_channel() -> dma_chan_put() ->
pl330_free_chan_resources()) while another CPU is in pl330_terminate_all()
or pl330_pause() on the same channel is therefore an ABBA deadlock: the 
one thread spins on pl330->lock that the other holds, and vice versa.

Inspecting the driver code suggests the rule that dma_pl330_rqcb() must 
not be called with pl330->lock held: pl330_dotask() and the callback 
drain loop  in pl330_update() both releases pl330->lock before their 
dma_pl330_rqcb() calls. Thus, pl330_release_channel() is expected 
to follow the same manner.

Let pl330_release_channel() manage pl330->lock itself and keep the two
dma_pl330_rqcb() calls outside the critical section, and stop holding
pl330->lock around the call in pl330_free_chan_resources().

This was found by a static analyzer on Linux 7.3-rc4; it reported
DeadLock::AllLock (Certain) for

    pl330_free_chan_resources() <-> pl330_terminate_all()
    pl330_free_chan_resources() <-> pl330_pause().

Fixes: 91539eb1fda2 ("dmaengine: pl330: fix double lock")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/pl330.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1805,16 +1805,32 @@
 
 static void pl330_release_channel(struct pl330_thread *thrd)
 {
+	struct pl330_dmac *pl330;
+	unsigned long flags;
+
 	if (!thrd || thrd->free)
 		return;
 
+	pl330 = thrd->dmac;
+
+	spin_lock_irqsave(&pl330->lock, flags);
 	_stop(thrd);
+	spin_unlock_irqrestore(&pl330->lock, flags);
 
+	/*
+	 * dma_pl330_rqcb() takes the channel lock, which is acquired before
+	 * pl330->lock on the terminate/pause/tx_status paths.  Calling it with
+	 * pl330->lock held would invert the lock order, so keep it outside the
+	 * critical section - the same convention pl330_dotask() and
+	 * pl330_update() already follow.
+	 */
 	dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
 	dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
 
+	spin_lock_irqsave(&pl330->lock, flags);
 	_free_event(thrd, thrd->ev);
 	thrd->free = true;
+	spin_unlock_irqrestore(&pl330->lock, flags);
 }
 
 /* Initialize the structure for PL330 configuration, that can be used
@@ -2358,9 +2374,15 @@
 	tasklet_kill(&pch->task);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
-	spin_lock_irqsave(&pl330->lock, flags);
 
+	/*
+	 * pl330_release_channel() takes pl330->lock itself and calls
+	 * dma_pl330_rqcb(), which takes the channel lock.  It must therefore
+	 * not be called with pl330->lock held (see the comment there).
+	 */
 	pl330_release_channel(pch->thread);
+
+	spin_lock_irqsave(&pl330->lock, flags);
 	pch->thread = NULL;
 
 	if (pch->cyclic)
-- 
2.43.0
