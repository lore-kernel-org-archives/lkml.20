Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241543;
	b=T9s6PUXfdvzxWuK2x5ZdKNGh1BGrTWzPP0OSwP0CTak1fd8OSNPg1XjH6FqzAPQuhGWW
	 bFIUqiptPXgG87KerUvd1BX6ILrNYpkbvZrjnrKDeW6YCzuV1Grp6dN8PRHoh2pwT93ix
	 DimpJHWGt9Hcrk0++Rt2mHQQARJ5nAvxzc7ufkxgtsI0E0o4cZqZYxjt4x4CiHDEFEhGB
	 ZMbxB6p6L4lzAap1uiIwrLdo4L+x7PXXLqZAumNpoa0zoBgd3caCbqEfOlsPIqHUW6WDy
	 wonqam6KhbG+JFn+bKGJVKsgrXzGt+gnEPmDh3yD7C5zNLqTNNAFZkvMWAFrgW5XIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241543;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F9ND+wMj9mboKTeI57OmtdjbgWyELEoPDpNw5SYcdIQ=;
	b=SkGl7xki4Weo1r7ALi3g8dVVZUedWsu3rAzhqRv5RLUtrcN8HWoqBH1EpibjKqzV6Aun
	 pUAbFpEPFc53Oc4GHVIzM2k+kR/LYIkF62SRYz62d4M8wZRmGujPBMuSCaTmCC5WHcxUD
	 H/tdPfUtLDLI4d+J1ykR37Q8ighOFGXmOpUDeioGDq7xaUyjTM15aRCRwHpkCN+Fzgj8A
	 908h+NF0B9CHEOQlSq11ApJmZCMJFHiVnmoLiQvJaHMpxSyznJBBdUJ7T8DX5/jNtEX89
	 QcFXZXjYlzZ38Csrc0okB+cR4ixLNLzt+yTGiifR8w9NisCuHV4DYYFSaX+OH3XqBvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDnciBD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAF606EE9B;
	Mon,  9 Nov 2026 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDnciBD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4395D1F008A6;
	Mon,  9 Nov 2026 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241542;
	bh=F9ND+wMj9mboKTeI57OmtdjbgWyELEoPDpNw5SYcdIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eDnciBD3zrFvISOsxZt3iAeKkVWCA72ApcRROl3vsKo+/pinY6jWGOEUs90DhuK6N
	 ltA82xoYBzKPu6CAtmlPMpVxK67+bTHASdtM9nJ18DIrQiybfMNVHoO8VPtYaxNArL
	 IBAGQBjXJZ5tQ/xNEo91XT9J7GIRxcge3lJvEtLT4a7wPGK7WeDgHzrlJu2VI5fk2p
	 5uevgiCGarVzsQLKnSSnYXmixbWgJxYwoo5aUwOr0ltGHp43W8fWUyhmLwg2Wr+sZX
	 aDQIJJmM4neA++z7rbx84txYAoWV/rni4wIdBnh4sKKribrNw1g0UkHkbvbtIWpDz7
	 yk3DaLz6YnXlg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCHv2 4/4] arm64: dts: socfpga: agilex5: add support for the ECC manager
Date: Mon,  9 Nov 2026 10:25:23 -0600
Message-ID: <20261109162523.1698129-4-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261109162523.1698129-1-dinguyen@kernel.org>
References: <20261109162523.1698129-1-dinguyen@kernel.org>
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

Add the ECC manager to the base Agilex5 dtsi, along with OCRAM ECC and
RX/TX ECC for EMAC0, EMAC1, and EMAC2.

The eccmgr node is an interrupt aggregator, not an MMIO device. Its
INTMASK and INTSTAT registers live in the System Manager, and the
driver reaches them through altr,sysmgr-syscon, so the node has no
reg property and no unit address.

The OCRAM and EMAC children are MMIO devices, each at its own ECC
controller address. #address-cells, #size-cells, and ranges translate
those addresses onto CPU physical addresses. ranges does not give the
manager its own window.

The children stay under eccmgr because they are clients of its irqchip.
The Agilex5 manager binds to altr_edac_a10_probe(), which walks the
child nodes and uses one IRQ domain for the per-RAM blocks.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: add more context to commit message
    move eccmgr out of soc node
    s/38/36 for emac0-rx
---
 .../boot/dts/altera/socfpga_agilex5.dtsi      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
index 161f3d4bbefe8..12d623d4b892e 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
@@ -160,6 +160,75 @@ qspi_clk: qspi-clk {
 		};
 	};
 
+	eccmgr {
+		compatible = "altr,socfpga-agilex5-ecc-manager",
+			     "altr,socfpga-a10-ecc-manager";
+		altr,sysmgr-syscon = <&sysmgr>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global_sbe", "global_dbe", "io96b0" , "io96b1",
+				  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ranges = <0 0 0 0xffffffff>;
+
+		ocram-ecc@108cc000 {
+			compatible = "altr,socfpga-a10-ocram-ecc";
+			reg = <0x108cc000 0x100>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>, <33 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-rx-ecc@108c0000 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0000 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>, <36 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-tx-ecc@108c0400 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0400 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>, <37 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac1-rx-ecc@108c0800 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0800 0x100>;
+			altr,ecc-parent = <&gmac1>;
+			interrupts = <6 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac1-tx-ecc@108c0c00 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0c00 0x100>;
+			altr,ecc-parent = <&gmac1>;
+			interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <39 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac2-rx-ecc@108c1000 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c1000 0x100>;
+			altr,ecc-parent = <&gmac2>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>, <40 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac2-tx-ecc@108c1400 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c1400 0x100>;
+			altr,ecc-parent = <&gmac2>;
+			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>, <41 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&intc>;
-- 
2.42.0.411.g813d9a9188

