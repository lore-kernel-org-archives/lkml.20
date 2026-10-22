Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637940;
	b=Lh5kx25jTIAk7XGWBNGvs99XEXHEsh1ZO6tkLHBBVfAI1+m3UGtieoaZLLreO20i9K4W
	 COAOQLRXlwwfbdu24zDo7My4eEP8kfMndjyWe77oae3iR74he2h8jp0JmvbYJV9yZ1NNT
	 BgwKTWy0wDZh6ClMujTzz7oGf1D2oBmtwF4qq6IbkmNif0a+aYPEgYdxgOZKZqS550cu1
	 f4O1/GlAozM1rxjrzzg6FgbsXXFQ+Fj9IZU9Q/EQ3f5wfhlFi4RfaeoiKFp2HjSfYHfKr
	 9FLRhkqvUtp4NhvL75fk42PHN493zPPCeFvYY+FzUlR5ZS0YlaL1uWM0VWYG541zywQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
	b=bbSiOTgwca708HxBxLwrB801uOZ6FZNAoyCMclexlUxOV1dsq2b4sLoO7kjoKOV2DlRZ
	 /Hoj4bkGMewmtAAKqQJIX0d02Rh/U5mkW6p3R+uCRSZunbT09+sXPbjOWQWq+CPt0jn9d
	 ZglJD9bA77cwwJpL9C5V5ROskJPBbrpNxKwm5iPqjHRENYbkD271xuG88pJRahkVwFiRO
	 2M8oRWg31IWKTK5NX+v1NM/6l/jLwMjp0ippFQmvkx93L7IL968DuBkhQcs27pn0olIrS
	 qrNaDNp1vE89GZSIsKaXtZTMf4v59iAjam5vqMFC4wCvnMTUIC+deVTQNhz5CpmjQZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o7+p0OQ9;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656AF606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o7+p0OQ9
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-368581df789so574994eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637939; x=1793242739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=o7+p0OQ9P7X/6I/FftPKNs/8Xfj5B6WQI4v4477jZGnkoH6FrHP0wFHqU7JYH76JHH
         TXUL2GYwHOCFVjuylxta4AylGNQxKu4ngdATkVq1kWdq3lumM7QebfDxCPjyryPqgsKX
         YEKWU4R3fwwywglTXlEd7ev1T2Pa7OXrsExKzjsYGA2zrGPvqAFyFFsIAr1712U0xvIe
         1FH1hcH92R6Ry2qcX9roNtXQDWiYtiJaheVXRjTBY4sUGVbntdgQD5uEELmC6i1iRTee
         zUTRqMqv1OzRj0UhBkh2dEzUZGeM/lNf7EjOskqfLljTJnZzWj0UebjJCBSa4G96nB3V
         CPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637939; x=1793242739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=zhh8fx10/ca2e/75spEsMWP/k6wYWHMjZhv+cQntFgIrEVZSxAVWNrND+7rb7DTI0U
         oUDk2myL8lGCDMgRHvt/qDO2m9kkOHr1AF9CoZoFqsEw3cpUqPIMLyv8v4DWDO39t6V8
         gFtMnOSGdVQc9uszu+JwP1Mm2WbQ7fh2RRW0FXnU7vzg4fTAjWE6fb41r5CxZ52E3uLg
         tnarSUSX+DBwK/jeAsRky2C3b3YsmMW+uJnDK1czTEOu/QtiRnEY2jkZ0skDXScM6XF/
         aChxPOVxslsRpcS/eDnsEQGjn1ZEA+jFOqMsl/Z9ppmmK63lBufahBW5i1c3KEtz5yiw
         anUw==
X-Forwarded-Encrypted: i=1; AKwUvBzZup9EQQ0/VCWdEDu5zsemuQmz6hDG/FYA+L7h0HVOFC1olr0W8eL3u4H9bQliiQwZOBPbWRFi8txevm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW9BeKgI7HdAp7kSB49zlh/W31tuRb5Tvwg9yyJb2BEP/dxMf9
	oi4iuAl6oTbWtbwG2m3eWhRjI65wVCqkTHMNVaCal3Hyvy9G0U38y+mt
X-Gm-Gg: AYBFou1njHO5ySnQtsi4BAp554tiZUPEj7ZrX4ljwgUsf3OteF+ixWNqZ2o3C39o01u
	YiIW4r6o2Ey6SnrJl+8tt9lm3pgsoXfxf/pGy0WGk6Rx2ESViSFX5OjkEGNVKQkbhNpp5WsJFyS
	auIMqsoZJ+GseVk74vAPIGYA4VCofrtkSb0rkbZQ4GTGn2WhOuXbYO05qkfy6ahAl58AojUxmHO
	0+EK5b9GmB+uLZkvLY/Zsmy8VusjV+zqW2rYo10I+5DG3Xlm4PzJrMbRQT286rf+Vh1c9aVbWb5
	0QAD3mHV9OM5Nvtmv2YtsZ+J2WO67r9+T2UliK2zLix/Kw6mGGK0tndRVbKQtRzqfcUCkJowC2h
	cf5vsOKLl437Gscl6wleH7Toyh2ZYdTnyZShP68gXPS21V0vUGcQ02ZO0NlKeE6+fNrKarzwA3M
	nkpmFxJwtpJW/tcqNPZz2CDz40Jv89qBFm1d0cl9QOl4Bjf4l38a6HJJNXeCebfuDhFSgYgleXw
	DKLbR6EIU9I+VMWDS4JAQXTzZQdfnIpsf5RzwXTfJllax6EQsVwyg==
X-Received: by 2002:a05:7300:d407:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-368b15180d8mr1324129eec.27.1792637938909;
        Wed, 21 Oct 2026 19:58:58 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:58:58 -0700 (PDT)
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
Subject: [PATCH v11 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Thu, 22 Oct 2026 10:58:42 +0800
Message-ID: <20261022025844.150320-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node to the
SoC device tree.

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

The XPCS node is disabled by default and must be enabled at the board
level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
are always present and do not have a status property, as they are
static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys: boards that
enable the XPCS must supply it, since the SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..20a72785adbc2 100644
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
@@ -110,6 +124,15 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

