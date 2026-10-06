Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE33BED46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306951; cv=none; b=KdkIzSyrWbZx8cYrM7jhNgJcKW0OnU6pq7TlWd9+TnDLOuL6vZ16VI7EeaW84XVIsnztaXYTer3mOtTALuwVzRtWvHlas9SiB3VAp4IaR2iNDQymmc+RvDP2n+i25WeioaRnLZSJtkVRqpKIprOWRfBHvBnxCGHyQ3BU+q/Uss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306951; c=relaxed/simple;
	bh=hCCGajtli712D3U8h4Ma3ed7yZx2pK0pPUNDH9Ebgmc=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=BworWJqEMrL7v2bUMw/+87jnqjbkOpBHgW68oN/wkU9PLvyyeDBf/BAvKzs0D/iW97BmD7kIQR0y6HIaLDrns4rofuf49IP0P7XtfWhaBaDpaZsXJijPGYwhc+ciHiQmT78O/miXra9ebZpiTpgNRUZRV7Kwf0Ts44afVrAGQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=fcYdv+bh; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="fcYdv+bh"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91054f537ccso10153326d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306949; x=1791911749; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ZQiw8K62IEDDDX0qjm61k9O0EHmc2uqOwATSUTzFtg=;
        b=fcYdv+bhlzyp42JuZuRMHMTFtsmBp9ia4dRPNH5Vc7OPY+0EKWwkshOozuKFq5++WE
         lC0Zc7HG5wkR9EMelGSOe3ETZyx6BdO1tWJTm2uuJCuXng4B8FmHDJ2CGZ+NRBttdFby
         mo3SNlHxtrr2+2WA8GIK/E2HlX45GFzskY8GRNMVfKxW6W6PeDxVCXoynkMhWk3aAYx0
         omzR6+5WRKXW8WtptznNB/PzydGPKGsWdF2woH+x68gH/wYIRTFrYqBzO1qhySjQ3AuY
         qmSXouoqxfdtPijxGKe4NitYmEY90dTVlUu9BPEX9h60WIUnZj8C3octk6FM9mYD89vS
         RSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306949; x=1791911749;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZQiw8K62IEDDDX0qjm61k9O0EHmc2uqOwATSUTzFtg=;
        b=GtfU+G/I5r0fB7Mh1nhllTaUbUEu0QNcvolu7ivLs4iVkZZzAb3y8F8Q9Sk+nSsb9L
         nDbE0WftMhdBb6kVO/bVCM+qJDhXDTIlTcP8/RpAtAlxHL009ERfnMV8qBKj++wnfhQb
         HkmtMtlZOc+LbOKYzhHeplql3Hbkm2PZxDrbls8Q/2tBOc03YdeqVF8Gx69GNDATWf1u
         vu41n3ecOyiJe3wg4maobMgg/ogevuuaMzoQbsUxTZ2l47Pvsi/kdDxE0fYHH1JxjZjL
         8T7Qpk0FEhl1PoUb9/fIB0T93+DHKvoIcziZESb9/1Yumm2skvfIo2UL5RLbvrf024NP
         /O3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIpfn5mKbAiQxk0HBt1eLz1rUx/QB4vuhr4wmoiVADP0hGBqxbo/CpxQXhJy6uRIAx+mgz3NvCCxbDQ/g=@vger.kernel.org
X-Gm-Message-State: AFuF++mqGMMKASz1+ERNRksyNN4tlYCyCkgN1vXYOLwIhWmokVSk5+7R
	mFGhuNqAHh0akRK6CqoOUUv9j31XCQCU1NaFPc4kAXfFqhNr7asrQ8JXRcFY0K3jJKg=
X-Gm-Gg: AYBFou0GwqXS92ueRQEO2sMWhNp7x8muIiiOSvAXsLsOV2nEQVFiwQoD7kzJ4e2q/ic
	fv7xLZEca/9cckCjU8rl/PLSXx8pCX/kKq2HtM74bEM3eBieQ/Edg06yaeDZKOPBkrzpf+g2GwU
	3fMV+mc8tH5wcn1FmqYY+zTrbnT5AuFNWXA9FSvC09Y3/tk6Via75APA0UzlsPcbvNc0cdBCS+X
	bSmsqTg26QYPq3Ik6g1Wfc0hbYGY494Fyr+Yx+BVL1M4kpFZbqRLNsTdWv0pzNIkTpyh2X6W0xE
	ERkULvNktdKtpWsseAlSb9IxFdPQDzNRBEFW/UGgEUZ+P3lkMCBZSITqYPvYFgwHgoXdastDDVl
	cK4yZx97gxjL1bdfjkXLQ7zm/zYKhbT2KSckc2OrGQgSItk2Q3wR5/qMvdTsRj5PQh+ZymVHG8P
	iRBSJud0Ld9U3zYvjnsbIh5PH/BFY7r7korJToGn772t5WkzCOSyxO+ls6yIMG847W0U8Wiu4on
	QD5WgXPEAgtzi8=
X-Received: by 2002:a05:6214:5b05:b0:919:952d:f5ba with SMTP id 6a1803df08f44-919952e6836mr9099406d6.52.1791306949376;
        Tue, 06 Oct 2026 10:15:49 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919873f5f2asm23530006d6.25.2026.10.06.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:15:46 -0700 (PDT)
Message-ID: <28e99b5949ffa9005596098f5a16b71b497f2123.1791303049.git.josef@toxicpanda.com>
In-Reply-To: <cover.1791303049.git.josef@toxicpanda.com>
References: <20261001125422.1364260-1-tom.leiming@gmail.com>
	<cover.1791303049.git.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 6 Oct 2026 13:05:58 +0000
Subject: [PATCH 1/4] ublk: don't cancel commands in QUIESCE_DEV on a device
 that isn't live
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

QUIESCE_DEV on a device which is not LIVE returns 0 as "already in
expected state", but ublk_cancel_dev() still runs after ub->mutex is
dropped. A device which is QUIESCED because its server died may have a
new server fetching its commands for recovery at that point, and the
cancel completes them without marking anything:

    new server                       QUIESCE_DEV
    START_USER_RECOVERY
    FETCH part of the queue
                                     device is QUIESCED, ret = 0
                                     ublk_cancel_dev()
                                       io->cmd = NULL, command done
    FETCH the rest of the queue
    END_USER_RECOVERY
      device goes LIVE
                                     ublk_queue_rq()
                                       NULL io->cmd

Skip the cancel when the device was not LIVE. Its server is gone, so
there is nothing of the server QUIESCE_DEV is meant for left to cancel.

Fixes: b465ae7b2524 ("ublk: add feature UBLK_F_QUIESCE")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 39eb7775a351..0bd0b95b3217 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -5413,6 +5413,7 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 	/* zero means wait forever */
 	u64 timeout_ms = header->data[0];
 	struct gendisk *disk;
+	bool live = true;
 	int ret = -ENODEV;
 
 	if (!(ub->dev_info.flags & UBLK_F_QUIESCE))
@@ -5427,8 +5428,15 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 
 	ret = 0;
 	/* already in expected state */
-	if (ub->dev_info.state != UBLK_S_DEV_LIVE)
+	if (ub->dev_info.state != UBLK_S_DEV_LIVE) {
+		/*
+		 * Nothing to cancel either: the server this was meant for is
+		 * gone, and the commands of the next one, which may be fetching
+		 * them for recovery right now, are not ours to cancel.
+		 */
+		live = false;
 		goto put_disk;
+	}
 
 	/* Mark the device as canceling */
 	mutex_lock(&ub->cancel_mutex);
@@ -5447,7 +5455,7 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 	mutex_unlock(&ub->mutex);
 
 	/* Cancel pending uring_cmd */
-	if (!ret)
+	if (!ret && live)
 		ublk_cancel_dev(ub);
 	return ret;
 }
-- 
2.55.0

