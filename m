Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0C388E49
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521921; cv=none; b=qwkvjXUF543Ajj/k/xaGkg5eyGb5GW5eOspb+VFKSFSLmeNSapYmGPzO1w8rqiiBl1qMUU5aNHTk1UPEpnbAdNUtJzoajOPAsWhtAWye22j4K6YXJoNUg5iornzh3c6lEOsU/vaKbPYK91dTyzUucb7X/MJE7UCI9lzc32QD1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521921; c=relaxed/simple;
	bh=Ai/Pt6iwST/hPrf66UHaVA/fpcI2B9b/ey70FIEcV90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2IFhobj6UU5o0LV+DnU7W+VAq7NNF8Tal3OrgwqQ2mWDuG+W1wux2YoWBpXU1LIDXIRJcfol4o5E+s6TvskuNnhUHlg6oQUPs1L0BhIvFZeUsJ9ji2H/jv1hSQv8zS16JEbwcZC8knlmn14MMgPINvW7yneNIze8vdmC5aCafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXDhaxA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXDhaxA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1304645f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521918; x=1791126718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=LBXDhaxA/zY4Lt4EOvastsQwONNivTIQJvXQScEFwlsk8HtyM+MLZL1y3rl0UqbsNx
         y9Xnq36gPGzTqD/W2249ztRGNGXWEFQZJLDbLfJmwQ6Ky2SWr10c2bvbDNV39v09OVZa
         m7Wv1ybejZQQwOGDtK6Qu9Srcd/l1+5cjFXRc4jRMkpZNhQg+1MEdvJzbDeC7fdx3YOQ
         VcIh8eOtUunvAjuY+WxwY5vz6Gw5gr4G5DF9upQD2dqt9HbKgQI6LRo1GtJv1Lj3/xJI
         kNn5SkBROaBBsM4pzmXGhjFbExpIn4b8DjOAqaoyR7oU0E7KFK2BlheuLYf+nBxQr2YL
         +evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521918; x=1791126718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=YsocEsAMrHUWgAatxvbg0DA7Du76nQHj4KAJ5O8BWUfeMAU4aOxGJXKVJoH9wO8f7N
         NzsZvX1ibDNo/6GVl/8ojm8cjT1YNuW2cQ1rO4bvGjkwVP9FtpYJvIkYRUbVj1hYNTfs
         gzN5pTD6VPiMdVbnm5PnNduhwWIB3dbsUkimRoej7pZk1Lw/m0oeW70NGl1OpSwzYO+Y
         iUQ3w3BxN0Jf5Ap5Ssl9Y+E1HxzaY0xao93cxgbJVYxCWg4pzEK1F/i2/JScks1A40ni
         dfJnIfRglXzEGwN0USLglYbLjShEM1R7Ys4j2COeUUWlN5dYZ2lNZTRckBmjb/EYiH5l
         TzJw==
X-Forwarded-Encrypted: i=1; AKwUvBz1tIWRQF7F3lLIwlcY0S2rKX47xfZj9iTs6YbSYoklI0tKBqQS9KLxkLCfUMXsTo/hjsYO/plxm42t4RI=@vger.kernel.org
X-Gm-Message-State: AFq9FYImqGXDvqHk0Hg34GlYbM3pve75iOYUTvEeYPhtIv30ezLFu/Ht
	XK2kB0x/BCQGDwgsrLjO1upuWbnYbogRyOUpOCNNUyy3YTQmmO1ZYx/Z
X-Gm-Gg: AYBFou2j8bcLaaCGUYJfYu+VtXvpgA+FCjv6um7/rFwseeaegcSDRzwcePtd9m4TM/Y
	ynzaV1wauBnrOhKiMQfGbclfy/DIQRFokLKhoLoLoq0Nu7o0rVdovs0ms44NEWpLbQwWb6yD5Rp
	fMNUakplOY4mtV/yHx0ji3r57G8qcCsuIOH5QWZuRKidcqmmWfpG7ueeKh/DQw0/UftL0abCzOj
	Bu2qPRmsKlTtNxHpnw8sw/2CqSoanQRaQ6UpzW/2U2yf5eOO9HaqP89FDju7UUJiMgE5ofHbzkX
	ozqCWQOXa58mtCKaHd0qA0wkPXk1ONOeT7M/y2oO+7jGD7AH3ZKUgXnb/I102NV8HUltNUkcpV5
	C2zPlaGuZcyxPKC50N3AXxnV/1+iVNFkaaNIF7+ZDj50DCYA08SU5HQg11+Y7fuKkYduJoFBpDW
	A6oJYlZyQNknGYE039Z4CWcosSSyEs5/TdqEYeJXGjuHq1UW35wmZJT1CL9J8gCjR1cNZItLoqS
	FGTWVmEzc42xD7yK8LnGrf+GS8vW/uG
X-Received: by 2002:a05:6000:288e:b0:488:820b:7e24 with SMTP id ffacd0b85a97d-488820b7fedmr12875064f8f.28.1790521917582;
        Sun, 27 Sep 2026 08:11:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:56 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:08 +0100
Message-ID: <20260927151016.186493-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..6fe3b6410734 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,19 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  # The B288 driver has no in-driver pin table, so the mux values have to
+  # come from the DT.
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
-- 
2.53.0

