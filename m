Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBA423E8B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870807; cv=none; b=dyc6YWuvU+8BO2i6IBzEIOuVtHsYDbhyzu+HOsZkH4QMHWyOvdpDsP1APNgM+LbvZRiRUmhzei5x41S+Fjp7ZKNHzLBHteRjydd35FKbP0s2fFTvzsexcUpGgKU5Ib0RTzJUW0E/ezi1fjDgoR0DxTz3axg9FFx45Q8Vdu1wrkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870807; c=relaxed/simple;
	bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO014RG2Il+XsUp4XVn2oFyZ+N8LxtNQQ+IkWafZBOxc2RqljJRsT+fs9txmL7GnztjqpgMrniG1CuvDyFXHQ4XtoMzieHiDcx8Ax1FQQMkV8qZTV/VO0AAQ6EVYUh6TmlEaU3ROOKsjIv1e9uk8qx2J2jMGxKpn+UYrFkVA0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fYo0fA+q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fYo0fA+q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so40458095e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870803; x=1791475603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=fYo0fA+qSazOkWwSzMLYvirpyPYVLYI23VcZQE1umnXcjw/yZT1iVtPsojIHdB9pX1
         /tSVyYsVigyzpa3zm0Lu8mQnvcfZD5Min0wDeA4L7hyL2lpqZ9WjVEOCHiYyunsgO/Wg
         6WYqVS4vg69SpLScH8RxhejI1gsCRXHFlsBRI2AjbSWj16OX+hegGCJKGXL8h4Z6A5nR
         9KN02YX+I857YHRaLmRzo4GZ9hkDQ+zUhN2qBXNZtwP3owwZXGLjnum3XpVueXqb4g7J
         jLRbLEDdiDn0iCqzdFiSmQdltqCgQPk6zCfiJrZFa0+zwdLfKahxKY+S7Yi1vu3RuwnI
         h8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870803; x=1791475603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=fwVaZtp76qKvMwMz3PhC5aCnlWVAJZXwJ4uPDQwFUVZvm1ziKq00NXaWiKYUAOa+fa
         Yh7W1V3Kdzf32sOIb9DjROc2HiqhgjQQogBND9llUNmG3bWjEvqfNtJJq95Vss+Zt/bE
         p6KLmm83OliXV5dEoJ2e1kk11KEkDH3/G/sHvd9rL6s1/eUqL3Fet6Eer4nj6PX+YH2y
         AwLd7Am+kNRZjQeys01Frar3nHyv8AWfrQUqhsOxj5L2D9vcy6AuSRFsLvrY0dRbJLKq
         KDqKhtWRldhn4wvRTNdSa7OTGJHsdG13QNFhzjU60MICREHr4dW/8sUvya7NsUyVuXzN
         GMjg==
X-Forwarded-Encrypted: i=1; AKwUvBz13R9+JF22g6PUXmHM+MvIDZdT9LE2CBQOyN9miBxJz+xL2LALDTrfgCFU2CVmta3eSVljSXfhbIiGNrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lfCWkLesuf+QWleNg8Gx8ZxFbXSkxN017gQAlDsk87dLNOHpGv
	52aSyjarZF7MxnNcnRxfLDFVwhsYHOP5eN7e1B/zvKbVP7IpyZYBemIN70lMj/IhjyD27f3G3rR
	SRMT9UBw=
X-Gm-Gg: AYBFou3LI6q0h05MJuh7d+sbI2OZGhUy2W0P7LY5UgYKenU9SNG/SICnXe8ypp9ham4
	K8eC4U6GPR+zib/lRDWDofJTL9ROx0J81RFL9QglqXo+LODbx5qfoCEx9LbVOuCLqYquxs8YnKx
	F8MHRwfnuUyS28YIpN9Iq2b66U6CLUqXu7nOY/r6BoTJsG0/Bv2uVLOgYpzgM0oMlhBw6HptjAz
	aUd+s/hF0HQV4d0mktNEX0qGVGRggXUzJ7rr+GPESuWsQ91uaiE5Jp+Hj9O3CxkZEcnsTSbccd2
	EH+cJfatxoRQ2RZIho4Y0FhLU9fMi3NVLJ8s/iIc16QsxXUA83FNigYqFDt0uzoR7j08akWlUMd
	pVCURNRQwbxdvJxA8gxtb4CvsS1J06jPBB4/mBqbg54ifO0zP8qLdNV5NkD6GkH7O4M4UQAP3q/
	XLTRhWuAtWLTMpWgp4KAXkcO/qcN1Z1Y6GlIjU5dNBhxE8lp42LEpk42WKm7Tw1DTz
X-Received: by 2002:a05:600d:8495:20b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a0276bca29mr1048545e9.16.1790870803622;
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:31 +0200
Subject: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrlFLqls2D3/ss7M453XpCf1M03b9P/4rsqyRY+NO
 hw63bIndZSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiHkcZGZZvr9qQ0HIlw70k
 /1mL9g6rXafOB7HPynRvX8jW8df1hDnD/8TDQby3bNlksp+s/d1+ve+JJMuF5XksSoEOIrs3edR
 VMAMA
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
index 932be0a09306..7e9b34e02275 100644
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
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
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

