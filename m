Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384793;
	b=aZatTSuUfi0h7cXoEqdQ7IQID8T/8//hGftyuPOZZB5mhxeptuDhGkj7wpJPm7yl69F/
	 NMhqH8Lcbh+g00PrDN4TSnlQ3QUlRRrqFzA/EysYJelsX8Wp/+NkAR0ugQOpxAPoMJK8M
	 DQDm+8gIhmUbyz2geYumkcLc7HphkEpLt4LMxAsZalqTUJRDDbut/2+yI8YL731fvsLiW
	 T3dubUg+NNwTA3kyw7rby1GXfZtSSyVjQHomqmcuZYPSJ0+6R77x7YMk380dw++8ogRDH
	 tfCFauQRVpIuFpd++pO/dsm3cubZy6GZfbR+JmQ2hAUAtpbdpUZODfCf1ewi3rttdZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
	b=xJ7I/CcZKpN318aTOJFxyP/oz8FakposQbaCOP/EQRThvUBah2/mRGNVZ+EmgL6m4YdY
	 3pSUOF7x11EPxw08NiLfiXvsJPrB1WtQtQjhnJ9mKPrMgxhXx7cpdlFWdNr5EI9gJtdbc
	 yGM2Q5P5vPohK2Fv9QY1Qcd6fcU9WGs7Y3gBMo33zAi3Ac0CBAsqtINPaaLe8VPyl7c4Z
	 5Qo60AI620wXVGXJc70OQubKNU1/jMqOmo1+aXTk84y3jxFc9hfpkXzeRtV+h8PKlKvRc
	 d7sIaqUubDlt89KTbKSx4/dWJTBjmqQxMGCx73Gl77uJLIGVyf0bZfZZZ85XHh2G2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LTdeXjtq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F45960A262F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F45960A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LTdeXjtq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so32822145e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384792; x=1794989592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=LTdeXjtqjB4WD47nf3Vukz4UpHLDqRlC2DayEHNk6Afl/UxV6CjILM3ZT8iyvey3qH
         c8AZ5safzisXkd/wXdt/zxXYITkoQ7Rs2xn1Q5Pwr6Yo8pRJgytdwxYpJziWhilTECIc
         0exvI1Lv00IN9+oYEKXz8p343LK1LD5CcmMVnySCO90Vq5rXPyXlvhmB+3I7lpEGlh3Q
         pzz0azTg2l1qMhilLO+HhXKXOQaUjvZkzb7OkkCsBK0aUfVDDChaCFdi/g0bWK0gXtzX
         Fo9mo4WALeyzwks7SKdOaq+mu+FPyj+KzTEriBGwSKpVcEetBXEMUFtoGHqxtIjg2vGz
         HDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384792; x=1794989592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=Bna5N6KR//oDI4W1vSywQf+ZXlt1fbGw318VTsSh/5jrnjSmX1i2qeVgR/lTtwhA+I
         u1J2RZbZWhLpS+lsTaDTj9EAwVg7+r78i2CEwYzJZREA694RnnKe7cu7e4lGQaxBwmYo
         4rmTT72yIJfyo8aSKGg2fLhqk2YCPiaKfgMzlENGYoh1CzwauLjkO9Nwh9wi0XVX65UV
         MTUeRV+Ds2WL3dDx8sqi+KqWpZYKt5UYxC7KwkIZQRm/mcxjl/VnOcuPsLDx/LORgrJX
         5pX8CWHg8Wg1PyrGNMDBzZnRU9oc76vTYFgV3BmyMsezcrgm8XbGvzrWBCPiB67TwiXs
         KZ4w==
X-Forwarded-Encrypted: i=1; AL+hErGOBj8as9Oos3Uc40tBMNU0d1UX05sRrQpLXBLnLh6ENkdKMYhY866r8voW2dfjlRvyVEcz2uGaIr3fk+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NwLVvwUuPLSwoq82DuN1yJ7qfHo2XvdJrfkRTycqqQ4Ws1Ihv
	kJ4VvACJbpj2LzVuGcyS1ZkSfULv9j2FYWYYUGdq9wYs42GoajpdT/w4b7fUJmgpxEI=
X-Gm-Gg: AYBFou0TxxNkyKBDkS1KXAOHJQAv3Varij5IoIZzVLFzlSCEf9j16FVKj1wDa3oLYHm
	xjlToptqFyqsVJJrhkIHRAJQzYut+yYP2LpP+zsTAyv4gHAaU0c1GeftsoxlY2dkW0aenVMLydN
	rNvfDILBUNR9UOaXDbXLMNenbKLDVFnRrfe5cjXClwgfM/Xg1o2tTiDSh31FEoBuKmSedCof7TM
	H+8yUfKe/EvR1NX08lmEhtQ76WtQ9NR2Av5E3/Kw3jJWAdOwj37WpsPolVz5YysDTpUbjI7eQZq
	wgnEKychlU8ma19vd+h/lgBUm+1FJtI4wG0HFj/ryVahCoQDWRVSsWaQSyjz6PEaUYL30oPLnPz
	ShGDYE4r+atk4jVI0qIW1blT5T/eo9YWRIen2UpHAxh8TXyGcE/+CgeTr7U8Nu8MU63pQO4LHZj
	YOVt9Nxy7glMKDzgbwUsKeElFqubbRS16vXaqoaNrSZfkAeEfNbCI+ofrXO9YJ1b+SUM+2hToyC
	Ep7xQpYKh+ZrXUXNOr03kQHj/9ke8uCdqaxxy8cWkNoe/2yCEQ7FTuc0hvCFSGM4SDxYdF+6fIZ
	pzeB2I/tYOtWnDueLx6GjZYmKYOfDtZTAxI6aDkTWy5XbrvzRkwAHFYAv+DcKt45Al7R2opBibH
	V09IBr1lEFQ==
X-Received: by 2002:a05:600c:8b24:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba0938a10dmr25548105e9.19.1794384791851;
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
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
Subject: [PATCH v2 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 09:11:49 +0100
Message-ID: <20261111081150.950272-5-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

