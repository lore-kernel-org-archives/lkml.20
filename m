Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473319;
	b=KMXnNII1JwWA1lX4Bpxgjid2SdCxka+60fuEVjp4RZliiS2VH+7dSkOgdTfQ6sYnEmns
	 VS31etqpHKaIhffMraHWUcRkZDxiQtyGVjB/LeXb2MZY0raLuB7GkU7HtAlnqA5IX4sm+
	 uhdogRUojjtjxXyXz7wkIuSHvRzZ4yFMvqW28YcBjXuHDFe5vlR3Hp5KlTiklhgZpC14x
	 qmOUo4nKj4PsHLqzv1QTfwZ2hO7X9ANQofbdgjFPoyzY++lkc3/jmGzCy1Fyj/NkXPOx4
	 7nk2DdSN7hikyNmKCo18JdnQ9yYjmNK31/w+1XmJ4a6mb8RTENl6l82O3xnMYnqTxoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473319;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ewL5KkfQtMsttYd5RiJoqScdchsS/glgtbNvz9UNuo=;
	b=LPGw5ZNlYbWsIHiQEZYP49q/cOXWgtexpb7Wg7TgeZuK/34mztrFWK9+e7kUHxz5y6cX
	 3340rd1ux0aRitIQrxGAC3M/FdLt0eJhHmnOkO17i/wiQ02HIeF1tZPf6shj/HLsd9zm5
	 0m1lq0Ezm7BbKefS3g2+YtcrN2Y7itoQo02Cay5hiRzYjj+U4X+u+y6zuWWpV+c52lyOk
	 lJ2YhvYwl6hy8aVB774BYZ2mR7kDi/WcElKuvJu+qom9EkWgUSmPcTxhXRm1QDgyUohFa
	 wFpup463w8DuM1a0qQ9OTBMnM8JF7hyLALH9QG5muSRomr+xHPfpL/IUNbXKflrMG6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhNAbTtr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689A606B5BB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhNAbTtr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794473319;
	b=UwSREd6dqFHRFB91Gwa4pfrFCEHjgrf/kTttVnzcsj2uOMxldHFH9cm4ZRAcbPIK6jgt
	 b6utaZiCe1yEWqb7Zdj15N6rE/4JUPDdtro+KF9lHBTz4/JgKUzxuA3lRqHDgtphAPq7G
	 TzZC6HLNVlHOi75M7rKQCgYgyiaH5MwZcRIQySB3e9NwmR52M3YuW72ZfEDI9K3gPTMyI
	 FEF3rKYDO9k+oWNuF9NVInyZ3QsfFlMY9waxk4tIlS3s/19YG27RIMdd/fbzkHPlFGgGn
	 Rw3EG12ZiwPy5EY80W6HwIref7OijzEtqKT0HNChEs4rjVXTsAG3EqoNHX+Jmgx+WsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794473319;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ewL5KkfQtMsttYd5RiJoqScdchsS/glgtbNvz9UNuo=;
	b=J167gisNFbPMZKCTep+AXb6g/RNTxKxzy81jZ5KSNiNl4Tpm17jON4U+uS7X9qKb1q/u
	 yYwhITuWYV0+aKWGpUge3BvcK2fdxPuRs5h173wnWDYckI0AWwdF6+aEs88K+1wAro1Nf
	 621Rum3C8IcAe/TpVsG6VxsJo/NW+McwjXNIRXizLa+Y+iAeOqmO+eIxCq3jGT/mBhxb9
	 Wx3/fxH8vI4z0q3SnPA6BD1tRTDs7M+P6CUiZYuL2KtRb+5nrr1Y1Km4cj0Ts7y3Ct+Df
	 fEkdcW4JYWPgmwooAFjr0+TonNUaDRR+0j51kEWnKy9t9NRrplf+u8CPfTQOt4WJYsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27D951F00A0D;
	Thu, 12 Nov 2026 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473319;
	bh=+ewL5KkfQtMsttYd5RiJoqScdchsS/glgtbNvz9UNuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OhNAbTtrkufYAGsm1CHPD1xnF2irqcbMnxtluTsAMcV9Mo57TI2jlAGAah30xaSuQ
	 RcezsIhrtx3v1ntDYG3mcexXUQmVQNsoo8PnRjRSe6Z0PX9ENS+H3UFrBE4xJdOpV2
	 BtArtm2v/jBQOozD8YeXWWZGVcVAUxWQRaSbkpA4wEACoR2Izn1SrZG+lHdnh3vz5j
	 /Yhm3upqHbRjAM5uwX3sCRID5xD5MHKVXdGAt0cbsrMnk2/tHx3+ZXjUq3OWX0XDt0
	 TRsa0bzk3PdxrlJ+Wl1eIR9pBmUG9o9O3tELJ+Phs6NItC8yZ0+57yNwTxz/hbMgD9
	 L+6dUNtRK5KBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4583493F9;
	Thu, 12 Nov 2026 08:48:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:48:41 +0000
Subject: [PATCH v2 08/11] drm/panfrost: Don't cancel a job that completed
 during a reset
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
Message-Id: <20261112-panfrost-long-jobs-v2-8-a06830da3d99@gmail.com>
References: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
In-Reply-To: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794473314; l=2617;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=iMJelzj8KqIiUIEwuJi9ZCg/13D5VG22D+zXxoQOWxs=;
 b=+h01gW76bjx47nnrrwEyagNXsWayE1TGc1O/lWLhxtLBC5hOMJixs/5We18jeovD/WDoz6EYs
 NPwcKrnIEYZC/MYMsA74BPpy+w3omlmmrO+2ox6l1OAG0PNLGSH+SkM
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset() stops the schedulers, which detaches them from the done
fences of the jobs on the GPU, then soft-stops the slots and handles the
interrupts that are still pending. A job that finishes in that window
instead of stopping is completed by panfrost_jm_handle_done(): its done
fence is signalled and its jc cleared. drm_sched_resubmit_jobs() then
calls panfrost_job_run(), which returns NULL for a job with no jc, and
since commit 03877d621db0 ("drm/scheduler: mark jobs without fence as
canceled") drm_sched_start() completes a pending job without a hardware
fence with -ECANCELED. The job did complete, but userspace is told it
did not.

Return the job's done fence instead: drm_sched_start() finds it
signalled and completes the job with the fence's status, which is 0 for
a job that finished and the error panfrost_job_handle_err() set for one
that was hard-stopped or faulted.

This depends on the previous patch: before it, a job cancelled from
_NEXT could be taken for done in the same window, and would now be
reported as completed without having run.

Found by code review (Sashiko) of the next patches, which make the
soft-stop wait longer and the window wider. Not reproduced.

Fixes: 03877d621db0 ("drm/scheduler: mark jobs without fence as canceled")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206581@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 418a91a31..7561de67c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -409,11 +409,14 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	if (unlikely(job->base.s_fence->finished.error))
 		return NULL;
 
-	/* Nothing to execute: can happen if the job has finished while
-	 * we were resetting the GPU.
+	/* Nothing to execute: the job has finished (or failed) on the GPU
+	 * while we were resetting it, after drm_sched_stop() had detached the
+	 * scheduler from its done fence. Hand that fence back, so that the job
+	 * completes with the status the GPU gave it: with no fence,
+	 * drm_sched_start() would complete it as cancelled.
 	 */
 	if (!job->jc)
-		return NULL;
+		return dma_fence_get(job->done_fence);
 
 	fence = panfrost_fence_create(pfdev, slot);
 	if (IS_ERR(fence))

-- 
2.55.0


