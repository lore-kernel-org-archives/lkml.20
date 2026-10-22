Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645117;
	b=OuNHtITwVoiszp/lTlBI9W07J5V11diSvl6BTR5dO5TSs1Lx5CJEQv9DojhWhQmgaY2N
	 ebq7haeqNxQul9Lu5ENvMe8WNWipyf/hCSkzibiFCAwNqY/h+x4vqdad6e/d3VM70R4NT
	 cfNtkZYmAZJnCYT2zSdaf47JjYDfEcBD/LUYt8fbMNPPwHkcB8WQ+1Je8xgd7Mlh27Zwg
	 XxVAiosRHRkDYKOcQKc05J7Knvv98brzsAY3PkzXBh8DwOyMeEcslCl3zE/rYFsVxprM6
	 pVddtBEEbCzg0y5009/m6tBhxw2ETP13UKSgIqLwpJu+E+WhTwu3SM9GQp5cbx3MVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hGRhRvri5RD8Q3dYNBF9nbwsKBlQUd9Lj9QWckhNeYY=;
	b=f3wL/iedP6ubfQQ4Xm0O2AfJ7sB0jP6yHksjQVVbn98wTCaW8jL0srXPvV1C4rpif3Tg
	 oBRDA8KD+EsktqyE9NHrW81adtHmPj+GG5pd/tQeX64kdz6sIVAN916kY9jp4KAiGVxCw
	 pC64fmzuQ1ClfiTSjLZIgtjo9m71r1pL3OdHAFwhFzUL2TWi5fGDf/OhVsHynMEejvKRx
	 DdZ+7kbP0vrVlXMBM7PPZFFdsoVP/rajVlNDMcBZMKYjuWqEOAIFQfGq0Y/Wl6gTyOuBf
	 UktttZMHcwRvyQxdUYlt9xtS4g4NqCWfyVqaT7hCjkRXAGi2ydkopUvssshdabyknvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VhDHru1h;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96089606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96089606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VhDHru1h
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53381e53b80so15950101cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792645115; x=1793249915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGRhRvri5RD8Q3dYNBF9nbwsKBlQUd9Lj9QWckhNeYY=;
        b=VhDHru1hT4WrdUrhcaAT5UuOj5mRj+w6P2PcS+azAUXcNXHOaFTiSZxtKrEr+PVtPC
         /pIuZW9eG9MheIwQgaUjd3VyaIqqAa+jWmDJ0lfBPkxs6vXHoT4eLJvwY0IMOtdJW1XC
         Ek3EthCpeC2aAAgPYXnBajlKwAQoNi8xwQJ9OMIfRZi/DcHYruE1mg2vRkgLNDlRFbke
         rSSiKVb72MUQTlVCloTV+tBTGaakUKBIq5AsBFsNUOSnpQx8U9/CN0k72EkCsTx4fhIP
         fa50D9DuBMvEAv8dmtdGepn3B1GMGoJfx3FKruEr4a9oBcFU1rRsX+lwUJIsNa3eCmZq
         9Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792645115; x=1793249915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGRhRvri5RD8Q3dYNBF9nbwsKBlQUd9Lj9QWckhNeYY=;
        b=HY3DnAshnBMyb4klEIvufaKcSjPQziT4IB+/9b8Pr0QDdyvMkzFXPdEiSMjQ6d6Ljk
         9llkGh1TKTan39/vfOTy2S9yUvYsJNdD0EnFRrpqWPFZARYvtHt1paFKnn0untUZlfxE
         9AKsZh4hG2rGmiM+X4/xxQTjS3jtj+m2MwsmpCSP2GXN5ke7Dna3YUFgoDS16s71qdt/
         Cp4mLj2lS07mHIvQWUlDPLNPCYRAKZmhdfclL0+p7ImhzhjxWamDe2KmwpcXMNeXNf1r
         rfxEZD8sRhySrdQ7vXiz4WOATrOGjbbcywmeyrFSA3iADqcwjp4nz7xOs6hI/D2RSNr2
         cGPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzhVQiHCRJxYBua8XrTM64y8c1HqvBk7unFs9QlTDhnWLtJxdmIb0xEPXrDRjSAsXFBdMDbO79F/LQVgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0jmiHi2oZpP1BJKv79HWigeFoONj3dUUGzZSX5Cq4g2hu8HD3
	OD6rQVWl6/OZP92u7cj4H6Vm+sUuNzag4Wr9verFyogquF5KwfeR5A1x
X-Gm-Gg: AYBFou2EyWZAD4n5mqDObtaaBc4SHK4GOpew1H06Lk0X7/U4vYsQzi7PQGHU13A4NrZ
	znHVaKMUHmruJaBDLiAREJkSdfnO6oq1o/Idwjud9u/J+sIEgPBD42oqyyRiVClqPhSJW7c5YXi
	AG8oTc3uPrVQbDhrrm1hBBx94+cUaI/g4b2wE2RJ2E0p5E22XietW8rMVM4v2iwGAxIRSIu5uPH
	LFpALXCWqUVQyFb+QqYSBXUsKs3oGfNEgUPi1kocUFRN/+MN4O0Aqa9CL9c4rTGZd+SuXouq2Jo
	QlKQvtp0adbl2E/JxQ1ZQffg/wqPmFgcjjoUpwluQ7GIbmwMQGceOu/99mJ3aGAiPiclEbSZ9wz
	Td0uo1fqmm+GHDFRFFEUREzk9qDPust0Ix+g8KakncpgSTUJlg91HKj29oHOAbnwAERcoAxrcZ6
	vxJiazdAsP4rZufORTGBj6JNXbLumDbniAT4PBbxhhHu9A+TlzE6SGwJPvW/GIuK53aBmspsF7D
	+/Errhxftz+7oS67x3rk42D7eGAGT3XOSF2TfRON47ISRQOr2OZBY8leYHsrF3r8huAD647L5hd
	1A8=
X-Received: by 2002:ac8:5d41:0:b0:536:5783:43ac with SMTP id d75a77b69052e-5369b826136mr64421541cf.35.1792645115375;
        Wed, 21 Oct 2026 21:58:35 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab729156sm17857071cf.14.2026.10.21.21.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:58:34 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] nvme-pci: shut down the controller if disabling the HMB fails on suspend
Date: Thu, 22 Oct 2026 00:58:18 -0400
Message-ID: <20261022045828.1392332-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

nvme_suspend() disables the host memory buffer before it moves the
controller to a non-operational power state, as host memory access may
not work in a system suspend state. It only treats a negative return
from nvme_set_host_mem() as a failure, though. If the controller fails
the Set Features command with an NVMe status, the HMB stays enabled and
the controller is suspended with it in use.

On resume, nvme_setup_host_mem() then tries to enable the buffer again.
If the controller rejects that, the buffer is freed while the controller
can still access it, and the reset that nvme_resume() falls back to is
not scheduled, as the controller is still LIVE.

Handle a positive status like the power state change below does: shut
the controller down, so that it no longer accesses the buffer and is
reset on resume.

Fixes: e5ad96f388b7 ("nvme-pci: disable hmb on idle suspend")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found by code inspection as part of ongoing, not yet
published research. It has not been reproduced on hardware.
Compile-tested only (x86_64 defconfig with BLK_DEV_NVME=y, W=1).

 drivers/nvme/host/pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9..268d8fe0ac90 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3997,6 +3997,14 @@ static int nvme_suspend(struct device *dev)
 		ret = nvme_set_host_mem(ndev, 0);
 		if (ret < 0)
 			goto unfreeze;
+		if (ret) {
+			/*
+			 * The controller may still access the HMB. Shut it
+			 * down instead, which forces a reset on resume.
+			 */
+			ret = nvme_disable_prepare_reset(ndev, true);
+			goto unfreeze;
+		}
 	}
 
 	ret = nvme_get_power_state(ctrl, &ndev->last_ps);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

