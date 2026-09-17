Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FC175A64
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646114; cv=none; b=P4p9sPE/bn5vRMf/CH8j33JUTy8CrKNQSteum3YWrVAEA9LbvT8gJwaQvG3WAEOz26+kUIcwzx/KQgJJRqKaT00+Blr7cpVlwy4w5br2U0APwKJvD85gIRAe3zfCjfHIbZN0B3/rfQbnKcignWSvQciqir2QAj7gKR/MB2t9Ckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646114; c=relaxed/simple;
	bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feZtQLJsSFO23TBJ4Bm/TGjHlT5HssCrLDj1nE/Z9MAuJ6U5FKiYNvW9IcrfX9rNx6Wek3QedPjYSUG+GzTcSwnfbGsaGTssZ6BkPjffI2yMJ7uuL4h3CAnj7lsr+FLApKth5LwndqDIxk2tPxecW0qmbUsVfoWUlbJ9AhW+CtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MalyJOsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki+nSY0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MalyJOsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki+nSY0T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zi1H746682
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=; b=MalyJOsp7MdxcXBr
	grxdvue+TnUvfOuypYsHxRAPVw7YP3LpY7e02m5vSyp1HgJcFb5bwhuVR3xrSUMq
	7QYRtBXX2SO0s7XUnx3hubyyPGK3N8XoE4lWPclC3FShy5FrNXTRyavxkdD9vP2z
	Yffi5cXYiwCZffVlDnzAUVrGpTQodLYJIRhfkSflEIGAgbosCjx5gf3fYBsXHq+B
	r+V3D4LLGlOa5gKm1xbCkOPdD/mvVjpgKsY8wlmYPobPOgn5GonkL3ATJfUYHTG2
	irkeFOYADPWbL8eVHLrC2sr2XfDHRuVs6GfmQzlS9zAB2VHbk2apqW5rlWCJPO97
	haTE4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-854f274dd69so917037b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646100; x=1790250900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=Ki+nSY0Tmsir2yH87K3+gCICVUOS8ssN7MYrszzyPM2EJbcTcgF2Qd9OMteaAvyFwK
         5jjglnAllhZY1nitTQLBxnuSKDiKz9eZr2aKyM1aJgRyFz7DFai7MNYQIIAr1v9HEYD7
         h3x4MpYULJTWZflz0UL4DnyNGDoaKq1U3ksA+FmuO28g5jWVVyDBnHtIr9ZulFRb+XWv
         9+gKy2znPuGmBc3mgZSfR+mk3m4EQsg3gvSsnCdN/ziov4IgaKKpEiA5HUiTs8hVHZB1
         KZJEp+DlOQHND42sFJ6czSNhAkjCbux20zorOy9jt3rHVbL2jSVeRYQYDrTDlLo/tBvU
         m4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646100; x=1790250900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=AIW1z5pgzWJq1zPtVCYHScv/K3oA2h4Wvurd4cpJsyVaFfQJLKM5ar8B073nRhxT2Z
         h6FhPtIfBYFyNTj3UVXhicz8FaM0hJU7mSYbD2UzibkXqlmvAUA7hh+UIOSOXPaZCXAl
         OQ3C6dGTWJ6XFlmjJ5zgd0nIcuohIw9dOrfw9cGr594RC808zeUQHCB9M5wun+smnqcf
         bGzFwLNsqwtZjQDN1xKPLmTXYpW1CIqnFMTF3PmxmBz7qCW2ucy0rWU3v+HbgIOTQ/Bs
         cEwkF2wizjJ6eBm4CMBcfhBuWLjfHmhgreMExIiGdIKChxex1EAtI8xFWJnSmCNn6J3o
         +dzA==
X-Forwarded-Encrypted: i=1; AKwUvBzRr+M2uG9AMNOeACaE4gWCBEjkopMavQHSUvrzAslOosfA5Anzz19pjhLMoI4s+5OF/xjzpzg1OWPEgIM=@vger.kernel.org
X-Gm-Message-State: AFuF++kbAI8z/Ib/8GmLGZBHHnYlqnVjpBt1SoxCxh9rWXdt8UhvxsXb
	3IajfjE+9+IFKG/BL2O59VLyKKNBPMMG7+s/J2dr1X7/eVzcin4J1blTbHET5U7C7k4vtTJlRjo
	4nXRxY7FfL+eJwEUgz+tS2Kt1NPWgE17DTFlyKZPOa9xrYN6TV8/s6N4pHMd1nE1c0KA=
X-Gm-Gg: AYBFou0yyVMOGUWRQlY+SFaeLbluXXATPbSc6m2sCSK171OASRmrya/Q9JeJQ6VuTlI
	JTqObaoaKe3FG813N2Sp4iqM47R+z5gGJA5XBbXtfQI0SfXXqMQGR8YyxfgB3uDKtCDI/xvZAnT
	nF1hcOMzgU9L+ffVgVXq4wyaV5joPweziAZ8u5yPAVORqg8UZnC4deE/gHa7iMSFvZm5FC+Z6zg
	x4A/LylGrYfDS6qb+LbGzr1N7Fheuy6l3nRfLQhH13t6usLq73mFu6Zqyr4+/2eSONwskqD1bz/
	ZScT6tFUiAUXg6LWcCks7pLRom2/ii6mgfUB5BlaPmeckCmZRSFl6uJ4Zph3YX3ChbRResq0uDI
	0g1r5c27r4PA+YV9WPLN5j27n3JZPCt7i8Q==
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr17059259637.20.1789646100443;
        Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr17059196637.20.1789646100056;
        Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:14 +0530
Subject: [PATCH v2 06/18] arm64: dts: qcom: sm8250: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-6-0d627d0856d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
 b=11DS4IOjWa8jhpPWdtMSmszFH4mGINtRdhU9fB0SurLsuHa0b5Y6n1SVEHio/ccmEjtjEtlmi
 YcKn4IB2LLTCYTfualAqPy9RrMMjGp8JNOebJ81/cH7xONc74unwb30
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX+aQZtPFOFadC
 8VEayo97hJXoevW8ug/yUrKA+KldHDny0qVQniJXKTHi4ujYNWIB+5RrHd6jThGiIEz3fGirvCU
 HIbKL4p3jQVO7TcpI4v/C6XwFxJtj/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX26YOqGsumCm0
 WeZWY2+A+XIh9rZXRby+pwwIHH6z267GeI5yKFFPJA65+nRbj/BztWOM6NiOHO6INuwjBvwpTcE
 9g6YloxEmq4WrQhX2PSk11LvojJWvTTwZ458nnGbRE9wWsjIjnIFYG3l3rEQ1zoRazcBrw2NJAD
 Enw5TpNJu7sI15O9Ukt/c+Bp0gij9125ZOC3OKeftJVmbFJVgejywFKLEI1Kc801ROoSf2DSKvK
 KrBcq0WqVLlm6xpomKUQ9HO/KhnsMwjEOutIlhe7PSeTTlKVEPpQYwWTF78IlGAUrmFLRDJm24e
 ZTryTtuaofy6Klyaaz3ZVv/L7GqyqQUacSWStgmRAig8uU7dKpsiDR5DAxY9DY3H0McI5LH6s37
 CUE3EPoUNcE/ZfXEAJmqBRUnVBWWxeMjnjAEOsCOrTd62202c4HELUCtawN9dHq371yzJE+hymh
 WdcERFSstNLmS/98ulw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd515 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nlp7l-2h-vgWWZoitXRaCw51B1YoSKy5
X-Proofpoint-ORIG-GUID: nlp7l-2h-vgWWZoitXRaCw51B1YoSKy5
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..e0c357222bc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2211,7 +2211,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2338,7 +2338,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2465,7 +2465,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

