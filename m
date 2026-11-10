Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301400;
	b=GIsvahUuNdPiA+ZHt6dLYginuvHqTbopvJOa6EAecWoWmqeeOeQNnnHqBtcjX1qihCFY
	 nuZdGra2J3NgcRImh9SyxoyEihHwvTnFEEZhfVIVWFHZOOreNYTFt08pJv7r39J6laBtW
	 JdSTffSe8ztc/dDt9WmfQfbLsSW9V4//LOcwZTNH16T0Co6KcQTrcMLYFy/b/dAZNN0XC
	 +h12k/y3GlcHcIszqMfNIgBVQURnGQFy0GjuxiB6Nzsd/PbBRbMCXxViKeNKPS02QNKe7
	 unUNUo0eKvhpnUuppQRgQqWDCSuseP44Z62UIOkpWFmMNIaEF2RPGGZCNqhkbxb4dEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301400;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=;
	b=IESOsUnPIaFPtVDn08x5y7dEBq4YMaOW7U6wh8iBixr547Dnvbc+xxL1/67T/FNLWQnw
	 9M9J3N09qxu2krox5lCkUJKYsYaLxoHzhKDVucfYAMS7vtY25SBUcP9mEsY7mZVo7oW0n
	 EWPgd7Bqy4pTv7kgis35UD2z6aHdtovntwEyUGTPoPaAZ2kJ4zLArUBZxrdl+RQ21B66d
	 0+W46Q/LW4iwYWumEyYaG6wWKfBI9qYI/ggzAx+Y9by45Aav/BX3EOp5uR3mJ/w1DWRUZ
	 WMWduP7bkslSVim5vaNQ/fczLhEQj/JNiao0DLIfBh0cyzJ5ZXH+XeOm48sZL1l8sxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QvvCcZll;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186F60A2608;
	Tue, 10 Nov 2026 09:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4186F60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QvvCcZll
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D73142004B4;
	Tue, 10 Nov 2026 10:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794301396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=;
	b=QvvCcZll9nfoiX1LGBmwAWaz6C6URPecwdmuRNKhH7Vaxzrks7ds2pGmx0BDm22nRr39nE
	32fqoNq+aEWysvMQHvRxHgZh+RvwpWPndblh1y9HFDTGdPQs2lZVwzK80yaQ/jGekcBYjr
	kHNwgUGK+0nIqqWjqOZOrI3SnH1oHRKmq1r+KtIDtIPUD3O9b6/1gnEKlsQ5zwqk9NZRiW
	Aw2AQ+CHVt/a0njDG3sit1+b3djTP4RguSZgrAgExLN+cvUsbevpmElViK/w1blz/m+fPc
	qMpb7nRgBjkUqc1uwtKd3FK8Ab4S25xoLRg/Feifkk5UOP3ffVYs02iV5CylVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794301396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=;
	b=QnIBYVzDajT2AtGOEnK+v3EQQUuXrCBTbHddGThqt7eXyM8Sw1mktO3/kdQxlq4KGUbeRn
	1mCHEnV1ezBU4VnEmLDrFUBE9UfKkJ3uYmhNVUZe+9D8gcM826L+wI9+surjnEr1K2/lgx
	JiGnEMZ2O8Bk6kXJB0mHQZ29KrBV2a1umqA9I0jkbI6nckFiNaUvvXMI0MGpa2wTdbcOjP
	ybBlW0ppcMZyBS0rYgepNLIVYolZDybTKdg+gOdYUilw6IVo5nSxrf+XbvOE27Fbj7uCsH
	heCcX8vdNDYnBr4p6vmjLzUw44hvWOuxFTCYOUj5A/CP0AFDOXJ3s9bJj3vHFw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794301396; a=rsa-sha256;
	cv=none;
	b=ADxZs/pwwc0+vefYfA7cO36TgOleG6Nie6SziGqCXfoBX3SR8EY3a0A6gm1RUqMt+AEeyV
	LuZDpEhwwsytB7bCZeBDz0cIg+lPURnf+Qy89RZvz1UlOD7kZ5nf+RkfifnNnzaPDZuBnK
	rIEAM3mctVpdfYYTHQrcudSK5/gn9hDXJpYpgdmwOxRGFhvb6NY53D10V/0EUTkXI6yVEe
	21IdCjiHiaPv8C+xSdipkvLYVa/60BHsgLu3Mwp280DJxB3kAlvajvo6FD3plibQPagwJL
	rgzTyGsBc24YdnGU/57nGSnDSxNXpALZcldo6aCubZIpsbSKGPxo4KMux2chgw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Nov 2026 10:03:08 +0100
Subject: [PATCH] arm64: dts: xilinx: drop unused #phy-cells from the
 DP83867 nodes
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
Message-Id: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJB7RUr2JcQDvVMbGUFolIu
 LtVl2/x/wqZk3CGU7VC4lmyDKGAdhXYWxeujOKKoVa1JiKFc4t7nIYoFt9LGB8RXTSN0S0qT+S
 8brqDOULpY2Ivr9/7fPk7P/s72+k7hG37AJwvBo19AAAA
X-Change-ID: 20261110-v7-4-topic-zynqmp-dp83867-0f11df63a589
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6985;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=r7xwrLRGPAQ0iiVHxekSDOtVkGaeiUkp/R9YD1Vpj34=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9anu5fLC3/3T7r6JP/qdiaFxxqaBu6fku6blCzqW5O7Y
 W9IDNu0jlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABM5nsPwV9Bz4S6n03X/XA1v
 hul1Lbdk/1+bahVptlI37Xj1lwBtfYY/3Kqh/NLJRk18vO6Vv4/cfXc96t/Z8vik7y7H3RgMYu6
 zAQA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
refers to them with a phys property; the MACs use phy-handle, which
takes no arguments. #phy-cells belongs to generic PHY providers.

Drop it, so the nodes validate against the ti,dp83867 binding once it
is applied to them.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
 10 files changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b82a056be2f99..930f0e54fdac5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -254,7 +254,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -266,7 +265,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 4dcf92a2158fd..e05667f6e946b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -255,7 +255,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -267,7 +266,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 52954761c9f3d..af897c3cd1680 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -200,7 +200,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 49732de5fa4b9..a1f0592e79589 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -191,7 +191,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index a5bc521ab6797..42030547a32dd 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@21 {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <21>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
index 3c28130909bc6..bad59d7b1d26d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
@@ -19,7 +19,6 @@ &gem3 {
 	phy-handle = <&phyc>;
 	mdio: mdio {
 		phyc: ethernet-phy@c {
-			#phy-cells = <0x1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index 32509083e54f4..898a9000daeaf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -126,7 +126,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 96699be8430fa..b0a08cf1d03bb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -131,7 +131,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 52441e5c87390..58684af4b98c4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			reg = <0xc>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b34e4c93d249d..30f97f67e8c8d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -189,7 +189,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-v7-4-topic-zynqmp-dp83867-0f11df63a589

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

