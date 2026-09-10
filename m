Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C079486B8A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047062; cv=none; b=aKQSl3L4pkpF98ZtxlVkI3ZDAKO9kOY+Q1YS/jY3RdPyBkDCq+QwSWG7Yb2F218HZ3NakH4pkZ/0Q1Rq58FtjaU41mRUohYHHYyInGREUUkFgE6UqfxHPmDqEqXfKpfcdPXZVkYkybEnEM/1IrOvUV/02x0ROKkXLNOekbLX0N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047062; c=relaxed/simple;
	bh=5NcRxyQMNC/n9KrCwgmcLq3fNJGbmEydL9lOvw3xjYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYG1YrvhrzDviTl2Or3imXM9XmC/keuga0KzQGDHxhq7OHG1P3vH6vHjVEpriTSNJoOrTeZdrTf5Cz95icceW4a6FkmuA2JFFecCm6qdMGgTT/ptbkft/O+xxnfQNXeM27+MgPEPxPigpnvwdJGtGe7WITaQj1WYsevRZ4//aQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ8TC7by; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRT8dUkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ8TC7by";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRT8dUkI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ra22029909
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=; b=eQ8TC7bymBH6ccuW
	32J7Lkx2BfEDrI9vJ+7VJFqU1nAckUe/sBvBEEapfokMg3AxirSpKV4qcIQ9rcUA
	bL9ywTX5B1DR9Yum/cvxZ3/hCw/Fm8nQ/qxGV0idzJ4k1ZV9s6gAx3/IK0tw6R+z
	ZkflH423QVAgt1tBe9XlykFQ+Ww6EL5Q2fwNWV/npyDQiite5pj18fCwBnnG1oyL
	bHJVROiOU41AVNkzMb5YsHjftGpYA2M0pdo+L5093WgAmvx9+6913gKyxn/kpqQx
	SSNSHhwrfSNRj4hRml77g7FAEmSuZ+1SQT+rjh2WlM+VraUbSlOmkjaz7TrQM2Fr
	L4vysA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc0aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so3470346a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047060; x=1789651860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=;
        b=LRT8dUkIXK2iIsanLhXGtsRo6HNfIYa+oEPuAy9JGyv7esVLLssMB2vJT2kW5ukWVe
         agThSO6jyxxiCnnDQLoO4Eiflq018FmN4mb6jr99LtcqFWfNBw0LqapOam4R22pgO9Yt
         HnjoSh5DmH4+a1fR3Xiv8BPRWyCUyEvpkK2O8QENE0JYNQra/CR/EMMLM8wcFe1zBW+B
         TVOnhwuEW0dGl3fgfxhloCgQKeY4t9//w6uC9B75km34pehbFathPmZGzgwn+v5QYBV+
         Zt4xMW0/DnNy9V69MBxc7jKz35eQxQaffUADu1RpgQk8Lnh0Wsr/nbxJavxK91ODKX57
         EBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047060; x=1789651860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=;
        b=CqxGWDmJrDMfjkR4JXFh/Mu6jXMJqBF+Sb4S6mFjKeymzGwWsdT+GXJGPkQcFonowV
         tPa5YBGcLuKGegqnFsL+1FA3KKBQyvCTdNej70AyZf/uMH/F1BUykp2yxU9pfP9Zl51D
         3VO36Na7BiG01tGU04/UoKepbMD1/CkljDpE4aq2a9afo791gX+0E7ziSXdPdKB+5r85
         L0qwXgwliqTh7uApej+sr23Jg50nVClQ+DvHR2HtVmb7gOeEWuYvRO+E3djL1Qd0jFN1
         UH1uzDOqVsgk3r+qs4wnFLEtdrvlUAbAM5bniUnffFdf3dV/jo9JGRw8ZZ+9ykUl1IKV
         CNrg==
X-Forwarded-Encrypted: i=1; AKwUvBwdH0QFj5obi2iTBZ/YgqFs3Q9X+FWLOKU1JumNmBEGAHhI42mCvPZayoEro192t3z2wOiwdCnMVdpN5u8=@vger.kernel.org
X-Gm-Message-State: AFuF++nrQWMcP6klfJa2PUByqy7WgKp4DyL2ZizOgXGzShdugTvnjPyK
	HM9lNdq85B435SFgjSkJnoHfogq+QFF6gryT5JswOyorE7cBNDc8WzZgZi+WsUbm2CAm4r2TYpx
	UjWzBzLs/SJnxo3xjyM5uWSftpdPVkIFnfohFNYIWtf/Ywhr+73xy9hpjccvfA3ojitE=
X-Gm-Gg: AYBFou1LLiPaLVsRHPzoMKuWnB+hRSfbRaVYQe8xAVtTG9daqKi3kGfvKf7oJFVSPQQ
	GDoNEDFKf/2zmAO5L61yZNQN+N3BzMYKLsbGb+OrOLBEzcoQ3/15QOVZ71+yoj+MZOlrkOSXeh/
	2m+B4vlzOpHH0PydABV/Vy9EMHTsBFECBKvCcvRlPlU3a4mHG4sMbdu2h9zfM98ccGIA9sABWTI
	ohAHq5XwQ7Yo0uX2IMpc8lhRzvFiQI6nv3BfQZH//1flNzWzsUP3QURPK+lM1s3JQqLWUB4JRLs
	fbSpzfwB0e19iNGYaATWDskgUjkvt9WTLHB47PDRXJvZbe5CRFC5nHHPJh8B7kbveQp+GZpu1q5
	oFA/X3yX8Hg+Wc05DoAsReB5IGhUMijXzklI=
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr11793971a91.24.1789047059986;
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr11793885a91.24.1789047059498;
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:15 +0530
Subject: [PATCH 26/34] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-26-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2177;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5NcRxyQMNC/n9KrCwgmcLq3fNJGbmEydL9lOvw3xjYs=;
 b=//GVFcJqTez42D1SmXL9sZnfMNny9/xBtM43OIfHsEDALOA+4PoPPbJQXQnxcVIp8Pw7DA548
 W1Fih0xkxV1B7Tp8zjCLaEdOWD45fEhT392B3OKZ5E7yp3sZV/KCU4T
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9bbnYEMH7p4l
 XwtTsOCwSmM7SqYbGZd0qoiSi9eiwBSphePGf2gQxjpIW7oZBCKmHfSwRd9t8ISxy55mALqBwZB
 p7PyF3rGvW3kyid+WZVQInzs7RJPtSao0SW2iMq3W7bLZfSst0c15GwETH5IYfRitEyF13Jy7TV
 wmh95pDzQMBcFrjT8C+ErYvciDFw1nPbsbIWMIKfsxeDYyIHWxkOfZK53lCyDHuwwDYV1ZkFw99
 tH8Q+WlCWkqZorcUFoDJ90+H6IxHGzXuVkx0AIAfVeKsZshCyMd/AiPbd6rbDjwGWXJSOynBKyK
 eyZbQij8NrESgDzAWRVxGNu9rfNlAJMOaCt9Tg8Mlo8RsEGtdaSGKunjEUJWDxREkEzegIsUdNj
 rub8bjl+SsJcDv3Rzz5y88/Me/HDizI8dKR244z2mtXjpIhr5X+xZg04RILpgz30g9B3irZSPl/
 E4hmIRJ06eqU03mKVFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX/ot8FRDLWy2g
 dHg5H+OZ5p3sQdZVmUot4t0rDiSt8iQSeI0QyB+ZFihExxriYDw98lO82YVxxgLa6ti4uN7vNFs
 ajlcJ+y5m/5u6j8XTnRFuRGR15ZwhQc=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b114 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pKPQ_GS6EG7XX3aqhVJK4tYu7rFxyMec
X-Proofpoint-GUID: pKPQ_GS6EG7XX3aqhVJK4tYu7rFxyMec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 74df5cd86f04..d75f71463287 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,22 +1901,20 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
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
@@ -2030,11 +2024,14 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
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

