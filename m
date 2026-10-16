Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234163644CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135532; cv=none; b=ZFffPLa1bROxegc4jYRLeqlSdV4+m5KDOqe3edTTIL6/aTLUpimGBpUiHcFoxLw7tNxm3msoL6RNfXAuTCQfFdeNCbsD0yy+U59fM1wbhQ5tFZl4x91xHutQnKPs08H9vbScTgiT9vkf+p6gITcoq7TfGtfXYj43lEiFwvPYAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135532; c=relaxed/simple;
	bh=D+vOEhwlr3x8JS7KbxNy10G5LLJF4/eBW+XnshUSRSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpqVe2De50wnCfAr0izOgkTMUG3m37/rKhVueuAGyrkFUNsZeuq3z5rxWHO6AkCzBBrpzHftDUFshCKkvY8GKBBcTrPDdlnK2zWhVMmGNROJksV6oyTzWARXcBwICpfZ63F/WaQe+t2gLisW/Qa5LcBQiSueXTwiXKivSToe9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0BsfBi/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0BsfBi/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-886e61fa30fso2331323b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135530; x=1792740330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ2JlcJcvp7Gk9bd1vkqr/DtPQNJxUytPo1QOhpsSWE=;
        b=C0BsfBi/SqzPF3V7fWa3T7XKUYnGxSwCGoaQlXL9wPplBHSwKo2Cmjhu/NWFjN2omr
         7bnAtqVDqvUExtBp8Ah9pXLlyJ08cwo+cwLeb2Dhtxv6hV8Wg7mbPZpJ2oJyvcrvHq0I
         Ep6PWDJVXuDZw344mtF1B6/E/12X1cbNFVNfLK+euUbspHhTZqyetRMlMaoLWyA6ITjO
         sAMiYbA+h3dFTghwsjEbbBfJqWaBmqsX4QUw+iDK3JFB/QX4hz2C0qtDJ3QLcuvz5Oak
         2qZ8J3RG2vWTFMjwMfFcPO4xoLuHBUZ0jQUvtzx54mQ097zYYU+ZhzH0wvlusg1VxcDr
         YJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135530; x=1792740330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ2JlcJcvp7Gk9bd1vkqr/DtPQNJxUytPo1QOhpsSWE=;
        b=ysLM2q86U87gbeMYNyswKP9zbMaCkIojWDl7/uNfFgKuWKYBYEiV0h/q8ChAZ/fKlP
         bV7RytFxmJLvMIfeyJRPvppMPKf6LUTOf/zI1e0VfIsm6S5gZGeJB7YJz3sF6n2ca2+J
         F3elcEZ8/bveA/XJNljEYs1AGiwrlvEGkz/QjSb8vBLc6tCH57Nsq99I8JUAPMfqJ1Zy
         s4gP3qADvc4x/IklLc/cPqViqdnzAiZ3B+HxWiga0p6dH3rVSFxJ6PnfIREihfOyugX9
         MMLDWbRs8F59W0zYP9uPVi38OGkNDs2NJD4e3Avz/Ht50qGaE0EtNkGr8mebzmjyeqe8
         c0nQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5IwvpyjcfxQjDQHve7SYJxoB1D9FKCOdDGwZ9Ov5Af9p9HfhZoDjPKAeV/b2qFAh1Xapkc6FfB8UQtHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLaTIVHivvt/65ISFaxKA3voHhtTT859uVDjfhJiXJ3dK2JADD
	XomCCFkHE6SlOVwSHb8qhCe8ppmX4UFnvVARI9KXEorCEPOtkC6pM5a9
X-Gm-Gg: AYBFou0xgGQPG81rauKF914afPv0H5LBzEnMw4QeyJ8uDXSaT7OWzfwySTEGN6u/IpE
	6EyYjVrz0ysdoD249JaSmy6HTWsMWjxLPbwd/P5b8n8ShNG8893Rvp2eUNKn/3Fzf+GWNiDag04
	yncMzv1ppK77ilQU1t+1s2vufkk8tOdOpgZyIZdfZ3TJaqsvisWRptXBn+zncqCGaIiMW82Alqb
	vXTY2/ZzIHarOxPjgPikLA/RQgJtI7f9AL79GJgN0ASovgj51/zuzYOTP5lPftOoe2a/2Qy4TBa
	/+Eosr6MBXHJmnAMy00x39HQLVCiJqP77xdKud+/yTnZbb8TzGDhuWtF7s/lRt7YV9QxVnmlURe
	mSPYIqgx9gcaFGycKcuOa4fxwl0nBblInZh9HGq/vsyyM8hardBFG46wXFOUlzcdfU9ifH+YN98
	zq/hsE22wZEGY7r1pGaYMRS5gmPxigyoYN4ciKrw075nuwzr0umwxq0u96Dwbc30CoAZ+jjPHM/
	rIMrfXG7DJnZt65BEkgM647+IDXgiqXepJtax2sKd09RqflUi9MU2ELrqwjlddkwrUcqGQ6Ws8=
X-Received: by 2002:a05:6a21:4c85:b0:3dd:85a8:cacd with SMTP id adf61e73a8af0-3e16be428c6mr15938189637.36.1792135530335;
        Fri, 16 Oct 2026 00:25:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:29 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level control
Date: Fri, 16 Oct 2026 16:25:17 +0900
Message-ID: <09cad9ec9bb382e44cad079a680bdf0f6163567e.1792135144.git.sammiee5311@gmail.com>
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

The right channel AGC target level is in RIGHT_CHN_AGC_1, as on the
left, not in RIGHT_CHN_AGC_2, which holds the right noise threshold
and hysteresis.

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 528c44446482..79f4abc245dd 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -691,7 +691,7 @@ static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
 	SOC_DOUBLE_R("AGC Capture Switch", ADC3XXX_LEFT_CHN_AGC_1,
 		     ADC3XXX_RIGHT_CHN_AGC_1, 7, 1, 0),
 	SOC_DOUBLE_R_TLV("AGC Target Level Capture Volume", ADC3XXX_LEFT_CHN_AGC_1,
-		     ADC3XXX_RIGHT_CHN_AGC_2, 4, 0x07, 1, agc_target_tlv),
+		     ADC3XXX_RIGHT_CHN_AGC_1, 4, 0x07, 1, agc_target_tlv),
 	SOC_DOUBLE_R_TLV("AGC Noise Threshold Capture Volume", ADC3XXX_LEFT_CHN_AGC_2,
 		     ADC3XXX_RIGHT_CHN_AGC_2, 1, 0x1f, 1, agc_thresh_tlv),
 	SOC_DOUBLE_R_TLV("AGC Hysteresis Capture Volume", ADC3XXX_LEFT_CHN_AGC_2,
-- 
2.43.0

