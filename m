Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754660;
	b=NW6bzB6OOLFYRbQdBoCDnQZbn0yZv9/0b+BHvwKmsTaPPIz4tBYcFKnpGBJd16KX8V+e
	 31D/GWt5fuoATipoc3Gq3B8/Wr4KmgZ1lXby8+slwMs0rlkL7IMwPeeizDAmdPRIZcvHy
	 whdDQyVEPf/x2Wx/0w2Cp1ZGXDKdaKkNU4QolL+uWQn9tZIWV7R60kug7CBhlInQqfv4K
	 S13sKdJ7iM3i+3GrJiqNRPyPiDa4Gidf/M77FxOvC74NCodNX23Lrf4U3ZQ0BqMEnJr4b
	 mm04d7qk0sEMMLY9rlYYvwf6Q2jgZX6A7FGz1BN5ucbRhwQvgkFrmOykQO9XuI80zTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=;
	b=cpOU5WYyQ5SLd4pO0kW6Xre3eReFnwm8Yn5ka6b1QCjewnPm1mcgthBXhKKIHnBqHeDt
	 lNzxvr3zYhqGYa4gpU1k8HM6zVlKjRoflbyLHUmcJd6VLaK++LiBN8aXQDYRZ4ggyfWzb
	 ByyWxwG+6tUET8b9O+E8Ea/BYdpNAh0grbUSBbtnNRPgTgW9FbloPwO5KepC4m+1iTRR5
	 mjWc1xkHVvWWsxig40YBJ7Lt14kwufb68CShfSe9nUImUpL4uURklVkS9ioTw6r6bZFXV
	 eOuNJ8CwGlYCLbRy2rAmBggH3yrkNAOqtK9BTnBF80N0vjo294zqo3KWVDl3hi4uV4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9jVdZha;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XCEHD+KG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F4606EE8A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103F4606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9jVdZha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XCEHD+KG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RF9q838281
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=; b=F9jVdZha4RDxyMQK
	IdeCxPBeSuSI4TQFl7X2FMDZQVKA+r6vWEDNNXbvkXK8L517TmKJLi/iOdWIC5On
	Mf/WBquVtCUaf6H+MuArhEBEV5OdIZo/Adbmct1+hL9z3caRV3RpDnoDtcEyot4h
	ItB7vPQ++TgmJKldmPhTQTMi3UD3ZjBq8U3lM9DXxArnXeQ9odauEVx0ESvM9kxd
	uMEimuEm2EWRvhHUONmTrf1MayB+DWTl+QpJ6s3xoRel62asQrtHLkQOA+VRe8el
	kZTv9mJsw4H75ujjFz6ij4U7FGiySs5PKf4EzickHPh3F/4+crC8TvALLatquQ3q
	cIGFdQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ms9fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so547250eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754657; x=1794359457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=;
        b=XCEHD+KGrs/3iZSslIJiwCycBldTUNLuSS5/aNLGXVUnKEF1AzE6qYKrEEzud7SIFm
         sIMpflHDdXCqdG/iuM59gA6uiFTbqgluPhzH//PrC0yxN5kuNQE14+gGQdhnKrqc0Io+
         IuGH/07PSAsJvwU4QPAcDbIzsuf5VcASQuo7jLVv3EGww9IzmrjHMAoqrF0Pse91EbzF
         Zs3dGT02bk2ayQk/QR3STunvP5751VE+oOsHj39jmKiPyUa/b0acC4jBbxvxAof2vpEj
         Z9gvnfXySCSJYmz8g1YKoJEmtpvImXqcLVF8o5rgn9sI/bTb7/LprO1dwXqaR09sMsp5
         kJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754657; x=1794359457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=;
        b=mbUgH8i5PB81MPMM4UD75T+eAjUXducbJ/75JMwwH2FVoUhFX6S3SoJUqurhcZ1aK9
         0X5q42kPtSDW+BXE/efxVkcUz9/IGLwHzZr7nvnwfr9Ja04cxOQ7iSKc5WSxxxX7OTYV
         xQbXVY3nsWyHUAL5u9T6DnZ8phlzqX/WE0nvSxv5Mao2pDGeMT5OyDJvP/eoViJSglKr
         3s3KAWFxpD8wYhas7+qcQvoeyLQPOyYp8tZsPAvYpl357gF7hzb5FKFvO7aCHDpC9kAn
         +X0OSh0OCcdcP07c0VcOphZDto7VQS4DL4ua/EWyOTa7d3a2nTARYhdsBSaOhjKWO3jb
         mx3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjqnEx4GrM9B3DMPckbMGjNMAjFRrDbh9JgUNyjC2oP6gcFgnc7WewvZrhi4jbgIVp2Dvn67ORnvEjfjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j4/W7LCE7+YwnOgFb2jXMVC6I9EdNAMip3Hu9EJiABo914LuS
	AyXChPTz3PbRdTo+5aUUNCSNVKarGNuk1uh/bTOC6wlpFcKTHJq/LjF+4SUYWGPzthsHrReX1kf
	Tb7KrMyjhyci/ickcJvwqpgR3I8d+136V/Ciw/6/KOWe6rxjc8L/BQw6OGEbv2AxdOao=
X-Gm-Gg: AYBFou2TlMRzx/CjGzWBBnI3VzrdzfmM4ymm0cs47JuIdV1gDZLAAWNQIE5RFPHZXEF
	m0KuOEB/o6KPoeSYSUyjKlfC4CY+RZznhqS4nygiW4PrccMpF7hygjmWztLMhLDvubEIYgFbCn2
	wzAJ92J6PLLIVcMQXP3VO3XlWM5WhzMn9YWE+9gfn+9qAOUShmun7xnSX4ZpOEH0c7d2KZN6pwE
	8UJX9JekQcWZnelAAriNahEgDAATUwgpTR1VunToeQdYP9axv7raPs39hJ84IwLe/7PsO+R+7uR
	0h20LQx1hM6bjpt99E6rnijh/8KdG5KAO7UxYk1I1v0K98I2P6TG0skCLC1UZYShpec40Q4KEzn
	RVWVjy3Ae7Z3j1BtwUaWZL01HEgki8ucDbU6oo+JtyWw8X9U3L0wfXezbrn3+YJyot3ShMYgTxf
	ng7xsbdUg4fwCdFCDZNN8joxZrMDTr1Zp+P3ww
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr22485662eec.3.1793754657288;
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr22485624eec.3.1793754656537;
        Tue, 03 Nov 2026 17:10:56 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:56 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:53 -0800
Subject: [PATCH ath-next v3 10/13] wifi: ath12k: ng: add REO qaddr cache
 clear support
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-10-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: pqg2VADZA5KIXVoc8pA40LlWw0NPevrD
X-Proofpoint-ORIG-GUID: pqg2VADZA5KIXVoc8pA40LlWw0NPevrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX/H6rtYT9CSrn
 OkC3wJr6vzCQ6KBhP51OT1YaoE5a16ETWz2pNqTS40lhILF6pp8WX432aFFALIDLln1dqvHx/IS
 UjgdpxlJGfNRuD/dGDLNSL2F6+daejEOHAknEaWITXOP/4aEyX0zZomj1ZjBnjutzPEpp5G70Jp
 JC3Kmidaa1B6Ux1SN3m8i/cG904AyRSVzr1LUeg4n/pdMShPOhbQ6fSFmWJtk3PkMKD0j/kqw/4
 1wAx/C/CnDmD1onBUrJtU0cjBoP+7dfN5LZBYQanFNEbUS1CUyI4i4vDqRmxqItKvOQV78mGP0P
 evPqh35GXwVe5ohOyajCN/aJW31kld8efCToOR17rpgNRNF7O7sc07pBSaerFenjlDrtslv88r6
 crolYOnfU05ffc34dM6P8mI8or2WLjrtSHhZIGHDdXWbqwqkxrPjPEmP4GNm+YTmLwU+WuPLlGy
 oW6pJgQC+nRi4yOxEUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX59RiJ0hHK1I4
 2AQMJ+yzUy8/DQw5LTiXA5HYPXvXqey5EuX6Gh57PPYc6zN+LqE0J1BL0BfP+GtixgM9y36SSZF
 uQkHHO8H+l1CQ1YmXd+n9EC59GHzWH4=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea8622 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BFncArQEFM-slyMzr-AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

Wi-Fi 8 RX TID setup updates the shared queue-address table. Once REO
queue LUT support is enabled, those updates must invalidate the hardware
qaddr cache or later lookups can use stale queue descriptors.

Register the Wi-Fi 8 cache-clear callback before qref updates are made
reachable so station add cannot call an unset HAL operation.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9625.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c     | 23 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h     |  1 +
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
index 6235668e23cd..bb2f114d97ab 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
@@ -421,6 +421,7 @@ const struct hal_ops hal_qcn9625_ops = {
 	.tx_configure_bank_register = ath12k_wifi8_hal_tx_configure_bank_register,
 	.tx_set_dscp_tid_map = ath12k_wifi8_hal_tx_set_dscp_tid_map,
 	.reo_hw_setup = ath12k_wifi8_hal_reo_hw_setup,
+	.reo_shared_qaddr_cache_clear = ath12k_wifi8_hal_reo_shared_qaddr_cache_clear,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9625,
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9625,
 	.rx_h_is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9625,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index ad00c182c2bd..d636f6ab60ff 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -907,6 +907,29 @@ void ath12k_wifi8_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
 	ath12k_wifi8_hal_reo_status_hdr_parse(desc, status);
 }
 
+void ath12k_wifi8_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	u32 val;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (!ab->hw_params->reoq_lut_support)
+		return;
+
+	val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+				HAL_REO1_QDESC_ADDR(hal));
+
+	val |= u32_encode_bits(1, HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY);
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(hal), val);
+
+	val &= ~HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY;
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(hal), val);
+}
+
 u32 ath12k_wifi8_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
 {
 	u32 num_ext_desc = ath12k_wifi8_hal_reo_num_ext_desc(ba_window_size);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index 94732f82f614..26a24731cb06 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -129,6 +129,7 @@ int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
 				    struct ath12k_reo_cmd_entry *entries,
 				    int n);
 void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
+void ath12k_wifi8_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);

-- 
2.43.0

