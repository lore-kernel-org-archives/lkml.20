Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94235DA42;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743501; cv=none; b=fVswOeYVnfa+3SM5ha7fvbYNdXiiLka5X7Ar+NHzuOdGJZDskse6D2MCLyNl9uH/RqaseGqYQo5ZXHtADmDbjeajyVJWaQSLPStJOANUwLWzjmvhGwCY+hT4g0536h+31iT0lUktNcFj/TVWMgBalQZnuYc+BgjH9fbDx8BdpAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743501; c=relaxed/simple;
	bh=b5WqWIpY8HetKJM8uxETc/QQ/y49qT8ER9ENAwKq5T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcUYAZoi3x+LDCQmFr/pkuVevA059hf1RUXqHBPjdZgCf8RrVCp7tbFsHXUkdcNgIQfFJ8UNT3RN+2ne1i2HFLe8+TA4ivkCXFp//sLrko3tWpo84CazYt2q1tHMmT/u0layI2IHd6WNckilt8knzlO3CxTEPVvsH+g0f8Ub01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVPv/y3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVPv/y3I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FCBFC2BCF7;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791743501;
	bh=b5WqWIpY8HetKJM8uxETc/QQ/y49qT8ER9ENAwKq5T0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sVPv/y3IyEH05ad8o2JJO9YXswmOnH3CfUMExD3nYiTtyNWyU3mP4tS8hWBGxut+A
	 yT/cdBonvrjwsziTJEVbQ/jn2zoK+gi+T29vKBGk1omwtbMpwo4Q/4cUf2o32ScYqy
	 hcQZu0tbEPxcOA4PmUz78MXlxpzixfTTB2HIFfhqUuPLYu1iEuQaGmN9YLjVvVapRr
	 T8L5Lb5iPFzh/2HxfeywVUm+QKYebLKl2XUnZG45dS2aA8w2et0F0orIjBfvw45Kgz
	 Iu0sZO9mS91b+A683nfRsZqK3IsbjcHyfaJrGGawsugJ3t0nlZ4nwzaIiGzbYNMKGa
	 YEP3wWCfkhWXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0EBCA9EC7;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 21:31:40 +0300
Subject: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791743499; l=1642;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=PsqvKgTZVmwNJ/75hqMs5lzb8aAfYpplhUuYDuvqmXQ=;
 b=gqt5Pn5RDRBctoPQT0FhhHkMrtLZS+rS8WrpKx8CGMCHl/WC44eGIvR3VU++jAeOdW0x/OiO6
 8Ycvr/c7rGFAeDjY/tYKXbv/t7HctodE4HL9+Mtg11QzpF0JfGbz0R9
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

From: Fil Dunsky <filipp.dunsky@gmail.com>

The vendor programs a unique factory MAC address into the SoC eFuse at
offset 0x34, where meson-gx.dtsi already describes the eth_mac nvmem
cell.  Reference the cell from the Ethernet controller so the kernel
picks up the factory address itself instead of depending on the
bootloader to populate local-mac-address, or falling back to a random
one when it does not.

The cell is 16 bytes long in meson-gx.dtsi, while
of_get_mac_address_nvmem() only accepts a cell of exactly ETH_ALEN
bytes, so narrow it to the 6 bytes of the address for this board.

Tested on an ODROID-C2 with the bootloader's MAC fixup out of the way
(ethernet0 alias removed from the DTB): with the 16-byte cell the
driver falls back to a random address, with the 6-byte cell eth0 comes
up with the factory address from the eFuse.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810..3b74528ef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -223,6 +223,10 @@ &cec_AO {
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&eth_mac {
+	reg = <0x34 0x6>;
+};
+
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
@@ -230,6 +234,9 @@ &ethmac {
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	nvmem-cells = <&eth_mac>;
+	nvmem-cell-names = "mac-address";
+
 	amlogic,tx-delay-ns = <2>;
 
 	mdio {

-- 
2.53.0


