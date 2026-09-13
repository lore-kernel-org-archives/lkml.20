Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D33B38F642
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325993; cv=none; b=BfUTZ1RLJ9M0JS/Pb7TqCdcBAqVPOgb8eQTJNpYc7poo4lpScLbW3HrPRH6yPMi2phh5svG77BDqxAaz6ohISCD9ByHxnVfGAQuSkDOiuaFFdb9YLoekVaCNBeHAYmhXhjSJzwEx+t9ULS7olfQacXT0do8ZUmUzKRUEDoh4wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325993; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcwXKG/00nRbWOYoNxh8SkZ/1rllCvq+S8zKVJ6n0A9aRp0gWgrM69YY5UGrKku3rbR7Rci9Qh4ymLV0tCoNcuwpaaffsIYkMi3wz9rFgBgpvvgNDGkXXqzm81fgvC/mf/eH1pCyzQw1098SOob3s++NL8SJN7hV6IBK3rpRM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMcljIr3; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMcljIr3"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso19724865ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789325992; x=1789930792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=jMcljIr3Bc1ewohZGYB0XhjT4p5hXYsAE6UYIq+upzPusdyYqbD34/g8J0kppm/DDv
         rJfjKpkSRTMAsjLQq83dCo19ahBSNIOxAMDX5DgXylNv25WGPZplD+3jQ863cLt6jAvu
         2SqnS7aQG70GhAnmgfwV/KNqJkzl43oVA9Nvgtc5D6wwZi6g6uVj1rVcdOlgLcXbneAK
         SncLQbtgNXz2qXW8jhmN7Nt996jBQ6LjGAS05LSoG04ohVIcLaXxTAltS/hj35nDOUqc
         miuNOqXsp60OJPmeNkrcuTJVPX/DhwUh0Ox/Gdn7kGXEzKdPNotNjcWUOC4xNXLDTwBF
         G1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325992; x=1789930792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=GNF5oOJ9YN6/O7Z7iTfVwo+2njaoujyjDMNmX2iekKQxMX2aNEAfKH5+DGifNPOAmv
         skEFXnjORM2rHM2jRjMQa49xWbGEgbJqvyQ31RejGxCCgYf/m0OrOrc4QPexUS2eY45x
         N/MQAHc1r8jUkJngFgV3VyuZp/B51cOXwJRb4XrCq6sxxSbGq8NTc7muQUkgGX0yD+kp
         JfTQo7bVDfAQoC07IDDCDV0SClZrdQLVnWMAnDO7EZVctKI5q+XV+9JLcU0VXQ863AEe
         qb4h6xgVnqgbuxbW+O76TgcThxm60R4UcV5UCCxVjWIfY8UUUArvy5RaL5BPgrvhw+NC
         wk1A==
X-Forwarded-Encrypted: i=1; AKwUvByI67KZ9L4WMJwIIzNpvOTZ10PlF0+uDzXZ44NoVZjr/GDENVipuxuMsyFmNSfHfdoBfE2zC4P8chohwDk=@vger.kernel.org
X-Gm-Message-State: AFuF++nDEj+vehXcOgX6lNERxzvsyMdbBOkk29kkUPKjV3dyw7RH3XDj
	16GPhiLUafFARbjSAaT4Vk8aDG5OaixkDhGLnL+RO5y4xRAcBy/l98Er
X-Gm-Gg: AYBFou1srJatmSlNKtYCbXfkfzPjBk78JeRZJEYvysIpIqzw3tysJbVaEPIcP3hqHbI
	p9VTwzE0fFY9GX8v0ArOH/sSjM3UQFEom15xKJ4WjGdB1qONTXXMBRJcb3HNdNo3mBVPMLHu+/7
	QdfBiK/tx6CLW4JPK4BQrH5aJN7ms6G1YB1SODdkU8f46Z1yz6ImtB3VCmOdEuajQ7hFPCI+ntJ
	hFBuhKwPDPRPBb+NYoYTNYIwQd2B1vpntztZC+PKVDCr9cXcXZPnru6Z9aLQ1U/RcmpHDsVhnFP
	z0gc2T/oJXmzVy7esyDRHlzCxoDELHzvw0/4LtV66fvN3HLDqMEKwCQLMuD/CPSlc4quFb46QPp
	dNcZQvl/y+tN2B+nyzUE/0eU7SAg+XdtQgUOnQeaU6VB6m7L/8MHDjnZ/xcRx7YF33taujQAKAT
	8Ns8mxDyMuUZ5gGSAwIb58b/U66WcgX6ml5cVP2TvEmalwfr8kdIJpSbCSXkH81xe9j6Z3Ow==
X-Received: by 2002:a17:902:f54b:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2dd2a1c9d19mr243912565ad.3.1789325991655;
        Sun, 13 Sep 2026 11:59:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:50 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon, 14 Sep 2026 02:58:37 +0800
Message-ID: <20260913185849.907479-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

