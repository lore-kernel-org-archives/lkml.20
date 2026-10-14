Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4F42255C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959596; cv=none; b=T28DCIJKq1k09ISWKh7iOvBaSB8XcJ2MRrke4BcO/BP4Amfci+ijNdR7XzpSJAw0/W/3rfsOosIWzFLbyRqu1ofjSajSI126al2oqx2tD87j35gY0KkeEugFbP+T+WaIw9XefxOrmULiKMQGM6wp/oIbBNyXsU2M+9xdFEgrONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959596; c=relaxed/simple;
	bh=sN0WAGJJXnpjEIrxI8cj+6CPCbBWYK2LYr+nPd7F/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPGILySAPZlUoass4WsyAIPQ/oRbqNNtMSfCav3BN1t8VQk3Qp1a12UZPIdDqEq7PoepgNIQCQYaTaizoYNU0YfGsvaUNkuwF/3NFTwkTI5WOZo6DNQj0CZZMQCXGn1YhHiC/nx+JEqSQeiCc8MiIxHOvQg7ldCDe2U8osEUW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrmdyYXs; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrmdyYXs"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2781263a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959584; x=1792564384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YvI3Kot8Wsaa/xpmO5l3GbVsxQTm6APK2VOVulo8OI=;
        b=rrmdyYXsdMe+8bTX16RCkvDudMsaozN5MUivgbEiop82suaV1xsijbjsBWjYGoF56D
         hyWaO+ESYk6d9u+G5awDQ2hOHJirsasu8GV1R1AvTQSooJAFDG53/VkKE6U6PSuEdZEz
         C0R30ai3D8sahyO/H3f0yiP7sifPWOv5UZ+04kTSru4vgiW+tE7abF2LzgMvANi8pHCC
         PCN97uJ9d+VMPRLfceSSDXmTG1IRufARGHfn9JJtkOvWFc5HICj3OYzXrGd0mlm8leF1
         dwiiAVJ4InUOMpDDZxENIy3LW9ZJ0HIx9j7tegpeTeTv5d1jwDfp2r8zMiY/4LyorJ8Q
         2Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959584; x=1792564384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YvI3Kot8Wsaa/xpmO5l3GbVsxQTm6APK2VOVulo8OI=;
        b=FjEEteYUGS4ZaJMxTRMGOfk1+8ST44O+Uxis4k1D/EPEhOWJ1O5dZguGM3LopKcem0
         VQSrYMtvM2qCAEK/R1z2Hi4vMsE3hO2cp4sPmkTxnD9Clzt/XT0aAiJiVIRab/V0ldQr
         HIW48mHeLo2M19a7XYMRqfwK76TW1WwAIwZWiIQS+etGjkZwPAiEThHvGsMysLcyucdC
         e//P3vT08M1aKgauaY+r6IGQ0veRH84Qte8QSl9RxvyuWycqATv95gDFuFV9wou/bzce
         waXGqwbLC9P4ZDjz1jt3PM1k9H/XGdVEciHaP1vmzAeJx1Q5w7ea3mrMRlMTfp/OOzHQ
         vwzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/4gSl6pXuXSQMibFP2OcmLfNUbXfEfW0eStlcB6BTmc7nCxTIlLU+LkFVdevEapBjkPQ86TLhvBAUpeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ3obTzQdMzTYc/K0VQ+AfRSo0iJq+UjUVG9zgAHFXeU1d+RV+
	eeNRcitqwjbPcj5EaSA8fYN3hfWpEItveiilM8RJbF6H2iao8kw6LNLAMPlFJSrT3kA=
X-Gm-Gg: AYBFou2mclK/GeZ+2hcZ3YoQW/Uw2C0GGumwbfbsL49QXPXgj1WpEyEmV6FGVELcoir
	vsyRevu6WEcbEqAfzrZh4Ghk7fiDKv+lTZmtyGCL/cxOIJh1zN6aqA90NVNua+mXuunPjKsi1/R
	4+L+bNiO7rS85nqRqtMno9s6Ijtcu27vfDrh4ioLjvoO1Lb8g+FmHPUhwUuynxSc9fUmNuy/G7q
	ciCslRBfl3NCNicePwGwPLeTV1V4sIinyBpFVUd32R5u0yb9YjPHNZnT8cck0QB1Xy+Ebgt5TOr
	gxeqWDWXKJqZZjyoIkREDBU0lJeFF/sOOZFwjdes/jQN+7eSSiGQ62l9gpuv4NUrgjv1PDAf63S
	2NpMAJRR6KIXolewgo2INPm4yYwlXF7Rw4+x7Uo8zEHj0Zpifz8VeJwp6UL6lg7UqW1Jbd7//Ox
	rpv86iARTge2v4msCA9Z0Tth5vmok7hB7s0aj5oIYXll6yQ/CUOU4kNk4pn6r0CnCDGz5PRLlq3
	LyJzxs+p8iIAo55t9oIiZ6x5e+0pe7P7DsiWQtZIdLsyUtj3Nkxq7aDPz1HHQjxkuQgrIyvsPQ=
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr6003277a91.33.1791959584201;
        Tue, 13 Oct 2026 23:33:04 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:03 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time controls
Date: Wed, 14 Oct 2026 15:32:34 +0900
Message-ID: <8acff0f7314eef9eb3d290ca7855a87052d7e706.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The noise gate hold time (NG_HLD) is at bits 6:5 of each WM8958 DAC
noise gate register, not at bits 3:1, which hold the threshold
(NG_THR).

Fixes: 1ddc07d0f13a ("ASoC: Add WM8958 noise gate support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8994.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7..c1f388189b2e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -701,17 +701,17 @@ static const char *wm8958_ng_text[] = {
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif1dac1_ng_hold,
 			    WM8958_AIF1_DAC1_NOISE_GATE,
-			    WM8958_AIF1DAC1_NG_THR_SHIFT,
+			    WM8958_AIF1DAC1_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif1dac2_ng_hold,
 			    WM8958_AIF1_DAC2_NOISE_GATE,
-			    WM8958_AIF1DAC2_NG_THR_SHIFT,
+			    WM8958_AIF1DAC2_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif2dac_ng_hold,
 			    WM8958_AIF2_DAC_NOISE_GATE,
-			    WM8958_AIF2DAC_NG_THR_SHIFT,
+			    WM8958_AIF2DAC_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static const struct snd_kcontrol_new wm8958_snd_controls[] = {
-- 
2.43.0

