Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB9442B08
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773356; cv=none; b=abKmbrvEck+PJoERP+UFBB2bi2OjeD4Jd40e1fE/gzxY/LgsEe73HDbdUMpJniUjtgngD5esBh6VPFJk7wZaF/oCT5oB4BYLmJARJErNBMG/nkUfl20+zpgXk95q6KQl606J9TpGQRepviOIkdpKFGH6xooFdzsj+qjTSZVKzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773356; c=relaxed/simple;
	bh=cLT0bftYuWxI6XzPRjJvBq69JkHwsp1xKebWTnTY5JE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHd8sO3bXGMSzgLfmtq6Ii22tycsj+VIlreY/nuga319LgPcSUGSLonPuQrA/Kvw3yTZace2BFagWgRudEBf7C9+YQ+shGXTG0b/YPLz0c3/ZLbiaLWu0V3osIoQJ6yCRXtIEyxx1L5TyZc72K4r69gDpBZus8kJk9LCmFPVY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olei01Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4JVNlSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olei01Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4JVNlSV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879AxkD4188569
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l0c4thTN4BGGYhL3ienR3lPOHCXz3GdcGl1jf05y8VU=; b=olei01CzL/AWquQ7
	391AgbwrNfWZWuvLggoUghIC7rGkmGEimLBtmmcmDKpZHdh69UsX+0lI/LZT5llB
	t3F7dRHxiGhoG8FGZWadQ4SBAwGvNh6F9Vb6ul3nm+agaE0zxd/tSxGn5ooVufrv
	2gxzAF1CVNCDL0rf4GGqwjhJrpOElT6nzvyRM0BjJ5frO2hj7rOeU6CV12yr5oRd
	PggkKtT4HHzCfqG6ohq8thatxPLfDrJCqtuM2yS5KQnVRZgsc0fWTPG3iv+d46zO
	ZHTgU/lkIkbIA16aX33fGTLSgUiW2YRKESbUJy+t+qGwrIAd+0DvtjdIFkqWtoyN
	YlHG5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqg39g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:29:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4732516a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788773353; x=1789378153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0c4thTN4BGGYhL3ienR3lPOHCXz3GdcGl1jf05y8VU=;
        b=d4JVNlSVuTHjxJ+VwbYJdLpchqdLuVWjFL+BJ8xbMJj4evKZ0um/sp+m563iVho3Qx
         CY3PxWFOUjQhxJq0i127ZAwm8qby8wQ2Ype/kEj2r4A7ofi+I/FpiLnJ0UFRbIobJoAz
         +1pX8AWCOhyBfjl3g+XW6ZgtwhAu1Dl6Uo9tzZXfPVA+noGUVsuwUYD9l9pIViRMdDrE
         tLokNgk4YOHY0NI38OFbz+r8JHh/L9q/baL4UxLNOLTLpESN2fdsveSnzlLvpNZJ+hlE
         SJXJBIvAyS4lgAA8GzlOrhtRWtDfbw5Emh/bgTZ4R0KlDYg862l4aVuJZguArIrf/5lx
         +6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773353; x=1789378153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0c4thTN4BGGYhL3ienR3lPOHCXz3GdcGl1jf05y8VU=;
        b=rBepWm62TFUtfa/Z3TjMoaWjjo1zgpPDvLb9UWkLMctb9ChSlyffb41TlIaJla5Jf7
         V1iiXVnx+mEZ2KrHjni6G/knGzQaoAX0BS3DZoXi9P0CW9pmiKRznHREjcuJCAVSQVKb
         6dBRcL5KjoNJFd9jmb73pO+ClNsXDvIbASEuLhdx7+TsVqkmfxZa7u3/58gs3nATdmG8
         PPcp6zJdGDDJImxL99O33j5dX33mnBMJfrtSnXZcSj3Iqq1MELlQwh3z6epDyJeKkIeU
         4+kErfElU8JpsrMW+39LbiZc62MODJg/C7PXykAaS5nG1j4VFFylRiTP0eLjw2ohk5EK
         miEA==
X-Forwarded-Encrypted: i=1; AKwUvByr3kyJE1650kdonCAdWDKK30FtUjWsw07CMHZ/C+15RqEeratsHu+v/CxPMglrB6kYKuSl/ejJVQepUp4=@vger.kernel.org
X-Gm-Message-State: AFuF++ka22uk56TW7cFi5BWRxPfnLXYCwpIX/ywBd3O/07bfkshJh88u
	qsBWRw2jsWvkxFHjVLARglOUwoesvzoCiUBMhSHe/RqtdgeHVlWAPXkdejePM1dbVf8CpoImROf
	M3wpk2ZTZCePkCPEGVU1zAIVLvJGkr0rqdmZC7JyNYMGepnf3SJActP1kn91sE/3L5no=
X-Gm-Gg: AYBFou1zX2GHwusHWRpnp6E0CFZ48ZAWA1GyLz9B6fL7vaByqMdx0fyloToSIJRseoE
	8B0Seh4xnsaucU58egDOAMWC3fKvRXKdTSWrkd3ZowN7QS4c7s+HilSE6HiofJ1QGRXoYp+afCN
	RGi5Upla5gnGsbM6NX8piyLoGLAYNHY+XgU5q7p9KFM3mIZ6psoLH/MVts9aZlIrH23vec5wvby
	UpJdezzjpWtFGMe5augWPxjZaGenOOTtkfXeyDHgs8LxOEMHDmewtQ4trClkHF785gGLCL2BkiG
	wYAC0L0406xPOwUkKlUSG+qfyJC1GTcrbLeSV/JjDOtN39UCEXQD6Uay0sRUfK+4Frlbh6Ulv+S
	As0NimtszAbFADyHd4cRhPwlED+vpfZsEdw==
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr35910554a91.16.1788773352949;
        Mon, 07 Sep 2026 02:29:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr35910496a91.16.1788773352487;
        Mon, 07 Sep 2026 02:29:12 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm1627830eec.31.2026.09.07.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:29:12 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:58:41 +0530
Subject: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
In-Reply-To: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfX4wwsLwgTlNuo
 aGxwIUV6YrZBIhQcGA++OjjYn84KBs851bP+zx98ZFIWTM8vbD78aAlbkzEj+T0DproptkkephY
 dbiB7qzykFTTxHpUlB+fuEmpFSKByKzFRIGrkkNxumaON1+PY8z55J7n9vjSEMgO/mcT973yruk
 U+0N4TbNwbLiuZMybbw2kHBE2DlBRQBtCVf/4YsJ63XJUe4djxA95DHiIH6MFJrgO3B+Kc9EXaD
 EGJ40GEn1SvHS40H7emgzCQCadxY1Xs6r1a8e/Z5F7pi/Q1TZCT343zhgWThfbDkK7rCA7iKl7Y
 guykduVaU3Pp2JfYgscuNodJzZGOI4NDLru40alNUv4fZYvS5+JLWO2CgWE+tDEg5iEkjX0PuEA
 GzQbAdmIH/ktgsZH4NUzK4N4A6HAGyTsBokeypQor3/u1/EU6hy/UJYhZzjfjKje+9xGlZlFcM2
 hHwuHn5knWvbMmN8hdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfX3MqSXh0hYQEn
 E730I5y0u7cEfqKy8Wje+TljrcYhsxUNtOKKTWPP6BtCL2UthixNP4gFNyvAvBo81xPxzwuboNe
 rS69+OXjK94wo8nN8UxsfAvMPZdzPQM=
X-Proofpoint-ORIG-GUID: PczFKH9HT5P_jeiofLSjurm9h1ohnGOR
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e83e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cMdrFq0U01fV1n6vpx4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: PczFKH9HT5P_jeiofLSjurm9h1ohnGOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070103

Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
is enumerated as a TEE-bus device, allowing a client driver to bind to
it via its generated UUID.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c        | 4 +++-
 drivers/tee/qcomtee/qcomtee_msg.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4212572ff54b..aca4e8c6e37b 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -753,7 +753,9 @@ static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
 
 static const struct qtee_service qtee_services[] = {
 	{ "qcom.tz.uefisecapp",
-	   QCOMTEE_UEFI_SEC_UID }
+	   QCOMTEE_UEFI_SEC_UID },
+	{ "qcom.tz.tpm",
+	   QCOMTEE_TPM_UID }
 };
 
 static void qtee_release_service(struct device *dev)
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index ecaf8db67d45..87f1c257a877 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -106,6 +106,8 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
 #define QCOMTEE_UEFI_SEC_UID            413
+#define QCOMTEE_TPM_UID			81
+
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */

-- 
2.34.1

