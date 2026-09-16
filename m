Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198743CEEC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591630; cv=none; b=DvQzx7dgCP7bbJQWMPlGKzzvFQ5GNOrpVqFnC0wYrmLajuD7NYHue7/yKS6nz30HUGBbBqxtBXvLIq2RmJE5WjxrhqQ8uctMIC0sXcoNfejBNDdfh5+Aha9PjrWsQQ0hW4O9sdvjn/BkqYSUiv1NkfqmEu0+Tn94AMr+Rg8KDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591630; c=relaxed/simple;
	bh=NEusXuICV9Epshdd6Pdkkas8eIUI83cgzBxWfSGQQns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjkuVKKb4IwoDS764e+4NwxUo1mnaYsGRI9q+QT98SpPb14mpyEokynAwJtNTIxbz6rWP9ThHGgmO5BAQ5FRrSMsUKTvuD6wvGSCe56TCDyLtS0i9tQ0XWRZE+C4iLEACPuDLRCx66GRRgq7ul7B/Va69xx3nhs+Imuoze5YjP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGkxKHRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmlL2z0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGkxKHRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmlL2z0O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeGk03107167
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=; b=FGkxKHRqdkxCE3fW
	zl2QlsrkmFR1lZZFof2rb0NcGJBVUnjO9epOivpV8+eWyH9zPzERqgnFxD17h8VX
	iYgnYzci4wkQsb+4jposJL06jHvBaex1vK6mhQWjvgHbRJW3k4B8MSteNjUEpwDI
	hf3mHqzaf+MVJHDIaw9JPaUG8QsUyVQ6w5j5dKwx8kggdcDNa4kE8wD1Wav/R29B
	DNokNgcwKCHOaPNaLpgTNYaVlssI9Q+637MCBBEshYyuNB9o+guxbBcGTDFkXkaL
	UQqu/0hxrg4HldK7149K+j5P+fmL8WWn/9Ygffv+60+vJHJjUP2hvtjcO9xCt1zR
	mvfGKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2syq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530ef845909so946081cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591606; x=1790196406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=YmlL2z0OqTKHxQAk1gf65NI3vxNpe5brrbf1xywzMyWy9zOYk+k6IqgbOJShhIOezx
         8/CC9DbkJvRLTcI5hGMYiTjqs36bNL1WMmAkN8gvOF7ew9ZcUE9Sg+hDf7mZ8G9DEUNS
         R7RYleHhHooU/ZP315IqNC+BcknF4HFhpIXohsIY74a1pjcvYdX11EZ7Op6WC0tks4co
         iiNhUbiVtlUN+RFhXihq0pFJBrhzcWcQ0yh4g6LTgoDPw5zJKlaGHeRKFbxq5rm/SU62
         NmATRfici2TZtKUzj15RWt4+hxhO/xLBc/9JQEJ29+L/ixFHu4BDPFPYeRrBljH2JO7h
         +Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591606; x=1790196406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=POkx9Leq0wzMlkgi9qMDPKzB63Sp5qrce5orPAKNXFhP2eqYhdd2VXea2bEYWsSAAR
         k3SynrjizdhTV5pW3CGQuf8VWUN/cnixLaFlq0RRv9crNUrZOL2LG+R52SXe3yJsj/XB
         mD6zm6GYG1JmBPx1EPA529Xw4PXCd8rrajQ+5pcIEQsU5GHFFZUukvBcehBSiz91hzTT
         2tIfLt4V+lSdL/jtwnN37KbdBbJxm6eJb0ZMHvZI5oVLrjHBzFKN1l79x8LmjsS/NJl5
         XboI+3trWOaTNq73jfXuUnWoeluCrseacsQqZUfFSE572w8OEJSQR9c77uTdqLALSmMc
         z5rw==
X-Gm-Message-State: AFuF++mI/mXuB+3Y8uXU+DRO2yNeZEt1ljtH1Zyx7rWpOqxhFHxHLmgN
	DXs6Fu0WNBQUCxXp/5yAmS5baqyjF19fgaitir1TG7GsUP856sUIgandQejhz76HRNKmtzBXPke
	FyLNjXBOOFwRjDObogiEh92Sry2jwYKRmPKI8Svv8L3g4du7f1hjhfCuS8m2xci9+qWE=
X-Gm-Gg: AYBFou37142Oyxa1hubXcEdDYoDw9cmW38VrZMOl9qEeAn/x7Wdavo1sEZcYu3a4Ctr
	PVcEjKM8ugmaCpSbrSNiEMcjMk09dD1jRTb9Tav35+P64PXD+1fHF7H+rUmarrlxKy8JFgJM1A6
	oCNBKsCX+0dielIRyrlBHBkLCpV0nXo5Q2woPU7LotF6tp6bY9wfOmSwXMVX4k7vaMw5sDf8eW4
	KOzeTAK+YD6lEC1t/aiEOviqPF3uEJTWG/1pVimN9DVPwyt0gMPgVheGV4o5lPH3pTK038cDeT1
	SodPAcpsQiZvmIluBoOmHUTeG8NcgmN2ndTwoonaW2rT1B/u6HT/Z/oiMzKz0E5qs5bB70dMy/o
	tvKtPHTajOlzOUa0q4+6afk8=
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027891cf.40.1789591605673;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027291cf.40.1789591605137;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:33 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: Suppress a few intentional redundant
 whitespaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-2-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEusXuICV9Epshdd6Pdkkas8eIUI83cgzBxWfSGQQns=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAsVybke5T91kM1TocXoFt05g3wt+bikxgUG
 w+wM22d1WKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsALAAKCRDBN2bmhouD
 1+lOD/9TFBqkLUx+ePlnMqvDYZKE28RQugErzOJgTzp1O32YJZrIzFPBcM446BJGdLR7zIOsOyJ
 jiMu9DVpm1SsTAlUX7FdNyFRtx3j1yts/ZIrRd3+3ec/9F9o5U3fJW2TVGlHLTPBJNG9abphIm3
 F57hiSEdrx3nJM1vWMgkalBI3CLkTzE69NbxHrfLOHfoJHJZdNR17MqK3C+9KbVg8dnoULT5K/J
 ZLpFa11hAVy+dvLo3yiPhy/ftAafocA+tY//qkMH78zlyeDBTzlIqV69N9kV9FXWnk2ITHaBTVD
 ykces68TVXSqRQbe2jvoS4+DkwgqDfRYdpopg/meFoqA/2G2Yx5+8rk/x84pPbbFF6mQv/HcvS3
 pyDWrFjzMpTuJ2yGeQOu45tfq+EgUXLt+ZNXBy5EKrljKX0Ch7cU7J1YsV+v0mE8r6NoVdf7oT6
 Uo1UPJZ01bDpReL2Ae8brH464IniDAFDiUuu9tc1LIGiPbGEK8ZG3aDEa3M8QzZ07gcJ0APFBO0
 3szZUGdX6V/GIIEDlrP3zxpRacohiXUoiGgJQ2ko9kXLM4M1ttYQUWXWhHHLMMpiykv90kTK7z9
 QVEgjm7XIvJqxW8klT+fVtZQ+ttzcS7lkRT0bVSsdrz2KZkBfFJ8ndTgHwhfTmVJGaf3GDQ3AJu
 gTjh9HR2CZ4rEww==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX3kSMmCAjJGmG
 twrdE/9GM4XYxTQZcoCjHKv/LD4dER4mHKHmidzIQ0QVBs6m3MAt+P0JLsX1+LuGZKzgLaDg6IK
 zmuPkrBOtr7lRy2OooqUN0exvHAWr9A=
X-Proofpoint-GUID: jzsecl_O36rDC3N9bgrUH61Im5TNOlLM
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab0036 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=I0iP3be13vs9ipy7py4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jzsecl_O36rDC3N9bgrUH61Im5TNOlLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfXz8q3mjgC4l6p
 MpQbzjgTJj8vdUgDPKCRai4dCeUttxrV/XVHiKrprN0e15k+VY0S8ruaNcwAUTfdS0wcCc6/Lc1
 BzwBfzgIR4Gydpe+IQ+Kh66VcZ8IEhJc8Q7Eox3ZeA0yBqrH2503r77tbl1kTW9NCl64sLLHK6S
 OtYmYVbfInZaoeEUtHjj7DEtGB37NxFcAleT37sp6pZFLDxAayrdL9E0WFma6AnkmDTqGtWh1go
 GKCgx2jMv5ynf6xa7fg78erwNdc43+RIIAk3clFff9O6NsU9AewYasYvJMpc5RLelf1DIT1hBRe
 3tHEk4tbv0lB/dIlDjicvuLxeLk2SM5v024WIiQXu2X9w2ybzej3UTVLHsBG2KSNmWqCOeumXVr
 JI7B1JfftOkQh2khqfRjZ4ceTZh2qB2m5Um728nRjjkkEpdBhQkkAP7LynyF0eLdFtbpoNK6B4k
 //QhHQyJjv1ctbfgEcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288

Ignore redundant whitespaces in a few places to suppress warnings from
`dt-check-style --mode relaxed` like:

  sc7280-herobrine.dtsi:357: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi           | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 58ea0532c0fb..21179ca1219b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -354,11 +354,13 @@ keyboard_backlight: led-0 {
 pp1256_s8b: &vreg_s8b_1p256 {};
 
 pp1800_l18b_s0: &vreg_l18b_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l18b:    &vreg_l18b_1p8 {};
 
 vreg_l19b_s0: &vreg_l19b_1p8 {};
 
 pp1800_alc5682: &vreg_l2c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l2c:     &vreg_l2c_1p8 {};
 
 vreg_l4c: &vreg_l4c_1p8_3p0 {};
@@ -368,14 +370,17 @@ keyboard_backlight: led-0 {
 pp3000_l7c: &vreg_l7c_3p0 {};
 
 pp1800_prox: &vreg_l8c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l8c:  &vreg_l8c_1p8 {};
 
 pp2950_l9c: &vreg_l9c_2p96 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp1800_lcm:  &vreg_l12c_1p8 {};
 pp1800_mipi: &vreg_l12c_1p8 {};
 pp1800_l12c: &vreg_l12c_1p8 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp3300_lcm:  &vreg_l13c_3p0 {};
 pp3300_mipi: &vreg_l13c_3p0 {};
 pp3300_l13c: &vreg_l13c_3p0 {};
@@ -384,6 +389,7 @@ keyboard_backlight: led-0 {
 
 vreg_edp_bl: &ppvar_sys {};
 
+/* dt-check-style disable=redundant-whitespace */
 ts_avdd:      &pp3300_left_in_mlb {};
 vreg_edp_3p3: &pp3300_left_in_mlb {};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index ed3d29e13021..afeb6e57e0aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2480,6 +2480,7 @@ swr3: soundwire@6ab0000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2527,6 +2528,7 @@ swr1: soundwire@6ad0000 {
 			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
@@ -2591,6 +2593,7 @@ swr0: soundwire@6b10000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2644,6 +2647,7 @@ swr2: soundwire@7630000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <0>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;

-- 
2.53.0

