Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909236;
	b=WyXWSOKDolzFPlcI0QwpNxNw44ijY0FlKsvMG+iYrlwWACAngaW++3VMQvH+0TwdqVzK
	 0kaVtiTwWIPBwTej4bH0oXhVpgIHRQkUQfbUNRGWbb1gQbM3TzJpmXr893RZFhObcl9h5
	 RtJI7Sfk1u2Bfci37q3Cvsqi0xwy1eTDlOnLgEQuHSl1nuuFkgWUo5+WPX+WjuN6a5SMU
	 U3oWeW7A3i+YuXAcBU1TCrk9J5VDKQrwf571TWR4gP9tgZNfoByrT0XGFE58QdOAq7E0N
	 kNwgXgoI6M+zAa1tCbZI3T04jntg3OwNfAOcVhwf2UD8lmdMZD8aY05GOroxBdA+4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
	b=BsO2Fwpur4DqN4NWf0vPkPeX4g6cKi51T+2YD0Hc8K21dLyMkh31s6hroaqLsxJ/c7TZ
	 ACwhvIDlmLxkAO6vqRlxYoPmVvGr8jlE+g3S2ypQ0gJLiRj9ZPnLUrEoJCpsrel3hYd3X
	 qBmlaOOoCtkULe80YC8BtrB5RV87yk76W6a7CKPB80/xhGE4MD3TxgwttfhOpfxt5jNRO
	 4Cuisg8OXPp/eaepp4U8IqFDCemIRjvpOp/m0dY4Wf24Q+7a4hHEW+LsBH/n4//HANJbt
	 TDdZyfBVBt9pBTVuUKu5Cd6QL2dgZNzOLM+8f9wKv1/2G4jeYn5Oaz9Vk3LMgrNwT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A43606EE9C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A43606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso25180055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909235; x=1794514035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=xHgnd0YwB3pVKxQKrb7e1Dxdlxiafgo9GQRfOsdPZr7HAuus+XL5JFG05Yxw/pNIWg
         kY/rIy1IlI40ze6PsdD0U92wi8F6AoC0m9dIAXPJWrkj+Ys0WZuXWhkA1Ept874kB29X
         j4HXwSVEKoiekoKMeShmaYyF+YE/odF5B0EICZM1GCeP/I9h/mBBKouctuzMZI/wuaLg
         HI56tMGrt3yDDoZsvSVOOOL80AzwogojKRkey3o3z/+WZo7A9Al9TZuAwTz9dr65H+T8
         izYXAm3RXgSm60s3sU4thmzgOWXZye3MjHa68XRvdut8E5UWKVJJwPISjCRPGoPH4LCb
         uloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909235; x=1794514035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=v7icaDbuSFZQFHeH3ab1Oj2GYd9c7/pk9VSJRGAllTMXobawA4mPkJLiEBoEz/pvTF
         OfTGM+eojudWvEPb8y2B9RFzOQLu/B0KiM338m18nqqwn38IeOI5p/LyxB/cfgY6mAWy
         usKkwhvheXhMAInE3ec4Qre/0y5a4e7/p1cCVKZMJ2UvZGuW4uxWUP9KsAD2jRwO+Mkc
         bXh8dRJTCagjZXwzie9WM12mn06rLFPHFpZHAE4/WYDmPtAlWVfw9kNc+bzOhRz3b1qI
         ctyFlJOYR6zy3GNHy/3yTtDeqjKPEjO+J95HYBehg1BUi580KFrhRtzw7lhDwjT/m9vJ
         sepQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+33Hd/JC3a41uL6ExsnpdKlTpsbQQr3GFMbCP2fRx4uqE3v8Y37s2CEiYUF2623YBYR6SsgUfoolHkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uJ3C//fDYOSTE9JGU+iAc2+HepMIZN/gB99SdjpwQARCklgpJ
	Pj7va5AJxTqYp9CRSYCQ2hoIaS2aBl+LOQoCyVVV1SSXKSPgEk4kYICS
X-Gm-Gg: AYBFou0mkU1GVL5cE6BlOT2Af9re/Kx1by4LMS7pvPO2EHukKzDz9WSrs3yVGAcf6Ff
	tRjZSgh5FlQ2VjWAp8cjTwV1ez/qccE1695R4PqdohJNTZDdkQvEi+GPGUsUy14bA5ZJwU/QXlu
	U7n08518lrBsnCwHgE/z9lb1edRwGFsHXXJXCFvARHBdYDD4Lg6sNvf4+l8zRlluzYJgHhtpcPK
	gr+twBm2IiXhHkxblmWDYzvXsJb+RBK0E83ZhVogMIkfyO+diNrBMa45VggpWhcbj9yr1qK1f6t
	rnAn8A2FTrEWJAPZDyrXotdOU/1T+fCY+tdvC+9Zb10N+vyB7KLcnlcMkS2ZHWh5/qaiEdvkv+x
	PV2zh0v6IG7bK+6/JBvTwEfBeAsxsbjm6x2j7s/rtyU43jEzQczfwWe7mnvl3H34GZuqQOyPlHi
	fHbqp93/wqljCesVbwVbq6vY0P4ECsI2II14tmy3zgXvPdWdH/qi6IxbyPkv2pnlr10cHmlIQ6c
	jnecEroRrf1/AdE5uayqjzXM2m9+8kwca/BXoeyjM91sQK/k81edzu1ZI2Bj3s6ccXOSP65O6Sf
	uQVtOeFUOUmxgvSN2Yd0HLNtgXTJ78CZKnBC1eZ0gtLdEVK+SY3TDiGFC6w=
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4b6de1c6450mr3686705e9.19.1793909234959;
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Thu,  5 Nov 2026 21:05:52 +0100
Message-ID: <20261105200556.34240-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105200556.34240-2-apokusinski01@gmail.com>
References: <20261105200556.34240-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.0

