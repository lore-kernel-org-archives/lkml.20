Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB6442125A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704473; cv=none; b=S42lvCS4pBL2M14nVBrBPLthIPkfzQiEeg16WMAaLuTMcW9VL01uY0lOqy4H+rJFYZq+jWmKZdVxf2d9c9hYlbFcIruxDRYs+gZBkVTKpRZgvTn6mBK69VfkWqOky8q7Tqwsk2i/LSw9B9kELhjm/Z9Yp3O/+wH5FQ+pxHBNTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704473; c=relaxed/simple;
	bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxlrtxXhU0m6b4O7UHDSvdW79WQxaJMwO8uC9CnKeDRisXEvkMDFyBmJ1s3IdUum2Ew+O/KL+KV6jBgt6gWJvdL7CJmu+m/QHMyRxf05pkLip1ZBXpN8ldGNNoGUQFbo/Jyb6StdCYKG2XwtLXOT0MJ3O/k7L93F6OriJgKoyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbaF8yHX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbaF8yHX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485843aeab8so2840469f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704461; x=1789309261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=vbaF8yHXka7oWFTdVVBdDaDxUWo2SoF+jklW3wxWYqamaQSLk+3XiVA8l0TiC6gAgS
         59ts5mbsi4lxHoH0c7AwOjJ8TZHexot9fmPu7vjltn4xel0+6PlfUoA06SUETtd7X6pf
         /OwkgNRpC4ieyYbN5ECKq2gJ/yivn0FrSMdm8EebO62opxNw2dpJv4eq8Vm6roTlX2S+
         HWd+9s4iD9kYz/CIYTtZT7ep6pj+6UBGgSNk9vx0K6+1vqeJl5ixVV7JaVSj2HB6FO2c
         yAvrlVGeqHguvk3irxYQw+Zglq2S9U3X+1AORba+4gkfOVjIcEMTAqGO1aWQ93UTUh5n
         tdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704461; x=1789309261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=F13ZU3fSvMcpQhhqxXNPJKZS1nKRjWsYsDrQ2sixcgBdO9JinFGwz0FoyFXofFX835
         QUgpQ7qUSJjA7RwoOSGELpmhDCpMwuORZj8yFEYMHj6NlySRiz7zJlrfzLBmc4ofecoc
         27ohvMTKAHUCViIuji2bYKyYuVoP6ngNGQ30e8bzfhZN/4S+a21X05B8JgczmdobLBeD
         WLcVXTzwvdCj+05aQMPpYM/ezLEoI86GwNLvv4jFzuRjyTAmHgpk8eTroUX7f6BHpA+1
         xAE5hH16Zj7J8cBUcygTodsaAv1YMm1owHIcJm1u419Rdv62bc5epKjw0RbuR9CM78wN
         Eb0A==
X-Forwarded-Encrypted: i=1; AKwUvByVmTEWspNZgnWN6eOjC/9E2GYxDFajFosXMrzibTdm901/fgNnA7WNdIW7AiT0vMNiTanXHXZJApSupZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwTtIlM9o40eGR/2iSHKf62WiMJOmdRcK6WS8GTzw0lL/NtAqW
	6falYwPUSh18C7QkCjuFitVf8yfV5d4pu9xkVYKVj7GV5REvVKG/xwZic6KVfN8+QIA=
X-Gm-Gg: AYBFou3N6AcLSYYq5UIqRHT6heVGm/qVt68CchBTag+CAheukyWR1dSfVJrefqclyVs
	wgLUg9ix8qtEL+5pHPGxmeJNHPU9ltMrcGEhZuGraJgBgajWHjB7YqP1IN6fFPO3szm5iX0y5+z
	s9Jqvfm1ufd/27LtdLX2avJ6LUFWDJj/f6MT3N5cc1y4ZWO8qwxK8WvH3ifP2q26DjOA5WGJAyG
	SIbVgKaVXWbzfW/OO7Bu63dHyUZfu9xLxDBDSwXdAtShvxnFC0ZzBmqbAletHKiOjUtKinMKGUr
	XLXzrMTAUb/z3hYk5lT50wvg8f+UOqRdo2CjwOeDYpXMe6W43Y7o5c05sxAgw50tBdQv9YaNvUV
	8L1J+f1aaGJ/UU6MFRjcczf2fCJiQMnP2CuNfoMyRG/ip9m+JMe3O/Y1UgLlOxh4Pi4a61FDPOO
	vcFExEX+3qSPjlO8xrtydCnPKy8bXTl3+oIzeJmOoPYwn3QchFuSJd3pdda0S6dnD1CLEw0fA8J
	fjpqp7yYoI=
X-Received: by 2002:a05:6000:26d3:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-4858708fab5mr32229953f8f.19.1788704461331;
        Sun, 06 Sep 2026 07:21:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:51 +0100
Subject: [PATCH v6 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbBkMlAOKG37fPyyCnRj02j5OG9Gbr7dOw72
 zSfX0N1ZsqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wQAKCRAicTuzoY3I
 OthLD/9azbIwhFmODqUPGJHbhqK3Oam4e9t2ztT6Q7f5m1ivrSWdk374o9+pcoG2szjZn/RiZw9
 GedDBWBpSHQRXyfsdhEsinL5cmZ4dCqJ8J1gYDeCxpidqXGk5EGLkogRjCGmgjshOFXcK/e8JPN
 TKUzxQmAF9GiWx4nV91PxCPN7GsY+IbI/hbi7Kqwub1cGWCwAId3ldR6O8I+TzdcATnp/YxUpHw
 zH+llSKKdx9EQNPsNFNP0fonqNO3BZ9/0veiOV300TPaPAUouftBVejnAEtJw6jiJSaKveHKibC
 V9+/MeuOF+FL54KIh43wyC8WxCYnrWtCG61hMn7M3AeQ7/OD+A17pqeZK9dZuApQztjRmmxCIMf
 YtYtKeali0lW7oAf6MOAVXvlSMT5icUgtP2LfF29NZwmdoTWDZpdM/Gzqrsw6V2BYTO0itkOI6H
 duC48ix9WB4SvpTsFCGxWQefbAoR2JEczLbgLomJE6UU9wKlOXeQmeOi4mEJd8bH/iLceVqYgnk
 kscKQkDLq2HK6/BeO38gy90iklYEfn7VcG6BE8lY/lXxg+f2Wus/8OuJROFVSmmZsICxjzPrwEH
 GpQdFDolUiRInFlOnQ/6CWqxeF41kMjb0QnlzEzboh/6DHhuN3i55OXXx8MbeIT7gblU92bYynz
 RqvDNUovSjK3y1g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575ee..7b9a40a7b9a95 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.55.0

