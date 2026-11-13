Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548065;
	b=OZh5UuY6alXqapw3Tjj23yYEufmYVj3oaG6ZNEGZNdF/xvlji4gmKZd6DMnYb16Z31XA
	 pJOARVApXNIA/nTxVMFDuAsYVmDxjQsF8J6i4nvrlSYb0a/bOT4iXnKmt8PylFaPIo+39
	 c1MwU21Tj3xrK3857iZGUOoU0oZbmvPxQoRrPdByZ0ndBxo1c0IYvE4c3TtIdxoVhsKSG
	 KSkAcxGuvM9GB/FnjJ5kpmY5rvZRbL87GPZ3UbRE7LQEj9qWZb7GSSlULd7lFXqu4q4cd
	 hQWgCp9D70p039fxkJ11mRKalmyFJrVojsm4EZsqYiQv4VQn2mLW26l/ikwkALansDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
	b=HLw05tUrOo8AcXDNXpT+4TrRAVJs9pkLIkX1OdEf15gnTzL23UKm2xLDQ7A2Q7xaXy+c
	 5wSylZH5s1wEvvYWXqV72DKf+JZt+wnurOHcbGPpa1gr5muVIgTwl6frpyxn5fCTdUSB1
	 e0tZk4KasCGsrSVuAscPnMZ6eFTlb9z8GH4wGDFdx7k8gqXL1QPHqWtsdCjs6w6SXdje/
	 GEJdHZVJ34WoOFYkM38V8NuMINNwXgvgAGPRICG8/9hhcCGkareIAucvqOKGupYH3xoB0
	 P42s+5j/amd/kGWgY+2kSSM90enBtsB/i4Pyko7NiPJvM9Nqy0tLmP7DLxXQ0nvXxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C37606CBEF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C37606CBEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576pv3119860
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=; b=Y0DydbRICd6VfJxi
	wjL5DVVFUYeE4tgWndVMMVkjwvXSdFHl84VMV61V0bsHm3uwhTsCIcwi5Xu2OH+V
	G/xZyjBSLULkBCGGz0anfipn1ETxvO0brGhm+zLLWpm6GxngaGphwX+5fwtBzsPB
	3gZOND19WDlSoaimiAUnV/Ggy9kqsClW0GIBLR9FLVgi0E7PEfoHlQSnPSST129k
	yGdG/qL/PfBD8KIwMRzT4kaGxqFQQrS+V5rKoFb7VmoxO+xbxK9NQY7FC/vHprGS
	CDMpGfKAMXN9hQe1OFFZakaoASQ9PqHz+f8PLnGESOvcGkYMBAFIf1A7+jeNFvyc
	AXFhvg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw9mhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:23 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4adae31e4b1so884420fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548063; x=1795152863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=UcRJ0GTK0uCIuVe3J9kowV4zd6yA6naU0eqO3ExGqYe4IoZ4kJ3eTXCRdZMoW+YDaC
         H5tz2QfiZW6AAx2g7XoqBkxPUVa5H6KAKJfnWapoQs86tIyKRBxwSZkwFkn+PN1PrLPl
         Kyi2d/UJDqDjhWig1ky266qN7temx/1D76nmXA9/9Vv3Vp0a8v6mPCKl64wNYA9xBTpv
         i+xFuPzq0WsRqGJP1G7lxjifEppPbNm9udcifxkJXndOKNhsGRIG7v3GYM1sqOexx988
         40cRIOmAhFbjOL9BQGdaME8J0jlCMZV4coqxmOyKasAAIeoP2e2o08Zcbl+NZ3Tnh0Ah
         m4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548063; x=1795152863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=YKsYq9uaTemmz48zrppAf/a2sUmMgKoO0i+JvVNSWEPPPlPKJuSeS+99XNDEgPKy7v
         NoEIqOgR2pBg6fyEB0u1rh588+Nx0sMjCDlA/pB4Ty8rPvQVuPibNJEQlQP6nZvLScSL
         Tw4njnqbQIKK5+MFnzwP/af/SQMFgHwTpSakz8kNW1/lQIZ5ZegTAmBgJfw6T8gZjQWg
         PksfRgk+bSaIjBawu09bBChj+OKjTD0WwugZfF+FThZ4qDwDa/xlqzTuRwqFHfqAypCU
         L00PCStwZjxEHEg0JrLP6WEw33Nv2303edzTHevyOJCoMzJ9rg63dnIzWoUqnbZKABkS
         r5qg==
X-Forwarded-Encrypted: i=1; AL+hErH2VOi0pokeh81i3luH3HGFR2qdPbvr4eCs7Gtyfla9UzNHIJDDCq/btfVNnP4vzJx/g2Xx32U8YU13OcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QRSwdT7hsqF/BKgq7peK+uI1lXpKSviNuYFfTPLr4P8E1Ztyg
	N3QohXxjxviTPrjQxp/N/Qqvz5AxtPWIvnfow/zoGSGL7kpxJO/XUW7YUbEzWw2OTyIWExIel6U
	T88IbKR7wEOdC9KZKrJc1OpwSH34Q6FM1BqX0CZAqdXKH6ctJXlpCUfNnsqonbPwbx243m6JVJp
	wI0A==
X-Gm-Gg: AYBFou16/Bfx8YOK7Ym/cWZjonA+VtVq7naejKDCblP+W72zA5EqkGJqeOAhRq5XECT
	+5ClkJDo3pCG41x1jrG/yWTFb79SxpNoJFeuXg8uaUVNo1YD6ZbZH3i/3aSw9ueXnkZUutIkn4y
	ZcRbx/2nhDjoIQno+jIhiFWN83Ii2POaGyyfZobJpiZdnKgVsQ8MccQtO3VaQianS7rDeiZmV0g
	Na+ShobElwraeFneVRhxuF/ZuxIAYUGeO0zFmHBNAMx/mbgBPWZQbMtPHEluJ3Ge/KlO72A3RVl
	H0NYlfQwUAWEABWjlSiIfs9WaCMdmuGJ00SrmIeZMEbq6QXRdJo3TJJr2TweV0HW821qHiphXvK
	e7f8pNOR1Do5rskxlvlDVl8YLj52FSINs7vGl1/T233Ks7THS8169aHAuTlglIInWWObT1FOCmT
	nYtSoK5cJBGpoyRez/aFwsAaL1UWfr5NWXrd3PcTwmHJlZkPArHLowfkkS4xSd
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846708fac.11.1794548062859;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846679fac.11.1794548062344;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:46 -0800
Subject: [PATCH v25 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-14-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6a15f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9v0ZhO9ebhdqO5a_NCbo4ZZ4qy3ZHD01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX8lTXw65z84td
 WmA1hPcC9p2DKtmsrG77NNNg/UbwEVgmGU6YX11pBPwBzlAfXUKLsTigxMmHVspSLchTnOaNHl9
 /DDatklPd2ZW5jsmfiiiZde5hX8NOKusg7y31Mt3RSlI0Pc6Bry5+s1Bnswp2qrCSngv2qoJFEg
 HtEZxHFrst0hzd/JA8Vmenah7iz5fDGsiHS2HFWJsZ4IXbaf0jcMZCz0rX8GrU4/Awt42zjY9LT
 ABFbbUyMmCcP+7qveuuP1kReFWVp1K3+jxVJPCiBLg2F2z1HPhjY//gfhLP6qjrUriaHHjZWDWn
 4HmGSAZK1SkfDSg3FLCfjoNbKVgIfqqmNI913N/aTNojCwucaJ9cqxQoEpAarFa53HWORgkVbh+
 NxHZ5nhC2pzRpVjCYEon1kCdhg3uWBwHWoJs8MOOF7VJUAIQicO5s7CjO7JZtnepgGVkqdgW7Ak
 h2jcZLlfjy6XSKW5Qbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXzjhyQWOYJpEw
 66VQJb1QJMixaY4OG2Fw2I2cSwkfkb7e0GDHb/Zbp97MI9KGm/mmL2o4IdOHBYtBXieqCsFoS2b
 bJk6jyGhFoym6kwr57LZVcp8Sz2iTrw=
X-Proofpoint-GUID: 9v0ZhO9ebhdqO5a_NCbo4ZZ4qy3ZHD01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 1662ebdfe729..3c9c97a553a2 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4663,6 +4663,62 @@ tlmm: pinctrl@f100000 {
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

