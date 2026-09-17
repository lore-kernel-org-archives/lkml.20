Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703BC4E1C94
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646159; cv=none; b=d9xP4dca2SwMJEmOy0xVP4gYWLIM31sBPc7EIrgjchKrzLcVfFKWl3ZEE4q8H9bNGMxTwiWoeDt2N1PNR4dL4aK3CIefEO3KU/Ps4vGfPDVgnF617KVFt4x7I3Gnxs85ce/SCD6czYa4OKab/hro3tuLSFMSLmAsOsk5VyLfOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646159; c=relaxed/simple;
	bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1AStzI57ZoopYqvMBIYz1REWB8xnrk/UAArfL6tn/02dXFmNXtjP6rB2dhOi4fDMFZ8TW68gcLVml07FfNKDH0jS7NV8uC9Zmy53HJ3YfpSLypKq6CIz00mvPFsnHo/HQaF50N9ReuMSJhznZ57CFafmIYmE6j6l1kIxx7hYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS7cTf5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I53TqhfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS7cTf5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I53TqhfA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZmgT746783
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=; b=CS7cTf5qs8kyy2aS
	c+yFBZTEJGNJ1eIZbIe3mpKwD97gIo2rWzC8JzXce98fHHnS6pH/lO4Jlwq0VRun
	LAIMhhq0BtGxQCrxxMCaJSmg9UsWIO2TlzQA1JrEEKttHkc5cZ9shIPV6TCK2Scy
	bQellJUrvjga06V6xl///nkz4caAPIIjSoIpwGQJFAcR7Nu5Jh3JqTHhwYJdFZ+u
	N1wF7ldUmnmYqxLA1YQRsuilMXhJdpjHK6G2cBwxNvIWI30ORoxgh7k4Th3Or0Tl
	0oIyAx6vuIBXkQ0nG6USeoY2wxEmcB39+El/lnz5OGIyycWjBJKS+bFciTSK3UEG
	FzB6mA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db3d832827so10927355ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646140; x=1790250940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=I53TqhfA6QW7PC47oPg82WcFTgqUX7D2VVShlFsLLiTPY1TJ1/3fUCdvxc/VANLmts
         cn+kZl4D0f1U2SohPJLnPrFCArKUCif7Uqv2MekwLYVNwYpaykLgEOLYA4BGCNJQscaR
         9ULxaBQ0hMCvkYmumfSil6L0plJt30v6QuxXSe++O6QP128UI13ameXDxnu6uIB39Grk
         M9XuIKDzuK9k4M6pDDHt2nkC8EIGEXJy5UW0n8zAOQftYnL3YxACRBWcgolEjjY2thlO
         8839FSS1JCMrx7DfvdLYrSYhvUhjfXdGHSo6iqwHnCWSCbWsWndtJHdA+mt7YCEvE6eE
         JUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646140; x=1790250940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=r9IPbctJtrkZg2Jnm2xlsALmo8vmlURpR2juJKn6wbFg6IPlZO392df5qJKXJ30e8u
         hV2vvdZ0b6VjsG7MyJTJg09Nce9cb81UoTx8Sh3xF/iSEsiyCb0yindLeRzi/58Ifqgy
         HdIVbhrlCAv5S4SpHZKRDnV5s8yzJodDzhRJSn89xPVM9MRYCHcCjHGmMzA3hvQqNx4W
         QBK096zPCC8KOMmi7PfkMbMTTz2AdrmgKbPSa9NjqeLj8EEzNGhnXewZLmVan9+QyZo3
         ecGXO9X64NzY4wntzchmB0PfHNw4sZHojL3Dfp/oi9Fagn40egMlUv2LpHmLJuzDCHb/
         Jn1g==
X-Forwarded-Encrypted: i=1; AKwUvByco3zJa7s7clDx54S04iMFUKJTMXxTbxGtZ0sX7RBCZGMVCVlFMl94jHcHjs5XSsiD4XjJ4abypO+Vxxw=@vger.kernel.org
X-Gm-Message-State: AFuF++mNOTbJelO8aA9uxIceWQ7Esm8CP0gKRbDD8FdDSv0h0zoMgGit
	MpFvCyp7HqCiAQbTyT7wgl6iVMYvtuximmMxvPehhf8BU/HNYCbLM/J3MmjTZ2SntZ49zajZoRx
	VotpPjv23+YNosOfrSf8RmYZb833dDu1m5BeYCKh8fFyAu9kTuXpHrAvmclJaFT0uJXA=
X-Gm-Gg: AYBFou3PcssPIMl8MER/wttJLC+vSN5a3krUZNdGH+CBHIeunR3FTHisI9CLKCQqNGc
	MvmXUzl6Fe3qkPfdHBl2A8ds/JfnuAVYHbg8262JA6anBIBBgg4CS723H5CBLJxt+1bPTiP5Ynl
	TkqLB/tN7KbD2xOqzlqZWxfvMvzzZJJFT6l43PtIV5xXp1CB5FIFLzG0XaYg0wQkFp43EuYu8eU
	MLTwgxLDmKOjmntXTJh4N1QZSg3kpFdTscytnUQLjPeOw9SmUREfYdpyFPhAEitFTebDgbD7M+t
	iQistRkQo9pEd/+rbJBxvdWe/o8nKplVMfT3HtST69zT+qaylUHZTDFbUdIRl8B4pErUB/cUdak
	GFE04am+kh3QwIknVbdFh1ewoBEN0Zu8Ejw==
X-Received: by 2002:a17:903:2443:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd8e40f0a3mr133804345ad.10.1789646137331;
        Thu, 17 Sep 2026 04:55:37 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd8e40f0a3mr133802615ad.10.1789646135551;
        Thu, 17 Sep 2026 04:55:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:23 +0530
Subject: [PATCH v2 15/18] arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-15-0d627d0856d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
 b=reCAW2SHxN9n3dqYnoGgvyOOeS8l6CT+sj8tP2iIVDgGcBMMEr1Nl4HcXYZiZPj8VC5ArgXQR
 Fm4uwSkaTuuDnzP/fNOY8kqSuIZ8sHPrjICoY2k9TwmHmHaWRJrG3wE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX8S5WQlWctZLX
 f4mkfCcUXZMq/w2OypMOS00L1mH4A5JzAl03hlousyOzSaSgppO6PbXL4b9zHnkbdTgHrO7rM9S
 Bt0jORPF6SFhmnYz1+66sonVmh1S9Sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX6CiM0+evuxmA
 Jyb+zg3zmNSunfg0j4wb7u6Y9vabda43CVLIqAObSEvzcRhS1bIMeOGiZqvbK17aR+ViEHhPMqo
 BfMieYqF0MXH18yDAfUZZctikAwVG4rttJ1NlXJeJYTRGMwoM8UcZ0tdKYZg4y+BXZY79JKfjEs
 a9/SmQhEsgBqKoCWeYywsiMDThBpVdesUiakyrFYTVCbB1MsHgf5r7LVo/czyp/WM2haZfpXYRM
 CX97IMqJoqZWuv6ntc/LsoJmjg2v09yVcLERe4cUe+dM1fKL2LKJVfQ9T7A30gD/cce4mmx/hXh
 nM+kJ6vlJnu1mJEGMDO318p65FAjmb9W/vnb5DrxK75EVydd6+/R3VL7ZpgnR4PW1AwLYVeACAh
 P62GpJ5rQ510TVUXqabmHLIHL6uqwwFVn+Yjw6fQhmVPpHgN2dWXzquQ7DirRAG3u+gSQVzMF60
 MGI2ktYjmv5HqCsBxdg==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd53c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: alHkiDp7mh95OOeEEVtVH5HSfticDlRo
X-Proofpoint-ORIG-GUID: alHkiDp7mh95OOeEEVtVH5HSfticDlRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..194e114a12a0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -840,7 +840,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -857,7 +857,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..3ecf3d464dd7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -962,7 +962,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -972,7 +972,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

