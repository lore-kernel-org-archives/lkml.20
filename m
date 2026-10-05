Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098243CEE3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240049; cv=none; b=lMKMpCexZW/BjQlZ0LvyQj6mINIRMhUJC9rTcYaARzlx+CDsd6SmxytL9uQZz20jO5R1bD+lwVUoaILUbehhdWoYDtzFYt5ZGx81cGgbmT3ywuIPrvQJ9YirC2m47sX5tuEZ9HSXDiJ4lA0gwmec7zZwzSDpW2F/49VdLxWs/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240049; c=relaxed/simple;
	bh=xsSc6ydPheU6yQKTsn8eVtJAu8IiKQ9vJAoJqkKw3sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmSWweoCk4Urf4W8tWAhi9tx5hxj7QLC9JljRa2AWvncFL6yaYErRPObJDeIETeOwO7H4myGG9Q+tgbdi7NNEpHmvvRXIwHnl1K9Zs8czbE3ZpAWwKYjJarDkc0y02QKdaBvSmEf0nnP4Xs+k+54Bap+56zbIaknPzLoXot1sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWVWGtH5; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWVWGtH5"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3a7026b3123so296026a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240042; x=1791844842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=kWVWGtH5MEgwwkACyXDu6QSQoDz0RffnFv+UEHU2MzkkHjsDJQahAzyGFLXg06Veh4
         sT5nyEDQzIH5PShO+WEw8f4NRQvV/BjSVSbEKsNBdwaY6R0AY7KXziCryDr9YTFup6Ho
         m1I2TlQcqUJkraisuL8EmCuKVc04kQndkJ7Xfq2f6yRf3Ac2U2qI34rfkrkOZ/zD2IUg
         vOhIDxOiAnQ95OHhZ6FT7J+TvFHvHrhumwDlNXbp3MMkvcT4I56rhhhGJJMsRwNnlTKU
         E+P8Aw6eKYfzSdgVbyG8ScXIHATqvyAfujH5EtHPtWt4bIHDF2phuB4fKOij5554nlZt
         OVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240042; x=1791844842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=rRQY9zbpstb4ir2B3Dwbx80m2p/Py19/dqFwqfCVPe/N4LC7UI+2OVzE+FRxoZa4rY
         dyW3CCUc+IiFeLIZ+bwQgDHalCvESzM+jP1bdWbOZnWukHLbE10HlUCXPC+dmfOC/DNd
         +Qlu6whZ1opRxWAhEtdneS315I4fffxGUK2L+ByLeWtQp3x8ynklA33h7pLt3DtQZ05Z
         /czRBkYRB6lOigM0VaKTkpHqwTzuZy8VVnLwTPQAb7DKN/ncsaLChl7dPqD6mYCorRwq
         lw9zhl4aYWufslV8IQApqDvubExmoM7W61evn9CfimnFzEFBdGblJD9sqno40/y97wWx
         8BVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9HO7lTAfmpHuz0L41NpCgXYYZPKC/GgrK5qrn1A28aBS6h6mwtsjLxG5nETpOQdc15XbVz5LsFxhgl+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi3zb9l7YBCtesNlaK7do0AsB+tVmoV8aXs53qYz1NSHdvHkEJ
	5u2TvxYKw76JNP8XAop0bQ/GwJVlqJmFLCKSKVsyJh4JzfUatTaz52bt
X-Gm-Gg: AYBFou0yDK09xNr78p0RljIJm2V4C5D1HfhOsWsarDG2lopiF8H2Vg2UVJvyYTs2DaG
	WChAOlheLmfowhxNs1aIAMbrDIW9Q8vnVb3nfVNPSqlh2NzKy/oQu9zB9TTtGAFPfmQB8swqF2b
	K0wNMo74/BCKqm8fb86t4bpJzDDnVXdC8dmKiGR8Y3kKcdRRKVM0k0RPvf1zbrnHz1bLuLbqHMi
	7x/ocLC0WNdQQar74migyeA8s9B6k9bfXGczkjWBf3ayFl2YHeK6EjckZRMXCVae92npHdB+ncO
	o+VI3b6QsWJE/0UGxcvR2mcbnsPjMyQJ5p+ls6o1n6Me+7b9Jqj2lu7BnnifkVlnm/Md32gQFT2
	+YJp9D60bAIGhR3u0gKBoZiRs87xd2FvI+z0f1sqNcYLQHKKh/HuxaJL+AqGtiMeVEmEsj/QOtg
	priDEPr+CvNaHo2pc5Ppnls0sMqQky8jBfCw7SHuXJ2kCBiuI5H2UNzoJ8Hu0nnxLYQiOC
X-Received: by 2002:a17:90b:1cc4:b0:3a4:b8f3:8193 with SMTP id 98e67ed59e1d1-3a6cecb7bdemr5049021a91.48.1791240042184;
        Mon, 05 Oct 2026 15:40:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:41 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 1/2] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue,  6 Oct 2026 06:40:07 +0800
Message-ID: <20261005224008.1140250-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
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
index 3bc653f027f1f..2cea108b31a4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -8,6 +8,20 @@
 / {
 	compatible = "rockchip,rk3568";
 
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
 	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -110,6 +124,37 @@ sata0: sata@fc000000 {
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
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

