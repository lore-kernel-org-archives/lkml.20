Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167744E8DF0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647983; cv=none; b=afYTlZWfobKedVjps0O9n1jli7n7ehGzpPU3BGV6eKIhJDmOZEHj+jrhq1i1B8EK8Eyx2/QgbPT7KYKGWAABPhmYhXcEaxQ+hAWEcsclmaV9FxxkJXHaWXT/69ar9/V6qKNJz2nuMeIStp91eDQkTdKcFdFWa31Ebkq7sd9chts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647983; c=relaxed/simple;
	bh=Wgv/2XTDzwnVs0G21nQVV2p6Ay1DaT+vMpFJHJxR9lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1FBfRaBMRfryqqk/Dr/aD3etBit5vrsxABhh5hwr3xhyhZb6NsKdj1KtoeDL/4M1dzk8nC7KLlSopymDnyesvtTW1XrsqFomVCW+YUVX6xqGGSgaCqRCkMO0LIocGMYb50WjMVdaMXIBFl5Zg7dVL9wVCCRBBYogIrVIitMe+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nL9annXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0aX8iNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nL9annXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0aX8iNI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZqvA1863438
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naqdCafc4DsJm0WCaMl+LPC01ocjUgQbPu1xHWOVHPw=; b=nL9annXo4PfYPDVU
	/FN+YNYFtWa0FkU4XTiDCi6ti4BBmDkuUtlU3O/1dFHPiFtpmpF2bMiiNyJmxLvc
	ndZOfTOIOKDmDwZyAK0OTo1qZHnWup+rlFrUD58wEnbMdDcI8BxUY3cNuNk91Qux
	NAZ2v2FQZgMn27cEANo65UfFKHh/V8sI2bm2aMGwVdRcT0IXc/BB7epHZvwC9S4f
	Z/8uzymK3kh9gzXvgnWuNF1f52Lqqab2oHSADvvlKqaNH8vU6/wNczhHI8uBaGKc
	wcM9bJcZz4YiKKu8J7OFQtbVdcB5A6fKDwm5kuQJ49pxrT9lbeSK3DyAOAjM4KNV
	Jszz/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1126334a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647964; x=1790252764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=naqdCafc4DsJm0WCaMl+LPC01ocjUgQbPu1xHWOVHPw=;
        b=c0aX8iNIP4aGoMyHa91q8qdy0vlm+QUEnRZH01S8MMGmwE5YCmHTT56doUWoYOucez
         9J/VYunMg74/a33QB2GnjgmUcW4tLEMPA7TCxx7XX7ToE4pkRoUsKGYYFOid3d2Fh6oc
         a7yonCLUwd9Gu5FAPi5HqTPKyM5HMEqaSKp6X3JDJxkgEDayTHNQ/+FQxrqlu5NAmKYi
         b33AYAoYvxxs10r/KFddIQS0RvuhZavi3WAoEJUde+1yXyIJknlRtCaFsiIsI0YwyLgZ
         n6mnYuUdleVtisP4C/dU537Z/1bcbbCOHEIPBBbKLHgREzHkC+ygPca9qQpXizh5kYHf
         BkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647964; x=1790252764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naqdCafc4DsJm0WCaMl+LPC01ocjUgQbPu1xHWOVHPw=;
        b=owPxbjIvKZjY0QvqFpQy1A4w8BUzdw430A+Z6xKipXRRinbQFEW3qxoVKRtTa3hsF6
         YoFIjKQ2yR1BE5l8fPBkRU1mzknQOAM8kIiKe2cI6hSZwvkqVKl9s/WEs1yTNS5wbVkm
         k8VOAnTK+pTK+dX92XWOvWMiCVAZg7YLlUlpjoGzHJs7AjYTH9AdiJQr+8x1EGP7+SxM
         Oa/PB/fkvohPmYdvg2aCHRyEC1Bkrz7ZZLi+2tvlUssKYv6sBlNu/qCU8CDC3Bco/KJp
         9chDRiPUpjo03VCdiVur/GrGLV9IxUIMdjDY3uN+3nbh9a/UBMZ1m36rr/ri9sq0kqyt
         Qa5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpdNJWbHlDys7lrufKKfzYSBlcjMSqHc01unk1rbsN++XtsXyTnO3hh7Fm273nWGdqAPJlKNZjdk+q5Fg=@vger.kernel.org
X-Gm-Message-State: AFuF++mRurUj15kET2/DBrsAQ5FiZB0tET7up3kHiW7fTALc7F7uFbCr
	fD8fYOtxxx6ASj5jEpVX3lkBCA77FVb+eXZMFr+37K2dpCq2HZ9JX/3F+vn9I+3FqqU+yubxoxb
	++Q1FDoZACHzba9WuArb/VGwFfFbqMrTtPJWfP6S7rov+EgDgk9x1YHq1YPx/mXF1b3o=
X-Gm-Gg: AYBFou30TIssJkbSwefDteDmY64SSkwmIoMmrDwpNoIrPZ+8ikuVpiEHwr1jM5Mgsoo
	Z6JiIDXz1LPcU5o4uxd24jqqS2sN/RcSeS/1z+x9ugkfc8xKStPDXPhjCExZB1oxrk+p8BTBSfm
	yW4mOCsaP+cucLXqP2GxHS/3R857OaEoq2hKVQDwG4Dq2wUgRCwjbzlKhFQI8g5QCi1Eg88d8u9
	FT49mY27kEAAgK1oGn2Q4O5yORh4t4Ak9N3V7GItU+VmHizQyfkkUhkROb3Ta7265Kq2HGoOg9H
	ZZ4bbLN4nvVKM3bx4yNqMe3l9Vr4yex17O0SJC2Y+YHulcdVBXDm5+sEONslsppA9N7D2c5Hf7B
	erbgnmKoEXphCmChrFg2ZYW3znb5CSWtIB+8=
X-Received: by 2002:a17:90b:4a4f:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e1e4d045cmr14455376a91.20.1789647964154;
        Thu, 17 Sep 2026 05:26:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4f:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e1e4d045cmr14455323a91.20.1789647963592;
        Thu, 17 Sep 2026 05:26:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:22 +0530
Subject: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2772;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Wgv/2XTDzwnVs0G21nQVV2p6Ay1DaT+vMpFJHJxR9lg=;
 b=bTN3wysc0PBORZb5ZZ8hQ9mnvrfsB1bAGs4XY4fYnnNfsBgAFpBffGACVEZitweDtMHTVgkdF
 Z/bG86s0n/ABHm3LsPXWuWb73PIXrxqP6/bw7sELUoRyXFhHLwuA+Bs
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: t_mLv4Y6Mohp0cKNxP3pfzMGxNv2571H
X-Proofpoint-ORIG-GUID: t_mLv4Y6Mohp0cKNxP3pfzMGxNv2571H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxpQK0YB9RuxW
 52XyaWN1VjtFDnegGy6vSJj6S/Va2o8YyzmlpByMEueE3OqKPTT2EvPLqM08aASFLhSYhEk4xVo
 xc+3zR7wpmq25NQLkhPyy6pk3lbaEDgF8Mvi8cRCa/K3Qj7cs8UaPg2/rTUyTJVr7CxPnsiSXTM
 6RkBkEgFLxo2LbzFk26fJX+JfOi6BuW5XuCMkxqbzoJaiWCQ6WKndszAOihYPlDHT7WA+qC8ocx
 ujA8EwnZNSp4f89+on8mJaZ1+WF4GOOMZjH1472yb9tRyHlCi8HAbLvTsMUc3ozVAJ8H0dLWT9l
 kSSlKHh5ZnbcXS3nwfpdYqF2aCWFx3HeuNGBFydJHg0GRamu21VnnNyaWYNub2bh3nTWxEIEvo8
 2b6MHUj1BQ4aDdfs7UTD392gz4yA2BUQPf44OH5jXuN3EhzY2sc1F3GgoctMCAZLjPGp1x3EEwz
 JCbaDjYMGlAlQ1ZHu+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/dtL/0BJrGTn
 /SK1GErGwb3Hs51TAv4OO4cW9/isIee09HqRcudgJf+O7nqwurqS38OytLgAe/mMj4UpsD30FPD
 ch85vzc7JoKI7kKkeBsPVXYR86e6kw0=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdc5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e0c357222bc7..caabd201c0d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2207,12 +2207,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 			dma-coherent;
@@ -2224,6 +2218,10 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2334,12 +2332,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 			dma-coherent;
@@ -2351,6 +2343,10 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2461,12 +2457,6 @@ pcie2: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_2_GDSC>;
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;
 			dma-coherent;
@@ -2478,6 +2468,10 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+				reset-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

