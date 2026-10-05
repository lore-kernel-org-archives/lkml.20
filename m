Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B647DD54
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198239; cv=none; b=gVPF2trvCs9P+3V+BhzfptNxtwu4oGrstLWRwMhGcZWxjCwoac0ZVNL+GYQmdfZSCfXxmqV9cM1NcPU7miV+KEJHmO8tldhZCuILqORyQBzde5mhsJZLKKPVvllNWyHrvVyS5vNpci1Pqa2kpoji5PgxXhBSp5Vn+QNl1sy/2h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198239; c=relaxed/simple;
	bh=iKUUJSt7p8vtsHId3IsDg+ZkL6DO8SyYLRDzOeVFSmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAG3vDxiVoz3sx3Ym7/z+WHDK82Xt2xmJziAmBaUlZCKyg7B+ZNRV105o2p4AfHHG2rS/8X//Ok82WrzkxE/PNGlSmC9yShFG0nemi8dofo0BVciLqoUXKppbAN1N0YOqXwcyTnW9vmHR6u4ixtM2rcTnyCwYfXPeg1waVWz6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKzbHyQ9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKzbHyQ9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-88c72646f03so702325b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198238; x=1791803038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=KKzbHyQ9kV5pNe1jgIXpTWs5Pz2qvc8BZlwM6eLiYNutqy0PRjr/4Ln+9k09nrOkpQ
         sO86Zat7x4wKNXlfRwRZcxsJ6n7kYVI82syXMgBPS83dsfE0q71wtyu2sUcXMEnHNyyP
         3zg5NsTv1RJahIX32S1z3ORzE9rGtDuwd0ryrJsLpZ3uP/e+e248OIMjGj5uJMytKdcq
         CGb4ikksVXQtjKh4EdHBzl2gRdjpCikGDBzoD5XE1cKa3iSb/dsk9Uv11j/R0p8FVmRq
         lbfY3P856hoOSoDUnPIXB3ufXj1sVjeuosBc7urnuG0HldkwBq0C5SsFdqY3N1Qez85G
         CEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198238; x=1791803038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=rV92uIJY8Q4RBBKwEv36IzoSJ27AVE+HNm5iqq9xfkkXBjrTNj+ENJgAnVU8sCwwLa
         HwX7/AaJ/VqSCD+GKMWA1x+tWUFfvtMpwSFdCjDIN4hvvXOO+7LbAMWX6sN+P6i2WxXv
         uKixDC82tTiVFAIEAjCEVPw/xTXUAsRbvSZpN8SPQGOXh+yXCcChK8wOWHuHtPZZR67Q
         I96/65XzgDMDpRTgGAsl0rMrMz5gfvYhHpdHM4VkIAspRQoAoF8HH1Ty66hYvQAWAfEc
         eRuRD0r6bZMbLTVRsySAqv8hONDQ1Z86wRbmz97k8slnCqgR+79cNvefVbkvrwsCaDFB
         /OFQ==
X-Forwarded-Encrypted: i=1; AKwUvByF2XcboFcjPEsH81SjGoqfAYisKZ8uU0+o5jGPhgxOWzxH7nxT+PpEjJjWX+VcUrleZwbdsKWUTMSVFPE=@vger.kernel.org
X-Gm-Message-State: AFuF++mcRnLo8uCYbJh5MIfFSKQVhfnqOyjIYOoLUFzdZDUEuOpMpiRd
	xRhvrw/vHFdiqd3AXAt74TBKSFC9pLUCj4+LMqIj9tXpsmaBAXujzUy3
X-Gm-Gg: AYBFou0wKA1kq6tJduP40bF+s0sfXs4iYwjQ5WyEWsnzPAL8xVzD18T6wXMVRYg7Y9k
	S6rn2sDCoc3jgqqXHVEkiyjNFTNgJ1lBH9uOhGQ9ix7Vjqjjy1sTeTlIVFmyWYJu/XP8xpQhMnL
	g8mbCNrk+CETOdAF12jl4h2Fzg1onbS43jVtVpfyIYu0n+o2edJB1rQoXGsmz3kllLy8nQ0fQHp
	XNl+syy+63V+siKtC+l5RWKwhQqQqFpd+qKxq91CFq909rsASGSMOFxfpoxcSPvLNHPeEhxAR2k
	KJ3S0KtIdeSVMZ7EDbzmR2DRZHpTFzufZ866Ex5IDc8bAntkx96kzuTfypJulIflDhpXfE/5Soh
	fetYT1JERDcosSZkB2eEytNtjcKPo9VRuxpRJ991Z0uBnqddRBswd5iu7qbltdigm7ajRYam7F+
	Z1d8FiO0pj+UCir0SmWx1nhgwQM+fux0pVClgO2VPr0f1SPNy13ilZo48+sL9pRLRhjYIs/7tTP
	WoqBxCIj0YlqfgFvSmew9R75apiJaCUtRubyX2xjauMF9kBBr9P37QV4kg+lLJpCBY+dOuXanCU
	9GuKXBdK3yMHqA==
X-Received: by 2002:a05:6300:2209:b0:3dd:57bf:7248 with SMTP id adf61e73a8af0-3e0d6b554d7mr6668842637.18.1791198237926;
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Mon,  5 Oct 2026 18:02:52 +0700
Message-ID: <20261005110257.50145-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1bca2f62e76e..4ddf2114a1ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0

