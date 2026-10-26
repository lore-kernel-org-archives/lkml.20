Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009457;
	b=PQuBiySQeX17sQzMFpqnmN+1xzEuJjUSRKlS13daAUFPkcBOVJbsi4sr+cB06SOPSA7w
	 UAi1QBIooOoXOcfh+RNY3nhQtSF6OcT+5qysPzxaQLuf0vQ0UHqnN7dx8ZBNUmKn03+MZ
	 5x00CrJyotX0LDtWCdt3eJV23KkmQGe7t3FA4DlkBQ2y7pG3h1RhOkfCWPKyPHLguyvRb
	 jmytQBMwPRGPAfKVp47wFmnZbNAa2ya3t2+rTfCm5RySpSOnLv6hZtMHfrPvzohRvGr/B
	 OMUNUYx3n51gsPL3yzVtGtz9uz27K/7Qb1kHQc3GrpVmc0yqKJgfAawtlmi/bhIa1sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
	b=m6p1MA92PYkqolNoUnRJDumdibc+3lSXQ6g784GJrC4jCeG+n/4f9bIbzoPtNPDQoeF+
	 pTUmxr74Ljmd7L05ZlbFw5kPwhpNf9QK6kM4OqgkndQaJ9ixy9AworG84V4a7abJFjSuF
	 fEwscqPNCNWR/QdxY5MfaLKi1AZgYlLeODQQYwszGSX+Z73SM+/4vFmqdxuW1i2O6NTRz
	 53Ij78yzL4UliBwq+F8kYmSGUDAt2T8vCHuWe4Afxtbd3IA/sa+ULjt/DAjEV3QWiXSxp
	 1cEEQGDNXXXZdhH8jtH2oVhVvCplA+npqLYUUXFDIvxkjTmfRM+2hDERm9s28vBqoZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19E60A2629
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC19E60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so16480385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009455; x=1793614255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=OxUnodPmUTC4nxwmk8+lndH5TemiJmiV/MXQqlMZCjaKj1XrhtOrSC9MmLLlE+NNDU
         J1l5saJAI5m1GsVwLNVrCh+YcQ3kXp3supWzimXI578zbtFu4r9LyvZFwVJwzuZcI2Lv
         AP0DN0ecaNEUt+ZAxW4rlkZH/3h7YfXQNwdugf1uAO8pkCIriAEa0Vt2PxQVJRdg9T5p
         sOkMYrAQnD1pqMIevWia6fRTPaYkR1lNnNFqOjw1rtyXEXUr3PNoWSaPj8cEtD7JpTXw
         3jB3wap54H4voKpkcaLXWIw0uWY7nxruzjZOcUd5DUkg7qw7eISUg/KbSTpNMLVdCX30
         SOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009455; x=1793614255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=bKy73o2cQ2V4roQsdgppJojx5EftOsGlBp2mxspT9kY3xNHGrs60+PFD/8ddQuoOz9
         hxOX29Kc7vVSSuachgRTO5CTcmZN9NdU+hmbR60lkAXUFrwJfTch3cRxf58hfu004lpz
         6d04BCL/o5fasLi2CAAO9tqx4miCI9dNn8JuvK9NNlS9yLrCb7SSM9+AwQqXoo1JYA7L
         Yx48bXfxQqao/qcRSWeSqV6/HNM7LoAtXyB0p+ZXFw0kCc61DCng+sl0drm5fLjaOpx9
         zMWnhgx54sw4pf4DIi3RpDzf5wGdjxJ8BZlLRq1ycpmH7MPVvc8JwJogGw9AdsfQao2j
         Ftsg==
X-Forwarded-Encrypted: i=1; AKwUvBxuHd/Leqm/G039TjJhSFVpJdhRO6Pecq0gioBFOkDF/2YYu7fqKJZS6dzEyajCgBP1wLdhiZ0mnvng3ck=@vger.kernel.org
X-Gm-Message-State: AFq9FYII1aYTb/ds2FD59JQbmi6i1kl4fxCpo+NjyNUyvyYuFhuI/Im4
	f8KJ2GHxlJZIZvOJAa65NOwNoT2r6sOx7Yb4+Xi3wT4tgqkW5HWtpl3U
X-Gm-Gg: AYBFou1gteMSQhK66WJt5ncnjWWqg96azdRAQmZLBYaH6p7x4wIak4SIVFJBBGHkc9Q
	DU2g/kTx54SFGkySHElGXfjPMdMwh//yQJdQET3nR11/xbt7MkJiyWXKTBgrKfQrsvQrQZyM7Ag
	M/Fs7Pkz8igpqE7czJngr20nZ0gBrOm/uraHNhog5GwNDBTv+YNbQbhiMSFXNyMpea/Kbxs20+U
	yl88wk37SHW7nwSsMSiohVDRjR2Q94hXVjecB1FcCKrsw1vUK4wLQt+rrAnSWNH7uieCwQMFoxw
	Ks4ndnP3NbWPtwPftcYXqvCRKJg38taS4BvSmOPMYr30UgUQqSvSWmgjVkfinx9b5EQLQt0BOgW
	DA9Uay0RNvjxeVgAbF2ADAVP8lYrUhVWSJ2+tjzoHchiRcC/U2HOjZ2OnqitkUFV6m+Sq6l61qf
	2eknsnVg45YW6VdPmHUwn6VAc40NZNyIjY8uO1ll2rlKhr9pIcl76i7u0HCopwUmyYXj0QOxEcB
	hryV8kU91OrlWr5VJPNIm70qavo0YksH/UzwAh3azB+ca6ZXXvGyuVI2Ty6kHiNm/mMOs6W453S
	a7sYyj/cZCGw1M5XpxUKA+A1t69BblLSHM5sj4WV9IeJWcTEVwVZ3mx39EY2
X-Received: by 2002:a05:600c:5253:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a35acafddcmr120739425e9.19.1793009455114;
        Mon, 26 Oct 2026 03:10:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm15773487f8f.46.2026.10.26.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: an7581-afe: add support for reset and secondary IRQ conf
Date: Mon, 26 Oct 2026 11:10:24 +0100
Message-ID: <20261026101026.34318-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Driver got support for configuring the secondary IRQ configuration to
support full-duplex mode (playback and capture at the same time) and also
to reset via the dedicated SoC reset line.

Add the property to support it and make update the example accordingly for
a more specific register mapping.

Also add the missing #sound-dai-cells property required for the generic
sound node structure.

Previous register node definition doesn't prevent normal execution of the
AFE driver as the additional IRQ register is placed at the end of all the
previous AFE configurations.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
index 80d9e87f1470..86d006559436 100644
--- a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -14,15 +14,25 @@ properties:
     const: airoha,an7581-afe
 
   reg:
-    maxItems: 1
+    items:
+      - description: base AFE register
+      - description: secondary IRQ option register
 
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - interrupts
+  - resets
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
@@ -30,12 +40,17 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     afe@1fbe2200 {
         compatible = "airoha,an7581-afe";
-        reg = <0x1fbe2200 0x9000>;
+        reg = <0x1fbe2200 0x100>,
+              <0x1fbe2f00 0x100>;
 
         interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_I2S_RST>;
+
+        #sound-dai-cells = <0>;
     };
 
 ...
-- 
2.55.0

