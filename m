Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37193280CD5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092902; cv=none; b=QkzdVU/pY6wVTF0gzGjAkcu4PyC1TmdxZZ4R/NUghrqUynwIEYnU1GxtBrKjsWAwvMzY+VTH/ktTPuV2g39Dspkuze3RlxhMuUZqEzjzyjCR6V+bR9d6o5Nim4FzV2H2OnUJdIcSrj1ENU16QrsOclxsQyMtpxJAThXLdoOqiNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092902; c=relaxed/simple;
	bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOiGeX7AmoRz7dTOFW7v5xScvO+eLZ6sRBBXMM9x/AAbwRIDC/o8XvWFyKomn2XL2Az9Ljz1lIVKkEgZyYvy8uzyazZnsW3SdJp/UANCas0HgrBL73oR97eT5WvurceiE/ft8vQHkl2mK2ufqrB4r+dZCKJ3YyesI0s9TUbPKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YrqyvQFq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YrqyvQFq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so101058f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092897; x=1790697697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=YrqyvQFqX+CXerrr3Qj5RMzqfJqWqQyomll9sA8w6/GNZaXdEoQzyi7jqiyO5fO9a8
         s1tVbOxpBH933YjUrneWc8WNgyMo5oEkyViq3B9dKBR+cxXLhhifzVczM5Dn8VKm8dcy
         8o8Nq3Wf3z1AHK35FwJuFIUtDR2yqxW1By4TV0Fwj5iZr3WH5K7SChSACKyvE+d50cgy
         0wNq5xVplAt2UQuWjKCelSz96HEA5AJ1a6pqE9XJKCog0CYRF0WNdDyHSFojHuere25t
         0BokCsKOfdh7gBTROj9DZty/d39h3yaqreTBP3B4gE1N7JdFoVcF5C3nJAIXTdfgFtAr
         AbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092897; x=1790697697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=Wi4Kc88rgDcZ7fAOmZnty0nTG/rE40mNkOHv9Z6VPt3hE5/55UTjujYK1wEBHCFGKT
         eCnr9sTA3hgmgdRhflA51TNsWR7/XxFviak4OM235oV1dEyN8dObVGFF+bg5BZ5dCGv6
         vcwUszvN/njpApgM0UKV5eqmbnz55puXHSBpt5og9D0VK0rdy4EEgeW6kxrQj11HgXZ3
         dToMj3YFScApE9ZbPhps1chRaoYDiIJr6KYVv2ZED+hqSLOBKplEDVGijOWtzdfF3Rst
         nEmLX4f+zK6Y2veCAvxZpr/7p8ofIfTSlHnS4du9vnvWdU3sPlNDuxAouztxfuKS3nJU
         1rgg==
X-Forwarded-Encrypted: i=1; AKwUvBxB+xgj7N1rcI+TEqJhTySwYBHL3witSkqD0hSbZyAVwL0yVp5GeZIWsSM7CsMdVpjsa4bTtI2sR5HXWSI=@vger.kernel.org
X-Gm-Message-State: AFuF++n4yfDZZXAppH6Nbny+gd6TIci8JPZ3s08oEi5MsXF3YnfmXrwB
	laJjaI3lz8G7jkHegOzS+/itEEI7bkEBxhpam+siX79Jld1gPGCwtXfD9NP6OzXJnIo=
X-Gm-Gg: AYBFou2RpRAlKKXx8D/4lu+MebIb8OTGzh9cfqTwc6vL1dLcqBQoknzZ2/yIN+uW8ML
	G0BEHCF9DeB8pun8JUIvlDA+2CiqwMm9XrYPYwc4tiN/F1Vy7YHRV4SUDZiCLQ1OPtO0nSjruN1
	Awqa8iPPvZBQQawIYzASTaTVFK0o2Eff8s5pJ/pUjoXCR5KsWSDVuBZ/S1AJlQq3ykYG4U0P2eZ
	rELJzKxRo6iuAkk43ByR89RgHwy67b3JZZueNvTsCZzgqSNJsEI1tCpCb4+2w2iADWb/5TSendu
	Wm6791sSWIHuw8ha+V5fLK3Mv8JYsaOGatrf0azyzwAWpZe3+LAxrXQAqwKVMeuooW+4iPpJrO0
	YPglXqH//I1/Sd0A1jI6mm2aE7X7Gzsyi8r2H2DJd3JGm4c1m2ooJxC6IdB/2CvNOpxbtRasfG0
	8Rz0Qh7pAg/UzyFRzh5aGmFm76u/wkLgyJUa+SJQ8MiIAFSPKGOGl04md0Vg1HPHQzlg==
X-Received: by 2002:a05:6000:400c:b0:487:951:20 with SMTP id ffacd0b85a97d-4886709c990mr52052f8f.46.1790092897354;
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Subject: [PATCH v3 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-6-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkV9nDbpoPCsi3wfGe85eb//3veLqzqv8vL9f77H5
 Bb1XNC36ShlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnh5jZJh8PLx+x5Kkf4En
 tx3hcQq7ZN6dfHP+huW255scDDPPzZrM8M/y5f8Fz2ObGJ+5Zcr1de14Pev+GRfHepXq9HTff82
 2HxgB
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..35bc47254752 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

