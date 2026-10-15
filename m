Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7293DC4C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031897; cv=none; b=tFKWLg56PHo0Wk1WuNhtP3dQ+BdHs6KBgdNs3PkiyMIhX2jJt/GILZJhbeiPBebNfCPqxXWAvaIL4YJMdOzVY3fwIigfz5oCbN4AiUlO10WHgFGm6kraMi3dBseUpqiDpBsuj3LfkLYuG2M5NhYF/riuUk7yRtlVNqALeZ0YHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031897; c=relaxed/simple;
	bh=shCqiRQAVjPy1kS5e7yQ/kWZSjJOBM92yiVWCok8ZLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNi06c2Qu6Q/EyVI02ezl0N7JUc/GQGHjxTaUdeevYteL/MNPJoTczSec+pf9yaVu1sriTDBZQtUxlEPMZVTkJcBiE+ZfNmDIBl44giUlzcosWRJg0KibqHEXeDQawJdUFYnqnrMlGpM16LlzW5szJImoBb8g7wlS5vRP8bZlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2ohnRGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuwNdLG/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2ohnRGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuwNdLG/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMSUg31013177
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dr3LwSKSy4B
	g2b6vzTAZOmwswSN6zXXV/zDrb8stMiI=; b=n2ohnRGLLcXR2xcSq84pb2aeT9z
	9jqOxiHwXGdF+Gc7FgoJQTQ4V8zRUCexnBvkNjbg8ApMFGknEcks4dMCIlFBO3sM
	oQ7R7+zfosTvdTW7+VU/HdsUIXNfdmISt1OinwDthj2rdpgxgdSzt72Nd5f0iGOD
	PheSi6W+qytGYXLkviR/eE2cXDiU2+HTGNZL1XytzjQTWXC5vm03e/7CANRHYoHn
	mjRPqKV5Go2/ecIsUyahfD5J5rydC10nVf7+2AXiDVYdCuNWswEMuGKcA+ljNKSN
	aQeoKM77iSPcQ+SXP/FqwxxYy9VyckpJWdpAT8wjCVHvQLNWLnhYb1zp1HQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cucfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3592749a017so1580018eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031884; x=1792636684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr3LwSKSy4Bg2b6vzTAZOmwswSN6zXXV/zDrb8stMiI=;
        b=SuwNdLG/NAkX02R1fogJ096srsvx/FL8B8S9KATTbGclnnMnTou5wkTkEIiQIY965g
         y8h+4vkI0zJ01f1S7Y6g6YYoSbO5MnBmpObbRZcuyUm/hW151pMIFlfydDRK3FcqT97A
         dwNsilDFxxK71ea9mbsnKlpzdkiWOnzxFblT7zNoW3ZR0torryF13z6wyNZej0yf3hdE
         P9irpIaePilqvNKyowX6PILkPje/gPUFy4JuXBoq6WM0qY/5os27PVczG3Zpa4oo7VRD
         aus5l410Ej9va+fJ/TLXeO044gbzyIbnE3lJy4jL8JHeYtXIt88LNGgup4Ai1zHUp5VH
         /SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031884; x=1792636684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dr3LwSKSy4Bg2b6vzTAZOmwswSN6zXXV/zDrb8stMiI=;
        b=HwDnfXuhg7ILELr6vKWu0xGp+Qdg797eyZUpyQVyN3kXe54Sjky3VMbL2pMlV4xfG4
         HwCEtywFzzXfAjYiR1Vx3CpYo8aCBEai7tUlhIHfzDj8Xa+D67+z6C2z8ephWPWx1lcs
         34jgSOVEImnnDxR5maXKRECfuMuLwukZsaRuMAQip82Gj1Ydh00NKNh0FoKmVx3XaoKh
         tJ/kAyZDqV9vFCI+wHi8OhWOxtTMbtgftM04DbloM/UE+RFlrCR+GI+gwUBQgfrPqBUy
         G09Lw8HWv/0Nwgyd2LY93z19YWrEla+y0UsVTjr03hwvIqMoPGqPH4pt4PyhLzxHVYGA
         RwoA==
X-Forwarded-Encrypted: i=1; AKwUvBy3P2D/WeBNZqbhF4s9CNsQUyUnb2xwXb3m58WXcmPxT19XSgnSDVp/GSGYOUpoInFMAZoxTElmgxi7cVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHvt+LLy1BFF/YwXZ5KgjEZwdSwP64+ZUAavlPpDfVDjrVnT41
	TLyI3W0rVPbBce0stUwgmRe88Hghi8qim5/pduAF9XYJ9eHQQVCTHft0XVf+wmfSjEeqkVFzsDM
	E8tsjvdBMIM7q4XJrGe3I2KW0Q3WzRCCfyVjMvztOaAvhlg6s3ju7dchXxpGOXs3Ykmc=
X-Gm-Gg: AYBFou3Lkbv5ejWrBUO6fbqMdRzc5Spm9o8kxbwupS5sNeRdIL4hwW6y7qMYLhgJ6Yv
	u6RhdX1XsE4uV0Yrgn8ZZH2I/g5tKLK9LiepTDh/kvOeq551Qlcby7sylsfCuKOz0VxiCvTzxKV
	nYmkU5GQqB+UmQyRTJ5suSYWhsiNxdwxz1HNDkY1F21OnZUKJJiAiVJb4AQk4MdsRJZfFGT+RBC
	63ZaXrqWRhRlxkNa72Ae3DifQEQsR4ITxz7QFxOVFXinWHpMj2yGWyfq6tjbiCaqojL3HDzd+77
	OP4qcladA/2rDzJwt/Ow8L6k95gAbB1mf/17ra8UaZC6CgyyaJGWN1C1M5qdnMX+tfmzjX1AGn6
	ESss5eVTUtZJJMfKX0Z4u2AoCXC+AwcHUq85ZMg5tUc9SJRJU3NkcPT0rw30=
X-Received: by 2002:a05:7022:b048:20b0:158:b944:b15 with SMTP id a92af1059eb24-16a5ec48b20mr25031117c88.22.1792031883814;
        Wed, 14 Oct 2026 19:38:03 -0700 (PDT)
X-Received: by 2002:a05:7022:b048:20b0:158:b944:b15 with SMTP id a92af1059eb24-16a5ec48b20mr25031073c88.22.1792031882976;
        Wed, 14 Oct 2026 19:38:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states into lemans-embedded.dtsi
Date: Thu, 15 Oct 2026 10:37:06 +0800
Message-ID: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXwrdw7jrdOvhV
 HlFJQVp+4wJS8AabbM8x8sd405jEaY/0PLvCWm/10MSEa8E11ygbWEXjPtFb0Jzhlz266yO0gSR
 Uc47oFNEuQqOagEdFBgSdhYmcXPUfkY=
X-Proofpoint-GUID: GXB9GirXWjzx7cueljNghz3rRsbnDGNk
X-Proofpoint-ORIG-GUID: GXB9GirXWjzx7cueljNghz3rRsbnDGNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX7c7oFekHMP9c
 Q4ZmzaD7VQ0g9+ayDr0EJvrE4TflA5y5ZN55Fm5eXZ8+giyxGO+SOMnDQwLISaxFjY3bLWLkQYN
 MRY3rLidwvl14EWq4V2FigHkytatbnlkcxDXcUTpVaB1YNx9OU27NhHHJKZZ1oUIBE9/DQk17Sn
 D3dk0RMjuVZ1UBMeAFlkElYuc70n7Os0v54Ifjq0vZ7J+gMjuc4XPvvl0aNtY1xZU5kduuwQhY+
 qttwZuNUUmgDc3I3vCofj4z1ziFElSi/UkD7XRzLnA5NlxZVinPRTXzsPSMMwlPzTdC6iKgkLDb
 Oj4lW3pjaYr07BS7mDaPFeB9TkE4xkuk92qW6iKuSndSM3KtKptShUo0/+hYlrRn/PrU8Xt7rAb
 4mhCmOS/MFuPEszKL9IA9imu8ohDA1uca5Q1y0vKA4puhG0k9YopIpWnTfcS9FlYbu84lT07Jlq
 4DNPkDtwdS10VQvHALA==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6ad03c8d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LkvfiHz0rSPpMaThBdoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

The lemans.dtsi will become a base devicetree shared by all Lemans
series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
they are used by Embedded variant (IQ9/SA8775P) only.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 808 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 806 -----------------
 2 files changed, 808 insertions(+), 806 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 80d8c75e4895..107db7a74756 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -4,3 +4,811 @@
  */
 
 #include "lemans.dtsi"
+
+&tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio102";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	hs0_mi2s_active: hs0-mi2s-active-state {
+		pins = "gpio114", "gpio115", "gpio116", "gpio117";
+		function = "hs0_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	hs2_mi2s_active: hs2-mi2s-active-state {
+		pins = "gpio122", "gpio123", "gpio124", "gpio125";
+		function = "hs2_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	cci0_0_default: cci0-0-default-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_0_sleep: cci0-0-sleep-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci0_1_default: cci0-1-default-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_1_sleep: cci0-1-sleep-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_0_default: cci1-0-default-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_0_sleep: cci1-0-sleep-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_1_default: cci1-1-default-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_1_sleep: cci1-1-sleep-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_0_default: cci2-0-default-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_0_sleep: cci2-0-sleep-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_1_default: cci2-1-default-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_1_sleep: cci2-1-sleep-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_0_default: cci3-0-default-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_0_sleep: cci3-0-sleep-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_1_default: cci3-1-default-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_1_sleep: cci3-1-sleep-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	qup_i2c0_default: qup-i2c0-state {
+		pins = "gpio20", "gpio21";
+		function = "qup0_se0";
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio24", "gpio25";
+		function = "qup0_se1";
+	};
+
+	qup_i2c2_default: qup-i2c2-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se2";
+	};
+
+	qup_i2c3_default: qup-i2c3-state {
+		pins = "gpio28", "gpio29";
+		function = "qup0_se3";
+	};
+
+	qup_i2c4_default: qup-i2c4-state {
+		pins = "gpio32", "gpio33";
+		function = "qup0_se4";
+	};
+
+	qup_i2c5_default: qup-i2c5-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se5";
+	};
+
+	qup_i2c7_default: qup-i2c7-state {
+		pins = "gpio40", "gpio41";
+		function = "qup1_se0";
+	};
+
+	qup_i2c8_default: qup-i2c8-state {
+		pins = "gpio42", "gpio43";
+		function = "qup1_se1";
+	};
+
+	qup_i2c9_default: qup-i2c9-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se2";
+	};
+
+	qup_i2c10_default: qup-i2c10-state {
+		pins = "gpio44", "gpio45";
+		function = "qup1_se3";
+	};
+
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+	};
+
+	qup_i2c12_default: qup-i2c12-state {
+		pins = "gpio52", "gpio53";
+		function = "qup1_se5";
+	};
+
+	qup_i2c13_default: qup-i2c13-state {
+		pins = "gpio56", "gpio57";
+		function = "qup1_se6";
+	};
+
+	qup_i2c14_default: qup-i2c14-state {
+		pins = "gpio80", "gpio81";
+		function = "qup2_se0";
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio84", "gpio85";
+		function = "qup2_se1";
+	};
+
+	qup_i2c16_default: qup-i2c16-state {
+		pins = "gpio86", "gpio87";
+		function = "qup2_se2";
+	};
+
+	qup_i2c17_default: qup-i2c17-state {
+		pins = "gpio91", "gpio92";
+		function = "qup2_se3";
+	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+	};
+
+	qup_i2c19_default: qup-i2c19-state {
+		pins = "gpio99", "gpio100";
+		function = "qup2_se5";
+	};
+
+	qup_i2c20_default: qup-i2c20-state {
+		pins = "gpio97", "gpio98";
+		function = "qup2_se6";
+	};
+
+	qup_i2c21_default: qup-i2c21-state {
+		pins = "gpio13", "gpio14";
+		function = "qup3_se0";
+	};
+
+	qup_spi0_default: qup-spi0-state {
+		pins = "gpio20", "gpio21", "gpio22", "gpio23";
+		function = "qup0_se0";
+	};
+
+	qup_spi1_default: qup-spi1-state {
+		pins = "gpio24", "gpio25", "gpio26", "gpio27";
+		function = "qup0_se1";
+	};
+
+	qup_spi2_default: qup-spi2-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se2";
+	};
+
+	qup_spi3_default: qup-spi3-state {
+		pins = "gpio28", "gpio29", "gpio30", "gpio31";
+		function = "qup0_se3";
+	};
+
+	qup_spi4_default: qup-spi4-state {
+		pins = "gpio32", "gpio33", "gpio34", "gpio35";
+		function = "qup0_se4";
+	};
+
+	qup_spi5_default: qup-spi5-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se5";
+	};
+
+	qup_spi7_default: qup-spi7-state {
+		pins = "gpio40", "gpio41", "gpio42", "gpio43";
+		function = "qup1_se0";
+	};
+
+	qup_spi8_default: qup-spi8-state {
+		pins = "gpio42", "gpio43", "gpio40", "gpio41";
+		function = "qup1_se1";
+	};
+
+	qup_spi9_default: qup-spi9-state {
+		pins = "gpio46", "gpio47", "gpio44", "gpio45";
+		function = "qup1_se2";
+	};
+
+	qup_spi10_default: qup-spi10-state {
+		pins = "gpio44", "gpio45", "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_spi11_default: qup-spi11-state {
+		pins = "gpio48", "gpio49", "gpio50", "gpio51";
+		function = "qup1_se4";
+	};
+
+	qup_spi12_default: qup-spi12-state {
+		pins = "gpio52", "gpio53", "gpio54", "gpio55";
+		function = "qup1_se5";
+	};
+
+	qup_spi14_default: qup-spi14-state {
+		pins = "gpio80", "gpio81", "gpio82", "gpio83";
+		function = "qup2_se0";
+	};
+
+	qup_spi15_default: qup-spi15-state {
+		pins = "gpio84", "gpio85", "gpio99", "gpio100";
+		function = "qup2_se1";
+	};
+
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+	};
+
+	qup_spi17_default: qup-spi17-state {
+		pins = "gpio91", "gpio92", "gpio93", "gpio94";
+		function = "qup2_se3";
+	};
+
+	qup_spi18_default: qup-spi18-state {
+		pins = "gpio95", "gpio96", "gpio97", "gpio98";
+		function = "qup2_se4";
+	};
+
+	qup_spi19_default: qup-spi19-state {
+		pins = "gpio99", "gpio100", "gpio84", "gpio85";
+		function = "qup2_se5";
+	};
+
+	qup_spi20_default: qup-spi20-state {
+		pins = "gpio97", "gpio98", "gpio95", "gpio96";
+		function = "qup2_se6";
+	};
+
+	qup_spi21_default: qup-spi21-state {
+		pins = "gpio13", "gpio14", "gpio15", "gpio16";
+		function = "qup3_se0";
+	};
+
+	qup_uart0_default: qup-uart0-state {
+		qup_uart0_cts: qup-uart0-cts-pins {
+			pins = "gpio20";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rts: qup-uart0-rts-pins {
+			pins = "gpio21";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_tx: qup-uart0-tx-pins {
+			pins = "gpio22";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rx: qup-uart0-rx-pins {
+			pins = "gpio23";
+			function = "qup0_se0";
+		};
+	};
+
+	qup_uart1_default: qup-uart1-state {
+		qup_uart1_cts: qup-uart1-cts-pins {
+			pins = "gpio24";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rts: qup-uart1-rts-pins {
+			pins = "gpio25";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_tx: qup-uart1-tx-pins {
+			pins = "gpio26";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rx: qup-uart1-rx-pins {
+			pins = "gpio27";
+			function = "qup0_se1";
+		};
+	};
+
+	qup_uart2_default: qup-uart2-state {
+		qup_uart2_cts: qup-uart2-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rts: qup-uart2-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_tx: qup-uart2-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rx: qup-uart2-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se2";
+		};
+	};
+
+	qup_uart3_default: qup-uart3-state {
+		qup_uart3_cts: qup-uart3-cts-pins {
+			pins = "gpio28";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rts: qup-uart3-rts-pins {
+			pins = "gpio29";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_tx: qup-uart3-tx-pins {
+			pins = "gpio30";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rx: qup-uart3-rx-pins {
+			pins = "gpio31";
+			function = "qup0_se3";
+		};
+	};
+
+	qup_uart4_default: qup-uart4-state {
+		qup_uart4_cts: qup-uart4-cts-pins {
+			pins = "gpio32";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rts: qup-uart4-rts-pins {
+			pins = "gpio33";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_tx: qup-uart4-tx-pins {
+			pins = "gpio34";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rx: qup-uart4-rx-pins {
+			pins = "gpio35";
+			function = "qup0_se4";
+		};
+	};
+
+	qup_uart5_default: qup-uart5-state {
+		qup_uart5_cts: qup-uart5-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rts: qup-uart5-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_tx: qup-uart5-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rx: qup-uart5-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se5";
+		};
+	};
+
+	qup_uart7_default: qup-uart7-state {
+		qup_uart7_cts: qup-uart7-cts-pins {
+			pins = "gpio40";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rts: qup-uart7-rts-pins {
+			pins = "gpio41";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_tx: qup-uart7-tx-pins {
+			pins = "gpio42";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rx: qup-uart7-rx-pins {
+			pins = "gpio43";
+			function = "qup1_se0";
+		};
+	};
+
+	qup_uart8_default: qup-uart8-state {
+		qup_uart8_cts: qup-uart8-cts-pins {
+			pins = "gpio42";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rts: qup-uart8-rts-pins {
+			pins = "gpio43";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_tx: qup-uart8-tx-pins {
+			pins = "gpio40";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rx: qup-uart8-rx-pins {
+			pins = "gpio41";
+			function = "qup1_se1";
+		};
+	};
+
+	qup_uart9_default: qup-uart9-state {
+		qup_uart9_cts: qup-uart9-cts-pins {
+			pins = "gpio46";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rts: qup-uart9-rts-pins {
+			pins = "gpio47";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_tx: qup-uart9-tx-pins {
+			pins = "gpio44";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rx: qup-uart9-rx-pins {
+			pins = "gpio45";
+			function = "qup1_se2";
+		};
+	};
+
+	qup_uart10_default: qup-uart10-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_uart11_default: qup-uart11-state {
+		qup_uart11_cts: qup-uart11-cts-pins {
+			pins = "gpio48";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rts: qup-uart11-rts-pins {
+			pins = "gpio49";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_tx: qup-uart11-tx-pins {
+			pins = "gpio50";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rx: qup-uart11-rx-pins {
+			pins = "gpio51";
+			function = "qup1_se4";
+		};
+	};
+
+	qup_uart12_default: qup-uart12-state {
+		qup_uart12_cts: qup-uart12-cts-pins {
+			pins = "gpio52";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rts: qup-uart12-rts-pins {
+			pins = "gpio53";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_tx: qup-uart12-tx-pins {
+			pins = "gpio54";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rx: qup-uart12-rx-pins {
+			pins = "gpio55";
+			function = "qup1_se5";
+		};
+	};
+
+	qup_uart14_default: qup-uart14-state {
+		qup_uart14_cts: qup-uart14-cts-pins {
+			pins = "gpio80";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rts: qup-uart14-rts-pins {
+			pins = "gpio81";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_tx: qup-uart14-tx-pins {
+			pins = "gpio82";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rx: qup-uart14-rx-pins {
+			pins = "gpio83";
+			function = "qup2_se0";
+		};
+	};
+
+	qup_uart15_default: qup-uart15-state {
+		qup_uart15_cts: qup-uart15-cts-pins {
+			pins = "gpio84";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rts: qup-uart15-rts-pins {
+			pins = "gpio85";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_tx: qup-uart15-tx-pins {
+			pins = "gpio99";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rx: qup-uart15-rx-pins {
+			pins = "gpio100";
+			function = "qup2_se1";
+		};
+	};
+
+	qup_uart16_default: qup-uart16-state {
+		qup_uart16_cts: qup-uart16-cts-pins {
+			pins = "gpio86";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rts: qup-uart16-rts-pins {
+			pins = "gpio87";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_tx: qup-uart16-tx-pins {
+			pins = "gpio88";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rx: qup-uart16-rx-pins {
+			pins = "gpio89";
+			function = "qup2_se2";
+		};
+	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+		};
+	};
+
+	qup_uart18_default: qup-uart18-state {
+		qup_uart18_cts: qup-uart18-cts-pins {
+			pins = "gpio95";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rts: qup-uart18-rts-pins {
+			pins = "gpio96";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_tx: qup-uart18-tx-pins {
+			pins = "gpio97";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rx: qup-uart18-rx-pins {
+			pins = "gpio98";
+			function = "qup2_se4";
+		};
+	};
+
+	qup_uart19_default: qup-uart19-state {
+		qup_uart19_cts: qup-uart19-cts-pins {
+			pins = "gpio99";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rts: qup-uart19-rts-pins {
+			pins = "gpio100";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_tx: qup-uart19-tx-pins {
+			pins = "gpio84";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rx: qup-uart19-rx-pins {
+			pins = "gpio85";
+			function = "qup2_se5";
+		};
+	};
+
+	qup_uart20_default: qup-uart20-state {
+		qup_uart20_cts: qup-uart20-cts-pins {
+			pins = "gpio97";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rts: qup-uart20-rts-pins {
+			pins = "gpio98";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_tx: qup-uart20-tx-pins {
+			pins = "gpio95";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rx: qup-uart20-rx-pins {
+			pins = "gpio96";
+			function = "qup2_se6";
+		};
+	};
+
+	qup_uart21_default: qup-uart21-state {
+		qup_uart21_cts: qup-uart21-cts-pins {
+			pins = "gpio13";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rts: qup-uart21-rts-pins {
+			pins = "gpio14";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_tx: qup-uart21-tx-pins {
+			pins = "gpio15";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rx: qup-uart21-rx-pins {
+			pins = "gpio16";
+			function = "qup3_se0";
+		};
+	};
+
+	sdc_default: sdc-default-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	sdc_sleep: sdc-sleep-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..7547042d8e85 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6004,812 +6004,6 @@ tlmm: pinctrl@f000000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
-
-			dp0_hot_plug_det: dp0-hot-plug-det-state {
-				pins = "gpio101";
-				function = "edp0_hot";
-				bias-disable;
-			};
-
-			dp1_hot_plug_det: dp1-hot-plug-det-state {
-				pins = "gpio102";
-				function = "edp1_hot";
-				bias-disable;
-			};
-
-			hs0_mi2s_active: hs0-mi2s-active-state {
-				pins = "gpio114", "gpio115", "gpio116", "gpio117";
-				function = "hs0_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			hs2_mi2s_active: hs2-mi2s-active-state {
-				pins = "gpio122", "gpio123", "gpio124", "gpio125";
-				function = "hs2_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			cci0_0_default: cci0-0-default-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_0_sleep: cci0-0-sleep-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci0_1_default: cci0-1-default-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_1_sleep: cci0-1-sleep-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_0_default: cci1-0-default-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_0_sleep: cci1-0-sleep-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_1_default: cci1-1-default-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_1_sleep: cci1-1-sleep-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_0_default: cci2-0-default-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_0_sleep: cci2-0-sleep-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_1_default: cci2-1-default-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_1_sleep: cci2-1-sleep-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_0_default: cci3-0-default-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_0_sleep: cci3-0-sleep-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_1_default: cci3-1-default-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_1_sleep: cci3-1-sleep-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			qup_i2c0_default: qup-i2c0-state {
-				pins = "gpio20", "gpio21";
-				function = "qup0_se0";
-			};
-
-			qup_i2c1_default: qup-i2c1-state {
-				pins = "gpio24", "gpio25";
-				function = "qup0_se1";
-			};
-
-			qup_i2c2_default: qup-i2c2-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se2";
-			};
-
-			qup_i2c3_default: qup-i2c3-state {
-				pins = "gpio28", "gpio29";
-				function = "qup0_se3";
-			};
-
-			qup_i2c4_default: qup-i2c4-state {
-				pins = "gpio32", "gpio33";
-				function = "qup0_se4";
-			};
-
-			qup_i2c5_default: qup-i2c5-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se5";
-			};
-
-			qup_i2c7_default: qup-i2c7-state {
-				pins = "gpio40", "gpio41";
-				function = "qup1_se0";
-			};
-
-			qup_i2c8_default: qup-i2c8-state {
-				pins = "gpio42", "gpio43";
-				function = "qup1_se1";
-			};
-
-			qup_i2c9_default: qup-i2c9-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se2";
-			};
-
-			qup_i2c10_default: qup-i2c10-state {
-				pins = "gpio44", "gpio45";
-				function = "qup1_se3";
-			};
-
-			qup_i2c11_default: qup-i2c11-state {
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-			};
-
-			qup_i2c12_default: qup-i2c12-state {
-				pins = "gpio52", "gpio53";
-				function = "qup1_se5";
-			};
-
-			qup_i2c13_default: qup-i2c13-state {
-				pins = "gpio56", "gpio57";
-				function = "qup1_se6";
-			};
-
-			qup_i2c14_default: qup-i2c14-state {
-				pins = "gpio80", "gpio81";
-				function = "qup2_se0";
-			};
-
-			qup_i2c15_default: qup-i2c15-state {
-				pins = "gpio84", "gpio85";
-				function = "qup2_se1";
-			};
-
-			qup_i2c16_default: qup-i2c16-state {
-				pins = "gpio86", "gpio87";
-				function = "qup2_se2";
-			};
-
-			qup_i2c17_default: qup-i2c17-state {
-				pins = "gpio91", "gpio92";
-				function = "qup2_se3";
-			};
-
-			qup_i2c18_default: qup-i2c18-state {
-				pins = "gpio95", "gpio96";
-				function = "qup2_se4";
-			};
-
-			qup_i2c19_default: qup-i2c19-state {
-				pins = "gpio99", "gpio100";
-				function = "qup2_se5";
-			};
-
-			qup_i2c20_default: qup-i2c20-state {
-				pins = "gpio97", "gpio98";
-				function = "qup2_se6";
-			};
-
-			qup_i2c21_default: qup-i2c21-state {
-				pins = "gpio13", "gpio14";
-				function = "qup3_se0";
-			};
-
-			qup_spi0_default: qup-spi0-state {
-				pins = "gpio20", "gpio21", "gpio22", "gpio23";
-				function = "qup0_se0";
-			};
-
-			qup_spi1_default: qup-spi1-state {
-				pins = "gpio24", "gpio25", "gpio26", "gpio27";
-				function = "qup0_se1";
-			};
-
-			qup_spi2_default: qup-spi2-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se2";
-			};
-
-			qup_spi3_default: qup-spi3-state {
-				pins = "gpio28", "gpio29", "gpio30", "gpio31";
-				function = "qup0_se3";
-			};
-
-			qup_spi4_default: qup-spi4-state {
-				pins = "gpio32", "gpio33", "gpio34", "gpio35";
-				function = "qup0_se4";
-			};
-
-			qup_spi5_default: qup-spi5-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se5";
-			};
-
-			qup_spi7_default: qup-spi7-state {
-				pins = "gpio40", "gpio41", "gpio42", "gpio43";
-				function = "qup1_se0";
-			};
-
-			qup_spi8_default: qup-spi8-state {
-				pins = "gpio42", "gpio43", "gpio40", "gpio41";
-				function = "qup1_se1";
-			};
-
-			qup_spi9_default: qup-spi9-state {
-				pins = "gpio46", "gpio47", "gpio44", "gpio45";
-				function = "qup1_se2";
-			};
-
-			qup_spi10_default: qup-spi10-state {
-				pins = "gpio44", "gpio45", "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_spi11_default: qup-spi11-state {
-				pins = "gpio48", "gpio49", "gpio50", "gpio51";
-				function = "qup1_se4";
-			};
-
-			qup_spi12_default: qup-spi12-state {
-				pins = "gpio52", "gpio53", "gpio54", "gpio55";
-				function = "qup1_se5";
-			};
-
-			qup_spi14_default: qup-spi14-state {
-				pins = "gpio80", "gpio81", "gpio82", "gpio83";
-				function = "qup2_se0";
-			};
-
-			qup_spi15_default: qup-spi15-state {
-				pins = "gpio84", "gpio85", "gpio99", "gpio100";
-				function = "qup2_se1";
-			};
-
-			qup_spi16_default: qup-spi16-state {
-				pins = "gpio86", "gpio87", "gpio88", "gpio89";
-				function = "qup2_se2";
-			};
-
-			qup_spi17_default: qup-spi17-state {
-				pins = "gpio91", "gpio92", "gpio93", "gpio94";
-				function = "qup2_se3";
-			};
-
-			qup_spi18_default: qup-spi18-state {
-				pins = "gpio95", "gpio96", "gpio97", "gpio98";
-				function = "qup2_se4";
-			};
-
-			qup_spi19_default: qup-spi19-state {
-				pins = "gpio99", "gpio100", "gpio84", "gpio85";
-				function = "qup2_se5";
-			};
-
-			qup_spi20_default: qup-spi20-state {
-				pins = "gpio97", "gpio98", "gpio95", "gpio96";
-				function = "qup2_se6";
-			};
-
-			qup_spi21_default: qup-spi21-state {
-				pins = "gpio13", "gpio14", "gpio15", "gpio16";
-				function = "qup3_se0";
-			};
-
-			qup_uart0_default: qup-uart0-state {
-				qup_uart0_cts: qup-uart0-cts-pins {
-					pins = "gpio20";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rts: qup-uart0-rts-pins {
-					pins = "gpio21";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_tx: qup-uart0-tx-pins {
-					pins = "gpio22";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rx: qup-uart0-rx-pins {
-					pins = "gpio23";
-					function = "qup0_se0";
-				};
-			};
-
-			qup_uart1_default: qup-uart1-state {
-				qup_uart1_cts: qup-uart1-cts-pins {
-					pins = "gpio24";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rts: qup-uart1-rts-pins {
-					pins = "gpio25";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_tx: qup-uart1-tx-pins {
-					pins = "gpio26";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rx: qup-uart1-rx-pins {
-					pins = "gpio27";
-					function = "qup0_se1";
-				};
-			};
-
-			qup_uart2_default: qup-uart2-state {
-				qup_uart2_cts: qup-uart2-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rts: qup-uart2-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_tx: qup-uart2-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rx: qup-uart2-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se2";
-				};
-			};
-
-			qup_uart3_default: qup-uart3-state {
-				qup_uart3_cts: qup-uart3-cts-pins {
-					pins = "gpio28";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rts: qup-uart3-rts-pins {
-					pins = "gpio29";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_tx: qup-uart3-tx-pins {
-					pins = "gpio30";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rx: qup-uart3-rx-pins {
-					pins = "gpio31";
-					function = "qup0_se3";
-				};
-			};
-
-			qup_uart4_default: qup-uart4-state {
-				qup_uart4_cts: qup-uart4-cts-pins {
-					pins = "gpio32";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rts: qup-uart4-rts-pins {
-					pins = "gpio33";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_tx: qup-uart4-tx-pins {
-					pins = "gpio34";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rx: qup-uart4-rx-pins {
-					pins = "gpio35";
-					function = "qup0_se4";
-				};
-			};
-
-			qup_uart5_default: qup-uart5-state {
-				qup_uart5_cts: qup-uart5-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rts: qup-uart5-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_tx: qup-uart5-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rx: qup-uart5-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se5";
-				};
-			};
-
-			qup_uart7_default: qup-uart7-state {
-				qup_uart7_cts: qup-uart7-cts-pins {
-					pins = "gpio40";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rts: qup-uart7-rts-pins {
-					pins = "gpio41";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_tx: qup-uart7-tx-pins {
-					pins = "gpio42";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rx: qup-uart7-rx-pins {
-					pins = "gpio43";
-					function = "qup1_se0";
-				};
-			};
-
-			qup_uart8_default: qup-uart8-state {
-				qup_uart8_cts: qup-uart8-cts-pins {
-					pins = "gpio42";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rts: qup-uart8-rts-pins {
-					pins = "gpio43";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_tx: qup-uart8-tx-pins {
-					pins = "gpio40";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rx: qup-uart8-rx-pins {
-					pins = "gpio41";
-					function = "qup1_se1";
-				};
-			};
-
-			qup_uart9_default: qup-uart9-state {
-				qup_uart9_cts: qup-uart9-cts-pins {
-					pins = "gpio46";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rts: qup-uart9-rts-pins {
-					pins = "gpio47";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_tx: qup-uart9-tx-pins {
-					pins = "gpio44";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rx: qup-uart9-rx-pins {
-					pins = "gpio45";
-					function = "qup1_se2";
-				};
-			};
-
-			qup_uart10_default: qup-uart10-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_uart11_default: qup-uart11-state {
-				qup_uart11_cts: qup-uart11-cts-pins {
-					pins = "gpio48";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rts: qup-uart11-rts-pins {
-					pins = "gpio49";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_tx: qup-uart11-tx-pins {
-					pins = "gpio50";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rx: qup-uart11-rx-pins {
-					pins = "gpio51";
-					function = "qup1_se4";
-				};
-			};
-
-			qup_uart12_default: qup-uart12-state {
-				qup_uart12_cts: qup-uart12-cts-pins {
-					pins = "gpio52";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rts: qup-uart12-rts-pins {
-					pins = "gpio53";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_tx: qup-uart12-tx-pins {
-					pins = "gpio54";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rx: qup-uart12-rx-pins {
-					pins = "gpio55";
-					function = "qup1_se5";
-				};
-			};
-
-			qup_uart14_default: qup-uart14-state {
-				qup_uart14_cts: qup-uart14-cts-pins {
-					pins = "gpio80";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rts: qup-uart14-rts-pins {
-					pins = "gpio81";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_tx: qup-uart14-tx-pins {
-					pins = "gpio82";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rx: qup-uart14-rx-pins {
-					pins = "gpio83";
-					function = "qup2_se0";
-				};
-			};
-
-			qup_uart15_default: qup-uart15-state {
-				qup_uart15_cts: qup-uart15-cts-pins {
-					pins = "gpio84";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rts: qup-uart15-rts-pins {
-					pins = "gpio85";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_tx: qup-uart15-tx-pins {
-					pins = "gpio99";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rx: qup-uart15-rx-pins {
-					pins = "gpio100";
-					function = "qup2_se1";
-				};
-			};
-
-			qup_uart16_default: qup-uart16-state {
-				qup_uart16_cts: qup-uart16-cts-pins {
-					pins = "gpio86";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rts: qup-uart16-rts-pins {
-					pins = "gpio87";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_tx: qup-uart16-tx-pins {
-					pins = "gpio88";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rx: qup-uart16-rx-pins {
-					pins = "gpio89";
-					function = "qup2_se2";
-				};
-			};
-
-			qup_uart17_default: qup-uart17-state {
-				qup_uart17_cts: qup-uart17-cts-pins {
-					pins = "gpio91";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rts: qup0-uart17-rts-pins {
-					pins = "gpio92";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_tx: qup0-uart17-tx-pins {
-					pins = "gpio93";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rx: qup0-uart17-rx-pins {
-					pins = "gpio94";
-					function = "qup2_se3";
-				};
-			};
-
-			qup_uart18_default: qup-uart18-state {
-				qup_uart18_cts: qup-uart18-cts-pins {
-					pins = "gpio95";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rts: qup-uart18-rts-pins {
-					pins = "gpio96";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_tx: qup-uart18-tx-pins {
-					pins = "gpio97";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rx: qup-uart18-rx-pins {
-					pins = "gpio98";
-					function = "qup2_se4";
-				};
-			};
-
-			qup_uart19_default: qup-uart19-state {
-				qup_uart19_cts: qup-uart19-cts-pins {
-					pins = "gpio99";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rts: qup-uart19-rts-pins {
-					pins = "gpio100";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_tx: qup-uart19-tx-pins {
-					pins = "gpio84";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rx: qup-uart19-rx-pins {
-					pins = "gpio85";
-					function = "qup2_se5";
-				};
-			};
-
-			qup_uart20_default: qup-uart20-state {
-				qup_uart20_cts: qup-uart20-cts-pins {
-					pins = "gpio97";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rts: qup-uart20-rts-pins {
-					pins = "gpio98";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_tx: qup-uart20-tx-pins {
-					pins = "gpio95";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rx: qup-uart20-rx-pins {
-					pins = "gpio96";
-					function = "qup2_se6";
-				};
-			};
-
-			qup_uart21_default: qup-uart21-state {
-				qup_uart21_cts: qup-uart21-cts-pins {
-					pins = "gpio13";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rts: qup-uart21-rts-pins {
-					pins = "gpio14";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_tx: qup-uart21-tx-pins {
-					pins = "gpio15";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rx: qup-uart21-rx-pins {
-					pins = "gpio16";
-					function = "qup3_se0";
-				};
-			};
-
-			sdc_default: sdc-default-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
-
-			sdc_sleep: sdc-sleep-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-			};
 		};
 
 		sram: sram@146d8000 {
-- 
2.43.0

