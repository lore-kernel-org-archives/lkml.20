Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2B48425A;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267192; cv=none; b=Ulyn5gBDEA6PSmFbza0n73qxZPUXM7BwW2cXp5u+eXdNqxEgLnFJgOSYiEoEPDZoCGJ0qovZptA9fubSd3fROThXZDxgVt26VQvz6/Koirt4uaq0fsveNhANc4qIOVOSGCpLOG84/OJTVVzZtQ3eGJzP0NNC/8OXs7w87yRlsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267192; c=relaxed/simple;
	bh=mwp4zgB1iRyZrU7JV8hwJjGSEtWrTQwRtuJeoxXyuEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gu+/u2EIzCe3SwWNL4M015/PekJFbJJcK96Z83+/30WeXwyskGqBsfWGeXroKz7A+rcd+XuswDez6IAYWkPibekhN8yI/IHiMeX2LP7DRZ8O2SYxOFxP4JDQCRc6LyQeYhJus6YHesqwTcMk3aE627whh5CikVwd3mIl2PjWbZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IViVtIB6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IViVtIB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65641F000C7;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267191;
	bh=AzsjAJLSMbqP0OWa/Og73hOrqbs4CbC/H/k67zY6YX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IViVtIB6fS6PgOtde+PE6phuQ+al9/A6MBl8k5GKye4NypQpgaYB55Nnb2uyrz7W0
	 vAt7GRQPUWP4bzjKTbxknO8j8lVLYnbz8Al3CQdA+e8/12iTlYFKtLhHAulYd/jlyL
	 +iAayzJpCZmTjfBo37Ahu5wXcc9KLxqeF2V2RYqqt8BzynvZsPwgBi3hy1I4v5BTkd
	 TbmOXINcsMK6o3bBnKQ0TUUab59alrbPQ9YThWFtuvyygfuaPUsypRu7lgkZESfQGa
	 IxT/LgoHJge+9vr2qsBd+Bn8L/rczjM7QNDJxlqF3cTw6Ea3Lr6qJgjgc3cnwfObB5
	 0GcA6nToJhYCQ==
Received: by venus (Postfix, from userid 1000)
	id EC05F18233B; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:33 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Mbe8q1nkDjmosaXf28gnB/0wu9TXydaiw4sb5pG7aJw=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OzEy0QR3DwW4U/lOHcZKbXdOIuoDbknrL+s
 E8OgJPabl2JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTswAKCRDY7tfzyDv6
 mmnhD/46pwI6Dx9obSflwg3FPG6c/7bMYXaYcJBnO/w8Z4jhcMGGCaZ886wY4CIIbhFVYa3V13G
 QNU/Xagrz4Xl5ZFE1nD2D27SJlGUy8vHWjADhT4pXIey3Nap76RnKksPHp1CbfnMC04KOFjwXfI
 5ZXwC1JMtWWUpX+RMHzmzyExW8YeqEKSaWN2e4zXbxJjCISlH6xVcaKYTDvkMo/cCDg7Iut6SkN
 uRvaysNN0Wsli1FE+vvnyUoeNE69tVPAj51OOXKwkqytsJn6KyS9rxWdiI5ADKCTQT6pr8R6am+
 XI5uxyAD4TL3AXdn47xQvvvmmAm+7sqrjd5KDtX1tVgyQtW66pwP93Y0BsMhPb/0bn9QGstW5I5
 tsE0qIA+Z1OuskyAU4tvucBPI872/wt6UuC2VSsv5HxbmILuo0rHO8vyi8yyuqTk7hgh9KmQDJ8
 znjPfOWAUD09YNk2bHf1NPx4tL2taYNcYf3f+tA+9iz8ErDxd/OcIvUqafpJeF6zjYnoME7gAfv
 /KWJZt5EUyUkaC1VgNf7aPLyKIIPNDIW3AB2qKVG+0CoNNhcKt2X4hqRA0lD60auzkB3IzD51zd
 +5CxnGfkUqome1VEzEyZxJyVJUXZrNZVZYWTlcsOWgV5Eim8xURVZ3I+XpGNhkeOVLmmLxLGxTk
 2vA0QyUSck+53HA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a..d21b94e872ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1508,8 +1508,12 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..3d83dd305954 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -581,8 +581,13 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
+
 			};
 		};
 

-- 
2.53.0

