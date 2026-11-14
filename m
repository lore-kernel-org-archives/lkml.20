Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655896;
	b=NIGujJlHEmiPyM21V0Q2OO7/9sNUMVkCLRL7vdfz+Y4CeQOm8ilJKgookEtKZWaAnyUq
	 lL8DMOd8yFhXVoSHgSHlyUDMsd0lIH7JEKIdSOioOcNowgW/1GNsAQesr449BHZM7ApEd
	 b0qs330ZCGgAIG+PgaQSqa/H0rrB4JDotwoC76je9UbKccIdCXPwzmIfNgz2QL3AlZPkA
	 AdLmANzwI0u/4v7xssbC0LRSrpqT1fFwNjY1CMDo3zgO3NwElReACIKQzQKdRWse33Uxh
	 VTzfOclcLwnHz7kUr7P7/j2PiKKvg92qyfB8LdgLtlvZmhgQE30ao4FC7JPX/ZpO+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XMNu1kFCHXFN4FE2hCHTEBumC03iTtNlb2/XhlUGlQc=;
	b=jpmk8NUYOSyxUIfKmSAnFC/iCmaQteAoLcB5enxFO5rlci72ekJw32fTzETqc6U7NcQj
	 SCtXIgz1HDNMfzujkjo+s8NVu636BY/vWQWPIt/01acgo0AJD9eRh7JFnjEEzI6Tc7ABn
	 qNgIb7k58iIM9BvSek+gUIuufzI9+B8OQVkSE99yhh48q64uhV5proqHgA33nvAd2ocOe
	 +2WbFDu6lCk3IxmRBdWrgLdq9GWHX2dqz35LEV9AbQzJq7Rdc1aNetdjGzw1TGQ64RYu1
	 56KBrQIYiPWE7DLaNvv49uznJbrCM6VWda917VcYxgZMJ7IlDKeNifzMzMPClrk6kUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihiTqaxe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfGTwnjQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D260606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D260606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihiTqaxe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfGTwnjQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wWEV2710416
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMNu1kFCHXFN4FE2hCHTEBumC03iTtNlb2/XhlUGlQc=; b=ihiTqaxeXfnFk6Wv
	gFUocX9CDqm79sdfWMvi5g1xMEuoj+LgbsjavZtsY3mma3qo7L6rw9xhZzOjiUe0
	58zg13hGcH9r0rcCPSkZlXO0ycxi08p66y0tCOqtDE64Kv1rSGeGwTTEaOCy0QXZ
	lSY1FjaPHsVzNCDCg+rlE60y/ebUa0X+KCKs/400mDTLmeoYT9U4yJWk8oZ167kL
	3/Mtr6CShLsL6b37Fjhq1jqzA6pqCZfxj94OS2iHb1WGsknU30Nj/mHFPThUhRC0
	J3fYehEeqIRc68jH9SIqEgTLgSXGB3QmuyRp4Dk5S49rf6FTV6O6gt/rEPVprAh8
	ETLfGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgmbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:31:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2c49c3d9so814561cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655894; x=1795260694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMNu1kFCHXFN4FE2hCHTEBumC03iTtNlb2/XhlUGlQc=;
        b=hfGTwnjQlAQuYYqjmLZmuOBOb/WQ1cDJCZglyMtWvs8lgpKUwit+oSOxxWfmF4vUTQ
         9CqD5ZYgMOeROA2rCxIrBN/SeEWxx/eoB2c/TV16vniNAHJFe7NrRPd9u/yVdg9/LzBi
         vg9Ypk5KqZGb03NvTXZeIBqoz5sWnODvXMS2KD5ARYsJYWyNWkXb553kroy6yA/FGbVo
         PLduhSyNDcMnj5+yq5F9mrEv9ybJ/dLgOji0IV2p2e2HzsarU1mW4jHDx2KbFfJaRRfG
         Jqa4iG6affX2cM4dEkXXJRIPJ3yex5yT4NLH51E3Q3hbL+MYFT+dQMV6fNpJiFVvB7mQ
         UKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655894; x=1795260694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMNu1kFCHXFN4FE2hCHTEBumC03iTtNlb2/XhlUGlQc=;
        b=MtY3TeY2aEHpbVIzK/+gB2y/iZ7K43XnNeB3Sl3iYdKQcPdmc3j0QMTwW6yZ+EebG4
         2Li4Bei0FZMifyEtR5VkEyC3aye+MZgAOqnv01j0tGTqvlGXNnAGHFYr+FMHYEYDeUPy
         OLWo4qBAKQfMwScc4jemAA2/WKEgjK8nYppjlRLpb2MtDNtQ41b6ioOxqe+ij1I4E+tx
         x6HyyV/JUApcwoVaAKl0mTJKp7GRu2ljFZhz/wrkIBpaddFRtD5iJg46VBedvwYSo0Q0
         qx3ECCbLMInQqTzq25n5A3mcuR6dfwMBognsKwUoilyvMKOxQRf0+aVjM4MQ3bMED4qV
         iemg==
X-Forwarded-Encrypted: i=1; AL+hErFCoTNJPMI2rJBZM37iMnAaVYKp7wYzBrD+oZSbzxzB3T0xxMBOjD8dmfTX/KRKd/P+I6OdTqdOF7YbllM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LJKBDOR5DHpX/ChmIHUHQAHDu5bEAsj/BITfGngPC6Sxfkryi
	fDGQzHlyYGp63gHocstNxfaZ+HpvUQNC1dAwwp6wk9xi+xzhZhx2Bc4myUHt+w7FKty6ZRwY1Zo
	dFWfUQlCjXKCmkbtQvll+o4QUl/nTwaA4uK0xSNSC9mnK+j3Nh4ByMH5ueelfKZji/6U=
X-Gm-Gg: AYBFou0HvAVk8B+jUMDFVKK6enPpRWPNZWfOO5TjUZIOcfBr4brfeCdTIun865Jz9OK
	BhkA9k6R3MTFEBJ05HLNFYeZ05+xrbasjA1b7+keNJfQaIRnW4Hj3khGksviZYK3tqPwaeXtheP
	lp9BbZ8cu+g1DvgXztF3blHlyHEuc3zrwd2aouJFmhqOE8+7bo3q+QW4VRWfs3DmdS1ToYvStds
	xK417SiSPuqUB8PwHg4BhF87BbYNNvfpmIiCOIrqt/BTOSo7B4uLIdwT9D9dDUYq0yzRQ2CjoR5
	OZApTyXNbADkH/CoNR67qOnwNLHMZdYgk/T/xrLdbp4IlAcVKesEubL7dB327qiaYhaMIzIerdn
	aRakWUmXD3snka53dHlh0V7ofUqtaogrRtiJ6vf408TD9kLI36TxrsCgarGepsLpu/587asVJi9
	4bggyWEux8pJy6SswHiAJgk/HhwI1OX2IJJ74Xcwit
X-Received: by 2002:a05:622a:450:b0:54c:dbe5:7246 with SMTP id d75a77b69052e-55ac7b568femr80879561cf.18.1794655893703;
        Sat, 14 Nov 2026 03:31:33 -0800 (PST)
X-Received: by 2002:a05:622a:450:b0:54c:dbe5:7246 with SMTP id d75a77b69052e-55ac7b568femr80879191cf.18.1794655893202;
        Sat, 14 Nov 2026 03:31:33 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:31:32 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:29 +0800
Subject: [PATCH v7 12/23] media: qcom: camss: tpg: Add support for v2.3.0
 TPG
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-12-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=4725;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=nolSV4femI6iI1LwIGiRAt49kcWhSpUec3QSmHu1xS8=;
 b=qZJ3R/VU90xq97oq48U4BdM2j6J+JUPK9vJ+HiJdPG6j6Zm+DaDzz9hBWmYjF98yvKMsLZrOE
 dXaAzXGXKfFDMwfnm/h3e5r0B/T4y1cISDhOFv2G4RUHzV/bvhLT7ra
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: sbpZOu9FTr2cGOFb7oUggf59DQKVrWgY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXzB2YMYF6Sr+B
 DmRMsh7k45fCTDGcsptCTeDQuRirr6H7Vpebezrcun+LnXiWHgwbJ3PWO0TAaN7OBuRItQ44VMS
 fmMVxTIfONF5dGDU9aOzMe4yiAcnq9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7IXbZowNUM7w
 0iy11CtCQLgGo3qZCgHjkxDGtaxC4SYyL9oC3y0Iop23J6akaL2pKXfXYf9doR1AKqZCftWdfNo
 Mo2f0y+N1G+kK/W/lhWNOAvEISOMGyGoqAxLmIdiDVO50YTAajkqSk7bisA7DjhqTQwR5IxO1xS
 m+p8sVliRt8kj63DT1pYK4nOomWPJhBvxe4JDGLmYuYG+rIKmbdKKCRS/LnYz5qBmsf2fRwBlmb
 HCvHJL9i9D4j93rue9hm2x8zIhpluSHOtoSPVDdtLMBXY6dz9SIjviAGpPyAQbgo+Vi9oXZED1H
 PIq98dDZ+PYL/rWWS7L8i/T+ZGcA32FLx35ZPhtCKf4GGx1xZTnrNtzi7VnlPVdCa+flwFBj8Zz
 nUCrACeb5SwavbD+DiD0Qg0Oo9v1jQt/Ycf0mKr2LLEgcw6zruRif7Tdc3o12OBfU6b6d0F4ePP
 aJRYV8iUq3SaGS7GvMQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af84696 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A0A5h1ccE9LH-sW4MsgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sbpZOu9FTr2cGOFb7oUggf59DQKVrWgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the TPG on SM8750, which uses hardware version 2.3.0.
Its test enable and reset go through TPG_CTRL_CMD, so lower the hardware
version gate in the TPG gen1 driver from 2.4.0 to 2.3.0. Older TPGs keep
the TPG_CTRL test enable path.

Reuse the SA8775P TPG resource table for SM8750, since SM8750 uses the same
TPG register and clock names. When a TPG is linked to a CSID 980, route its
output into the CSID RX through the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-980.c | 16 ++++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  5 +++--
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
index 713db25cd8c65ed7e991bffbb8b19d66c662e708..38cbd67d355d0e7bc683cf5a9e521d082c479d58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-980.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
@@ -6,6 +6,7 @@
  *
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -67,6 +68,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			(csid_is_lite(csid) ? 0x204 : 0x404)
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -195,12 +198,21 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index cabbb2638cf38ddfd333d2c2c6a04984f223d66b..1972423ba41d9d30f5b00a08c1b4a07ed2a0e51f 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_3_0                TPG_HW_VER(2, 3, 0)
 #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
@@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
 
-	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+	if (tpg->hw_version < TPG_HW_VER_2_3_0) {
 		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 		writel(val, tpg->base + TPG_CTRL);
 	} else {
@@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+	if (tpg->hw_version < TPG_HW_VER_2_3_0)
 		writel(0, tpg->base + TPG_CTRL);
 
 	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d05c0f965f01ce02a91b5f8dbd58a43ad9691019..de22ff74c7acfe912afea31dabc1ecc250b022b0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6230,8 +6230,10 @@ static const struct camss_resources sm8750_resources = {
 	.csid_res = csid_res_sm8750,
 	.vfe_res = vfe_res_sm8750,
 	.icc_res = icc_res_sm8750,
+	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_sm8750),
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8750),
 };

-- 
2.34.1

