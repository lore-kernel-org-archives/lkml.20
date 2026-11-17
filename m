Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884034;
	b=fxA1aPPsk5GotlUhZrqVVDalNFww4R8u2dB/qz7v0vnEStlr29gT3wBO4HAnOTKLXQ0j
	 xXpaOQODhPLplPqnVeM2OF1IlJ86XWrrc+LUQWsBWqbursgK1y5ueRKskD5UyU6jMdl5U
	 CbCYtVuSn0ZGN9YDvX/nc8a2P7OuIyarEPrmIlMmAbgyv8nw2+zBdJlMIHS/1JO6fi/UC
	 vmgFHs6UClbx1bRADGDa3hb3YZuN9GmoP+uCvFzXmjcWt81jgswSlsfrWUDNBzX8i3xZX
	 qluQm2pgxSwaXA/aFPHZRYwwI2E7Z2ZLXTmAWa3fOrPrzrsfNfQ9hv0zgndDmmAYTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
	b=c6t/SiwmucKaGZNCiw6kHpRzIrB2kq2/y5tEaU6mpXVnSvxc5MLsGtpuWDJX2RY6vtqJ
	 kkBw3/ku4r3xgEuPXlAC5DYj2A85j8D4fZat5ZEq2oWB377nFA+LwwZsjjAnnMJ/4QZjP
	 8x6C80KCTgTHoQgpVxbLB6JwGyxoMIm4UhmUO8n1NwWOSnvehJONhN9VxpXbi1jmftlHA
	 4YVr/fw7s7poSMsvTJZxWS+H0TMtjY1WvvDmjPvTtijWbw2ceuGYKczWonakgC9EvBBZC
	 7eLB9gSiQNafT29cOAyL+JJk7giQn3JYXDYSX+tLOSVnPYhWEXUGQKRMBhLkQb5CESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgtitiFv;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E80F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E80F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgtitiFv
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so11476216eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884033; x=1795488833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
        b=jgtitiFvqsDtVIvsq3fc37pauSfLdcqiYqgTstR8hzuc411RWrSfBIMEwJlJfDwoPR
         PgKg9Yxjb3xuXdF6vEg2PFWhMVNfmAko1JLN7md9fz4adifAOGhxBGGveqk2xk32VDdY
         pieFlegVOII+59SQfLHrQAnrXID/Ih5TSpBeog7ZlnJO1RzgfXSf4jNtW7v3kO88++0z
         QcPoVXJjiLbukuilHSF/WdutsulwKs9ReEzQupH5HuvHubbT52UnJO8gbsN6zPiRmleJ
         eoffK2MBQDdZ1dpWUXW0qsPdObiXO39B3NBC8hlPw2YBrCJHGzVCsfTyglz0Fd1INsUJ
         nY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884033; x=1795488833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
        b=yi4CUZ2pSLYuV5UYu9xeE4LTeIXysDOQyjVaUbVLKObfti+jnuUSjqOqpbERnWVZFK
         bjtFyt4Pos/pN8EME+6WeRFLtOjWMnFzNChWJ8Z222I0223CtvcOM9am0mU8pK1X8d+Y
         jed5+2U44ij7bOan7tzXDvggY17jK1BKFfuAvHbxy4XEOegGLq+wW+hbHp9ZEl7HrI0/
         wEjvhnEGb08v00QBjZnMwUf80jt7uETbx9WIlw4AhwUeOZUmP39DXPmiB8qKjSRUTvV/
         O4hPMhrR33HgfZRNMknqz9ewB08+/mNim9nA6CoUd/gbuw3DD6trLehmKnZesuq5PvRy
         e6Bg==
X-Forwarded-Encrypted: i=1; AL+hErG/ayUInzqAAZ5Uqx7/ZI2ygAqdqu0hUxjSyyKCNVnAoR9w1Iahk4NJzD/WgisCxeFkFDMwxRGqLwn1oWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IBZvKbwNTgf0eENI1R5EHJjF44AarS4Z3oOSy3OfjClwxD6tp
	NKQKxFSw0BM7VNbbJB8BHoPMQQZSRgUn57RwwhEjZ4Gd7CnxalQmJiWp
X-Gm-Gg: AZFdTZdrlMZ8U7tG+y4Kpg/B+h2TR5PBPsEZ5LED75Rb2ci9mh70/cVgI5OzwChUEbf
	l1Y2kBv1FLUzaY2RrxZkpy0Mz24pSNJqeYcrLZl8h7IdqTnZ6EuLQeNXXVa/TxbW5P++/eOKmG4
	QQlhu2G0tmWmlYUSjon5OtVXa5+ZW6AvTgPVdWIEYQXyFflP0EVq4fABR2XRsMyIOffHRBqij2a
	x2F11pB3GMDs7mMjZxWkFScmNLl4pWtrRywSwtWz8p49cqn/h5kGhF3x6JrxCD1MFD+zFRSCn5T
	qsr4nivZpKM52qc5whOniLaoYCL/YyXPpXl5/KI0lR3pLhYq/ms9OeGegWZlZl8HIh0OULLPAM8
	cRicycBpkqxQz8WOcD79FlxT4FQW7wzSUTFbE6Br7z7uYFWW4rh6IpiKWsylUUVwvcVBIQDIaY/
	GSVDVE1CZDuv9Kv4uZWMl5YGw90Z1bO46KEevczAKUOCoL1a1A7QzinuObf9zZTrHMuRLVUGchO
	qdWEqWZ4mmC80bsJzXQJU+ay4KawD3zPN2POU2edN/NpMGQKXpr1xh1B0IaGggwbIkBn6wVO3ZV
	BQgx6jRbX2YobW1OdfWUp5HO2QEBrdHZa4ko4VGwi59RYJp+jbH13YPnBNbDtqdbMBrEKNiOiuM
	zqfTdVJxAz/YkkHib5sv9HTaGpgm4uF4m4OKkL8BqyiKw59SYTJcQO5IEq0gSoIngnA==
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr13958034eec.25.1794884032993;
        Mon, 16 Nov 2026 18:53:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:52 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: adi: axi-i2s: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:34 +0700
Message-ID: <20261117025335.7455-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117025335.7455-1-phucduc.bui@gmail.com>
References: <20261117025335.7455-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The AXI clock is enabled once in probe() and only disabled in
remove(). Use devm_clk_get_enabled() to let devres handle this
automatically, and drop the now unnecessary remove() callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/adi/axi-i2s.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 2c4035ff6c2d..1eeb96b7fd60 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -208,7 +208,7 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap))
 		return PTR_ERR(i2s->regmap);
 
-	i2s->clk = devm_clk_get(&pdev->dev, "axi");
+	i2s->clk = devm_clk_get_enabled(&pdev->dev, "axi");
 	if (IS_ERR(i2s->clk))
 		return PTR_ERR(i2s->clk);
 
@@ -216,10 +216,6 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->clk_ref))
 		return PTR_ERR(i2s->clk_ref);
 
-	ret = clk_prepare_enable(i2s->clk);
-	if (ret)
-		return ret;
-
 	if (i2s->has_playback) {
 		axi_i2s_dai.playback.channels_min = 2;
 		axi_i2s_dai.playback.channels_max = 2;
@@ -257,28 +253,17 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &axi_i2s_component,
 					 &axi_i2s_dai, 1);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	dev_info(&pdev->dev, "probed, capture %s, playback %s\n",
 		 str_enabled_disabled(i2s->has_capture),
 		 str_enabled_disabled(i2s->has_playback));
 
 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(i2s->clk);
-	return ret;
-}
-
-static void axi_i2s_dev_remove(struct platform_device *pdev)
-{
-	struct axi_i2s *i2s = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(i2s->clk);
 }
 
 static const struct of_device_id axi_i2s_of_match[] = {
@@ -293,7 +278,6 @@ static struct platform_driver axi_i2s_driver = {
 		.of_match_table = axi_i2s_of_match,
 	},
 	.probe = axi_i2s_probe,
-	.remove = axi_i2s_dev_remove,
 };
 module_platform_driver(axi_i2s_driver);
 
-- 
2.43.0

