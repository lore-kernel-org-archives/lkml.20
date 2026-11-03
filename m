Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726768;
	b=iFXaqIx34VrDM3LirMqKdQZauwhBa8cLR8qbC2eG7dAeJ5W5/3pEvpyH1R3vOfSlHnh2
	 Tjr0P62bK5bv39bJeCw/mAo3GLWrFt9odv8bLF8s4AuVSYfDh1kBYNPqF1FWG6cIJhbbs
	 A0vC14db7fk/ETSES12IgGeK9J73xy225Mao/imLk0B8oUZf2Grg3rARJi5yG4GY5rVBM
	 ZYlqx+zCulxmtPLdaBGYMLSboRM6rHBwWty8LSfVrrEdUpq4CT5mOAghDcWLLWgSkOLNe
	 rDzU9ReOlBGqis3BILOdCSzBO4O6+Hq+HXSwKnPRUfg/oXYyExDniOe4QXRcE2yczHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
	b=iB7C6j1R86lKYb/1KwIjeo5oGVWhHIx3rKlHSmZ42+SHu5fXzjRXyGkKOCTiOuHgD37Z
	 QR0abuG+6c31CWQ/aFun1vQMBDMqQ0RS2JPUQ50dGFEiB0Ln3mPuCByCbo/VSoA3BDz93
	 l512H1HOv5sd5KjY4hkOZpnA0F0p8p2H+ii9cxejR7vV7O0nqhxgpdyHzKuMbpwoTrAgN
	 hLA2tlgkbexhyI7FLbFV2NFuSrjQ8Tzs8Fx7BJXaWHVVuTfPfNtskKG3mnHxnEANd3whF
	 i6Stcfb+Orlv9hANQhHORyx6VkdOUN+kPpWhHIEVq13CrYkZ5h0zu9X+mYOhNeIEALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPyFHDBs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J79yJ2Kp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72352606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72352606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPyFHDBs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J79yJ2Kp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPWXg344440
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 17:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=aPyFHDBsXRkWmU9q
	eWjGabTYD70+YC4gdNFEPcZClMGh1E20RTDAHigJtsgcoDts34GB0MiPkUpkufsh
	OWuqk/WWngQeKza9d8JUzA/XpTW9PIfW5iCr1ugnBfXmYOzAWZkO05igoGLDYc2n
	tKpxrcgUCaabRyZ6c36Ip2U60w2EktU+9m+4kL9qdBODF3dmmUNpi1w37hJ8KhDT
	mDzs+XDI7ozEA9pMj+pu4lmcdk9mYzV8oeQg9JISxeREsFVIKRWstschb9DgNOnV
	KXKJ/Luv6Egmy5BzJpHt1AQ3PuF6Ijp7m7CK71Y2vDg/+r0siSJpT0/Bc6SD3Bp0
	kCt+yg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dbce6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:26:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36c9e87d262so390239eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793726767; x=1794331567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=J79yJ2Kp5bR7GLTyfmL+nmeqiy5y2xITGWfQAo7nR0uhYkKpm7WhhyHzdmJV1zAfCz
         vHRmSHNTqwa36Pyl+G1IvMfHTkM5QFfzqt1xbYUKqW7uPgn+UWxH2LYw3Ae5k7uoYtG+
         yVcI6LwgCWUX60pYhE/7IL7BKant+J8lQZTpXXUUcALA1nH27PZ7Dy9THXW4K8yXCH2u
         oSKyXK+CIFkIz0B75eC6+Ci9aA7q7WX1SILNgEaWYrJsD0laZBKywMEEnDXamMeaQlhQ
         y9V8h+Q08tQ07InyzhmF+dzZts7jowkzrdAla0jwrdZwvndW7qrWUBp0/AnCmTVXets8
         7c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726767; x=1794331567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=koupNFWZVUHtJeDqK0+kp9iM8bPIu5EBkb5XMQx83YmNZ/3W6nvCw4Qvcc6jlXCYAr
         vRtCeRSAJrhSKvzAQ9jK8h8uRZ6LKT0HTiW4IHdZjm8K3LDMSnGUOXKEoDR3EDrZPbCB
         HmriTE82bxbefgX6VZ+5ZwlN9DQaVx0xEhwQjhV1tI80XFdhhX8AU4pD3lSJXhGibJGX
         Ta4sg5GArAbuNXjf+eWEN6zhaMbZN/TLPRGaSeHkKMLUj5nSp4/+W27Gc0IB9m6jl3fu
         Ig1nz5TAkmWtoQVuxs3pLBcmR5MDnPOhhNJCpiGh+eq80Bq+P5qbzUn7+UMHUlCA9Klf
         Bpcw==
X-Forwarded-Encrypted: i=1; AKwUvBxbg2fcVi034LqAdOP86mmqNhREcD+NefhqnH0WWm+NDobcdqbRnKvlCprVEX1h8K06bRoJ+DJEWSjZmpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vNwZR9nkqT0bjLkoNjxZrv687yShxNHu+5ZVuNvRfBGV1XTmg
	qQKwTFS5H+BBg6zTq2ydAp4gj8abuk3hM0TNhTpscUDex/7Ru7wP9RUnOjhZN+RDYiTdpqXoymD
	TEyBYZR0yx88bmakWsBABrxLPuZZaxmVNH1cJ0ZV3OANrfNd/obE2coVPOHehIUhBZ9Y=
X-Gm-Gg: AYBFou2KtwGCyj6QipJO0Q5PHwG0zg+tIPNs8DwDKJ6yqW+gSgw+KCVXmEzkwtaUfh5
	bHGEmypQTodYDnCG8e7tSLDx0MryRk/WIL8uYB1Hsi8J5VmEav4QD2gPPyvc72rdSFbFLVAkPFH
	Wc5Al0GUiTxP9OKRV8YsCZgK7pHRqp7WPW4Y1X/2JSiwBq/7xhOSGt8Aa55RtQYjo2fvkscE0r7
	fTVIFe4JoSgc8QmDBX0W92opRuqtqkM19zhYN9BnRrognolIkAY+aRILSj5Syq3yssXNx9hL0/F
	YNDeTKuUXa5STSS5RCFmE7eYv8CqIrF4Kt/Ohib9GarrRg6NvtJCXPpdWMTQOs3adVH0Icrl7uo
	EfsZBGIGk0lEdjh2eXTdtIbSlGtdDYqByOjV0nhwlG1YDuN3OSX1nSRWb99QWYMvCpJnSJRrIcu
	K33/Bf2J9jqbUJhtNjcrJaL4ZDnkQStm0LHMfOj9W7wADPJZDgagvDIhRKPfcM7Mh7stZvpFXZu
	1I=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr22902679c88.3.1793726766704;
        Tue, 03 Nov 2026 09:26:06 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr22902633c88.3.1793726765841;
        Tue, 03 Nov 2026 09:26:05 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm357310c88.8.2026.11.03.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:26:05 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 22:56:00 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: rename m3_mem_region to
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
Message-Id: <20261103-m3_and_aux_ucode-v1-1-e14f13fdfa41@oss.qualcomm.com>
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
In-Reply-To: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea192f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J5wuaM5RjebvB5ep-PMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfXzAfDCwy2GzDx
 aiJef8seemLuEFiL7ZZeLNsRw2QOqLhaKtgsLPMxwyVZkeLhUVSuYItBCkKjYe3T2Su3VCKL2Lb
 5G2s4nKCOynHSTLb2wItQIWRouxiUi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX6wXKQBKhc2Pu
 zrCsLT7dAfZKdW8dNk51taLAul3qx0xkgaAxqKR1EEKP7zVl4w59WmVM1Rrgy0TZi9454w9RMhG
 jJxmSXKpFRwn4h1GJy2M1WGsU44lTvZnFqkLb5ljY5bUpjgRazj5sSMgivcfgHmr8QYambEPZ18
 qey0SfjksLm7uG5e9mDf3159sdVNrVIvy1EoQOfeMHqCcuDsLY0D5hEs/lRLLkszmiZ/izdPzUq
 ReU8UuKyVWH8Z05l2dyduHvmGgMcpr/lezUGCL9dbBHrxoEctjjvUZOS5XvNGJNUJk8mtRyPrex
 HmwZG+m3IybarWbqaQbP3tBf9h85g8JQJGcKxFsCBVaHJk3wLvE3D1preCtCa/bbS1fzn9/z9BL
 MG8uep/XxaWT4kWu3VK/LHYHLmFVDvqJsnD2aMATvhchwTD+MPn6Ns+0ptehN5ekpXu+BHiMwnx
 Pnypk9uhnRSb62UAS7w==
X-Proofpoint-GUID: -vziRVkmj312xR6T8Z4fKyUBSP9hK2IH
X-Proofpoint-ORIG-GUID: -vziRVkmj312xR6T8Z4fKyUBSP9hK2IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030069

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

