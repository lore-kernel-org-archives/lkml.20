Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738893;
	b=E0N2qvC57gPkefKC7MiW7Zcme99U6zlWhsJNgcN4xQ7uK6+WMyldyNHjKdvEqr51So49
	 vBmsEaTmknb1lgyl/PXqBIFcr84h3r9vmD6sBxtvJwCffrCfXTp0XEbJ2mVeMPDj0pf3I
	 eMC+A3JOBCnjVpygh7cyPrKOrb71dEQezdgHtwN7R8hFtIvT4sQS9GktCbAme9Z7pbW3e
	 wttRvy8CmDRDa4Wf2fyBFir31IcYwhzgmojEbX/XWwI5XBQn552PyIjJwylZPx1fwOc6y
	 E+cvtze+x8JUFmgArsdn+FqYDKMwUDzlCxs9nmv+7OKXkapxznaEA4PRCLKyaIeCguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
	b=t9oLJPWqBT24IP2hJa0vFo0z7dqDl5OGZoaVeXVU5ttSM3PowvJBTMSjraKgoPH3WkKB
	 wK3RTaRotrmb8Ajw3/y2lDJJdfffLWFHJh8g0XJIQfSRXfdVrTkHV9Z79CIHAcj72618h
	 7hIYFzUcZV7oc8ndcIMZQLuaxBskDuTjhHRcBkHOzY/mnpZ6A6cEgAvAr5JmcKKrGKSsa
	 QC+dzH1OKVdwc0y9gqBogm0goCpDtH08fdx41x+1VyGJZ4ZqrdgiLBsLdXf6AR9hOqgFo
	 decceA4q/QMHUsJ2m3RkEmkHSVFrsysWT4hYHdevPsnSkDhF/iNmFD59DnQoRhFgUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hKQbarb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXIdjQg0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hKQbarb1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXIdjQg0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtFu2389432
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=; b=hKQbarb1BYVCgfgx
	WS/Joh4mAyMiwZ+731RXvNT5GoeO+DnRvJPZCjaDWqav7xWvyXBSnAnsxiBd0CwB
	ETcvfgUrr4SxmD2LArtCpzPKqy+Gj9TNydj9Au+PZYMtiYHD0Pd8IlgxBTeSUX4y
	0KY/aoPUDqOaZB33uIFi0KlfXcdyyk7XN2u9NvPK5XYbQVaLoq+Gch+FUl7GGhNv
	EEm6g+YBCSuc3wqf37qD+r/y/lBc/e8LzRPWKsZJBmMTvcfqrZhFpTLFp1GcPgIj
	/IXihBPgO/NyjMUysbnHPIzSj8s6LnOZ4+9lIdG8asbHKuFvB5EdVrm/4MRFX8EB
	3wYDgw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so759182a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738892; x=1793343692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=QXIdjQg08bjKjCLN9iqYTug2UkLz7Y6DiBvFrq/ojHOwmc7/mn3XchaHeRIyq/lzMe
         9vL6yC1lLF0uIJj+L+gD+dyKssCxN/xBh4CUa3TO2fgp0rmuiZcZzwjwZV4ykkm0FZIz
         zN11pYBD1O0XH9npbvRtxkMKOo+x57e7i2T9W7lNUnUyp2qc2AqGRbQpr8Dd0tB1JEIp
         gGA7oabmRKMx8WK0Xi+J8KDWFZW+0Khz9h5FFY/gOT2/ZmBmhLxhgQjIzrnowWDj1yA4
         idNzbddY5WNH26xLOtb0c15mbfKjy4L9h1xPmHYZpvSU/OTZIDINA50mkc8HJb1Sfr6K
         58qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738892; x=1793343692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=izKFEAsB11WUD4X6DjnP29Rv7NKzMgmRBXUvSwpI5oOrwpidXDAKXLTnU4v/OKqnaS
         UvoAfNBcKfnoYYl7BXEcm7r0y1q4ZPZAXRp3Z7Sa82Ms/yFazeiiAQB/o3KvKRRvR110
         kgqtLdxt/jdhP8iP/g+bX9+L3e3kIoHud3PTQh9VkccIQclhaoe15rtPA76W0U/rr/rs
         Jl2gUfyI1pcIz+VSNhptP9+l0+oHmNz9zF+6dndVZH9Y4F/hBFDViRyugWEQXolw9Jbn
         jBuF7b5ZEM8XlW6MgsLFMmqpoKTAxjnwK6SFf7+j+Qq5J1bhN2xKlHsTHDp3u6B5C3aM
         HbBw==
X-Forwarded-Encrypted: i=1; AKwUvByCAn6r/jdmM4Z94YOM8x9aqS5vgCeyzs/ql9Phv4n3VXgWKuKnvaxCABdpfc8sTEJ+irmHRHvzUPp78p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+vkYXWzsjyKNQSAVI5AlU5xwt8kBwCotq/4+Tw3T+qWm06Clx
	gZjHzC9rrLxdB4WaO7ab66HFZVhSpY5elMGlPnuE7l4RZiP5Cmg5PrJ/Jl29EHhvhMqQSWNpvZr
	DwilcPoDIrXMNW30oVpUvsDnX5EyXtYoziaW7t3kqIKr8kchQcsl8rOR0dGeQppFxETw=
X-Gm-Gg: AYBFou0m47AGdS7yjU7t694fVz4MVj7bAcff7v9DN8aDOiKvlr5TJ9XjLfsSNDIs39j
	wTly4Xsangx9paUo6uakJ+xHeISc20ffmFLVsw15jZJvPgItyrV6gx4GPNGY6ejrVozyktqAycx
	94vNirUaNvxcPBdkYpDbPb4lOB6slaxVjSGABE86xRsAYmDGhE172V73h7PS19tG4E4cXF/+rNz
	C2crNyZl2D0kXhUllAM/XvWUy/i7f185NHMjmVxZkqd4p2BUTrfSbcvbVrUjS19uj55SmEpybCG
	B0y8YoeRVRwZRP9tfyp7/7I/lqfW7ucRJeJLqlmvxpBhXQq3g+QpHM+UnoxmG48kFSL/Pcq5s96
	QZ3ORaSWqBFLLMmD9QUImUU0UKVpDgHjxC10rrai3OgP4fOOaYBKDJJv2rqilwiT8okCxQXonu7
	if1ZKbhE+HajKv+DVTxFKiBQ==
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832402637.26.1792738891715;
        Fri, 23 Oct 2026 00:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832359637.26.1792738890923;
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:07 +0530
Subject: [PATCH ath-next v3 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
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
Message-Id: <20261023-mpp-bringup-v3-4-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxvp5q+4b5YuR
 eDt/SswfSfzXbghhqFElZMAjOA2sEnCiuz98mxpBC72JDd/Y2hJj7X486uB5zwMuxvoSuklnuG4
 +B+FTa/lDcJvP9rd99MXkOZ647JGUog=
X-Proofpoint-GUID: dRAuUP_naZuLULXY1v6QoAiY_RzU0rnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXx1WSerFnT4/o
 jgTWh85FnACxmeZj96gi0GZbX9aZwzOyzvaTkk9/1EzWiaRI2AaM9FT7+TWG6a3/suZbomCmgAy
 PRZF6hQC8QWrhCZiQeXFTaCKJfmFx4eTYlPfktJ1gLQwD8ZSmMdFeekP/mzab+2p39mjQPPoKro
 U+3wT6A/VIh9Ce43z3vhD74SB+Mm+fNq4mqQY9dPjwV0yVhmLppA8KaJR8fLwEiF6txyTwjGlso
 FO9WuEd1EjNVsRlPqqRMjORBBDV0VD6yVl4T+8nNalch1uQwaMpHoEqG8m/hgusgJLRrdqb7RDr
 Mcamj299dvVYu7GuuvQDDG53hYfBtTbANgegV9IBajrobW6gGf5FY8gHcA5PlSs/LTBvg+dT745
 omOm9wxjolM8CnDcjmaQY28TXRiz0xgm+56PT8RoS1D6N3y37GMAwbjFld/1B/R0/lwzuQITkFa
 JeMt6KgEI/QKQxKVbUw==
X-Proofpoint-ORIG-GUID: dRAuUP_naZuLULXY1v6QoAiY_RzU0rnl
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb064c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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
index 52558dd126a0..833aa6d43ce4 100644
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
index 643c95c9bccd..acc4eabcf2bc 100644
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
@@ -926,7 +976,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1

