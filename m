Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224937E5E1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439947; cv=none; b=KwYF+pqwzR9mY1kBjnAM1M1oOaLJLX27SNQY/GhLf8BwkRGFiz3ys7YLLTRe8jxFGCPkbRV/nhHr+BxkeVl30XK7nD6jBkKZeYTF0akk54yMSV1UQEanKESCvifxuKcF5jvX3DkQGIXqiJ2NLD8HF3zA89bXN7B4E3siBURvcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439947; c=relaxed/simple;
	bh=uAK+c3uS770aBBl08QziNKBe/WozSrIjOMo5yfY0S0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e72zdhTHANjsi3bm2QgHqin66Gs+aDDx6Ozh5v6De+BZnDmg29qUHEM69MueNHQ80j7L/2rxBFcCcJ0nnIPNfYZNRRdvadve256kmfpPlbu7/FNEI5mockW/PwuJyDmNz6e8JupRmKKqWREIXQbC+435JFQCgkvL3iFAo3Z+bUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chB9Xm57; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chB9Xm57"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5332048323bso7460921cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439937; x=1791044737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb4G303oMO0K/1dMnbkNBZNTh/B98CHRE5BZkAKVABk=;
        b=chB9Xm578oXHP4IVldcU7UtR+Sje5DHgNHu8QeXjFonaIbVEZ6MHTDkh5Hmuu/ZtDp
         bDAEAi3uL6wGZo5GkOioMSlh4tIecEOcTMsUr+mzN1SJvk61VS1MIqE9r8BFoirUrWnW
         E5LRBVDbRPmTMfHkzGuaKEvGbaI/yjiNfbKIGY0WMPm5aKiQXTVt2Zz91WFBzHpHXm/7
         nXPN2i2uq1i3BLrylY9+X+4ieKnjIOKTQKogLNZvNtBXQZ03n+Ib5QldNQJzxgG4Q1a3
         RKEDhucDp4iNpff2kamkFE8QFVWeck04B5Voot08y5lHvieDFloz1k/bJn8F2lSMdCY5
         9a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439937; x=1791044737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4G303oMO0K/1dMnbkNBZNTh/B98CHRE5BZkAKVABk=;
        b=Rjmnk2isVpUJgcWOd4MYlV2S+E4Ik4DK0D96PyUNWk857hBCAe5IHMMfGousrtOezZ
         K5MeTmU+4WujuyI1G40iu7UDlGqH0vIA4AGVxNoyBjWZKe3P3o98HeIeKBBhE9rX4we+
         ySkDW4sJ0+UCvgE4pf92ULvNI9Ylq3D0FFxOL3sg4DIpAHEQBfa7YWtptU1Zle+z68cH
         H/WOx60/1qeMREOj8cJ2jqTiNq+T8LeLRm5S+cKzyrDGChUCtBKdB0BT4D9kUt3gdIjL
         Mtl5HX1TjG5L+Q69/dwsgcGrdsTayghrd7RTWW0dsB9f+wLd/OlCLaIjuWJL0QUM5Yvh
         vilw==
X-Forwarded-Encrypted: i=1; AKwUvBz6BsRKTEzaSoJjtz89OI89jFC67UNdnflsTcpr6QYCRUMUFyZgji3IyOX0dnSX89qm3vgJuJ4j0DUQVsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nfh1wtDIv1cGNODlc5yPrm9PcrTvvWLauSIRrC1K73JTdwG3fz
	fo7Nzm5CAEjz+ONv/1ntQFuFotfAUGthJM9PsOsnDmgJIMpZF+iQCHSB
X-Gm-Gg: AYBFou1ox3URdpraxcBStC6XKPSeVVgpJ38DWVzwrFgRht55cFNHrdh74IaZSzGRNLX
	pL4VA0qwqYXVQiHT8s9pDrinuGLK5Lf5r9OJ2Qx/Fl4QtIt7xVZSjvj+tXUVBXBsRXDr/3nuoRt
	ueE+2DpzDIdDXETg4GNcNDeWnbUkDRztzamIhN9jZ2BXYR4sIMNPiruEyX98kolkGGVy888bq7h
	6E6+WHMeX6fpZ26iif/U7zxlNfewwxMHnAGLIydXyYnuAP5ozaJWL3AoQWkTHJbQiAsJ+aRPo0i
	31JMmxx49NDRFkKheyzVzoDckIpzeUgJY4LFpDTZbMWW5Vnbn5MlFLchVajbnmRXU+BuNcNqrcY
	DvWfL9uqMV0amtleAgsDRoqP1T0b4bBqnvwcfu8WrOpw3aqP1yXFmlPV+igvOmptNaUbc/xfvFe
	BiNGxOs3h4RBCjCJOCgN+j8BD+fsHArzZM24wjF2RMFtb76TKHTxGMIk14Cyr1bIJwfDtJdJTdc
	QL7PFZQt21Dmo/V8sNSVn0JZj2cYEtzIK+jKC09ZTmVso7ehlS0dFmXwqSe
X-Received: by 2002:ac8:5f4a:0:b0:530:3052:5257 with SMTP id d75a77b69052e-5330b5dba09mr118633901cf.27.1790439937300;
        Sat, 26 Sep 2026 09:25:37 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533220200cdsm21445101cf.2.2026.09.26.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:36 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: nau8825: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:33 -0400
Message-ID: <20260926162533.25395-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 sound/soc/codecs/nau8825.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 2eb0efc983a0..63d927f31409 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -348,7 +348,7 @@ static u32 nau8825_intlog10_dec3(u32 value)
  * @sig_org: original signal level
  * @sig_cros: cross talk signal level
  *
- * The original and cross talk signal vlues need to be characterized.
+ * The original and cross talk signal values need to be characterized.
  * Once these values have been characterized, this sidetone value
  * can be converted to decibel with the equation below.
  * sidetone = 20 * log (original signal level / crosstalk signal level)
@@ -725,7 +725,7 @@ static void nau8825_xtalk_measure(struct nau8825 *nau8825)
 		break;
 	case NAU8825_XTALK_IMM:
 		/* In impedance measure state, the original and cross talk
-		 * signal level vlues are ready. The side tone gain is deter-
+		 * signal level values are ready. The side tone gain is deter-
 		 * mined with these signal level. After all, restore codec
 		 * configuration.
 		 */
@@ -771,7 +771,7 @@ static void nau8825_xtalk_work(struct work_struct *work)
 
 static void nau8825_xtalk_cancel(struct nau8825 *nau8825)
 {
-	/* If the crosstalk is eanbled and the process is on going,
+	/* If the crosstalk is enabled and the process is on going,
 	 * the driver forces to cancel the crosstalk task and
 	 * restores the configuration to original status.
 	 */
@@ -1303,7 +1303,7 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 			NAU8825_CLK_ADC_SRC_MASK,
 			osr->clk_src << NAU8825_CLK_ADC_SRC_SFT);
 
-	/* make BCLK and LRC divde configuration if the codec as master. */
+	/* make BCLK and LRC divide configuration if the codec as master. */
 	regmap_read(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL2, &ctrl_val);
 	if (ctrl_val & NAU8825_I2S_MS_MASTER) {
 		/* get the bclk and fs ratio */
@@ -2897,7 +2897,7 @@ static int nau8825_i2c_probe(struct i2c_client *i2c)
 	nau8825->dev = dev;
 	nau8825->irq = i2c->irq;
 	/* Initiate parameters, semaphore and work queue which are needed in
-	 * cross talk suppression measurment function.
+	 * cross talk suppression measurement function.
 	 */
 	nau8825->xtalk_state = NAU8825_XTALK_DONE;
 	nau8825->xtalk_protect = false;
-- 
2.53.0

