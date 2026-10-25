Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898565;
	b=YlUoJis+HI0WwQnu5ftDxcrYqZowaPkKwkJu7rtHKtwEmso0Prz0WaG/CHRcyYVxGdrr
	 daE9fM3KIE7WvPDN3u23S1/ciVF17hgNQw5qRESRyZQ9YkUfezaDGom7WGxa0v/LrLKq0
	 Z57GHfkQF4WxK7sJuU3ovltDXvMkhTVGQzRRtKGsrh98blQ9o84QDE0Ki04W8shmPxY/2
	 haHZyZWjuGNs2+wxbyKN5S7WPuUBh2iy3E7VV2VqHs/25tMlfpb5HoDzls1xlsc5xXa7M
	 +R/ovncvrZTMEB744z+zCcM4GHsrOPLlUEfQt1i8vdQkiQ/iZHG2k+rOxF8qn1Dwfbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
	b=Av8Rb2W3J64BqGD+mP/Fe45FIZlBoluJZ5ZwgIdC1QFzY+kCWX3RZCxtuUPGdCBpntmQ
	 sxx1MJ089Ho8a3CL8dp5CZ2eALQFZuuP3CWtjDm0AkERwM934EtQnLtP3D1r7P7aKnnuS
	 bGTb3I7gGRL4/HoTDy14dLfDbXgeJyjr9qXYL5a+EpgSl43yOrF8wTqqSSAeBHGn7ifTg
	 7ASVGesoT9DoXicXtAgklDtBE8VGYz/H8UIjY3pcX2VmzuYcA8ItyRXRcC1+wldMq2lQB
	 zkirotqMMPpFkJPvzyLyhEjMJpJ/Rk2pkXFOoSrAwQnNySAJ2s/xSBUDZr4nRSnpr1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=No8+gWTg;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D8606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=No8+gWTg
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3300936eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792898564; x=1793503364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
        b=No8+gWTgwfulpHDt96mwihycd+Wu9qfSllEKE9t+HvO6m+kDhTow7SPHSag94h5mtO
         k9SV/0wj8JHhzjC9EWT1cYqSeb10oiisvS4P3LNsY+WfYeIskMw43EEbpopd8T05oTBc
         bS5tmHMpqzax1P5VSqrqqTn7Wa06sff2b2E7tavdtI00AVS9qtLp2PUxypWhOjnDwKpr
         OV/ATf8CH3msdfm6vwpSzRXmXDlLKOfzlLDi0YMeLdBFN85Sb45LqfNOGT+1uHLSqdqm
         IdNYNyDhsoaRb6PNXjBd26eFw+MyQzkk6jNPjY20PDrtFomjycE9kO0fN3L3bkhiPcf+
         YCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898564; x=1793503364;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
        b=Ds5sUBD8lIqrr6TnUbDzvTkN+DCmYhz4FECZEVbAoWRU2PvEJoaDH+16ToZLuDhA0n
         MLEoL0libow1UKoKZPzSvI/BagtkoMJa99AZLk1VzrBINcq4yp2O1VQ5USBuMEVjNUV/
         Pnd94n8eNDE3ZrFrpjD7/gb22rjShylKhogatrM1AR5KzHJApW+wdaOV2C9az+Z2769r
         99TUwr73YCbL0GNgKlZABsr4k0nWdUl9H05ilGn1GJoPNMH2RK34kQsGSm3lmNUmiF+0
         F7LJB8BxRk5iVn9oAmt4SkOY/uiho7IAipH1R2F8rg87Lp/xsCwBFc2MKHertlAFJPic
         fy+w==
X-Forwarded-Encrypted: i=1; AKwUvBxkrqxq1iY4A/jpSd9mj+V52ez5+SuiYWGDR1weBNA6eqERkgdbzaNy6AoqTZ1jIMgojcszfJnp6ShG0qI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1iMRa7mufntx0gp2OTm6WHqqW6YmsIbFo60QbbWiSWyCZGVtY
	ZWEPSQway8x1SI05Rk2yix/BHSZ65j/b71n5u1Q2XwS8ND4bFjaO839G
X-Gm-Gg: AYBFou2iZKuohwSFduW4GjWAYyWN4684MGntr/uN9x0nsQzGy+ECY15PYxsTK/QCnN/
	oE5tLRWyIijq6NZ8tJWHbc+h+Imuo6T5qPrQk4SfRr5o3MbjZxE5V3T4wmrSBEr0mhoRUI1+l3n
	QpDO8dXWAFWBzoexjCt8VDONkAj5wA9z++j6YM2o4mlVJCHzSfrUWm7DYCWLQfwsFXptOiQ9TOO
	/tqU1a/sjOxWxNqP44qVeQLzFLn3ziJHeNx1O+pMTHPN6A9gRabO3CwQOtSuctOKy5YE0Xyy+UM
	a15/B73vdwIogGLIuzHDAyVKguNqTViazm6m4ReT+IPPRrriJ7Ok7PelvsW46NAP7G1DJn0qfyh
	lwZddW1FDNvXYGl6/n/zHppKRSxj7+ZVWAxDHsvsunkyC1ZI1NoSVo8FCMg7/7i/pcNvfJfNrWj
	2G2mwUzpBhKvwGOfGJdfvSTn8hjLw3yc05fPtOUt/qTVZYUb04/5WDnKUPFKgN6m9ZwL7LGrFoU
	xWEjvb+npmzDGnqz0oPxG6djXo8XnVGvO2uP3mBtdX/9mO+GGOHD0mgXJpvT8RVl574en7wSriJ
	uSciBLYpv2ukZiYjGYTA4Fw0jJp6gvZiV+Y85+fEjBDQriwTSoLJqY6uSv5f2usYw1kyvyy9is/
	kHPvoY9382zaF7dCewawzv3liOF+0
X-Received: by 2002:a05:7301:2293:b0:353:5908:36fc with SMTP id 5a478bee46e88-369e8483d0dmr5753055eec.17.1792898563532;
        Sat, 24 Oct 2026 20:22:43 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm13602486eec.13.2026.10.24.20.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:22:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 25 Oct 2026 13:22:18 +1000
Subject: [PATCH v2] ASoC: tas2770: Fix error detection in
 tas2770_set_dai_tdm_idle
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-tas2770-idle-fix-v2-1-6c8096a87f44@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2ZrtBqh68j0Mh1JWWMOPaZFoC
 O9ui3eP32TmmxUCe+EAl2wFz4sEmcYIdMjAdXZsWUkTGQip1Ei5mm0gYzDGPau7vFWNGnMuzro
 wJ4izp+cY78pb9ePwqh/s5uRJjU7CPPnP/rno1PujX7TSCk2N1OQlO+JrO1jpj24aoNq27QsrL
 QzewgAAAA==
X-Change-ID: 20261024-tas2770-idle-fix-b0104e591578
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, stable@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3066;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+JeNkcg7xxI+ILpKkc9D2dhooDxOFAaRNmDxxxAetxE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFl3S/9PC2C6sMlpjWb5kqiQAxK+y/QFU7w49D/mz5PUL
 bx6ZuWljoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSvk2b4Z/jZrKwqzDrcjN225MTJ+ibNTeFn9/eeXh3wr6hbZO7qnwz/XZ/mrv/
 ctLmwZ3Zd2rrmFSv+F9fMWTR5deCbaa9X1Isf5AQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

snd_soc_component_update_bits returns 1 on a successful update, and
we were returning from tas2770_set_dai_tdm_idle early on any nonzero
return code. Change this so that only negative return codes are
treated as errors.

Fixes: af176d0787d2 ("ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle")
Cc: stable@vger.kernel.org
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Make commit header more concise
- CC stable
- Link to v1: https://patch.msgid.link/20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/codecs/tas2770.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..6b9ec8f630fe 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -513,7 +513,7 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT,
 						    TAS2770_DIN_PD_SDOUT);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -521,12 +521,12 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -534,25 +534,25 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL,
 						    TAS2770_TDM_CFG_REG4_TX_FILL);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
 	case SND_SOC_DAI_TDM_IDLE_OFF:
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;

---
base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
change-id: 20261024-tas2770-idle-fix-b0104e591578

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

