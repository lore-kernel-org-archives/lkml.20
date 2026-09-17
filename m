Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705824AC156
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646134; cv=none; b=UomGXirryldKZ1/DcCymUeXVcwb6Mcee6Su02HjyYdbdMGZ7BgGu/PEiX/0kxR1W8YtQYCb5+AwZpGZXkLE9XYDRXqHgFOvFbgAC1ObjzKIvBenKfF/jPS8w/tWF81oE/F+jbbXZM+WNjX0PdvrEdf+hWnpKPRnFCvqxV74o4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646134; c=relaxed/simple;
	bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuHTedUd4xVHibHnT1RVaPMiW4APuW2lBTpMKLmUE43w0HZiP5Epudp40ByF4O4ovSnDwKdLVgSFoMXBXZPck/KdtHFGZBXYaF08VRVO59PdTnLQR8OgJtd+hlYW7GFxjY21e11lEPsMVPBnlnLPgQY72BgOoyj88fIYFT9XXyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poIlPd6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/RskWij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poIlPd6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/RskWij"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zomr1862956
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=; b=poIlPd6LB92pTAEn
	eWLBsd+v8ovcyKtAs4Y+t3J8TpGs7Y3p3xWeLpmeLpTcvTkdqgJ4Y1Nzvic4miOQ
	JkfZobOnPZVdGDTLw1/SQBV/3y38XNPNN/216tKwN1XGqYYtGiR0b1yrfMOV0orN
	6wS8Mvd6I4kMd9kR9YArDhaV5Si49yFj8AIQfSBI0Y7Le53gPPQX5NQ38E3Da+Y1
	l9/nZ1inRdPbyCBsAyYeVVMwokecuiOWAVrH3Sw4w+xeS83PVmrttSfTnTAhl1JO
	6G5aI3gmt3zaXs/QEBSdQXHq+hzdwSju2P04uk7xPeLll3ky5tP5/XP49ISyRSYf
	4WT0kQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1619820a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646116; x=1790250916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=A/RskWijWfEuXtRxCljkJfLM8/gcQ/aVMnWBlqpPrtB12pmAOBAek5/ukp3ioSX7RQ
         nPBkPWVOKl7CdzDjUgMALe9ePHUZ/1KdGAHHrkg6ejShIrTklykbb6Z066v9w0HCAX4D
         LQVbE0w0ubtaHA0dlHreW99plQtAezbboi0hmHonSIzA4KUKShB25DqU0edipV89lUHH
         lFw6WRZiNJbj8/r5BrymjAKQNAPqYAW1rG4TPKdxhmcuYcBoLaHfqHykE3H/fnWY0JVU
         DHkFHMwKevlq+Yb0lbgJuiKoZQiZIucQexEdxsbJ5ySLAOc6B982lEMCPQefPXp5Sy/L
         yBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646116; x=1790250916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=i5E817vw64AvbN9qL2FXeFsNUpMDvm0t6V01O5UfKmvMGCWHWOs8ourNDzLm9sGw97
         Xhp93rgS56ov7xAlghs3bYaNtbSztd2dJeVa2EFsw5f6AsGuoEiZAHTfpajPo4SKQBgi
         eN0ZrvZOnXbCe1EtoTF8Efa+dKdb4xj5pWQvszeqQkRUqmLLdUYnfcoi+o+VMDOzI3jc
         +V4Vw6LN1kTth74zIEuSl+Ilma9O6OGJEh9WQXMEBbywnhWIwJstDaqwnbqR2bNNHyXE
         TkIIkRAL0+UGLQtAObuKaJYMkYQ6Dl3+TBFvL0EFi5cXheErPVwxS34D1JiW8NkCasc5
         6GjA==
X-Forwarded-Encrypted: i=1; AKwUvBxc2c/cUgI5/zvLUZZag+jtWN12FYIf87emb1fJkPtEF/xXV31O2SH2kqxUL7RbJzJwCUn7ppn5vNsbZEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mWt0DfmG4PyPQVptjem9c+atVOk9qXe0AJFSg6s0gVxMQiNwzA
	w4H4Bilmls5Qt2G4Q3sZH0zsw2UqMgh38yAID69ND09Zp8s6Har4gfVzbe8cnG86e78gKCpHYsD
	XpN9/qXT+89gnGmKgIF7Zh8K9F69HEZd83+sEn5d/5Y8DqqXck9l/1IkP88Q0wDzWhAM=
X-Gm-Gg: AYBFou1ugghrID/uyRtcvPD2aYrh5/NY7d1CUOpMikM1LpKanerfa17Co/b2hOhVwvg
	sBMWuGW4eIfyeHFckCFyLo6tv24tf1E8GBy8bOlXPES8ORrTlYSvgHc1+OEHKvKVjWedCIEP84x
	WjshtZJV7I/xzt1C4EgQqVkuYaOS1Vf4XcB3IXxVLpt71r9OW9mP9FALOPn/GS1IFwVB22V2IM/
	m+1NmeG07AcHKRLFdm3CfmGBPS1jCPZytWLbzfwzz4dKj509KAkw7evkyQu3P//QoWAWIfsc1DY
	ZAny7ktO1T5VtCAPWOv9kCezNkDK/1oOEROA/QLkoDGN1RQ/e7TBbWynchWBtcRfJ+JJOvPP9dy
	CjUVOOAxTkiDq2N5dKjX6EwTX1eoJ4lX/2g==
X-Received: by 2002:a17:90b:3c91:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39e1e4c5116mr15236810a91.17.1789646116362;
        Thu, 17 Sep 2026 04:55:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c91:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39e1e4c5116mr15236743a91.17.1789646115864;
        Thu, 17 Sep 2026 04:55:15 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:18 +0530
Subject: [PATCH v2 10/18] arm64: dts: qcom: sm8650: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-10-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=3279;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
 b=y1t/u2vej7pWpWwen8wxtSTOoTLBAd6lWC7qWUimUi06faYsiMLPAzHl7g6O7FU/wbm1rl8TV
 LgG/HYhz5P+BNeGLTTownas7p5emNpwiM2QiUZ7ECbvojf9HWQUN1oi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: csFIi7zwVsnsUiy-1w59A4wBS-2cSCxJ
X-Proofpoint-ORIG-GUID: csFIi7zwVsnsUiy-1w59A4wBS-2cSCxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX0PKeBMGqYFFM
 5MiQGgGmARGwMwoLc+vnXNB69OMNNaTYoQJTehWoC/Yyd6NFwFnU3R3oLczSZ57rv0awocD/p/L
 a8ZHPXJwjAgJ71IJSFvbZq7ZLvD3oKn1uOD1Kc7y2CCTwPbEMD19DnvBjbOiL4o+fT+zHCxiN+6
 TZyRwOoudmXH8VLro9nR2V9MGwwkWR9SmbO/t3kOe+iOEKIwwA1N1sjAOve9qJ0+DmWNtocCn75
 wp+d4edKKWC5wQ2MgC/QjZQRU1xMEsQDXAWAfeFXcDPm0nawvIqeySRZCUN/viVrOWjZCZlYdOn
 I3UknTmrBPenubZRjJ7wE0sjKENG2obkZHDcSaRCG2CJM4CCkLP0KFlOHu2mvxuAF4StOEyh6I4
 Bj49eADtw1KI+iLlCaEDznPtzctVG8QS+KyttWwXBW1ozdfwySSndt3U8ic+xM8ZrnI80xU59f1
 UQqKgyWCn1n/ZY4S2bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX38Qrxn7hYIsY
 S3UKQQYGBh7KePHhwI/0zW4iCkH7JdFiCk2N+5ZAh7pUgvuB2qmHOxYb1d1NIP1eIdOt/1XL/8a
 8D1oMQEBpraivpoOb7lZm3XH0B42lg8=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd525 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..668c183bc177 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..b73ad7861eb4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,7 +1027,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1061,7 +1061,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 26045430d34a..1332c864801f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..2e874f046a0e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,7 +1021,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

