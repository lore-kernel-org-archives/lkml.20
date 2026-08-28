Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889B45199C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920702; cv=none; b=LACAInTvWprOx09io4KT2RQ8zV/vQX5TY+0gALhPO+CqOJiSjSq1wNsogPc6VIYvkufgHEnmQAR3qyzRRKUQAkIP07w3eqaMw6OPw4LCovvCdH+LlkzRPO6lf8qR23K/Ldmjsv7+BlJurVGUGnxoVjB2Xnjwyv39aicTwLHeQ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920702; c=relaxed/simple;
	bh=s/F6weqE5TDS0bCI66u8Ra/UckyVI8mTvNgVjljS0rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpuLY/ZsNwWzO4QZZhJXrM2KHr8dKkn7emL2g9lSHnVTnRsaHfK57INNuwQwVdkfgELPbBSZ9v9rxRbmzrLTwjTkg3N9CegqNDT/Z6J0wnRAHVH2HFGBjWF1k+WJXWZqEP8fOAJ65rUrpYeQcJw3OMZXZHmYZjhOJt8OGlqyOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDD803SQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AE1zDXsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDD803SQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AE1zDXsm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCaxeI1906526
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=; b=BDD803SQU0o2Nxdi
	KsrE64ye1qonDNQP2B2S3KNVWBfdKG4eTLdzRsis8aM1WlGGIwFQ2ZOUpJAHAPFA
	yA7PZR6u2pYeqA6iXLOuomIihtsR1PpQaa2vcFY+dAcqChzw3mLadDM13WYFBegF
	rpQWph4SGCmINn+vqdRZfunb5ZoxDEH7ZjfCyZ8b8ypsEdxh7O2HEUv87zuhEhPq
	PSyN99WgGolQxbGxgd7rvnvr744YBb2QWrj7tsvkVdp8jncTwIplTPnfBuD8ac2x
	aSNQtRPgzU58dXCN+La5hVQJUVutoPIrELqWl3HnScN/5uSDu7C5RkZYZbPowVeZ
	Zfnb4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r04f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so18361921cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920687; x=1788525487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=;
        b=AE1zDXsmBpz60d7dz463so9i99v6dGAaBWYQgqvrwFZo/M0LcQFBMnmZfha75128fh
         rqtO8aFzzKNm+FWroYoDr+5ie70uiutKUYx81zcRc4eBIHyICHvaF+VAzUTxgap31bfx
         U2koq0aVky55jsBIiVBWAghT7WC6vP4Kln1d/YUWZiJvQt5RNdxxg/UnW9BYj+9Q06/j
         ZYhKc/LuKpVbyHDvudyTN4IR9otz4yWKZvaePr6z2NWAWlUxcE7guMOH5RTCw58piDHu
         9Q11zq76VsKkjRH+AQN5filS8QCRJk4NvEn/0ayj5TjrRevV9/VdMK5iMjRbGZJp6KYR
         Ixnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920687; x=1788525487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=;
        b=oTepTtgwbuQVVAl9vYjsGYvlt4aWsPEJgNsU/ljVzojM9TvZ4yWZB0IZIvPO7xsRlr
         SQjmUN/DTgU4Z3sX3Pyjyap8B2nGCfrqcduJfWx2RYYyB9FlFyVZP7q71QFBAjmeLJPm
         A0+BlIYab0Zc7eUuPOWaso4E9fdr/cP1PKN3iunhHf3qJkzO9Omi9HjRKvN1W68BhytK
         HJGpn9qYs+0KrxmWF1vxnGkN3+taQyK9/XXG/covBeZlO7ONMO1ZVRGh6S/uaOq7hf+T
         6xJcpIRKcmte/bAkqnsX6gmzOahtvpyesWvwQPPazNFbUG0A4BDfWiVTx/2g6e7t4Bjf
         YhtA==
X-Forwarded-Encrypted: i=1; AHgh+RrpiMaoNSCgHm97RghMDHvC/PwoeHsZZlkYpKcPSLfnIF8QbZSGOsulqjyjm03l+t3sxtiILxPtlz+swdY=@vger.kernel.org
X-Gm-Message-State: AFuF++kW3LhT+a/M+q3OqRT30D4/Tvz1VykBjjNbT4UI+ukhZsyV9sD6
	judw52B7cMCdEHHQri8FiInT+7DbdXjgYN6ZPlk4ayN0xA07aIJmgwu1tLCGMcnxklIHg/NpPa0
	nPB9Vx2kfY8Jm0aAJ6qsTQZAdkeB3o01u5T/jX6JLUssp65/mcC6j318r7owyrokfPns=
X-Gm-Gg: AR+sD113UPIE5Cjh0cq1uKV5m8boO/pebw9nhDyq5Gyrs0ruB6rGIiHHovHBM0Gbe+g
	XKIhYrzgOTHVW3t3qmGOYBDupeOJ1y3M5UdVoO4MUeGGSa3P7/m40xybmAODv6JM55sr/0xK5lQ
	5kmaCIevx6NwBrxmykGhUejSLbjCRd3xWLoGYMMwBf1mVNRvXyOTAssxIb64zAylDT1DpH56VT2
	Vfvm1mQnJUMRS0oXuI6VA+V04YXpazrYjq8ZOdFhQUT+aBJIK1curs+udYEatInOCLSNhIe9fsr
	R9g/oQ7r8BkhiBPiYsoCPbvkLM9iq1tlN+6qcgZ48f1v7QxPUjP9WBwkFbukLvNXHFqYOsAHwtc
	CC2qikj4=
X-Received: by 2002:ac8:7f15:0:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52fb9373f7amr75322611cf.2.1787920687274;
        Fri, 28 Aug 2026 05:38:07 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52fb9373f7amr75321791cf.2.1787920686699;
        Fri, 28 Aug 2026 05:38:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:28 +0300
Subject: [PATCH 09/11] arm64: dts: qcom: kodiak: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-9-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7241;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/F6weqE5TDS0bCI66u8Ra/UckyVI8mTvNgVjljS0rE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYESXJPdBMr1Reg5wXdethgNiLz2o9GJfRxXO
 hn/scZRgUOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEgAKCRAbX0TJAJUV
 VgDbD/0Q/PtoBCqYvL24q2JIG3LyyPgGerMt/F6rfzPrywL1vxj647AQVbbXsiFvKkDDY1o2Wjl
 fiOeHMiLs/9jHZxgmwsoNF9n7W/Nxf6CqtuNKG7JnKLX/cvVUfoOpyJX8LbGtsgtZQzfAA7R1JQ
 d8WBAWO+yA34+2J95u+pLbSQRwZdY8XVDYuGHGROcdJRZCuzZefo1oRjb/gf0851Nl8XDfc0j0d
 AdBvLUNSt7a/xfvnJvkt9HAXHkPzHiGroTwMa3tU4Z3O2nrnP09fRtP3l3/sQvXbpdkTpbpnywg
 xUTFrqwKlwWFucO46oAx1p13muJw3ps0VSV6MRKNo+Ja18bcumWVf7LPJzBaNm1IoV8VCqfaPMQ
 aCxr1yHDo7PzxFX6lCdAz+QojTZVPrnr7EVi2PZcijgt4JT1Sie8lQitAJGUB88O0RTloWXTB9h
 NqRFzfpq18MX549qpuY5rnunee+PGbu9J6ICe+GQkZ9gXXGgahqKwSTUNLSQ3Xluj+NLyIneL36
 PchOz9oHHSwXwcRbeg6j2T8T3obq4vkCr/Gm/LGrd/rrGcu0SP/A4PY53WTaqq29OuWvtnQfxs1
 xGNDcgvcTaExnQ3Jgba3lxr2bx5uMVKDKhxIroiVP01CPhh1jrBYW/M68kff3ubK0A6YR2bEsyN
 WFW4u0D1hQSv4Dg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918130 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-hKjo_9CLEb_madm_L8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX7IBDRDmCqndC
 7uP6/coNyXXg+sGQp9JL3iMxJ38FEEHtrtxHTgoMmwHzpQf8L6izl5PMR8aBIxQJvwy1h1vIyYf
 0o9J+w+KUIXRAssva5SYAmhm5+29bZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXyCK3AHfaThQm
 G8r0CoNtOJWL7XFX9CEM3E32RaTRVVvo3htQUA6pIFhNbZtwRR/AUJBVfVn2cutiE5RZKM5ge5o
 kl/eAkQ8KwaNsJ7ooaKG5nG+LBcepjLwrI56ocTOMhyRr4hzrqD/EUbcvWdQUTcFTvY5ny2cJS/
 R+GqkzdKf+vMf6sPr5mpL96QekFP1G7aEwyKTIZrWsw3VMNax22FT+gJactIcAs14ncb4rbDWfn
 DyM65ceV32rmvCoMFFjZb5bi8uFFmNSdDwSlERE45uI82UxBQQtdPlXJgFv4x8aGPjkbau4QyZ6
 gQwhwoAu5+UsNbly375IRKKGOUhyb8fnEQ8mxG8thOdsUxssXRIK7TukABVwMGOWlxGTdFBsrAJ
 2J/TCwzVBHWQlqkRpZAKpnC2QOhhrAVbNGgLeqank5TqdiDt2OlZoNp4QvF9yonhsYU2iJUbAU+
 rV4n9IIyVWVKdqeIBHg==
X-Proofpoint-ORIG-GUID: SG7zLeQKRJSmLDRivdizkQl4UbX9dk0y
X-Proofpoint-GUID: SG7zLeQKRJSmLDRivdizkQl4UbX9dk0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: cca53c338ad8 ("arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                      | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts             | 4 ++++
 13 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..ffbf037b3838 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2586,6 +2586,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..b2e0cb0b3f71 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -937,6 +937,10 @@ &i2c9 {
 	/* VL53L3 ToF @ 29 */
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..079254928e57 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..f3f0ef54eeb8 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -499,6 +499,10 @@ &i2c1 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/particle/tachyon/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..e97e94572beb 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -552,6 +552,10 @@ &i2c13 {
 	/* focaltech FT3658U @ 38 */
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..dd83c424273e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..394d1aff854a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -653,6 +653,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	/delete-property/ memory-region;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..7a1c8d868ddb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -774,6 +774,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	/delete-property/ memory-region;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 96a7327f00a8..1bf3de6a4228 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -373,6 +373,10 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_cpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..bc183bd94da0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -723,6 +723,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..51ec276d252e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -725,6 +725,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..f96e8d7241ec 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -970,6 +970,10 @@ nfc@28 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..19940fa627f1 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -638,6 +638,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
 

-- 
2.54.0

