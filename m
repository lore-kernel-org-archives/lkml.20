Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531E3B7771
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678074; cv=none; b=pfMvv50ByEzyxCEHxV0DrT5HJfrxGY+sqcebQcn40FkDxXp/3e4CyK4JKR+q+aUVxOALBdpuBn5wWpromg9T0z1WmkJ9aYRgW1UDnsb+O0s32ZYTjnBYJk22394HLEiMAeDh+Txo1E02Npo4k6KGJ9VtWzFSYqAIP7bnUnG+ktE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678074; c=relaxed/simple;
	bh=eV/MZpigoY7eQVTxB//FZOps8t3Fw+uKiqpIed3H7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmGWZzi5cYkwnHmzW5h7NAuEH9q4WUEShKQS4uJP6yp2U23Qxlm/QxbZM+q1tpQ14sopw3sEBpL0iJWA03jOsO6bA6ov5xJmfqkVftq+oINl0bKGRv3gatw41c0H6+mkjXY2sVBCpXnqITB/XMaIdwjNzIV9t2zL9lyVSafSM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAlP6nWr; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAlP6nWr"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so64838a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678071; x=1790282871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=KAlP6nWrtckAD47lpdAebvcehhVnIe0VKJa9CUerogjpOc0Pz7A33K162WmIbmCuKS
         hC4II+v+VYsQQxvjywrjDo1zAsp1XUHFLumijZ+5pnn4ZX84k5/Rh2gC7ShlsSBRyzTN
         9ARPdpaZdlGyGdsSw4eaWU1xBNamf57T0p6Oowmi3g01ivGKAycEvJs8ueDtLqwf5uhz
         ex55bbTZRZCBZvpk6KfZWPBdB+S+nss6/bpL43VJMqx4RjLFVj6jyXxJdyjiSp7qp32O
         ws6yEKzaOUWxJYDMmQHbS/0Am1NEjg9NukvcWW0KMPPJ5vU8kwl3tpKm7ooseTymEoJv
         U1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678071; x=1790282871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=imFHodUPKxUIJgJSla1JWpbNPQEJu1OnQZtk52xKON0IkWdctTnMimgTUXJdW7XA0g
         RNPm4bUPU6KJNdL08QC9m8VGBJAwcV//VQ+ellDrSFg7WTeCm/zWmrr/sty9c9tRzWsC
         OO6hYWsiLOHS3A9PS8okfZ9CPCwgC8kN8PmMTvkSUUGomaZVn+AdPzQJoHy4vMVfwIMA
         Wg90HVEA5hcRB0e7912IN293pTgsXJlozOt54Fu/p7VtBK+41MHpuOOzKHzaF9TGILFV
         zIcfja/GemwitduSu5CBtn8TZASHcZ8g090mor3DFvd1sShRUpBDjyudeX5wRcDdk08F
         K3aw==
X-Forwarded-Encrypted: i=1; AKwUvBxjWvJHUt/dyxBvgIN2KdfcYSpjD4lXSRfvjBW1WemzSnn0dkMz3khTFLUn1Gv7iQxa6P3SFdj3Fhj+Xio=@vger.kernel.org
X-Gm-Message-State: AFuF++lA8oYGwUsXxyF8og5TQXcM0uYIFiFMtc0Am5MgjdpoQvicZE8u
	qSbrDXceVvMtTfRyZH9KP2PRYNk/xms66T45izPeU0WSe7HXtzff9Xyz
X-Gm-Gg: AYBFou0GDpk+S9+uOGdDQnEcMYA/UJK9E+ZMnuoWBD9VUH8xLz8eqrbmJiBLUOvWvqN
	TB9y1TOKHe7vFRH2t7TXXtcvMwC/rPsbyTHVIfcZe8kpMNLWTZfSqdgF40DlYzwORXdfVBCur8s
	ku/hGLYXGIo3Oq1F0hW7NdewvBTM57a8JAC2E8Nx/x3PlR8bhyZmI6Y+qW1Oa95Jl+sdrjtHsoQ
	3hkr9Q/R/Ldh32Huuf3/jZeG4eTj90G4etth3SW4nPKc+AdmshtAQWaDBl/ghstMtD1dJQYfyZC
	6rUXctzebNE/a8wlBcmoMX6zDNJYlcIiqVlY+3ZT7yYWLv11+RAAwVI5/w5PLsXprvkJj2y6STc
	K0o6pnWb9x37wX8uLRsw2WagDElrbwT8EGdlmhO9oNRDJ6giRfKyUedCP37ZADqXi/BUtV+zQRm
	TRzTQtRzaH/KmlNpdySlvCwcSg3FDlXWOHliXx/11t/t/Efq7crGJUMrn64Gukr7Q2yvWurR0V8
	0420CVf
X-Received: by 2002:a17:90b:3b4b:b0:39e:d2a:e25a with SMTP id 98e67ed59e1d1-39e54b771c2mr760897a91.13.1789678071020;
        Thu, 17 Sep 2026 13:47:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:50 -0700 (PDT)
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
Subject: [PATCH net-next v7 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Fri, 18 Sep 2026 04:46:16 +0800
Message-ID: <20260917204624.2427486-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
125 MHz reference clock for the GMACs when operating with XPCS.  Their
clock-output-names match the CRU mux parent names in clk-rk3568.c, so
boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
assigned-clock-parents.

The XPCS node and its mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys/phy-names:
boards that enable the XPCS must supply them, since the SerDes link is
a board-level design choice (combphy1 on some boards, combphy2 on
others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..227d03e336043 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: ethernet-pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: ethernet-pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: ethernet-pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: ethernet-pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

