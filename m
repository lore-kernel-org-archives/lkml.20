Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F793B4E94
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120977; cv=none; b=Z9nVMNMeM6lDIHxbDYx/H1Px9iIAc4bWUu3ipUwhb0nVEgSM7zAbKqjBPxjUwg7cmll0Sij4YFroQi2Al8cWenkxEUGJOFbIwkls6sWCetZnry/b3uqcC5yVHrtPicGt6C8WLXiC1tqxlGifL/2TkdnJOCZpoGXhofZEztOsujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120977; c=relaxed/simple;
	bh=5GtUpasBb7+e1V5vQfs1cJLRArknloYK0iYT1nRYXHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+tToN1Iwi83XjZSomAestxh9Bcy4KEpdtIlqrnK3xnQMsyyFS7A9JXV7ptE5XpyLvYrBzhHBNUYZC3FiK/2tjJMhIn3t7maNW0ZA0+Q8DRtHxv2QS/OEvwGcZD82kvZ/6Q/SWsXIiX9zSDwjC/DYR0ZLadveLnfifOHWsnQORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHS9v6IB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TM9hVniX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHS9v6IB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TM9hVniX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKRh623462800
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=AHS9v6IB3IaQ0++Y
	4FgCfLf00lSxGcC3jhJHfnIaW77kMAPBb7tM9qAl/JCfX8JGCH3tVg5Ojl+OrAVZ
	5ZVzXaWh9xv7Yv2rqc9hOiGH6tta/9D16gluQM7W4aLS8Z4NcttjSxljaEny4Q4P
	YmJ7h3zFkU80BJuB7jB3T7xFhz7sZQW+kNJKEQnrhuFN2QxfEvuZ5bJJgKtZGn1v
	OGhRibPRXQBYF2O8UzNjlBlqsgZoaeRPzj/vJfaDjjOElFLAMqgBRycUr1W/Oqmu
	RLvZS08WKxEmxADSf6H0BHoMz6QvEqdNBQQ+8iu+dUbXwk/fkp03HYUPHj+GDz5Z
	PUfiJg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6axbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6045235eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120974; x=1792725774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=TM9hVniX/FJjrUjZOk7cIgwkXgur9kVHo2uBvt0BXalx1DXBjhVbqizlzB4JnnsG2q
         lot70uh7v7oBnDoIGD2iBnBXqWUQhOfS/ovbzq8Z4AZLPO45y/d72usPJ5nGS5wBHkqZ
         RRPshdLi9uKTTdCJ8YEJVGBwFCAbm5Brlvgg+9xdRH0+7XvoX0hoVRx5OqzH2dIBrL4W
         4TcldlmA8BN7JtGua6i+LdJWNVvkoePN+m+IrIi9mT2LFqBwtR08VfV1yY609MQfMImK
         jJwvSHOsE+GXa8SFKapuNIz7pe5u55G1Zf48xXZdBi67oBPunHtZPWiaAZllboquN59V
         5/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120974; x=1792725774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=BjRfy8ayEMmWWSakoGEW563s0hWWbpxTUm7ACx7OI+JtvNwtDVGM68woANsKKLhfgH
         /6pSO7sqrj+iQoDVwewp8RtYLqOzcWew/wSjj38rb75ddzzGLPpqg/GyTbxnpfzKKRVf
         dwceDGNzpsbnMcDMk6XhtBXB+VMsCJN81ikb9IfSL/uSMAENWk/meKuEcjVI8hP86aYX
         DV0E3AdmEzG+qFcswbBAJV2JiOSizJpCgJHfEuv+K4BhqSlUKTDAlMWeGXvpChH6YDU/
         1l3Zm9Jaz9C8+Kdlp42/wonSh06zeWGApaDzqi4HIPx5VdP3h/Fvew7Mxfab/XdZt7DM
         rkCA==
X-Forwarded-Encrypted: i=1; AKwUvBx0c+Lg6yYEESbbGvOmu0B9Ysr28rkbwhP0zq6441NXtikUnN7o6goo7q2xgTKy8zmx5BXoCI8BcJiAeSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdpGOsmhKGv1q/nV1RhZYRfNZ5vM9CLoPUmalfl5Gl0xO5dayx
	1V2r3TfM8sfxAmzChlhMUVpgDuh2Fk1uXeNMkVUTAXVYnNSQj6qv+3kQMCza38K3jYRWFV7//Rf
	GUnawIagDt7XFnuvS25qGFXqOFWnJdeTca0CN7GLuriPJ/kMaAanT1jfYvxu7Mfuz5DQ=
X-Gm-Gg: AYBFou0481v0AsMzgKnsgCLp10/qcM+4Y/dJFYsAU4vjIBQGpgQE/Spp/5YcuZDsxrY
	T5/5goWLe+xjU84oRnHtAHd5WexSlgf4naMnXqYWdTt+d+FscUb1SoTA4m8W6DD/ehUSuNZeYWa
	TPfpP+UphTlhUpDScw6NVhPpD5OWCEIuBPe/zyKggTZ9v/6J7nqMOwZQFYbiki+Y21EF6+ylE47
	JSMzoHa0RA6A6JvfPeLWOxlaW7PCCTg4WyEcAubdvzNfrQOp0C6s8xzLZ0/17ZRDh+ivTJ8iFTn
	ELR7PufKNlPNHf9LFLXZF2WLGmTdFwhb3xaN1BMyNCZzbBRWUdOpC3K7ZuncesopbjtDvqxS3Ud
	eSuHfAKD8SuAtgsggDKHAmUllUwZTemGtnPcAvRA6kShwNF4PgjD1Ks7OfXYa9rolnQXE0F0hDF
	NQFu+IA1uctRaOkzJlo/6AFw==
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072760eec.18.1792120973565;
        Thu, 15 Oct 2026 20:22:53 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072720eec.18.1792120972992;
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:51 +0530
Subject: [PATCH ath-next v2 14/17] wifi: ath12k: store and use MSI data per
 CE and DP interrupt group for QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-14-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: q_yqhU0NeXkI-MR-qizA6q05lw6SX1HX
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1988e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q_yqhU0NeXkI-MR-qizA6q05lw6SX1HX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8L/zfSYoXUr1
 lg7SqoXbpTIhMDy2gA055SiS1zRCNISUpeSOcz2B2AYV53ncccJWAso+yvcN/igzwQBe2PBIeSg
 lofC9id/28Uu6JShwfrSxaAyexwWwuX/pMVl2cpTMesJ0figrqYfx2qUIDihOmKZD+ht6MfUJbs
 oCVqtiX003jmJ72sHzwQ8QKbZGHLqn6zBpkyer836lZFM7NW2Vt5NhFaurVr6XNkkt9M0TpKwQ+
 OkyGfWekM3Tft0ACL3/Ny2mcAj3AzZxk/c248Ag7dCRtYUV/IHyeoWkY4Rpc2zfuWctS9m1myZ8
 xr6Tntj1IgvZ6XtPVAl5XYVxPM8hPVy39fIrCMdyf36N2YdwwLIH64z0lSWUmAyJTg/C5mYtURS
 lirg/hAorbS/mnUkvV9GN+MpeRcApx/F8M4imVXalZvE5ZAJnpBs7uWiH91DGTKZrzD8VZXCH4K
 5OV3Su6Bb9/900dynWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8SNO2z1PLHIo
 +ySvzci1zYt5SxxAVppy0U+hhrpIFsnrqUPd9br9Un1C3VNwjmLCIC5mnAXJFZB4OpZMLM8BJ8r
 a2Y+RaqJTvVJF6xZATQojkux0JGPozU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Store MSI data values for each interrupt vector during configuration
and use them for ring setup on hybrid devices. Hybrid devices require
explicit MSI data values rather than calculated offsets.

Add ce_msi_data and dp_msi_data arrays to store values captured from
MSI descriptors. Use stored values for ring configuration on QCN6432,
ensuring hardware uses exact platform MSI allocated values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/dp.c   | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pcic.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c99e915e3885..cc8ed8451a2f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -270,7 +270,12 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.ce_msi_data[ce_id];
+	else
+		ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bbbde9f05ea9..575139555dd7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1172,6 +1172,8 @@ struct ath12k_base {
 		u32 ep_base_data;
 		u32 addr_lo;
 		u32 addr_hi;
+		u32 ce_msi_data[CE_COUNT_MAX];
+		u32 dp_msi_data[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6cf254b2d2a7..0f0800388935 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -225,8 +225,13 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_group_number % msi_data_count)
-		+ msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.dp_msi_data[msi_group_number];
+	else
+		ring_params->msi_data = (msi_group_number % msi_data_count)
+			+ msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index 13097cdf2794..b6d306fd3b99 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -275,6 +275,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -318,6 +319,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1

