Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A64CC261
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647980; cv=none; b=Qq9kfxXgnd5nKNvlljJFC9/Gn/+L17wOrS8ryvATSMNy2VjejfH0IE39lI9SsEmxCn067B+on0jUUrdwBl9nwwSBIAI21JOMS2ZOmtENSbCrWNoqEidsZ1qEktnKugyxpcKdeTPStyKItY7mbhl4LNhBxaKGuuKocgFkhs198vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647980; c=relaxed/simple;
	bh=Amj6aNOUQOMt2PsDq7bY3ArIqeV4Jv+WmJhIu0bjQSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tu2ckDbR6U49Ojk3R6a1S1YgHm/dRasC+k6Xzrl5kjudDLf33y/iYMoqeV9ctjF/Ytb+W+AR9y+VusfM/q8T+QbJ+u0mJKRDnTe5a1l2UCkbMhOcuVV0c8EP0D5NsGC22cztr5WCRwO0wEdVad+uk8y9eV7vjq/HX5r3tIh6QPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3mj+mWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqkYfe/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3mj+mWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqkYfe/H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZonV613661
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=; b=C3mj+mWulfKdulcR
	C2J/p+5xCwZHTdzPxduDl3kdEjxLuxQKhSkpl2+w8PVxQ+1X4UO+fzpkN3+vR5IT
	KF6nppmkC1ZAeYsv8GINZ2Whc1ht/HIUqf59Kbb7PeSKXxraLLQ5EhPIToJZWO34
	rW7rKo3coZY+yuaXVRT3ecNqTCV/Yc9W7gVKK+wkwsnhGPfoJsnKfW7WDdof8aii
	o6AVofmRKfe41lLlv1wZ3pCBK2YyT/r0T9o163kyAmhxBdgr6MOgTBf6ODks5hyl
	YipsK0yA5ufI1vpXXu2mZ9HEdm/3oCEw15rjeNr1jIL6kggbroQCOJbh0TkMhSlV
	b6XZ1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0s27h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so1059278a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647961; x=1790252761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=;
        b=HqkYfe/HXEqQbI8gJI9Xmc4lxpLmwW/qQxJTt0Rri/MwcXsG4atV9cMPYB859nl4aj
         DJDl25gKd6lM8sHlGm/kMHU61qaikBllwWVHVX7gwIJn2Mj5RWD2C6oZHByZF7QW/XBR
         R9II2uMV3amsiP0wy0HGCp/nZlhsd32tnQjzVpEPeG5j1QDQglx5vRtcTjNZNIOS8GWg
         XSfs6Evwmc9fbNFRRJXHEU0OqmlgqCYpfbB+0Ze8rWWRg64Vud3eIXDiiTxH/ys9LEpY
         9aoorBUljvimR1D+GgOBx8o8mBCATEl8gU+0l9IbRWKvrFsZolSPdSHjU+xKi4Eg8UFI
         1l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647961; x=1790252761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=;
        b=wvuJI3fFEwC74Uj19StJF/6NzVuR7/mi2tjtbTxwF03xQykOzTvOiZXKjL6/3p1j4D
         pB21tZYUlcMQDfADQ+xFl/S4kHfkoAlgM3TvR9hnLPcYBhtfEz0YX2bb20yvR21PrZoo
         Kx4dXoI2xgrUFc9XYCwgFhb60tZDub30bCn2d56EVg+nh71I4lmXj7RwjUzvFr+pWB6M
         PYVkB3z48s149aQpj/gAsJaIjs4zD9JKnD4U35+IjzuTvcrs7ws9ndkX0Dnn7ihJRVIb
         MJkCBEEdzruwJ63SEXIWqSFomMvmLJkLN+PrsPmGWYYkRGbGrouX988U5mRcITqEHNnx
         Eqew==
X-Forwarded-Encrypted: i=1; AKwUvBwk6Gkw4YUCWTGAj4j8Hxe3FmwgFJUjyrxfDKpmnTZQlD4dOgMqPHeEvCjQEWuMauO0nORPjPkJEHOoubc=@vger.kernel.org
X-Gm-Message-State: AFuF++n70rZuLVU7y3VvXHgtm0IAWT4bIccAUrHOFBZeEMPYm69EkcK1
	lE696xnJMBh9gVaVsxxX7mojbbT0Osp0tuu5B2CrbY1+csLAobqMxTHUu/j1fqxJH1R+HOXeeZX
	kc5LgSJyMR+h1MRUgDODF2mkuC9N9INP9HwUykTUJmfywjTyh0JaJwhJRYpoD07MDkho=
X-Gm-Gg: AYBFou2zhFzFyLIoFM39M+734EHhrweiTI5l0IHUQ0cJSJenh4y3MVuVAz9s/sTdO9Y
	CuChXH/lWUBaWIZPgjzmczx+XzIldzvUiQMXX2NFk0yNkVI5Sa4KYWvRqngug50o24USKWtqTfp
	4VuyzLj/zAsFo72s1cRfcQp5HS9fNOkky5HZ+OR81dTu9fNCuNugU9fNsRvoF8s8qVqlgB+Ao2i
	eycL3apsKaZeGOBCo0Z+zpV4OKhkRKT+El/X5Szp8l8AxDDc0wu81kkW4ncGrOYtiR+vlmY3w1e
	mXTu3G81g55//xQGzuAWxiP5i9W825MXRsmL5b9KedN10HYE7nMfazAcu7FhySPSn8FaxP3bYgn
	keKZ2atvcEY38AP1glYwtUmBcHDNLNhoEItw=
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3dd5f405d6cmr15213513637.7.1789647960704;
        Thu, 17 Sep 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3dd5f405d6cmr15213447637.7.1789647960089;
        Thu, 17 Sep 2026 05:26:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:21 +0530
Subject: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Amj6aNOUQOMt2PsDq7bY3ArIqeV4Jv+WmJhIu0bjQSo=;
 b=SsfcGurVhQ2++NCRup7+VRrZzoT1bYUDFCnEceoW+VFkcwnP0tcCx8YGIwF7ezfxXzWuVt3YK
 SQ3lqVBUcl6Cv9K0Iw7Sqn96LoKPQ7JheQZZMrAjryZYe3GJQc1R7P4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 4ZN8hwrsMDOOaq4O5eas3voPHfb-queb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX1CxRH4EHLrNd
 P6Iyv7J4dKujkMQwNYFr3jUmxuaaNY9PcpgLMGyeRkz1abDKYAtirt5I/borl6NpqiuRLF/jbxP
 kdZbQdVrUHmtS1XTVqWLBYGClxaD32Q=
X-Proofpoint-GUID: 4ZN8hwrsMDOOaq4O5eas3voPHfb-queb
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabdc59 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX4xZr4dOMIVZq
 xuGUowDTmMtsuIdIa3jQOuBKPclr7r+uRm9iSyH2wYDfh3YFpfKRbWzqCHoLIIzJdExUOl3ByZr
 A1TyD6xNp1qOmanalastY6WObAX6qQSb9gAbN8yNu2WLaUjdJhuJ/wEm2UHbLDtbv7Dceg2RMZH
 Q6Vfq7p34ASFSWmNlmtMI9//ZHUmMblWY9VPhqOPnrj6NxF+XOyjq6GszS6py8vcl7kkqkrIRpa
 M6Q0H3Co4Bjz1hYRuW/+hXLAcUCCkp2L2LSe+6YRs3sskcSOR7Gwx0YVF6A3VrSX8FLtzDvkfc0
 LbCA5v02vWti4CU20DZa3OGkx5v3n7W6AqutvX3MvZjatKDxvr5ho+5ruiUfvvxtF5C2Jf06f2W
 TQ1O2tDumQzdq4bcKBxJrTcCkvDIKmL61CCOrfy91kpq0bTNZszwJBCWuBR0Xm5h5q3LcB12zCh
 wiElvUUwLiTEzZ1VGHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 74df5cd86f04..50fd00bc9f3e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,12 +1901,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
@@ -1917,6 +1911,10 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -2035,6 +2029,9 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

