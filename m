Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86D4F475A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560283; cv=none; b=azihvK1BcyNAY29iNogZ10hfomno1NQ/KG8YJMM6nuHqcjlj/4ZXaIExzkYVsFT5FPkMsYWQ7cuX+rieZAREcfQ8m/KP4TH6QA5QbaWa4pcfjtLmzXfg97T+qz9yZJ+dwErbtdMg/S6ef2cV3LHvieRmnWJjk8fBW+f3tAEzKPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560283; c=relaxed/simple;
	bh=3zmL3ewY1kdparMjXtYd5YfgrB/htIhzolzkpwgWTug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIAfbLiDddPiKQSbbj1TglguBknhEppQeHx9meBOybaDSHm5iEyJjnC0gRd8PDXhZxJ9/FoJ0LLTxHk2aPyRLQDG1RGsTFqF2vWKSTRjkMm6ef+iSWfMk/tjcezKVQ123LysxN72gMjztYcwgqt10PBmIDt3qQDRgm2brE15Iws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN+p7ZKp; arc=none smtp.client-ip=74.125.230.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sN+p7ZKp"
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-3a34f24f409so9952971fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560273; x=1790165073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmdeb4lnNoJH7OwXB9Rluaec5aBqbfZHRKlp2w9jCKQ=;
        b=sN+p7ZKp9bCgL7VATsMW94k9bC1dZX8SmkLo5Oiq+Br5hgeHG1nkXECrtZKy0URCsj
         9RuV0QurShCZTjz8Ros9NwKAQBjCiS/YXdQQw/qykGEBfXf3K+R8PFuLfkoa6+D1t7L9
         uLYSlAX+ThTLLZhZFcR5hU6TRL0u/OZL/ndyXsVOiqWZL5a3dR+OEAr8S4hO42ACp0sV
         Jip2Na1rOBw+R7kdv9EDiF55eWBOlMdGcLMFnqrkVeFjKqDpFr3XvS/l2Ks0RUcU6Lsw
         Cb6mSZoqdoJF1o9Wr0jk4zCKlM7r7w2gc8/p/0bfaFcCz86T0OtHhm5iqZSecRU7/7l8
         2U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560273; x=1790165073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmdeb4lnNoJH7OwXB9Rluaec5aBqbfZHRKlp2w9jCKQ=;
        b=1YKhfI+f/wgVnFnFDUJyt3sHHbKDlT5Gv5CdSY+dldgOlb/+1URjoql1X4mAFakrRK
         Dy16theVCbqRF/HLQupOtGOigCZfBzvgw9BDj6eh7L2cPqyPjVd2AWdaR6JjkE4aWTHW
         ZmEjVpHTaOC4y2cpYtSmYcPh5Bm1CGPF4qch3My9K4Bk8Hp5gtuyhR6sbcPuWsfrL62Q
         Ud8V7SmlDnlmmi0CM6WGKmq+xQtCSXpaKnWAPYzsVSJT2wr6EljsoXxU/5c4ZmaDQZ96
         15cfShSCgLqsEcs+QVYYN6Mmv+77/3WEbyj2f9qY3YTrRhHyCYaE8ocmpRHczb6WcSMw
         teOA==
X-Forwarded-Encrypted: i=1; AKwUvBwSt1Zln9zQ8pxwGtf6y3E/B0V1yYnc5KD7P206AVS0/CQqCvYHeqlgKH8egRVEg9VnYTTiMRG5F/zimdo=@vger.kernel.org
X-Gm-Message-State: AFuF++kxneXaxG+FX51d2I3ibkfSKT1HZBPipzzkaK70tHmyyct8m2FQ
	RTFOrBkONj/sy33jgocv3otUF0G8CMyd/RpygUFAHnFq/xe07AJj6e6I
X-Gm-Gg: AYBFou26uQzBxmCQL6sVMjyBzM7CufvjR/JfzAyNpYdYC/x48mZ3aNeBm4QLLhcU70D
	CCBkO8gSg8YRn35Jd5K5KlnL6DQthLKmdsqO60m7yxPwoaUlpsggnYaV+y0by+uFE50SnHRffFD
	4QpmPGQkblWGrtkt+cH65IkhOTRaV1szWwlDrmTAb3/VxwZu3yf3oV0AQNCbm3EZCJrQu0RVNsD
	RFq8dfr1O1yBq2/g7/70xHtTkmWHWEpHRO9yX50PVjrBiN4n5t+h1q3MKkSXc2Ck4lmI2x4KaNG
	oCZEr2LdtrZx0OInB2r3xCNgVYLYp/Of021h9Z9YGlyJwsgGHOgwZcdOvfDSRaGZmvWrdlT10Ml
	w7LQfm/meJywd/ZbZhS/5diTubIX2zBpxM8W/a9wye6VU6ggZVCKJlccmBVqNRXOyTX1FCfzvhj
	G2htLjwCPVAqFRr0Y24IO4bDnNCVJft5/fWH7lPxHTVY4I8Rapj/tuxvm9MAU/XVRY50PsK0wjA
	frmJoPmNvjIqCln
X-Received: by 2002:a05:651c:41d6:b0:3a5:b0a5:3ff2 with SMTP id 38308e7fff4ca-3a5dca291e4mr10260111fa.12.1789560273060;
        Wed, 16 Sep 2026 05:04:33 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafee366sm5974541fa.42.2026.09.16.05.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:04:32 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 5.15] dmaengine: dw-edma-pcie: Reject devices without driver data
Date: Wed, 16 Sep 2026 15:04:06 +0300
Message-ID: <20260916120408.145211-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Koichiro Den <den@valinux.co.jp>

commit 11d7cfe0c119691b2dafbb699bbca90258c678aa upstream.

dw_edma_pcie_probe() treats the PCI device ID driver_data as the
template for the controller layout and copies it unconditionally. A
device bound dynamically via sysfs can match the driver without that
data, which leads to a NULL pointer dereference.

Reject such matches before enabling the device.

Fixes: 41aaff2a2ac0 ("dmaengine: Add Synopsys eDMA IP PCIe glue-logic")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260521142153.2957432-3-den@valinux.co.jp
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-72147

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 2c1c5fa4e9f2..84d5a1d1b2a8 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -151,6 +151,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	int err, nr_irqs;
 	int i, mask;
 
+	if (!pdata)
+		return -ENODEV;
+
 	/* Enable PCI device */
 	err = pcim_enable_device(pdev);
 	if (err) {
-- 
2.53.0

