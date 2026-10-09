Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF424E1C75
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553857; cv=none; b=TB995VBO5dXGg7+nC/9ELZu4YCRp2bwbyFFUtXPnu/WKQlXBVrFPwDbfcf+S4ssDLppnYImdahQ7Lc8fPDW81CZGLK1RO0dv6YGp8XzwRbQVvMcpDCXLZjz4TxCAYXafSZSG2xL1cIvLwPG992Cqfe8ceYtkKT/LTQho9OIhJpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553857; c=relaxed/simple;
	bh=6vr1l0zbegY6Y48Goh0CgOxnw56JseVU40THCRas/tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4jMJXvl7aiPLiQceE5lBRK8o3dMI04oo2tYMmSl46KUulTysnorcCJSIM/AM9mX8sqbuT/fwOlGTiIQiWjDU1FGgMGBWFZ3QmZIcarIp16sPCmRqe7kYI6lmZGEzZY+ypHYeajeU0VK8oXYCUioRHwSwjrrQmcLYc031XMT9G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjcvu9Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbUKSNsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjcvu9Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbUKSNsJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKhjR887558
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=; b=cjcvu9KnBrWzPntj
	54aeOgx7HockMp9AdOqDxBN7oA38D0Uc55yE669DBX9aOG15dZQ4zVSp4sC5dHQB
	nYZ2+NfplrBlQ5t+/9y3j41KbISW/noECrIQYBce/kjARYEBi/ewAtV7ZEVNeMzX
	jdI9R4nYADp8F3icQTGOxzD3dwH1Aaoax8NF+cwFtk03xbMDB2SjjEB7KkV4uyiS
	v5c9Q0fALQ8xcDl7JmBJh75APwJbVQ8/Y/3pkT16ncHGapMI33okY4uyYjwnOG0x
	FHMylB4wInJFXlvu1PKA3yZTJl6HtnObm/1QHZIwa08UdyJ5c3lBI1sXsRzW+NWH
	Iaz+cw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3s31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:50:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso15388425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553853; x=1792158653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=;
        b=UbUKSNsJ0udNxFRszIVkSLeZw1skKUIKiUn//o4kLzqScvu8UMXCNRpAqkEqkjpCgV
         RziuOcKt3EDO8fV5mIAjh4pKgr4IL4MxrFW3K3G+mfbb/kbQOLcx6v4dBrFA3PoKyoP/
         iKdEhXuiQ5aC14PJRajhl+did2naDK3ZljpOZhVTSiTNFwT5LEqmhOHOuLET6Nh7pvqx
         zBIzEXEN5y83Ao+/7tPahA1mONX1/sPMyvFxuOKG5P5zB9wWKDTWZNE2ylnepJQOoWjE
         mdDnqa9nu6MhTIITSA3T1k0FyDnxQQDazE68CGIel64WDmJvgTa7LsNR5PaTaf+PB80m
         KYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553853; x=1792158653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=;
        b=BVfUMGX3NFU63f4WFptNEiY4n8nJ5H8tCutU/POx+PSInY7idaDGmdNtA7V3I3MxEQ
         JlE/YqOmhCJ6HqRlfbVCOmNJsmI1QyiGPW6wpNkb3v3mG2jE40lmhnuiEhd+bam641QI
         gI6XdBrVHJANC8lpzbLPOJmGhEDH1ws7JBc6VHR3xaiNtlEh8yGp3QB0PRqd0AsbUCtM
         DwkmjVLTTLw1xvsM6eNxf+6aneUKA1MKQgsUpIkpDH+24l127fLfY8CS4lE8yPL6DhwI
         kUYqyRDeQ8nXx8sMPuRtdv23GiCB/bnU+b+ioJ09ObECxo3cY3Rei6kjn98ThzIr4qd7
         CDQg==
X-Forwarded-Encrypted: i=1; AKwUvBySfSXQv3mz+L02IBiXDApRECDPjblqZ8ueCyNM9TEbOO17DQpYI5LZznmrC0U31FlUuOt6mMx9WuBipAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8jPK6m3L/9Hh1PHykCA6W1Hsg5hdudpgNzqRIxPJekXkSj4Vi
	oxU0RQrBk1zpCl1q63axQkhVn+/U5qvk1MaE1KVFE+QggVAiRBanqyGptlglP+V+rOmayDUaalt
	kMT2kz1ITv3/x0qn1Ei2+r+2+5Ktl9pKBnmkTC0v65wG2LVsFUVMHCrhEr3WvjXIOHEeWYeBISx
	0=
X-Gm-Gg: AYBFou3KBRSJAxVgZV4eifoOVXPe+NXVRWAp2G+cv57NQdf3DBiBQZOHYfSJID9gHED
	EX519xgvDVmMPAHtMf5bbJ2IiWWFAv4Vvdn1RVYLGdPp+j+RQlD5CeyZxOGczQiNPxAnEG7QgUt
	oo0O8Ao8vtZ2K9R/cxNyqBM2RzB/2Z1zOk+Yu6/dMYfs7bGH1XmdJCxWtJRH+WmkRyKDL1Gtx1p
	7M0gPfx4O6GMa9kRmRSbbgUXS7S4ge0WFrg21apuFDIbNAJ1vfDqeA2DahFmwMj0euQrCd0wBsJ
	h23OT933RtxRaR2MqIklwhgetJYZ/AN8f5DWl5pZJwtwcCxIOvjcoujyAVCGgM/Vix3qomOqTxF
	9GKNasjNsb5VmcGxODkDsqwA4RgWC6rhMH1cwVjT8026Jx6qw1rsBji0g5T8QW6GXiyE7rvuydl
	zsrMnBT0I8w/QBA98C7WDIxOd6kGv84CH5DgI=
X-Received: by 2002:a17:903:3504:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e842cd1499mr16744175ad.32.1791553853408;
        Fri, 09 Oct 2026 06:50:53 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e842cd1499mr16743995ad.32.1791553852881;
        Fri, 09 Oct 2026 06:50:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 19:20:32 +0530
Subject: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX5IunBAo8iP4b
 TqxnAkV3AXdHAi8WL6foWrUCshqfMQsKiBaU5+/sHYJoIAB1npUYg+OxlKtn/ZSCJK8bZjLOZ8G
 jiSYJz1ZT1SRGF1ewiLm9QupE3vTHCZBtqhUBfw3f3Kr40fZ4mH1gy1ILTrrfGV9JmwXnCotaou
 uqiiOV6gbfst7pCJzNryvuwAlAXmm9C3eLCXo/7UPTzBFm/sY8y+gzIuCo8o6euUuk4GWtMYHaB
 E0/I4ADAFqpErbcUHQrXkhm2mw92783hu1yH/VYicuaBrN438XuRROuLtKx9yu29AWkzyNz9VbI
 O11o6eet1yM11ofG94h8loCkbcAcDBqcNHZQXhbAZ/1Tmdl9MV9Km9lFD+mzNLf/E76IMuCvHtB
 AkqsdX6IJH4L6xVUZfIIDzEOzPzSTy1/LfsoAjGnbQbOZz7CHT4lgE7KB3gXt6eH39MtGnqQIf7
 RjraJ1TH7WIN2eUVhog==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8f13e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g86QhdraO39nIfxGWTwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JJ60SETXlDngsiMVD-eOvXBEF0WaMBLy
X-Proofpoint-ORIG-GUID: JJ60SETXlDngsiMVD-eOvXBEF0WaMBLy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX0PEfbGFCTeVX
 Cq9pKZkWVwTIoYG0wh+mYofg9yj6qyRCbTfQx2+bSvpy41BupCja/bzYdC7tVTv6aAwHs3bwl3R
 MTxDDxAp3NBp6ifOPtsWCoOoGAPHln0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Add the system cache table and configuration for IPQ9650. The LLCC
hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
no broadcast region since there is only one LLCC instance.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..7ffe6b9019d8 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 	},
 };
 
+static const struct llcc_slice_config ipq9650_data[] = {
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 1,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0x007F,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 2,
+		.max_cap = 384,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x007F,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXDESC,
+		.slice_id = 5,
+		.max_cap = 192,
+		.priority = 3,
+		.bonus_ways = 0x0380,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_2G,
+		.slice_id = 8,
+		.max_cap = 384,
+		.priority = 3,
+		.bonus_ways = 0xFC00,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config kaanapali_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4673,6 +4733,16 @@ static const struct qcom_llcc_config ipq5424_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq9650_cfg[] = {
+	{
+		.sct_data       = ipq9650_data,
+		.size           = ARRAY_SIZE(ipq9650_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -4909,6 +4979,11 @@ static const struct qcom_sct_config ipq5424_cfgs = {
 	.num_config	= ARRAY_SIZE(ipq5424_cfg),
 };
 
+static const struct qcom_sct_config ipq9650_cfgs = {
+	.llcc_config	= ipq9650_cfg,
+	.num_config	= ARRAY_SIZE(ipq9650_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -5830,6 +5905,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
+	{ .compatible = "qcom,ipq9650-llcc", .data = &ipq9650_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,nord-llcc", .data = &nord_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..b0ce1a7d5d8d 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -92,6 +92,7 @@
 #define LLCC_PPE_RXFILL		 102
 #define LLCC_WLAN_5G		 103
 #define LLCC_WLAN_6G		 104
+#define LLCC_WLAN_2G		 105
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.34.1

