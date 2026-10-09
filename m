Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC5470EA1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530311; cv=none; b=SRypo47Y4hHqyiJm/7OfbpBqA6cprsNP0qcUtlU7aAqDzJ8vtDjrAptwgzeGokW2RMZrx35JeRkGBmc1Vy/rgBQSTjsEKLikk+gAzBH68vLpvnXp53diDgcT546/BZ34duEEHrZfvco5UXBKIAyOmLqMY0IfF5g1fow5BqeYhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530311; c=relaxed/simple;
	bh=OTmEtMwFJ3b5csz4kyT92wySbEh/kKJ1+mfDTKVexcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/hRPLj58fWHDjP//LAl4+Y3PT8XPohLimPwgNu9v5LHunKqYOACjGEoXTQuP2Z8/kRaigABdC3vcJs5aecBWJE6xPH811fF4yFISTwtsJH8dApUcTTQRp18M5O0lEhgEQcNN72gzKnk7DAKAH3/FQ22rsfHIdz6+LTHg721QeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QogVU/zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCjNzEIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QogVU/zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCjNzEIj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HJRv564695
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=; b=QogVU/zlZwNSyHUI
	Es7j1gu5iuvWRe1RVPpH3XZD9nUQd4SalY8btYKGSmOxAGiG5/nw67BnEfkoE5bn
	zCM0tj8SkPE/HVeLaAFrdXxibmrKEyasGxBAEDKk7Ztrp0JBnElH6nyDpjmDLtT1
	/h72Fjlxo4RaMXG7WYyPYfHvF8zWLhSnVTb9wX1l3dSPSSFGiPMQ5QMNljSUchM5
	rzloC7TpA8FcePLh4Y90n8YJF5eZG4VvuLgEMJ8is7VP/MqF9+juI/qpf+1xBH9t
	1nbFaUDa6NTEWdpcGbxnSFnPedxroifTyIKupFgpT1iR8xn9srhQd5SkIn0oB1ek
	3O2mfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkabd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:18:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-892ccb01fbfso1716649b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530308; x=1792135108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=;
        b=RCjNzEIj4CjZFckwyxxDaANo5CRwe99Of3n4vLEUWrCIrKQe5fdmFpP/U8dgyoGEXJ
         af35+XRWP4Gn/POK7o6cFj9UNVnTwYs+SQE9b5BlJWrd0FgminqrmYrflNeQGe7hMKm7
         o5okBIEe+Sh2l9XRPOyjxFdEyinJQanj5MIetF8hsYMeSbtOrNXqams4MgEDIzO1aK0q
         RIdM4LkfDUECJIeUiAhPpyJJkJbGCMbJ9tvgzAvUaOHhDEd1AGp2qhQOlsNzAptPNf3M
         9TyeE1QqE39jNTa1hWyZxpdIV7B6ULeXCPN6k0jleZv4g0VXwT+UzX37MPaDDaavbeu+
         gbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530308; x=1792135108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5CmkvST7kH/8M/ZSQDpIQaKjiyEuI3GmuSzP1U95Lo=;
        b=10s5wuwAyesMqRuWMt0agYsa1qrmIt9xNtpdVPE9Q0XM60a//2EWlRZLZXZ1jJNY8Z
         e2P8o4ZLznrvZHY+GdXML/JEP2iq5R76Z2Rv459ElrRXNDXhodnyxY88qK5mQgKq4LHp
         bJ0ICF6vNDCxMbz7fQl/lwOvPqChrL1gCtrIZraXLxuV45LH+GoqFV1Fcg7Zc5gdFDWB
         KJeAwxVcKK1kU6fd+BAo++VQCYRkIiSpBtHVrVqORBLajLOcs9NwyULPbs8diCUKcAvO
         Efm3+RXMVVDrO0on+Fd0F81UpIoj1+zp3kVCYKDD5XPy8xq0xnEhrqosHj7k9dkI8F5x
         5evA==
X-Forwarded-Encrypted: i=1; AKwUvBycdOAAVqmBZeUr7twiSt0+h3goDgqIaY48zXaaYYLY7XWhsKM5SpLu56Bl1qAhjIl2wl4io5PWTYM3v2E=@vger.kernel.org
X-Gm-Message-State: AFuF++lFKyhT3ZJmkcUCRIlKlp27sFmfAtQFURMURm3ndRsGlMBQKUUc
	RCOqwS42D6oP10c9/KvMU6yPnznDaQwbkNPOlOhglc8JvaQAN08jIu5N0OAX4nHK1IluzWh9RZH
	zU5HZiPJ8KlqPkG2iuvEvLLJ6Q4K81UHWwF58CjWY5d9rO76FmqeR7JUWaY3tIkDSXEY=
X-Gm-Gg: AYBFou1NUN4x4iSYS5JGGaSkQ4M161yChD0mvGVTuGWrJ+d0SMgnN5ZuMpA9W+hyW1J
	PHEOkCUb6DOq7RBXtNe4DV1haIjRS1yTJyR3O6u06lL7l+nqxZu96yJnryZYYT1O8Cz5sMrEjOX
	b8LIgobi9rhe1X/iKydVA48eQiy2bHj7JfxTD1h2SnpGAv2g0GJqsKqOStau9vrCyc3ZQ2zMEks
	ijjontLsh2SUXQSSR5519+XDdaj/3o4cdZ/nvYpYDqCntHZr75ImYyrimpXcowxyzW0HQuKOLyM
	Kw36YUdWUV4a0cOw8Rc0mfvIH/ElrRNJjwWnMcyMW2/xSJKLIq/0pRHfgoxtLn5xyvB8PCIQF+P
	VbqNoYqjChklkNEjL7/r65S+qBJ6ag4KlLzBsEcXHMj/tzF8Oml/dqN+dqiU+kgxVa8wXB3aEiO
	dWHgbT7s/N0kUC
X-Received: by 2002:a05:6a20:bea6:b0:3dd:85aa:d269 with SMTP id adf61e73a8af0-3e16bfc5353mr874026637.33.1791530307921;
        Fri, 09 Oct 2026 00:18:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:bea6:b0:3dd:85aa:d269 with SMTP id adf61e73a8af0-3e16bfc5353mr874005637.33.1791530307450;
        Fri, 09 Oct 2026 00:18:27 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:26 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:41 +0530
Subject: [PATCH 3/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-3-96cc8ffcced3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=2056;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=OTmEtMwFJ3b5csz4kyT92wySbEh/kKJ1+mfDTKVexcQ=;
 b=lR6Cc4zNjzy1xzSzf0hnefL3BTOyvUqlO8LKtDkEnlgBq/vu8R6TakzqPbs/FA0nqhQbRSHsS
 K4JmgZiRC20DIze0Eci3kz7TBCfDgugOUGiKVYdtQ8XOC5UeB/qzvZh
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Bf5QIoLor8Dt9-J7ZRRYaOBIruqW5gTv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX86IUx2/t2tSk
 HKfuLOLPqW1itZGYzGEqn/L8FFxzqh5b2gPHwtoH8PnjQvkyABqwbi9bWj8T0V+NA5W5STqQ8UI
 w5vINsG+EXsV//H9f4sMFjf0b7KyQ9o=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac89545 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX8mzn2OiM2V65
 m5Ilv/gAvnwI/zTFfg16hsscUHYmX8UDC0j4Chxg/Hdp5ESPKO5ZxW/3+ZaWteNz+Ngyd+S4prS
 HQKe8uwxi2ft9xStmEJT4o/7RORXH1dooMhzPsubIUMsFB+HckeYCiQiGlMB0GlgOfFlE18YJZU
 qBgHYyUTdQpbAXtXyYuzxRu0htguN+au4scIrgsGVVGNVaIWPt/PpfkODu0P7FXi4G0XeURJIeQ
 I2eN9vi/EWHHuTJBnLwMuvtl169UBLUeQWlqCLoRZ2/HBDTv+/q+eUXPM/xhiYTbTzchuoQL5E8
 L9KtkAtozsnzl2zdUIgiRcq0IwpnCTscCWNpUyEu1L8n7JDwz1dWnAUAxHpUO9NjTOdy8Jp0nGL
 lu0oF3M2yHg1S9GLAjpDTcUSqeI2wz1MSAkYv5kavcEFP+k92xgYGuooZ/+pj4l68tX1sQsnuvt
 FF5TNzFckHjjlE5scLw==
X-Proofpoint-ORIG-GUID: Bf5QIoLor8Dt9-J7ZRRYaOBIruqW5gTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 604dfa947340..31fdde351bed 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1997,6 +1997,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data eliza_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2025,6 +2049,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.34.1

