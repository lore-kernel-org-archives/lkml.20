Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E24EE84B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647992; cv=none; b=jxis+KLNUcOkusP4bpoqPfXJ/cOzqT42CM/iuPpv1Eztuul5F1iGgV9lAB7xEskSShKMSGPEav0s++lmOJhaF0AnkEF427BEL9eE6x3oTOnPI+KxrTzpCgB5Mi3e2D1QUvyJy6mT1K5PK6JMjND9+eOPYUv1iusiXMBgpyx1LiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647992; c=relaxed/simple;
	bh=GifRTCwRpzqsop0m2POLFnGoYXAHL5ktB2gtfA2jizw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gx9DGmka2olYcwhwNzYXhWMqLBzbsrxqmUbh6ICEmrF1ljvLJug3tgx5OvyH411d3E/qIB1imYQBqvcWrL6idN8PaeG1wgq97EhBUwLgEYX38ObitwSQ1zSjleeOvFeDVWaq6gFgmcxEKI/na9vZyPWqPiPHNkU3SLVWhVYgZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUbFLd/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnMqou35; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUbFLd/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnMqou35"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zt1P1390178
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUOy6GAph6O2ETb9t6iFoYYUzaFg/6VwQX0uCN/yRhs=; b=RUbFLd/6nS1jxJt/
	cNJ5rAEOajz3HE9RghLVJMo7165H3KbuVytkoPFmvRJkyKHj9wDrDEkFvxEKKnrh
	xCwKIO+H1EUkkebSEWIp+miDgTPuHNzojoL0Qzxin56PkZJRXFhCRluiMJ5MzqcR
	iaxX37iAnFJn6tJNZ3/2/ky4P2VH0cKBH68ntvjMOusPoZ9+3PC8oMI6lBZvkOPM
	+qBBjFwH3ipSj8TH1mUvPuBC+qsK5swtbjHS5I+CtLGFvi9Ek+PhoH8Na7dprkem
	CeobcV7GWa31rgGPLt/q/dXquNSC/IAF6+7ZfnPeDftASJkl1bHKAHMbDFEbmVnU
	r9fiWA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d4bdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so1178710a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647971; x=1790252771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUOy6GAph6O2ETb9t6iFoYYUzaFg/6VwQX0uCN/yRhs=;
        b=DnMqou35zLrTaBocnFR+3aj4KMExiH5CiAvUQ19C4k9FQIDqiACeV1pXdXID+dY/ZZ
         vYo62VqwgwoHQ9kg7AB4l3oDxG4CKzBzMvVafPwpJXMfRhuskTM6mAH6m2XoDuAxLG7F
         vx4JYdo+b9X3Tj7sFkrIsaGk0e2NTRJVzkgcNSx3Ayj13sdlCIDDGMfw0tWpJbmFIYjq
         h2Ly4r+r0N1RrwykSSZm3D94IZw3zJQH4KmZ50M2r9t73wnnuESy21y7RBsQFQxqiRm0
         2uPHV0TYK0xfJNLp5bi0+bRz+QqFzZkiJEofTvUvcSCiGhJFfvPp/mS+IsvQWXelmQZR
         ZJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647971; x=1790252771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUOy6GAph6O2ETb9t6iFoYYUzaFg/6VwQX0uCN/yRhs=;
        b=VN0quyk+zE3bmTAAgZ5xpsn3Kjig0GYkGVNp1/9EKmfZZZGMQTlgGc+d5bThRTVKSH
         0lYj9mcQenKk0O5VQ/SEkHflbcROt0unNUCM5+wkG2raNFI05cZ19LMgPWuJkHlI1wK2
         p0YVAViFR81T1MSa2+zq+js/WoC/MBc+OTdnsK0zTuUEhv4pZwcXPm62DBwuKDVRMGms
         KFLvHL/JJjoxV57iSFf6pFp29I0PYGoPbv/HFhDwUJnJDyvrKnC4LIXMI63+DIqT9Pct
         cSLcBSW0+XIKXcu9zMIY8NNwIikOZoMW4FttVH6b/R7BuNfbDvfC/R/DsFebVqjNYc4K
         qGXA==
X-Forwarded-Encrypted: i=1; AKwUvBx84WogQoO43qYUGTneGOrValDbBiJuTmgsl8oB+cut/dH/BhHiyU0n/NE/RAcXCB38+FcUjgB1DaeRXzY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHrByeaH5ZpqRLGrRBhUY9kbYFY/SVGo9Vbn50hSPpnY/tHWCE
	tm08JFtpbPz6l2qMf6srohUPXxfw2YYruhquUQXysTLYQHstECujRASd5gtpGN6YiC7vqFuod93
	oJj1T0rb1X9nf/4VCBVRM9rmvss4Z35EERzu/M7rnxNJa0xxTbcyu7pvWQEak3JqyskE=
X-Gm-Gg: AYBFou3ZG68fGjZVT73lhEDQUcMvmrpdUAk1UM7R0A1jBV8Cqom7UYZ4xYC81jW1Uf/
	O1kVYH06bPAzD+GdASMlBr3iuMhZ6c/H4zgsxbdbX5wJH3uQL3Tcj2RKlzDUOjR6NsrhhjCdGqF
	+iz1eiEup5CdrGJNELHlaDwnMkpxX3iUc9dtlSfg/QWQO1EOkHks30x5Pg5NvBzMDP7+MJC0Cmz
	zdOjG8fK7dEWUF9dThz2cpE63nlBFbrD33vvYCpRYLfQduZrUU+X6AoltTWtnOF2wZ06bKzxNjL
	mzICQ4e5LASAWs100mWiRkO8vhynY+cgFA3JtSwPuF73nVHMHxqIJnfHymf6nfx3j4l9oH1bz8h
	1qKTuvJmcCz3B/m2WS9iU9y5lOXKMP2u+QxU=
X-Received: by 2002:a05:6a21:4a98:b0:3dd:5831:ef5c with SMTP id adf61e73a8af0-3dd5f5af371mr17005688637.17.1789647971297;
        Thu, 17 Sep 2026 05:26:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a98:b0:3dd:5831:ef5c with SMTP id adf61e73a8af0-3dd5f5af371mr17005640637.17.1789647970908;
        Thu, 17 Sep 2026 05:26:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:24 +0530
Subject: [PATCH v2 10/15] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2276;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GifRTCwRpzqsop0m2POLFnGoYXAHL5ktB2gtfA2jizw=;
 b=jSauZWymUF8c+qAwTEwDz95cxTjGpq5235fF+d9a54vILySKfgOO72TNOaECXMRicp3rg4eHe
 kMVZOXdgF+4BUUhq5lryyNZpwtWiCtbD/ONP7X4RrwBkD1gp2Mjwk6u
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: wNLN-7SCBD7UqmxFy8ye4C9FoUJ5ujeb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX4emNwV+uN2hq
 NzCdf1caUR7FErj20LH5uPSMmyyr9K+Eo6hYHCNeYxEnVvTXTFs9CIw4mm3y/04vnbMHE6TJxNj
 hCxk1+nZd4WDY15tBWKEQ+FGwF0h13M=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabdc64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wNLN-7SCBD7UqmxFy8ye4C9FoUJ5ujeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX6tSz2cUoD8IL
 02C3MW3EwSfMhX1KFXiwLGAqhPEOHnFOjJxZa2WjrwhboFBcM/4PAw8u1kAbr6LllVNCVlEQ51G
 pZNRzOgmeqdTFVQhsYuaWnaaWycTrJqhEgQaYJ3Iebh14wyhiYjP3IdfVAuNds9R86mMgqpRQbW
 JqhyBbFb4SgkPUeMInjwZgXZ0Hyvlx2qmW42C6YF+xlBFXBLzjAVmWK5Vmr9Vhmi+th+KhbKcdP
 NZT5GY9k4MOf/5zwbeElJwVBnMM1xzzpk3mQMTssxI7zOVwwfOjbtTyYhywfqzGXvcQGYQmQzj2
 jWlBZNE5vlA27Lkdzlklz8U/RnJc8pwimsQ2df/mWmHG30oLRf4nX6F61IPx7yxVdXdLJGtyqEX
 ssvjFxiirr8B0zdgqa+SkYP8iF3Ffqn6dXhQvRakevx44sTY82rhjDDvO45XVWFvUl5AFgKWaLE
 Gb7M/2qDbzVWtO8swbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0, allowing board-level overrides. Rename perst-gpios to
reset-gpios to match the binding used in the root port context.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7bc5f85e7ebc..05e852ed7995 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2017,12 +2017,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
@@ -2063,6 +2057,10 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2182,12 +2180,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2263,11 +2255,15 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

