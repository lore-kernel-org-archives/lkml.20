Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE9F346E43
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814237; cv=none; b=qt1K5frtUuHmgfl5siLupCTs3Q9XyW3OioG7S4Hg8SB5kpz7qiVvli4irZD97f0GwG9Z3YvIuuWT0jL6jc7b5Wuun3J4nPbh8M4KdHwCl27yO25iezZ0gV2ABeTyk65RAkztIsrboZT+7AaaYkDtFiGmTpILdV9tCJlxMR7mETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814237; c=relaxed/simple;
	bh=3WR3nJZ71sntdLGkiurbZ/vhLxzov9K3d+86+CuSQ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orvkdu33pWzPGBqvRQSCZplGMryDLOUfZoKMMYhwZ1VBJfOBmB0mYwfdJyQGVcT2aeAt/FPKGR5wqLWt43LscfaRyTwsYzV5wzSDNImh1+sxoGLYJq8c/8KidQ6kTVE/X4rN4QXzdrBRDhMGddyY+uCP2F2PdT90xhTApEqaqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgL3jLqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkcqGLHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgL3jLqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkcqGLHc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R7Nk3257758
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tBTWWbwGu6f
	yxrPIIks9EpvxG4mNZM9tcUk9IzPtvZY=; b=VgL3jLqaiB2zxikTaCZnSAINTmX
	2LhtLDhcPq/DiHIqg0Vs6kWOg7RmDnQohs9R04jD6xWnCvZsvjx7tfacCgUJoCTk
	JivOjF5fqPTlgF+9QVJX4vnSDFVujl+UEcEAYZwu+mL4SllTaW45GZXqofUWYM1/
	Gl18PgSnn9al8LXIKMQdXWZ3oG3hNWmX/QYecyc5M0X6Cj2wKmHT5M/xEnhG+SD1
	319c3ZONLFx8u7nZtB/ULa0jmWeng+b63WKEgWqjzkL2RNEYFGsl0MA8u3DVNAxg
	I+flijSzYGX/wuLO59rMzsdNc9FFZ42dnZSjSxUU7z9i79aMBM3GLpstPGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecaes1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so33390871cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787814234; x=1788419034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBTWWbwGu6fyxrPIIks9EpvxG4mNZM9tcUk9IzPtvZY=;
        b=UkcqGLHcdK3XnsOu2jxePLbrPmTvbkteojkG7evYgAD9hBvT3LKTiIAMJ7kM9mIdt6
         +37KjLQhip2mB92/N0zUjLhb/MgTPSu4Xa0iH32Knlg6jKYeZOX0Jkhi9LNhg8HeT/BK
         OAeXHbz5gTYNnOTrcaXYcsYwSTRBJ0epUsjhEmkeVegqlGmsBV9kG6ouqsE+gEaClvQ/
         PZNKtfhkNeoscmXgeyhXu9nJp25mbJcg/ETrayLQ4FjbDmoQ6na4StmwYqjeco5bMtje
         uz4Mm4EATWjItELg/GRSCg6bD/pxj2ndVWf5N2sXQx/HfR0WkNjWkSfD8SXxPzBLBJ8O
         EtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814234; x=1788419034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBTWWbwGu6fyxrPIIks9EpvxG4mNZM9tcUk9IzPtvZY=;
        b=U4YveQfYUXJjVzQszqP0Ci4a1O0BeE4VkxjLtuF/oQSBeEXClR4pLYAxPwccauFA47
         9X3ljf5kUsR1DGU9DXoU0NpCQGjeIJR+RyL4koG+uOVo4qBS/QzCUGU2l6brwFIG4Lh9
         bEPS7ZhFz1BRlIC6ue34o4CTb1W9F2oW+zSPl4A5zCyFhu65MIp25iw+36txXH7008z/
         Tyn6luKDQtwQ8kvQyqGl49ejAsZiE6jrggtJS8LyBhyVN4+Mgd52QQrB0vs+RmlL1ifM
         I6SPvzNGMyPUzP8om9+2to1ncyBiNqvWpGV4YotCq/VsC6OIonwPNEUwvlzv1uYGSDYc
         FS+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpRVhXZjwlZg+WStwe/46dAtlMQbYH9QN6lTjR53Wbjq8gjoEwpbNAj+mNQFSjGAMbkNWttjZdg8HqeNGk=@vger.kernel.org
X-Gm-Message-State: AFuF++lnxXhQJW9PLwHjP9bBiQX59IDuoegqgwqEAaH/k6JsOHmEV6KL
	mPgvSphhGlIUt3/LOFqUmk22MK6Ou25Az8RWp4NuZKZ/Q9vXhh/ZMBpg48DibhHSuFxNa0Imhhs
	R0C/ZMQ/e6lHTpKdLfhhWII01iUIXgOQTN0tAZoK85+kor3Z6LuTlFgcjuYkuLsSFjaA=
X-Gm-Gg: AR+sD10qyfOWJ25krau5n6jeIjuAtlI4RIKFc3tQhoMAkyvmcmV0xNlB91umrwmltjj
	vLUYIdKrapmrVh3KawzBeG4cE+fKK8H5xivSb5ZRcP7ZbHlm/GQTf/EfREVW174x2w01sn9llYX
	+n+tYGNOsyboEzZml6GeWneCYcxQh3asV/xDUExoxfbW5b55SPQdRvLdMNVeMTXuOHG2Lja2DUp
	FrIHz5WuZuasop5SdI80v3m17p+CtAaoKzyavh/97vtrS9vcAFxr4OmMIQSj2yt+qINyqJj++v5
	iDjFRVo7Q74jjxcUaXS1a7eTYOINAVik5nqhhUTZEUb4m+mWlfiOGxJ1lrff7vkJn+qOufVSsNT
	Ujn+NdX7kwH+UrHw1zg3Y2mvAnTeoE9Wrd64lKPHBUR/5IhIhCg==
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id d75a77b69052e-52e424270c9mr153497081cf.31.1787814234047;
        Thu, 27 Aug 2026 00:03:54 -0700 (PDT)
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id d75a77b69052e-52e424270c9mr153496551cf.31.1787814233583;
        Thu, 27 Aug 2026 00:03:53 -0700 (PDT)
Received: from trex (137.red-79-144-199.dynamicip.rima-tde.net. [79.144.199.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0d263dd5sm28306585e9.1.2026.08.27.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:03:51 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, beanhuo@iokpp.de,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, can.guo@oss.qualcomm.com,
        sumit.garg@oss.qualcomm.com, jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: [PATCH v4 1/2] ufs: rpmb: retry power-on UNIT ATTENTION on the RPMB WLUN
Date: Thu, 27 Aug 2026 09:03:35 +0200
Message-ID: <20260827070345.2853821-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827070345.2853821-1-jorge.ramirez@oss.qualcomm.com>
References: <20260827070345.2853821-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8fe15b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qBhfTSQT0jQfJ5OHMlDVQg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=w0io_FmA1e-6CLxyNa8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: RrqYPzWUmpOoQ-DHk1aXBqrBI-MT5CaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NiBTYWx0ZWRfX1AX1NMoGrn7j
 IGlsBfOzfXHAyNjcEtROtRif3Gq7jotEw7qD0E7upe5TNk2N7ANRkyByXIOKDyXq7u6b6ooFGbL
 KvXCKE0QF8H8y5rQzzDpfbWYqRtZh/b6jIxwozEPTZ/VZBd+fOtUngT2Rl7XaNlVlC0mY5NlO6T
 BUoVilLOUWN8GaNaF+zrKcvxs4ThFyN5IJIfRv7vD5TcReE6TqOuH8QuNr6KsoR9p8N/l8z3JVH
 GE4U0vXYQYJy/4OgKwOtaOkPWzvefZPc0QQBA1gH0vYM9nIhxdnqmIJI3Iio0eD/s4gl6ezqO2K
 OnkeTQBS8NILJ5S9CvIZAQ6mFqdyFOYfEfh42D0gMsZ7OkrY1EAgLw7cY2YXvalEG3K8RY1J4DA
 uAVhHCbc/oYXPbPCHuwnv0yJX8t52JD2xqlq2oALSTBFB9/ZF7vAWWuGKxh0jevm0hOvw8sMCJc
 Uv3j4fOrMRb5BIESfSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NiBTYWx0ZWRfX6WO3ySteKWqf
 SwDmrEKmjuCAIBNyF4d7eYRKJC/V1q34rFr+8WgaBKEYpw8E/8YutOMCIPsRnd5XKuVevfCslSF
 46h+N0QyswTKDR7+Z+yrsnuZTj34v+I=
X-Proofpoint-GUID: RrqYPzWUmpOoQ-DHk1aXBqrBI-MT5CaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270056

After a power cycle, the first command sent to any UFS logical unit
completes with CHECK CONDITION reporting a power-on UNIT ATTENTION.
The SCSI core surfaces this condition to the caller rather than
retrying it.

For the RPMB well-known LU the first command after boot is the first
RPMB frame, and RPMB has no earlier, guaranteed access that could clear
the condition beforehand. The power-on UNIT ATTENTION therefore reaches
RPMB and fails that first frame, breaking RPMB on every cold boot.

The RPMB WLUN needs the power-on UNIT ATTENTION to be retried so that
RPMB works from the very first access after a power cycle.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-rpmb.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index ffad049872b9..79e6cd2b20a0 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -21,6 +21,7 @@
 #include <linux/unaligned.h>
 #include "ufshcd-priv.h"
 
+#define UFS_RPMB_UA_RETRIES		3	/* Retries for the power-on UNIT ATTENTION */
 #define UFS_RPMB_SEC_PROTOCOL		0xEC	/* JEDEC UFS application */
 #define UFS_RPMB_SEC_PROTOCOL_ID	0x01	/* JEDEC UFS RPMB protocol ID, CDB byte3 */
 
@@ -40,6 +41,22 @@ struct ufs_rpmb_dev {
 static int ufs_sec_submit(struct ufs_hba *hba, u16 spsp, void *buffer, size_t len, bool send)
 {
 	struct scsi_device *sdev = hba->ufs_rpmb_wlun;
+	struct scsi_failure failure_defs[] = {
+		{
+			.sense = UNIT_ATTENTION,
+			.asc = 0x29,	/* power on, reset, or bus device reset occurred */
+			.ascq = SCMD_FAILURE_ASCQ_ANY,
+			.allowed = UFS_RPMB_UA_RETRIES,
+			.result = SAM_STAT_CHECK_CONDITION,
+		},
+		{}
+	};
+	struct scsi_failures failures = {
+		.failure_definitions = failure_defs,
+	};
+	const struct scsi_exec_args exec_args = {
+		.failures = &failures,
+	};
 	u8 cdb[12] = { };
 
 	cdb[0] = send ? SECURITY_PROTOCOL_OUT : SECURITY_PROTOCOL_IN;
@@ -48,7 +65,8 @@ static int ufs_sec_submit(struct ufs_hba *hba, u16 spsp, void *buffer, size_t le
 	put_unaligned_be32(len, &cdb[6]);
 
 	return scsi_execute_cmd(sdev, cdb, send ? REQ_OP_DRV_OUT : REQ_OP_DRV_IN,
-				buffer, len, /*timeout=*/30 * HZ, 0, NULL);
+				buffer, len, /*timeout=*/30 * HZ, /*retries=*/0,
+				&exec_args);
 }
 
 /* UFS RPMB route frames implementation */
-- 
2.54.0

