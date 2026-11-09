Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240433;
	b=I7ouPjfe+cZlUaix83IY5PCmTE96VdW07whH0/V5cZVASiO91+qcBM7suOHxvygwXr2n
	 oD+IzKCIW/swkb7MNU3ADT4o91FdCXbEXTq/6VrvYFgD9Sp7WFpEM3iPjv4yOvAbeS4Ge
	 XlfM6X8lrBhe1wzeaW+JdAT/LtK13sPahx0A/X7NxHHzrDYyx2TsUH2IDQ3JPoONb2l+z
	 B+p4jz9Ypl9wfX0TUW737eisjfVaefm4D0AUiyXfo9BLTFWOtEFlCIbLJr4CdTIREGSc7
	 KdtsaV17ZBmWipCl7HrTiwzNIXHCUcwHdjiUw8Brgc83d469HzDPSTPGiwIzi+SOq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
	b=p/3Kix8/vrJsefiY0l8CWO8U0H1jy+4/9KN317q2XNQ1u4jj3rXzqo4FFuWTI9+RENhq
	 ZEo/+kaT6QkVceMGEnCS6hJy6rQJzVImsY3HtXJ20dkdY6sDvrZwPAY2L5DiGYww4rNEZ
	 5b0b29ZoxyqXCw4ZSoX4rnOI4amqA/ELRD6WtoJXf6F5SMTnB4nEOoNqkgPcEBcTh9hNF
	 uBrLvXlccp3AqZ0Q9Tndc6SB+duWMYuUvf3pFlujOXL0Sz6eSJFhg/o8N+oJhOH5ORzGJ
	 9NUf6wdA0Gt7hzq8Z1TxYF8FS85xtpqAB4Vkj+TV4h5ic+5kyVQzoPawr05kM2Q4qpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU1oOHlD;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B1606EE80
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5B1606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU1oOHlD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9234995e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240431; x=1794845231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=uU1oOHlDsF8Y5LSlHRRXu8+SaFMiIGnbX1Q/agAJo6293qZ6ILwjIdvFJjvAxtQt33
         L4BjvoNufBXRQyWBmgBOI9lRiIl8wPyi9wo9vmnGXR3mNcOYeE6/UXPpE+lynYVvrZAk
         FbrKH+/cTSnMvlG75HxKlvZx8IwBjFTmxa787PEXCD/g9Jlucm+ZzIx1yfI+A0RWu1qp
         s8JomLL+w9ItdOUpR5GgPjoDyXeVLsEbqhHROy9T2GgIKbiizSeYgtjk8f3hzTNVxN6l
         lQ/S9HlIrI9QCxv6yq0Ww7CDEg9joGNsh648mOQCaQ+c/1F210GxzqkGsplUT93mWLAV
         iOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240431; x=1794845231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=RLLHSjq1uesHBG9Em0g2UWupExECP0OT5F1jVXe3amZxQsnLxOtC+h0kAlZFzqRpxu
         qAqz8iRsUI46OzQ/l1+3Ac22LAhuWJdycRfc4dNCXHzUfw21Ns5vNDxEHiEgm38XZtxz
         3PAqRbt8ubwbu19FzQVxroghBjzf8xRxHKRLMVXKNKiloa1O2AYCqLRGLr9vVDS8wsJM
         OPjCLyKMhCT3kuCTTc19QNo/4FtXOes5werkiSjBHiL3XQXml7BhLwi3vSHv2NFARwC9
         rC7xaZvFtsslrZlUBNrHK1uiOnQMXOToebWC40UAcc1B8ChajBq80ei3tqd6fERJ3kFE
         cn8g==
X-Forwarded-Encrypted: i=1; AL+hErFUVxVVkuVEoHETpN1EwQQSGqDBpvfa8FSTNwidrFArnsgvpL9pMHGBzFf88xsoKk+EQvtLK9LdXvsZ8M8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/9xGWwH5pBWtJ3R0rxnhkLYfKJxjjLjUNrdztmZE40XaA0uNB
	v0wlC7HWxUbVcYC725qumRLAbhut7OeSps3Jeufhlc0XrDFwYfIJAOYA
X-Gm-Gg: AYBFou2b1zwTHLCZqjBp00RX+JPCiQhXqj8ffz4pdROOlZeeOCw3TXND+mM2j/khFxS
	UQyM5o5aqY4i5AUDpHNPg2OSv121KocpvUhUwr2uX+9f1eL+GtEhxM6ju/BJxAwNpJyygGtBg/z
	W/ILmWEclUbjUDK9OFfLUS8dTWkDKIcSK+W61RoMnbIyaMJ+JZVQ7/8PLVR7xJgm6B0TuaPDVJ0
	u/WfXJmuAFakTYF2TpM0SABGOAIh9/Yd1WpsqG4T+VothcuMOenIg35fqgi/ZWfUSXcTGjTgC4H
	Uzx08NsipUHZznrPFMO+EnSckS+8amu3CdjsTCnss2QPtjM3JQ4S5DWqRAzckXmTT8smVPBJMix
	crgE0vKXy2SVKxrfVBrMfsVn9OerYqp+027wtRlxtYV1RDf9GkflsRljVGAhDCXbtFox06Az5ij
	K/ycfhOjJk96eoYNINnXh9gukqfoU8FTbnfQ9saDFpVf6/3ol/YQrWLDvTsvIQgjZt2Fi7lnKhZ
	40GCRBIVK/caVE29a3tv2iNjiZ/zsgRjmJGNWHdYw70e5DenOUr+6uMSQaaUv0a3hrd7G1cxCs1
	TICM0EiUqVDhRahyqauQWse+qNHDN60qr4GQdjFwI565XVwKJScqUWK9aeYWa6UOh4j7Kf6pgH/
	hGGIaBKqtxS7GrCCUlxnPOn3ZIVxucVd84XFy1aRip9/9C9evERr0XRQMwGAaddY=
X-Received: by 2002:a05:600c:34cc:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b960da49admr82912395e9.6.1794240430762;
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Mon,  9 Nov 2026 17:07:04 +0100
Message-ID: <20261109160706.2272332-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index ea7449273022..016a573893b7 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -32,7 +32,6 @@ required:
   - iovcc-supply
   - reset-gpios
   - backlight
-  - port
 
 unevaluatedProperties: false
 
-- 
2.43.0

