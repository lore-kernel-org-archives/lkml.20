Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11523E4C7A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530308; cv=none; b=tAM2MrKWOG7c6VKjzXzDw7EEbAT0LwTYTwRRRrHxAlQL5yRNX4UVn5qrBsKoaF8fKVrI6cLBm/yVtZONLv7SqTRivpv52wXKI4lk/FIiGoKpn5ox9WgqvoOcXNuIicswT0rWpeQH8Vh+4WopUXIqsV2Z075KoMCPLrYG7vj0300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530308; c=relaxed/simple;
	bh=/14AnJdOv4/OEFenFmduUhdKSTi1qNrHOpbR7trhU+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLHaZbmlI3lyolb+O83tEVVgwe/rx7CbRO9P7oG1I7gwirRheFxj1mlaahvmJWlEpQOZAimjQB/zsWIi4R7A69+GnyC6VhzNVKCsgFHq4QOdJTqGN87t5KXJlJy47b77v8S7kUMaMNAB/Wcm4tpAGJiY2M3oixg/vBSrdoMTjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2IDGUmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFIsSmS4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2IDGUmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFIsSmS4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HgjR250712
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=; b=m2IDGUmS6ss8/8NB
	Gty7yCiiYn8caavze+l9ibSDgV78admb17PgJMdvBhoisXbOugNlSUcppq/F7T7e
	GPah92bVlhJARJY2mNat+yD9zaEH8/bkuRkNlRjzsHmifjSwJVLAhpkEWJmPGKeL
	LNsotoorkANJtwfNCIyBJXYkt2hg+oGmWSVDqSlvy9TOSVtntqGkurWWorDMzPNS
	HtWPS2Q6s/EueUq1RTEsnjKff1E0kQEgHASSlM+4XkqH3b/wnYZZpfBQLPVdY+lh
	gCMhsJ1akzg0kcf/Q5S0RjYnQqHkb86B1yCRUvldHSYjWqrQXpxvjUojKPGRWi0B
	KPbMRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqthke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:18:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4980761a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530304; x=1792135104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=;
        b=bFIsSmS4wZZIpH3uhb4sM/vuynvDzeHGPtMPaykryDQLEoB8JlWNjmn+xxZeQlUqZN
         cfrRAGqQuWSElQ2fFPNcPKzsRprk3bpDfWobk+7JBuP5TZo6IxgASK81WSK4l3lNoMmA
         P79aaogr/orJLUhD4aM3d1ktr74K081gfufVtN5mERviTtvM9NzXdSq9rO8AUcOaQV2z
         EkB/zOO/r7JzN3InHv7PA/3z5zLzEOBHU8U6pG7T6X37PAR/tJdVTDV2lVF3DDzTW+Vi
         f7YvjljUvBkDfGL3NBPi8DmsqrfruglgJrcL2PA8uffmJgFRmQ8/zn27khr9JcZq78nb
         /G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530304; x=1792135104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=;
        b=RwUS/7pMB+VlbRavuQmv7Yh3eo+ejgbqjlcGpZQ8quqipmwgUtemewo+PmGu/DjGAw
         McGPwQRdNzyUQqj0j2NGLhmRyTiaeFp3nDy2YMl9pze447swcilAwZGuPivW6Y15Hdz3
         7IX5AnyqpmpDUVWocn6oDHR8EjUQH1cIqHXJbCjf9M87PzjZG9dIzRTmmhiuQMwkIUic
         JzDf20OiOjamjZBxDeJmfcIK6mhEu3ozGUgdzBlQbGQuDnjoGErbu6Skj3znB1QQXpVG
         JiyVxDPw2QzA06tK7HFUUFdgEZlHGYjTpmdJ3B49ExCgjqVE1uU4uInxT5146W/7H7Rb
         oizg==
X-Forwarded-Encrypted: i=1; AKwUvBzOiz5p3JYqosCTXVJNdy/EFmmeUPgRAu7gqwvC1kVRKoSUAB32GR/93+MNjV785dlBwapWThOTzlXZPsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYICJ6kE8Bq85VsQBC8tZwfH+V7AzosryEC8cCsnre23+xGWOhOl
	QWhTYpVKeajdx8+Eu5MHXurOASyCEjwhpP/s75azZ1tEWmaqW4ku6wyoUExY0tyJIX2awK3ztqv
	3TPsw27b6GxCrOW07pCV8t4joNHzWJzCJ4E97wtOlwx6YaVJqUuBwziIi5tJqOzI8oTo=
X-Gm-Gg: AYBFou1pQ1UsiakXzQ+EEarsXSkUBdOUxe8Xf2yr/RE1sVO/KMDDXnn32sCLRevrdDA
	cFAeXWOugTAT1jKBM9DlkEaoUhWOkW3vR81wLA3nZO7xcpwyRp49BkU5GRoVWFKVGPCzdrd4EMV
	iaPfuTh+FlFc6V6HqiDMwKML6w+rjdwRiLpfgPomBO0ypgyoDu2TUxV1csybAyAD9HEDe8NqzZ0
	jY+m+8fSNnIUpDTaU+01CcgrdolKJfwXXEls+4wgk+WWaEb4QTBiNq6CfSBqTUlMfnLRst5IFji
	G5jWOB6j+xcBQdlWpQ+8BC0beWTCDmnFvSkkKWCqUI7x7ZkO370DyqSerdPWv/e2YJRBOjUy9hO
	VOXV4fi6CCtOO2HYDypYvA3+SIeHqTJAIP4vCEpQYwwozSavv3kF8VKA5OKj6x3xbWJ0AMCK2pG
	GuaiGXvE3LmbbY
X-Received: by 2002:a17:90b:3b48:b0:3a8:3597:44fc with SMTP id 98e67ed59e1d1-3ab3a8d4cedmr1187643a91.53.1791530303250;
        Fri, 09 Oct 2026 00:18:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a8:3597:44fc with SMTP id 98e67ed59e1d1-3ab3a8d4cedmr1187630a91.53.1791530302668;
        Fri, 09 Oct 2026 00:18:22 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:22 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:40 +0530
Subject: [PATCH 2/4] remoteproc: qcom: pas: Support secondary images
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-2-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=14963;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=/14AnJdOv4/OEFenFmduUhdKSTi1qNrHOpbR7trhU+U=;
 b=BEGpdj2kUAaVymrOaU/7NMCK8Pb0IuxpVeUYE3ya/CdxrSk3x0/N9j3kDAIKS3yc8uxbryTCU
 /HwATDtBMrlDaIF3T/I4qQQdrRy5zT38Bticq7UCnjOAyH5LTDJLpB2
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX/sVxfP8KQVpP
 J55wKf5XyPShXCugZOwhY7W9hE4K/Qwv0qSqE6ybn1EJ/aYl2C4y4ZKA1a1QqTCfteUDTKPVgy+
 5sMrqF0scrqKXhPROBDipIJi4YCQc54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX7nWsQaTlTDrb
 kp+KlDKZn/66lDgpfpFF1CcEgcJ+DBCZTsAqSI99VpLfdJodkNUSxB9ObJ9BNxYeMa4WRgRaNYu
 xy8HmGjJSC8K98RPRxDcAugsHJcW+5kpRcuakJ8gvxid+Q4OJ7mEwlNJznVqMIzxD7WoEZXQknZ
 WUztLY29io7/EX3mphTN8Ft9rLkGeWEaS9+/Sz1HhOK12heLz4kamXnDrmC1iT+DLG9M7iCGdRg
 rodvX4TkoatNcci5n6TRO/Fi1xOF0ew4KHoEBNYPnr7n1DJA6cyTjAKyBW/5W7/oMiyoeOuvfpY
 XTaO2p7o1z/T8ApHFf4dNGNR/oAv7ILLh3iibEsodifiJu1erZjSynIo+87At+aon5tmZmS4mj7
 bN7gGTJWGpuxyUlEoO4ySUArqYchcLw4uxnN+ZPlNMBnp4NP9deJJddrfG8fqTYhsUo9dpzWl3X
 t5JftjOHX5jRH2bb5cg==
X-Proofpoint-GUID: DVfHumRzU9fKZDRsn4GVnxXZExgBeNF7
X-Proofpoint-ORIG-GUID: DVfHumRzU9fKZDRsn4GVnxXZExgBeNF7
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac89540 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WQtI_U3e13HlgX_oKn0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
remote processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

Add generic PAS support for loading, authenticating, and mapping a
secondary image and its DTB, then shutting down and releasing both while
keeping the existing primary-image lifecycle unchanged.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 235 ++++++++++++++++++++++++++++++++++---
 1 file changed, 218 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..604dfa947340 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -42,8 +42,12 @@ struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -83,8 +87,12 @@ struct qcom_pas {
 	int proxy_pd_count;
 
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -95,17 +103,25 @@ struct qcom_pas {
 
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
+	const struct firmware *secondary_firmware;
+	const struct firmware *secondary_dtb_firmware;
 
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
+	phys_addr_t secondary_mem_phys;
+	phys_addr_t secondary_dtb_mem_phys;
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
+	phys_addr_t secondary_mem_reloc;
+	phys_addr_t secondary_dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
+	size_t secondary_mem_size;
+	size_t secondary_dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
 
 	int region_assign_idx;
@@ -123,6 +139,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *secondary_pas_ctx;
+	struct qcom_pas_context *secondary_dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
 	}
 }
 
-static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
+static int qcom_pas_shutdown_poll_decrypt(int pas_id)
 {
 	unsigned int retry_num = 50;
 	int ret;
 
 	do {
 		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_pas_shutdown(pas->pas_id);
+		ret = qcom_pas_shutdown(pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
 }
 
+static void qcom_pas_release_firmware(struct qcom_pas *pas)
+{
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
+	if (pas->secondary_firmware) {
+		release_firmware(pas->secondary_firmware);
+		pas->secondary_firmware = NULL;
+	}
+
+	if (pas->secondary_dtb_firmware) {
+		release_firmware(pas->secondary_dtb_firmware);
+		pas->secondary_dtb_firmware = NULL;
+	}
+}
+
 static int qcom_pas_unprepare(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+	if (pas->secondary_dtb_pas_id) {
+		ret = request_firmware(&pas->secondary_dtb_firmware,
+				       pas->secondary_dtb_firmware_name, pas->dev);
+		if (ret) {
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&pas->secondary_firmware,
+				       pas->secondary_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
+	}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
+				       pas->dev);
 		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
 	}
@@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_cx_supply;
 	}
 
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
+					pas->secondary_dtb_firmware,
+					pas->secondary_dtb_firmware_name,
+					&pas->secondary_dtb_mem_reloc);
+		if (ret)
+			goto disable_px_supply;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
+					pas->secondary_firmware,
+					pas->secondary_firmware_name,
+					&pas->secondary_mem_reloc);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
+		if (ret)
+			goto unmap_secondary_carveout;
+	}
+
 	if (pas->dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		if (ret)
+			goto unmap_secondary_carveout;
+
 		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 		if (ret)
-			goto disable_px_supply;
+			goto release_dtb_metadata;
 
 		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
@@ -326,7 +417,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
 				&pas->mem_reloc);
 	if (ret)
-		goto release_pas_metadata;
+		goto unmap_dtb_carveout;
 
 	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
@@ -351,6 +442,10 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -361,12 +456,27 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
-		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
+					pas->dtb_mem_size);
+release_dtb_metadata:
+	if (pas->dtb_pas_id)
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+unmap_secondary_carveout:
+	if (pas->secondary_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+release_secondary_metadata:
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+unmap_secondary_dtb_carveout:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+release_secondary_dtb_metadata:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -413,7 +523,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
-		ret = qcom_pas_shutdown_poll_decrypt(pas);
+		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
 
 	if (ret)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
@@ -426,6 +536,27 @@ static int qcom_pas_stop(struct rproc *rproc)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_pas_id);
+		if (ret && pas->decrypt_shutdown)
+			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
+		if (ret)
+			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+	}
+
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+		if (ret)
+			dev_err(pas->dev,
+				"failed to shutdown secondary dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+	}
+
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
@@ -740,6 +871,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	if (!pas->secondary_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_mem_phys = res.start;
+	pas->secondary_mem_reloc = res.start;
+	pas->secondary_mem_size = resource_size(&res);
+
+	pas->secondary_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
+					    pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+	if (IS_ERR(pas->secondary_pas_ctx))
+		return PTR_ERR(pas->secondary_pas_ctx);
+
+	if (!pas->secondary_dtb_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_dtb_mem_phys = res.start;
+	pas->secondary_dtb_mem_reloc = res.start;
+	pas->secondary_dtb_mem_size = resource_size(&res);
+
+	pas->secondary_dtb_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
+					    pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+	if (IS_ERR(pas->secondary_dtb_pas_ctx))
+		return PTR_ERR(pas->secondary_dtb_pas_ctx);
+
 	return 0;
 }
 
@@ -823,6 +990,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
+	const char *secondary_fw_name = NULL;
+	const char *secondary_dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
@@ -847,6 +1016,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (desc->secondary_firmware_name) {
+		secondary_fw_name = desc->secondary_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 2,
+						    &secondary_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
+	if (desc->secondary_dtb_firmware_name) {
+		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 3,
+						    &secondary_dtb_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
 	if (desc->minidump_id)
 		ops = &qcom_pas_minidump_ops;
 
@@ -868,6 +1055,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
 	pas->lite_dtb_pas_id = desc->lite_dtb_pas_id;
+	pas->secondary_pas_id = desc->secondary_pas_id;
+	pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
@@ -879,6 +1068,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		pas->dtb_firmware_name = dtb_fw_name;
 		pas->dtb_pas_id = desc->dtb_pas_id;
 	}
+	if (secondary_fw_name) {
+		pas->secondary_firmware_name = secondary_fw_name;
+		pas->secondary_pas_id = desc->secondary_pas_id;
+	}
+	if (secondary_dtb_fw_name) {
+		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
+		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
+	}
 	platform_set_drvdata(pdev, pas);
 
 	ret = device_init_wakeup(pas->dev, true);
@@ -925,6 +1122,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_pas_id)
+		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_dtb_pas_id)
+		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;

-- 
2.34.1

