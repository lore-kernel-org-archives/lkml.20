Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B83A5436
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525971; cv=none; b=dBn/veR5f9SWMQWzZUSLC8yHdNfEybPt8zrX2gK+9KbQgxy9siMcxcepS/+OU45LHqDQpWhjABpGPONC1mguCGD2RgseQCYrli0/fImU11PTaTgUhtlUCZ67z5FsEytxYkBMBAcBM9kV2m2DNJepP8nDb4UX9eSjAym/e2I9xNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525971; c=relaxed/simple;
	bh=SuQIgv0SEoKEEDd+zO2LbMvRV51Ofr7lqHjGiCkVtvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WqPXv6TWcjzwAJe570aeIevrRFlY6gF/hdq05FvVS2lL2UBu5HG1Wta+a5CCH6bztOTtI5gS0U6wsISoRkX9L/8nQh13wtoPWlQgk6575jw/5P6XeA1lOl4xi11iE2vTUluQcNbh/lD5MZf8e9GgsVJ+IoVQFfxxP6ck0AwTCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU+wJL22; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU+wJL22"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so4413115ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525966; x=1790130766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKzmIBjxPsY9wwxZ+pV+iWoGbpiC0lGusYTUQ4D7CLo=;
        b=XU+wJL22/Nooco/rx5ryPoSHFCHZt/u4d7Y1Tewc4L2QMehWmMJqWcDgYxT6B/yuu9
         jcv3QLCFV0tWEwUTai0EZZYjmdKD7N2pBdQXGV1oO7+Lkie6ZHMzeIVRaH8LPhHOKGfd
         tYd+SnrqMUtFxyJ4E9WNuMc5LSNlo4c8oOINJTkVys35TvsoNbSdHAHnhMkrKcfuYibr
         l+6YEDOx8Oxoi2l4z/fBTeZoBF9d+UD+euft+9Q6iSfSqvMC46FZirsXy8GKrqa4ahJd
         5YlZ2XmNlr1MhRfHN24V515fRrawxC0A6BLx5nRMdfbbtLDyEn0o3Ey/G1lsX1xj6H8j
         708Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525966; x=1790130766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKzmIBjxPsY9wwxZ+pV+iWoGbpiC0lGusYTUQ4D7CLo=;
        b=1rBiJPx8XPxGc+1+b3Hm8Jd7jrNtYFZjnec8Hthsg19oj7yFCO3hx9AecNVydj05Xw
         TCy8kPzFuD5azib7vwDne309lEePcDWUgI7BCUk134EHKRToqWBjmZzCa/+s10byDgfC
         yFXmFTILWckpDtZWkTxs6JnncZFS4ph96DkVfD1lGWvZj7rWOH/bPaBaOUKYD4yyA2ie
         PHjCRSw3I0qobekbksfH/WBVvu7k9h0EracGnQ7F1Ev7N94wXYiY6/09Al43HdPVxTjR
         LiG7MAGOc6L34keV5Q9mqnKYrHpaPkjp9VDS5s62Nn9V0okIQCVhs52nkrGCXIau0npG
         VEZQ==
X-Forwarded-Encrypted: i=1; AKwUvByUtj4GM2qOGUbkeJSKnWT6LmvhiHd6BSPklP8lOcQhAwKoN2iu58qBLvb1goZqA2GEx4vODaMAkYL6r3k=@vger.kernel.org
X-Gm-Message-State: AFuF++nx/QPvv9IQ7kZmh3x6EnEfnInVSG8H6sxjOM7nI3mGMD3xo754
	u7b9kAn6f6ZaeP2GZFtSQvVoDnclSR8ATwXeRGzVDx2gd2txRnFnQF8A
X-Gm-Gg: AYBFou0uN9xXVY3XoPEonC3NNH6FtgPje+MzWMNJQVaaRnZ9pgPV0W4zV/PpqYE9pNS
	63mlKXkH7Ck4+x67ORkbXQaGHtric5nXVY7alOs01GMooqs/DhzrrMM5DcI7zQ3Scp3IaUtqNNN
	ZFqSi1SCKQW4L/dqfdxoTA8T/HuzVhkjpafohxu3aB7kL7MtDonV3Hym3SaLplHMapPc+YIN2aC
	kmJqaUm4GmrHWDp+2sUuIBp8xvMNeNXIiF1ECbRMAFXXLkFTtp5VImQ7Ed4hmX1tDr6AO2gaVll
	cJff8kseSacpGYT0ZNStktFXMK6szSXD/pUR78o14k7lQ/i4QBXtFx6xy9+l4K1YgEDfXJxCwjl
	hvvTBiKH99/qQhTnhpgDGAlGUKLzwyWq5Rqw+08TuDssv2pAQCUQpGqmFGaVZkHwPH3lPJaWiHi
	ODc7Tv7R4ZA/EOAB0ZK4UOivT0QVoqXHJLV/o1Yj4uAlCiWBDw+MR7aw==
X-Received: by 2002:a17:903:19c5:b0:2db:8019:847a with SMTP id d9443c01a7336-2dd8e012174mr17506605ad.9.1789525966646;
        Tue, 15 Sep 2026 19:32:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eff35asm3456075ad.58.2026.09.15.19.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:32:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Netanel Belgazal <netanel@annapurnalabs.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] net: ena: fix MMIO read buffer leak on probe failure
Date: Wed, 16 Sep 2026 10:32:36 +0800
Message-ID: <20260916023236.2701485-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ena_device_init() initializes the MMIO read mechanism with
ena_com_mmio_reg_read_request_init(), which allocates a coherent DMA
buffer for MMIO read responses.

The normal removal path releases this buffer through
ena_com_mmio_reg_read_request_destroy(). However, if ena_probe() fails
after ena_device_init() succeeds, the error path destroys the admin
resources and eventually frees ena_dev without destroying the MMIO read
request, leaving the coherent DMA buffer allocated.

Call ena_com_mmio_reg_read_request_destroy() in the probe error path
before releasing the remaining device resources.

This issue was found by manual code inspection.

Fixes: 1738cd3ed342 ("net: ena: Add a driver for Amazon Elastic Network Adapters (ENA)")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index ea89619039d8..86ffda1c8632 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -4122,6 +4122,7 @@ static int ena_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_device_destroy:
 	ena_com_delete_host_info(ena_dev);
 	ena_com_admin_destroy(ena_dev);
+	ena_com_mmio_reg_read_request_destroy(ena_dev);
 ena_devlink_destroy:
 	ena_devlink_free(devlink);
 err_metrics_destroy:
-- 
2.43.0

