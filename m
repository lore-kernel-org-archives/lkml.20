Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161334;
	b=muWJFenReZA2/7h65DyGkOvNLJSaqh+KkGGco9Y+/0Oap8b3h8gGN3zZxnqy0QatBXuc
	 ef7AvO7wpy9b0mx5pbdWKBHKN+jvq/e5p+TnMz+6+NI7DMyI5cl49+wFlsh+TFniBZoaF
	 Q+v7P6Q0eTjHdSB3ITl3D1wXSl23L/8CAIanvGx3e+MNauioDwHI6xOWYgpmV5l3rWZ9I
	 w50lFlHnJtnflnR9MWal7czpcoKDnLmQ5sEOo7vA3HcU2Wvc2M1Nh7fnEoYTbdzkb1Q9D
	 1+V1GTCfSh2oeB1zIHC6nIbWwel6Cu+dare8fTLUIePGbiaI5lDW/FA17HbmhXKlztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
	b=Ec/bOubsex/6mK52tLoGJVl/Rd3Z3w0zDJpop/EBCE3AhOUmEQrp+zPJQnJHwq/rtLEO
	 7eqYKkQBBuzxUwVeaHKN+EmyW16I2JZNPo7YG+a6SkBx/qvPkxCXu6MioaJ/EyiA+9mBt
	 70Ak8no/dP8yiCOfmzmpkXkBSbf+nT/h8XiJiIrDW2h3RWEeBMKQCRLF5kBehfM/YtZRg
	 ARzrbwlIqpYiSzU/2OJYx2F2UgPzOh/dzssWkTxjfe5X/OAaJKIBSPg3DR1MUo7FJeyC9
	 TaMOzAbu2fX5KN8kKUKs9JtuA9Lnyztx1xO69PHbR61YaAnBkpHVmAQmZduZCBrP2Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mF4FTmj3;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6CF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mF4FTmj3
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab938dc83so265308a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161333; x=1793766133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=mF4FTmj38pAGHXadnKjtk9G326O/vs00fuTyYPRkiwuzvMOUb9mEajsIYRQ4h9VOgH
         hKMqNcKrw1cRwGFQr7ZeXwiMNXnDUr4cadQNiTXxwr8tmXDWR/Oea125qaTgLiahyhxp
         M/Zhb1amw4k38WHgDTg66sl58Rxf32g+qYPTOw/LT/jY0CZo79TytuB+WkUVtAOGvvSo
         PsA/tADE3hvQLwZdtjcH24fQD4ygtJ8f0h3Q77EyTsNV3ffdXMSdtm/QCjcq4Tp6Muo+
         iCB7O0RrGkGQRaKmuy0MsjANbRUsuRCxWbsemvl0m7PM9CtOcZgE24zTX5pt13qX7AKS
         XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161333; x=1793766133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=XePMGVUlmoXwtSYT/RSdSankWNM9m5cPl/7OPUbJ/SO4F6fjcMV+fEtE/9V2vWZTzq
         Nm5Xul6nzj9yhRtXOxwfeNv1ULECn80DyiYozrIzvEujFqivUzruU4rWa050DZ6wMZec
         GcMcEgZs11MAMrnej8wAMRCgr/aeFauX0etb09CvwCAKW4YpvSqsySgSKeAfcTeCLrTO
         OnQbrtN9t/cBj3KOk7lVaiPoqHYl1IPGjeTH2iY6lKMWMsFVQ2osQHgrJBEcOzdhoyxe
         BQPR9F3CWFbol8AS02ULMa3KPOgOJs/GKPHsTSZ8XWloOsVCKhwzYZKcEiRzX+dIu9nK
         WV1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7OAdXHBq+Soo4p5pYILAtWlhrbAD9O4SHtkaal2Dn6AfJ5YDMXZs0kwqz1ZaFeOKJsMWVWftlvdlP+GE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9C5wykZ2IBRmRatUQLIjCT021Aeap44urA3erGu1JpUDIeh+d
	SGzltPA72+oDjiVGNSkEV2SGupJjuyJiGIUGxeoxT0PNCnNMYBA536ZJ
X-Gm-Gg: AYBFou3A8lrgyagzWKWgNvBBo1YKkDEZnveJmhub5kBCfBFnvTKnTHKpi/V3S5KkrKc
	mqevEpgT0EknB1BSsi7Zi2u/7ajAwYp7jogbkstevrqNLjq1pd/Fb+Zw05F27omoUaJilozoBU6
	XneE8fQUHI04OXKzC8M1O9BARAjwE9bsOxI24bin8hCTVUlZBzDDOHrxmnnwcu48K7MoGucVdzW
	iaFSnyBvqQT90IvPv9+HnIaEJe2pxe0BI4nJpnhF1fYxtCuXXujpOW4nXXFwS/rMiKrChmmYjY/
	26FoBpb85mkxtAPDHT+WPsmpJYDjDRoOrRtkFVleFT4qETXWtusp3550TykOFYDdxgbDp9CS3qX
	wruC4b1P7KFfyG2v/U88gh0SD2HNSJOTtMzldcFjIpzSVnT8W0vtbdNxQN/5dK8Irr8crdbALch
	d1YCDsHxh+zg5pY1i7mnskSMWxBKlk/uhUxioakCky67hCSee3vMOK3FajcATPZNvDuL16lnbW4
	80fMrEUUsVtKM2NOZHXzSvBUGVnT4O6mFBEujyJ6HrWd34ws9XC25j7D/YC55Y64nwVKXME0KSD
	7aUrU8it1V55e5wzHbj09IxpGOZlYZVC78l7VZpt2DpqBCtK8VzpEzkvgq6ghBTdXRKhuQ==
X-Received: by 2002:a17:90b:3e87:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae57e2f423mr934737a91.8.1793161332890;
        Tue, 27 Oct 2026 21:22:12 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6cdf649sm16060395ad.72.2026.10.27.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:22:12 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Wed, 28 Oct 2026 12:21:36 +0800
Message-Id: <20261028042136.1622059-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head.
pxa_camera_eof_bh_work() calls list_first_entry() on &pcdev->capture
without checking list_empty() first. The capture list can become empty
between the EOF interrupt and the execution of the queued bottom-half
work: pxa_camera_irq() queues eof_bh_work on system_bh_wq on every
end-of-frame interrupt, and if the DMA completion path runs first,
pxa_camera_wakeup() removes the last buffer from pcdev->capture (e.g.
with a single queued buffer) and stops the capture. The already-queued
bottom half then observes an empty list, obtains the bogus pointer,
stores it in pcdev->active, and unconditionally writes through it in
pxa_video_buf_set_actdma() (buf->active_dma = DMA_Y) before starting
the DMA channels on it, corrupting memory around pcdev and likely
crashing the kernel. This was found by code audit; we do not have PXA
hardware to reproduce it.

The sibling function pxa_camera_wakeup(), which operates on the very
same list and sets the very same pcdev->active, already guards against
an empty list with list_empty() and pxa_camera_stop_capture(). Add the
same guard to pxa_camera_eof_bh_work() so both consumers of
pcdev->capture behave consistently.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Link: https://lore.kernel.org/r/20261023073437.1517305-1-lixicaicai@gmail.com
Reported-by: Li Ximo <lixicaicai@gmail.com>
Link: https://lore.kernel.org/r/20261023073437.1517305-1-lixicaicai@gmail.com
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v2: add Link: tag referencing the v1 submission as requested by the
media CI; no code change.

 drivers/media/platform/intel/pxa_camera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 2269d852a..73ce48650 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1161,6 +1161,11 @@ static void pxa_camera_eof_bh_work(struct work_struct *t)
 	cifr = __raw_readl(pcdev->base + CIFR) | CIFR_RESET_F;
 	__raw_writel(cifr, pcdev->base + CIFR);
 
+	if (list_empty(&pcdev->capture)) {
+		pxa_camera_stop_capture(pcdev);
+		return;
+	}
+
 	pcdev->active = list_first_entry(&pcdev->capture,
 					 struct pxa_buffer, queue);
 	buf = pcdev->active;
-- 
2.30.2
