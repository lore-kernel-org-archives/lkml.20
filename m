Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762716;
	b=KuouG54CzfBtBbpijJd+6KfcAHa7ZryNkn9nPICF/EwmQW9mF8TXEU1ZewtseQOq57f6
	 JT0hEtRHBo+G1nzQv2n2n9YwhnGpyKsv7HNS0ZObogLhFAH9DFIvKPuPfuuH6VSuc3Kj+
	 V2lzMz2bdhasC14nk0yVEeRIs3p6twvJOFxklcZPbpU3Jf/PSxIqy9hhrvr8q9+HTyS0B
	 ax1urmSkxI3M2KRcCSWZXZ6VT15aTdtoYheD62RnEcXC0MV+LLo/kLB40zdG7ulDlQQ6e
	 40P9fDJqlTwnmVhStD3mvYLjUMnv3LLhauGN/aaXevi6g6RPUSlQYv1f34MXaS84Mlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
	b=iSDaxTCsR/vIpY3PcZNvBPSL828X0dEQ8PuHgtfhmcYHOendFZ0HnNVP4ol1u/292DtQ
	 lN9vgsXVey/5f7DFw6CQoy63DcXSU5CjqqK9BQBF1ZB14GqkOCXtyfvyHUsynt8BUppqK
	 sAtwqvbTpTPqSK74O/aUfWsNZAW2EWvzFGIpPDJ3C6xzXRCPZOyVcVacdtpfOY+hyPwi0
	 Ef09hFi+eUqQPfZESpHkasjnnFMXq32TIq2m7jmMFW8qWBB4rPLN74qSYpZ22y7r3FUfh
	 LButfnTvBjOHgxrP899WAzPUYvXPEJAgpWNmkyfod4rY/RWNMYeg1wHD50DfyJubNHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=eapHzAaA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728D606A8A6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D728D606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=eapHzAaA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20711335e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762714; x=1795367514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
        b=eapHzAaA6LfdTDi2XpzV2acZajFlvqIjQ8eYwV2+YyTjvOxhSIQWoR81b1lStVRbwx
         VDivTF9kpr+gBFiUJ9QCITDVgWp9wXt6bzacu3lflkaOYVLrKk+S3iAnf0cI7bh9BwS0
         Vd7BXRPIM5zgNmdAl8ihFiuaOPGBzez1olUXci3uYrpY+LQ1afTnYNJJLGQcAy8t0oVs
         xqREWrR5ZIvRhlB0k/Gn6C6+cR5vS3zLU3iVn1/X64A11zRHNJbelS3rvpilRuFJdflm
         D3Uiz/VQ5jLdhQhgu4lPgroNl7gRuXXagwatcHTtGzf7fes83oo2plN7xumo+immm/XQ
         UMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
        b=Y2gd78lO29NA17aUMMZ0llULbdQppiY/YZbKS5T2XRXd0ua3ZrOzrIrBdTyMauLOcp
         ZoWssqeGrb6zHiT3vjY7r8LXXuBv2LRFEdw2faH5WzqASxUTURl36onbcz5dd80tJVF7
         7WOEkDWrm7t+JG8x4ZDShQZptceRHvdsw0v4yXFLmvXmTRThaIHPj5Ql3Hmgt05MU1FH
         rQySCuoIbwpjWdcn/v1SVVyXxL5VEWpPmXTlRkdNg+hqfjZVS389molhC6ZbYNP2XIge
         hb5ST6Ilt0+VRAn1M36DGzMX3Y8jOnKOiBs5hAZKW2B2jOLpfQ0D/bg7qaRBbkNpi7YG
         kEJg==
X-Forwarded-Encrypted: i=1; AL+hErHIftyFxa+16TOcsV7E3KcGvWnCzd8LVY95K+bfyW2Xd+IyGPL9mVkg9/jEBp/zS7VsR81pGWHObjgwK/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z84ApiGcp0qKaQgZUin8BZFd+IEbFLD1Wv1nU6sIOoiurbZbJYq
	M5UzLrCfwaOVSSI3J/uZGtGa2tl2GfecnV2tLCKhaoHZvr5epOlLTFsMJ4p5uGAbAjk=
X-Gm-Gg: AYBFou1xjRyrEJMdyXveTzQl2AWdavhyaxA/bQ96LffFpKHw0AoRmm8fejbjHNYA2yz
	qXMmwb8gZlTYVJLaP5lNghoE4xvbpapiCIAbU7erNKExDE3MX1MTZGgk3T2kLDKwKH7UIV3pGr4
	RSGBafwnOfZtp5nlV+RzxgNV9HFZjkwVV4Kx9zNTrk4ThX2KKwb/2Xo0seR05NcJShk4Rca0Ypl
	LSlb/uLaFk7Vxo/jhyZ02BwyBXZ2Q3NLgP2htXu4BX6gVB5F66xGrMXAx55c0/h5r1zizzJutn4
	lKQBisJ4Okf+wZt29OYbwN5v8dBgjZQwyCXxfG3dAfJwzz7j8kHa4/IC8n40r5MLf1MlTyu/RBY
	XC8Ee42tJqLd1f9LfuWMbp2Of+Rft0aX3oRbl9TJS5DKbtqhVCGTaQgzqw6I21QkmRcZ8u1CQNa
	y7yYhexeAGcuMpq0prer1i37dUG8IwLFlIMZxpwnGWeqDooRjecoqaT4jPBsgpnvvsfEj5HQ7TT
	ApsGDHw08pUXOlJKNk1tjqlXW9MMhF2tlIRIdAORbMYKi3/RTdaeI5icQRpOpuOU4+q8VpMsXlF
	LRCt+7vBLQJnwiKDwohl2KgvW/M8KhH7fbVqQy5c+CjKqVpALOoO91eXIPHR8Q==
X-Received: by 2002:a05:600c:3e10:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb6651a042mr80157395e9.14.1794762714298;
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171150.64431-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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

The AXP2101's USB power supply reports whether VBUS is present and the
input current limit, like the AXP717's; its registers differ, so it gets
its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../supply/x-powers,axp20x-usb-power-supply.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 2ec036405ae4..439b3ea6a7f5 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -25,6 +25,7 @@ properties:
           - x-powers,axp223-usb-power-supply
           - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
+          - x-powers,axp2101-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
@@ -101,4 +102,15 @@ allOf:
           enum: [100000, 500000, 900000, 1500000, 2000000, 2500000,
                  3000000, 3500000, 4000000]
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp2101-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [100000, 500000, 900000, 1000000, 1500000, 2000000]
+
 additionalProperties: false
-- 
2.39.5

