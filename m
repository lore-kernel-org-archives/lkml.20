Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C72F8E9E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306956; cv=none; b=beboZbSlglKPhhWp6X1M8LBe1v3n/bbpaSHMyfHwh5UjujnKseyODTNig/FyVk8zU6IVjKxC6ota0jNmQCbNyDGdydMq+DS4k532KsKYPS35kHVt/zHi05yaCRVu3PUH6oDl2ng0Vz+5aSe2CjoFk6/+gURzsoiqXX/w4wCgD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306956; c=relaxed/simple;
	bh=udlscoQO6lt5ieBwi5A9lM5Fkjh28j/ixHjmt4ShOOA=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=gTS57D2Fb3AqQKmYTVfq/MFS5z6UuaetazhHuUw+BQjgoWruEJ6pBTIrMRRLbaVsGnl+WEIU7AnIB1FfuopCdqw3uD/hTEBybNo+N3skClbGhTrDYJozPFuGBNrn3pMrqxPW6WfAhvGkCqzcKf3i86JMmn0gFlhG+Ifyg8ZdF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=EpyfxzdT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="EpyfxzdT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5350d9ea106so10737401cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306954; x=1791911754; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X9CSClLeUlYDebJUwQpya4W05/MVjIaKRZATfthLkR4=;
        b=EpyfxzdTQUC+YFsLLuCPhiMo7lDkFSEkfoFgQ01kXb0iQrP8aO2SUp55569Wo5mwGr
         drKQ/JgTq1sdf5Rgwwfd+vdCPjaV/er+2Y9we1ViDkkHysuKef2DWH+JwMyDJs1hYwJF
         MFCjMmy2wThsX2PuDCdbEvfqqzqv5MFXPYv1842b62Kr8mQ4tQhMPEak0q60DT2UIQjG
         X4fBPuK3wCdHBsBnsJ7snbYMYJ1t2L5MeTpwEgfFLnl7JUNOW1RIGTlvZNdtRXRTQ1T4
         lpv1dzBq3zUUn1tfWtbRipjMZyXssgAyBZCs5f5xIrFbWyVn6V2h/iig584P2XAoZa6r
         wNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306954; x=1791911754;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9CSClLeUlYDebJUwQpya4W05/MVjIaKRZATfthLkR4=;
        b=fxLTxTzuz9uZIpmCpyQMdK4AtPISY3CLyMmPCqgqXkPvQj+VSImTUUWG7E5CH519xl
         da+ljjWxqaenlBqahATfLS7DdLaapUhTywnGKZT1T1bHhlQt77Smd2WWVEKY5pl8/U7Z
         mlwJxnP2k0c64hpkJTomzrcVeFRCzVPDeXtdDUhW6eSpRO+jDMYu7Gpvme0BK+mpp99j
         jaMBsDruZM8lU9VkrTtPGrjvBr5eyNomYzIm3kmrLFiDlH/80epJHXqfXXE5yi04dmOG
         GscXaQdPlLMXifNnxcjlheShwXs39KTF7zxyKqLRdwYLejZGlCwkLGf7s8Jslouaxn0e
         8KNw==
X-Forwarded-Encrypted: i=1; AKwUvBytid9L/vJYRGfKZwuQz5GlhrhbFulysC3RkRryd8rG/pOoJ+sh1tQkDX/AbiH0ZQ8BDgNwVSoneOh1e1o=@vger.kernel.org
X-Gm-Message-State: AFuF++kh0A4aFWRfpaq+/fWjMELHceEgEwW8mn0NYmFcJKsqD43tJ/8l
	GOJk3lQILK5Cpqn43pdjcPMO9QjTBuSFDXVGs3iSLdYs9gzwY3JH2iBlQAv6iZycpMaunRjorV9
	57vSI
X-Gm-Gg: AYBFou1YHyBkVw+bBw6N19v5k+Y1W3wGT4tHGp+8cjWxBV2UJ8S36mjG4OgJGsFMmy3
	Yg6nXuC8YceJoRvYie0NIqHpdbq5uUoUrftUiFobDTAgnMRDmTNPORMIYfcOFbRHHqAOy0cyhfZ
	V31z/UfB6V415NvaTh1vchYLjcIpNf1RmUOJtKzPjoK8cOQcliiaz7fB1Vgd2x0qKh/+UZ0OhM/
	REs4xGsCfjG+uYJeOm47F0Dhu7UvKwCQxsXGuDjKC0/Ytb9/sv3nfFgNpnfy+qUewKxfMHFRClT
	q66o1E+LNvhc8v2lpU9dKIf3CTxhA68ynSTPYHl3ZEOqB3Ul+RMIMgFk+0NduH6zgVlWrWpp34f
	Odoak53mIvr/qUwcnd5HzgtKRqb73WGFsnHej36Vn3pXXUPKmYe0GPo6AJE8mtHmjmh7SzpVDOX
	ah3/TS3N7ksZ9MXjvaxyn1VDzmBxVqeGAAR7jkNK7Dy9FAa/Hpl6gmhc6pyp6oXJT7OI2KijK7E
	KiIN6qtj0uXEP8=
X-Received: by 2002:ac8:5e4e:0:b0:535:70c4:acb1 with SMTP id d75a77b69052e-53570c4b5bcmr8655501cf.70.1791306953728;
        Tue, 06 Oct 2026 10:15:53 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357209e284sm479771cf.5.2026.10.06.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:15:51 -0700 (PDT)
Message-ID: <53d2ea1f34e03e73a1be52e9473fc6d692ec2194.1791303049.git.josef@toxicpanda.com>
In-Reply-To: <cover.1791303049.git.josef@toxicpanda.com>
References: <20261001125422.1364260-1-tom.leiming@gmail.com>
	<cover.1791303049.git.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 6 Oct 2026 14:49:23 +0000
Subject: [PATCH 2/4] ublk: drop QUIESCE_DEV's wait for an idle command
To: Ming Lei <tom.leiming@gmail.com>,
    Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
    linux-block@vger.kernel.org,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

ublk_wait_for_idle_io() is meant to wait until every queue has a command
whose request is not with the server, so that canceling it tells the
server about the quiesce. It never waits: blk_mq_tagset_busy_iter()
only calls ublk_count_busy_req() for started requests, and the callback
counts a request only when it is not started, so nr_busy is always 0
and every queue looks idle.

Making it count would not help either. It runs with ub->mutex held, so
a server which keeps every tag busy would hold up STOP_DEV, recovery
and its own release work for as long as the QUIESCE_DEV timeout, which
is forever by default. Drop it; nothing changes, since it never waited,
and a later patch has QUIESCE_DEV keep canceling until the server has
been told, without ub->mutex held.

The QUIESCE_DEV timeout in data[0] is unused until then.

Fixes: b465ae7b2524 ("ublk: add feature UBLK_F_QUIESCE")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 75 ----------------------------------------
 1 file changed, 75 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 0bd0b95b3217..bd7126dcf92f 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -5338,80 +5338,9 @@ static int ublk_ctrl_set_size(struct ublk_device *ub, const struct ublksrv_ctrl_
 	return ret;
 }
 
-struct count_busy {
-	const struct ublk_queue *ubq;
-	u16 nr_busy;
-};
-
-static bool ublk_count_busy_req(struct request *rq, void *data)
-{
-	struct count_busy *idle = data;
-
-	if (!blk_mq_request_started(rq) && rq->mq_hctx->driver_data == idle->ubq)
-		idle->nr_busy += 1;
-	return true;
-}
-
-/* uring_cmd is guaranteed to be active if the associated request is idle */
-static bool ubq_has_idle_io(const struct ublk_queue *ubq)
-{
-	struct count_busy data = {
-		.ubq = ubq,
-	};
-
-	blk_mq_tagset_busy_iter(&ubq->dev->tag_set, ublk_count_busy_req, &data);
-	return data.nr_busy < ubq->q_depth;
-}
-
-/* Wait until each hw queue has at least one idle IO */
-static int ublk_wait_for_idle_io(struct ublk_device *ub,
-				 unsigned int timeout_ms)
-{
-	unsigned int elapsed = 0;
-	int ret;
-
-	/*
-	 * For UBLK_F_BATCH_IO ublk server can get notified with existing
-	 * or new fetch command, so needn't wait any more
-	 */
-	if (ublk_dev_support_batch_io(ub))
-		return 0;
-
-	while (elapsed < timeout_ms && !signal_pending(current)) {
-		u16 i, queues_cancelable = 0;
-
-		for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
-			struct ublk_queue *ubq = ublk_get_queue(ub, i);
-
-			queues_cancelable += !!ubq_has_idle_io(ubq);
-		}
-
-		/*
-		 * Each queue needs at least one active command for
-		 * notifying ublk server
-		 */
-		if (queues_cancelable == ub->dev_info.nr_hw_queues)
-			break;
-
-		msleep(UBLK_REQUEUE_DELAY_MS);
-		elapsed += UBLK_REQUEUE_DELAY_MS;
-	}
-
-	if (signal_pending(current))
-		ret = -EINTR;
-	else if (elapsed >= timeout_ms)
-		ret = -EBUSY;
-	else
-		ret = 0;
-
-	return ret;
-}
-
 static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 				 const struct ublksrv_ctrl_cmd *header)
 {
-	/* zero means wait forever */
-	u64 timeout_ms = header->data[0];
 	struct gendisk *disk;
 	bool live = true;
 	int ret = -ENODEV;
@@ -5445,10 +5374,6 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 	blk_mq_unquiesce_queue(disk->queue);
 	mutex_unlock(&ub->cancel_mutex);
 
-	if (!timeout_ms)
-		timeout_ms = UINT_MAX;
-	ret = ublk_wait_for_idle_io(ub, timeout_ms);
-
 put_disk:
 	ublk_put_disk(disk);
 unlock:
-- 
2.55.0

