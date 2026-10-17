Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A923484252;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267192; cv=none; b=obwV4FKTOdxZZqP87zOLCCZcIx1BqzwtfX+F+XdHhQ7nf8aX0PbrZjN5ZodYvHJUft6IRQeY4Ah7C4LEddt6lOAmjcjhO1BEWFvsIz6oYx0+pDVP48bwpaxwktdR0DEeSluWt4NkObfxLkrZb72ueN/pgtWkovQJaOviEF0zQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267192; c=relaxed/simple;
	bh=Sc3cP9kKOv7GW9mgEP+3BYagORk3SW2FzOyBgfC7dUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDSioA9M/vOgKBQibgkHw+SsrFz8SNNeSwO5ttUzvTi1anhT2qGo4dlx7Ud7Mr/9zxpmb+ArASlmgfbF+SESMT6u/XuPmZew/QIvnzLASTc9siIT89RO8hl+PJuPcIqwk6/knkuvoaQoPtT4dS75EE1iE1OKvKChQZwS9p6b4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqkznLIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqkznLIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1F21F000C5;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267190;
	bh=DbUAi5s/epbEJq7KS/lY4NQVfKPrOJvYNdVByS66PKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PqkznLIJCUf3aiCsH3od2cjrFcuYF1sKoNM0n3y+p5Vn59j3DhF1bQJN722hEz1hm
	 scD72/3W3DbXFCr/KB1DQE/f8VVCimE1brZFEToNbxeMXaqounRRaZpYtMnzekNbZ+
	 qiHkhSWn/aerE6aGVNIn1HqZJOAeGq2usBGjDIXwn/hnNstcMI2xDPi9SCTV8wJ0jP
	 UpBudZnnOvnVc4s8TgNZHLD25k/BPhrEcvp0WVfTskQmknCTlkwVMfnIkkpWuvYvvW
	 ZFV+KU/JB0OLHwV6U/vKUxf4wGtlO7BmfiZLS1MFlT0rhT9JKqfa6TSCjX5y9W46tL
	 tEw5CIxQqCD8w==
Received: by venus (Postfix, from userid 1000)
	id E9D19182317; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:32 +0200
Subject: [PATCH v2 3/4] arm64: dts: mediatek: Use DP AltMode defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lUWUiSLI+YaFT7aEtcEk5a+91BYCmCkb6yEWgXVYoFs=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OzU56kAruS6XH0jeUVOAsXX0VLgpNj5JSHK
 TZVTFgyYnyJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTswAKCRDY7tfzyDv6
 mkXlEACmVA3ZqhwfxxThU1282lKcVyJooXjrqqZrIx0zBsXregypnVdsN3QUWXo9WGQBLkWAqBH
 9n9T3BxGtf0ivOuNYjGq3qetzjqqxGxZm+pN1bdkIQShZ7NhQMvNWekSTQc7ZQezfYjeapFir2E
 6NS9jLOYn05IMOZrqX2ZrhcUXaJyarHB5aW9lUyMm0UM1MXMif/G6TUuAE+4PbtSaoU00g1YdsU
 JUDaP4flajSKmAeTjIOIkny2vO/S1JP4kWrtKzx42aCU7mlSMNQyyn195f1M9ov8FiJAoUhu7qP
 b8e2ivINP7lvRdvOgRK6N4unwuWueKZDg2+xHnZBvgIGDylH6ttfi94CrnNdOVUUUYGH5VsqX62
 Dc4KxKXqPXsIx4KxasHkd8JrCxm5DoPBVLsugYDOk740Lta0J1LfjA4xRLqj7cznWfpujDooZFI
 gfGazSbrWiQcyfCjXuHv0jdXOPzGx9yxRIb4esu1kSd55sYsVSbFe7WZUZ3p6V5c5RIZF1/Q8T+
 aca8E5j0hhsS0Vd6B8jiIsFks9MKgkS9Te/6KsirWmAVMUdIosNrJxTe4J4z6gjpioYc0GPAy1H
 bKok3pp7VEjpQuzzjmI+zEzmXkUk5rscgZigP5CS88XaHWZvil/6rcBlRPYHuHvlPn8BcgWUXKo
 AtooJmxK93tXGtA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up mt8390 Genio
platform incorrectly announcing UFP_D (upwards facing) support. This
feature is unfortunately not supported by the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..9f75ae3c32d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0x001c1c47>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..d41638e74291 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
 
 				altmodes {
 					displayport {
-						svid = /bits/ 16 <0xff01>;
-						vdo = <0x00001c46>;
+						svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
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

