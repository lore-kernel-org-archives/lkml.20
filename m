Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344C496D3C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455067; cv=none; b=pS2u+7Ccq8zKdIR9vSY+0Je/HFbibvMbv3I/BG74qsLOFak1OBnALW23roZvsZNeukZIhapdzTQ3asCbPJWA2YwFlfqi7EmZ/2OVBUkoaIIVjA4AiKqFoKtaGVK0nW57AmbjTlTeDPbOBT3j0r6ROHU0rGv/nNYpHSVAwTQWYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455067; c=relaxed/simple;
	bh=8sjW42bQBGMAbDmBZcK/pVg/lurB6DK9e+EF6Fx/Qag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlEnnvcESkFhJxCKgYmDe9R0qHz2hJUW6lyr6zRc5jEspE4enb3l9KZOXl1QdvfEXzLoUpbXhxON7xKUwVOmZwYVKXn3Dp+LJhjOL0MqDfz/+Q9Xlf1HuXdLRcI2/w684S8wHBPGiobXwYcBHb5OpuIeVrVXVVg7B7RuSYm7NCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJNU2cHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7BUYRts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJNU2cHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7BUYRts"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KYgB730807
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=; b=GJNU2cHVGO3OPef+
	Ku0yIzdByH/lPiwxowruCtBLrFkptUk03FtqS8eLLlIfWz4Gjeyzk4dYOx5jFCbm
	aXn1C2zieZtBAm3/wz177j2IqzQuLiNEciojVWp7rK5LukyUJ8dzrqB1kgo7vGy6
	fkyd5Y0uubcsAhN8hujibSwSD+H8FEeGfr1emSLWPADQFWOLjp2R/uwz/UEVE6UX
	4AO31WJX+WuJAi5cWQKcJdv6uU394tTiNs96NZyZXstKHj3axEGWv+iVM3tScdm7
	LpXjjfMxLIfz1yr0eLHbXldkyWU5X59X0UbmaqT8d4vk2vpkMmpCOzwHXgyXs7I8
	m4FXhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32csu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e605efae40so22143115ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455064; x=1792059864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=j7BUYRtsWk67H5BQ8V6O+0OVr1l5Ky41LrtWD8Kb1pebluVHqwBV+2YNlo5jnXHROH
         J2+9aLuMskuJ0bXUDzwmhHQXHilER0pY98fbeIiE9gbOUOlpFSHHgYB2a4ZyZOnGh3Hx
         hCWMBk4fE0YbOY1I+OvurXcHe95Okjcbukf5tb53XnaQWPqQusrCaBE3AuiSsECO8rfZ
         /pDyacwdKa2x0STRuJrH8EHdSYZiJr69jaaMH1/FGaGYvQ6wXJemWc6M92LWab2qjk7n
         50hEqVk1wpJaEs1AVj0htwzGvpMVOuIyGvWlgbhldA+YlGcfoksJPKa/JGh7pNwPk024
         sMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455064; x=1792059864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=rGSHC0Yg6kysd/Y9uNrP1CBapi8sMNFvYTphxZFfL4heSwFhtg/++e7GWlPs2wDux9
         h6xYGoQKGOOSWYI533neEMLybvHhiXTpUiKqm9MYxalUHL/lZei0thc4RXc6zh8ZLa2V
         GGP3913kEeSxBxotyL0ltSCm0eaZp+meNLkQ2Ry9ARWD/1fl0MvR7jDlbyslG4hrubqp
         XnTkjSCbRvY6lu5xVOfU/uDtlMCSm6+2dbBFjqJ8R5Zr4CYQyTxgJkqGXbkR2wDWEd2I
         yndqHVt2zhT6KLef8PqsVU/I7yHMwZgBL3OESLHUMY4MySz5aGTwACpt76B8LArU+dnc
         Cf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfi2nMZK6g6H2AyxFnD5dUw8Gvivu/KqTMAu5ENTyJ7OQuBJR6M+DOVWZb0jP5GZwhU5ZHYfG6K3GMVbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdBPWQbif4E7yhc/2tXFYTJKtnY9JP+ujXGZkoda41iq6z6nqS
	87fIGB0dsGV+8VB/oh8xx3xFQGYBFPXQBLColhx84kELrsU0XI0Qm/0kO+LiLlpBTDkvaoJOW2M
	6f0cTeGgNER1NKktNG/2RJth9TMkhXPgkUsLYlCOdmVaoPHU6utwgEZiQNSDuQ57RDgk=
X-Gm-Gg: AYBFou2X1JFvjZfyNjV5y7QU1W09XtpRwwTy8vZ84BTT6XRvAWZ3pLpjEt//iUGqdhb
	VsxD+w3v85o3LwhDfrP5tVgJksqRY5Njjshs5v3wd+ggKV3le6IOXj1XwMHBywMEIDnJa4ZUO8r
	KNmOpnzc6USfaOD8gKRJD4hi49xcH/1nlF94IbEVJHQopRE1c5n231XNi3rjU8Pqx8UYNTRg4uG
	VnOfuDzI9hidbpDQWU55yEV6GZOs2cxOeCLPZ3UU0+8Hlgr8HbD+tn1WTRpgzrlR4pFfshyvYse
	8KhOdyIb8k2yPH8nl8elSEcdqmN2HnQiRyQSJiM7OHMmNre4/mRBn1fbrxDvpqf2/Rx74jzliPE
	BB5uH5m7Zz5J+eQ+5Lz1s+1qzqFRgJ7vBl8fmPRYsJG68EcUX3nudKlaCmevTexPb7T3Oiq26AS
	DdQ/xp78WpDSTLeu87H2+KdQ==
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43532945ad.0.1791455064318;
        Thu, 08 Oct 2026 03:24:24 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43532825ad.0.1791455063855;
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:00 +0530
Subject: [PATCH ath-next 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-4-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX5qSrn6hM2OZm
 wLRxHWZV4/tWdqkIWl+hSY7BxaemzoAI2jWHOH9POdX+STwrstLs+otLqG/2E+mkWzFNBDwM9E4
 iBmjO7uj3hFDqEr3R9wuVoRQZ/mrZ1Ybknm5vvL5lJf82i7rPZyllXt7frPORLZQt2sMSkzRobc
 obTJIgIRjOvXdx32VXbP9YWNAhvdVBw4TyclQ5B5X1ieZaZX2/BWDdQBR3SKy9I/BpqRT2ptWUa
 /9w6/RMZDWyayhhzz3/KH0Q4Y8i2yd1H6MsdEpld3tdrZ6UA+vIL/5pH5vN54xNrsPnjp2LxIS3
 gegKTtCk8dDOE46iNLLWnbLJMlYo8e33pNkus8qgnow8N5QAi6wJfoypk1ahhUaZJHTiwdBBplO
 6SaGZldZxb02OOZRe5gEgXnalOgbT1BbZCfN/Lew1nVP5ZUhNj5GBxyYE6jd/yIT/h537lq5yBD
 NhsnMyc2xr6IvoaF/Sw==
X-Proofpoint-ORIG-GUID: nU4xSuG83OVg715nfdiK5yj5dddPK0HA
X-Proofpoint-GUID: nU4xSuG83OVg715nfdiK5yj5dddPK0HA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX4wQ6ijOa1iYw
 2qubgSnPnw5De+va5ycGtj52yyFdK2DqnJALS5D9aBy0lJqLc5WayQfiqhBwZ+oJiWIOpjufxE5
 fid1oaQOvDIBq59wiGYK45f4FUuY2lE=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac76f59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware ring mask configuration for QCN6432 to support interrupt group
mappings for various hardware rings.

The QCN6432 requires a different ring mask configuration compared to
IPQ5332 and QCN9274, with support for up to 12 external IRQ groups
instead of the previous maximum of 11. Hence add a dedicated ring mask
structure that defines the interrupt group assignments for TX rings,
RX rings, RX monitor destination, RX error handling, RX WBM release,
REO status, Host2RXDMA communication, and TX monitor destination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 52 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 1e652dc0d247..2e585a42dd9b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -127,7 +127,7 @@ enum ath12k_bus {
 	ATH12K_BUS_AHB,
 };
 
-#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
 struct hal_tcl_data_cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index f57adb2107df..408844024dd6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -332,6 +332,56 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_qcn6432 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_TX_RING_MASK_3
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+		ATH12K_RX_MON_RING_MASK_1,
+		ATH12K_RX_MON_RING_MASK_2,
+		0
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+		0, 0, 0, 0
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.host2rxdma = {
+		0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0
+	},
+};
+
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
@@ -919,7 +969,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1

