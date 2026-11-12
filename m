Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511973;
	b=rS+rTUZxj1p/fb981gY/Wt1JCnpeRrYzSWIh8Suw3KBcCM6o/IL49FdWnaKSSMMKM+TP
	 Ym85z3ez25jyiNQK75mLYaIaQz196zSP2CkJaLvtZUagE4HbGtHA5XLv6f9D59cK39/7y
	 pUWQS3UbwZTKsEbXnvFoxVE8UreqHb9I+58s5RGAU/eJFS+8Lxa3DE+fE029VaWdtlLDe
	 3rihrp4T/VD4MCkqUwBrnImn0L7AM+l+nEHM3cJfgcIbsKWnRSfFrPi3poRsuZB2ke/OJ
	 r8SXA4kQGMYOjH6780oC+jiY5e4VPPerIo6EnkeVpcvwQNfY2xHjNWzdrC4xjjeMUIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
	b=14ZhYRA0DeQ5yFi/+eJRo5c1PRRoZ5Sm2DWO27gygpVBvOQDpP/fKULYVHAezpKwD8v4
	 TIA4UEPEsZg23nd7jLHsKFK4zU93ZC0z6+97jwVX/MM7+KbZuHKzzKfFZKnqMB7V63hgZ
	 N+23UHWk2Rc8R079n+VYZRQcTIUCU6DYBED9Em3MANMo3wk8aeiMmOf1SysvdVcl8e05W
	 cxs3IMW47GwrU7qMuKC47KfXMAVJPg1+cNjJlLhoZviDXVUbQ/HWC9Fd417Yt1pNZRfio
	 kStpfRijZWc1glaQOIEazhOUJYsBcPnAxN+MX5SQ7K/S00vwsjormaUm7z+xp+AApVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjPizhR6;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07139606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07139606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjPizhR6
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso220217eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511972; x=1795116772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=NjPizhR6sJABSSKbD/L4Pk8DJZQWM2kKnAYlR84izVNYD5hlurFI9Iqirmwjv8fVad
         3e8/GKaWcNbJMzef+UDSOWd0y9BTTevHeZxc2CAHEzIlOOrU1bwUs/Rx///0onC9vmeC
         QINn/o4gYXYyXlCjMPDFfIUY/QJY6Ow10iUfGJkjBNpL+jONbCtxJYwzCD+5fnFOG8zO
         Bl2tC7I0MjhsTCyNRRIpnfIBiNvnlGM2NH6gzI9Npt9HB7sifOB3co3V872rXWQSncDU
         QbMgWv3SdQhDI0MwOP8wXfVvtsNP+D8D+kNBXVmvpl72yMGGTjVLMfrcSiQR5U+Zhx2V
         ohig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511972; x=1795116772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=dxOPgFWs2jjku0OSyAbT2nlyyv10Z/WTw/UU8zF5mZyslzNFetp9nFtsvMJ3x1hz4k
         azXqgL+mAHV3IC1xT6K4sDkVGojWUmL6kfaFVlD6nZzKdnvWmJ4hLojbQzNb+P/vIQQr
         Mnh0nYEHLGDqySrjpg8SYU8og09e5Gv8O2yOJyOMRHQMAC0CoiCf682O9l4nX9T5QD9o
         rWGwUk058lOUcGyxG1pdOCZbB7xzq/qqw2ZpzaCp0m28QGcf7nYjwei1CRJ1BUhj+VEn
         KXryndv8Et0GXR4pD41lbYtZYcSB5kqnTuG5jJHOJmWou7XXFag/MbZHuO/ehwxyuN4C
         8LeA==
X-Forwarded-Encrypted: i=1; AL+hErEXyZu/yqVhn4/FYKWNAGz8ytfbkKSAyWeIHkZg+e8UhZgJ4T5Pmdh0Uh8C1GSt9G9NIvDd8Y2lTXwziJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6NctJ6DqUrQ/1w+A+yJr3Qx2CUa5yYCWau4g7fmxq7W+TOEox
	6w7CBNprmptS1uHqGp4WRyamsLpk8/XSzD2oEIBupSuzQmiGF9ZWRLXe
X-Gm-Gg: AYBFou2Wjyli3Tv58dj+UbFhgg938iUqPRrTUjwdmYTgdErdlco6lHjqKllge4DlHPx
	jU1Gwj2FH8q/6iymLnCirUViCXNEUy8AyxQi/ic5UPluJaXW6IqmAW2vZlqoUmKIfETcgHbSyXi
	PXiWpeRsuyjEygVrcR6x8l7CywmA4qtirb80lhXhna4U8r06ul1WNgwDSD0gOkwcKeBH2Rr3fco
	WgZydBeeRqQvxrhFMcsJsdEa3u3VOsb5SjbAnDAxvJ1cdubexmC+pcqVmMlilvffKoW2T2oEbxo
	BetNXIbtGRYJel8DH6rw3PF5KB5C+3ZX0DFJWCygYNPRYjWusnZXn4IyCvP0pgt1X8cdFbf2v8f
	A2MF7zKc+pobFTYNqrTC41wOom8hbt4bPmhYN4Kg9K8zhYdLgqMRYrYSIj46Xno4Lc85o18rXSK
	Rjw4IkdnQDEtY5pc0LUJQrIPUp+VkkblXDzZByJppnEJLqIWBejCdiGbeOGGliF6bodTdCfN7sC
	Ep+lqVICcR5XaB9vGEY6gfLdXmqd0jq0UWAmkh59NNX+tLCglY8piVZ84LBTeqW6cpnqwclaheo
	ZOROCNo1svq/Ylw3I5NAiEjUXg6H/+h+4u8EU5OzA7cs14Ni6w==
X-Received: by 2002:a05:7300:828e:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-37966a5ce93mr121854eec.29.1794511971759;
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:43 +0800
Message-ID: <20261112193245.250149-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add devicetree support for the ALINX AX7Z020B board, built around the
ALINX AC7Z020 system on module with a Zynq-7000 (XC7Z020-2CLG400I) SoC.

Changes in v3:
- Drop the vendor website Link: tags (Krzysztof Kozlowski).
- Drop the empty bootargs property (Krzysztof Kozlowski).
- Rename the USB PHY node from phy0 to phy, as there is only one USB PHY
  on the board (Krzysztof Kozlowski).
- Keep the explicit mdio node under gem0, as requested during the v1
  review and reviewed by Andrew Lunn in v2.  dtc W=1 flags the parent
  node's inherited #address-cells/#size-cells.  DT schema validation
  reports the same Zynq-7000 diagnostics as zynq-zybo-z7.  The MDIO
  layout was also verified on hardware.
- Sort I2C child nodes by address and reorder status/reg properties.
- Add Krzysztof's Acked-by to patch 1.

The "alinx" vendor prefix is already queued in linux-next as commit
1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX vendor prefix"),
so it is not part of this series.

Tested on hardware before the DTS style reordering: SD boot, UART
console, SD card, GbE (900+ Mbps and LED hardware offload), dual CAN,
I2C, QSPI and XADC.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

Range-diff against v2:
1:  f44b8dc6e6 ! 1:  ca50a01108 dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
    @@ Commit message
         Document the ALINX AX7Z020B development board, built around the ALINX
         AC7Z020 system on module.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
     
      ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
     @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
2:  a985ee80d4 ! 2:  477061f136 ARM: dts: zynq: Add ALINX AX7Z020B development board
    @@ Commit message
         always accessible from the PS, so expose these channels via the
         driver's xlnx,channels property.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
     
      ## arch/arm/boot/dts/xilinx/Makefile ##
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +
     +&qspi {
     +	bootph-all;
    -+	status = "okay";
     +	num-cs = <1>;
     +
    ++	status = "okay";
    ++
     +	flash@0 {
     +		compatible = "jedec,spi-nor";
     +		reg = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +			#size-cells = <1>;
     +
     +			partition@0 {
    -+				label = "boot";
     +				reg = <0x00000000 0x00500000>;
    ++				label = "boot";
     +			};
     +
     +			partition@500000 {
    -+				label = "bootenv";
     +				reg = <0x00500000 0x00020000>;
    ++				label = "bootenv";
     +			};
     +
     +			partition@520000 {
    -+				label = "image";
     +				reg = <0x00520000 0x00a80000>;
    ++				label = "image";
     +			};
     +
     +			partition@fa0000 {
    -+				label = "spare";
     +				reg = <0x00fa0000 0x01060000>;
    ++				label = "spare";
     +			};
     +		};
     +	};
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +	};
     +
     +	chosen {
    -+		bootargs = "";
     +		stdout-path = "serial0:115200n8";
     +	};
     +
    -+	usb_phy0: phy0 {
    ++	usb_phy0: phy {
     +		compatible = "usb-nop-xceiv";
     +		#phy-cells = <0>;
     +		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&gem0 {
    -+	status = "okay";
     +	phy-mode = "rgmii-id";
     +	phy-handle = <&ethernet_phy>;
     +
    ++	status = "okay";
    ++
     +	mdio {
     +		#address-cells = <1>;
     +		#size-cells = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&i2c0 {
    -+	status = "okay";
     +	clock-frequency = <100000>;
     +
    ++	status = "okay";
    ++
    ++	temperature-sensor@48 {
    ++		compatible = "national,lm75";
    ++		reg = <0x48>;
    ++	};
    ++
     +	eeprom@50 {
     +		compatible = "atmel,24c04";
     +		reg = <0x50>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +		compatible = "dallas,ds1338";
     +		reg = <0x68>;
     +	};
    -+
    -+	temperature-sensor@48 {
    -+		compatible = "national,lm75";
    -+		reg = <0x48>;
    -+	};
     +};
     +
     +&sdhci0 {
     +	bootph-all;
    -+	status = "okay";
     +	disable-wp;
    ++
    ++	status = "okay";
     +};
     +
     +&uart0 {
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +
     +&uart1 {
     +	bootph-all;
    ++
     +	status = "okay";
     +};
     +
     +&usb0 {
    -+	status = "okay";
     +	dr_mode = "host";
     +	usb-phy = <&usb_phy0>;
    ++
    ++	status = "okay";
     +};

-- 
2.56.0

