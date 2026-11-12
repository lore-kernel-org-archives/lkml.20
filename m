Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481319;
	b=R0D/zJ21f3sxZsueIh7SpReCudJTfxYVKXiTMMX5A2Iuhv6tkjw/k5QrR3ZAminek/ae
	 oFUyUSY4WgNkbGc/47D1gFMhDhgBdIm34hto+IfoC74uAMzW/VFZi/7tlgpJewG2aiHEB
	 k3ExhyXhx0xp/LwiLnRwZKK12p+gCL9QkAa4vne2ZsYzfLcIMMppI2hmK1jB8oAvJ/g2h
	 z8fW8BcJjhdFthQJm1P1iLzobSbo7AJom4I3vipfIz1K25eEzKDr8CZBcQHrnzQ+jlRIw
	 RMMXYRViOCALWgwrAZApC2l8YV5k5sEKhk/ucEP9aAaoObbxco1WnRkra5x+mjh3xjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
	b=WCeG2PqBIzHHqdLyPBAS4kMwxT4pdrnFejP4T+deyzYcCQ01JMRs8OnlTj2OJ2aZRm4n
	 QGR3DRVEF/S07F9tO+wox+V7QibJoQ/6wfuFhsrjiwoN1ks/LDulZTSDrCH40V+1zzvTH
	 D+64r+t6iCdGkXrjm0HQQIsvJB6iLnxJGt5kzgvcwCKXZ9GLABJOoDguNXaut6VsDuwOv
	 1zu99liZ5WdQtcmvY9FggvmfoqcVlofJco2c1Ifuqg7x3Ar4JVzSVl7+CR8HiIlw0p3tW
	 Snnxo864okY5EBRdJLOenaedLwwyz4Xz9AWbKmlVi3tbO8zb8lNMKAeO3pGPjuvy9pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdZWTBpR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C593606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C593606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdZWTBpR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a215e64962so45202675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481318; x=1795086118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=IdZWTBpRDQ5xZAT7yTt94VHQiSSk7N/muTB1y1ZdpsF+RxvcXpOuu6OmERaXGwlGdY
         JvpgokfrDJbSXXEdUepY4Hg3Xi1hbHRfmRW5ZTDN1WiRM9047j9DtfIrzIXcQgoA5KHQ
         ON19ikSn2rjglTnqfhvqN/JyJjK/pPgVZinrIUSf4OPYFMzEy5bX4gNFLm0hGwYmk1uE
         g7TSAIrbf3itX2iIf2gf47jP5Q22XWSixtJKeLrjNUZ5ciLABAOdN2rxhTcxjBFpVUQV
         3zR5Qmz1WulkdmyTxntVtRoKgMOrJ4P0auA6QdqH2CpdVOLATOeLzOroPG9k0xSIpt1s
         Q/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481318; x=1795086118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=FL0CtDCDw0gSg8FFRQ2eQp/ghTlpbiboS9+elZdqW7wuNeeGljoEL3x98vZPAWlVVL
         3Qi7H4BKOhGJMrNI/KlLOaSoEr9Vy37ZVOUMKmLX0ShlItSMIcWUn5+lNer/71UBhZs0
         d6oGhgsIRnXmH1F7Jn+41SSqnL4zToCCTsnkOJGsTTirbgvKeXD9g0xTFDfmWVzU5Udo
         Nh7w4vAWaacIu1WQi0HxRrDDqOr7XT7bZKYeq7AVotcRLeekpQE4wXsbD2Kqm3xt6F0w
         FIi+V399DssSS07/e64PXdHExoGk0K+kkpuQvEIdIV2+WcN3O5132lH1eLCJcupY7vCX
         L0gQ==
X-Forwarded-Encrypted: i=1; AL+hErG/rY7x5LCbdikPKgC84SIfhlcjFwloNnAddQm5J4TCZh2zLcb7V9LJiN8Q+iUAFk0U+yw6erJzB1qS+uE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S1ApD9rBxAZq7fZ5suZ+bsS2OE/YQrbKgo9eZCDCC/uSCPwdd
	BHknuqBJfkHXkOub2LQeEQV0HQr1Nd/wAiEfCnuPLGGdJXfmZnRJI93lfxKHf9Xx
X-Gm-Gg: AYBFou3hC7pPWp1D8w/+nIxPzQ09c2ZNzGu3mSTYeu7G393sm8DOul8Nqcw/r6eSFN9
	Bmr9PZsZL2LW98YJbeA+GpZpKXyPiVQXqPyeyZSvTvXbMpWa8qPwioCjWtBldj1PFO/jOGsWdy3
	ZVRvbzrGuBLgKhYMOaYPZBsmzd37zmyREWYtbDiRHqWKWCeyy2ODz2eZdzDRQCuCtKPzpleg9wk
	aKkX84ifhFu4TxiYujxG6shjj9cKLMH/A/3budeeRhJiC++MtmhZosDKGJWkEDZInGIQg60KsRc
	qESlyJ/LAqXylRBnFRUqGToE/KA9nAkDvkbDh+y0YV3jWSc/fyKK5Z31mpPpQxJYvBbOQwUNFsh
	gYg4m7f23+FM+9wXAiYTxYnaGtyRFLJB3EaiVbB2my78ZYNBX8JZER7fLH1ButUKOZObtreAOrg
	wcE5PCUgmkY8+tSUKnCJuEhANoQQS0mw3BWc1IVpReIxrQmutZzqwlU2Mo5dU2Gfp5u3DYCkIk7
	4v8Rd5Ba/KHiZd5Hc4uEDFBvCJvIeEi4Lm9W7ZHSqYYIUnWwZ1FU4oaPUF7oIQ2mF/IZkti7YEr
	UOUscju8Bv6lgQ2JVRi9I8/Xa4AH9jtPjP0kaFS5L6KnB4UHdoh7Iya8
X-Received: by 2002:a05:600c:e554:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb534badf0mr5110835e9.33.1794481317703;
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58579815e9.14.2026.11.12.03.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] wifi: ath12k: unregister the thermal devices of a radio only once
Date: Thu, 12 Nov 2026 13:00:07 +0200
Message-ID: <20261112110008.1229-4-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_core_reconfigure_on_crash() calls ath12k_thermal_unregister(),
and the devices are registered again only when the start that follows
reaches ath12k_core_pdev_create(). If it does not, because the firmware
crashes again or the start fails earlier, the next restart unregisters
the devices a second time:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000050
  Workqueue: ath12k_wq ath12k_core_restart [ath12k]
  pc : hwmon_device_unregister+0x24/0x90
  lr : ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
  Call trace:
   hwmon_device_unregister+0x24/0x90 (P)
   ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
   ath12k_core_restart+0x3c/0x210 [ath12k]

Skip the radios that have nothing registered.

Fixes: 151322bccdbd ("wifi: ath12k: add basic hwmon temperature reporting")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 97fc49c40ac1..7707ae4eb683 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -257,7 +257,7 @@ static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 	struct ath12k *ar;
 
 	ar = ab->pdevs[i].ar;
-	if (!ar)
+	if (!ar || !ar->thermal.cdev)
 		return;
 
 	hwmon_device_unregister(ar->thermal.hwmon_dev);
-- 
2.43.0

