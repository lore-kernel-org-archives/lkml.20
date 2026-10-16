Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CA450917
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141021; cv=none; b=QRsH26DZ3NS0SOK1IOxXC2u8eck8KtJA6b3ejSjyHRIfY8oqeNyuFif+e4sykZTYB5J9o5o94P8esz+rn1RnGaa8wGvfI0E+ZYiHXI0hue3vZoXPGmWCfwfhbimTapS0u5DDme3NI8SNW6djHmRqEecwr9SodDeaC5QTLxl5/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141021; c=relaxed/simple;
	bh=ce8JdNOJs5zvcQeCguszU9j59LCLfLXe7OkJrHqM/YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FN38S00o8zYn/Np1YYtn57cEPM65aP1dLvCg+QxsabfhCesRNzCil7ZNF090bUh59ra3UO6Sd5EfBIxNJFtlT3vOO3iqgeSIWW8Wl/wN/UTV/Fr/tCWmbtwsTshYMOprU8qG9P5w06tux/zQQvxlsMbPyz/didGUITse+lBEhR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSqy1MPw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSqy1MPw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd4b3c311fso5485875ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141015; x=1792745815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=BSqy1MPwa4RaYyL+SyGyVe0CXoIXk+ad5qtV/seW+o7mxvy/4/+tcZl7tIQvmnC1Gg
         Wr95on/WLC6pK9itHJh+0ppVk4LJ6/x0ihESuILlBXH/hTlApz0jvOi+LDMC/m8WP5Eu
         KKNvg2itCRuh1W1UpWAN7pX8L/8DE4M64F750DzpPP2QaFEv9sROQG1g1MjSXhTUUyMs
         Ok355RO1COGBihoSW8DmHyzasGxhLFSBIZPloRm8qEVOiKR4WwV67f3kUVIigwrPC9I9
         tyNXIsua1m22UW44baPGyRLB3oskzZh2LzVHpJvR3UYzE2V2qpSQo0jECT5KITuQec0+
         kaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141015; x=1792745815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=Z2aMCccu4/TqN1IKsuSsgU6G2p0FjiRntr2eqB/3GFo2xIwlSbpXOe7wYZrcl4FDiD
         x5qm1JozIFmtPkOyiMXfAfBsOpvSrLocgozJ784cu287VVRQ6I082U0XsnPtcPwfYhld
         X+tHNV/G/76NxQGdFOyrRXCHfv0EceRD+OjgrMpSJZcPvXURbzbRXZuVOATUxdrlWS8Y
         rFY3TJkM14CI15E3BMAwSYyg6z0GFY7F7lznZivwpvKyyMyd1SXRiKMNH8V2oxYSSLVj
         XHcO5T8xmzMpIYctqrR72zAGOsLir8H6qexw21DnLMUqoUaIUVyxt0U7FBBne2QE5fba
         XMag==
X-Forwarded-Encrypted: i=1; AKwUvBzJmptL0gOWOIi/+0wM1PYSNkp1IwbuaS13gfwCEJb5RBB93RaEcp06o+2Ts7P/uxWPiYy7X2X0qQd9yZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU+sNaoO+jcG3oOD3gTasXRw3RcO3WtZF/RBD1dEV0WccyIJoq
	L6EiB3hLuJGzFnL8cNSicpg0KEBwiXZk9cDoG2h10HOdfLojeHEKzYxJ
X-Gm-Gg: AYBFou3qXJe1w0lSoQU7DnErZ0Tps2cw8WfFSoSIWG338aYdPegA0AxCuiv0VLUDfrd
	lMQjbD4ozd7a0u5VCts+shGxESUWFNW9PrM38RSxMcRral0Gpy+3XhvjcfDhdecqyAPuGotE2Fb
	axw0zgNTivuEkRHrOHh/FLHGStx0RJgE08wDIy9H52FTdMJJE+GvE2yNZ2oxO8FVVX+UqDl1gyZ
	0s3jOAYDup8pSctkl9yebvJa7Udpm1vinemreufevQro4TooI0CdRuNHEj8dcejMCX48J5WZ8BN
	Y2LItqQOsa/zpBxXBDE7GqDVb2pJ0B1SJMt+0ptojjIuqjeZMvAlSjtXuiQ1jCjCc2mBv0okHN7
	arJMC6vDwBV6b9yiO5D9s4lbRI15rjF+bTkCY6uH/QFGMnQ0DAwyFBaqtP+uEBGTRRUm6nWsLcV
	g+IbMldHyvTNwrWX3oZL8lq2QtIEfpPgHvV6coQAOLfQT7lqj/wPUDAM7vTLKWhZ4Tl8meJl+9q
	XmbbGoNPo/qXC23kb6kaJp08ei6QWo=
X-Received: by 2002:a17:902:cf0b:b0:2e9:6788:937d with SMTP id d9443c01a7336-2e967889666mr61137945ad.4.1792141014917;
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:36 +0800
Subject: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a
 cell to select TX or RX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=2767;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=ce8JdNOJs5zvcQeCguszU9j59LCLfLXe7OkJrHqM/YE=;
 b=xGmXf0uJmuCFnGX4LXl2EMMZ1WvsxT2sntwv+hZwzx8NB5XgYmF4wB3TO71KHkIhWamdIBqA9
 3a8QSp0sv7LDJnLqs4+VROT8Z2H8vmMinUmvM0gz379mPKwncWtik5A
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and two consumers can use them at the
same time. The single cell of this binding selects the mode and refers
to the transmitter, so the receiver cannot be described.

Allow a second cell that selects the transmitter or the receiver. With
D-PHY:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;

and with C-PHY:

	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;

The transmitter and the receiver cannot operate in different modes [1],
so the first cell must match in both consumers.

Two cells describe the receiver as well. A single cell keeps referring
to the transmitter, so existing device trees are unaffected.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..6e8cc56e4986 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,11 +20,25 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
+      The first cell selects the mode to operate in:
         - PHY_TYPE_DPHY
         - PHY_TYPE_CPHY
+
+      A single cell refers to the transmitter and is kept for existing
+      device trees.
+
+      The second cell selects the transmitter or the receiver, so that a
+      MIPI DSI host and a MIPI CSI-2 host can be described as independent
+      consumers of the same PHY node:
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      The transmitter and the receiver cannot operate in different modes,
+      so when both are described, the first cell must match in both
+      consumers.
+
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:
@@ -82,6 +96,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };

-- 
2.43.0

