Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DE4E1C71
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647964; cv=none; b=oWnGDtiBrlV7Em/QI6XnuS6ZTH9ss8CsH8rPipEauktQAVPtO3w8paDUTtRwuV5ar3joU0BAJMxyLlqSQEsldParxnbDkZUGH3anvrlXdx71Wm3MYwbXHdXFSDSTGbWPgWGEEYiHXKvMlTn9RIyJNOtSqvUWEmJGX+JLqIq0Lcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647964; c=relaxed/simple;
	bh=RkBUL6/jMddtCCTowqenCks9K1tq4YvFsGserCe4sag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jurYKPSQMl70Sl7fkfqnleDoz4BglgYLj4AalsSp63yQa49GyjDOlzHSK/iAV96H5M9CV76GXoG5l1UCCK89EVJ/0Fa9jQ1vaWX9byeMYWf6MOrRmDVxoSAiInRA2GoL3zhf0WeNpkyTpw+cVC06AFQ8cqNEw43WJKgj5oiR8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBVUPgXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw6aua43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBVUPgXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw6aua43"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0J7S1853520
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=; b=nBVUPgXOEdQnKRtd
	mvYfEWD/WE7PX9Da6bjUAnVtGtTCzz9/2hFs4X+zK0FLJAwFp1s6QKItGJLHBKuY
	U6JZauaWzz/CAR6WqIqTxvUtt0BSBY4jf8huA/+/rfDnSzWf5VOv+ldq/oWWYjtC
	5uSsQcJOEAUGTSsglk4vraJMEgoWBe34yufMrrA5ad6JsiI95msEBxudsYIo5DXL
	DlyZRKiwvbWrW0ntYPcZQxmzT4nQwIjyUiLFrpxIxM+VnolLN0AD0gumZpDoKZ4W
	mocQq29CFEfOES4I9hH9JE9IQOr6GGgd6ppCmebcHdzEwTuk2mC2J/uzv2XOX00Y
	ibi8fQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu403du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1126130a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647950; x=1790252750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=;
        b=Xw6aua43wZTYMwAX6HKC7L90Eja5qzrLeTpC/ys4LKtzLYxA6HnlcckATMtCe0c7Bx
         FMF/x+QLV8z0e189CCMpN9SHPFJCjc24bnk8FhtQR4XWUPijIa38JTQ0PYqxvGvoy+K+
         YkAi1fQVkw1qMThCCREC1cU83Xj4q5gJVnsdhPwHaYTu0eurbil11ohI+9c3y6F3Tcdx
         AElHgRc4x0SEYiXZfhcRlpYpO9U4X9BDwO7lhYc1brhaH2GLowKF9d6XOWLz3fjpP6f2
         hazprdWqubD8kiH8yshNDTjuFNCWbDJeb7ttrIq1A3dvk4k57+CjyoXZaLWS2+j7kbgk
         qP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647950; x=1790252750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=;
        b=I9xAJBpqY1ywVDbSoTCAWjkZph3byCdw0xIiSd9JWq+5t8RLEU0xtYWnqC21IQThNS
         Aug4+uBcDSiehrF5cuRmeg3dI7vPDJQkinKC2kDy6tjYh5O/XmdBqybbEPKdeYKIaEOz
         uMSe2MtKrNkEuDhQjM2SG79s4uDWich+Nl1hWZOk9Pw/od8267Kw3VoTO1waSgMxIEdH
         I9reJ1hVfiRBnLZL//IyuN21eRbV09DZIjuxED4Cd0aLDfeHXrie4ykBCWtLV/hNfkw8
         NGGUmXO63wZwZ+wKQZQQDyXruEzJGRqWVfr80OWnl/YRB6Dd4hafIKGxHRH3CvLvzxLp
         7d0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBFnmxFvnu/noYCB22O382n/QMTyCDZ0XVqW4MsZCt6wNWECd4MEK6g6AAxnuWEWluLofWzIwhZzXN6mc=@vger.kernel.org
X-Gm-Message-State: AFuF++l8fLC044ytKyVnzrvxPYehiRFS//TGkCb+wcyCwrkO5vEp0xaM
	ZKvnUy36ZTBJvdLwOvmwF/OD6q9NCf5vRtGOA4g9McjCu0LsF+xKtNe38kdqFiG1EEWoObQRp6q
	gxaTFDTUAsSNhq077SVrUsXQbMNHhg52etzZvf/sbXP7mXLNJ2RGDwtA/kcmjUeFyzN0=
X-Gm-Gg: AYBFou1rSkMBhIeZV0+em5xbqxGjHCgE13gcGIeUQ4dkeejggVn2AzqPjwo2YRe78zA
	FAqhcTs+k7ohPbMipzQkJafDdnQhUDKXt90lAS9j+Wl/7EBxl8AZUTYbY2wKHVzMD6W59mB7Z26
	Zt6tlYSW7uJ/q3MnKC2lLTlB+rWqceVS2dTOXqfzg1GMzWLpRaJVQCPrj4duc24/xCo1ji2dNAW
	JzJbok1Yzlcw3imKtQ6SlVo2nmSms7VrzZenfRkIZm15ruZzCUdqoI7OA3B7q7QUJyA7qyfHtC/
	JLXoCpiLX7pSQ52LVx93+GgMzX6P+rFh1rVQUNGcXDbX9+R/RcgEVQ4Jy1sURfJAvBvZM5EhhFR
	ZC2jQLM3RHwwzo9CMoeTSwCqFjFmQgU0EnVE=
X-Received: by 2002:a17:90b:578b:b0:39e:14db:4371 with SMTP id 98e67ed59e1d1-39e1e27a374mr14209749a91.1.1789647949695;
        Thu, 17 Sep 2026 05:25:49 -0700 (PDT)
X-Received: by 2002:a17:90b:578b:b0:39e:14db:4371 with SMTP id 98e67ed59e1d1-39e1e27a374mr14209696a91.1.1789647949211;
        Thu, 17 Sep 2026 05:25:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:18 +0530
Subject: [PATCH v2 04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2610;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RkBUL6/jMddtCCTowqenCks9K1tq4YvFsGserCe4sag=;
 b=YIRVOZ7erDCO41TihVXfvlrxWxWQsEZRgMtox8JK0pHgitPVoUkaCxQlg1usAgHl9fF5x4FbS
 AIZID9DrHk1CqllibBAzoleliZy1fdbmVbsFQxJCMT7m39SVyzJC4tQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: D9OPlkkckkrAJWOTWW9MRBgukoub5qLv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX0z3wZvWlbZ8D
 Z2emkYKdqAJQa8sTDgYeo9MyiV7aKoMo5EKltT8dbNxHBRxGeZUbq7nmWPAaMnBdQcQEA78/yFn
 NH7qFIt9188Z2JnR7y/QNxUx16E+p08=
X-Proofpoint-ORIG-GUID: D9OPlkkckkrAJWOTWW9MRBgukoub5qLv
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabdc4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX9EwPOPLpzWVA
 nae1IQSIlqXNrZmEtK19poWz+3fdc0BwrHYdNpRUj2qGslwAj/xvOelCGae2AwZZpEk9PjBqrFS
 zoWLwO3HjMJH7d2TJKmlP1fE43XO4zVr3zn6TZMfHNlnHlG7gAn0dM5uHJQVy0ut7SgWXGyC1/+
 xeDDB0CuLRT9ErXDfc6Y4AaIQq4eogRCM/hvacn4GPFj5CUaiQ04gJEFHTfZ9+YPIn9BuTQ+w/x
 s9JHkBeK9b0kemSBeG8NJluGUGRhiO1wHaB6DVPXW+q1w5NBYlgzXKu1L+fHZd7ROuJHNn1JlC4
 em0zQGkp+rp/RpC3a5fG2R1G9PVWpE1WhvOwSI09sKo3ELgIwH+GgGJDFPJ1ApQGfxsPWJSI4mQ
 LQ54c84IkkuAirAZyNGksKb1OmWz8SQJce6bnCEgPHkEBFbbDNz+Ye2AtA7bk0tH8u9hB/CWRHf
 I0byEWwjGinpk/iqgCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 7469134f42b7..cc04eefdfcff 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..678ecda1c99a 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1347,6 +1344,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1464,16 +1463,15 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

