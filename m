Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9142AD03
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326052; cv=none; b=u/9BuwZY4wsFeWD5GpUGClJf/LPRJetapey27O9ZbBOr4YIMJEm+PsALZtSNw0cI3dGt10AgvUGIC6A6VwkqjVpQeB7G5m24320FXO6kUOuloJMvblWTuchPHH5L17wtFYuQIP9m6WlsX5n+84ej4PWaLxW1W7rHmcZyjvLnp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326052; c=relaxed/simple;
	bh=q7Sl/MMSPIpc6WmMgm64X4BAPmv2q5e4+Iz3zCyG3IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bju0j/txBeOVu/CAikxcZcvwlA6p5GD4Boxo6IxhgPw6OqHKI5PKMQLykLj41MBpVBOngfmFr6RAsJ+l9VoHhmzJqAylWIMmQwwtY+hJbrKQ+HimhqKu/15fO6++OWZBN1V6Rgae7JayIkhThielr47VAEoizMzLGd6AH4TEVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8Gv/OUO; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8Gv/OUO"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so9852605ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326024; x=1789930824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=d8Gv/OUOEIfDBGsm9YncWfuWw5udiLKJ1pqU+VJTv7ZR1/kwrD8SzpZ22lBX4NOC/i
         wo/JebhJd9H1StFlypqnI1Edl7nvv43E611ZlDm53OPbgqxur1cUyc5TaxhSFSyC/eC/
         JOEMnKLtYPIB18JmhjhTl4I4XsE2rWqspEPFIwBERWYakx8HIoMVf8EQ2eNzLUrt0/Dg
         4RvYBaEYziShIxBfs3G9odLSZTCTVpfPHZXj0GsK4xV+DVsuakDLrrX1gcOqYPV8U0Vq
         P0aYoIB01v27dQIXJN9wXV8HDJjxKSCHTFU0/yKTn1uy+xQInZ0MbzFZAB9ERFyQeQzE
         PtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326024; x=1789930824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=H+n17JJdL2fkp0QDHTljyc68gqePIQ70aJ6bHNY9DK9vcwgAh5uGg7zf5TBYuSKfzV
         FXU3cR0rtzc22HG3dTPHiQg8if0m4ppxvKLXpzWeGwmZ86wWle2O0S0SvrkfYlOMCJoy
         FiXeI13h9/tKHgk+0Z5dd656fBFWDndqEArwn5OVmu23dEa2j0NDhHMJ0b7edGCUNH5J
         qWARDX2kSWn+/F367m1MXU9lEIXHRGoq3wnAnlE/DSpTI72kNAvD9PkUJVaIhRgUHYHl
         WJnIx/vmbY9lpqkVCHH1ezMknZf9h4c2bB1lMAAa22PTeq27wUoHIPyXhaXkZWt5va72
         SKdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSGQ+bdHFw26fXctE90G3CpSETA0tX5ImEEshR7lMX9G+q+/iXZq3/zJNwx3cjb4I/BZLLt9ZS/zRDpwU=@vger.kernel.org
X-Gm-Message-State: AFuF++lasLxOHI9yF3227rbaQqnWY9jmS3ksoQ38b6Br0uLY7yjoEFnw
	4X2+f+PtEHfFrUJTrXgdH7hJtLfYgdZi0QLcDCW8ozSIWZD+nR8PRujA
X-Gm-Gg: AYBFou23wZgcUTTMCn2LESZBacotPZD17+i7n/Byq9sMNvwNd2hMbNWZ1fYEypvd8ur
	FvVOpkeA6kRqEWGXhcboWgdZr6laQbmBbyuVytqTtSgzVju7XYmEVOO+5xUG0EbjKQDeZ9qoaeW
	tBwRHXF4614LZD/0Uae9yefY+IGxeaOH/w4FEfdyeydJtIFdUerOZTX7AJBmGGzVywneDNmcd0Q
	mx+cHiH6vh9bYmzCBcjaD33dccAs3tq3KhysV1NlSMF6mKXnS2bXBaWCz2sc/1c0bBqCxTuqI/j
	2TbsmoSbyB5EuhdiwF/s6AmfcwvxpzoQ4uf0rQ9Nu7HSrlZMZ6ycLvzXJmj0tNv+JgVpT+0j3It
	HTV9Q7QsRDWASbCzZyf7r9yRbuomN4EjNLejgrvMyJdfO512xazUf4vfDLOm8ITH3bnVSVni7MN
	Qz9agA6EV/bptnCeVw1c9TLHMN0e9p/4MuXz7vynUL1GmEWmUsGDIUSXDihohjrVdgUqd8wg==
X-Received: by 2002:a17:903:98f:b0:2d9:26b3:547 with SMTP id d9443c01a7336-2dd2a46f4cfmr250162755ad.20.1789326022854;
        Sun, 13 Sep 2026 12:00:22 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon, 14 Sep 2026 02:58:40 +0800
Message-ID: <20260913185849.907479-6-coiaprant@gmail.com>
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
providing the 125 MHz reference clock for the GMACs when operating
with XPCS.  These clocks are used as the assigned-clock-parents
for the respective GMAC nodes in board-level device trees.

The XPCS node and its pcs-mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node also requires a reference to the appropriate Naneng
Combo PHY via the phys property at the board level.

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

