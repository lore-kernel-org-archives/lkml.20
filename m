Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F563EDE6E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959577; cv=none; b=OXXmnrVx4bAu32t0Au5/f9RELvAgu/7FaN8W9lU8rH2T/G7THtxqaUos0cOSBKcXVVNfuNaPQOmfGX2GFgFgbXVuDpncuEYQ25IldHLy3AmHERIzhF0Oto+yvnu1H9He4zQw0DNYyP+axipToxxNywX42qnL1/oxckbyAqXPd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959577; c=relaxed/simple;
	bh=aFGUuf3xDSnpQ+UaxlrYFrP0HME3XExUEDnMTAzXq54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=op2uygU+gv7T/h75GwmTet2zZdQoEjypBLeKLcozs6kaREASFV2and7wyKMxRLcMpc/aP2bK431Lx216ErE5Cvpya82SYRgh9WAcPejC6e5cJm8Or69tmQz8yF+4ewjryuKGOb9qW9ZxMaZjfjy80QDIZ3gZb/Rjjel2MgnCCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqnxIjBp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqnxIjBp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso20869a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959574; x=1792564374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTOKvTg/Ioxq0A4RaU7elh7j/jm8+rT2sWwuPZn/cJE=;
        b=gqnxIjBppVYAnrXl21ejR9P+farTvY8Lj38FR8ss6IJN66nej4KMEg2sggxzDImViD
         R81WU/EHhZe7Rf9egjm5qmgiCmjK/qrgYJ4utJd+9iJqZkd+pBknIV4fDuncUv7C/R8p
         R4aqGGhSS+rCLfLD7LNtgtrJA2jy9t/1O7/iogp2v/P/UVqeK9WFJTM8pa240kjSJi/V
         YZE8pbkImA59hjAUrv2LTXKJ74Xt5QuEoSk9kTi2Ngmucg2B2aSvcUJr2srtL2KO6WQi
         jzD0snjQBrG6yJDx/J2b+8IC40OGnv/RpUqfJcYEcRAAdGseoFPjbM+piLIESAK49lRc
         1CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959574; x=1792564374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTOKvTg/Ioxq0A4RaU7elh7j/jm8+rT2sWwuPZn/cJE=;
        b=AZS646gtKcq92NLG0OuCGJvnlQdYPTBMMFT6mEO0ArXOXkGqMVGD7Xp9jxR4Lob0m2
         jO7bmQ7OBVu1CfGIYqQOBui2tJVhsa39uYsz1EFju5pL4/0KqVTT9333vrx+7SfPXN8R
         qPkU/A/c0zYeBx1N0hXokWOUbdARkvqn6V0YaPVxZziaIWr5yoCVvK+g4bci/euCbB/e
         ttsBKVwuav2ggnfUtJ4tb4GoD0RRgXCN8SDRekDuLdYLKBTlqPIhFWC3umk4+Alyt8zq
         NnqiWd6Rh+TZqgEdKKmsj9ci9ViYlyw6W9TDtZ8F0WxvGBwzvWGtxMUN+sWL46yvHaWb
         YkTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsdyC4DlHAR7j09M3e4aqsZ7wuzKoeLBhwuOKiOxoK3Dtc2xssK+gGC3pAVvkz6en5PuPKt0bzO683JoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhN7sStSmD1IjoMqHMZczmLWpG3D5MFz/MJwYX3cYks917GEqk
	+olYusDnXl79wyZtlPbWBFsRrlnG7Of59EkxbT/EAeNOvXpm9jevC7sx
X-Gm-Gg: AYBFou2iEo+DGDY54LU8tZGA3BGAQexkE7W6jehDDEQl20e6XwLO8H3XUsVYwgt4dLC
	+8dDSCJgB58gM9ynMov3MALjrX8BLUjQ+5f3W5dAC+th2NlMKzInHQTMVNXeV7uRfgrGyVBMG93
	b/qLBsTAvK+FoXBsU7i7pzASRC/dVIdOmLJyIhOjic0KRCaOxf3bG0j1LBudRYymNpmsP/+ziYG
	bezHZk9qYMA/Km87KUF06orcdEJtW59jxbzi2Uk9v+UkcVqNTnk7Ytaspqs1KDZ7eSDwPGZy6yQ
	zdmOArDTJtlwuNrFy6Mabqu/T6NzT7NC/Ymbi6PJ5m+rLJy97JQdaxuxSDfBk+PyqQUUDNSNHuS
	i3DxuTJWsY98eW1Ou3WNl40jVs5e7s7PoLtTkAOtAaZVNSMcrjEbQz76UAqGsqHvQLG9E6mxwPi
	/InG2KMmRK1Fza/XnMlt42LYfkAd+T7sndrwEx72xr/TpBBL/IcdbQnn2dW2iX2YbsjnHOEgiZY
	hrJ610AdOx4ufKp3R9oePM4UTPYGMYmzp4RWNjJOnJiQ8J/p+WxSMWMpuE8GElmwbyADVy0A/ti
	rA==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr12523108a91.67.1791959573997;
        Tue, 13 Oct 2026 23:32:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:53 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] ASoC: codecs: wm8991: Fix definition of right input PGA controls
Date: Wed, 14 Oct 2026 15:32:30 +0900
Message-ID: <5c0196e45dff1769682d885fc26e613648e05436.1791959026.git.sammiee5311@gmail.com>
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

The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
where these controls write the left channel bits.

Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8991.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 225c235d3d89..157b48f02451 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -169,8 +169,8 @@ static const struct snd_kcontrol_new wm8991_snd_controls[] = {
 	SOC_SINGLE("LIN12 PGA Boost", WM8991_INPUT_MIXER3, WM8991_L12MNBST_BIT, 1, 0),
 	SOC_SINGLE("LIN34 PGA Boost", WM8991_INPUT_MIXER3, WM8991_L34MNBST_BIT, 1, 0),
 	/* INMIXR */
-	SOC_SINGLE("RIN12 PGA Boost", WM8991_INPUT_MIXER3, WM8991_R12MNBST_BIT, 1, 0),
-	SOC_SINGLE("RIN34 PGA Boost", WM8991_INPUT_MIXER3, WM8991_R34MNBST_BIT, 1, 0),
+	SOC_SINGLE("RIN12 PGA Boost", WM8991_INPUT_MIXER4, WM8991_R12MNBST_BIT, 1, 0),
+	SOC_SINGLE("RIN34 PGA Boost", WM8991_INPUT_MIXER4, WM8991_R34MNBST_BIT, 1, 0),
 
 	/* LOMIX */
 	SOC_SINGLE_TLV("LOMIX LIN3 Bypass Volume", WM8991_OUTPUT_MIXER3,
@@ -446,9 +446,9 @@ static const struct snd_kcontrol_new wm8991_dapm_inmixr_controls[] = {
 		WM8991_RDBVOL_SHIFT, WM8991_RDBVOL_MASK, 0, in_mix_tlv),
 	SOC_DAPM_SINGLE_TLV("RIN2 Volume", WM8991_INPUT_MIXER6, WM8991_RI2BVOL_SHIFT,
 		7, 0, in_mix_tlv),
-	SOC_DAPM_SINGLE("RINPGA12 Switch", WM8991_INPUT_MIXER3, WM8991_L12MNB_BIT,
+	SOC_DAPM_SINGLE("RINPGA12 Switch", WM8991_INPUT_MIXER4, WM8991_R12MNB_BIT,
 		1, 0),
-	SOC_DAPM_SINGLE("RINPGA34 Switch", WM8991_INPUT_MIXER3, WM8991_L34MNB_BIT,
+	SOC_DAPM_SINGLE("RINPGA34 Switch", WM8991_INPUT_MIXER4, WM8991_R34MNB_BIT,
 		1, 0),
 };
 
-- 
2.43.0

