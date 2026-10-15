Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF42566C58;
	Thu, 15 Oct 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086921; cv=none; b=AkgDPfYL/eZa9KupgHEnre4xo8HRbIpVzLxlk28gaLxBwULAXl8NifbBeke9zs8BuureKYPddLhpBRPQCLMOTuZcU4JSW/+UMB+CcHgGJmLRxcGTAe1fXMsGujTl2Ywrw3pCyf1FRVKPvwdIkdiL4tg0SMY9boTkeFcbWvIZt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086921; c=relaxed/simple;
	bh=NNesoLElBUv09j/SE4YghbtNRl4bZejc+cTkcFayRsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vrof5T8fQedsMeuUrd/tOn6RKoL1cgKATDPyx+e5N9+IQSZ4nz2VDYZOeJgMS5D4+cqCX+AJuc6RGZDKP1jQj+nfi7gdeBF9JfmBlTFr7pXb9GLjTa3pHCep3hKheI2NdxMKhYydU/XvPhAtJzi+WEgf5PO/uoUEZopUrtWn4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdyrY1iS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdyrY1iS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA1EAC2BCFC;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792086920;
	bh=NNesoLElBUv09j/SE4YghbtNRl4bZejc+cTkcFayRsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rdyrY1iSTume5moU/1bffAZN2NMh7lO8w5GuQ7XlgDjK+GcEiymaHyahSjUocV68Z
	 uQ4m8Sa2p8+m6Lbz6L8Iz9GCtxP5ZljK2gkCdYWtV9RC726SxpS47cJ5+Km578iOyf
	 9K6GTr2K8KcqUHT4yZHmbVqN+3Z/m38SGKVWKw5yrX2RfL+kdsPIrWMlCzDghdm4bb
	 GZ1ZUNPXKPGXKYwERZ2NnyIAD6NqrAJ8EnS0SfcBFma6Qu94U4hV5mmLjuI3grFAYe
	 WEVyqihAWNZfeCD04G9JQu545DG+ti6KS8MsbasT1WKfgWo82AEFgoz7LydSja9iNC
	 kzJ7xCb1TEVJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22BACCA464;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 15 Oct 2026 19:54:12 +0200
Subject: [PATCH v6 4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-add-thermal-t7-vim4-v6-4-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=B2WWh69HSsHWgo7xf4TXcX+65d8XeYi4tsHrfwMtAdI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZF4WbRc+pCrMF7j8zqcj9z+kzXbsEbj3bdVCo1X3lAR
 kMt7zhvRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjARwVUMf2U38EWa3xKvsQyJ
 fFFTl5R9Jir2nF7854C+d/vEHPs+djD8r/xuKlqjOvnHEtudjcpLraSSdc/+/tT3YkZlRa+NYsB
 yFgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add an active trip at 50°C to all six thermal zones and map it to the
khadas_mcu fan controller, using cooling states 1 to 5.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b4179..91f81f7949bf8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -256,6 +256,74 @@ xtal: xtal-clk {
 	};
 };
 
+&a53_thermal {
+	trips {
+		a53_active: a53-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&a53_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&a73_thermal {
+	trips {
+		a73_active: a73-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&a73_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&gpu_thermal {
+	trips {
+		gpu_active: gpu-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&gpu_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&hevc_thermal {
+	trips {
+		hevc_active: hevc-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&hevc_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
@@ -269,6 +337,23 @@ khadas_mcu: system-controller@18 {
 	};
 };
 
+&nna_thermal {
+	trips {
+		nna_active: nna-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&nna_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_pins>;
@@ -389,3 +474,20 @@ &uart_a {
 	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
+
+&vpu_thermal {
+	trips {
+		vpu_active: vpu-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&vpu_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};

-- 
2.49.0


