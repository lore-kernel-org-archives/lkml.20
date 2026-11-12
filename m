Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476228;
	b=vSAduSFZniF4l8UjEa1l4ASNKJUunRgNXov6D5NXbHSerOwUK7xh4JdD+/ILKzD935XB
	 vqMIH5AJ1AT+npfVLxSR0a2aQ6mu3zIBxxuoJCCDY4x6g1OFCebU3vTmfRpSgpvO4G4UW
	 yNQMXX9zX9flVfQRFAY0fknSXIxv4tgeMZ7gm8HjWwTNjby3lEGdrC+Q1GqvjrRpiAIZB
	 QHh/mtjQ3FgaWwdQAey5A3RUxqxQUgmIw6xUF6uIanqQYcYbv04uu7AX7hrfY7McyWoW+
	 aqgT8htU9XgUhgqiHy5HI614pFXbT6PRcuLGFC1A9Pzt9QFOW7G+4+R0xmzEPv3ccOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
	b=0Ri6DVOGABHA2blwtvYHxIrIltD+34hqKhQZmbW8IUVVOcBA+A6sIVfcyev/Tt55qnuE
	 V8HALrI72hTossC9MQa6GHNCN3S57ZXDg9nYejf48wzzICsnfv2n761gOUjVIgNLPuUWT
	 QSHCZEY8IuGy2zj1vs+2amJFYpVFQo2btlORYN1Zsw7qQrgrJRuMDjLApzmakv2EvF3gh
	 qWZ+xz8/kKbFzE98UxiW5Gw/IBA+ONa6G1Shx1+2vPgyz8R6mMQvUJR+1ELMlX86ayDyL
	 DqdqsQBXOERpIURiW4T30Vxcyilp8hauSiCCoOLDamn9dZrbBeKSsAJoPl/Bn9YhpUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WkaF6h9J;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3728606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3728606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WkaF6h9J
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so2653559f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476226; x=1795081026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
        b=WkaF6h9JurTRVTc08N135vasYLKJ/qoChtCycJzVtG1lYJV6t8FVHatj4m826g1mfB
         RD59yS73DEsTkiYxf2eQi9K3kg0fkgOORnjnJkOKZaBLGCk+Ofg53bJYuc1jWJBQsXhP
         3L2G3r44b2JwA1HFu+FOQweJOlQnYOGbCQLVwfmwzZOCaQaIqHpDhHgNXtmXwk/DJPlw
         XD9uZFVnSKd8j19SnH484ywdmK9gGGHEMBA4IRtcSCl0BxBsqjaWDELhg+k9i52a6cW3
         XAcXBiJ0ns0gavBYPDS0AMySsrBu343SJs6gmfgGCmbZ9m0HRnS4s+EPE+GeZKLKTXKK
         uK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476226; x=1795081026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
        b=V521FoMSmzFjopm7guFXgL9dre4JLA5zv+fnVB/6x5hGlS2GwMk7PLD6Cy+dDOypyf
         S60U7l4+UVzHOD29GoGNNbNwEMw49+JEqcYrcTw8F71R1s/KLErs83L9sFwLQUCeyviz
         fIan2VulidnVZ2BE80GcuSOExT+G8DKArznX/YIjC/l99z344P1t416Wm52iGdYbuVI1
         t5GWEUdZMnS/a9Fo9A3OFmlsDO5zW5P1gaY1ADveK7cOtNOtkX16OSC22MhFWpns6yoi
         DXZE8s6UDqTC5eXmoTl9fgx64i+AWuWxXGEWrtW/GW7pgwyCbxEauL1GiMzSmh3bAj2q
         Tf5Q==
X-Forwarded-Encrypted: i=1; AL+hErExw1sRx5gJaZG19H7zILGk4+HFnIfEh3xsRxxtKT41lOZ+VHlxmVaBC0ufpt4j7VWipnJ8TATnBV+uLSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xpmTc1ELzHezu369HtaYRkM2AREETRRdfAOBaJ50oL4V6db3U
	9qggHQMjYBDpPVZBw+t/AdOWTL6OPNxJHb5zw3B/f4Busr8Hbp8nETHrQE6rgQpTPSs=
X-Gm-Gg: AYBFou1WRkK50sHYLjEdOst3y7m0JfTz6DwvJGXuEeBNDctNlPoiETatRaI3KvelLRM
	pBEyu6ZK4ESK2a5DY8+VnbjVhHH02ewq+5sTnmchFyg8uibUzSJu2fILp4b3KlJnRg6sOVMAnb6
	HtI7mqzsslQz5NkRBiJzD2l7o4cbDggAOjB/VVub7174UqQ/PcGfcK8kX7UKEB2d0YEXb3iSJTI
	hP1f4GaAeapXVdY/sEJqIIEMaEjLNrxg63Fc/EoYYsqOT+ThyEh7oNC9ruTHH/aOtl6hfIZvULX
	OaY6PVtKhfiQzrI0618gwS4ne3hje7BGdFZuq4I0m+HotaPYHALb1rZep/KvwF2fbILuXTgqaKD
	7griicaPVMA9bOFIcFf+Jfjdyd6rrtwhQ5IK/ykC0kp8JJ5vs8fNYK6w4zRhecwO65Yp5YFPKVa
	Db3Zyt3DDO1ei8JEhgeg9d7vmForjHDFZXWpomlUe8WQp6jQlpa8Sw9elXyqF4DT5O8e1uFhAHm
	9/fdGD/YpBdz27lfoC6mBm/Uxzoibjtxdfus/dA4QvUhOhNYHmsML3CUPt3ted57yy059UGv4i+
	72BqP7rinxb6lClBHP4WfhEJe/4Wg+vFSZYHTOrnBsWCsveybuKcS50wt2syQNS61IiJsSDFbZL
	u3sTGcSpIL3RFzIquGssQ3v3mwXlfL5TLrGzqT+GATr4MUg==
X-Received: by 2002:a05:600c:474f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ba093abb32mr92123265e9.32.1794476226357;
        Thu, 12 Nov 2026 01:37:06 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:05 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 12 Nov 2026 10:36:59 +0100
Subject: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above 4.29
 GHz
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
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
PLL then computes a divisor of 7, not 1, for 5.94 GHz.

Round up with (parent_rate - 1) / rate + 1 instead, building on an
earlier fix by Sebastian Reichel. It divides by the full rate and does
not overflow with clk_round_rate(clk, ULONG_MAX).

Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..c3f46f9ee451 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -223,11 +223,21 @@ static int _round_down_table(const struct clk_div_table *table, int div)
 	return down;
 }
 
+/*
+ * DIV_ROUND_UP() without the addition, which overflows for rates close to
+ * ULONG_MAX, as with clk_round_rate(clk, ULONG_MAX)
+ */
+static unsigned long _get_div_round_up(unsigned long parent_rate,
+				       unsigned long rate)
+{
+	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
+}
+
 static int _div_round_up(const struct clk_div_table *table,
 			 unsigned long parent_rate, unsigned long rate,
 			 unsigned long flags)
 {
-	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	int div = _get_div_round_up(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -244,7 +254,7 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
-	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
@@ -423,7 +433,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 {
 	unsigned int div, value;
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = _get_div_round_up(parent_rate, rate);
 
 	if (!_is_valid_div(table, div, flags))
 		return -EINVAL;

-- 
2.56.0

