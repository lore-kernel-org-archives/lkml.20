Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496285;
	b=ENR9mZkoiRYgszKv1mbJzWR4CrZwAmEzZpMVFFugNcCPCNr4e1gZRSZcNCIsHhf9RcBk
	 GJ26ORAzFAEy8nvJ1cHQtOS+mitoZ8c7drUNbHNvWyDHoYus+1g2FofkbsnPUkt481dCm
	 OoGzQ0JQj3UMFMeC1NSqle47nQbqwPM2RGXIXEYqfgkyOX7+nEAzaWchIrXxFpDH+k1B9
	 oL0tRxspH++1PUs4kRL5aCp00v38I2/yRVoFt+/ikfpC0bkJ+jSOivOo2juUBw1G7S39v
	 T91lxVAOG/2R6dUltzPhgsbEVBe6Sb/Wj3c6iMdqp9DjGrtV2HbaVUu2mB47crfI3tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
	b=XTSM5Nr9zA75thlXREgApnyfMGt8wnWLDTx4mDl709zzIckM83vysO23/oHpYyx/CeAz
	 VVMY+8pOBxIlEg0wI7pzXs2lyUj4HmRgRikyf1kNjhSGaTNlqzgnV4htjIM1SfI38XvKG
	 QnYJrYxS6r+TLKeWwmO3lRHIxgd3gheLvht5dxYrajcPR4JgoqMVNf0rrFdiEgZErDILW
	 EaIh0FLKR1J0HdkYbfprxAnWfBaxdYgO3CR0Goo3oDEmDFH8H35pPBVFUcub8ZjtN+eoC
	 YF+a8uup5AtMY4wE7yXBaL+O8FcirQrkKTG6PVjWy7Qo1+X4bUCjjbV5LWh+VMS2zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HF8F0JDs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E889606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E889606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HF8F0JDs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so23591885e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496284; x=1793101084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
        b=HF8F0JDsgnNGcadjC61xkmbzIvbbleuDk1xWrYpvMW7v741nl70Q+BwoIFSTvODLR5
         tvd5VfGNVzq9I0n3P+WjHjkZfQaOWdF35FxJyUHa8Ql52uq/Ev0kmdKDRmONuwNVGL5X
         iGAkO+Du/5/6QSrCi46o4s0dBOgJjhwFAkqs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496284; x=1793101084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
        b=Cl3+eAN7/8SnvNPtAF/q7ibzPpYQ/XZNlRqC+7bjc0fNpm/PoszaNVY0xhHkr1yCFq
         UseE3WAQyz4UN/6VlaGZbkuHSy4uaMOqHKKJZJ7NW4MNF0hXjFXxthunsSmLXfJQICjf
         lJN5blG7iPPyohKR3F+9C4cVJ1XTFXUoMYg8bXwPYJjvWPRwMHviOnSBfNjrsLYQ5PaG
         jcI4CnlJQE7Yy02JkAn0VMRl95s5ZcukhS/l956zvztl4382Q+6aRcICcT0eDVpvcXSp
         fIhQEFfgdTq1GuEQbUxumo+7eA7jgUGNokry3J4IQyqnnHy3RRsPomjXdCj74xlaTNep
         zD1Q==
X-Forwarded-Encrypted: i=1; AKwUvByNUPO9EJB1uIidbCocLSXJtaHHA2uWIaJM5PA+785N+xN8uWkJRQPl/fGLrzMdOw3dy7hSw1h1APhUZkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLk3ABvNTlIw66Ig3DE873pSDOWUGAEwBgfnxB0MsCr5TGKUMz
	pftP/W8hRBQx4pOpq4t1+cJhsmCYtk2w4n4yKPWMMTqRyxBgWgdiyypQa1z3xQlNnzo=
X-Gm-Gg: AYBFou0dZQUOPNR2zfO+isyX0yaRtAGuDbn7RG1uBXqC1LRqaKozUBFOXid+DrGETxH
	xRk+Cpv7SduF/V0vA88UqeV6TKVhTgLrrvHjOYG73xuADRiozYImqR4yJHrCQz4tYKhbgDGMeH9
	GgDcEORIXXlfOEsLE8STeO9R0nP3bmx7M5PRt6rHPMvgYYZkIjEZtzKMaHA1BV05C12lDkyh+YB
	tqfQJqgvw/cQJqHZ0p+nzSJYudmw1uQspoXrlB1+78IwYj/eXyjx0tAaiPnT2pioyL3txw9bFu4
	jUHyQ064P4NGIGHrVuc1BGjT8VpwUy0dY2rmDJqw1LsOWgCbIIJZq0XkGIN5hKohQlf3g5aoemD
	jltFoZGAN7XAb5Iazvp2mMR7WPU/mUKYrJWTEnQciit5/BfptAEbG4usaE1nenB7kP1son0nHCg
	Ci6EozVgDOs7tch5YQbImaqH+DPnKSs13d8c9ILIfFmHMlSbVNUSNQVnHmSdVIiunFIOTgRgONe
	sn1RHpJDDy1LIGOoJ7NYVGhgN3ojSt74Hq0aN70I7txMYOvLc767Z0bvgw7aBQwsecE2kCcBr55
	tOC9K7pf
X-Received: by 2002:a05:600c:621b:b0:4a1:dfd4:9429 with SMTP id 5b1f17b1804b1-4a1dfd49552mr178412195e9.31.1792496283635;
        Tue, 20 Oct 2026 04:38:03 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:58 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
Date: Tue, 20 Oct 2026 13:37:16 +0200
Message-ID: <20261020113717.189082-3-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC.

Specification:
- Rockchip RK3588
- 16GB LPDDR4
- Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
- 64GB eMMC
- uSD slot
- 2x SATA ports
- 2x Gigabit LAN
- 1x M.2 E key
- 1x M.2 B key
- 1x HDMI2.0
- 1x USB-C with DP
- 4x USB3.1

Link: https://axelera.ai/axelera-products/embedded/111c
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

---

Changes in v2:
- Rename the board and its compatible following the name change from
  "metis-sbc" to "embedded-111c"
- Drop Conor's Acked-by since the compatible has changed

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..1f2627c53c33 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -120,6 +120,11 @@ properties:
               - asus,rk3566-tinker-board-3s
           - const: rockchip,rk3566
 
+      - description: Axelera Embedded 111c
+        items:
+          - const: axelera,embedded-111c
+          - const: rockchip,rk3588
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1
-- 
2.53.0

