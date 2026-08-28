Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B5440A21
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917571; cv=none; b=uLBN5kY8aIUpuW7PdXmomgsSDssvYKjxsEmlEV02hr01wZtnhQGchwL2RSDLrXf3VC0aGC6mXl5iCBfrpDRIrwqfvvTMBY0MMwqKhVK/frdEb9DFfjV3HhO67bc08THa3Q9n+ie6V0z3A/u9e2L8VMvTd8SKEk1rm3Lb7axPy58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917571; c=relaxed/simple;
	bh=wmwMhWrF6KGODbRj6xonI0AjvaUS1Sgws1dCNYUbeRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFldqKfH7iUfXHQhkQq8ZQJrKwZCWQfTUW0ZJBqTGTqBys68FwGG8pl/lYSxTarbIynfJX9LSvCFeoOzxHCQoCOar9/7H/Z0S8d4E4EuHKkjZHWmJtFFRt3p8oQl9oNpuAeUcJeIB5NgiQqfJW2pJIe56N/2JHWa8h/boCq0Em0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=YD/1b/Gt; arc=none smtp.client-ip=95.215.58.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="YD/1b/Gt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wmwMhWrF6KGODbRj6xonI0AjvaUS1Sgws1dCNYUbeRc=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917561; v=1; x=1788522361;
 b=YD/1b/GtJDqWV6yIst0E6WvjXEm0Z8fs4mNJ0Qnd5JIUvnt0mwChOBOvWyGFzA/jaxWlwdFx
 d4dIGGLFIn3xtO2zkY3cKG0Ib4Av+jR49GqMMHNcY91qJFeKsMztrlyvHC2pX+uzmGaQl69gFOL
 JzzoEjHqF0yx5oSaac3QD/2C3QRExHqYzB4YsuMIABbAmMlpvxLpsFKYIRlAFUhiXj3s65VVqas
 RCkOMNl63ZGAegdXpC3YkRLhC54mokfyne3a1EFsr9DESYVuahRLcEFi+ds9U0qV87pazgZp2JK
 jWcb+CkmkiGuVlOMqMB8arukZPlIGB+bjrJASRQ335i4A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0812658b5ce5c458;
	Fri, 28 Aug 2026 11:46:01 +0000
X-Mizu-Trace-ID: 0812658b5ce5c458
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 5/7] arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:05 +0200
Message-ID: <20260828114530.1315798-6-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes shall be ordered alpha-numerically by the node name.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 2c9390d2968c..e42b2a14fc82 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -1164,12 +1164,6 @@ &tsadc {
 	status = "okay";
 };
 
-&uart2 {
-	pinctrl-0 = <&uart2m0_xfer>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &u2phy0 {
 	status = "okay";
 };
@@ -1186,15 +1180,11 @@ &u2phy1_otg {
 	status = "okay";
 };
 
-&u2phy2_host {
-	status = "okay";
-};
-
-&u2phy3_host {
+&u2phy2 {
 	status = "okay";
 };
 
-&u2phy2 {
+&u2phy2_host {
 	status = "okay";
 };
 
@@ -1202,31 +1192,13 @@ &u2phy3 {
 	status = "okay";
 };
 
-&usbdp_phy0 {
-	mode-switch;
-	orientation-switch;
-	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
-	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+&u2phy3_host {
 	status = "okay";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usbdp_phy0_typec_ss: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
-		};
-
-		usbdp_phy0_typec_sbu: endpoint@1 {
-			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
-		};
-	};
 };
 
-&usbdp_phy1 {
-	phy-supply = <&vbus5v0_usb>;
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1249,16 +1221,44 @@ usb_host0_xhci_drd_sw: endpoint {
 	};
 };
 
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
 
-&usb_host1_ehci {
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
 };
 
-&usb_host1_ohci {
+&usbdp_phy1 {
+	phy-supply = <&vbus5v0_usb>;
 	status = "okay";
 };
 
-- 
2.55.0

