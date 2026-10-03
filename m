Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0A3AF667
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018165; cv=none; b=p6uWgd28wwZZPE0nVXUCvfHHEvR+TtUMxdX2LaiGo7G1SbiKm70mHQkrlI2cU4u/B4D19AQIwQo40MQ2OxiHAaFZBGckyrg7wzgN29SoJt7yqPZgoCIqC2A87aeTzvQ+Utr+wk3avA7Nl7bHCig14DVs5uC+TAIVY5PE0XONh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018165; c=relaxed/simple;
	bh=JZFxXZsrjM4DbU545aptMj12odYhiTP97780+XFXm5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmJk6R0n9OTKV6Cq+RWYOATtlSIgmIKs/rpxSbLrE7gnCTe3RAAhcZVdo+1P+nWjaDzKH0btF38gzrhZQiyMMH1Yqby2tCl+dse7Mmr/EzAqIVlkiGbhM+bVm8mpGU8t2iUDJVi9S3R2PnaAcnvAm4RSwlR15PCvXSYT71uktPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkIrtsyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5eVYk/B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkIrtsyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5eVYk/B"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933IRtY3629066
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=; b=kkIrtsyTy8msgfLn
	ZfARXnwuTpTvCn1IQ04aN7RgPmWb5N1zwX+R7cWZq7qYLZ+szj2+rqC6oumAdtsM
	r3EYTL5B7Q5ojKmLrXPo0Hqr+1wEVWjmrkEbfJNt6CtisxeZk7IFOQgdipOEka9W
	OuxH/oHclj8IlsQt+MloAGmvpe/3nEu8bPZA+iY568+DefU84yjn0CTFTEauvr4b
	vmcp8hRe1oDP5rKVhQEgzoHHr4OvLM/YPerk3gquFxHmMPGfqgw9Sz9jU5mPG0/D
	KQjGrXT/EZ4FFv7sdAFedVz2HJtjCXRkvRMWhggE0LoNYP6JgzmuRY1rysrbaEWt
	uVO1oA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa0h7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso170193eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018160; x=1791622960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=j5eVYk/BE+BAujCxkl8EhTne1Y0QLAEeICFlctYA7IU6CR8R7ZAnQLD0UfgYbvjxaE
         delEKqyWlF8r2lvqVvsyKc1Bou/XVA5gCxH/JIsLSiE59eG2DVjruV/Nc0FvpHYnBhii
         +jbTOf9HgCFZ46GUXRkwuUzxQTJ7wzoPfft8hFP0S01hLdyE/WfKpPwfPznPoRwz76Aa
         z5II+LisU4srRk1uiBGzMMbkDmKiv+k40FClIhloyQ74CVZnKj+J8rYEe3BAlaznyJQd
         Y6uiWeUYXv4wjUGT8jhta58jsGWhF+9jnwHl2yOaEB6E3qVfZN3XJMpIeKRUZWXhSBmA
         jk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018160; x=1791622960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=oLtsFwXgvESv/KSIIQ8Y//pwrnHoJU9oqqKs0ODWpYC44rboGfGh86kZE0YCMF1wpi
         6TDRrHbg0s8kFUcD0SoYgMHC02EdTN5q28Xf327lferxvDDrKQyUumWeb0V/3/1SvXyR
         c/1zkF8W4/IrPeDSwuTmxNJCyJdr5RDtQ8KSXAMOleJo/0dPYpAmAeaLQqW9YtkV250a
         E9Dp7BMDkNxVLvZpaLEb+sm0HHCleiazXTjrnMcAbRNJxsKpNrOku8Boe0K4+dGKmYLP
         CyhlYb0l2T2rHpa5y0YXkdiPLFvnRJ/zjrEuuKIO+7srQqt1pcTuU4yoVjERAr7A3d77
         O34g==
X-Forwarded-Encrypted: i=1; AKwUvByQ16HSLa10Z7qqVlmzKC05if0BldyA7wmuVniAgGS9Gv/AMVZrr2c8gmysnEGC3lg1xEKent7mOf+nJbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lyxlGnXgb7TYFBU2R66Y4ff9MqHWrMKH2mrikGZ6vgUmXkg6hn
	zVHp+nncumlIDUtinoicRx+f7SneipmYw4I9JfvHDIncZ8chcSmxTNBiovLIJkLPQuq+6eHKQ25
	gKtF9UwfEsDpDFlKDUTQlpWRHZyb9CBgHdR2GOBpSgvM2urHIzAJh7IUz6IP+T4Iab58=
X-Gm-Gg: AYBFou00DEXnXREZ5zz8xT49Uf2jt2eHHTy8UkkwG/YnkVKRSH3FYlwrWjdg5l1CIBr
	wdjJn9pIoryM7n44J4QaBYl+NabWm+OlQrKa4E6wB57rrDgsEyJtkC9Sf6EEOT1PaMsOLVk2jqY
	0olrNeVf96tnX9WxzpuFV21TKP0mBGvBBRpgojSEkTs0IwmbfmY0FZlzoJvgAmTZHs6zJYqV7vm
	efyZkVBV2FOVhI3d15ly+NDG47Tp3QZgYpANf7cM4v9WD1+9cS5srKHOH9yWue3MxhDh+ayCCVT
	ylEXRIL8JTYs15SQPonq2LdPQSFKsEZeJ+id1xEcJ8FA2cYzBKYY6XgklfUxZFDPxZmq6w82WLM
	XkpVI2vg9G49g/Wq9g0RGRDq8vH5rDU/UZJOxsoPgVrqQDxIbwbVt5r+5vCWtZ0aIiExvEmxRjq
	IH0MWzmEAebg==
X-Received: by 2002:a05:7301:4390:b0:351:1d87:c714 with SMTP id 5a478bee46e88-3511d87cecemr25808eec.23.1791018159806;
        Sat, 03 Oct 2026 02:02:39 -0700 (PDT)
X-Received: by 2002:a05:7301:4390:b0:351:1d87:c714 with SMTP id 5a478bee46e88-3511d87cecemr25772eec.23.1791018159296;
        Sat, 03 Oct 2026 02:02:39 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:39 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:22 -0700
Subject: [PATCH v18 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-11-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX8jOlnO+8v/il
 uCRGwGKn5TE84fDJwsXIFL7KiMU4KpVp1yV9W0kwsRZpfu2lz4nZJINqrC3UFu7P3VfYkvEWAJi
 skTiiZn91pCLkgQaVieAxHwwG/DULMD5vARSe22tyw0/ti07uMhZqcKkpaax7bvekTwNWob6vc/
 Q1UGKTKvJDXysrCXG7Cdh9ABbOXbIX347GjJtoO3pcf4CBYQLThEJ0OZJnFNML5Vfg+m8ni8Z7D
 7nEqHiRrCPweM5WzROqKuD1kyoSH0VeUBd5mxoeW9U+fyhHIv1LGe84ja+Wm5S8aLXk7NfgnFtd
 SzTCM9GdbILRuGVDfO6poCub6Xz7yEZiut+pG0qW/doLA160GsnGiUDJj30EeNf+IypTLMteBED
 h1ixRc++BH94IPoE0ZdXnh+nRXRLx3opL0SLQqfdi2QZ1R85rLNjAjmDIUyHv5FpaotW68sdXW4
 vgCq6IhzFymRDZKb70w==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0c4b0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0SW1RIdGTwvgSCs-nC8AM0RUhvA2LYfz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX/bv/p9Cax9uo
 uv/RXLYYnO7dBPqffHrRMnZt16JkelnMUfoOAtgdAgD5tLgUw0tbHOImh5nDFygtQElDokPtpSc
 V7T0ErxcMTK4O46/OSro1SeO0F3q+cg=
X-Proofpoint-GUID: 0SW1RIdGTwvgSCs-nC8AM0RUhvA2LYfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 710af0597aaa..f915a3d1530a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4570,6 +4570,62 @@ tlmm: pinctrl@f100000 {
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
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
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

