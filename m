Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE0749364A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467033; cv=none; b=jilyxHE+NGHKUG+qnkPLQ1wOQIExIdFwTkeHKPJm0O9Y4TgXSu/DXHxOnYBwLnYArXTCIniUG4T9KMEbvgZEtfokoBdFqsvIAFOtOVN+g9SG96/eYTudXf5BwxMmEJo1kjCZKFLlqS02nH+0XXNvuxG0sGBSFHrSNS49Vbo7Jqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467033; c=relaxed/simple;
	bh=r4/qj5nTuW+nCMOgKMizWOrGyBMhe4g4e7dRumSsf1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8ti0rDsELzWzGRKSUFVKItVSrv3YAmmrMbDr4lgGPFQYyYOfswQCsgFgcetwJiaf2rMIq0qflEek4VVCnMpItlQpB/+Gb8ghUM7UIW61NgcGHNvwWEguQ/Yk7Am33ZBwzZ9QCE4TZE1Z4Ld8R76q1VfITMNMI9/YvPCVfMtZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtyDQlca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFcKC4ft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtyDQlca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFcKC4ft"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gv4L275512
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=; b=mtyDQlcavY5//1KV
	uHU7TqkuPzQf4sCNmIrqUuwvT/d7QP/2oa2TXT40nRNY39khiJiPRc+2Jif6e71o
	d9rUNbt5wmota7UlAUpEhad2GZst7lAzEIacEKKIvwHTngBFrxMMLSgeZ56lXgKq
	kOedHYMIBm3IVo8Hx6059anjddNkDmLKJPHTOYjbtFZsa6dl1SJxdQ+WsYIhFt7z
	1yzUsJhYWsRkRqNDI+WhiQMEte4D95f1FhMEmzw5/R8Cbd05HJYX2W7jbqkrbcpH
	cBYfvDF8RnYCSjMGxylaxJ9ZCEem5FS+FBErbOoEi/V4axyK33RzLOTyU49LtwYw
	xRqKxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea17fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so3562088a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467028; x=1790071828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=WFcKC4ftaRVNHjut5wVMf5coyvgbvVUNv+1F5RHbtdrVy1JsBcDFRDWIHaTrKOvsft
         FPn9Bygqlq+cseMEn7wMvH611Qj6XxOkqsOlVOU3wB89F79JFJ64JKp0eJ6j5FVIyaLt
         4a0JKlPm/2rXK90MBW92IzYeSNmPN/vE2KaWHhdthqDA6SI3BqCnXiCkDIDo9AU26WiU
         LTUncghHskQp/ptKv9f4qbMEnEDPC2MPrJUy8KHnwPuKeNsW4P9Tf93lV+999IQ0wqSm
         sWnXgH1qyBnkkh9497LEET9kjPoNLR7BdqKiaNnn9M8khohE9ldyVFOQpsKjyVm4pHDL
         4cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467028; x=1790071828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=fug6wURFyk02z9fgNLzFpavgPoqaJmNE/XrjTWgRj0g3/5squY+VoIBE4tLqZm7L0g
         GnP8BCywAjKOXd0zJ+inOQGJX3NgwrG7fD+/1PGJd1KUZYm/8xiF6aRqM5XIDGppdkSB
         NjsQbLIXnKe3mkoRaRRYbuwxkjz2hdxA/7zJrx7Fsdjw9hBSmnXfvBmQ/P3G2HQOrrK9
         opjkrRYcKTLvNpap1sfnGDBqeAEmjCBDDWjoJcKkHvqBqBf2nmTlS9Fnf3U4yf1UpU7t
         oz99z6Mj+veUjVwF0ydl0ovWdEAUVm6v9QEEvFVKfee7XnF4iCot/XgqUqx5I50mB16C
         hJcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+rRwaj19lEkQXe1N/rKm88w4K0finkH1n6GLdlQqUHhP8GsfSX59lQxmfgsK+ASnvO0CCPyk6ThWXD7E=@vger.kernel.org
X-Gm-Message-State: AFuF++my0zd5OcEDI22TdGQmVdCrVoGa36ZgZ1wUFs99RjKZsEZwlu+u
	dQ+J1MUIfDKzFyi4bY0fwInbMUm2vF4coV3/nTvnVvZ6xZXRDWWc7Qhcgkba+UIVZX6cGx8utBr
	Fep0ldpPSfTY4UdK81pfLkpbB9ml0XzqlDBL9HNKxawc0tE4tGQSNdGIQJripA5X6zBU=
X-Gm-Gg: AYBFou2ZdRwsxngwRjO8xcuFWrFGjS9FsMLGA191R69zK1mn406qhqhnTIxLMi+UOrn
	o6Ge5URKUUAc2GXznWNTB+SACk43/UbtHnrmm76hlddKKu37hytbK8TIW34o5P0uHAlsLh8ZJS1
	hnwgylrVUXsv2Jz8Q4pgHAUQ1iDr4QRnepLWEcb9o1TtJlpRZQS7DN8XzwpzmzcnwLa9T0GNNU0
	OT1LC7sg0O/5rTuWypuCYevRRSq4ZuDhyNwb4f6j6ADX60xc05SPKMANNeBI855P2imSaxuv80v
	NUjz3aIkIBPmiQ2asBqdtUQhieYL5EUnKWfZms7alordqWMDiQIpagAOU55k4Z8PYSvSo9prMku
	8ZJHW9OVylT06OSxibyqN2SfQJQ3KafyPqWMVO0LyhvD0bYiBq76KQM2R7XU5vV9rl9Z5dPxzTi
	2P/8i6Q6ZzlgY=
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958663637.23.1789467027610;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958589637.23.1789467027159;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:06 -0700
Subject: [PATCH v16 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-11-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9xMMfD8Q3n6zbNCAh9NbuhlOIQaLm_bM
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa91994 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9xMMfD8Q3n6zbNCAh9NbuhlOIQaLm_bM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX/acUEjX55jl5
 sqMpvfwJsa3HN3MQZ8f4JoBPcVln8Cy9n5ma1mC4E25JToe94fVRVr23YavuQVKvtSosjrl7wnI
 E+6upNfgHEqWx1mwuE2FUJKfbr13e/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX2u4V5GiWWR9I
 pNU7xxEcbLp85tPQx4oO0yQNs9sG7akPhUdDXTQwJJVxLo3+jpHv9BY1FFidWXE0NsXYe+Oa/e8
 t+lVET7kcjjPpcHsFURO2kzfRR64QQssNDPrUfXzFvvXQMdb8PEN+67Y2BGwHXoQtdpH0SUoOz7
 f2GNJa5aGmDVrGC7Zv+bJGgICaJapq68zPbpUSZITfhU8B2vAnmaBUAZwpqUj/BPv4x3xfL2NFV
 dYUKKgEb7dXUUsrK4U+z6327xZGD4T16igRDPv8otRFvNUPe1Th6yGFeVUJ25qFO3p/SLuFiyUS
 5eRLErOTY9wLeEFow3SY9+BnqE37xQE/2t94H6J4zZf8tvKrzv6K6ybpNYC5RFA+1dm6jAbvrbl
 83Mpij/rJALJVm2/A6NnKRb+9YeISuf3p9+c/e/2mOZzLKr/ZzQxZr/aon8hkScALZY62u2u2yO
 9ycWZvNUFFJ35Mquwgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 02f8dab30b91..44fb673185cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4335,6 +4335,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam_mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam_mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam_mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam_mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam_mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

