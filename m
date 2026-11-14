Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655952;
	b=R9Zr6LB08OGnHBYkF79c7SQ9l2GVJU5VkmX1Vs7cpA69aFgnzuROPObg3kQn8bt0w+wa
	 IJvc9VP1cKqp2192IUAF73GMbbIRbxFpFCq2nZba2y9DnagQJPY5i31YQx2MXVulW/Z8n
	 4dCU7BXTi7PqfAPxUHA57DebxHUhV9dyHAXsvshWstm1hD0FM+WtEenrSFFfMGZaGp7Y7
	 yNeQzyitQpgdYGKbvzf+O/Y1/K4EKI4St0JlyrJsWwT/6lXUfn++iQ7n1XaoT49k1gwXk
	 8aiP4P7b+ncsbctcz5UonIDWSp/6uIMJ50H+dLM0hDbJ8RDzFC7h4Wi6IzbpdayD6Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=118YqHxqalP1oetwP84XJoymItJMTpWRhhQtEiH2cXo=;
	b=knPa1PhpwqiZIMJsQzlHZ9ztxnoBiHjW0OSO7pfgy+OwnUM7FAOQAlsmMxwbxKcb9ku2
	 NWSOr4l08bLJ9z1uk3X4HWCbBUrY3Y+iYNc03rLXoxnPACLP1yCeoZmZafCqBhK5G5gKY
	 +nHKMV7KMRj5r4amFoXRcUbatEbVd477BdNggJ2xXMsF9jiHnPDD0PoBllB375kfmmo/V
	 tSzhu22tEpgNGVdF5N2suoRbPs72d3t6vGa2UrpY4LgOk8yifMo/A28Ij3w9aIZSFhdKh
	 A6jYoWN02Js1m6W0F4niZvWNY/O45cgEp/P/2OI4BVjENIx0E2izMae2xI0n9+bJPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ab1zKmP4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AACsnOE5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D6606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273D6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ab1zKmP4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AACsnOE5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wcKr3379816
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	118YqHxqalP1oetwP84XJoymItJMTpWRhhQtEiH2cXo=; b=ab1zKmP4omtiG02x
	g7EDxAl5IaJTrngYAsiEMFZuPcgnFNJiygZ9XWBMBc/L1fDP0M/TEZ36mpozkJzB
	dc42aJsOx6fMq4viW1J4tguzGQI8f1QXnVHfdR6a0sHH6IYHd+uSAKi6qEnV/9Ay
	JOuBCiSM0WoY7UAygQchJCntKCnQp7CHyXbmdJoL73SLB4tEljlV2Ov98oFdnVYw
	Kqg1LJqY1qX02gz1Im9gp2HaeWOH148ZiQ2eh6z91djX4rWNEd0EOYc2IjXQs9Hu
	HCTmAXff6JEBZ/7er0fHOhvavVg+JS/1FGOi+IygsSZry6E4i1zZveWQIACvFOHR
	LtJbNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0n8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383c05fb2fso9179171cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655950; x=1795260750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=118YqHxqalP1oetwP84XJoymItJMTpWRhhQtEiH2cXo=;
        b=AACsnOE5QfUibFfR7Z70UJCrWB3Auj/dW3DBYY/guUjWR92v2S6iGOoXrX3KLTM9gA
         KW3J5EkKmnAYhHXI8eD6ixTcUFxSWWRZjB/6pxzCHBSAAY2cS5BqnwFwIV+LasXH0AkW
         m7zQenRrRvwJnFvAf1AyP7RzGKWOg1fMPLqDvhUseZIRY04qjHsKAeGO0J+UuPX/vtex
         4CHKHpffbEGNKh4K+hauovVdlU6CzlfG3zJgCpPOiKxL4dRUdb3B+aN3XvI5hxkHquq6
         R7drZzJUzIFn+7iYmljQCzN2R8sS5nlPkPyV7y/VVZUArh4bAJyuHW77VYpBRxyV3iH9
         aniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655950; x=1795260750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=118YqHxqalP1oetwP84XJoymItJMTpWRhhQtEiH2cXo=;
        b=XfFNYeVWwNuzOuFIepYPs+znPHv3LRQFSApuKIMjoCjROfi1H++hUVOaeYNLf+6GXk
         DGOAhGCFLZdtmNrDow400/YmRFEDuVLOG3JnzRfqru4d/FuKAPk+Usu9QfxDYrPFjLrA
         Xnv3osQSthbWXl5NfadzcERS1AbhAzwGEaWfPshueZZ6L5ID9lVxqQofuBNTwnq35ccP
         vVZyD9DilvB3RoUVlauyOqqCK+RhghHJdVW01o14YbnfD3CN936QEYn3tbVhEZfL3Vcz
         FRnZaeFxvR1yZA9OuMYwdC+F6dtKOCRuCMtD5AvTSGPAXxs5fVbbrljgf07oJRQlpwQ0
         z3AQ==
X-Forwarded-Encrypted: i=1; AL+hErEmwFArobwgZQGYSPFO2Om2Cpv5Qvazu9jbDIGMbdLrcF/ZknSQ79UUmUqYnbaqi0xQqkRwOvw/7F3IEP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cntip5GPTZCQA+qmSJ9XS+pL+UO+AR+2/00P4pBmqtycIoCVI
	sBH8RzsuUUm0m3SnfHEhUZUJVo8ICvnvOELqKl3KhskO9GmPtRi0zW55KZTTH32pA/SrpIbeLLb
	3r+U+bfetcvTKqmYbbf3/MWFQJkOZ8xMjOPGLbUNE6F0Ce2IgozKIIv+dELTbq7Ffyi4=
X-Gm-Gg: AYBFou2dj4QoBcGhyrE+FB86MlfBmwY46ELkiGs0EXMe4NYDIZvyIiISe/wJK20W7b1
	V/bHUpcMFFqveXlnmZj+Z5WRLC1A0Tx2NesIWOiUMft6sPyCWRFoKnLmjksU7S2/r/INSixmh2g
	mNl20dQWrg5h5q4hrPMrKIOs5YIiIifZC/h3lKQ9Zg5hDvH1pn/QDMaokxc8seMlqYHu98ypipL
	aAtg1ggYvpu5NO8xLoGi14NqBDVsSZMm52sYQvYQ4pSuflc2T/joN3HUkoktptZVBsXPYTLtdZc
	ziPJJfoJn12sPWdHeE4kKVvpo5dnz/XHO1C9cGreATDbO7pSfmWlpTWmDpJxfn/CQXcfoxmHQPk
	bxD/0o7E5NFjc866thtL0II0Oi0diCqu2Vqa7IayCl+kGzafhpPnLBGak36zb7vd0IfPj3xBNwV
	yyM1hdkS+90pFyJWagWMy2x8ONuFS08l9x3env629C
X-Received: by 2002:a05:622a:98f:b0:536:747c:3e9e with SMTP id d75a77b69052e-55ac9590719mr84028141cf.69.1794655950266;
        Sat, 14 Nov 2026 03:32:30 -0800 (PST)
X-Received: by 2002:a05:622a:98f:b0:536:747c:3e9e with SMTP id d75a77b69052e-55ac9590719mr84027781cf.69.1794655949790;
        Sat, 14 Nov 2026 03:32:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:29 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:35 +0800
Subject: [PATCH v7 18/23] arm64: dts: qcom: eliza: Add CAMSS and CSIPHY
 block definitions
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-18-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=8695;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TmMgKTV4jJLsSJWSFMXQqriEhUZv+b0B4NJkgEpBHxQ=;
 b=fwXjYlmcyadax8j/OrB86LTPRxlqMi8Y29ksz77SBndDlUxI3Y/yGNzLjMxmfF8SvWQUEQw43
 KbZMU2tp7S5BWPQkc0UHIr0DSYZlQN4kCzVycyyJWoPeFUMsl517iug
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXzZWzX5jKJvwu
 bN3BEfNEYJ5NPk5ijsqWY/loAIUGe8//cWFkTSlBS+zktxwbVttXA5O0Ih9yeKPXF4XcoxZvY0f
 QRBp056l7/+WACMA7tz6lfC5fExX1QgMGZIHyGWi/T/ZDBwX5WvX+unM/dSiqNoHSLaB20I0zVx
 1c/v6fQ1nqOBOxY0VM+uqh5yPvjTiOWF5NwKjiVfPG0tgbw4QWOv1hb43vc9oYKeqV+qaQDljHb
 JieQju7keNyXuZAZ2DiNZxhbOKSWK1Y1x8xmE5xMlcOm39jLw7F5YFW+jZhSeXelZ8cDzTwOYo8
 5at+BRtnra38w7KfPeKLsAJLEdKuNSlUXyT+V/ncVNNmfVzsauxk9Kd5rVKcrh42VZaXjFEoOW1
 G6WI7X0wF+r142ihg/qdUM4Vlb9fpwXNe2tTsas7SJscrxCM1C0GlSdaDTkSzi+9R38DjVv2sz2
 is3y8bzQ1BCYJq0vyBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8hfcIjqSB5Rh
 hmBluP22vhhXtURniJdhm4+uMpu6V9vP/ECGzadKgprIuPf5oPSD+Xrgh5zlIl+iIu0lvr+Z7aJ
 OlY8mGJY3Oiwk0wH2ID7toG6gu/Fk2k=
X-Proofpoint-ORIG-GUID: GAM21yZ8PlpPhwJHJVMZMpXlwXGi2Ey6
X-Proofpoint-GUID: GAM21yZ8PlpPhwJHJVMZMpXlwXGi2Ey6
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af846ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NQs1xKGztgJ0lSJ6CcUA:9 a=zK-6VH79qFPhLVUz:21
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Describe the CAMSS and CSIPHY blocks on Eliza so that camera pipelines
can be enabled by board device trees.

The camera subsystem contains:
- 4 x CSIPHY (CSI Physical Layer)
- 2 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 1 x CSID Lite
- 3 x VFE (Video Front End), 4 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 296 ++++++++++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..dd21cc4d267787db3d8741f8a8970629bd20d0c4 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -357,6 +357,22 @@ memory@a0000000 {
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -3448,6 +3464,286 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ac04000 {
+			compatible = "qcom,eliza-camss";
+
+			reg = <0x0 0x0ac04000 0x0 0x1000>,
+			      <0x0 0x0ad27000 0x0 0x2b00>,
+			      <0x0 0x0ad2a000 0x0 0x2b00>,
+			      <0x0 0x0ad2d000 0x0 0x2b00>,
+			      <0x0 0x0ad6d000 0x0 0xa00>,
+			      <0x0 0x0ad8b000 0x0 0x400>,
+			      <0x0 0x0ad8c000 0x0 0x400>,
+			      <0x0 0x0ac86000 0x0 0x10000>,
+			      <0x0 0x0ac96000 0x0 0x10000>,
+			      <0x0 0x0aca6000 0x0 0x10000>,
+			      <0x0 0x0ad6e000 0x0 0x3000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "tpg0",
+				    "tpg1",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0";
+
+			clocks = <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				camss_csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_in_port: port@1 {
+					reg = <1>;
+				};
+
+				camss_csiphy2_in_port: port@2 {
+					reg = <2>;
+				};
+
+				camss_csiphy3_in_port: port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
+		csiphy0: phy@ada9000 {
+			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ada9000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 568 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy0_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@adab000 {
+			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0adab000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 569 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy1_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy1_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@adad000 {
+			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0adad000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 570 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy2_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy2_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@adaf000 {
+			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0adaf000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 571 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy3_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy3_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,eliza-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.34.1

