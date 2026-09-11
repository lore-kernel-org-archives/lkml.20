Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6AE438024
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109439; cv=none; b=kAf2ldga5NTIsNctIxdDoHYwVIo/ZoysJV4ZMp32J+EGRsJKKlIed8Sp/qnmDQMVtVtiGeNLOqRdZ+n7q5TAz8yTsqWyL3NCCOY5R8siAzEjL8KQTttLju5EBjtEPD7durkCTooZStkiVYSQ6vazS02GosmsTU0Z+kB6qhtl4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109439; c=relaxed/simple;
	bh=0nSubABOl50KaksCNtOqy0MS4fyrCmthWTVYzde5yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5AIYstgSWAtfSZsN9R4YVeVnuW6XRlW17ff9gVwvMlPkVatOFG9z4OxEATFV8ZKbubc2Uis2Xy5ou3SmKcPpjTA6VkFFKksMseM5G1bihGscL8IgYWnGPYQLvxAWsFJ0eTg8v+tayUBBYwwXrXhVoP53aQiLusHj7Fxmuoe/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uew2BQOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzoZ8PTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uew2BQOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzoZ8PTG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kRh32696020
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=; b=Uew2BQOhClnVOOro
	WTT0ov6lttFniYi2MItuUBKEUMWiEVfSEV8/kGKW2d+l0csMsWsUwX9I/y8xgy4Y
	C3leuRKF7lq4uyNCnLL4AZWFLPlSZXaCwSevCCgi5YczZLRYrxSnHRLLh1pzGgWa
	BVjUCxfY5AabQ0plpumR9SFnXtE2Y2jq/CqkR9NcXuO/YoHDaVagPKW1C+BWgVqG
	qe/b+HUufp1K6R869OzcK3ECSDhTTCIuvzMq8IkvQnop1BSFbs7kophymTzek8vF
	d+orySlt7HjD9/Vilw7FLQkOglqT0fnBVC+pXdPFyDOUWKaK7oXa1rersCrrj62R
	0DURiA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfg243-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1016047a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109422; x=1789714222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=;
        b=SzoZ8PTGRfZjFm26rUIhX5IVq/xRcXepfVrbc+U4wWfMFaEcsyMm93vZ+tyqePz3QR
         1r1C3paRGiHLGjse1FtdFXatDZGQl4I1g/75xVTsYAiq+fg4cwX2oXcEgAANYe0Pamb0
         2dbJ1hbr8RbZncVP7U3bfWvrU4652e8cx4CNXPolnqv1g10eIJ6bjQY7kwdNvioCthcg
         MfEHKKyp8trdyAySXe9oGN+C8Xl2YaY/Dm3mRShuYo8bEaO8ou+wDjTlgY/7wX83fOSH
         sZXBW2NMnhPLZ4885NIefGfxzYcdfXwI7HVvoCqJl4ZghaAeeLFb1Q0Ej2MCV/MyIPDy
         eNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109422; x=1789714222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=;
        b=csX0Rupyzi+IhKj8YfyiIFR06mQLF4/W3/oOaQv8bVWnpOJGCsP+ogpmQ/YfEEQetB
         N/F8BE4orSaL+hsyLtHYrFVCcc7gg9/ZEh5ruH19f4/Wjg07XlHzceKHoKCmGe8L5v4x
         c7VI/RkTMoBv1yMjEcZb4kHH+Qe6NuetYB3BJ76Q/Mfx3dZawmBln7VUEvF0P2qgcnG9
         ie8ksSfsqSMmAUxwBzHm6oTaC0y20AkmxQF1f7Aaaah+9E4FVdu4mT/SqB7cRbBEItMU
         5stSkOEaLykm5Jph1PgyASaYSUTdDJPUax0j8Z8tXiu2re3WtRK9W+gCiBDUfXNu89v4
         RHhg==
X-Forwarded-Encrypted: i=1; AKwUvBzlvnmYycEhTboHdsqzjWELTuCqWU1vSnjwELxjlmU6MaypwS+1ff/lQjDQQEeYxHBTk8Qk3EUSlWbh5x8=@vger.kernel.org
X-Gm-Message-State: AFuF++mPKRtz91JA8I4NbDv6xZOtqXgx3midnbIAuKmD/tjkAx1ajTzx
	X8/yu6SAmCcwoDtwqPl5yHP552MlHp6Tt/KZjsdbyhYp2tuoYJL9BAci+TfCuBQnvuhNzghEhpJ
	bQqC/dKPwOJISDZofFoba5YPtK1L3jVrNR2ldKbRrB3HVTczw2NzESIaaWCHh2rLm3Wg=
X-Gm-Gg: AYBFou3vqDNWglW46ecCQ87MFtkhqYXPwi/aHCus6RhCLjAddfkxUYsI+8dNc/tb/or
	O0W0KCj7kTM2siPKRRoWTKkyW0nQbZiZdw0Yg2Hf2qKPOwbVoiei0DY9Z6v98Hhzr00DBVmz+2J
	TFFFQ0FMW3t1t11SDDIoStE/Pj6a0UUVeIg57jZ4UGirFoXNd2/Zp5ihlB7ywi1VC0vW37SQjs3
	wVrpDskunrIAD21fXt3fBGY6cgPOHb6gDnXvGhcaeK9HcF4PMkOTPw47nDhT42E2iM1zBVKtqGR
	Kc1clIQhyvnZ3K/93NAq+p4bY6orUGV5/zIXGUid+UNDE3EdbbglZ4GjBloOIB8FrIAhVZYe7iF
	Tc0F4LNMhMtFHlIUT/aunx4EpzNr2mK57u8I=
X-Received: by 2002:a05:6a21:4cc1:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3daecff18b0mr5259948637.6.1789109421985;
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3daecff18b0mr5259896637.6.1789109421492;
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:04 +0530
Subject: [PATCH 3/8] arm64: dts: qcom: monaco: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-3-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=967;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0nSubABOl50KaksCNtOqy0MS4fyrCmthWTVYzde5yzg=;
 b=N7eDlp/BMLvTPMfBTnblNDCcWwm8rFLqd3xImtPM6MuqRVKEZMMsqnQZaMkr1eYV0JAZ23c8o
 kUJR454ixj4Cs9ZrApfgfNkzdSL1J30Vy0VSW5j8OAxPHdxopD5LTur
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXwbovV148VzUp
 Ybw7AUsC8jPOcs1W4DBQverhfkyA0FV0ooQMfcwHzAfz8L1E2tLINfBu6f95qbQx9GhWCaSt/09
 nmC5svFee27llQi1IVIWNu4xh70n0MiloRXXC1XIfQmcPSQZhNHYgN+x5aLBtftT2sLpPAKau7+
 Po71Nr9iE2rB/rn6u8xzgKbB9MXolptvrAPytdf2YtzCoEGHwgLEjLT10li96zzbB1Nk9XoYNt3
 t6JHHmi/hS+GVJRFedJwlYxtcbLDv9B52ZTw/CuUZXyNisxDF+g/Zt35A/3/v00dGf3wryEehgR
 2BsD3wAPgbHOMNzBIXx7bamO/z81tnHPDNynEs143b688Swgw2NL9lo1odou+pXZmMfU2fNUY0L
 qXgyxZknhKNUzSY3eMKj4qjsJhZQDUGu0nCBmdp1q0jyxwCo8WivfJ/FQ8vCyZY+2mugm8PwmB3
 8fo/gjh6oLj6h8vXu1w==
X-Proofpoint-GUID: sDqtOHD-mUNjQSu6EuXWVIfwp20tcQqg
X-Proofpoint-ORIG-GUID: sDqtOHD-mUNjQSu6EuXWVIfwp20tcQqg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXzRegsyyMcAW9
 Cd4IjwIdLnlo04+uJw9kC9ImbSN4M4iQUTP9Lcl0VAOj3aQPSEpBs3X0CxFqCE2sAZk1I0NH5cn
 L9yydbMyjRzISE8rcWhujsv+giBpn20=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3a4af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d9c3669b5e1b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2402,6 +2402,8 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2593,6 +2595,8 @@ pcieport1: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie1_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

