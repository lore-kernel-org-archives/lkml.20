Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733763;
	b=4zqPbDq/h9pNm7xkCeqlq/+5U2AFQ6xCdC9LVB66FKel96HguremtGQqMPPRN9G5D1a8
	 /X6o51gDnwTtfwi52cdj9s6062MZtiQzo+Ap/eUv63oZFQlWWeb9n4lUu1Xi2Fmmz2Kid
	 jPE+Io86ELS+4/CVUfWiNJlfNyv8ebka1Sw1IOImsO6IurP2FVtHbytuuVnMr17rJmh8s
	 eMPfumRWBaPBJpHRfxkKcwGrofqdGAopMMcK484Rht9I2Tezrcd4fCaFGm5tgdd14rz2M
	 EN7/MGyQe+fP2dXyeDffd0q6MDIkETe6dhUGfgEU6JLU97Q7Y3H/ZPypVHOVOD62gZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
	b=SBTH6P6FtgZDKcnYKd4twy77F5rrICy+6zybrE7xqlskQsXRVhZPHihYsYsYRf9EK8b5
	 T13w0B27iT6sh+Jbd8G83JgTXp8zEeFmR+VsBCb+z55KG/f649X5GRq3A3ohkrptjEGGD
	 T2WRam+YBRiaJn8WwLJERjsxWdiqIJIihq+6q5IN26UpuusdVNFdzoxxvD0JtfFc8dd0z
	 93GkhjiQezKK5IkcHlVLMIN+rsHDlLCXhTzrsOFcrZRVfxCS/8l/n4VFXU3KLdVOfrbvW
	 Vb51vJ7GSwMGGBL+JaK2GHHYT0agjoItH0GvFtZWMAFGZaAAkUgL7ucSp4pXo+Pt0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nk7s0DK4;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28362606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28362606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nk7s0DK4
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso422917eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733762; x=1793338562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=Nk7s0DK4TAAr6Sk2v005iFo7VsaLzma7MH0YEyiAeqciWRtebKzf2dBcM6y8jf3YKV
         FZ2z/6k6Id3Bmo+er2UWk1g5K4YrZajDTDSLZ19HJlKu715ot0LLPG18at0cHVUlXpkv
         vvox6szm52RRhrFoZtXCOyw2CbsrL3CqOngo519JS0FiJmB1btH/eCrmxkX1eemXtmY0
         y+D/e4YCQx1ULD3rAFbBhgBDOJZDmFfbN5CtyyOZWuuTpQBM5oSKfGybWf0uK/0fnf9z
         wKWY1jrmJa8K8AKIbneSITpweA0/MEahPz5kvMYg0PYQXldgdWce3/couu4HT5DNLvoi
         2Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733762; x=1793338562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=sBQxPmyOIhnhS3Wxax1nihXo5bi3HZLgTrQboEXfchw3VCe2WufIb+J2s5DCFi0V+0
         X49uvW21uP5ifnFGbeayOIWaJfm4V5KXKsug2nxH9bKEAslQGsOC44CLoUyH+deJTy37
         tFRvLqxLbaTmv1wYkCPXgbuXkpdMEw4qGwSBOi4R01oy8mQ5ZteBAHLodR6/H0qOvQTY
         jxun8IH6xO6ZwO2TLf5UDgin0gxMFZNPY2a2E91q9YdSa80MiwQkYm0Y9u6u3XY4skDU
         aqRSvZpBjlJLnbN35ppKNMvD49aV4R91+GY23aQ9TvVP7ySAmDES3v9My105esBeN6FC
         ZW6g==
X-Forwarded-Encrypted: i=1; AKwUvBxchCP8+72u0PqY90tT0w1BmnMDL53zuPyMxYD9Aq+3hqmz8qCuIzOifUL7Tf4TnM/xm70zuewkG4Pq7sY=@vger.kernel.org
X-Gm-Message-State: AFq9FYISIXEiBo3eYiX5/7XNq52kBbKbgxHrjRzRtpNtpSGbXKB0qzLt
	Q8az6XyMWASNKefcejtvyad1g6f9qwQUAtaFFhbZ4jaY3FI0Usi+B1OL
X-Gm-Gg: AYBFou0mDvQV0vzKlHBSjI/+JEStXcat7rvoC9UvIbSg/2ylkTnndLVPR9jQ030lG5S
	2P7aEXv0hAoK72Fz2Aa22ZDQ/Pw7xqixH8IYEdYRsI722tt0pE2RsRtulAZjXvJEE8vav5YMKzu
	bmvHX8++FzFDwGsReFUJkEK6sCIJ/iRDwx2r04HYaCe//aVMkxIYcp4AZYW+NM4LRL1KN5jr7HQ
	pbxfX0vZowJQY3UokxF50cYo1B0xCAfAIjkEmK2To/zQiXPzEpXlvYTVuTQlH8MSo4BOmKaJctR
	PZD/BPNimYx3iwYoQBy6NPkgWrgQJ77uvuIZBg7nrddDDlDJriRXjfbTAtKdb6tabBbwdPWFwDL
	DsbdJTvaLr5I08D5e5GzaOy0u6zUTsLBc8CRyMyG3Bx794K/fb3pgIfebTf+lmL6uZk4JliOQz7
	6K8uaG9SDBlF2Icb+9eLJ+60oW+49NvYICaH3sfU2raN89dMmCQu375hZ+5877EGkT8011vaurd
	xZ+grRPexWz4ZLxDr0QJzbILxOsdhzSNiMrN7wviN0Ds8pCJaGZbg==
X-Received: by 2002:a05:7300:f784:b0:366:7b5c:820e with SMTP id 5a478bee46e88-369d8f4e26cmr1801190eec.0.1792733761680;
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
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
Subject: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Fri, 23 Oct 2026 13:35:46 +0800
Message-ID: <20261023053548.1595033-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
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

