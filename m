Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27C3A875B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695512; cv=none; b=c/1UppzUB3cfiFDfL5Q+KBbYS9cJ6+m5pxQ/us0eICPDMWB+cQ27JsLLeM0az79+/qunQZjnBEJTv7Qr4hYO7p7jEpFSUlHgZvfoAN6+eCSfm18nwZDmFCJ4s9jubLzXzJVcIXbL8h8cFr9epOjpmO3BYaDUCNRw9Hva8b9ULGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695512; c=relaxed/simple;
	bh=iwgtcFjYefHfYutNbwpYq3ADnw3+dJGDewop58D/TEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwVceQgdnYfXePJvdpksnsyvwPgaoZ2hbmOlhJXgLe99VMKL9qF/G9Pi0aqWmsz5LzbL/r+HLXgsVjNEIB/SDcr+rXlvWkJcxFLDjbnmAgfel1U0R8yrzM5O8GU07HCeX2mOFqoLz3Dii7HcdqYHOpXKaIs9plEBN0x+rTfmLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLoJQ+U6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGLX+865; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLoJQ+U6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGLX+865"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG6Es2955508
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVskiDHzzU5
	wKaoJeXEhrm32Flxy6volXwMELtN2PHg=; b=pLoJQ+U6K44Mm9hiD64C/D0dDI+
	u8E2mys6JJ+X9lvEY9fO8u+l2Y6xqn6ROaRvOteX4psnqdaSZGC0EsxxVOeQ/MGw
	mxuZo9T8y4BUEMVnTqS4Tt49VQE7tAG3FFYjZNuyxQtFCOSAmlkIDaWNdXPB5kvq
	EdXsyxcldf56l7J4hqycep44JJbSWhr3HeCFa3TD6GJiOkE1c8dcyOC60/vOr6w/
	fHArEAzRHoBy6itA1m6VuSbkd3ZIi+T55XIfksGlP/lqCDt1jcEku4w10lKI2njm
	dC4wNx/+ySzT4SxutIRrA+IwSqMwU8cGJEFee8Y5/nd04OV9YanXOLsg3jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5k595-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3f521346so342345a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695507; x=1790300307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVskiDHzzU5wKaoJeXEhrm32Flxy6volXwMELtN2PHg=;
        b=cGLX+865Flu8cdPs3yy/CvUVQZD3OE+HU3LOswWK+Oe/Hsaj+Lz4mKvIw+cn6OqyWm
         /ORqaRnGrYylxYPiOlwcGbR2WZmuTbTHksjgetRnnTCFccEOIfF8cRZdVyiTPhnXM203
         sJZRUDthqUcm3PUldUdWwIzmMfu9u5tfGZkZV6KxX+7WPwftPPPaHkTzwm8R0bj1N77t
         igslSxhIJCVw0NLXznFGhmEmu857o9BI/ku4oD8PglhGuHi9/DeWpzx4HnWkbQKn/Mbq
         Ipr8lYOoRMQ9EHeh4VrVSdz/0HTo7iKP7Ry7CFyQ10xvkZkJHPYE5t57/84Kv9FzIjLr
         b9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695507; x=1790300307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVskiDHzzU5wKaoJeXEhrm32Flxy6volXwMELtN2PHg=;
        b=fSpXfPnksmzHDJGtUmdsBd1OupEN3YqNOp5gcAlt1qh/ra6BPlnmcyGIB2i8Kkbu3f
         FfhH8kFc+yze42YbRhhSoFsbdUgM40JRE/PoCrGjFxHOFJIJ+JY5pcLRPjft5L09OZgx
         yuTi/ueRCTQOoNbucPjBuHSZzvpYjqlhg5AG04gdKkBky3fs48rwlG7Fs4GlXz3c06Sv
         THLRPkd6t9Ff6yFMGj98/PQWZM3VTDvmIDGeMR/uKRychFNFduQrb6Z6dpydrCMa8Ea7
         kXYaruDUsEJ0rC4YEPXTw/Y1lz/725NN72DLn+8ejNOgF7r+dHzF8bzkhkei9YkbHlaS
         Y39g==
X-Forwarded-Encrypted: i=1; AKwUvBzynoMFaNA7UWkB2jcP9Sryk0/ArwgzKWMIj2zzXlUeZFeaQmpUoJmkbr4HH/ZuOYICHJMDrpU8HAIdBfc=@vger.kernel.org
X-Gm-Message-State: AFuF++kozPirts/K5zRNHQb2i4QHSz2YtcXUo+llqCRqULQT7yg5QFCo
	PrUmFWsLA8sVD8vxrJ4U0zpOmzbFOUUif2zZY7VrsnX6nRFlqjPPov9jyBe88SkrI+T6cih5E4L
	xFRWv39wX1tTyFPBEHXYBWwdrNI6V/xqsaClSUhM66FVY1Gq+jqtBc2Ob9HpdtLxp5h4=
X-Gm-Gg: AYBFou2COPqAJ8hsAFKpjqX/RpVqXoG9BxJf3vvkDn5YP8aTLSOA4qABP3XFJCPZ0ir
	SNHe7N+XWxRiM+4UIOi8zxQHYWR4RRFbAAcBSMEwktnRrHNNe3DXmReRd+nKsA/dd6yOjk9+sja
	e8qMjeA57kHlVpXJ+zmW+LNytfy5z4nSKuXP+VGpd8SU6mkmkEiSLvH2ssIhXUH8A19MbRi32F+
	SGdgYfj9o9tN1HO6u3AVlcc+QB8LWAJlv2q7rGq+H8BrNOW9IzzrBWCoqolHBSczAnQMJqL/Zu2
	c6YjPrr574ULYAUCDeAD5tlfdSpH435dF2TFg3+3DyckERyDhQiVNIH8WTyM9m3p6z636Dz+VFO
	X/Ysx1dnAeR3A1hg7CHTW7zCD9Ax8uTnE2QTKYy+TYrJzHLjKbFGs5+WvbRih
X-Received: by 2002:a17:90b:2e84:b0:39e:4c81:6c60 with SMTP id 98e67ed59e1d1-39e54d55514mr2071413a91.27.1789695507355;
        Thu, 17 Sep 2026 18:38:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2e84:b0:39e:4c81:6c60 with SMTP id 98e67ed59e1d1-39e54d55514mr2071380a91.27.1789695506899;
        Thu, 17 Sep 2026 18:38:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Fri, 18 Sep 2026 09:37:39 +0800
Message-ID: <20260918013740.1355096-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX4Ed4M1cha8va
 ooZU/WOnyi6QOt3oN9bE7Lo+eLD/1S0QmqdJpvQj+ARMUUHGyU1xe9qELlY/b0IW0rTp27sXXez
 cKr3ek0MBu5Lmsj/Pv30sQTREB8VT18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfXwnlediyEmCim
 XKzsUZDAS3j7bW/BjAj7TnhmONA6drr8JUJN0i1eiVbBcezJq9v5Fndq7rtzcmIpEFiN9bED9om
 Y80oQ+YNWKXsYdD7HnaIS30+iJzMXj90l2nTqjGqUdYYHNHhW2/0UVPoE1Ufgh50TiUQ1kviaur
 L9Zd2U9ruQ0LlszSfivk0INkvIagrusMukP7ruB47KsY8gbY4G6u5TLrXmzVnhOfNRGor6QKGlk
 XBptsMXe+YLIHz6bWlt/RRoRrKyr66L7+FZyQRQJj63FOiB5SV8VlOVTPFDS0u68ZFXzsmgMKv4
 TfwmiWonuDdzXtMayPgE1rg+CohsLoyDRkMJlly1RRcjdBQX76KIxO31cD17MAgZcZOBdCvgf9q
 CqMzpR6pP8/60ZWn8fd3lU5HHhTdvS9WLF2mHFTmc0WgnLwX4br1iRaD+4BIfOsN93YqRt8slN8
 p+FueQ/0vfVggc+3luw==
X-Proofpoint-GUID: zZQSRZlTauHh7D4QMoT0b9mtPmNEtnI3
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac9614 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zZQSRZlTauHh7D4QMoT0b9mtPmNEtnI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..2ad26902ffe6 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,54 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp1_out>;
+			};
+		};
+	};
+
+	dp2_connector: connector-dp2 {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3_connector: connector-dp3 {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +414,86 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp2_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp3_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+/* eDP0 */
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+/* eDP1 */
+&mdss_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+};
+
+/* eDP2 */
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+/* eDP3 */
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

