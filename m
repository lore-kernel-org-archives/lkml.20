Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F54A3D48
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686420; cv=none; b=WM5o8w2nAXuq9Qy7+y3X6ha8wN3QBnMYSQvjEcEUgCbx5VMb5EJb5vfRNHkL5q5IC1qGN2cYIs4qPGy/LZgfimFeJj+Aqz+h+MRnCqXg1q1KNlEx0w1paxHCYTmWQJkGwNt4QojhBx0nJjgbPuECbErX3X2+87RJUedOWitzI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686420; c=relaxed/simple;
	bh=VSx21dpxUhIIA4lpOrFPg/4jNiVhr9XfnhyjQnpuBPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHlCPDdaHxP+iJuGQw7J02C0fYYum7B1bMLyG54V5pIym1NJE/zIvJB8k3R90iu02QLbxrCUBkn6NL8NH1SmHm3YJXquS6TMi08PSedYNEhfi6XOsYsV3+bekVGj8Tg6rRh26KTRLhbyiZEBsjg9zrSigsoD4Nz7Nt20ZoMwYzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3t0ArlP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3t0ArlP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso134549a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686412; x=1790291212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq0fKELxNSd6gVZID70uil6xvUxTojj4D/0/Wv6m+2s=;
        b=d3t0ArlPheTeGf32qgzPKvkTHpZzyxzkqRPtGoAYb/hwf8nVMW7mPyvBpHTYP76cWG
         ZRuLGgOgEatUQdF/pY1mwsJDYscGRDIbKjTYbhYS5Guqffi/e1aWEKx6Me4uih34oO1B
         /cilRwD2akAj+B2ftccGU6mLi2FccIxGZ4nA0GTXx5nFEmGmiqwNPZvtxmXOz0N9afdH
         6CJYmm3D1JQ0rEW5FUCuff+zSf0VcbcfUypfY93ic7D0A+BoVQrFS+iIENCUTxtrkxhH
         iyQzktqKvg4t2v6OVNqmPKteKJ33B4waFfZR6MDyMuAcikrrg2qMAikAMUO11JQw0SPg
         kWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686412; x=1790291212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq0fKELxNSd6gVZID70uil6xvUxTojj4D/0/Wv6m+2s=;
        b=JaocennOdZKNBBHevsm317gbC+5lYt91z8lHSix3IW94nAbs9WouPC6Oj/P41uiVGg
         GQXsmiegRv00zBvwcxB65PZBLjZuf+ReQ66FJcVysHJQxxRZM1N4OIDTayAbbh+XlF62
         2UZXaLhRTORscJJRt0IS9d1W2mEpUme7EYKjl07PFmp88GxDnyWpYquDoKeWwoNKRefW
         OiFzrY1C17edyo35Y6Fa41ikpSzCrfMJxMYsaJT6jHzbjMEJ/db7qPhsIqyTmu/VkK3z
         rqEnxa5IE+o77OMmfKzfC3dWTfu+X2GGYMUXYxorVXrY81/txznZkf1BMn1g8+oUNQls
         XKjw==
X-Forwarded-Encrypted: i=1; AKwUvBybx2/uX2f2d4SrDbW5duTge1xSfD9FmjQBMT2f4UFDZjC/CoPBMkLqr/n48T8uGqGIQxLekcSV4HEBB8U=@vger.kernel.org
X-Gm-Message-State: AFuF++m819igL0V03C8WvGVbFvfAbtjA1E2tQ6vOasI/rvKn3N4zlPMJ
	YNl8DXo/M7CEn6FNA2U7u4uX9T/cAoKVKkPiHWiQWQEEHLel0JWAILsk
X-Gm-Gg: AYBFou1l3IGXKRHD6exNdnN8nVbOT0oHMjN6cod0qG7QWmtfDP0RkMhAwxG0xd+5eko
	5Y/TjsuzP+4CcXxVtsOt4KkXNNCMaZfveJ+BlZxjr3blDWfvck6Lfe+sqcQcrx4FJWdYaHzyvsq
	qK1SYMOTYHunG7tYKmUO/DvVXo098xLXp6UTLQmYnRH9dgxMFnMlz7O1uNG7/5+XFWTUNj7Po/P
	XBgNG4rvkuRgnNVBqSpCiOJHyFBtg8qkKj9HGHQpNoXaU/OmnkLnkGDUZBihRFPkmWkEWg4Sdeo
	m7tIJb5BYPpTPTME+fqlHKlH4141wbZmUaIlMDqPL6bpuBwpuvlejO9UW8buzBvprlXCmAu0ewx
	IZmpJPPQ5DTGqRKNDNUPFMZu2Bk1nfPD5WfCGm1cpeKi8bgekRhezCsagAHioElIm/ivaBmfBbE
	nlWSIAKO3C16RFt88PaaoZGR3DTvXyDh5R+3nsMpgAjutM3YW1hzl5ticbJ0SGNTgXoegPzMqfS
	+EXthLBD1YBT3/vakOXwrzFuJscI08ApjPmFk461EOfbCtglJRgV/hYdSM+Eeanuoff2j56e+gR
	sTlazlK8xviIIm+kMnEIs7AHv8i8u9ZZtTI50D4QAObVMZ0+
X-Received: by 2002:a17:90b:2c8c:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e54aa1442mr1380617a91.5.1789686411923;
        Thu, 17 Sep 2026 16:06:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm7079782a91.16.2026.09.17.16.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:06:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Thu, 17 Sep 2026 16:06:50 -0700
Message-ID: <20260917230650.117403-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada XP variant keeps the per-CPU edge/level mask registers in a
second I/O window (percpu_regs) rather than in the main GPIO window.
The suspend and resume paths however read and wrote them through
mvchip->regs with the per-CPU offsets, which hits the global
GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
was therefore lost across suspend/resume, so a level line could end up
unmasked behind genirq's back and trigger an interrupt storm once
interrupts are re-enabled.

Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
both the suspend save and the resume restore paths, matching the
mask/unmask handlers and the probe-time masking.

Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..cdd918581540 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1028,10 +1028,10 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				    &mvchip->edge_mask_regs[i]);
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				    &mvchip->level_mask_regs[i]);
 		}
@@ -1101,10 +1101,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				     mvchip->edge_mask_regs[i] & edge_cache);
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				     mvchip->level_mask_regs[i] & level_cache);
 		}
-- 
2.55.0

