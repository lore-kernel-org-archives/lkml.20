Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773043E3D9F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704477; cv=none; b=kfFtpzZJlmv/k32WmztAtmzysogSgFfWfvn0H/MyXQ1Y2sYTepxSPu7pk+2aVcN02bB/QaWTVjQUMCDYGNvgaP92TYK6DYfS7VWPcKs8vlTeRdytmHOhkdiyfV7fUWwP1LXnlrSS9UY30uJH4NbRo6DMOwpSYMr8BiQgcGUjKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704477; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJySqag5Sy882O+S7yAD8gZ6zAfWcyJ0eoxqHy6Sk1B1MXhjieqwy30DpM6wGmir35VOCRaNRVdzTF5rf5OMM594+3Bso6sZL/1gXgHaCm7Yq6OKeOLZ1Gf/yrwDSNgeGLjC2ylQUc627ZwM9C/xzfAVEp/AoWgeesJDhnDPsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLW/9z4a; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLW/9z4a"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1779150f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704464; x=1789309264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=yLW/9z4a80jIrP9Yp/Sc6YizP/Bw7KboVly1g1SnC3Jvn703QCKEfF01+PHWN4+dKi
         CLct8ieS/vDr1f6asje3HqRajPF836zm6gqPWv5PIXKkKI//qZwkhZekTZeWrHhftRXM
         YKp7WGDEBBt6kySlVHnIubIY4bLmv0Y9bTdmC6x/10uXgYbOEz5acFNuku7t0HV81k/D
         YiFusqPMoo5Y54TdKtQ7+7Qm5NmIybOX6hdmgmrh7GXCwBqCCxDaycFx/8ZsiSCwTxX+
         xkyxTSBbIsa3q1paGrrSNEb/RpP6PnxRQLqos56C8mME5XeRTVsJoR7ZaaLYgjb8kXuz
         KhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704464; x=1789309264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=qRY0hVMaWCrEu9vWBNF9BXzTF2qn8ehycGow9HozI8aY+IT0mzCwkjntNY/8ifNaBW
         wi+9SQa1iEKgOgl5eLBdQA9N+8vzsen0Ui9z1DagtzSgZ9OIAPHcAlu6nzz3eZa56Wor
         aqB4uq/FLeFiMFaXQmngstTHB+jEIS3PHQladnaFsTkpuUcOmF+EAI4e7sDeDJcCp8Sb
         FhAiIrkVvF8/8biZjmLV0/51ZqhehjI5zHzDwfX1rnpEjqvUpSDuhV2yGGhGmP0NMgd0
         AE0HkmsX9GAockvy17TCus+DPW6pQIVR3wdiq2UkMmgvf9H55ZU7ubwt9bgNk2j3h+CL
         lbRw==
X-Forwarded-Encrypted: i=1; AKwUvBy+v+IiCT20532tZCFRKevXNqmZhDQ5xi78LuWspZYEEWmSIxHaSTiEsuRSEoocCt2USXuvOqdUofF06U0=@vger.kernel.org
X-Gm-Message-State: AFuF++l///ffAyeBADz+n/GxYwE3iaxk5gnZZh2zZ6erosEwkFY1OkpW
	ExR9PAvS545LfS7O4KMpQ7DPC7ZE8ZIxWs7f6WR22si90ltdNCLCkp2YTfT9MgExbM8=
X-Gm-Gg: AYBFou1U2J+kdN1x5dENc8ZeJtEoggtlKGAliiG1NGLnvIXAod5bSUU0q9fsLInLm9J
	koi0sfWTc1JOQfjHgFdU/bh6eKsiQ+QFXHTcQx5ssbXHYYYGfFe1d0t+1Jpqk2XKoic5lRJpv4F
	t03YPv0HtOuHhpONbYcS/ELZqYN8UOBuXgDHvRJT7ZlEi8ZTJQeYc+CAT7VixdPwrlWw0s/6Pem
	JOvQzGKjReoN5LOCVW3V7E2YiZXp6JTlCPl3bbUCX2lTI0ZqnxcZBqg3zwKCvgC8Ea0Gfgn53Nf
	kY7/OvpIizuEyDjxgKmdUKvcsHipL5gZztU7PtemWpgfjwZV0JCBT3/P075BBXf8ZHuYsjfHS/L
	XjcCMuhyrokFr50xqkcRJbOBTZmd7E6o0ZxJAaRNa7RTlkIVnfWe+cPuuZ9xXNZ8inKcDD74hqU
	rWtXoHgFN0JHjDbGApY6ml/1vjOiyejX4i6TF21n6azjT37HQb+mitH1EwSUmWQ+hOI3kYkVcth
	A==
X-Received: by 2002:a5d:5290:0:b0:485:d61:65b1 with SMTP id ffacd0b85a97d-485872dbbdamr16682244f8f.19.1788704463913;
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:53 +0100
Subject: [PATCH v6 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-8-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbCx2FI7Z5jVz7Tu899Hnjn5+/CP5ulcAvzZ
 P7gBDpXST6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wgAKCRAicTuzoY3I
 OkWsD/0faERWpCvkXQsRGwxRnuPskYd6jFZ65QIGWy1bzzgFH21MSWw4IRhs62YD8z3ABypm0q1
 Hh2PGMEmOMg5zV+G9ptxSDL2trxI0M3scTS4nUafOJ5/4qf7dLGKsaq/OI7mvI/WffJ73FwbfQQ
 GcXcV7kSGNEX7LTbfJqlhYvDBct4VQdgTJ66I/jU3UqkaLR4NL+P+NqdyRqEdjaDD6a17JVQnqL
 KH8sw96NPOL74aIUSALOPYBqvwT2Hl5uRjdGdHlj2l1j3Q0kSw43XxW5H6waBH3D7Dju97/AI6f
 KBnUByXlVMFU9tkWgTceULLRyvuS4uYfgnWtNKFJiuG+qNh8Qv9ZG3N9Be99As2D60vi3s9TBpp
 YK5a52OnL9zmALzbjPjPxfx/ureiauAA2BD9y4thIF96Mt1Q13ckX/dMu/cH5SuJ0RiQNW7soFw
 T5P5AQ41iB+PYYU8aGpUol8Y8G1QZL9POIJ8xZVKB646jD0w/F3qmZE5pxWJUk3F9BmStx87R2u
 eMZFz6zaggGO2YplMYeYiMbGWDcYSoJqkNXyTjSqqOPyQ/98bpUWyvvKiMn9uonG4SIkd6hec4d
 SNgZiazYWjQUdVo+Xu/7EW4jmLKLjwcEnsoer+vgBrZ284znSxfrnKgdYeZfzNavzU/R5S9ZLZC
 ZpXPRrR9FqQY/iA==
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

