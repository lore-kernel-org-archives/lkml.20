Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F942E4257
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253201; cv=none; b=WJ/il+v5wMINmMZHks/Q4RIp8qw1nJjUDinqbaLN8DeXfGLdYaFF34BAr5Msb2tzuSrEdXrsVelOLBDW05VVecLMzcUsgjPhqZVoMQlLNHvgtwZRzWdJ5lbuJuFLclrehDpBQlOahpKthkJW5EYkFkPqS9QbBjgChovK8Cxhbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253201; c=relaxed/simple;
	bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SzJ9DsN0SDnrvKcjIi8/8/y7+MVY86j8h7zxIelnNcFOybhfRyZnHyvbpCflMBBIl7QnFNqVg3+kM9Q4N9/BLpPhXr4BJv2132Ixm7k0lThFxx+3tdScKz6QrRCVYGUb9POHnOOjnMWon25sql/BLCo2ZECpZLHBH0/3jNtiTQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=las+aDOs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpgJZpO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="las+aDOs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpgJZpO8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC50Hs1430123
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j1JhjxYMfO7BOGaU49ffGn
	g16NJOkOo+MKEHoAorM98=; b=las+aDOsuQhh9IozvnoicSZFgQ9M+0at4qgXtI
	RpDDpLkb/SMQWMxI14iRTVChMu9zSu5Fu+gRqQ/l9orFlQWCkvv6e02q1MA7bfbT
	kEN4ant2pFZtreB98f/UU9BXTKWUfxfMWymAXg26N9oy2k3EfAInq/uCjNk1OERv
	23nLpVDopiscrroKnxUsjDHOgH3hj7d3mRf3yr+vAwpVfE9CU16C6+FmdvkbI8Pc
	GnGuqxzN3XC64uULEx7ZASnDHJYicfRe11IXMxMVsFqPkWzufJ9U+7bDHfmJSDcB
	1IN+aofu+mmDvUpimcNqWCFSiXQpPSQMbo0wd68diM7Rzcng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgha0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:33:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3b126c9fso20923415ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790253199; x=1790857999; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=EpgJZpO8D9Wh0p4V3VXrNhgT4u/ASRfDnqZmrUzhHTTbH80D8tSmVsURofty45Trx9
         O4TnnNwfWcMBzBpnVovkpkZs7VmJ+IAoHYrYf9hONJfRS0biG8TZAOFjzSWefjZ/fTQx
         ftUI13YKTHQH/iQYjYWZsJ+YlgXa2whLq5wNApaSSoi+OcNkI4ZtSFczj6yVh4ruUFsk
         kHdbd4EYC/P3LlpQtxKONIFenNmNJFcWijmZtM9ZliC1DgQu8/e8u+EY1/6ebt/DrzyQ
         RvgGVXV/8sAxoeNosFpot7Lsgl8VBOznghEk5e8fdQzjgfQU+/6kIFCrEhADshL1oobU
         5RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253199; x=1790857999;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=1dbtyKkACkDdlJcVcNr/XcJsePs8GT3k0tcRPIZmApwIhvRalkB90B+awL32j9uH3p
         J6CnEBk5zU50NoQSRSMmxU83WX+E1nP9ll1jS0qakhLdG+dE/AhL62ryWC8xk/2NeflB
         jop53vd4k116LK/tBkeyh7d3ICHhWiiCT0gcOj0LAB0tnOUMx2bO/chPJISeDGUmp5Kq
         KYKq841uVbeRumL3lwyXWNZ5spVDuJCJ2VWrc/wVUjjGbpyNlyIv8EymbC+a1UI26ZU5
         aoPdHyOkY1EOXeOB4o/1p3Y9++7IULJ1Hpyn5vf7VaLSU07stPjEeNVTX+MyNMOAlehu
         kt/A==
X-Forwarded-Encrypted: i=1; AKwUvBxttRnuXL9VjEAdHN3FkuoWYumtldBBZhqAgKn1Z6sLqLW+hcZRgu4f8/ihIa35XfnBIq1aJBbr/et5txk=@vger.kernel.org
X-Gm-Message-State: AFuF++mWJIt75edWM4Q0+jFY2FGnIyrRB2NrsQGWVRWSheHGU3FkirIX
	6kUbpE6KRWeksiqdcs7M0fO2YAyGFSihrIASnw0e8vRVKxzR2AzfE5Z0QsZg3DdpepIRTqyFwSk
	CTy1CqHo4rwEm5jxCwTc+6lFRpuYZM+vSbGqwwU2NPYq/vRM5lbDmo5jVrUy6E12S50I=
X-Gm-Gg: AYBFou0WBMB2TnvR+WgKRQb4YYHYpxDGzWaiiMPcQsDBArsGOuAhdpmEBjOW7hMdsTU
	JWv2DLVf/wayPxOJGcdz9cCaolkTE/o/w0dCY8k3w0FEevODmT+Tf/DoRM/IgNkfnd+6zz8JmdJ
	FA1kz30IHX1eXW904ofCfnpGJleRY3LXPpECeQ9pKz7tp9HBtyeBC4GBJ9GLUtaTTCg0/ZMKGfe
	YntuX/tBOpqQ9VYOGHsMabeNoHePQwol5aQ5EN5RHqT0RX9e/xP0g2ABXA8uC/eYgF1OFc7wog3
	WTaALrQym2J+RyjM5YzyhnJWcJsJzoJIqTZ99vTQTsxs0fwGqBOL9u4IIEEDLfajIoOUv35WFMT
	Xk24V695W5MRAwg==
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19624755ad.21.1790253193618;
        Thu, 24 Sep 2026 05:33:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19624505ad.21.1790253193100;
        Thu, 24 Sep 2026 05:33:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5164c0sm26298365ad.6.2026.09.24.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:33:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 18:03:02 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH0YtWoC/x3MMQqAMAxA0atIZgMaqqhXEYeiaQ1CLSmIUHp3i
 +Mb/s+QWIUTLE0G5UeS3KGibxvYTxs8oxzVQB2N3UwG0ymXWvRRbuQ32nCwIg3OGUvzPpkJahq
 Vnbz/dt1K+QCK7gmcZgAAAA==
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253188; l=1433;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
 b=R6GAmqVgeX0epgeuCzE+91Oh6SxFUp6mRCOFLzKb9fMJuxMtjjZfFnpEIfLE6wpNywnt7KsJr
 ZLS64eUrRi0BaETNOW8AJcm3IGIOOzoTavVjlWLWzBAdNYQRZMdBa0C
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab5188f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vI5slWehT91-5SZ2dYMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ReOze7_I_u7R5afkEM4H22m0v7xL-KDC
X-Proofpoint-ORIG-GUID: ReOze7_I_u7R5afkEM4H22m0v7xL-KDC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX3tvxjjKlChE7
 j8eqtgtIVTK2W0Qw5MXVXaGviyKNVPTdBhPC3Cu6lklTL8MOjYlKzJCpPSkBBLmPNru9dvhpHlL
 k2k2XfevelbVpBgtE2HlQF3aT2jXa1U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfXwmcJ7KJVPHWP
 /KsPgkps5x5K6EQ2bOdU1ZcxuF2W7VInb/yTFg6E0hG1S7epWWyDiwofXvZjkrAfYAxsKeINDgh
 N0ySrTcw+vZHOcm4EP0y9hab/MSDO/nq698wKOWwQRvcut9V7ezzhM7HpaHcj2Dhl3URy4Hmm+S
 Tgy9Gx8fiZmMzQxzQy7ieljQy2k33MFZbYcZuW4lYktSMqWFdP/dgmCilaX/2stxni+KnvfbIru
 mmFK8anT7r4lQvuqP4SPrqx9YmVya9vtUcfzbaFjttXtudxmxXPeEhCyzO7W/9QrIeZ5ymi9yyj
 3oqFeNfIV4/0vVXHbFypwQxBmKRq5211OytOni5tSiaJgALCkA23Z6ukeNaOHxAPQJI3NTjutcj
 CAU5CeRjIfoveFQLwpRb3Ova5IFlsDGguOIJM7twAqW7G8sPBDKuWWNC0fuhMtztB1LjlUjiQ8a
 vIX/nOHDbohWylIJNpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 0115fc9095b3..04faf09b21ae 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -29,4 +29,32 @@ tpm@0 {
 
 &uart0 {
 	status = "okay";
+
+	expander0: pca953x@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: pca953x@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: pca953x@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: pca953x@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
 };

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

