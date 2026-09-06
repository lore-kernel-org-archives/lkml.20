Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C963ECBF5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704479; cv=none; b=twZuxbL0NIKxBnKynGvTEDz+zcxDnMGSUKC+G3fwqKMsx8wdY2rWCyf3FI2iYOcCLhZNIWtHncMc2OTPD7kvX3yd63CZC7j7SZBUMhu1eRREGai3Lq259r021LtAKmEQe+X5zFCq23InuMfTKFboOGuZTh0aJmniM6GSoer3IYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704479; c=relaxed/simple;
	bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1Jc8q5boZAgCHwJMunlCXsTd8Ni5+9Yu6XBWn6tD2BuFURGl02U0rfo42lT6W+PLbT+VXmSa0T9tTgHh/DvLoQYsRW0oMINXPoegmjeLClqdzziQbHhCFfE+cHXNuKa444/ppZyf/uTAK9hNJMjRg9yOznrpX1mNXkx8ZNzu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dr+v6Tpm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dr+v6Tpm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso3519765e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704466; x=1789309266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=dr+v6TpmvS5Ap0XP7nrhA/Uts/JQ9ANEYpjuAW4VtputfQ2EAsjjH77AZCpXy+7rkP
         HrPD7NfYtNGuRZM7Tdkr/tVIYucKqHmUzU4R5Meh4iyGa2Jm4EJ20BoHlG2a0Es3aVx2
         qRDg36qp+/x/4HTQhUXdlrqdI37exKDhUpO+vmE/zI5QaimQ3ddJ6eiTxwoKgPlqne7Y
         ruH4zKzm/82ICCrPynUU7EFmvf16vZWgPFmtOcvimDZr//IG2ORpOihpniTR4SZ1abDk
         1PvBqOvo2OXAvmwU8qtKOHlc390XKaObOIrU1vdYlBtjeOsOH7FqO9et+thc0AipbZR1
         GeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704466; x=1789309266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=fOvibzdXEyyezKD6PHitGm0vw0HzV3YgLzZXb4gWRRXivs5Qyk7sgn/2drKAPcz/1r
         4WL4XxUMXX4puAM43tqjA4nYPDRjUTKw6l4JrZP5Kgub1DGv6gPG981xxz3AHG97Ex7s
         WCATJqYxLuXmcdEDbNYN9gjNatmEMYDKJSR8ILAvPIpp1wWt5OjyNeb80cvtBmAQKF9f
         gyLc1OCt83GC8g5gOafVIQ34xsbmlU1PvgvM+uAKsS+UZvGdw73Fj0wtZZFdhjTpYzpo
         lFadzrqroxicg4Kkwb5UL+8jHTEP5DdChZXhtSV10uxiwZyuNdL6EQ/T1AMSZaeSXEnt
         pmNw==
X-Forwarded-Encrypted: i=1; AKwUvBzc6m+zmNCplCLy5yVRUftga/NaKp4QksfE4i3LoLjUETZ0rxhBWPjQsXTCQUyUigEVvPlWJOFM+Tpnzps=@vger.kernel.org
X-Gm-Message-State: AFuF++n6/UIj8K+3pM4Vq79kGaltOIO0en2Cc9UwiPk3zRkgvywcqN4R
	CHe308U/VVqLEseeadMLkBnOcp/dOZI/9laERDogy0CocsaNLndmXmJvWBS9jMoV9Ok=
X-Gm-Gg: AYBFou0q/7zeXHYtD+bPrV+xl3b4XAU3ijfn+jYqBHozJyrOCx0whro+TJ4uxSbLpcF
	DGDsTW3NfI9MmflGutR16aJfPLLM3xZs92CX+BfjAJlWgRz5jQsog1G1lTPm9T1l6a3+LmGVerk
	yW3NCbJ9PabFV7K7/O/r/DBKswHddOpM9PQY+DEmaeFi1C9pYPl1Ecdm4uixgudGpRc0nmi0Y5x
	KRv019i9fLwarOy2mMSdpK8S4jPXY1TsCdh0xIxeVDAL8ngj9ViqO0GAR4w68h1NJwOaWfuXgdn
	c2Y4nAW2MPQPBUwyhG9DyfH1QCAWuAE64OD0xCexBQ4mUe0QQzrOAnYFI5xzWlQkDvGTrVRVXDZ
	ZE7B9eVNXZYCrjt51v0ybTBmDGJg4w8l3qacS4IayWamnthPPo4yi/Yr5nVmgdn3zTJii06j7aY
	sRYuHapSiRWH6PdG77MJQzIeudsw0jydDldrNanIDU1kGW2DJOdXl8yFOSldurpTex23Xpmanwe
	jdR1PTn0a4=
X-Received: by 2002:a05:600c:81c5:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49d0443096amr85249965e9.27.1788704466037;
        Sun, 06 Sep 2026 07:21:06 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:55 +0100
Subject: [PATCH v6 10/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-10-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDEpUExSXIyACktOvav5Na9ZCZPC4H5FI7n
 7SuEG8fv2iJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 OsnKEACmDWksA/T7Uay0Ceb1k2fmADD7sGKDZ4+9ARS/b6+aCqZ3+KM9JkHJn1VF1wqAm5GuGiZ
 0er/QornT4bDNkl4Ti7tCpfzO5K+1tiuZIAnCUE1Fu6o9uGfBrPThWy+L/lcMfe+pdPb8FE8bIw
 piglGv1Q/e0VMMyY7Hv4tiytDphHz+djaXRhQz7ObS540tFJIr36bYExcgE/pD9BPmwT153w3xi
 RsBUf+9om93S0Hx0lnRtgH2JWNN277AMIIA7CyrpVfLluaqZ9Wh4WVVYj33qMSUG2nL/BUrV26l
 am407tYFa8SdaldVwr/yGYqnZiEOQrbl5e11f7q0W4c9yLrruxrBDFW92rEQLT1LkJq+aeCFpqR
 Ls/8LxyHsNT1c8eyJWqY1EjDxGa26O3dVujJMF2VniposTgtU539rhH+E4rFbLid2/jRY69i+OZ
 xEam3q0jT//poaMQaFCtXo/9Kha7ea4bAqRmIUp36tt0ZhZoDRmaEXC92RrgAK1JbTXDEsIRTn9
 5Gwkps3wG5g482ufowzpyfPFSmgJ/LQnzJ2m0RyqhnQvH9J9FtJAAkhsQR5siJ9or4SzMM3FkLN
 3KI3Um05SPJFWWGoeclPct5qfWs1dcgF6ZvsE78lGxWf3gSost/ItWsZXLFidHWh1vqYEUlfBzT
 z5/12sDfemAUT2g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0c..0a8275d501f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.55.0

