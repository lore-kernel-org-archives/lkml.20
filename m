Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA5494804
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047076; cv=none; b=tBHNkdxJhvtfzXFoEooTUVAC8rQr4Kc0D+dRGv+GVaSCWS0gBlh4skE9oqE1JeDliCN3iI3g4qzLQJ7Y9CuPXBHghwasLR+QUtlnHVN0hGWVwZFOxCFCIoUgeeuSzqozhebktLUE3qcUU735S5pOE84EoME6unYH7dNT8lhpAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047076; c=relaxed/simple;
	bh=2Ya4qSW+ZymCQPUetLoEChOoum2j5m9MBGPGrXZXCdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qn0ljleocslu1rHSlBX2a3OqBwuAEFiqVJxN/FRfaUyOoFastnr+DBoVnBAxXJcYlzNeeXv8rSQYKRHCJIsvToiPxowQ6Rvy/OlHHAXJK1KZsa7p366nOxaCN8ukJMzTSl8KU+21HVJOv1LoBzGZR2+ShjN7Q0E9UU5PC3nUbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gbjv3YBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJvNX9y0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gbjv3YBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJvNX9y0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7h8Y1440556
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs0hj1HZs/7poU0Kd35/1DcL3q7Lr1DBPkiu8XOf8QA=; b=Gbjv3YBoZPNO4GW5
	FwSvPcUfvvqR7Auq4XbvRa24DUPABLJrVHf8jQwgPr+d7QIAsynPlr8qcOo0ZBW/
	ZQGSIDGwL7/GJCkzT/gJalHCQtxN23rO+0zBTHR8cAGnppd73WATosbzpR57MHDh
	/UL1N60eLK1wl/KFHRfDpZpEV46m4SjKYgopfpLo3jirWUscMg9W/T/sP0oHkErj
	EsjGOI3qHVNwYI9UGzYq6odLXsZwrk1QVOgNuCHPzYX+uC/IuPDrgI5OoeFp1RoX
	5pcZxNBvVdiJPasIgU9OTfX3lkgxbgKDDW7FQYJqT3W+VcwP3YMGAgpvt7Uu/4i0
	Y3vgOA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f66ceea676so10456841a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047073; x=1789651873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bs0hj1HZs/7poU0Kd35/1DcL3q7Lr1DBPkiu8XOf8QA=;
        b=bJvNX9y002QifgP5YvDqSnueiv+gCTRTt3+tU629hBraMmJASXglwqZkL17/AzJJCJ
         xAGKhHnnuCOhxsYhdjAkCZLw8behG77sCPigyBWEphjkx+6q1Vxtz4TMoXJX3PRZqMU3
         WvkeikpuVE/seLNTypYSXbAdQ8otHCB45bS54GeYxt2x4FgjJElMDTTbzJwVDIaVyg6Z
         1ivVRbACFHnDKZeKVHOxubv9k7F5R1oSHY6+B0yuhMx3wQx0Z2Sqm1G8LJx9Tbt9KXt1
         xFqKMZXFMfXDuLKQNzB9Bho/WlF3xt01hAtnCNb1CF2T8wsuykgPefzppz5L4HZ0QJS4
         FIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047073; x=1789651873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bs0hj1HZs/7poU0Kd35/1DcL3q7Lr1DBPkiu8XOf8QA=;
        b=lxdh1S59nqujHLZUxg3GKyVav/ol8m6nJ+FjBIdBWdAS5AsDLkyXCEy8xQuFVgEKYq
         0m4hoeTbv4HDwdFXSdrgUHyYVPICsqbpNr6JSKdA2M8yYrUlaswG2riaKRrL/Efxr1ep
         JwUT/YdhRyQhmrmkTJXhc3Wx9rxmqEjpWJznBWVOnvT5ELlZHrW5mf4pGDShfOORU6iL
         cjhzkbK4FoYbc3PaqlUTl6iVZtZDIOUQZLMM/Zs87NQ62FAcQUsmmIYZUI2v6FLHUJvI
         SyidtOvXJCbEuo6wIAno/Xepu1v2RCPCkCV9UKeCqNlI7z/8hTLTRkihl9l0NXCkLQx0
         LIOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk8X2u/ZuznwWJTLu9rwfbXR7xu11TuK26p+baobejfpHu4ZpAxG99UHLdz11YxGVb4oB6pQjGm1dU/OY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrJMICG1yMcmKtSfTStsGdQWAbT7cpN6KlV3zgFLFaAfmaKYS/
	vIq0u1n8NApUAZUBCol0o7TL4A18SXEuti+T7N2g+WcV003GgzL7zIn2qayxag13DSaMci23CmT
	W5tiToUizLSMozvYzpC9c07D/dI1L3Lh/8OS2OrnQAmbiu98h5A5qr+kgsXOy4Bv8obA=
X-Gm-Gg: AYBFou1KsHO4HzU//C2HeeUm9/06Gsv8sCQerP0YdgkJZibVgYpYuZJqf3GUTHAFxlW
	NWT7XrCnCPA4CpmwmtoF7tlHk/kJ2T/82YgnBvUjn6o2DxW0KzMA5R56KVuPs6d9tpxKv1wWaSE
	qMcOQooSNWcC24KECmaGV1Xu2zYD0UH07HhdaL73vDERlt2k0Que6KoqKiDxw9/d01H6GyuKSjE
	drDMv9pbcg8srWXhHi4VhoKvdBLX4TsPTYe/D67YIGQXQEFg717QztJMFxiwKMH3hOeBK8E2Cnx
	PwQipZXCCP3olfqFZwuRY3yeG36hrD1s48RHz58hb4avyZtVTj839XcIJl/mAVKeOSSM3NXvE/F
	mNQ/xzbviTY97eHycFsVMP4Zf0XlKNCEyIY0=
X-Received: by 2002:a05:6830:4ac3:b0:7f4:eb76:881d with SMTP id 46e09a7af769-8020daad7a7mr7152672a34.5.1789047072695;
        Thu, 10 Sep 2026 06:31:12 -0700 (PDT)
X-Received: by 2002:a05:6830:4ac3:b0:7f4:eb76:881d with SMTP id 46e09a7af769-8020daad7a7mr7152613a34.5.1789047072245;
        Thu, 10 Sep 2026 06:31:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:18 +0530
Subject: [PATCH 29/34] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2219;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2Ya4qSW+ZymCQPUetLoEChOoum2j5m9MBGPGrXZXCdM=;
 b=rHGopNFKvYT8k/BQr6ksjW9m7bbdlJIQvvD0iMuYiD8KsKvdzdgDwMsx3BZPT31KWjcsSsIqf
 N9IBrLkdFskDFoDk4LRdOuegT7IsCqTCV6+vcNWtt40IKEt10EbMIKF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b121 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX0azOtuBjY6ad
 4E+uxfrUWhTuQayJYao1T98FVehz78fZsThrgPeIw0DD2FqBHYJEbUJoeh48hDttORskFr0Q8Bd
 gTOAvo/Eta7ycrxCztD1UaYeo23XJu2BGjGfdruw7V5WA4EnYliky5cevO+qhM7ecvXFAYu48uB
 i3IsoeIqaGlwraGv5wqBW1PgXucCN9hfMiZua0h5tF3GkGGjMxSyabHvrRskwXsJOmA8vVwx49d
 1EpKCZWluCz46yEfRKveE3yPeHDoZrE+gRO1eAGAJZptLGQmm5Nc+M3s+wwFvwoiiwQE+ZS6iAX
 LHd7gesxUkDDnDaFRe2ICV+AalKhn+kjvFWkDIt2ibmwhqxc6RrQg8HOrWiQEV/GDyj28xCMzED
 xpzyFYj4Lat7kVLL+usK7uljcYMtLQmpCJPG41fFlxSlDUci/N9rR4Zgc5FkTY6zx/Qo19Kcc9Q
 uB9Xatj18bMaw5QWNkg==
X-Proofpoint-ORIG-GUID: oRAn9rK1vanktgZoXAUqqAziKlWRsKqy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX3xFWMZtrdhVQ
 cVxbBkM3JC4QtCWXqG1iWgWFzAT980lCVHrGtFpwxKiuM/IQ9NFA8LXv5WPWv4OC7RS4lCfMSpd
 22zxzWHchFVbLTYnnD5W9KcZB09+kdU=
X-Proofpoint-GUID: oRAn9rK1vanktgZoXAUqqAziKlWRsKqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100162

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0, allowing board-level overrides. Rename perst-gpios to
reset-gpios to match the binding used in the root port context.

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

