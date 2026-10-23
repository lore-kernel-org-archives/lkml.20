Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740887;
	b=xmJc6BDkn1f3XP3Yidow8W9owgLd1LerMGiWHGyeZZVlCFqIcbZZCW+aTonZ2bXO6t3S
	 tDvYUtq6e2sBlyMc59LWGvMbzLjV7NdUeHZTFFmgm0FzyxzvqprXRbfsuOdAWX6gOMDxI
	 +yC8YwnXHDjfCD99QqPNkAFis+7HgVbouxZ6NkyD+fCppU5Wd7sPxTC/yBjUhLP7IV7+K
	 90ZEcl1j3pLjagYcjD0nNAYwfo6L/SC6jFz7OohV/LKnIw7654uHl/WU7hrwJX/n1mvFh
	 zHiZlCI8uPGsrHWn5+96ec+dHVBXR++PfBqL/76hCI/fOAHrwwMwTTbdw2h1xZHKCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
	b=WPMzMMJ5sb+UBnROgtOO8zO4pV6vUdTIHCnpL/PrQmITn548RgBnVwbyvi99/zb8gN8s
	 Nn3n1D97UOEPjysGLpujqlRIHvukY7MrHoRUXroQz6JM0eYOn0CY7IobSxOeeBLQV4sr9
	 pnoTtiY1g9DlLHtqquQB2PNwj2N2W1qIZLC+aT57y8WVpiysXnS7hhALAL/Go27HIiyWA
	 sTr/gQAN9jjp5+hsq43Qmtv4+GonpEq5EizyD8sY5tRVaxdi613xF2hXRSGT3nFAdge4J
	 e6I/UgWjGCmsFU8mrJ5jbQmY2rdqaFv7creOXeuRCelTAWx85NrjLcr64UwkmEp297g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4USJsgp;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E3606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6E3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4USJsgp
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e977109392so2997045ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740886; x=1793345686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
        b=X4USJsgp9JxA5EpAyYe8aLydL46DSNbPwbJi0kiI0mhWflPQ/M/eMTf/QzhvdpJns3
         twae2P3d37YqaRgrpXtg/lw5LOLDODdegh/tw5SMLihERPY17wrrolsYwJep9ZmwUPGf
         DYWsH3E3C5GmZgQE71/dIeP87dCkCeJhxHCwbhI6fBwC3hJ9BjG+pVl5Dd0m8HenzgUj
         jhooj3bqOBBujEfja6XxIIsCHZRQykXaabQNYzI4aekAzXHbDhZ9e8+q8sGXG9VMI2zh
         ivG8/InhY74SjFOVKV+8ZW+WbRAyEwilMCZiOPz7ZBIh9So81GTK76OGG4AYJ01xfraU
         NUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740886; x=1793345686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
        b=idwQsNq1kldzUHAdE3f1yMlpr50+2hUYB4n3ajugtPnq2D8awhwD7yJr65E6ulwnPs
         b93nrxuVMtrHwUrzMxw952vuY7VW1rDxJZpnkHIGwouH7oEr3Ygz/lFFXWj5DOJWLvKA
         fZGcsxDvLG6O0Qcdz/2T3a/njnQ1IfztIcWcZTzPql+/qZi9f+c/O0qrIhJFy4sfISoW
         p4j508/rIezUk63IGWTf2pyDHsFj9NdOfFi8V1B4LUZ417r2C7F+1OZggcyB3eDtKBll
         7KQmVHnyvAgQ737gVcgdhdpcipBwr2hJ6ckwvEDDnRbODOZPbB+L7Yrc0IHZtDeIujKo
         0m4Q==
X-Forwarded-Encrypted: i=1; AKwUvBypx4ZpmOIuHiV1ifGuxE1DWjNIE1BjHwQg9Ev1LDLX1ww+3ZHE1BouA2Jq2Lbz5IPsCqFd6AWEcDMA6Hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm55HtOuvSDK7cfdskWLmAa1GFNIUAeVc0CUzAZC2eW0xO7nxn
	YfO16XWVAUbWfXptMioZTRlxBYdYN846wl/gxYOYFGys6rkivoSZPY+U
X-Gm-Gg: AYBFou0P5mNaLOndCf8vA8WktdUBMzsv9ov1kZq5KGR48AIAi51WfwpBadVX0vpRdFy
	BseJ68wYzDKbWRBljZxtw6c8brdqrs8BP1/Ad3tzR3AcRaXJtCuO7E7bXqSmPAUH5oz1EpVLjGP
	dgHWu4c6hgk9Rw/nJi9Igy97+krAEg3ZCZ8uLNRXT+9LTwRKxcI1FfMvEHkTOzB/wVSv3jIvIVn
	uNndGNC9/VgSNSVfxkFdFV+ySqAIsvnrW5PqRKSgbQqyZg/CUqvcxjp4awoKnRssd2Oyg1SZcxG
	bDnH5zd4sNWpjr4cxWWYqpnzc+yncAZzYOlRgWEG4NCApq1byKeqYpbXrtrviXW0OUdQO+qc+Og
	P9O+WBermmoOIrqnvjB3+5sxzDz9Sj/lK9/fIA5hCKHebW13dzoJlyK0i3gSS9BDlkey7UD47qk
	yk6ynBu5p4uxrNx9XwPKEDyRAEoRVN1L9ZHqLiDjM7xBFFh5v8cuvaQy1pNb+JgiJcgHAj6jMNA
	YYH4Aks5es7bUKIzPwpgA64rQenGC4jyzXmvSkP6KTH74RVzH5cyEDkOEmXfO4LmttIzV8ecQI=
X-Received: by 2002:a17:90b:558b:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3adce081433mr1163793a91.39.1792740885915;
        Fri, 23 Oct 2026 00:34:45 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93fbsm2494372a91.16.2026.10.23.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:45 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Fri, 23 Oct 2026 15:34:37 +0800
Message-Id: <20261023073437.1517305-1-lixicaicai@gmail.com>
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
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
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

