Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20523F7884
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140665; cv=none; b=bpmindxCOUIrXfqcEBW6vbCVK5cu0c5SpeIOHQ0JZ3yJ2/MAr+tCEPVn45bclCxKU4pKLLg4wgsp0LIb5NmhG/t7+0o29g2d4WTjh2+7HlfqJJUGbjsnyjNRfcElFB7AEC7kRpZ4my3SH+6ngZ5V9s9BO1Tbrt+Jfsq4QZmc8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140665; c=relaxed/simple;
	bh=qBF4f2AR1gDshWlAzuEZ3UiQ6JAUSX7d6Fb/8Wu7DPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ByjRjPsEK5w7BRkUoW7fS2acFFTSCWj5gX/v+w2NOtMeXBfjWuYI1X0yUNOlXTo2leirM0rOzyXr74chrDpMO8Hv9lUO9HwX9ZzmPL5hO2GaZWgKyuNxzKDoEiLHdK4ZcEhRxChh8JoBtsNBgf4CW6uMnNu537vIV18WRum+H4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaCFrhN8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaCFrhN8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8fe8e343fso26587565ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140664; x=1792745464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDraI8AhB3fHPfJ38Az678CJQw7R/yVx2otit0d40f0=;
        b=SaCFrhN8Z9/mo1TzRIO8QMmt8MiPDbwEmNGmGKHW2pvEbqGG44o8oJf0OxcY5xnq8I
         RyC3bbj5xrkZXAu7Tuf/bmClWk/sP9cf10OQfYLHhIURQ/M3Bi5Iye8fYktkSjxvYLQx
         PByCjP/5CsacK0gXHyVQtZLgYRWcShgMEO8frcdH+576ZldoEjZ4WKjkHM3nFQ5B1JR9
         mfiueVkR2akyzj6yqGE2PoeSxou40bhUmAKkc1TJ6EXh2DZ20/08aAVx7ZYj5dUNgucb
         y3nj023/WuKoJEuJcBOCdtNIsHg39eqhBxWTYPZIM01DXkziwRx0HX0NK4oe3Gv2L3Bw
         MnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140664; x=1792745464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDraI8AhB3fHPfJ38Az678CJQw7R/yVx2otit0d40f0=;
        b=jKS4Swfy+1A93GBIBAJklz0i0u/EXvZm802OvgDamkvtbSszVtZeFsFDLCpHM46zxE
         sHNRfcmHk2Lj80VYHV/SqkRCd+XnI3zZEo9TFCORROopj20kCHnrpTBIZ1MMw34sV09J
         r0h4kEFBg3dqtZCIzH8YMsdn0sSAh4AcUjXODLVMEMW3TaSv1v7bmQx0BXgMmLvGcMSc
         PSpWrLfqAUGVL9f8XpUZpKn560efAuLi3C2M3ngbfDdpf91D2jKh9+33oJm8FrUfY64H
         TRRSbC2P2b0Iqh50PgeD3TLR8jqfl//it1p2PtR2k1GJ8K5T3OPEWsKazZHxSqzfq3wO
         3MDw==
X-Forwarded-Encrypted: i=1; AKwUvBxzu3ole44wjO2mgt9xftZX6yGfRMZkY3fwce4gC33AAdF7FY1vahs/dcWVZ9Xo2XV2RrmSq8bOTSLXuuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM1rjh8W56dR7grGIXB0uTnNHsOMzz5d36SYOeNCt2lKygZlpe
	4wTKiDFUCLoHxO7GBaXZmeuKxAfoENdTANoxytw8u0ZnPqKYFLgIwr9E
X-Gm-Gg: AYBFou2ZgsmGCnGKfbDiS98ng/OAjOidyN7rWeW83y9VvkXD5jF7zcDCbS3xnNPdJqZ
	XYqBEMbh79qVvuu6AXYx1v6FxTWx9uoPz5SfaZ4hZlTxCkbhVRoIZPSiaiWSBgCF+s6EGqgawzt
	zny+g4v5bnLfSx9H8rv1kP81kun1hQPp2mppmlFQGXXfGwPtU3wt1HXzLV9JBjbwBqB3h9IMVjv
	pTp+GRiMg1oXzSjYbYVAbxt8KQdBi6eFMkvwnQTgCF07uNJaOWnkez5UMPHTto5odyTjB5vpm+I
	x1i7HeJIK85BKlgHGZh0uJiZlKDTDwp3qv0S+C3oThD/hgrV/v1GviKJhUq4zozb6ciJ6EMz15N
	g4Uz2QNHDtYPq7CHm/kQaFldhqy/f8ErK87t+HDpdeJF0+Qt4Lw5RMBa50bcONmko8xaSVcDV8m
	vCzKb+K53hQ8tKF0XAWIHmB4ELCE475XmKK7jOn2ftCBRC7inylNj+pWfwi0vL8BBEUKmgtE2PR
	SbHhryk219kSIaWSuS8l8NyfKh785NTqZIjge+vHU8I5revchYg/fNjrjAHWLoJQsZljkY8MpLV
	K5/fNzlm460LvA==
X-Received: by 2002:a17:903:476f:b0:2e7:94fb:262 with SMTP id d9443c01a7336-2e842ce2a76mr172039975ad.43.1792140663916;
        Fri, 16 Oct 2026 01:51:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5b8849sm6826045ad.6.2026.10.16.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:51:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	sashiko-reviews <sashiko-bot@kernel.org>
Subject: [PATCH] ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
Date: Fri, 16 Oct 2026 15:50:47 +0700
Message-ID: <20261016085047.535265-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

acp3x_dma_open() allocates a struct i2s_stream_instance for
each substream, but acp3x_dma_close() never frees it, leaking
it on every open/close cycle.

Free it in acp3x_dma_close().

Fixes: 9f7041b71a2f ("ASoC: amd: closing specific instance.")
Reported-by: sashiko-reviews <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-173760@kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 765057499021..0862a431b2d1 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -360,6 +360,8 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 		}
 	}
 
+	kfree(ins);
+
 	return 0;
 }
 
-- 
2.43.0

