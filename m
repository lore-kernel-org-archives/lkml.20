Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4B3F0A92;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013526; cv=none; b=OjHamk/1ytOmefwtt1naMxT3hoceQEztp5D3sOBv5yRkq64EXzuoopUZ/vxzL9t9My8WIuh41wFTLyA7sA8rL+9P+dW0h7R3yQhZldkprkzwZp/TWUclTRoWbV6X1KNSC3wcTAzDGpuF5kr5/h6WZZnUjJ+5xFYUHMmmzJ77up4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013526; c=relaxed/simple;
	bh=xE1WjLCGTIvmZrg8YqDPjvweMSKiGRyaAKu4rvp22wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=len16KAnX8Ag8Ij6tH/NxLjG0PQlHXdrnqgYEOfNL2CMr7/Mj3xWwFU4WLT6AC7GKA3RDRR7HgX7Q24pW7fvRayqj0a9DAsuO0ChI5GHPkwrca4v6kSIrBlAT7g+hB+gJRRCq/447VPcse+ztdokiYxSi1JFI6WOGLPldX6Vhgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpxw8tV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpxw8tV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A781F000C6;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=n4bYhTdRxOIvSYNEVOuBVwZfG0oYfdpuMp66lA53CL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bpxw8tV02mBatpIOGwmCGxmrFiQ75HYb9OxsnDk3RjVkoNG/T6yA6jFexrrj9q8Qm
	 uF8UxM2IwK0DI2DW8c4nwLxPy8qoa749m2s9wJLpJN/z4llEyp1CAW9C6lVInL620e
	 1USd5ujhRFjgcyZMQeMLNIWxAUsSqo8ZuLU0zDEXvAHc1tiDOk/rmEM4c4V1ojsqKU
	 t3B1UCAcGD/Nn//tA8h4e3hcXueCBBmyHlE3jAnXxcvsaXqrG1hdIHrl3RUYIQxouO
	 L6rEN68dnM8XXt73SR8vyTMUFwxqdqlJ2APJNovg9743f5xJkuPwZLV+l431xrfT5y
	 UnZOkovChO9Jw==
Received: by venus (Postfix, from userid 1000)
	id 6EB011811F8; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:51 +0200
Subject: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7FNEaDo7pGA047wI3FK4TKWZhXwLjIbr474e9i4K9eQ=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TRTgD15gyUoA1EJiK1ufhTOPiWWz1DgIB3K
 rbh7UdFI4yJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00QAKCRDY7tfzyDv6
 mjYkD/4gfqFQqfvo/G2RzBfC3qPlVX3/CJkbPdHElRSfkHsIERq+ee8LwGW1uH6+2TRHMBegkPW
 +WH43q53usn1LPTfsLP2ie1Ke5aTliJs2NyeezZHN+GuV1VWFJCwI4+tCirirMBfK/m3EOMIMqu
 rBKW3/5Ww0f90ncFMe4mccdmsaHDeNYCmwt0PSExHzc83XCU/LLW4swkTdaV6zMp/eq4yEbBp4A
 Npl0cUtZHmPcJH6BkLtQi69MEK1BGloTD/HyvYq6PjO4wB916xQasNNwe37h89WL+lCQKcAPxut
 Lu/QrstgTwlVR36TJJH4eDXmBZNrwtPIXxZVkjXzgbyw6oTwEGXYGxGJD785zY/wP3n2t8GZmdO
 L8UvP8hVx6fLS5POyecRhbL5lW6tn7e1lZxzPpQb8K6AINNnFtfOsodwkBwe9cuzBqJSM2ypOxk
 Ae9L/vlOuSynGuKQYY0nwiuOF6G3OVLgtQs1x+8gvQ9roSS14Ux4yXa1mlMNdghIxeAkjJhuq10
 hEFZpl2wdyqh9Q4RqdtEFcL3H5j5Cw+SL9Pej0mGSnK486+FD4EFJK2bAa0CVinbBME/O/9LOov
 L5RudMAtsczkucxdUcrgufyHxCOLom1k5l7sc1xUbuLexdf1T1kFhw1fN+4hKJ6gtTUZCwaW9Sd
 ZP+tn54Nsu0Y76g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up mt8390 Genio
platform incorrectly announcing UFP_D (upwards facing) support. This
feature is unfortunately not supported by the SoC.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..02f8b33d64ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0x001c1c47>;
+					svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..3f7d57dfcf93 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
 
 				altmodes {
 					displayport {
-						svid = /bits/ 16 <0xff01>;
-						vdo = <0x00001c46>;
+						svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;
+						vdo = <VDO_DP(DP_CAP_DPAM_V2_0,
+							      DP_CAP_CABLE_TYPE_PASSIVE,
+							      DP_CAP_UHBR_13_5_UNSUPPORTED,
+							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+							      DP_CAP_SIGNALLING_HBR3,
+							      DP_CAP_DFP_D)>;
 					};
 				};
 

-- 
2.53.0

