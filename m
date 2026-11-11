Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384789;
	b=2LTVw/eLGzh7em38UgquVf3wpo1ROPyseWR7nlMXL9+de/E3oI84pjlgtpczc1SuFcwo
	 nx3eSrW2FGTW9+aFa2Z/xqvHXtkpwdWGLlD34OtEASvtTh7B4PZ0w5lpYlkCg/t2U8yL+
	 t14f5L0Quzyrd+OcAPBnG1sIUe6h2I1iPLHPOLMdjFvOeS6CO/kBtZlGgVC51Bw90wKYr
	 aLxGNHNSicAnVl0TPnCZJlCLz0/FP+WDswBhe+uSROazwE3yzDJGHauKebfd+GfhhVc3A
	 ElGtuXApMc8mGspImIYwVMLUyytsfTD9eVMvSwB1Vk0678bsENHlcVwsAmk0aZx7+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
	b=BIEvzc5p9pbjjNb/E0Si8UCcBw+kDA6cFGwE2go2hJsXfT+Sy+tNka2QadnttDa8w5t+
	 DJgEID/UOG/CmvEyiUuHq2UVD+R0DW6lP9kRUP9UXzl4CtbEq8GDWfRO7BdWZOFarNBlf
	 ZEAD0GFk5wqYb0HxL2Zas9UIHoy4ISQb/HFA+oX81ylSeSWvaDkO9oWqkAt8qVDxJAGhc
	 nl6+fraVykZdqcIf0swwPBnlp4vqZsXs/A4J09wrkwBOGdENMHMcBnfqToVAk2Fol3OSj
	 w3Zp0u+gXL5Gzm/yIgwg+Gz9axemYfUicfUhMCvxsu4fhZmJXwn33ym33F9xoFvzjdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bgcSh7za;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D281F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D281F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bgcSh7za
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so23704765e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384787; x=1794989587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=bgcSh7zaemWNqvGsnUytQTeqNBNJWJnjKvT5yvOOlcsQPt0cESasUROagaGxfSNfa9
         hDSRRussF5dslkxMQeM8k9y05np2GLO0qn3jYfs4COa7Lq1V8NuXcTIvRCYWNUOFlLrj
         xeEKc+K1J0Zqiq2VkK4v8sk+QobaQasQWySYPjUfR7wgX0agAMPNtQrhsJCXV2MbPo3N
         ur0mV6a0ycLJKCIdclExajsbDV5iODCqFy0hHDXjmlHPRaI0D8l6cs2PkygYfuIpvJwc
         z9qkd/gZL87hDHn8sqAS9AoOnpyCzJLecaAZnfLMznML3wCW/bTBzo2e6GfHfD0ZsDjj
         KYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384787; x=1794989587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=JyErbMQ4WTyIQZxcz+PlhqfqhvYlYhZzACPHI9wQtUvyYuGN/VnoLaGgRxUbLVvw8e
         G2sH+337S6+VvwK2/kh+prSlUdk+4lQjiSyRcqLsuDbqSs1dgiMnqEuPByK6DmnIBpU4
         32qFRJvVs3BK/fCS0bLhlg+YKeuqEbEraOoZ60+alWGJmWM10EdrD+F/rXoNfMqCTBeT
         VkcDtmUDNj++1z0ui//W+q6tjwj7k+VEAIik3QBuHAKR/gff9g5/R4dT+EnP9CdIJTs6
         pJQ8KjhMAXpcAeiDAN6YjEelyYnK1Q6QhGkLKl9E2DsuDvWbwgl5NZw0zTtFMs2kqjLe
         3ScQ==
X-Forwarded-Encrypted: i=1; AL+hErGMPCXRa+WZ+R94bMcjTAvUqdKuOW0TFl/t3XQlMTersB76nD4tM1GhDiIcMGdYyarfr0CNM23NG9ntw88=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C1nWnTPryN4djxlpxhCekzH+u5g6fBPx6VLEzZZ0SntidKgdx
	00yAzBULJWtNAJHxsJ7ZXwxEvVrVcYkKc/fjIl6YnmQaiy+oprANo5RWE05q1uxFSXI=
X-Gm-Gg: AYBFou25uTv55QaWMnnNsLqWdcCUJV6vcqd8/rSsPOvo8v7UEEJMQ0qldy6xoUt822f
	iGdc7Aq5LtuTTWuIIdClUimeF77WxJURAqRBnOGMGmPpJJCwlumPjbhjLH7IAgJoa4WdpkXQPrI
	NUhIVRh94dMhDiImsz0Xk7UK44C+9GwtFHuELs7jo5RqILLUK/BBLvuAKeh+nV30O/GipMPsAMs
	3vN6dQE/IpVPbmh/RbTIgNwA9QRthPE6SEWP6RoU8VUFjthOtyO5NYsHFuYIlzQm17JMgZ7mhrr
	80zxEUy0dEkgqikPPrPezOpAfqXrZkabcmg++UCjmQKv/y/I3xPoDUa8Mtn0pgB+LTuFbM0p5An
	k/CVJWh9bzi/mxR2sv4DOzY2vGt5AXbfSYk5lD0rD1rhyqxKomubuVs0H9MCaNwarCmPwiiJFx+
	H0vC8P3hKJiPDQoLEhPeoolbe69waaYxMzn7i5xLX/P9J+LGh5tCeirFn20rmIIG1/JXAHkaTR4
	aYAmkwrKD0QcuXL0mHm4LULT6X8+0nEsmMEOt4NTnhNdnjPEKRE9uskRhTZ+fo2kCAjDSnMZ9uQ
	9hwZy+u95adYsiED6dYA8A1g9jeaN1VPGfZ9trWAQ4P3wKIJ3pyLI58S5FCX60ypnXZ++B+XnA+
	S3mnJTDgNOQ==
X-Received: by 2002:a05:600c:4f46:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ba0937bce8mr32273765e9.28.1794384787479;
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 09:11:46 +0100
Message-ID: <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

