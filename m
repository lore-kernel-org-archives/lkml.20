Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675AE495AE1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455120; cv=none; b=fXYT5Vg2pYXEbrHY0R4nNxhRv4tI32VCnNJhfSUoZ0KWX6vBJVaxpgAr1B6Xw4OJkstSCCFTqyh8U3LKBLFUjKkpMIFq49alh44Fa38ATWkpjPHnbOpV5r+K3xDoB+Cb6ry27HlWWC0T7pBnNirXbsKCJ5kFSy4khYDelv5fYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455120; c=relaxed/simple;
	bh=pAZVsA+P+j0LnyQWbBrAEL0IyJYTrbyYbkG4AZMi2NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHDPfJ3Oa01mOl8N66tYzb5u6yiOpUjpkltn3R29RU77Pey0watzECkOiSC/ugEPllTCcmjvXWfC8IQbCOquZqo28bTIVdQoMf1Pe0bTE0SIUcOxZ4jtgCY+rjF3j5wCfs4+R8BbjfqEzREBvvZ9HBRPAdWiXMHrwEHZLKNJ3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqqNyFXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSi6tBkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqqNyFXN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSi6tBkG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPTO2167115
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=; b=VqqNyFXN1L7IKuJ2
	z8zc5sue5Gos/U6fGcNuwIfIBOIDAyNnNUcJdxHkr4UcYWFzXSeBbQR8EOoKCtQm
	G25jQviSLzuHCHkNvfHl04IxFnzxsvSMP18zDwt9hXX7UJ6UsJz0XxIham7PnOte
	awyTOwGc5V8p6c1sBHcUvZB+wUIemNRbu6QuKLQkFKCyoYzTIm3qhROn4rLKQXbF
	YGbVDqnlpEc8PLczRpWOgsUmXt4FIh9t9xzlxa0bMaH/A/Kvx5EuRse3bXJ/UgOF
	XXD1qxCW3WQ+Kw2Q7zICxx4fkY14E0ifXJJxVrz6i5CLO8D3khnCyRKwBU8x2bQS
	furcyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tj8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:25:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df5a65671eso7204435ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455116; x=1792059916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=;
        b=DSi6tBkGPvzUoi2ACVJN6m3J09vnCAYUdfcX+DFqNo7hsZCrYDKHt3lpSEERUShTJU
         /KKsxc3DblcjIX6A/YXur3nW1TkWK5yDj5PJQDkxseOm4/OFTYOhjMI/ONWgi4Z2HiYv
         iZi+BIPBRLwK4ma4aPoCBr5m4FMRA5Lx9Vnqxs7Ns5fiMIOdEno8jRyrUf6ur/cldyGc
         0O8nl3q6+L0Vi/lIbYNEwGjHB+YI4Au2cP1NKFc5IMkucg1hbc6z0yJSGxcbuaXIZIgC
         4jM1GyTz1C1aBCxh/FVa+viwl5iecsXfUJiwTTMXGz2upI/saSopVqhhkdNhg1W0Z/ho
         4dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455116; x=1792059916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=;
        b=XM4/iFL4q2G+bPCyf8EqjsLM965fn5m8vICgZgOG7YL9R215oRQyxz/w/QhDsL/a2C
         94nbuTApUKaa4xIXe+R+HSdYXapfgwSGDjCBz0p9YzmQEJ3iX28z1+CUni14TknzoTlb
         gUo5eWrZfHHisAnLcAv/71dgCMuF7PTMzeEfj8bf3IgW1FEJQ2cM7XU8SK6F0Z1LFlSl
         ghmdJCDMrhInO4i2SNJ7MEfihSsroKHYxH9uTAhJ33a1WQTE313TzCFJfBpe+w6/vck6
         U1OXoOBPLwDsz1V68wahgK13TiMEo47X5Qe82OiHNvKKwlIRht1l8UxjMeRbxoNllSHp
         tWFw==
X-Forwarded-Encrypted: i=1; AKwUvBxI2A/rrMYVMCzexhNekGRllNDZYukv63AQWiO5p8uko4GFsK5aBD0APdHd2IlMU+qfaQUZ+a5cMN7WpnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbljp+jj4QEtDxiFawU17nXY8JPEw0352+D19tQtLolVS7KZl1
	vh9lybhwYBgL2XkmIujfOJ7vMVeNA6CZ6lEY0741TP05bueuUCfoQbD6mbt1PbavejhY+MONHnV
	zECFLFWDPWCeRtUSnOGW+TsXCQCbxw2OS4kgdBglNNQa811/6nc2pojsmr693t4CqNSo=
X-Gm-Gg: AYBFou2utA0btRybr9oHGbADyS4nqWlAKW9MVILKfg2m540DaBoQ5hHTa4GqriUs+X1
	KoY4Cy0Y2HZeeOLAF0tz1aQpCGNb2E++jYiWzdU6QoBMKIqscdLu7vSkPq9TDhrB9KOUbijD/+O
	kgJFn55Wu/kYg2VbfpajrJN47QaZcVM5sp2JOfZSgwKAHucMpbWrf9dDZjGr4MTZI1ttgKDltCV
	QNdfYHTNvULGFiN5pjsUQBU5mWgI8Grmq2h3GbmsfuR50+tW7ikpX/fe12aSAygMAUrXM49GxKQ
	iIjie1nlSyFjEl59rAbTpdyL3jcE9ZFo2uyW1Go5ChuteJje15ZzUeM1WSWGzfnhPzZC69KCW9y
	kPv869qWSmBi/c2vjeBCUvLxDf1oGdqQ2i/ypNZPRCR/pmgCT4/853rzs5CvlOKT7mnVVOHjFtQ
	AL5liVgch1ZAUqWVZh5+ERmw==
X-Received: by 2002:a17:902:ef01:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e7ffe98eabmr15026145ad.41.1791455116349;
        Thu, 08 Oct 2026 03:25:16 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e7ffe98eabmr15025765ad.41.1791455115576;
        Thu, 08 Oct 2026 03:25:15 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:14 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:10 +0530
Subject: [PATCH ath-next 14/17] wifi: ath12k: store and use MSI data per CE
 and DP interrupt group for QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-14-2c5797b5e4ac@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76f8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6p1urUWdsSdhZ89Ak_SwKh6guTd2SWUP
X-Proofpoint-ORIG-GUID: 6p1urUWdsSdhZ89Ak_SwKh6guTd2SWUP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXztwv97LkMEsy
 +pkJSGiWXbgSANPhie4l/7Q6B4UlVjIfsSDuEq61disRWT1Qc8CRMrRV8abb6igK7LxBtHCNrm7
 yKm7wmFlWVvM2vRz2ZmsmCxqQndSFho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0sd35xsGejjF
 K8fpU7L19fg0hlejeMyLT+RrkbFpUgwVYftYMYimJk8h1TOHpi4KY0r2OOe7l6G1lXHBjhSdGkD
 wTgBIdN7RwR0ymvnRVPNO9DaTeVSrkRWx2o89zy2nCwEhg5Cy1fGoAvWN0BmBlpiUbpclGXpLRX
 lbeK4LYc/ikrPuQxML0vEZ5lHGH6X4l/eHR5S9MA3GHWTC8stVKg2UT8gF9FRalvIGai6eaLmvy
 u8loU7nCFb9034dmw2z52jEEoYiGLXaP+E1T7xECaEEoqQaQdSevlgJOIBXebFz9fjOKEOaV6Lx
 9TVfsXcYLcV1GhZFauemdt11Spq7WVQdn2MCMbrVSC6twrcAuF/kaFa4lSuamoYw2MnQxElRDB9
 QZ7aqjIsnJ70CE88E0eKobyfZZZ04yKMXTrPtv4ufsnXP+qJbYfQB9JY09Z4hwSc/LNekqJjSnL
 R2K0CYjmMjiun0GIJhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

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
index 06178b4f20d1..9fa727115f8d 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -274,6 +274,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -317,6 +318,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1

