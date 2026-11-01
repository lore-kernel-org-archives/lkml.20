Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551508;
	b=VJC4xWkGo47XuEnoWwqA/tmGXlDOef68EQIm4aPyFK+wYtXgK+PwP/3/kwSDmb60lX+z
	 m6yvdy5OjJrlhEMQ5UvoSgwj2qvyztNrfwon8W5matseOjdgoaMb3YTm8ix/5HxWeUl/X
	 YG64YuaV3jJbjoVpVzwbEz1BvgyVScCRRKYUgd3QFZh7c7GRv3uFOiKFoIO92lf8z95Fs
	 zrFJ0nUTDCZyf3Vj2kJ7NxhvSz4REYCLi8XjFsnv5oSsfjQ6hQel+BOVXDEzPOQJmf3+r
	 cKymlmxV9pMxzbSsAqLFV5q2g5L/9BYtGTNPnJyx3rzmWM5OMwVUxPWSxhHvjv0ZZ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=;
	b=mktRB8EWzpZsbH9KyVV2mU5LLhoUSx2t2Hh/9TBEKbJuk6KWNLfTuhf7nY1u7OeOowsA
	 jANmve9clgXzczSF/zkESkXtAjsA+QyaGRcbiITCCH3F3BFg6dU62Al1c5dZ7oB59EP3Q
	 ilQqjthHecZC8USpeno6HF3HdAEF+r31+l8RnaOntWpcuB9rBYqjiugQnfmtdk528fbDO
	 qkXhQZMGJHQIJchnk6E4oOe+NXQQqT9oqmsHJh2/1c4YANRIq+PoaYdwc1AxNa/H4i8k5
	 q2zorYulnjiDOzWFMZCTaNwvat3W0XzHYHIuZ47tGSFjjS3vlcwJWMnb+0o+siVrRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSTJoPRV;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD551606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD551606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSTJoPRV
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3646e6de3e8so163829eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551507; x=1794156307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=;
        b=eSTJoPRVhY2S3vG7FnUXHpwkC0rSeG+AYyPrieZJuPDsbZOJPOad56ga0foZy3ahaN
         qIbnQ5DH8Ts2IKic1fK+7hNApnITeYJnUOTsJoS5wNKpkhURdZ+RK2Ca8jhljatwM79S
         21Ppu1SRHJpON26aR34O+rV1XMxNYOi9wNRejeNSVXbdfDIiEebWlkJDu000CA6IIJ76
         yonecS7QF79yH2IaZM9KEWwdsqw9qCAFohfpN2CkDQQ8HeyS4Z/vqD2DVVupLxfUUPur
         YpSrQNrKgHR0hueElDQPB7WD9PmZ223j1mELb7DsO4iT+b0rh5nRglmkDOCRVffpiPqJ
         GFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551507; x=1794156307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=;
        b=rmS+KCaa/8nYqbFwIznkryG7dvkYvugOT5zJwsDZy0ca8/cGNa9TGYmss2S726MvmK
         4c9OO/swirYUuw3wmx1wmvw8Uqvudbe76Pi0ZlSWEoa+U71sRaMHErpoJr4Wj7Y1f7aC
         70fn1Flpmi/6OvxV2OVC61PjZEn+MGKNfYkJqmpTBkYsLhAHfpkvZvO1uqYB0VIvHXP/
         RtlGCAWE22/LcrX6kY30VAEmPI1a/UH2z2FXr1j/pJWg2qaAdiZmr/ehAaCTBuAtt0ei
         jJ6SiqYP92p03Zr1mKNQfu8VPxRNi4vHld07uCYmGEDIFTg2ponk9TP8nn7u/X7how0v
         XF/A==
X-Forwarded-Encrypted: i=1; AKwUvBwdvicmLSD6Ugt0Ct7p0rNTm2Rx1gAizRBDIVe2OXRS5HmsDiYy18MS/05LwyYP9sYdvi8wO7Dj9LS+98M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KYdt8p2wDL1o7b7rTMEvZb0ezp9M01hVQYvAlkCu5VIhvbK2/
	UWimQ+3/+XZwByqlJkPqFTIu1TE9mBMH2dqXhWuwG/wbYxszegyQ/9cF
X-Gm-Gg: AYBFou2lCqTmSzUgWYYLXmbsj95jG0dDj0gAlnZh+VrqPGYO/zpUP266XvZNhZEunWg
	vEombSMclupqFSRu6zlnIwQglD0y9PMt0t6Ko+LUlqR4U1FXcovhDOgABjRrccy3PpuMNEod088
	QVxXbPFcnjB8JTYC6TMxwc6jg7UULEYG0adCFgUBnogL9lqLW/tlloYaq9T77fA7G/QDgblrOtd
	tExxdsYctom9bvhoi+nZ5cICXeGXB+rsuDm/E4RDCMRCVfgf02n3EvS+gcOxRRG7IpGRg9oIs3A
	1ekEVqMXfG5Ub3VI9ZafKdPA6jDYP26Vb7hTIAe7fJRYUup8h94UR8LM9xSTgzh88oHtPhX9XbA
	etKsCORxKLlAzhPmzVT4HsbOEBgAYxgXTgV2FimPxm4N4/E+SOQvF1gTdjkBmf3hTIjFZc6/Cio
	zyzi3FEOl1tDR8GwcBiMXv7tUbSXSTDZ9U/GhbMIPYBWSLlvB28Qa5r6UaRZdomrbsoEgTlVjHb
	X2nusZ3WRxSR+A0GA4NYkKfpCysCl/GmeeabtTr7WW0QEEg1k9sw5rfefWQPQHT9VLapye6tVyx
	JfiHci5f5bV+trRMCJ4PkVU5+LudsJRc1mGBVvEaKJzs69cKYQ==
X-Received: by 2002:a05:693c:8099:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-36a42236aa1mr18150568eec.2.1793551506628;
        Sun, 01 Nov 2026 08:45:06 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:45:06 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
Date: Mon,  2 Nov 2026 01:44:04 +0900
Message-ID: <20261101164405.1743177-3-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

VSRAM_CPUB, VSRAM_CPUM, VSRAM_CPUL and VSRAM_APU have a register of their
own for the enable (bit 0) and low power (bit 1) bits, which the header
defines as MT6363_RG_LDO_VSRAM_*_ADDR. The driver does not use it:
MT6363_LDO_L() takes the registers of the BUCK1 group, which is right only
for the VSRAM_{DIGRF,MDFE,MODEM} LDOs of MT6363_LDO_L_SC().

Bit 0 of the BUCK1 enable register is VS1 and bit 1 of the BUCK1 low power
register is VS3. So disabling one of these LDOs disables VS1, their state
is the state of VS1, and asking for their low power mode puts VS3 in it.
The LDOs themselves are never switched.

Use the register of the LDO, as MediaTek's driver does.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index cc2e841..c5de049 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -147,7 +147,7 @@ struct mt6363_regulator_info {
 }
 
 #define MT6363_LDO_LINEAR_OPS(match, vreg, in_sup, vops, min, max,	\
-			      step, buck_reg, ocp_intn)			\
+			      step, en_reg, lp_reg, ocp_intn)		\
 [MT6363_ID_##vreg] = {							\
 	.desc = {							\
 		.name = match,						\
@@ -160,13 +160,13 @@ struct mt6363_regulator_info {
 		.n_voltages = (max - min) / step + 1,			\
 		.min_uV = min,						\
 		.uV_step = step,					\
-		.enable_reg = MT6363_RG_##buck_reg##_EN_ADDR,		\
+		.enable_reg = en_reg,					\
 		.enable_mask = BIT(MT6363_RG_LDO_##vreg##_EN_BIT),	\
 		.vsel_reg = MT6363_RG_LDO_##vreg##_VOSEL_ADDR,		\
 		.vsel_mask = MT6363_RG_LDO_##vreg##_VOSEL_MASK,		\
 		.of_map_mode = mt6363_map_mode,				\
 	},								\
-	.lp_mode_reg = MT6363_RG_##buck_reg##_LP_ADDR,			\
+	.lp_mode_reg = lp_reg,						\
 	.lp_mode_mask = BIT(MT6363_RG_LDO_##vreg##_LP_BIT),		\
 	.hw_lp_mode_reg = MT6363_LDO_##vreg##_HW_LP_MODE,		\
 	.hw_lp_mode_mask = 0x4,						\
@@ -176,12 +176,15 @@ struct mt6363_regulator_info {
 #define MT6363_LDO_L_SC(match, vreg, inp, min, max, step, buck_reg,	\
 			ocp_intn)					\
 	MT6363_LDO_LINEAR_OPS(match, vreg, inp, mt6363_vreg_setclr_ops,	\
-			      min, max, step, buck_reg, ocp_intn)
+			      min, max, step,				\
+			      MT6363_RG_##buck_reg##_EN_ADDR,		\
+			      MT6363_RG_##buck_reg##_LP_ADDR, ocp_intn)
 
-#define MT6363_LDO_L(match, vreg, inp, min, max, step, buck_reg,	\
-		     ocp_intn)						\
+#define MT6363_LDO_L(match, vreg, inp, min, max, step, ocp_intn)	\
 	MT6363_LDO_LINEAR_OPS(match, vreg, inp, mt6363_ldo_linear_ops,	\
-			      min, max, step, buck_reg, ocp_intn)
+			      min, max, step,				\
+			      MT6363_RG_LDO_##vreg##_ADDR,		\
+			      MT6363_RG_LDO_##vreg##_ADDR, ocp_intn)
 
 #define MT6363_LDO_LINEAR_CAL_OPS(match, vreg, in_sup, vops, vrnum,	\
 				  ocp_intn)				\
@@ -754,10 +757,10 @@ static struct mt6363_regulator_info mt6363_regulators[] = {
 	MT6363_LDO_VT("vio0p75", VIO075, "vs1-ldo1", 5, 36),
 	MT6363_LDO_VT("vio18", VIO18, "vs1-ldo2", 3, 35),
 	MT6363_LDO_VT("vm18", VM18, "vs1-ldo1", 4, 40),
-	MT6363_LDO_L("vsram-apu", VSRAM_APU, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 30),
-	MT6363_LDO_L("vsram-cpub", VSRAM_CPUB, "vs2-ldo1", 400000, 1193750, 6250, BUCK1, 27),
-	MT6363_LDO_L("vsram-cpum", VSRAM_CPUM, "vs2-ldo1", 400000, 1193750, 6250, BUCK1, 28),
-	MT6363_LDO_L("vsram-cpul", VSRAM_CPUL, "vs2-ldo2", 400000, 1193750, 6250, BUCK1, 29),
+	MT6363_LDO_L("vsram-apu", VSRAM_APU, "vs3-ldo1", 400000, 1193750, 6250, 30),
+	MT6363_LDO_L("vsram-cpub", VSRAM_CPUB, "vs2-ldo1", 400000, 1193750, 6250, 27),
+	MT6363_LDO_L("vsram-cpum", VSRAM_CPUM, "vs2-ldo1", 400000, 1193750, 6250, 28),
+	MT6363_LDO_L("vsram-cpul", VSRAM_CPUL, "vs2-ldo2", 400000, 1193750, 6250, 29),
 	MT6363_LDO_L_SC("vsram-digrf", VSRAM_DIGRF, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 23),
 	MT6363_LDO_L_SC("vsram-mdfe", VSRAM_MDFE, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 24),
 	MT6363_LDO_L_SC("vsram-modem", VSRAM_MODEM, "vs3-ldo2", 400000, 1193750, 6250, BUCK1, 25),
