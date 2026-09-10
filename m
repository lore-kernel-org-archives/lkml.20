Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC649BD84
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047016; cv=none; b=sXpEcf/ay40XdFkVYCzlpNXYp00MP5n6wRHN+zWgCENfjxjAXVS63Oiuu5+eAcaPjtC5xH0P3MVEJlGTs13Nq7tgRxn3y7UBtY1aeP1MUFt9OsR1kEnoU3wI9Dx5mGJ++LY326BgR0vOdZQrRWsoiV9ZL6IyzjeEgLQ+P3tsln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047016; c=relaxed/simple;
	bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Znyfv+g6r527SAv54fURXt8suyvvUdkOALKmwNxswBXvkkzY7wayeCIo56Jfo2h7aHVf1f7MWXCvFrEt0ipdHzaevIM3KTaVDFkhKZy9fox1jBuvcyqjVK6cDT2C1+h6qHLSY6REAAodiTMWIukF1iSD8WjEgmsAifNV2NE3QqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUS/2Wtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP3xQ92M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUS/2Wtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP3xQ92M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7auk2029182
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=; b=dUS/2WtjVBYBuo5v
	bLodGv7OyqgHEoc8j4D/xL+jKJJ8OF8w1l5fLaioRRiuhvx9dJwEd9cJC+kHzPEk
	VqMkZRy7+MDXFaaqb+YjXmVsbnAdhMYxcvGYjDprn0CylMib+66KKrDA789oeVE7
	gJbBxkSZtTLcjF/I4dxoe/t4MBSlS4hJ7pmztLlPY5jmR6G+Y4MBG4sh6DIrqRIF
	Y3l1VzVXz9y3+RBqnuBV8bQpFhwHQCRUwbCMokwApjHI14eqoOOrpAJKokPfy3XN
	miVIIUB1jCrsGGsH0tcoIeU1A4QLnLyejSU+N2Fnbg6qD3ctLppTmqPaHEUYUhHp
	s9U+rA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc05w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7097395a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047014; x=1789651814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=OP3xQ92MghOKNKgFhlqEFa0+gihTFReq9EbLBP3Yam1J0JzyLGWZIfNzxYmqhRBDyf
         d1dnpa0ufo/Yr9OTV+XcyzP614webPl2hTZnFToSAlizOM/EkfkLWtUtskgmLBNmDvfG
         OwKgxSEj0hmkHk0G3uTn+5aw3dnAMPRb+cB8CHVjQDn77pJJKKS3jn/vcdxsO3rWaa7o
         jW1Un9HNh1i02btP4oh5RTOFsUg47imcSXcsqYE+2+no79/yh16eK1j3i4a38j7CvH4q
         5X6DICWq2N5a8EYW44jnAtbhzUOJuMM5v4qEG8otAtJsNl6TJ+V2xkSEhNpjpdS0vIJi
         6S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047014; x=1789651814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=gh70wB6nnPA4sEXMyt8xQJSQ9lXpHqvdDg0cPbYz/x6khbAx8x1jJe5C70pbKOAxOC
         kq0jvX98T8abvA2Fh0dUSnw4MRTHVb8hzQxGRiQO+28cfwQ21tZRAaVTbqAxvgM+Mc7S
         N/QpYB/WFZfE01JZJOiUnbZBQdGhgoa8MApBPvbvqzT/sUbk2Mipw9JwSGIkd0YmJs4T
         9E4zoylKaT/UoZeu7vLLJgeM0raH474i2DK5ZW0iRP15w117fIC5i1G/pyndxs5urF2X
         dbu2VGdDTtpAkVZHFilDQD004tvHLCy2cDfzMgClGTKozXrGslX7r0UIOnbGTPhOiW7i
         7q+g==
X-Forwarded-Encrypted: i=1; AKwUvBwIw0L+jRRMKO67uQlrIsCaxdWz8OpUIXmBM7U2KnxfwzyywwPzlykFrvkMovgThw/vPOhSwy5Y/jbpMHM=@vger.kernel.org
X-Gm-Message-State: AFuF++noDLGYTFwtpFSnhH9kv6OqSSOsYf2qiOEnVSCWkj2pGjXakdVv
	/Z6Z4NdMtcq/4UJ0aq+Q/S+0CeYQP6i/msTGwrc04z2jX4EBXhS2I4h/MlCHSNnGLDCCPrJkTAO
	a4J/yYbKs12us0KtXpETqgnnASaYwnOC0w9snJUWYKCZ3araD4iOzjcqW6pXDpn2xeQs=
X-Gm-Gg: AYBFou3RCSivxZhV1NM5dMF9h/hCZtIxEZFnODBOz3Cs7xrj8CxBp1yGiy9aHArKF3q
	JZ6cFn7lRAcIq8iDrQEZRuMbMJNpOZRXGXDLhoxZMycZayhz7uG5D3KhxG0PNnFL1/WK900gINe
	w6fJG9tY0TDRw6Cp8gj+zM3LRzkGluTNtp1KQ7hwxp0vfHBql5YmNDisChv0E5J5CL8UftpZVhP
	UHrYAIIqaruBC7hxtB9tcSjcw5JRtWCCcl+J9mAS3ZLUmSgYRoeIpD8aPWHGoxFDne7Y5ul6rrK
	mk+J4Sn/Jw9XOtg7Ad85QrChu6Jc709KO+jMt+Z60kff/xQqEfzZxmo/OUGJ5l23FfBxcOfpvwG
	B0dGDxF/o9az3ae2XU5MCUhRvGxqVzX1ivpo=
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr62054941a91.5.1789047013246;
        Thu, 10 Sep 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr62054828a91.5.1789047012640;
        Thu, 10 Sep 2026 06:30:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:04 +0530
Subject: [PATCH 15/34] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-15-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
 b=NM0PidlXbCvMGDgRuEXv/UI4Xf25mzRKm7177MUv64iatMNQIwTTJoPPTv1BLvV8nZG5ocNft
 pscQLHf3uNRD8ekCzLkzhtz/fEmDvMmJmhRLyg1XqGhrpytUu6pGZM9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX6rzmK/LIX2+F
 FSwZ9PtIEOx3qQDsVw1zLiIBEaulIo5eH+74KyPkcxHSrBYOuk5ncMpoSn+JJGR39EIpmcTvug0
 9xtgT27mRPPIxhaIrq2eObYJDitaWM52qt7xvyPYVFYPJFfHdWB45Msg0NquFrJ8ekJBTokBQsg
 Xe8E0ncORkMbC0pJ9zx/ElTr7BLUR/inr0CCddZCXR6/O6L/KjIoWfhO9D8zYRCu5jtUnEUAdnv
 94LjiYNpUHWRFyX9UQD8WmXO8hszJ4mPce9jH1TZRHPjMSPNST6hRNjJJagxJt+8GshV55+JTaI
 J02lB91dSrtYOgVuxOv8Fpqb7dXJFvUYVtbzgEib8uVdLPDB/rufw0g14u5qT65+4gFXItNpiJu
 dwCZfjryp7Ea9g1/MMFUieiB1q6jcssW0BRdb7b0bu6Lp/z0z35hX4uXZv4EkXclxV5Kvht8Mc/
 P9Z/leAMHxPavGiXcsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX77snjF6Wt2MB
 f5ZAazNnbS9S6q3eo/71jiNaI5rNKLyoOd2cn5uu5hbOLYJX0GvpgqQgbKm63AHER9I2GjkBhQk
 53AGsbbpVYjq6mwRi1FamhamMxoCKjQ=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b0e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hA-u1tLZIVSMMJfVmu1VGeKvcotYiLUh
X-Proofpoint-GUID: hA-u1tLZIVSMMJfVmu1VGeKvcotYiLUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..2472df47a0ea 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1

