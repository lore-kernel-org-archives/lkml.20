Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D162421225
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135529; cv=none; b=r+ZXpdGNKNnYwTCUckd7ef4x4WLSoXmFw+ARU3GnUwPkfCIbmVAmbWFZPszfnlmczBgFsCnoAHR2ycKqZesGxTJycBRrGI5tmOC8OjSpxefviV0yB9yrfzAJyNMPadna/i+U8N6C+ir0tKlq8zeX4/NVGvdb7bgzFSsp9Pn+Px0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135529; c=relaxed/simple;
	bh=VRN6U0o05FVaEHHnxR0FbEEzS4Hg8shLiLzhFfwosHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEpTM2titQiIbFntBjYb8RpVdD1A1t5E5pEafuFXiZSU6atnlITJUiqrR2MEjAFgAPfo+jU671gLdvMSnU9kHXPAvfqdPBx2kTfRcW6Azj2UiLdnZ1KWCi8JmJ/Rfvn7/lCsPkXhuygaoh6C5irOxTghKMgiW6e2+ImlUhB/5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMYiVr6m; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMYiVr6m"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-873a4edb243so2178412b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135527; x=1792740327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoZOeVDCSoL/Tl7R3XTFiNn56cJcmVvK1bWCP9m34sQ=;
        b=LMYiVr6mnVcqfOCl4v3S4v9I6s418cENMK+JUDI2UOsRoAr9O6Wd3iQEVEPx88Y4v/
         wQPaygrmEDQmS0wqv4C3Y8qJlH+UcABBr7yy+tzmG2LaqPJSy5H6vmqwN7IABfyFGpPi
         1bqaiEtH1T3uGqrIwyc7dQ7Dq5bXh9lrIfw8GbjfOlFexnwxHznvnAw5YXwcpqX5kPW1
         tEvytXty5ra+xdpyFRChcf1FW+wMVHCmuOX5efcfwJ1x/Lk4INJCpK4qD/Fosna5qV+f
         g6/Zhm2yqVKko+SeybzpDvJaMuA/zudjPd9Pmuuvs+47hzxm02NQWlhkyqxjPgnULAom
         piGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135527; x=1792740327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoZOeVDCSoL/Tl7R3XTFiNn56cJcmVvK1bWCP9m34sQ=;
        b=cIFYrgbZklRYqr6hDcvh5h/FXli8lgepwjqcTQLBTr1HD4WdWxjKES9IxJdyC+tg0g
         ZeyHAju1ycJBkNmPlE4tey7aGFJokAu0LL6OsYyAr/0ZEu4D451OF5ETTZCLYJNzby9p
         EPGbcdnR/VZIk7o05224CFafCBII9NTbyFTShS/hVFMRi6XNF7gm7BdQILsLfEozLVhh
         g5anY6yHHl7X+PvUCan9QS7ABb8H5SYiMebn5WxAOpcxRIOLIGturKI5MvWkjQRrdEDh
         spxyRqdxp43SGTJeqj/CN09nHnGLO6s2vUEo+gMQrvwhXI8Gb11VX9kEloLFQJwSCiu8
         viQg==
X-Forwarded-Encrypted: i=1; AKwUvBwDAPvAEtRv95T99mxGZFOeyF0vHgbGTBKtmSvQraN4/EHAckk++tAMJ6T6/xnjPKLsoAz4pghzUqo/DNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqIUCviDP3cNSwfQlauZknwtvUob9g7cAmlj/uEFcDDmeNsc8m
	OmTL5jV5UDRbfUm03ABpuaP6ucAXk7DtlyuYeMM8TefiVN7A39VXuyZb
X-Gm-Gg: AYBFou1KqVu+nxzavAL4x0sYYk7NDBZmsnZoMxIfSMgqsOJxOXAmUy+6d/QKhTplNUB
	VAyNqqtG126wt6P5pXqzQnq00gqh+LeNNGuT5kEwkoibivd/tmILPpdnLw8RudJRLBOul4wE6bG
	bcCq8sHLJGosbsNmE6i4/QXDUhWZCxpqJ45iI3uizWa0JvVveHMyy5Ko6NocfHwA5SdYlEjznb5
	tHZNGOsUshQViPz1bV/YD/E1PVVmfYrG838lldW/X8IXDluhUe/bH3xSx5PNPz48qGO1gne/5jQ
	vYlmKa3TkUCWHBOhd1fhYPbNngfUPCFvi+QmrYcZXZ4K5nskAKZRRFFc+HkAZHfAlY/Rdros+tz
	j0600XKmxc3KxeUGBWtUNA42sq9BOfE9s+8UxiB1cRiQvBY1OBTGoJg5PrNDuiQIAB3Uyr5P6Me
	8/Wa3u4ef04yILH3mfIpASpo3iEcxjPFO3U2Qv93LEf1oqLfjIqeC20pLskR7gFPwNlDTLuLD4j
	Q39Fs7WNTn/m7pns7dP/s5cW0TlY5+vf0EzoiL764pcQOKj4pmnoru250yt0Zy5tBhVRzBoN74r
	aaltNmIMCQ==
X-Received: by 2002:a05:6a20:3d8b:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3e16bdd2cf1mr21410103637.19.1792135527265;
        Fri, 16 Oct 2026 00:25:27 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:26 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
Date: Fri, 16 Oct 2026 16:25:16 +0900
Message-ID: <35bae3f84cdc3ceb6ca412153f44dee3647fdbd6.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC2 EQ overall volume is in DA732X_REG_ADC2_EQ5 (0x9F), not in
DA732X_REG_ADC1_EQ5 (0x97), which holds the ADC1 one.

Fixes: 48e278746070 ("ASoC: codecs: Add DA732x codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/da732x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index c9b6172ac0a1..e417c7ada237 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -511,7 +511,7 @@ static const struct snd_kcontrol_new da732x_snd_controls[] = {
 	SOC_SINGLE_TLV("ACD2 EQ Band 5 Volume", DA732X_REG_ADC2_EQ5,
 		       DA732X_EQ_BAND5_SHIFT, DA732X_EQ_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_band_pga_tlv),
-	SOC_SINGLE_TLV("ADC2 EQ Overall Volume", DA732X_REG_ADC1_EQ5,
+	SOC_SINGLE_TLV("ADC2 EQ Overall Volume", DA732X_REG_ADC2_EQ5,
 		       DA732X_EQ_OVERALL_SHIFT, DA732X_EQ_OVERALL_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_overall_tlv),
 
-- 
2.43.0

