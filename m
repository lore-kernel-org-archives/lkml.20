Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DA41D120
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519419; cv=none; b=pCZ1nSn0zF//ssmBN83mM0v5jXdm+pzjGO+iQZLaN7yjLN8E1DphNXd/SC/+34ghjSqL6SY92bmOUETvGo0B4mL3h/5xUYNvlV6g/jFcdodualF2PZtf4rEmAt6DpVaLzFOQWOj4/loZgxRXQdORGA35Gn7cBcxz18ZaPpKQojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519419; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3LyJGYzqKl503uoLl57k7x/aEehAkcXK2y28yDjyZLc6tzHKnWgHZ/FH/PZDWPTAljLwbc1Jw9lYePHw8gtfq2d92oj77hMbQ1OpUTuA5OqRqoU9n8sNhHhMiLe5JiGLMJdzjz9OuEdeXThby2JUw6lQW7ayGxTsR3Qtwmku0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea89stJv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea89stJv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso7085245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519414; x=1789124214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=Ea89stJvTKxAKh0ZxNJ5anNeqPCNyOqqAPU/m4x21K+c6Rq+GHx71BUvN9+VAnabzm
         du/ltpxXWEfEqgBx7Y9MA+KG/Pj+B6uesRLSz1c9WkrKodj+UnmzeUV/5jVLFMT4yb+1
         AvtDBEQZobiABfV2sRFIWnX9C8Wku3upEUTr/jcR32ifaGl4ue+p9KthnbQbBTxY17ab
         H42sBZ+DfW5rDOtGH70OKLXwoa6zy1RrE0xq5IXHv9WYxaO9xPEmz/dneQ0fZacmKH3G
         ZTRaD1sRRJxnOCKMv1Sb28JNJWO2LoQcjEpiRPeau0to/QiA43Mo3xEHYzHZgu55Lq1b
         g49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519414; x=1789124214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=ramtq+54nMFN9gmZhhoSB/hOkCgvLPOp1Afd8gDJzDSXIRokFv9TRGSqmFnh/Izpiq
         Wnpv6pxzVnV/r9Zc+ihiY0Rtkzrun/dKE733y+s/LNsULVKqb8meyk1NZZxC7ge75Er5
         i4RjdATUL2ELAjjJ2xKz8hC8+Vk7sd82bZmfXZt8E6a0EdIeu81gN3adTlOhpM8zm6eZ
         1H6dCsCgVJr8Bp9bKGHMxczBOZEW7h4I3tyugJbrtS1MPDMEGsanfX5IMQrFqcQnUD/s
         2mP7oY9OIdKXWmMoP60J4u7Wrj0R7Wkb8ltooPEaiJNhhmUvEcnZAY4yQfzr5NXUrjHZ
         6Erg==
X-Forwarded-Encrypted: i=1; AKwUvBzL7zRlIDDdcsuQqJ0vah3nrpKS+qO9riHUVeVijj5gou2wKrc0BcaUa+q35KnAn/GZgGA+7QKDKxnwJTg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYeaZjSDCu+l1wmWFFnKiUITra0Iv5fC/uUrNS6YLkDxmzQrmZ
	hH7aOVR+qZBikclmCQV5aXuQAqVOHSoKuMiXUhzf6/3e09Mph+UK0W4Goln+6kEEXlQ=
X-Gm-Gg: AYBFou27LVg4IojiXAg+TjsNatyJLB7HQ3o5U/6LqiJdIu/w83Kh9UMiKhXrS0afORc
	BUuJxhEyJlrco+DkpWUJj7VwpCF96s4QMJa2Kr4j0Wly+65CcRMdgshkBjuyz1DF37nwifRr2/O
	77nBHMjtzHumbY/LAtzczPBjD83VTFtzu+tQEs5S+KM1mdabxJVpoC7c1IczhmkauYxxSBTpnXQ
	8krEYWxzQmgeeQDkIF5X+zgIF7rraZwKt386V0+5MJunjBa48lNHwnl/iRRoqimrw8eqiswCFmk
	lNpzvw9/ZCE8r7pZtoMnPP5prvsT6UiQ99oXVxrJGavinkTXpjKtrvj49lIaH8DeI3PCHXyj/jv
	L+NenuE93WUZC4dxp83kAvQHgi+wZhJ6rP8X4Yj2KI0nb5/S9ifrEtDvXrn0u/apgY+iLkIKGZi
	Munk+2HgwvbJy/Bb+fpEcKJ3oA3K7T5fmgTp6jpdQls2s7Hr96o12lOIIhnzsixNoc4K1SdWetD
	GBZ4pkOL0s=
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr23313905e9.33.1788519414400;
        Fri, 04 Sep 2026 03:56:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:40 +0100
Subject: [PATCH v5 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-8-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPn3B/7abYAemVyp+lAV6hGp+kx0oMZ7gkBf
 3uTBRJwgH+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Oic8EACXd3wVUdOGzKCeRDI+btSwNbpr7yUNdStyVSzNxu2NmpKIrmWOYeBkFnx/U22cEnZcZVL
 GY64A+sCoIQy2VaOL085Xl53h+4vPsb1fKilIHfAxFU8byCe/fByysCZPasmJPwpUphNQV4RYX+
 Tu4nzHQWgFEGTB5YPGRp8Cl0X99ngErNV9gKODrArIutgx610Zn2H/6jcWT0d8A/Jb33Cs38DSv
 1rvVu1Bh98hq4OFUjTUN5wq67MOiXZurLbUGFWaMi3W8tMa4yHAePfU54K/Pnqs1QZRy7twR6gS
 9AuNDkZWa2y7T3lgbCtNvQSMMwjegnb40sqvryqHcWTxHGppYQ8i6ecUVa0ca7vmAsCzWzG99EK
 32iK8Dlqq5VlGB/TKWUIqc3E7ANuHNBxV09ds4+nDfo9ddy29lWis5klImfjE5mNwxf3fK1ma5x
 w6CLyxGav8hTKmj0lvEmEBu1gsbjzlv/zPPgmwMp7ZA91nu0fgq3QUaWwl+RrdM7+3o8QZPNhrM
 FroBDDNGaeVJ+awpKaBthhZloHj0uRh5X2x8uCYg6uX7r8jri5xeC15Ln0wThYnyyfVGD6QvRCf
 fEZGSFHs6gD5b7O7/epGhLCgS9SZ0FCctDPl5VCi1r0MWCOJDM52TEnlEYJGx7MMgyoWaWy+6Hh
 cnYc1Ic8fq4ylpg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02a..70e50ccf67677 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
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
+
 };
 
 &gpu {

-- 
2.55.0

