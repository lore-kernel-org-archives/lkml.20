Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF55303C97
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441952; cv=none; b=M/ChnWvMICbMunaMzteg60J67OGLWLV//GZj9pBMqDODDGumhOmLXKKmmG2ktG6mo9cvfC+dYcKJ7mxF8KyfBXiM2oNs+NNlpUHYquTabRjDCpEcVa2QnAHQSf1/Ris6YuQWo3HxaXdGjwJ7q/nxFJ/pQj+QMKp1D81eC51amqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441952; c=relaxed/simple;
	bh=7HSiTV7myQNpDbMgmxOBMHLDS7q41H3tNzEvTvOU3Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2CUfH2xV1PdSHvCtsc9ivIU0gduQgZNeHpbcLwiZ6264lxnU7kX5KW/GESoSvMisnwZSK8YgRua1JQDIPxMBkDZxwMUZNz4ic/PDOwniP7pMtFCDc86uymfiRES2C2a+uA7/ZLqW2WpIT2K15t46b8bkd6iicOML5cupr6hxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ5XuZMa; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ5XuZMa"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309ce58730so46883151cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789441949; x=1790046749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQ4qgoQJawve6Z4eBo5Wf+Avqlqptweex0fGWX2xssc=;
        b=KJ5XuZMauCcogTvb9T7KdMiNdWZeAiBLsxSdFOjINE7TvS0cmudFiVU959muCnKNuP
         6vkLGS9E3dN5xdyKUsr6e0Td4akdZipIEekTmTeX+8bQ+5/ElemyMC0C1rfiFK7mV/Pp
         s7BYBddC/fJXnc3nOTzjYemCYpaqHEpS9J2L3n3DwuAS+Yxir6zMFxpStMr7CaSMJI3J
         lfOT9hSpkfCFWswY5iIlyJALUTRcm5vOlVnw6n1kkx0EpoeQaCBTBfK+QJLAFKMeVYhe
         skeCjkIe5kaOFCZPBMIeBIqOX3MAjodLFm9Si2VEFuUwnEc/sdVtNiNb6o2UAJbIduBh
         Dhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441949; x=1790046749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQ4qgoQJawve6Z4eBo5Wf+Avqlqptweex0fGWX2xssc=;
        b=k5jBiMRGNpheioOdAp8N9WgeZIK5sHoLIpZ0gN7kz5gmONdadxgDpfUShaw5f1LuX8
         ceUia6u+t/co30IR4WXMqc+SSTn/jC1I4Fm7U5cuRQ30+Hiwfmhcpb8ad3fIZSPcbjHq
         AiGMwg5b7oND1nhrEewQCalnPujIPZB5/ZQiTnR5WHCkL0JjJn16K2+qoWF1x1Pjfo3J
         OmIrA2Mx2jaERHigFdj3J7WBEV2jl+uwPsFzPQ8a9foMX8FLN5BvRqIOoM1WHIZwkF2i
         cWadxXEBBKbd+XBLZ5egxKg9TrMlSsCseShgxaqFS9xBiHScxE+AIXTRvN6MOBxmdOS6
         cxAg==
X-Forwarded-Encrypted: i=1; AKwUvBxN7VpaR4Xs5QOkvIEP8NeqK5DtjjTKEEp2f/l9WacJyKAnWBmPC26a5tCT+4C/8IPEosNYKkdmBQXBctc=@vger.kernel.org
X-Gm-Message-State: AFuF++n5kwbkMAmXjCqrJB7kykytGlZvs0TiLJip4QrC08LcvCTVdSHf
	Nl/n3eudpJDHUuvekj9kndsYsDxPVHcAjfiCmi9Rp24xvMn09CUahqV8taPd6w==
X-Gm-Gg: AYBFou3UsMSMTGvmKc6SG6REpQycnKkOgvYLvw+MXATUN6S+JwxNthyS8lfUYe/JBHe
	5Cp1+yw6+RCuBoCw3iWzvEnd1CgQ5RDs6E1xwO+uOhLSfrn2ejcEwKnqn+wJ9Z9+2jK8tEG2jTq
	NHZR5JqwqAexl2yENTNVm3+NR6bBD8s24/uTjGZ57zlshfxmtcvExIfQD3j7E6mbVIb0wAvUULv
	WQjov4tv6rgTZ8nsiU3xzhEULGgpcCoB87qwrkT10ZSEa7QYMHm3cC+NJqvOgfe4KG8Zv8UlSUI
	0Gwv5wqmGT2UH+GQVnD2idCQW4e+jPqlh1eG4DVKvAycJlUNqOQIAdP6JMKh7V5bICjbjOvCEjh
	izQVD/9t/fTnrLON4NOpVdajudbqix/uk7fucVngX98/4jqjwQsIOCc4BQL6XcgvKqS2/NVOf24
	XSI7B//+dTWBVQ5L1wineKQ56UN92bTu6vAjsoGZkScaqrmfX0q0cYz+5f+5LT7sl55CAxc2WhR
	r6VRhqyOX9YJNRcxJnD+9CLd2TGMdXi6+UgMqdVMD1FNRK6I9JRuzK5T6Rp0YzqHb2Ei0LU/gbi
	TcxuVzgty1o9Bg2/Bc491/7PaLP6m13v/QAtwkbne7y/w2w1zc30t1TqFIQ=
X-Received: by 2002:ac8:7d51:0:b0:530:e2cd:3826 with SMTP id d75a77b69052e-5310d0c529fmr83209071cf.62.1789441948804;
        Mon, 14 Sep 2026 20:12:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm117097011cf.9.2026.09.14.20.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:12:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Mon, 14 Sep 2026 20:12:25 -0700
Message-ID: <20260915031225.191639-1-rosenp@gmail.com>
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
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..03e977c2a629 100644
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
@@ -1080,10 +1080,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				     mvchip->edge_mask_regs[i]);
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				     mvchip->level_mask_regs[i]);
 		}
-- 
2.55.0

