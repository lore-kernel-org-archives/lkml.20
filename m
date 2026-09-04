Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AD494831
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519416; cv=none; b=qHcqxT3K2D9n45XUtCAyUI8SDkvuzlRcKhB10SveNfjMZm/ae/tAOLfxAap815jVQq+ZDYRAlkhzDx8w7ES99sG9kATL5o8TG6aus1PrB51PGuy8fUPyfQiq0qNZho5KFb09qT2JrRHKVLE6cZ0mcfb7PJ9Nl4q9VG/0ectOUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519416; c=relaxed/simple;
	bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixUGsJ/1QOyoeXLS3s4iOFGJLtxKXgFeds+YDiRvqwWJiiDRiLnnQj65Cdywh48yBNkBGddbpnHpngo6v/ccZ+RCg+KqZQwcNEjaVGyY+iV2sP15ya/SfV+OFdGxH+RCcBwCfpECGVz6CHYt+r0mQRT21Gzh5pQy59aLV/rVCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOFxE/mu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOFxE/mu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso9547285e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519412; x=1789124212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=OOFxE/muRFuJSwnnezShIQSE+4rlDpG0JULF7McR3VvQdQJXt4K/6CvR3fmeeucyi+
         mL8qAfDiVN4gDxgA420PjIxnNWtM2qFBVCzlks8kcTJXbo0nXz7bxiN632wqq4JjqQ3Z
         IZaXSMZuL4rvQsgwsIo3eu6s0fFzm6CpvSoRlI+d7M0cWfsi228XNmwnQ43VRb8aiIyu
         nr3XERMBQlzc+EAUOOu1l1+UNsHwwQ+0Z6Fe4H0CiVSjbMRXY9xSTJjrAbow3NxIUW/e
         y3W/mga/fhcLr1mgWaZ/v1+h1R7rVHzK0pP78pftk8M02bh9b+wgMbzTsWMh5pwObcBB
         epBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519412; x=1789124212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=lVqBaiOLRcEJ8P0JF2RKH8dJFqIgLFjEfzNef14/yhdXLUdGsxEURxocOP1UdF8BCi
         PEgyo0VXTILIDs0A6KEqRv2KuWtW1DdHPkRxw5YBS00dmU+g7x1M01jcDWY1qMG6A6WB
         zzRaMsijZanvTrMmFcIRKb90hSHPpx9gWccPULZ1HmmphfvmogxR46vNo/qdoHBpB1n3
         B/QZ85NslJU8BVtYnByBimEQv9dfgBJ2SkDYnAm5Q8HVilAuguzBFVacRJLPIBppOF9p
         RqnC4XKtfCBrBrcD+RbOOv1T4HkPJ2gcvoomWu6+q35Y9RswzUT6fAJ5k50/VCLLB6jO
         wpKA==
X-Forwarded-Encrypted: i=1; AKwUvBwYHAyT1gt2onYyvPLjt9gRVtemHjVOquB8JRRl3El4fhwB0l5MBa/7xcZGEWVIVZjYNJVKKM6adItI/DU=@vger.kernel.org
X-Gm-Message-State: AFuF++mj1LjgLmY2FYaMQa00UYAa6Jl1vT+yrQ5rMclTHsL7J0QO2IWX
	BlpYqoSvVbzunWtQ8V5wxDGYhVcA6WLW6W1DXdTCpG5OTa1gk55IJlH9sjZdyiQQRJk=
X-Gm-Gg: AYBFou1+kKuGJLFAxflgHK1j98mDksFY7fT4nnzaG+AtAho2rElTot7kwD/V1yPPF5o
	DonsAc+CjYpbsj/pDahxrUpJ6o3z98OcbqnXO1fgYXtUpRPnuc4t08m+36Cpxk3gZ4aVOfqtqBN
	5XEgmGsZujhs3Wms2x+6JAVRtYW2Pg3Rv1FnySwdCw5X88zhZSZwfgSOdAmfbYRXZNpZrYTag1N
	gkPJcMgmk/mso+tvi4fpbgxeAZdPQv+l8xvtWeiL7wLPwwbAu1JIpRrhOjrjWVWjOWwzplNYVqN
	P8GeQkMyu7TWuyr3Rkyp+pXZWUPcsItF/eBY1XePeQedN5f904NSNmciA0Oi2aeiLg0S41prruR
	egPpS2Pw/IMeBSVu2ikOvgNPbkruCmB3L/IIaVm3OXQq7VDpv2UGnWiwKmfvSkQxpsvimPxaVob
	R0ClmEzlIk0KtdmrsKc2WKaiWxhTKoeeKkGRTd9DIFFHh8roNgQO/mGRR/ea6hmU1ss/LlFwXn
X-Received: by 2002:a05:600c:34c9:b0:49c:f729:d757 with SMTP id 5b1f17b1804b1-49cf824f757mr58561115e9.11.1788519412030;
        Fri, 04 Sep 2026 03:56:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:38 +0100
Subject: [PATCH v5 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-6-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPmKaHmP7GoZQcfd1lGlGlpLs2pvD9zUd5Hg
 7w+SdgV7rSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5gAKCRAicTuzoY3I
 OlGqD/93UA+8mblBo0epY5NpJvGW9BHqPTHq3xr9fpgADlpUwW47XivI+2uqn0oS4PJd5yFNxGV
 Yu4rVU2Qhd6eEuCX1jLAG4biktl3XV8epQ24rNs5kd3S+1+2jNjlR2pBhkD/3DhgYIdrQ/z+4uj
 WgVIN3HMW8bd207OQs/9m5Lo72f2GKxOTTbZI6T3glDsBP1rmrBV39mbXPTCnRSy4Rbmzmbz2jU
 nqQwN8tRT/ioyqBNTWR6yqLTF6GRD0ph/9lnEEPgVw5HAJYBOD4l0x2jK3K5UCyMiuy2hSG8oeQ
 AT5GLgftI6xrpdfjM5tY+todxWfcCJ46Btci8y+CZLbIZB39gWmvfk1U8AzEXIcm7la6jKs3dCI
 t6+l3IWWop7FRzDH8MlXDgtrZgHeqhmTybAyNIVWxihu/2K4hPh/dUg8o4eZ8wPJNL/e/rXTQgA
 cbzCF31OwatXNeqgQvWzCzfE0BMim/yBy1E8JG99i064cGYuzkJzxgl86+HRvVVIEmQnPYZephs
 WFzbBR5LOWzOA50KSEv7jyAOQex1h72mCkxrwjaefB+X6TzeNgWuq6G/c5pb8ZIrLGHOI19LJYD
 vssJ9wi9eUyMpfMU7fPOtd0+crgnfr5bEK2WooUf3CDPMO4/fAUjxdrpdMs0WzY/4PTsikHXeJn
 C7dzwN/9xzuBymw==
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

