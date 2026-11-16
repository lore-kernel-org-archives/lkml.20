Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855524;
	b=clYnwnIT2jYTx2vv8ID+82DSPfW2D5YwQJvgoEursH49P61/XRbbKLow+l5yAFy1TuDn
	 oX7FnMYJLe/Brwid6iSxl2p6FP4BnqfdTlTzAZa0+m6+PG5eNIVGwwOC2Y746cBS5Rzqv
	 YYIWFuT248ZaQU978wy/6PURyaKEG0/5KgVZTg/sRgsmkrHQek9uIqO89qzHURX5jItYc
	 Kd0ZKnkytyjUMJECFIo9mgpN3zt8lBux07EHzm4fQACWb2acQO5wuxCNkQ0zS/5lasP31
	 jrmpmeOlnTgas1njc3yelnoQehzupBnfsYwypFN2yGfM3AXks1jCKfsx0AfNne8oTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855524;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=l+N/4HUfPOWC38r91cfsEtOz5CFqQ9BB3OfTC82ziTA=;
	b=4mBpparaeTXsd8+G3IeA3m/nmT+5p4HL+mSuu/ZjRCqP8pFb+KyW8PLeqEhPcPTEF4Oi
	 YeT7aXffHApONoA9GH7LIC9x46BN1iD8Nz/jZUaFXpTo3RULwl5d/TdmLWGN5Rgay6bwf
	 bjPlkU34pXcIn1FMLco9+Q+x3zjexj4LB3t7BdL76FBjK1oV9oVHsKm4Ie6Lkq8bnzwbt
	 Ru2v8KPYpZuoPs/ZDXhNchD18Smq5oxMZhlLMJ8S9L9jahPPGZGrGYg+XLcQ0+tGiNAit
	 sAg0qcdRo0wA2c2fuo0PZ5NNHmMSJSgq89vv95v4Kfhv/bxqbOAUW2jmKYswg8SJOZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=ktZIO4Tp;
	arc=none smtp.remote-ip=198.54.127.76
Received: from out-zbxj-a76.jellyfish.systems (out-zbxj-a76.jellyfish.systems [198.54.127.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C200606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C200606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=ktZIO4Tp
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxw34vBWz8sWN;
	Mon, 16 Nov 2026 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794855515;
	bh=l+N/4HUfPOWC38r91cfsEtOz5CFqQ9BB3OfTC82ziTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ktZIO4TpvTtsMbzbH69XQ+vUxXXS+iPiAxqnov81NKsqON9oyQMbG9chM5QwTiYQC
	 M4yfTnuVSI0UhgfcEzQ/xMTOWeywlBHUScDCN21nXVv9VtcaDPxhC8zcpiYED69yHq
	 x3a5zjl2nTNTOJkZZqgZHRq8SQNC3Lah/w3bbjAG1BDwmnXT6qmlADn+EcnofZOJ3P
	 ItgEpL2Ih0dj9fPlYZmQpjanKwP1fNyqJQC4owLroHMMWVoRyDivv2yfoyJvG2nIjf
	 0qJbXbAfSN4E+6bbbadbEC5WisPoc71jlCIcpmR9T+nw2ddHtTqQT1Bw+DmhGNKweu
	 EdKQfKin2QDDg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jerome.neanne@baylibre.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 1/3] mfd: tps65219: Correct the MASK_EFFECT field of MASK_CONFIG
Date: Mon, 16 Nov 2026 21:58:09 +0300
Message-ID: <20261116185811.1907811-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116185811.1907811-1-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

MASK_EFFECT is bits 6:5 of MASK_CONFIG (0x25), per table 7-46 of the
TPS65219 datasheet (SLVSGA0D). Bits 2:1 are the warm masks of sensors 1
and 2. Nothing uses the macro yet, so nothing has written the wrong bits.

Fixes: 74c17a0a49a6 ("mfd: tps65219: Add driver for TI TPS65219 PMIC")
Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v2:
- Add the Fixes: tag. (Sashiko)

 include/linux/mfd/tps65219.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3abf93719..5a6be84e2 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -198,7 +198,7 @@ enum pmic_id {
 /* MASK Config */
 // SENSOR_N_WARM_MASK already defined in Thermal
 #define TPS65219_REG_MASK_INT_FOR_RV_MASK		BIT(4)
-#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(2, 1)
+#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(6, 5)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
 /* UnderVoltage - Short to GND - OverCurrent*/
 /* LDO3-4: only for TPS65219*/
-- 
2.53.0

