Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201926;
	b=ZioZtNGncoFonRwKXymuaX5sZr7VFdrpb9cx5iI7+SRbp1HY6nt2mJZa4SdbEebb7CoR
	 /Y7a/y9YRsHiX3YgeGmnDUpRuCKe68uZeVsCnIoGQzEhbYgdxqe40jjuLWXdfMeKhfFv7
	 njYB3O7xrHwVM545G2xavpUEZRE4aXg/Zkc7DbdO6l5FsEQIXB99H+oZf5WWlnrkJdDXE
	 ipvyP/T0deCyBNFgP74qZkhBhdCnSTXTX31RD/5AfXArHPS60aA03bs5NZaX7Vp7+soJA
	 YrEB+7s12Ec0n4qcVGJnAHaXSfYhdk9msClfXCUgsC/uiNrOgL9pRUFLOdgNtqLme9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
	b=Hqw79Rrm2IRhg0XxYtl19yj904nr9fOp0qMFqNHBofdnbQn20Sl+i4c6L51uGtoqyWmh
	 pHMqYfy1wQROWzD0xYH/iQFEoszdBPuGK9p2XXTb2Lwb63pOThsQEU39fOped/O0ziblv
	 8n/SiFZMHjAXv2OK0k84A/52y9LgtVqpKDcXuBV3Uxjx6dHwsABThmQqgJsTeZK4pH78+
	 1rzcHjeV8qffs3aT5yW/xvgU/pK3WoLWDvhY1LPJCLMIAARgqC1sp/fWfWvCEyMUAZeOW
	 jM6XHob0yyxSc4IEg1BTQRezxWCbGAwWA4Q5aIvXJr2sc9rw2KiRYDlIfHAgaYoVIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hKEP/gEK";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E418606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E418606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKEP/gEK
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so8277165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201925; x=1793806725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=hKEP/gEKUYLr8D7nq2JxSF6ZTqSPzguAvT4YWaVchly4Ievp+dObsDrEH0nWF4DaUk
         6zJebS830JikDn6VVPmkdth6mGXrfFfoF4g8nf42I5QWMiOMWXlhjyRNwct8NFy79J3z
         WdH4E6Mb6to/wtT6VetzOIgxinNmqcdgkYRbdZZkAXhSDRBeKBNYWMLqvFKNP4ncB/0M
         T0QjsPTiii0fzma6/ddNuzqD31lei0VvoR1vgu3q9AAKJ2guWeGIFMVQoy5xPb2WqAqH
         MU7raSecMWNESwg4yCqKobFhraDCOmYVS4c9HoxxUKH2JbolUX1buKVz016g7ffYW7tI
         E08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201925; x=1793806725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=pxCyoFP2Udxvl0HQv7cNmGHsRkxwNrzvern9vgFejJkLpBUuHABkHc6O8zcrhc7zI9
         BwB8sPa+6ojSxlW19kZUcAaxEok69X/bHop8AdvncQgr/mKfQeOJ321X51NeQsfc0J2U
         wWxEFMP8MRCC5jUY/9rl8er+d14VISDKuzkaKp5gTThl2a6Lve4XJ7r2STu8xwnPvKr3
         V1Ir70TdI0gH+o5iKkpQqzs3ExvJFN4Pzd0Wx4yQjLsnAUDS6OG8EbIJP1LY5k/n4AeP
         jxGkZXItH22JS6hJdkqrc2hv7gN0peXDK8+U24P/DDxtfKRgVaRaHo/UHeVgjUqYoL+g
         MD8w==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZOIFgZdE3Z3f3+0+tIS9uOVE2xCBN1XMyKNT9Fzi8IzVRWcxnpUhb8JwS6Xz9vUNCCZK9MFEp/ZBbj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxWVjBjHnV9wukm1/dCUiXlpM5AVlKoMzRGQKLSuHTH5yuRCeK
	bv8R2uRo/HKhezaPFAjGLKmn03zDLQ+gFYsxs/88jTzjK1ypzpaZQc3D
X-Gm-Gg: AYBFou3Futv/2P+9NzLHY6lHwfGQGqLcFh9U3MXO+aMbEIWkqnMzWLD7HL1DviRfiDX
	LlqCQ8WQLqkqaWo01g/38Ng8ghjPWHh6RA1ZH1iyX6bvYEz3uiYADW01/T43OxZ8czy17+lJFNX
	QesvZedVkiRVX+2yN+QhS2uzkRT9zZ/RfnwAKlKu9hgdkAEVj3ddGmqaMcckaA91sFLUD6tTmYV
	s/mlSEVi+mV8VgN2HZrc/Fd8NYtaU/9J9/c+ygeMOa0JnrsbIMVscB5DoWRnJlUdNYBlWZ5VncG
	HGb1i+JBuQXG2zH3mArB8WaTq7kNnnN+0yosimp9ts26tEEGoC0Zyx3F+03NEW3g+dB2iUp4uBI
	7PY5wDlJOkgF+uu5JFxUGOtiFXulKua5eIL6uvOTiJingpBkXRDuyAeSHhRV7abMbcbHT3Pm71U
	8Q8VIxPOMl0KaiB1oODXOkuSiFVT5KQyyH1aN0zhFB07gXkCDBAlSfz2Pd0+Wlplrv++lHB/8xf
	0nG5ht8rMFJwC/nVsWOnUtC3q9i3Eq8nGtJEwtL74M+v3Zfwftgq1cJBsl4164p70ZUkNIiXslJ
	eDAr9IsnRzOCRtH8BgA+/lVvCniHjL31hrYPJwkS20OPIwBf7zIfNBHvBu1G3HTFtn0WiLpAUWH
	Pnw==
X-Received: by 2002:a17:903:3546:b0:2e8:5431:d18c with SMTP id d9443c01a7336-2eb075505demr12002865ad.40.1793201925375;
        Wed, 28 Oct 2026 08:38:45 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm23407625ad.59.2026.10.28.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:44 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Wed, 28 Oct 2026 23:38:33 +0800
Message-Id: <20261028153833.3204829-1-lixicaicai@gmail.com>
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
