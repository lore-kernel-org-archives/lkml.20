Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008668;
	b=qHgjZvQkxhaEKB3p2OjJ46ce23h4vXSOAr8pwgk3qKzoBllOPPmBTMnHxlAQuFkQwaCB
	 iRp4g0ClbMJHqitc4sDwdXHv9VDWf5Db814kqMPTvPpRkcyvy2CaDW1v28V5TaEBx2pqP
	 b38XbtcFwLVp4pF6aD/1tpQW53hDCUOiNHarM6H9kLAcmgNf70dnU/vHLp+HzLpCocmB7
	 etAoUvoW1Zoe1vkM8pV8ILqjcFJSlipzwLsSEM9inqV0c9qr53MDaaln795ISHaUS0BeQ
	 pw6zdQ+t/m0nJ18usccHCEOkP7cJxAt1QNG888tjTaOJP1mvyKc0hmf9Vea8JYHYeJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
	b=f3TtK2tPxj0CoVuQR95Qw+h1C8kgf9ZIXYSkAPfZBBwDekDCcmLH7B2lSM/L4g1Sq36s
	 7cwx7vu2es2FgSzVT69HZcgqVqFUpBvX+FPXLbSBevn1XQr+Hng6R9Mwr3zC6wDSjRP5s
	 pBiyqVEqPftWkW+vegs0hw0ep6JC7gAWPwifkVeMX6y4aGOjijO07n2C/4j+xbZgcBoCs
	 6O0wENXzwAVe/l122jPc5kxk5fWZzOB2zD6SeeQ32quW1AbZetyTQ5mRoirDLG2kDQqxg
	 YY8UNVauVrAO1PiCadaHd1n3y8+k3CQsgrxe+f2UgyPcUKS1CJl2rUgfwOVInQwb44w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OqnNmal3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63455606A9EC
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63455606A9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OqnNmal3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7851065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008666; x=1793613466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=OqnNmal3lUFLHEK4n11AkX/A2Qd+EJT35OamArxCZCjw9y+0SVslK95RqIwBkUf+Ko
         O4/3mg5DlByHEW4PbdeW43Byujx9rI9gKpuKs+a1gh+TM3rq8KoAcdn9v/obuUPVlrD8
         8j8dkInlj3zvUzojdNyo8mya+apraHLQhoh0bHiV9waVfmjgfEIxNnInNGuJ0fhaUoEt
         +tD6QAi1Si1odmginspoE7MH/Sr6BpTuYTvJN6xBbswEVwYXRyiWnisciR0slcGEOYQy
         pIDi09FgpzIQKJryngLtXdubBMWiAZN3RnPxhjWgbPr+QWnr0KcJds0wbx0AOYj0NXV1
         kuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008666; x=1793613466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=2oAZbEut3bE17gH9B3kaUBVtF4+Kw9pEFHbi2KQ0b9hJCqxAbhz+7N13jkiM0+sb9X
         kSYs+DqT6eOR78KBweEzJSwdk9FJ8hwHr97ELhkiD4QChuAmiFBkE47cf9ruee4IImeY
         XpGEhpW118I1EKUX0qe5i511NNATyj+7U4P/wlU9Mz9U05GpEdKlvpy0VoZ6jDu3ig4b
         fbcSwv0fBGqL2OPPkPlGRVrTKnptGCsygI+YFPrYe5TIYNuk9+kG7Bl2mvrtJXkuzYpH
         EJfe3EdK/aGh7Yjw7bLdsvh0cVI3dVp3GY5E/yRVK0R4vDqc9oxM2nHmji25vZtAHbuk
         yBHA==
X-Forwarded-Encrypted: i=1; AKwUvBxqJRDBpBx28TcJbOlLnCTE3xbXnuqkjc1oD5GGMbBefcWMb1jJZbaXDhTq67hjdVQnGUDNumAMPhlNj3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHNyXYDSjKkLdj2fDXFWlkmc6AXsyeFYP3qxD9MRtGMChrt6U4
	HyWavSY03ENyQ/Uyd4+6z5PBTtQ7iTwper8tCLpFxy8EetGTaVptzkztwrwHyg==
X-Gm-Gg: AYBFou0LXGikolAwY82jJYhvufm03T1fCMYQ2RZ28loXKGuWjMuitjTKGTlGsOT6js1
	KUQIVTbWSs6VchHp+pk+LMA9/DWGt9NUXV7VIe0NGBGNXr5c0vO4y+xCo7Q9bGeBkaUoWoGbzpL
	uQbNAydy3AZCJWllPpphaiTNteBCY0yRjsuDto9c2OVbunvQJ1vSxMhZrsDvFieIQnkivnBKAb0
	FmRGuoIAfZ/4eGCL9dF59QLhkwQ3EQt5Nk/ksbdNr1DU+DIt2LucEGqDNsY/5U3ND63KjWGmTXk
	cOkbL2mHkhkWdwrFeuWzUaBqKBTlTVCrA3k5ZHabzJD8SVc5pv7qBG0hSelGpagzczG9A0cPuSQ
	hh6VCkleWVOsXyAYMeeQOu2EBkY92Wzqed6mNsiFozYFEr4wFNE5rU1jeTv/jiy+I+uHsmHxD5u
	AedGgXy5jgW9LBUnh1cHkeOLxaexKZXpwerIZa4JWEVn3jr/LWgmkzIRKnUOK3ueTz2Tdc4LCAf
	LZOVy1n6Wd+nth3rWPcMtTTX1idPQ32x5GByDZxlA8XCqkD8hmB/rpvaE4P+rU7nzd6PO4SfPAz
	N0LA1lN2p4AalvP6lbyIWa2eTcv+Z5CdkX7bnN1fZae3/0fwBFJokZw6qgkD
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr42902295e9.30.1793008666472;
        Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: airoha: en7581: add integrated switch node
Date: Mon, 26 Oct 2026 10:57:15 +0100
Message-ID: <20261026095727.31708-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add the integrated switch node complete of the internal PHY with the PHY
address and the supported leds attached.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 147 +++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index f214fa3a3e2b..83ae41271f96 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -470,6 +471,152 @@ fixed-link {
 			};
 		};
 
+		switch: switch@1fb58000 {
+			compatible = "airoha,en7581-switch";
+			reg = <0 0x1fb58000 0 0x8000>;
+			resets = <&scuclk EN7581_GSW_RST>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				gsw_port4: port@4 {
+					reg = <4>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy4>;
+				};
+
+				port@6 {
+					reg = <6>;
+					ethernet = <&gdm1>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_phy1: ethernet-phy@9 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <9>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy1_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy1_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy2: ethernet-phy@a {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <10>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy2_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy2_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy3: ethernet-phy@b {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <11>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy3_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy3_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy4: ethernet-phy@c {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <12>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy4_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy4_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+			};
+		};
+
 		crypto@1fb70000 {
 			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
 			reg = <0x0 0x1fb70000 0x0 0x1000>;
-- 
2.55.0

