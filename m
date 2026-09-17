Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F480525A6A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651247; cv=none; b=bKV47kTSC/9jpfB33+5w8ofJztLzcRHGEjyN9K7kmz7Xj40h0RFcDzIveexQYMZrHSOMRMi51ahlfC4Rl05qb+eRQYbe/N7ehRDnZQb5+YZbHE9wTsQ5OJd2afVU8XO/Wz+JZsfqd2FnxV2ge7nVLKqFEfT8bPbfCsmq7T4rm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651247; c=relaxed/simple;
	bh=EaeknwqSJhuh1ncseWxkANLMYsY0YJYe+HBwoQ1P3A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVA0yGG9+jaL5U27VI1dAMOKSKrFL5bmpKW3ZNKC3/XjiH5iPGrVwLUhFwwzAPMhqK8nkun+k94EaSEZfpRyAD8e3N0rhzjmgoqgIFpKjKPR5zrnLcA2rsDaEAF2zM5ccXnWCSFvRw1Hog8v/h+Ht8y6EEdMzIiq1CW/H33adGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kBjTblRc; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kBjTblRc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so118623266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651243; x=1790256043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZ8zec54lAcmTqd3fR74Xxo9z2Y+95uZvCv8H7D0K3k=;
        b=kBjTblRcjk0q50MCu3M+UxfGTX6Z5Lpa9Pj6lLpzPj8uHHnXAxkYsi3JePXzZ3zaAS
         e2zPeZhfjHlS4MtgEukbjD1EfsapdgjpDmJLpt7ARBBNzvC9o+Nqa6ZjBZr/m3R4io/M
         PoUPqBrzHSWSIIfkS20LS1aFTw5w48rKEhf0NXMOEiZD7XrziS9pUbaDP47RmhCHfBec
         VhoedRRJwBsdhUe1cyn14ye8ViBsTXmjm04UUM+duMlxIDT3wsvRd3WYmNv3BwegE+Wm
         WkMwgOQ+/XL7Zn+HTWWaHzBGkMRK1jg7e0fK+gJuHR3aD2a9tUZzoPn4hc05v5bgNcWs
         j5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651243; x=1790256043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZ8zec54lAcmTqd3fR74Xxo9z2Y+95uZvCv8H7D0K3k=;
        b=CziqtZFOIrmFdKrELDxCiJ8GzMGC4839POwoAJtxG18eKXizmTp9zUON+BR0XlwjZk
         ju3Au9PRB58W9oCE+cNE80Sg4lGr0rMGOhXK5DjcrPm50xOEHRD6scNzl3942lQK7X7E
         cwL4q8bNh4ff8aVsWTz6fQNOVPCmwna6N1/X7fujoCYhEGEqG13NvqPn0ClxmdtmrZ+E
         5mr2JQhvDk7zVAqL7fgmD+NutR5yNmILA4UG9O0kzgZr92pCEe7J4bQd5viCAwPqD4eB
         bdxmmPU9+zmRJmiwbK8Q2gt/WoK6+3zL9S39cvOwcj/qjRC3Y504Q5XuAx119XN4WrWA
         4gZw==
X-Forwarded-Encrypted: i=1; AKwUvBwszDqgzDsbYQstQBtHdIDVZzMwYgzDJC+M7MVzZDww31vqsgOB15+FV3WvuL+2LZHuoGRmb1/mnISlJ+g=@vger.kernel.org
X-Gm-Message-State: AFuF++kGw0GP8RREcRj3LU4kKuG6EHK1ijBWPCadWUMhdSZ0C8YJ1ZKK
	A03VhHN1TeWdJ/h24mXWLLqsX4BtY/IX7S0MoDZdZpoQ/Obdc2D0u9Pr4idImkVYzm0=
X-Gm-Gg: AYBFou1ucBOobQ/NpBflelLpkCIJACFuDyNZWAw0KJqkfKBK/Zl9P8HAc/Vo2PqPTjG
	ga67VAiwWIxCI4ZjI3CMGDf5/r9oZOvM74/+O7ccV+2E5nSYchg9pn0Dh8yjKn9UtkMFkZFfWSP
	Phchfi4gYVPqi05G46/GaefVfWQDW88lUbr5FTfoNfX4Sq4eDIEWmSJ5xtGd17AY2LEhA5Tfr5E
	M7aUZietMGHR6YDDuBo8CNilIZIlljlJtDZqesNvYAIYDcH4yaodqfMA0cQr5dG1SzW+gS00IJr
	L3m9Jfs54kQLM7n26zahqlu6I9+INbTfg1V8OcJ4Bl5+HY9ExT6MIphW9YePHqUO6K39JtFX6W2
	NHKWzAJ8u82osY5Lr9tvNIqfA4CCYLu5nNged52PzOg+rn7IBH68AIzwZ4cIFj1dYDB/fHoBsYX
	Hx+tKYREXDT2K6FLApZw3Cbtj9bCAC5oh8WmhdQ2xQ0XH7+Lvvt/VUd+BGBzC6QclBczwZfihYZ
	vwCRRKM0w==
X-Received: by 2002:a17:907:944b:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c29e5308620mr488832866b.35.1789651242537;
        Thu, 17 Sep 2026 06:20:42 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:30 +0100
Subject: [PATCH v7 05/12] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-5-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=EaeknwqSJhuh1ncseWxkANLMYsY0YJYe+HBwoQ1P3A8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kgyvLmNKx/7a8E0vvMENeQluzSy5ElXO88D
 YVSHcEH1X+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIAAKCRAicTuzoY3I
 Ok6hD/4oSo8jEOwDcFtrvQXpDZuBZe4hnl8wzFzYSayiWr3r06H+ZnTQkVBgNE9AYjam80XbybF
 3u2VRuNYMcK/rIO8JpNKr+z1tjOT8rOkUtzXSYTsAt4eZzgzBqarZxo8ouWNYur5kK3Yof3xPv8
 WWHIQCz3sIaC47t0l92cSD3Fmk16CTXGF8nwbGGM/tSKN5jL7KPSI2xFmmR58B+Z+iHyTkM6v/q
 GDDMjeB1Jk5j1/RCA1Pjgd8LDgtH6vPd/KJNqwXlQhQL2bUmK8l+SM1tmuh4Ka9oKmJjJDxf9VM
 qyZ+4rTvApmVYubnIji/FCPCraQMKb7T22UYVzwI21QAagG2jt/79R9FIgEXoQl3iwtqRnBgt8H
 jeoh2H3fBrBN9ecRtR2l625H2mEZPcKc5XkNTmjpittrcpqgKsKhuT8irTi6oB/am/HoORPzwdN
 YBbNiYx3vFST0eCs+eA9td6ly8hFfQTLJ+BG0i3jtHKmExKhltidVTMYV0OfnfuuPKdC6APQfkk
 73o1uWuz4VkUCstXH8bxSe+JAxUqkW/7DDc/O3KYIYNUDGO2ojEeG056yeRbxn2YoEaywEKNtNc
 FttYa65i7IlbHyjb2lOybrOaZS3zhMTp/n6m9HmJQJNWhpIyzOIC0sTlNdV7Ch5NBoqit8RXEjr
 5dwI5nO0pkvP1hg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985fe..47cfda908c515 100644
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

