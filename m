Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773829;
	b=bJf8nYpy2Sy8SfSL1sQAOTVjBb65jF87letMOFk+gN9RG6Po9YInWdKAlLChd1Aiwnuw
	 hqZjO791GMgdBiDeR0+BsowkAXq0HuY9lkc2643pcpmVpjKQqgp4nTpn7khoZhbNqFykM
	 eNW1kL7qrPvTciD7m6mFXI9XFzQOulJkUc1ogZzKEI2cHJZmTR2XYnAoAU5M5E5sFefIB
	 YsxEY7UTfSQFLnR33mUPQvQLxQzaoyvFxFZMs5bkNYhcgwWaEoAoX6Nbtsulm02Gtjuuv
	 2Yquago9+ia/GUdVSYD2aTufP0E4rxtrlu2/IuKDqTRUUlP4KTPeQnkxVaHaQo+/gzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
	b=puvxmT+DVpY8khJbHWtCaT3MMYiMUI9n5Hsnen9loMhdgjhITqeX+/vnQb15on5TegFW
	 ZiqxXpZ8N6leF6G4toUjszrBZETfqxjXO7O0mtO/UeWpI0oInfNaKIsbjXy8eB4tnCZwY
	 JU9kjWVAE/radIzanb43y2/f7n1J/a3dv7JjKI8zEOpdx8dLYmmT89vOPn4Qn78FDTxxk
	 RPH0jRy700ZSKkjTehJ5vP1VB0kizcpfoziC6h9mNzZf+260qdpSzKwcHLSUJRy82prdV
	 /HxB8Y/v1R7nAVcLyTCCQJkOBGArqFEDqSiX04aM2MnAsyRpd26fXRDwsWGvic+LKGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AEpwSuDB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0Cq44EM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59367606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59367606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AEpwSuDB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0Cq44EM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7Mc193444
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=AEpwSuDBXBr893DP
	ptRuIdI3D8LXLves0VONr22OECRU+8fQ6tQXNqmQRhEon144OlZYFQTyYVpngLRG
	CnakAe2vXFdx8O3hW3OHDa/opRpxnyjxrWmDnMqfWcXTQNyPy9927WWd8dY1FrMi
	ur8WtKlyQ507Y3UmMNPE/Nm15ZHbMN+wN3Het9ttmrMaZwcQ9mS7Yb50HXJKKAYl
	Xmkn+QkhgIrpXGaKkicVDsHI0dDkG+CB8KL8+TmHCF6ZrTvJUF48M6JbqUFXV5HT
	3X2Skc2RLUXmVete/9zZEHj3yDJd7IlYptco/tyzQPOUTqGaRdg/l5akxbdyySWm
	I6QDZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njbk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:30:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so423908a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773827; x=1794378627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=Y0Cq44EM4wFtZNpR+jEooBpqfjrtWXKmhR5jxgZWVKYAtfhyphkYjoY/V4ooinuwnB
         +/UIRr2egxQRPtK/+NbO3xuCEp4gtTq+ycxixG92XdtMj439PqGhCIgPTuNEtLZNbaUd
         5zatXcPRqk2Csqoo8kMW7CDS2F0Mx3viq+VpzVHmIIp+nIUJOWe2JOoMmvZdHZ4cY5YJ
         EJf3QH7vt0/OvjxGRWg8a9njvjFRXeUWyDEeF9O/+23dTsEDET0wZrYCWRAyNQbDSti9
         kTBCzLVkr3z7/y54qt9XwlowXmaQQdEvsmG/pgNGfPv3ovolzW3MoBL8D4w0MLLl/07j
         21Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773827; x=1794378627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=hkbER2zG9Lmfmggi8HrDzMIw095iPN4wUYAIk0hpqcdHP0Y0Dm2rMWEPiT3OZPQqr2
         G3Jnoxn6+UBQDMhOkpuqdP56n8BPFvDe9LYR+ruHI3m66tNTgCisd90yAMXuGFU5OfHE
         zSIKvTXSo/t6w2Cm2GRErLzrOSQxhnHW/yXPNljr9nAWiUe5WkgIWBwpLXHzfH4orpU4
         5PPqA7ndQdTMB91KVH4L1I1MqYO2/bFJ/ew4fbm8XhvhdlWKtL/uL1UkEWESxNEfIhxH
         YZgqgdxwxUsJgKEOiIQBcbX5Dgc8Bv3jshsWTH/XnCaabApXQEAo0YB8aNupWhqzFkCr
         gK8w==
X-Forwarded-Encrypted: i=1; AKwUvBz8d8KVfHRVZXKrfi15qvw1u0BHLABH+9ApMRfxCfB0CRkOPS5gbyFqRDqF7fTmssm1oW+HHObQG0ksOtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uklVmg7v2vszUFrpSsOA6w3HkdpjVxn6U39PRg4yE6uT4D5QJ
	EEg+Sb3a5WAEATGQI6ekdLYPVkbkD1JD5nUJCel0sXrkUVSE2LhuNhGLgqDy763ZNh3Vf675tnK
	GDf2qOvTork3ciaPZ+Nqo2gcw9QznpeXD8hsMEcsUw8e+sdRDtaU6naw0PdOi13Y81KU=
X-Gm-Gg: AYBFou2VbOT9lcFDBU8JRnwwLy422RfM3cjNulorAPhV6D1Y38QHcJQjEIITiKQq6gn
	jMpIVASgGOW5CTZjN6d6GzuOTKXTv+aCmbMRiLgxIpxXlh1MbxAPZANXQUrYOlT3bghDUSwyfE3
	Od3jCgMgzaewplmtiXfboO3lsDxwVD+7Sc0SMIdJPq8PsRn8Jymh/oRqzf7VnoeUAbh/BgD6heS
	n1WLPb0VkW+mFMP42V6OFpvbU9uYs1xti7RsW67VIQMxhG1EMwsB0uPmX8rPl08fGcJ9Q6lglG4
	NP1Gq8I1wCfAUspjAC3BO1X8YDh+a7fHLG43QnKzZn3vJinKha+pAPZv9eH7E6EkXCGUfbIyl4f
	07LW6aFog0oVCl9jHlXILVznysdE12N4AIdr/tNKD+VnoweblWgPLiUdbt1Xwl/mx54TQxTddMR
	XX80XV5AMObiAvWs/VnwuYa0K8UH39pvgtwFhYd9lQ65i6/ccOFXcvDvh1bERJ/NKmtMkm83WhP
	g==
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr13784749a91.31.1793773826546;
        Tue, 03 Nov 2026 22:30:26 -0800 (PST)
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr13784734a91.31.1793773826046;
        Tue, 03 Nov 2026 22:30:26 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm2420646a91.5.2026.11.03.22.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:25 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 12:00:07 +0530
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: rename m3_mem_region to
 ath12k_fw_mem_region
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
Message-Id: <20261104-m3_and_aux_ucode-v2-1-b6c335c14dfe@oss.qualcomm.com>
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX+6PLJi3EVbm+
 FdRX6iVTElme7Q2VUi6vimmf1K1f7QtHVK9ay9bG+6J0UMIoUp6W56WRA7Gc95XIueCQXgUNvhF
 HEdK8bXfY7l4h7XqRv+dSRxZCziYf9tU4iRdSmO2zsctpXriyadR7ZZwG5E5ikhgLF9O88nskY0
 lI/vz+I8ucAhtDAhTrvVSXOfiN6C50LuutB1gUk3Wc+siuS7+Q5D+lA3gPy/FXU0jQVPLii85/e
 l8PiyDJfVSGPeUS0VgTjyrugbKXJW++8La+GnBQ0hgyr2RVwue6vuzmdf/mCeXUrJWvNzHEQKFB
 pUfyLcK2klOoKJjmna8Df2fKHeuWEh9Rp9oUdAzvuA1uLFqpW8cVtHvX/uuZ1I2v11F05CTFiUJ
 vChVgajYX2toFUDVGuzwhTAOjNR//7wVFl7PF1sksj8xrkYHipwWUUqF6i1/dKY0USZWWh3kq5s
 xQcFmkbuTfVpigsq8XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX4XG7U1it0ygj
 QTIP9qCLQsScIB33Mgdp9h0ubu1uDFqS6x3OExPsFOeYG2r0dNaw3wUb5D/0TdoJaPyWvL3/d48
 u0+wDHfyqFz9MvpZQkftdbeBT0LtXoE=
X-Proofpoint-GUID: 7jQWomzkmnsrP5EI2CRTKebcReTEbkyZ
X-Proofpoint-ORIG-GUID: 7jQWomzkmnsrP5EI2CRTKebcReTEbkyZ
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aead103 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J5wuaM5RjebvB5ep-PMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040025

struct m3_mem_region is also used for the aux_uc firmware memory
region, so the name no longer reflects its purpose. Rename it to
ath12k_fw_mem_region to make clear it is a generic firmware memory
region descriptor shared across m3 and aux_uc.

No functional change.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++------
 drivers/net/wireless/ath/ath12k/qmi.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..b1efed1702cb 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3227,7 +3227,7 @@ int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 
 static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 
 	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
 		return;
@@ -3244,7 +3244,7 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 
 static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 	const struct firmware *fw = NULL;
 	const void *m3_data;
 	char path[100];
@@ -3309,7 +3309,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 static noinline_for_stack
 int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req = {};
 	struct qmi_wlanfw_m3_info_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
@@ -3359,7 +3359,7 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 
 static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 
 	if (!aux_uc_mem->vaddr)
 		return;
@@ -3373,7 +3373,7 @@ static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
 
 static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 	const struct firmware *fw = NULL;
 	const void *aux_uc_data;
 	char path[100];
@@ -3435,7 +3435,7 @@ static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 static noinline_for_stack
 int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 	struct qmi_wlanfw_aux_uc_info_req_msg_v01 req = {};
 	struct qmi_wlanfw_aux_uc_info_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..e43e4a42aad7 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -118,7 +118,7 @@ struct target_info {
 	char bdf_ext[ATH12K_QMI_BDF_EXT_STR_LENGTH];
 };
 
-struct m3_mem_region {
+struct ath12k_fw_mem_region {
 	/* total memory allocated */
 	u32 total_size;
 	/* actual memory being used */
@@ -152,8 +152,8 @@ struct ath12k_qmi {
 
 	u8 num_radios;
 	struct target_info target;
-	struct m3_mem_region m3_mem;
-	struct m3_mem_region aux_uc_mem;
+	struct ath12k_fw_mem_region m3_mem;
+	struct ath12k_fw_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
 	u8 dynamic_ddr_support;

-- 
2.34.1

