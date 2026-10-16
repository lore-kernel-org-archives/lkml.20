Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A9249BB7C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194918; cv=none; b=qxjNI5FMda0E8nnPoLckgWneFzWDq9I+PRwyqaOSGLIqMFSzfUxHU7VUbswOMGdtBs2UzcERSAJVTTb8UTCMOwpjE2el/F+7t/JxfroeIuJsb/LDtYZhyhSVYAtd1obusENcp7qjWOh/0fGBDK25XaaLOoFa++XoIN2/f3MhdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194918; c=relaxed/simple;
	bh=rjEkRXkDW/NeUBEbcYsDj43bMOc3+anYQvHIF55fi+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z21QWx/d2lPp+s+4YK/kAz/XCdBUwm22WIxOY5NMOwjtweU/RA1Wg3D1TXfgrHbErTp25QonLOI3XiPWlaQlnUevppWQmPMtoA/bxdANaQzRTl/qo2khD13GYrsddoB4VLYJfurfWrGptxdHe/ofkGtU2YvntrBYDBvrCjTuTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrakSfxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCVqB0Io; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrakSfxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCVqB0Io"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFEIN3664260
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TMK2D0Xsalq
	35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=; b=PrakSfxGYDF+3BpkgJSkVQcY2tN
	sEAvw24p2OyunXf86jG0g8t/lvVBKXpOTJ2LCavjW+f48db6Gl/meJmfxMY2nqqu
	HVzbb5kO4oVCFX1th2IOrzLkm3TG7/OdPM8svLCpWjGLg8giAnJUWow3AJiIEfzE
	3fpeCgA/nCc/lKlBl9nqmYfsRJG4BUHKxS/v1lr+ewTBnp/afWIGirYyIRojjo3f
	w6ytzjkIApPVeZ+2cuTlWTmxuQZlKTVtR9t+SmcG/MpdxFY4eiG+VaT5VCvi4kqv
	IlbDjbbIq7xcgCSdlLXxwaBN5fXHEFHJbkSU9xFKLVUSZ1645MR6tAZJOyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwms1a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so520972eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194914; x=1792799714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMK2D0Xsalq35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=;
        b=SCVqB0Io0qBVj6E5dRPLGf8npys/Poexhq6t1x8I40VCqdRxL4+xgpjAge72CElH1J
         9S0UyoeCrOafn5tHmcyAIW0MT/XkePn3UWn4M1Xu2dc9VFKXEARNWiDYn5XH76i81YCq
         QWZX5S7nPxnQI58ZHa10bXc246QJWBgmYaQyNPOwvZwlCJXDnd/j3GGeYC3OdnAPZMZ3
         o0PYWWp5ffg5RSOHBr9mHHkMjcpueqioXdkl9UkYE9GIjAJY83uI3RyOsXsadaaYfIa7
         S5tI4dmQDs03ehbVPDadbl8HHKDOLRn++gh32l6kbCObpTT4pTPsPEWFQnJl40PjydS2
         nf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194914; x=1792799714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMK2D0Xsalq35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=;
        b=sP6d4cWUVeK4kkblmQaWwspQOvSu1R3rDiek5wkyWdzGJ3srDsf3eusHW8fkjsYOGe
         HLL5g2lM6AiXo/JET+xc1vlXjc7me2nVapyssoL12XJsMQ69/RVDssdNsbax4zxccl+a
         1zEhXcYsPoEp1rwB6JCl4w2oPLOWWGM2kOS31zdtuQV6EISq22KOaUFNrkk7VqRY3J2o
         bZ6t3pFcq0R9xPo7iyiO+VKLC8Pq/0ZnUOVFLf/8YN/TYAAlGk+D/N3PcaA/Vd6fEKim
         E+isb2aOY4U51UWp408dTbiZZUczSOZKwDaNNnec7z4PTTv66OOEy1yET1LoIQ1HObC4
         3TNw==
X-Forwarded-Encrypted: i=1; AKwUvBxKED9m08tjE8quudvu78p6rcJun9NWcs5xAW9OJMGsHE1cBpHBir0wk6wX+TVmm8HgRmYxWRb6QaTLbUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0h6Bryt/EqHg7Lg9ZRCtIbvf1PxhdocjjEUcNgAlYnyA6Cwi2
	ccGh2W0sebSP08exc45KaoFOl/BcKhdlbLNkFogfwbqqTWFRigsZM89b814XjVCtU8+w/kyU9Ls
	rP91Phstr+3weva+c8bmF4pyj1MiTPoFudr0GIm3gJMM/w0/UlgBOxEReGxsWWfzCU+U=
X-Gm-Gg: AYBFou3mEDpTobotclAqQkt4sJ0dG4MYh5L5kIBAfkpMon2wRXCR8h4VFTubg3dJqel
	crdiwyWTACltw4REOeDPjHgXHyOzlVI72akhIUo8oCNMxtt+4i4pjVkYvR8qa6+rjtru9UsmaxM
	w6llkeJHaKavnr/iMg+rlUXkyxQ/uLVSne40G/mdsvMcCYUlIwyksUf0eoDUwuR2SrMO3qUUInL
	vhxmWY7wmVjivegZXHLu3UxTbATj316sNfjGwN2A72yubidxgZ60QrV5psMS/n7UCiw27Sbw9Ui
	YRWJysClEioGW9mBbYOeXb5tfqQwsQa9Ecbh04RBSiEUm7Fnd7tpbvlmRiY+hv9vB/VqL7emhWx
	A5xmAOxmPg3ECHTYq5qnU5c2kl0ybelTLn5AIjzuj3CV8j6lWnFMm1Q==
X-Received: by 2002:a05:701b:2908:b0:176:2095:1ac4 with SMTP id a92af1059eb24-18512579547mr1437655c88.18.1792194913866;
        Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2908:b0:176:2095:1ac4 with SMTP id a92af1059eb24-18512579547mr1437606c88.18.1792194913104;
        Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:12 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] phy: qcom-mipi-csi2: Add sc7280 D-PHY provider
Date: Fri, 16 Oct 2026 16:55:02 -0700
Message-Id: <20261016235502.2274268-8-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad2b963 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AWjmOwsh-vm-DMLkILQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX7N/A/mH1ah1x
 Zuf6YR7bh/zHyLIkp3yNCICjPJKaHOLuP6XBH0mtvXmp7ewGgl8Mhi4IHEe8vwifizFGF0bqQ0U
 uhUJwKg21czuiYN8Tzqv6Ch8TAV37/ndxkoqFFxlVToNHJ6f8GYOfcipqjgoFP1wxwC595NL+bQ
 O7yTY8QR+zePAG7W996HxqzctDhHPA5eX0AizJmvE8SqXmQd7qVZSlFVXRST8WaiEwFthUy8h2Y
 IB7moZbIG7GQvum5lJ6DgHkoNIwpR7uv1nCd6vV35U4HwQtA6tsCeLfVsfKLwPr/odCHG2MIh6x
 z0469HaGytgrk/+JYios5Kp4wZRSNakLIeZWPMpmJYwztgePRNDTzgin13w4j2+XPo65YUQC2cW
 Vd7I59IqIKZyKG7a97D+sHA0gOvcSTdHdZ+Um18PADrmO6wIDHfcmf8e84QiTQtvTNiYSwdJMJJ
 P1vtYB2TqtUcDHzmTuQ==
X-Proofpoint-ORIG-GUID: PZvlqQrRg0BPoz80IJL41_TNyYBmRljS
X-Proofpoint-GUID: PZvlqQrRg0BPoz80IJL41_TNyYBmRljS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX4CjmY3bZdjbn
 ma1MuSMzbFr1VErb7pBbf5YOgbP+ByQPeRu6sZPMpe328XhHXjw0q6qgmdYCHbrMhECzTsQOeim
 3JrCNadanH3o6lNAWpB58Mg0IdyhetI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Add the SC7280 (also used on QCS6490) CSIPHY to the generic MIPI CSI2
PHY driver, bound to the new "qcom,sc7280-csi2-phy" compatible and
reusing the existing D-PHY 2-phase hw ops (phy_qcom_mipi_csi2_ops_
3ph_1_0). The lane_regs_sc7280[] init sequence is the CSIPHY 5nm
2-phase 2.5Gbps 4-lane D-PHY register set ported verbatim from the
legacy in-tree camss-csiphy-3ph-1-0.c table; common_regs_offset is
0x800. A new CSIPHY_DNP_PARAMS marker skips register entries the
legacy table left as do-not-program placeholders. The soc_cfg
declares the core/timer clocks (matching x1e80100's and sa8775p's
clock-names convention for this pair) and the vdda-phy/vdda-pll
supplies.

Like SA8775P, SC7280's CSIPHY has a single power-domain, the Titan Top
GDSC, matching camss.c's sc7280_resources.pd_name = "top" and
kodiak.dtsi's existing camss node; it is not OPP-scaled, only kept
enabled.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 139 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 141 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 85e89235f7c9..f3d67d75105e 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -43,6 +43,7 @@
 
 #define CSIPHY_DEFAULT_PARAMS				0
 #define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
+#define CSIPHY_DNP_PARAMS				4
 #define CSIPHY_SKEW_CAL					7
 
 /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
@@ -258,6 +259,9 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 		case CSIPHY_SKEW_CAL:
 			/* TODO: support application of skew from dt flag */
 			continue;
+		case CSIPHY_DNP_PARAMS:
+			/* Do-not-program marker: skip this register. */
+			continue;
 		default:
 			val = r->reg_data;
 			break;
@@ -495,3 +499,138 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
 	.genpds = sa8775p_genpds,
 	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
 };
+
+/* sc7280 5nm 2PH 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280[] = {
+	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0900, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0908, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0000, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x000c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0028, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0024, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0730, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C80, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C88, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xA5, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0724, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0230, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0200, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x020c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0228, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0224, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0400, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x040c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0428, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0424, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0630, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0600, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x060c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0628, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0624, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+static const char * const sc7280_clks[] = {
+	"core",
+	"timer",
+};
+
+static const char * const sc7280_supplies[] = {
+	"vdda-phy",
+	"vdda-pll",
+};
+
+static const struct mipi_csi2_genpd sc7280_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sc7280,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sc7280_supplies,
+	.num_supplies = ARRAY_SIZE(sc7280_supplies),
+	.clk_names = (const char **)sc7280_clks,
+	.num_clk = ARRAY_SIZE(sc7280_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
+	.genpds = sc7280_genpds,
+	.num_genpds = ARRAY_SIZE(sc7280_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index cef4a90ca539..fca67d3625b8 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -455,6 +455,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
+	{ .compatible	= "qcom,sc7280-csi2-phy", .data = &mipi_csi2_dphy_sc7280 },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 5578741c0930..e2a346bcec89 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -97,5 +97,6 @@ struct mipi_csi2phy_device {
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

