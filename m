Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403AE3C4553
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306082; cv=none; b=jPbdTPMXEgqKCwV1pbgHHkEj0ccGLTSKh+4+ZX4y4hoY6yDU6jGmxjWEuqolkkuIByYKj1B0z26T5qC01NfBBgP5cKRSz4ubxytKfb43DLgxCtdl58fIoTTVeQ9wu8knZ/A16+Bb8YhA4urKyIsflbKSzE9QP20JmYauGevZbVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306082; c=relaxed/simple;
	bh=277ziCn1Jz1MkVcVlHmZTkndu4stgsoTeDpH1SQFyhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO3UoV0u5oa4VOWEgwIwB5BYXdjvL0WYb4E60KNLcx2Nd/O+dWS5kZ/qtuIlgiFuMP/y2u4YW0GeOSkTCsAUCIO14hV1uGAfq8QxrGZ2Y+uIaNOemWWOTHXkSPtR7EddO0soqG8ocnu7FGf+KLgClw2JkV+23db0h+zxg3fW3Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqR4QxUg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqR4QxUg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so5439045ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306079; x=1792910879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSEDJegNm1H+PkgrZHxMvnZyNx9okv9yBMulmHZnYuk=;
        b=VqR4QxUg9kPPw+geR8pkX2DCJgl0w4ZOYEPvUzeJpivt4z5cGJYsp0qJTCo4baUmzB
         5hnpEXd9BUcNyfX1Q3kyes8u/tWxnM6JY1S0WpRBBihtk+5Y+jJRuB/C3YWdpnQmJMUU
         osoA6bRprBjY6bOC6KwVR9AqJ4uJTfGDkv4OrgkEGlXrlF8PkIe1p+UI9KHcrBiEmMOT
         6LNOVWIOylrSLWfaDd6K0NEX/OBpgC7/gKxcIq/aB6FvoPGuYdg4L6LpatBvL1uzoESA
         ViSU7GM36jlxU5NYsSAQZhpduOrLDVmsU3Wm40UNViAEO0YSHO5f4W8MyxWqpYKBCFNN
         xPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306079; x=1792910879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSEDJegNm1H+PkgrZHxMvnZyNx9okv9yBMulmHZnYuk=;
        b=fL/cAUjD20rB4i5RUvi3+LeX2Rk6TTSfLTzhrAYryeShLxRw2DR7imDV3YWrurK4fo
         aqh6BMoJmAShECqxGXRbsl+muaKTa+ZFfJimSONn+oE9qX/sKWl27JQUKEXPWnkKazPD
         xNRGYFDd1xShrbhb1OpQfyIAarMFcijY5v8NEEkP3E4BDy0koLD7GzMHqLZmPxuHz+Tc
         Sw7/9B9201r5EIkN3wDdOuo7hcUdD4n74cwWnhZCvdbLWe8C6kxJmQusMMT3NbZFchnK
         wTBK865totT/gHBnXektA0t1PM9MqyYhf2rxaPC6dNNOxsUTrOCRGVOjcJKyM54gjAyh
         K1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsdcRlcLk9R2Ktr6CYP8f1mIdafPjMA/fTKghxBLBBtLBr9Fw88nPXwQkFi04j77dlu10xGbI68qryS2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLNBTb1nyX5yjYi/uuS+CV+Yf/8cmrwJDj0jMYTeynJGmys9ty
	LZh20eiKCTsEIQHu55+eD2zjmSljz7ihL9sL/3UNr3DXGpCGGhMxxb4v784opUO1
X-Gm-Gg: AYBFou3fWUTUbk+ySUbI5uW1yBbtIhKQHonNe4EK16BcUOSEvb2aSu6ahyWZqfHJUmQ
	TCc1lfDkYfF8XMwCoFNxvOV9cAlVGuXg4Wpn15wIMsZXuP8mrPtA1LKZFuU3stXsZsDgzcF2OgR
	Ku9eMTt5xJ+dGIUVfoMVlPKQihVbITtzXxQGwT1lyDBt/uBDepaUc+7UnOTtonLfN7uJhi48l95
	BGpgLXlja+rPys6zKOf0Zbf/lLvPeZWuX0Y19kavHbGUBcuu3e2vk+oCZDoDPxr8cabn6UisBT0
	VnjUVKAD9qE7TRtbeL1B1bRpAzPqagZr/eiVjXeZ1ouGsV5tGFjvxKXWKPN3V/4FfCtdqQ6jlhl
	NZ3Ri4YzRfm3ZR7tTXJATKSxUVqBcwtdLuJtuXGnbRSBRzXDi30M4/1RsDzKseijWnHFTZseDjU
	Kk+DSstWuF9KpNJGUt52fAmeYnus4UV3yHH3lzrttDT35e0cGSG80+vV0GsTemrcUNdu6avv33E
	njl2vJmQkoyn+xKtqzxVw9F3q6aQNXacsBTc/9YCGSBmjji2gyYKQnqYCQemjPLCvn0LRwDSmo=
X-Received: by 2002:a17:902:fc84:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2e9a69eaa42mr43928235ad.11.1792306079624;
        Sat, 17 Oct 2026 23:47:59 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:47:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: codecs: sta350: Fix definition of limiter threshold controls
Date: Sun, 18 Oct 2026 15:47:45 +0900
Message-ID: <d65a21665a1e0d63dec174dd3691bd97764b8ae0.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The limiter attack and release thresholds are the two 4-bit halves of
one register, so their maximum is 15, not 16. With 16 the controls on
bits 3:0 also write bit 4, which belongs to the other threshold.

Fixes: 2439ea1f0f8f ("ASoC: sta350: Add codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta350.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 95aee5aa2bff..acf5dc618398 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -502,28 +502,28 @@ SOC_ENUM("Limiter2 Release Rate (dB/ms)", sta350_limiter2_release_rate_enum),
  */
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (AC Mode)",
 	       STA350_L1ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_ac_attack_tlv),
+	       15, 0, sta350_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (AC Mode)",
 	       STA350_L2ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_ac_attack_tlv),
+	       15, 0, sta350_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (AC Mode)",
 	       STA350_L1ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_ac_release_tlv),
+	       15, 0, sta350_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (AC Mode)",
 	       STA350_L2ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_ac_release_tlv),
+	       15, 0, sta350_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (DRC Mode)",
 	       STA350_L1ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_drc_attack_tlv),
+	       15, 0, sta350_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (DRC Mode)",
 	       STA350_L2ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_drc_attack_tlv),
+	       15, 0, sta350_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (DRC Mode)",
 	       STA350_L1ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_drc_release_tlv),
+	       15, 0, sta350_limiter_drc_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (DRC Mode)",
 	       STA350_L2ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_drc_release_tlv),
+	       15, 0, sta350_limiter_drc_release_tlv),
 
 BIQUAD_COEFS("Ch1 - Biquad 1", 0),
 BIQUAD_COEFS("Ch1 - Biquad 2", 5),
-- 
2.43.0

