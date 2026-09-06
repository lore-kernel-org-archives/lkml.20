Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A43D79E9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704484; cv=none; b=dxlQxzZae5BZeaD2GXYFEQZb3wMQ5YZAWYjVaHUSe6qPg9k0Oxoi+2nd0+uEYhtORCOIYntlYyZ9RxyicueMRQJHZZ9jAmYhxLPlxSav8UWOK1dzcwtxtjgEX3pdk7fBYrPW4LMF1AyCvIChIv8eolmPVGsUCoBWpt9vM9EC2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704484; c=relaxed/simple;
	bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSpWCNoMOPndd9RKtqec5XeW2st4tkcQQo4hykMBYn9D7joiL4xj6arlxWtAFi5doquUIruNmcVz4MoMpUA/jqCMDEYZThbPRtEzmGfGyX2FEVRGj65M8Yzia6/wJro2AXugppoD9KI2f2PfKn5ZWViv2Aw/8+WeQYZv2hmD084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3/CLJac; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3/CLJac"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dbe4d247so1495646f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704470; x=1789309270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=x3/CLJacPauYW6dnnY8iQgLhgUA6vSE5LPBbhMnz/SasnCGUl/Q0Pa12nwG+s6IAKn
         1IQA1nciSlfWK/5/E94V415sEQYhQ+NgbFU/d9l+LW9hgNAHie7Ux/VDaWHLrdCYFK2/
         m86bsCKhTK7MLFajkfECWs41Yth87rhyXhwJ23z+QSNa4Z4NV0SmE6e0e8F/V+sIBALz
         ApaK2lVKqivwWrOWF3Agw6Mohcw45L+B1oNrY3oHgiLgOUBEX5AMOYQLW5GRYwSx1KMh
         UzWupipxeAR/vwuwNMZumqBSwZUFYzOjmJJsjNsI2jHPsXnPOeN8Q6RwPJ0Uo0wpndEe
         /u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704470; x=1789309270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=HifjPqVXiQG56du9XTZo0x/t5/y8BMl15PGJi3Kne5W5SMYT3O/zMXIs8l2DNNmX2A
         f9wIgyGJl2JfHn4G7an6nCrLsxFD33anC6bh2n7+LThStvrimRXY5oyEeNp1fKCBS+Nn
         WcKMEY8OTuwzxvWQVCd9HUs2C7g3ccHUayHb/woRfe1kwYYnsMIK7XueWmsF2qEVoA2e
         mf9oJzZewNtORBFLCZAQiXAN9UZ6aSnsPMihH8Sk1RDqfvILhcywiAwkAlbbANdZhz67
         J3GfCkJBGUTGmciTGW3rmzWIJ3oyQrJ3jvAF1sch2JgpUWq6lCLINM0HnCcItqMLXkOz
         MccA==
X-Forwarded-Encrypted: i=1; AKwUvBzUxyi5SL8KqYlH7AzaWkNFFT+WspfcpjqN7aQBROgfs/46g8jR7FhTMOgWXl4ofA5Qffwn9UWqKiYwhLk=@vger.kernel.org
X-Gm-Message-State: AFuF++nBd7hHHgO4LvV0SltuMZyNPFEpRCC2HFKq8B55hY5qVBXlDh+B
	UKWYsq1YAZgwr0z3179EXKh6F6uoklgOIeahRw0SzkrDz7q0fXc5sSOsDPv2ETO606o=
X-Gm-Gg: AYBFou2mQgguTQQ7TQatm4x70Vw3dC4/oM5UQJ7Jcxe7DTxt9IMA0T37PuTkX0xsPmv
	S6tUPmh+kl53ZuoajTII5IsdpkJ+CQLNciE8MP7XWLDj+aGxq7y8JwPRIOHJwgGaS1gqPCEz0xG
	JQmTQpKbGhRCIGzjAsw75OqpHZ+OJqE5tXxysCa68Fj2AWNIbng7fPWKHG3FBNs/aBhRDrxBpIp
	zfvOgSV6MB1dWxl5tvipugZv7lkJyLVH6yLueGkwJ8o1XSs6ojFl3Mwp8ME1DI8Pbgx+eJ2Rnkv
	WwfSKjQawaisq8VIJprHlA0VaDJo/t+ieetlVnIufwLqJT9EoLZw8NwISjDKjBiKRM7R9CC91Ez
	HNxYuZJ0lZ/aB3ElPIK4qr18N0dMXVtEn2wyZVFI7fIJoDU5OHcPf2nGTPR2sG7JibwaLEY3fQ1
	307ocm+W+wEVaMrIt+qVe2mGPEFVNIDGi/vmvI8qe71qWlTv9FRSAqqfteZxfVZ6P4fyWim/4X
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr10210170f8f.16.1788704469823;
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:58 +0100
Subject: [PATCH v6 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-13-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbE/ag/k7Plj+bNQrX/aZahvQSGYmI8kklHl
 NJnogpbC2CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12xAAKCRAicTuzoY3I
 OrhJEAC9Zza/Aa00r5tDYO/v5c+fo21iPnR/SFt1M+b3HqeHiP1Owvg7UH8gis8bzXwnJ22GRk4
 Oxddw0cnEx4OeHSGUEq8HTXIPQSW/hBZLD9qhR4ZrkS3MZMUA6VNoPo1H6COBLAD5G13Mvm+clY
 hvCh0HPtbdL3RpKZQW7br0LM7+864HzCgX5aGtfJZgmhFlEBE64LmBDkMQWqigBlIvepIEsqGZl
 UbD2ldCrF3a8/2W9f1J4XvyNd5YyGkhSMqwEKAv5zzZFOMBm/KIMjYxMrGhztkvr7M1SW6Zk6d6
 7uI9kXbtuTZcK4QIxSfczEdYfdnNfO35d2ISiCiZ+PpmlYL6f4/h7zNVJKNY+8U4WEYbTV6GZPu
 71gEQR5ACxtf3FdhgnqP7UDf7X6Q3DhNQYynTvzxpqcw7+8Nqsk2T0DVfSTXFkmzs3aRvhLzom/
 TzXAvGMfanHYNiEceb3Yp5/USeyKi9807rB1qMe1k8ICxJ6lHhIComylsr0KAI3lDvHXnBhacJz
 4rNWnoI6RXxgU46KgpbPBa7/BMM4zDwoT8/BsFme7WrP5J1jLwNOJ4oegEEzEuU+/BApTmeNalQ
 DHYH1/Ax7sTBg4Rrwmyks+T+JSb0p5QIy5W4Mj8W+GvRivSd4aciWiQLs0ZeMneSTSQy3sZoiDK
 7EJIJ2BLelXjNPQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..ef20a999cb6f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

