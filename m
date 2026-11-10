Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298707;
	b=bEJiyZh2D3jYQdOKKYvzVWLCgAcOwv2bnUXR5ED8liIceOml6GBMr+i+wNCXnggsZTkR
	 oEnMKWfjGSfDnvG+3e8WRjK/tRM3mn1HvTzVmC6k+ZI0KAojXM8nsItklZptQdkGDDKJ7
	 8Sb0TnPtRxFMq8KH9+4fRVVggxEBeuV5Pa7E5qCnSU+aKYTyumzIJ5KxYZFx0ZiDZuQ2O
	 6m/CrsdoZnbVLdfEUt8na2CKaxuzePVgBONHYYCqyKTA4ecA7OAIyVEuta3aq5gfAXL4l
	 1+73oQmyeSfHX+lFFdR+3pxhqMT0Mbz4+Stc61zhJrv+AuzQk0mLV41ThC0+pnWlXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
	b=BaE2/Om1NEuiVspsBaswglyxg87UPDyK+vgHkLvmybmC9vz+gl3RmcqLTSkolxF/FXgA
	 fZlIv1Yq2Pq1mRGoRf8AdDCn7Aj0BuYh0Ijs1nmhrBfdezTF9d9IbthEcEi6IpG09UhVn
	 2v85X89UdK8/01ZmYfB2hm2aDA8O9dmzCGaC8Ai+JXnsUzSsSe0bnkwyMvrFXyt25p6a/
	 hLWbgsAq3C9pLJJb++06UR3ld2AxN7xbKtPYOd+YGYBzQ666Xnle0V9rADDnQxpAb3WiI
	 U57Qd3hf8lXn4m7VVTrcTHcm8sGDiNGSCKi+wUcncultH0SjylCZEkf0AhpZH5EWCbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJOQ7Km0;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35FD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJOQ7Km0
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ca32a0faeso160657eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298706; x=1794903506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=YJOQ7Km0RCGP9pnzQVA3gniSw8R+GHAtcaa4xPtdpeb7I01ZBqMiMcefo/DeXr7bha
         SjWhGU4mr9XJMgclhj2GuhqKq2n59NqGCEH+N9yBkaesnm1M6DkuYxIgYz1xws8CCP8J
         5Ee8Q/AfU4RolkViabUd/wUATZ/frtsGIBuJJVOmgJWJFDYaN7LeVYwwnvYgbnzaVElx
         BojWDoz0hEiEEw0L2N2uII8vtHzUaJfGoAvvrdpwuQowzPChvn/0JyCg0IY4Z4/YMLl4
         Zq++sXUFlBmit+mslp3AKp7GhRpcUlmeZHtFcZJja8oBHkRx5dfIfUH6I8vCgDhX78af
         UPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298706; x=1794903506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=g5eQQoYj0qNnPSRnHITUpa7bCrgDUDWdiQIxuipwWvJ7C1WYt2WSk7n9M9+uxIgZlC
         sYD+jLWz/BQ3wa+MsNzNFPMFQVwEck922fb3ZI+TZkHFOg9FmU0zyZARvcsNzdsSi1C2
         ZiFNRmEbh8b2I/P5og658u4+X82IvqVrTzkY64Ha4paqatbx8AFUEWBIoPj8jyTCKg7Y
         BfkqczNMPmqvWg2TfMT93olFaJ4NIWKwIQBvkm2uKdfp/SqTpB8XcoPluk6pRWgKXiOO
         5h4O1BLUczWHtGkojOfyfKAhJ+uHsiK+hyWJwG98hiYZ8Nd+Pgj99epXy/tJ8ni1+liV
         ANyg==
X-Forwarded-Encrypted: i=1; AL+hErEC3XHthY3l1xZEjWK3QBIwuGUbAebwKIG7T4U/Np+4td5ligTgzWg0rmDYeZ/AFmY+UfJvJElh2JGvXpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xFBQpteuoDsHX9SfnvVhGw+2vWRBH8vH0/gXjQZF6IsHld/cu
	OL0u4r1KfhN2XGCPGJ0I9W/NQb0qQvsd/S2Is7vLh4MNfsFt1gmjurt3
X-Gm-Gg: AYBFou1KW9vbAt4nfI7OAgOMXB+VBa63O7murnL5WJRuqIJGwUCLKzrY339pcrW4IkS
	kEX0T/H6vRUhSO2cvGR+94RYS5ECxIJKyq2eZg60MOTgcxguR6EZtlp7fFQQbsLnQZMi6um6Nva
	I1iVrao5qKYcDZ+1c8rZCy/miQHzcfm0pVN7IhIOoCrfZiFeBDLYvGsdW/r9Mpx0OqHEloXN9Ml
	BTkArXCNKFPbOs346xiWd0laUSBIfHUboLBLw3RpkM+bmvDQWTJOwcPCweOb9OVO2OLCky5h+SZ
	HfLL+PqbedPPb4RKOyDE8XQmJbBQBdkt0Fc/WpVZFfB15pCcBdAdNOOAcSxm0xKaDUpBNfCArna
	mo2nBxcM7oWMNCaVX7wVKpwwQI/IYWUr3kubw6dq0Kuu2QSxnu2xrY15VR7tVse47aMr8GAEB9V
	hayWT8lNdVI9gi/zb0bl5pr0ywFTaRrvX4tUhhmX6P5kE7JiMSLE4vXBe3NHJfHkZFdEgIOM81X
	iG6UqCG3YoSaw0NtqaU8V+OSY3iGvHJRh1W5UnDMDNILOQxrnNq3z9xRo3E6ZxpNHsUpKA9wzik
	0r2nfHaxovoOZgOMZ9ot0nC5yAqaXGyxbfn3eZwRLqy89ku69zNEogY9a+N3
X-Received: by 2002:a05:701b:4594:20b0:1a1:9106:cfff with SMTP id a92af1059eb24-1b3ba7b302emr828418c88.2.1794298705356;
        Tue, 10 Nov 2026 00:18:25 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:24 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:05 +0800
Subject: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2929;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=xQ6WaPuBjE54d5cF8BexwENmzZIHniJK629BNNCMNF4=;
 b=X7MYhiVj8tskEvqzZbwBYXtP4KTQ0kMGiYW4eHf31wARRGAJfwayNHMoayBu8o+H23PJZRJTA
 7Suk9JEi68TAzp65I59DtI/ekqH0WZiIvBnu9ESCzffERUmKEIgD32g
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
can use the transmitter and the receiver at the same time. The single
cell of this binding selects the mode and refers to the transmitter, so
the receiver cannot be described.

Change the cell to select the transmitter or the receiver. The
transmitter and the receiver cannot operate in different modes [1], so
the optional phy-type property of the PHY node sets the mode for the
whole block, D-PHY by default:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_DIRECTION_RX>;

For C-PHY the consumers stay the same and the PHY node gets:

	phy-type = <PHY_TYPE_CPHY>;

Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
valid as deprecated values. They select the transmitter and imply
phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
changes for them.

New DTs on an older kernel: an ABI break. The older kernel ignores
phy-type and takes any cell value as the mode of the block. A DSI node
with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
PHY_DIRECTION_RX gets no camera.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1ea21ab203ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,11 +22,23 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      Argument defines whether receiver or transmitter PHY is used.
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
+      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
+      respectively. Use PHY_DIRECTION_TX and phy-type instead.
+
       See include/dt-bindings/phy/phy.h for constants.
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum:
+      - 10 # PHY_TYPE_DPHY
+      - 11 # PHY_TYPE_CPHY
+    default: 10
+
   clocks:
     maxItems: 2
 

-- 
2.43.0

