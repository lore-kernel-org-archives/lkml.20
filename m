Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF821437463
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789946; cv=none; b=XVxkoIeBcX1DJ/yHckbpiO9joFY90PK7RcgeffGcKnxEV0RjRcja0p1hYsJxdhwq9bcQpiTacQ3+maFuA04OT1f4rOuNDC2Zg68nDi8aZeBtI4DQSaal/Ed+oocEgV9wi0w5c7/5146K+tXeR5xAYccqlqtdfhs77GJiQIzgENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789946; c=relaxed/simple;
	bh=P3ZmNxoUbI9OvNlf/NE0Ngqab/uhfNYGIV5T1StzbFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRFS36k5h6dk1fIvfTl90iWvj2XEWJMGicANC4qOD7KF1PToO6wccl9y8IVGOuwoJn0AStawu7rfDu27zkZpSlA+osOHTIXbThjsyoVCmrULyH16SUE5bts5QrmzpC2/FQAEcd3jGWaoimYq2QlqqVG+iTt6+kv4UjoSTboRoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieF0vnri; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieF0vnri"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1458060f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789943; x=1792394743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=ieF0vnriqp4V0cCrIC4ahDChh0RsJEQkwhYtlkM01uCTOZY+uDfKz9nhFRolmutAtZ
         yl7VjPC/2ZnO0JiAcOvYzp4R9Z5ngYhQyRgkJ/k3uuMO0OSx2hxIBHEJKH6UAe4/pv58
         j/f+tCkGNnpZ/L8g1zpDb7FLvnwfNSwpxxxnmF71S3YVyx2oefiy6yGgVPObooLdW353
         9MOLuYnkeY+zACuuleFEf2s8xnFQYgSmF184mqkB/+NlEN9xalauMorKdwh/IkN3dIPs
         t0w2xXzIesg0RguIdNSG6GZW7Yakr0zIpXxeCFCDcPL+jcIUraCsy1bYNe32xqQ20zM8
         cPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789943; x=1792394743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=tIQi63otifht8it6vJaqzt+aBXXzyJuUf2eGHDd6+ERYCWNIFTDfE7oj2XjvRGc5QV
         XOZoPQpTciWRXgkDsrn/RVG9k+LHnY9wNhzC7nXTad/Ov7in/4D22kjLX/YJ77TOkE50
         aTKdW+kDgXE6y/hEAktKoso57OHntdTusgOTmRprJF7GJHh6KsCZYFeXYy8KqPa9kdod
         8gWgr4tpAbvKEj1xNFJtIKW1hbqgfQLzqY7QM2FvMDwWum4j6RdbM/AgLzDBgQkpqZ8U
         uQwQEd3leMOXMP+dmAN1Rd/Ei70QWrRZpfiTJ34yH/f/w0xIMR+C2vjyMeBGfgkZixRF
         mhlw==
X-Forwarded-Encrypted: i=1; AKwUvBw8ux17gd3fP+v/TSVB7nUZ8sbnpiHpP0/KD/7gnvUJ6pugTC4kEj2gVEI4GAoeGooyF6ALpoumMqP2l8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXZg0W/x6OSJ7ebGQhM6+74cvTiYht5La1nejqMaWstA8UeB17
	ITI1g71Dd2e1Aew9rCQztXl3sXpLNvHRdNNfgT+QzJ/gxKmdOcD8Mpwn
X-Gm-Gg: AYBFou0OGuUxis1trYoy/ihFo4qoX0Yp56PIDmLZyEHQdS5XxTNHGWcfxaiK4oZtNwH
	ytKNDWrcCciS8t3dOQ7CpxqOR+Dh4cWJKM9R7E7SjGKr8fNZTICQlPTcyfwUdC9JjoDBKTgFMtM
	e7uCHuiKltKxplj7ONBChHoEM7RDflgae94gKCKLlNlL6LvicqUD8OGX29qsvjSrGlRTrBPaGc4
	4ZTzcmQDPW1aoWjFxbUDNvLW5ihUe8mWwbAuq53zP2Yt9Cp6GumIPc6aBewD5rsHCoRoACa1rDR
	IOeg8i50XRLat4zOz4eQW6oC45Idc79HOKfrjuy9KgtW5SJkFlLbQBLKSoZt9hmbKCaTYZonQVA
	mR7LLFrbqFaYyMxEoyED7ZtezcBsZAjalyEZ9h3OOXX0A9/hVM24NeB5k/VE6lC756my+b2pr/Z
	warkODGVl27EJPMMCzPJRFl53vIo1eKkyPAmzOJnOpN6K433xVuLz+cbErW5ryEZHjrHUAAgsyE
	c38AkMaEKANJg9c2RhVx54XsYqY1v1euf56oCT6VmRwvigO8qfraYO1iuEipmiw
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr12493470f8f.37.1791789942797;
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:23 -0300
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the Toradex
 Apalis iMX6 VGA DAC bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1045;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=O9xo6x/Vsususv0Ua2eMzb6/yhBucutOa+18ozmEW8s=;
 b=37sR/q4rsvp8/0G2BU7g+IBhwPmrrzyaZ1/VxQrnHcJjiWbLbf2XnbzLTPJEjCxDGsQuZuSjh
 HbRJlB47ZlZCC13TAqoR4wM22Qy2GtPBeeyW86uPQBEWd2NKM0i3WS6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Add a dedicated compatible for the bridge, since the generic
dumb-vga-dac doesn't describe a data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..a86231a4a908 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -37,6 +37,7 @@ properties:
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
+          - toradex,apalis-imx6-vga-dac
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.43.0

