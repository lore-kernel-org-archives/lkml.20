Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6EB347BC4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596310; cv=none; b=Dvqc8nEZvz5lewq8m0EPAi6CKCmPtyF8OsaNaam5lkMpxUGClOns8iJdNKS0kevHEgcyv8LDA+jybp/++hUTyauO7l5PQDDkgigjg5hzuzNGkLD5Y8L5mkJqHZW5bPyxWTWuAzsyNjqWHWrabaynvGFEl7/PvueBFgw078ow1Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596310; c=relaxed/simple;
	bh=oWGJOZ2G4tADTboIasDpDVyxx8AGf0dDnPTDstePwmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHH6QcAicLgPzDahfynIiU5M164f0jo79/88R1WUFVCjSNIvWZTSC9Qg6/EV/XsutXSLNghv/0seyjn3Ez/Vw6gkjJwyHwjpF3JKH9uez058VgcHnyxGwWY6jtqnBQ6eoPAWuzA5YYg+xvrhV3qWu5hmyFRZbEleoL1QmOyftvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovoI0s/r; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovoI0s/r"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso153894a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789596295; x=1790201095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHGYq0HcUs1U/I5vcPPQ+kFGt8+MwpGMEs9XhWd0UmE=;
        b=ovoI0s/r94bNqxc3cU3VYWPUMVr2zOI5BjebUA6etiHsXg3y6uMDLpvGQXgmamsKxx
         ZTKCFqzOcWn9fcPM9OaOyVVeELTa5WJeWcCJjhaFtoYTvuvRzQCTfsLj9p8LIDP/H5N4
         5OvUmjjAlLsLsRY9RW7sCdmFTS8gKsma1ly7I7zMcovpxeC+la9OU4Qxq4xTNj8P3E/x
         vqM5V+V3FSLZ9fncJPtPf7qyZSPA6xMNmNqkWf+mUSynuSP91I/a3U1vybdJ6ig1sDzz
         tXyh6WeH+c9tbHSsiaK6sOFAMASQpBbS6nFYtzmyzVT+HvcOb9lJc55cSS0aKDd3UcP7
         YScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596295; x=1790201095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHGYq0HcUs1U/I5vcPPQ+kFGt8+MwpGMEs9XhWd0UmE=;
        b=pyJizAQscqasRb/SM1uDO0O7wsnTqca1vFWlVSRW3r5OXj4WsduWI8AS0jRGmzR7Yl
         uGuAiTGOwhzkUlSlELtvDFFTrszMTm4ekyUQiuRFgMyiDiUMoRZxu0vvqhWO1yPnI7SY
         1qJmlTZ7kN1sn+fI/NnfeJpak27AyuiKx50bxcybPgPsLhfU+58TBF9YF4awYiaPMdVC
         z3Qwya5alTabHPuTqbDXlT5bFygueBVFAgw+6ZSZIbTdWTosWQutJicBYA45fC5pHoGI
         aQ90SOL+QqEEhvXTOe+7IXbGB97J0rgajB9JyNI+zMUXvjmyQtaNjbU/5FHpS/8aAXWK
         Pcjg==
X-Forwarded-Encrypted: i=1; AKwUvBzFvES0QaDL0iXSydLlu7lZLvxcFUN9SHHbFFErUBT1o20VpZSwdfycUVO4THCya7af5qAjPMWrwcFiTWk=@vger.kernel.org
X-Gm-Message-State: AFuF++kF9cLIOpaqWvZGM8I/gFIqzIopTlXOwpK1VBhG+gh1qgSijiKB
	UyFavfywnkxs3TwYLSjUhxld2iz65d1n7WT+qJYxfeI7Cut6AOyTi927PCp+bQ==
X-Gm-Gg: AYBFou2G9mTH13/gziSCSqGEc7XACBcEA2Zt5TxsOzmBe/ZfubR6OZ7EBlGoppec71t
	ULuqCjnfeiQ0nYR7VIpf/PgHlgsKmb5IAugUs3ph8Qi53RM7jjBxb+N/+5Xnk6Gvwe0Z5ONT3FJ
	srWknkDf9NJ8kCe2vlJDAKwMyQU5ya+1q8sxv6GaLeo8TKZqKCcHnIsG7lB/IZjDnOwfh3+aVVR
	+C2wv7DPcTUngESbI7x1onzWe7j7TsFwe0WxI8tXdYdqSyXpkuiD4fIUjOucj8LMTQgkhR6Ly4n
	baN0Mo1dtzD4E91BCR5dtcO4FK0jDz/WSw0mtSnet3IDnmLXkKQ6l9vSKCGD9zlqk93865Q4pFl
	voj3JQF/6iC03zsZPfj6xZQvtPbs+S5KXruHn5EdP/K+hvd1ZNfP2eL/TompN1mkqMnafaXRwgN
	S5d0rk6PCE42GQLtMvXaUeUe36s+Xrco41JiXgvh1XujkK/Wd0mph7kjjcug+po+F3LOV1COIl8
	vGjt7zV2nMNpFygCcAK1F8G4lhQwVgMSfz3Gziw5ohCMnkMsGCzDHUwS41MxTmJfIfjjIULhMnP
	huaLjK0tJk01ktW8JmzdoVjh5/hrzMhmLn2XNPiaHwkF87AStPgrYMls5Eo=
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39e1e4aa012mr10556740a91.19.1789596295444;
        Wed, 16 Sep 2026 15:04:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm11704823eec.14.2026.09.16.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:04:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
Date: Wed, 16 Sep 2026 15:04:53 -0700
Message-ID: <20260916220453.260472-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPC5200 PSC AC97 driver only applies to the MPC52xx family of
SoCs, but only depended on PPC_BESTCOMM. Restrict the driver to
MPC52xx platforms so it is not offered (and does not fail to build)
on other bestcomm-based machines.

Fixes the following linking error:

ERROR: modpost: sound/soc/fsl/mpc5200_psc_ac97.ko: symbol 'mpc5200_psc_ac97_gpio_reset' undefined!

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..101bc952aa14 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
 
 config SND_SOC_MPC5200_AC97
 	tristate "Freescale MPC5200 PSC in AC97 mode driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select SND_SOC_AC97_BUS
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
-- 
2.55.0

