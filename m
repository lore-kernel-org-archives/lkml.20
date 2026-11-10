Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298736;
	b=sisJvJmUm54ORmAK/UGZ9az1Nm7HRPy8fh7zCWtJeq8O8O5FF+iJdpsO5Fo8pncpmKaN
	 5uodz7XzwsfSlEdmow/hKdo/MopCpZuIwMHiCYeQqRIaZPWFnEmlqc2gfhgwOgmI67oaD
	 H153j0XvbfTU/9qCOa+PJW8xRZDK4VMbqc5lm6z3uBc/BVL5+0Ikk16xl9zlq/aXmdsJq
	 6WCSGBHoXDxs4lrxbZFlPp6p3MaOhaLjMTNMiUVQ5mYBuIggKKRz0CKf18LKn0pwFyIzv
	 TlKSvNIy75fwUXyhK5/3d+ZzhCWalea+5n8ltn/1Q0jhBCvJiVEuKPJtQ8Yv55wQnzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=58OrtSXJfJJ8mejcrjyYFp3mmVgIIq4F94FhF2tk08c=;
	b=qRUAeAFWjzCOMHs6J27/bu77EbXjHbtG32SbuOKcECd2MgVL0IVx7hwsDJvDw76l0rtx
	 jwxDDraMx9KcDXCrCM++o2cxuzh7U+V00xj0aI9DCNRBBftem0xXKLeAMQNKer8ArJTxV
	 IF5LbnBjK/LFpb8vy1yXAz4LS5HqEqLvn3FMj3jw8LsdGhWZA5c4oaiLkW1lUSc7HwSHm
	 AWCXkXWx/95M4ScfxPwp2hBAfi7aAXx3xyBqK81pw2JOJwK+wqK8JeG5EePu9v+dOypqR
	 PyOXLFrma263D28QK+yHxdBs+KItAXDeUUbvUODkVjAwya+qUyT8Q39Nahyxp7zFNkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MR5TWrXD;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB760A5BCB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FB760A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MR5TWrXD
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dc4797082so245421eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298735; x=1794903535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58OrtSXJfJJ8mejcrjyYFp3mmVgIIq4F94FhF2tk08c=;
        b=MR5TWrXDVzQ9hyFthbIP5cF84DSwXDEFGfJ683BQYCimZsxgCWBrp5skzyRtOaU3QM
         k2CCsur3nwZ2Y0fSTzKok1GdU0b3kNc+zIwDSJK2MUWt1QDRveaNnY60dLmuOF27NfqD
         oT/+9CTbaESUshK8BMcjL2vWM0iBie39hIEKHPZU3UGc3msmbFqkLwEzMFrU61xDhxuZ
         8zUmR2kboHyA/5Jf8aD8zc3qoBcxac/c0y2aRwJS+knLpoMpMOPKN7svAq8AQ/YjG3/j
         18rCVDv6rdVdqiPOMTzuIy9+KFtGO2Eq6qzEhwVtLHd8D6MuapO12ihZKLZIxi35T4au
         YMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298735; x=1794903535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58OrtSXJfJJ8mejcrjyYFp3mmVgIIq4F94FhF2tk08c=;
        b=CAQ5NfFAxf8T2yrTGXOomwU7msWXxilimhQjBEW+kAZVrcFVFA5WqZSB60y/leXvLO
         AlhtWbbD8bhH1tV5FgpjcV1GfYbCsrN0D4kjNRnNN3BVPGE6SFvDLnPUMpnXTumwV5F0
         4HkcryfXheKwVAHxoALGV3hDTkQvgPabhMwkWn50kt9vC/zj5iDmv4ugo8FG7DE20lUb
         U5S9QdzoJI7vDqAYJpcETgKSIGARBff9F6kD5ayttdnI2dOAron0zmIMQi4H6j9tioXb
         q3XoBS3IXHB3mj97Aov2UUIGBy6ogFR8nd19LIDFlGl6V/J4P5jmlRI5dSer/q8zaa3h
         XMMg==
X-Forwarded-Encrypted: i=1; AL+hErGkQ8XkJXNtZ5lO6r1gwh5CZQefhM9CQovaWvui/M3qsvfQmSX4GWnb6QCteCdFfIPG4+sdALzq1c9NZuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aiqfSx5ZIKi563B/yyy/N5dnYxDiA0RisZqkzICr2KpUWqkG1
	nVu0Dn0Yo7E9HgWRSW7l558RByC6cTQIqKsYe7QGXwWgrkpe6h6Yek6dC3leRBRLx+g=
X-Gm-Gg: AYBFou3/KjoRTrKW3vlYgKRXnBnW2/6xVQbXwUSNBt/rEWKMRVHabcqIXkpyRP0VfFF
	w31L7vdEaAFmWq5MK6yTs/hDl7qLKwDE/2rI4RYhgtqEM/AEprRpeWsik48FeAFUX3tHeBOh/GC
	XfDJwxsfypoEX7XPSWTSiG94qrlqsHivgfIunQWpwlyrLsO12XUnZXkDkitKrODxlusqI01wV3V
	QuwZO2kv5yDF52Rg88ilKSx4PobfEnyEPuvT1NYVs9nwlLrGB2P2FgsHYbBrteabv1ULS2J2YSX
	Te19E/qcseFM+1pwfEjT5A/0pXeGbTs035g2DKOWjdfWHqKNdXBl3ZuqKnM1pl420/zccHLrsWB
	PcKbKYsRYsX58qmhZbDLMHcFycRFE7HMYR8I6Fbe8nGjaWFKNEcFMFib849A8nX0zG0KnYknzeX
	VgIWa1ALNcBGXv8NNhYZ+HZikqg16/DURObLriIQh1Hl2NVt++XF+/WbPEn4dKgOqL0maXx8KfK
	QCy8T9RLk+YyeUetgN+gFXJvYztst0AChTFXCYJdr7HWL+ZKPOuS33XOQDF4kgX8KVemCXhaGM5
	0uNu04mT9UU9Qy4p71isonajidWJOqwIQV872Xm+0H/H0Cdr7L1ZWsj+BGtsqg==
X-Received: by 2002:a05:701b:451c:20b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b3b5e0f414mr4048117c88.0.1794298734256;
        Tue, 10 Nov 2026 00:18:54 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:53 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:12 +0800
Subject: [PATCH v6 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
 receiver nodes to rk3588
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
Message-Id: <20261110-dcphy-rx-v1-v6-9-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=3896;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=NfZPZ3x823SqrJqo1CoKHOAuhoYjmEYwXc5QK1HOeNM=;
 b=hmXOPmwC6P7NZm1wuYkfSpLT35bn5qW1AqUnz9qTDNabhwPjQoByidKwphwUGq55w1I4/Xb87
 kvoSvUiZUAtBJMwkXmepyPTarxTVvUdwdUbhQH90NUZWEgoS8Tle6rP
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

The dsi nodes keep <&mipidcphy0 PHY_TYPE_DPHY>, the only value the
binding had before the PHY receiver was added. PHY_TYPE_DPHY still
selects the PHY transmitter in D-PHY mode. The csi nodes use the new
PHY_DIRECTION_RX from the dt-bindings header. Neither phy node needs
phy-type: the DSI host and the CSI-2 host both run the block in D-PHY
mode, the default.

There is an ABI break if the dsi and csi nodes use the new cell values:
an older kernel ignores phy-type and takes any cell value as the mode of
the block. A DSI node with PHY_DIRECTION_TX then gets no display, and a
CSI-2 node with PHY_DIRECTION_RX gets no camera.

To keep the ABI break small, the dsi nodes keep PHY_TYPE_DPHY, which
older and newer kernels both accept. With the csi nodes disabled, the
display therefore keeps working on either kernel.

The csi nodes have no older value to keep and have to use
PHY_DIRECTION_RX. Enabling csi0 or csi1 therefore needs a PHY driver
with receiver support. Since v7.0, a CSI-2 host driver probes the csi
nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
that drives the display. The camera gets no frames, and the display can
stop working as well.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..c7174c2f15c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0

