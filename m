Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAD48F85F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519412; cv=none; b=J3dXtgdmHjb7/K5x/Tc8CDB0SPZvtGG315aiI/XOKjRyfeoD0tRoSCRjz8HYMQWbWFxSqTtvQYVNJNItesJT/hAClJTwtXjKk+KWPQFwzjR5xacW4h3v6UFheL3M4z64XyiE9/lftBT8q7ciinR31KhOkbVm1kYGNrq9N+dvAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519412; c=relaxed/simple;
	bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaXb9DOvdRjvz5JP7ifnIkeTxfhErcl5YCtaYSiV7tPEK7wawkgbnWPdcgvYml4mCxtV7lgxC9Jhoz5WjeGYQHkw55Ku5KQR4MlECW92vLKuLb8ZoqpZqtnVhMSV42mofaocR7GnOVu36uxcdTDbGsh5Xf1HUVLfnobjVtoD8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVmOFWJa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVmOFWJa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485850cbac3so549811f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519408; x=1789124208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=kVmOFWJaYwdE1r5bLykHhQU6JYe7+VQd2e0YqJCz846dHMtA+A3QJDqBPgFlaVx+PZ
         kv0+nii6YeENWHzAMPF1fyK8bu2tJ3hZ0jr1mDiNWeR696qbsl6sqQLct5JIh7afPdYf
         ljpKXjvPd+nK+pyHRIsGUIidPxAkkFXGsRllnAtOlthWwaZywDBQq4XI9gdls/UTdXx6
         hyYI8IgMAhLqsOb4A9yJ6rfx109/dMMZL8UcB6BAdezDGQw4msVAkGE0zLbqWgZ6j6iv
         +25ohqGwXiyRJc+0tHRDMx72v070og9LabO5ohiu6ycGue2qp6QKKNmCyHXqLq2skFHn
         4svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519408; x=1789124208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=Vp6unTE3ZFmkfBCGhIiy23pRGMXdaxTbFa/ycQliXrFpX6St1TNiDv9OX4iTJIBVR7
         2YI9pzYnUC+xoK3AIrlAEsVGaO41u674z2Px0mgPMaKV0zBOUuFXu+7JbpFH0TBh6qTC
         4RGEPr7oLl9s8NGCdIT9i7x5uJUgyDsuGXf9Cf2zY2mmviJwtO7/ajbuYmFZZ5BrQeFR
         eSwIrDrNqLdJWV1bdAdAx3bXAIIYXHmOf2ASJgzxEHFVAeOpavtEnfKeNw4Ij+D5H5A+
         0BCEjDL91eLs/Aca4PGfowDL2aFyqw3KPDqYcAn+PWzon6Xqn/K/XsTwuxaMcEiAk06b
         e5+g==
X-Forwarded-Encrypted: i=1; AKwUvByzhoIU7QGwJ3GWttnKltixkN4HoZ1K7yKDir439OZy9NFSd3OMDScxwA3HvvBu8rzeTMN26APh+SVJYw4=@vger.kernel.org
X-Gm-Message-State: AFuF++mf1bI5hqikhq/6WrZybez8ET0ZBRUVlwdoJrTDGC/UZ+npcQJY
	C68mIM2MATUIfBj8rUfPJC0LbSHZgkKTAimZN616C1XZRA3Y+ieZP3yy4FnfNyZWUwI=
X-Gm-Gg: AYBFou3QE8+c1Oq1X0hXFE6myaEhfxv8NwhNDd+5obrqP226eLCQYWTU/KiGaMKkhHD
	EckWqD2BobAFnhaS+ddFgExkQfky8tbEnYF+QaqU5CadZkhvjTWVD43WxEvrXrsL19T+rGV+tGd
	HFZD8raQ3J6HBj05phmrIdrx9rfigdRvRjdCe+jM2hVgZDriy9m7lPTp/NsEXpuqy+9gnuuLzP1
	veawj8agWweHu5ET+Hv/8pMsBkWpb1VRN/uvk7SC7lVZdzlyspAozd/eGJS/fTSI9CvMYCxYhSD
	ULyB98q/drT2VTWUAO3pn04nWosEaMYP1J4D18e8j9BLwjXClmBfv3WiUMg54Ek2+aTFmy8/wnv
	DR2c5F1lLX5TobTiQpkwz/it/fSNTnVMORqnjT1mRLXVri9tGX5zqZLpDCu5FzwsrMRGIoJaou7
	lReYmSZS8DufvQ136EevFT5nMwAVcZhn9p8g3edtZJWqTd4O5a3GnVqI9jNZY1UDzNqfLJg0GBr
	gaIMTZtRiBU
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr22354165e9.18.1788519407679;
        Fri, 04 Sep 2026 03:56:47 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:35 +0100
Subject: [PATCH v5 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-3-dc81d85b599d@linaro.org>
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
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPlbs7W/4Z68URfcSifuw2efIVURUqLN/vhw
 HCeM+HFIAaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5QAKCRAicTuzoY3I
 OsxmD/4hGqKLp3LorMln4h335RPDzXo/IVveKRIeg87PKW8S9TEUSqh6PWhKC9S/GK5W+jXEYAz
 /10X7GeDnmvwdRrOq3BMGOUTd0XcOHTeVSDe/HBvl4oVhkVRfpp1zBPb84/NB1AVWIdHIclACxj
 iIR0S25rFE9feYuyIJbvHEIYfrGjLCzIw1jbjhlp/eOeLaXASH4xEkwzLBjoR0zW2f5wLZoktoO
 z7IQfx2kMvZchTkgbWteieG3iSeisCXZ2ig6KwC5Gm8lrsGDIe0XmmSHUV5FwIoMPgXKH8o1Ohc
 UEwaeP2DLmLEqkQ2Q4DygRk3ByZBOKh5eGs5KPvFLnFqwpjgFRyLk3lqw2B3JGoig8oLiGN85to
 qdoOwO5U25L3aUKVqUqNCL4qU5DENdPkU+5ZuIVFKBlCQ+Iz2pg6uQ22IlC0PNszdGdE2XkXrXj
 zE4v1PEvGAWE/lRgQnZK3MVs+u0GXzVyEwUHU+H5DfI7xyihm2QkpH2XIbsQORx+kxTrqoZXVcC
 b4ekjfz/d0Ld5JIoe/LWEDUhk5tAaEjikzHwbhK/JCRLVt1gOHmqeJWgQwxFcblkCvYF+wkyL+j
 YKdKUps1MqvfGM6gaol6mHji+3H4opP9O8JqhbEFcrzfvWoIuQhXKy0PFwMSLBf+14+rR6lH9dO
 B/A5BraqDOVZVZw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..9a8d6f020a391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.55.0

