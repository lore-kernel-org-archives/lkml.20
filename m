Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860946;
	b=D/LSM4dIrqOMtRbiUdYRavVjOz6/OPQJvblTSRVltjEIWvcoFxkn6WzG+3Gj7SDyTOHN
	 kyW1lgGnD8I5sHmqYI2QuBnrSHh1RwEcht8HKZbpDYH6ahFq2k+lK42JEobapn28q6Kq9
	 E9ojGoozjOfWlWrdaoEQ++cByWvJ+537ckBtLwVHNMCdhXZb171PyJ2+Vn8j8TxC03IKz
	 xfcygv3q4toJ6xNGJTagWacIygjoEhKwqY2d3874p9bgMaJrk/Jb8H//sbsRc7KH9kjiJ
	 QlSGmgsfpO+xnoFqPUJlPYhirvCkPxRf0f4LC1lZYdQaXYvEn5HMlJHqxYOPw9Xa9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860946;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7APStlZA8BrnHUohFacSaOoKoFsQzAW9DK7Bhe0nSjI=;
	b=N6U0ylSRO+cvSmwArEgrNoeO3UIiKwjZRIOsEsoAcG/zKx/6fVAp39/FZ9vs9+eE84k1
	 2lz1fsunxCVFgNx1Ojnx6olJ+3v2LewnC4IOOJl1DfXAkl5u6hLLHKcYrMMhskPaFjiqI
	 /dB3bnGod3ezXM/ZLSx6fzx55kZA/2eld+O0R4sQdEhKqlCNIjIjYD55UONaDSgcaDspk
	 ILKDATip7s+HQLpLq9aXOlPSTo4A7pHtnEAzMxEAmZ+uhgn7paS0K/CyC6d/8kYyBuBk7
	 G/pifXQ2D0SMGQmRSyCM22y9GIKyb+N70XjfzQgh2fo7pLyi00aaG4+qpzZjTDIQ+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gT8kuCJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C0606A331;
	Mon, 16 Nov 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gT8kuCJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45B81F000D2;
	Mon, 16 Nov 2026 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794860945;
	bh=7APStlZA8BrnHUohFacSaOoKoFsQzAW9DK7Bhe0nSjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gT8kuCJxP8QIlNR2gcO0JlbscPuG0RfHlinYbvR6+waxTz2u/MBTjAXO5aLsW9ydR
	 HOh/OkTpqAHBpSl3iO26Ahqt8/nenxEd+f2CqM70YXJy6qVHXqCdpnZ1VmfuQhb62m
	 S7MNNitDa10u7G3j/BpKtMi1Ip5GsjA19PHEZnEXf+YRwLzhy5yZu2HI7FFx4H6SU+
	 lPU+myPplFv0uDtwdjEjs3AW74+8u3Hn4FeDRcnZg2p2Dn6AQEbNoOyKDSQ+IyHOy8
	 bgJexmvLq3gmY5ZuhHxSjKKYOKyjdvynGp85Pc2PdVA4VTr27AACGF6d5zgrOxT5N3
	 ZviustHfu9TsA==
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
Subject: [PATCHv4 4/4] arm64: dts: socfpga: agilex5: add support for the ECC manager
Date: Mon, 16 Nov 2026 14:28:54 -0600
Message-ID: <20261116202854.3087673-4-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261116202854.3087673-1-dinguyen@kernel.org>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
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
v4: no changes
v3: no changes
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

