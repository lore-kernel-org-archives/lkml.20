Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803256;
	b=jFmd3+yvEmGmwLx0WDSp3pXZf7vkhxILwvrkGDMH/ExZeXus2Mu3npBnCHQXxxi4RcAT
	 7Wz/7MLHNkfD3oxn8jh7DM8cXd8AFziaghloV7XfyQejIFDQKgIcTw4kKBeIncadUh3bl
	 UyEaT/H8S8oXDUYTJSGSog7PsQys2vXKn/PH8O/txPaRyRCKxOCmF+cBFMGYCThpOk5Lg
	 njN71G54NSvzf6aoKV0IKUMT9wfRlxsXW91f0Ilm7QDNmyHvaKUmZSjqVGPYpj+FyBH2d
	 GYG7qgguZsMnyY3mYxHFSFgQ8bHzYCIipriXdWV6BpRV9tFsh7vYlp0KafvBe2ia6iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
	b=3mEZjZhCAYwdRSHcq75n9jZ22fqUHvVJQXrKCZSZo+e2gEfDWZZYTD7msygCstq0/GQa
	 cNySIsQbkaoQ4nQ7c080fM0cTm1DBskaxqqlgiAjhHweX+4ZfwTq7wLMqxB1uc8nFQIqt
	 ooidFnqFVkLM72GkEXtuEGWpp0XxwRpCN6dkQnmDImxICizHq7I65AosYmnN+2EGsY9MR
	 HTWo1Iwzku47HdDzCZx43siB7ieYuf/mC8OD21Ipay0V6xKRw5JIgt7mgtXUfGSSKmDr4
	 +Haj5XmneBFcT9A2JcllQO2IDgyEXfRcPAaA6sC4hnlx/fv+WeJgK6qwdSwJWjwJVIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBzSoSOU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAF0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBzSoSOU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so4448055c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803255; x=1795408055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=PBzSoSOUrgFcz7gcjKcXndt6JweAVS7Y3UB/4GZG0gPI2rJgC2gq2W2uoOa7jY6aC5
         oy1unp6PPKpYNaVj6V6aqKph2G3Icg7h8nG1L1l1yfxPVKteNXgcAHGGY261p/v9gIc8
         t5RS+ybfuk9KzSHMuK8oHEqix/t0/G41NiYrsV0uNvB0UNMBGWwxk5ElncF4gDPLnszN
         NMDqZ38MDGzlPyb5hFDLudBfPT9YC3gjp2DOpvguLTdbIkBMxyJmTTv9k/KEAVA3H0gz
         0WZABSYNxfsu3LcMg2ww7V8ebPAANEHMPWomdkIwFDQuBrmgXUZLEd8pZsz5NhrGbVlh
         lkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803255; x=1795408055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=rr7+YH4z7qjn7zKIAMja3sErJoQZ9GLhSivJwtD6iKXwQjqKdp1HBn0KepxYoTBJzG
         Xka29lRgKCsPe+XK8dVPl8cIsg7TRMdZ9TE6ju4tNydLOYSKTTU7dg2MBxjmB2hUbht8
         70rFY1zoo0jMp6S8DZir9dXy3WgxcX8m31XAQIWA2zkeA3kB16ECry456lxTyydiWJ83
         VuAWwDzDl1s5rcTnZn0BQNtfTj5m9Zpcuf8IUsk3v0iV+koLWecsvNW+ELJr9bDD29V9
         t5/XCATwyIi2MMVU9Mtz9MOd80u9BoJgX7+U+iTN7sSQAKjN+i/J7sN9QOoKaKTYCPNA
         OzFA==
X-Forwarded-Encrypted: i=1; AL+hErFWuxqR1bsi5inm5uJrPVDwFxonOfU7Smf22KWti6Klt8s8mYxzN2fQ78u43t+TjejgXZovILRHsjO9j40=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Yx+MgvBVoYaS5QzsVCxAjN3KLCNcTjc2Aa/PxiBJp5RBFO4B
	lR0rcgATGLSLLUflu1JZaJ7ws3m0uPS7ChztdIpe5DozSxe6eVzqpnTd
X-Gm-Gg: AYBFou23mj2+L95RhWG6d/KJ3kymzzpy47C1PCiMOfKN5drjRi4G18nccVCLsvnKRFQ
	jMFpa7RJ2fhQ6P3Y2RLhzXDPkfGQH8Th1i20goPxtttos/WIEMqdm59imLWyFjwnbSs6RCXo/lE
	Oyn+8lCVd+zb1jTwSb+I90BsCzpAsby/7nt4NEC/ZZ7ebRpjpih8dwqfrlcZP4fMLYBdEe+NVid
	fH/4S3MNEBlUgytNtYC3/Or0lUtQshj+JDtG2rq9wV4RjDToXfOjQYauTdO+V8UKJY73xd8f3In
	GECQAEHF3bjV/Esq3vkmTJhjRBj7pFzKyE0vMDApFPsAL6h6sUqkeLXPVHNL9IwBNEgyMCbcPOa
	2wwjWnrczAnUBSKhuPE8vtTImwRRDaolSTxRDZu51LiRykMpGgbzMDUt/zRVEAOgxzg7l6rOBMo
	R+vveoPqDvdyoB1qmM54Ch2mt7EHt4aEh3J7KRBS7vPS0lW7Pp0fergd+icpIDfUBKRsuN9T7Hd
	fIRnQRv7RxZKpdD0LJ7glYNOwqR4Vu/H5kkhwXXS9r3XHxPsTiEa+HGTbDPnLeGaEqdlHaXL9eA
	hxrUSUFWk1Rm+nEBsmj/y+aUnc7mM07E/zDE6Nx6BNbbd7WU4ssrkUn3/nz/Z0PnN8YqQVXWOHl
	V5Zs8djwCU4ijZEjOvia649K5o2bouJ5bxVcvl9gOEjeUoAA/xa4T7FKzKwSqHm7SSVU=
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr9490074eec.7.1794803255030;
        Sun, 15 Nov 2026 20:27:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:34 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Mon, 16 Nov 2026 11:26:33 +0700
Message-ID: <20261116042633.497423-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
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

The peripheral clock is enabled in the startup callback but never
disabled, causing its enable reference count to increase on each
startup and preventing the clock from being gated.

Use devm_clk_get_enabled() to enable pclk once during probe and
automatically disable it on device removal.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 59490e9effab..4216a28d3371 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -122,19 +122,10 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	err = clk_prepare_enable(dd->pclk);
-	if (err)
-		return err;
-	err = clk_prepare_enable(dd->gclk);
-	if (err) {
-		clk_disable_unprepare(dd->pclk);
-		return err;
-	}
-	return 0;
+	return clk_prepare_enable(dd->gclk);
 }
 
 /* platform */
@@ -546,10 +537,10 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	if (dd->irq < 0)
 		return dd->irq;
 
-	dd->pclk = devm_clk_get(dev, "pclk");
+	dd->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(dd->pclk))
 		return dev_err_probe(dev, PTR_ERR(dd->pclk),
-				     "failed to get peripheral clock\n");
+				     "failed to get/enable peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
 	if (IS_ERR(dd->gclk))
-- 
2.43.0

