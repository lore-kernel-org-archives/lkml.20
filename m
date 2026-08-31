Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD5472F67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191295; cv=none; b=Xe5v/goPUNv5tFbLTKSOxZ4R8KaFjDHG8UchwgGTo8GH4Q3Vl473PWFUnOJqV01VjFkUhLUo33G4StwZx7/2qN5wmcr4jT0Hf3FJkj0QKYcRoNllA1Rj8PtIti0cafDdmX4nSzioM7BItpJCJio+zWOIJZzJR4pM/e3vXiI9AP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191295; c=relaxed/simple;
	bh=55VPGsducrFBA+UqitLk9xJS9IoxNdI2kJrTVgqF7JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiueD3laXBcsXcWnMjFLZf+Ue+7IGKkLPwba6qBJyeY+WnS3MkB76Y+GtRXSp9VRVcsl0gZH2HANK0JKoTJxPbiVbN2IsANR34dz+so44/s4lFhCK4JDJ36oA0qtrlMFHJfLAhG8cVzk1PKnnwwkEKrZh1pxEUb5e+XsBLaLF5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flJICbHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi7iiakD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flJICbHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi7iiakD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbTw3341727
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lRFPnoHcYDM
	nlTrKBHKWdtQ6nLD/+ObQpWW6OKlIDQU=; b=flJICbHk7WkcQ6BGwyu7cD9ptYz
	R2YruVwmtpnoyuv1muhvXN2aTa1zjJBxXofO/cldvl+Kp5yJ8jTnKKgeWLU9AXAq
	hX4iTrVNqgKb0M/t/L+VYbU5u+8uRdJqc7I2ZUwhuDx7x6VpHrVYvn033l9WQEaT
	nzhHcvE6O4pGHYe7fQFGEwHrazxZxGuGHfa3ism5SKyocR4sQ9GY5IBQ7TiuluDN
	GJ9Dh7cucT3dZhoT+vukmHzUuMTS5sg9+d/WgwgaZQM+tv3y4ckCSuh33H+nZ4gh
	TORJaLxeyef/Q+E+cAfw4JOZFlBINGTCwhCuXwlXePsSPigX4t256fC6xUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556t1p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so625765885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788191292; x=1788796092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRFPnoHcYDMnlTrKBHKWdtQ6nLD/+ObQpWW6OKlIDQU=;
        b=Vi7iiakDrnTHY9PE0RC56vGawoS3NeFccoauABEHXO696+Q0l3dGiifwcbtcxgCcY+
         sw6su6+W7rO5o/Z5nwT5FplfNl5sFJ06sIJJPfJQTpeMaZSHuG/zi4Oi81Dlo9qskTC3
         EZtxFQ0XLk31HH5HwxdSd9nF22cIT2vPrnk7oHEiZIChrXOdnZVik9oShQEP1S3LZJWo
         nR542KT0QtH58DdnvWo6IcvF9xx64cpD2C7l705grHoeQfr7AhNRFxXU8g1O2jpA5nmp
         B4VT4Sb/xYnggZEuA7I5eegfc+tNxaB65xc6m+eQAGRj/i0LtaDMbF5OAMaJZgiRfWaX
         DHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191292; x=1788796092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRFPnoHcYDMnlTrKBHKWdtQ6nLD/+ObQpWW6OKlIDQU=;
        b=BBC9237UhOHFN3Stamu+R7gF6UDaHVp8YgNSUXFjUtd2SWvM/6bPb8nRcbLtX4BMfE
         yD5BDoWoYNzmd2nhlRf6YMdYlWqM/3mM/q2DxWIHECMTkEhXMmvIZGhsYIYQRimuDbTQ
         ClaX6sq5f1FmjuLp9lf0mXrVJL6IvIS/KPfgvd8csHxn3E3xYb0lAQgmcMK50Ha3egAV
         vezCyUkSV+TX2lWLzq+vvQLjam4VthpgKXdlxO3aFwJOH4YkWNVYpon/sBQ0k/eNUq3E
         QdzgrYlw90sFrFL4YVFgRTJzJ/DPgxJF3QfP0tmNJKOMCng3W89fuUmd8ytUhMo/u2gS
         qILg==
X-Forwarded-Encrypted: i=1; AHgh+RqGMEQy9vm5tSzrl4hX8zo7vGPmvnOIgoNpdDTB2Pjpxt68G9of8bKaWZ4kf1gTywixTXZIYPR5fMDGtCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCKruHyWVvssVRUmv/3RLQ6+5YvyDG8nqnC0I+Xjc2q/Yhqs80
	paPK5A06wPcY+hye0prrRoa309/xpL9vyD8Rig0qE3wXOl+LAiuEdZxzkWCqZrO2yiEh50rLgfA
	4AXiI0KzeYf9q0z7CE3iTBQhbQVrCL+p9HDZb2BpOLg1SLafle47u93OzrVVJOBnTbCA=
X-Gm-Gg: AR+sD10wwJujuprKGSV4UTyjoGJnGUoFTspIZbHKekBx0cb7YwTXPPdtDZFnIVcBFe2
	pxZWjAACYkwQ7GaR5x9bvzsSOM5WIJ/dxS91fIPXt6lw4mfOKjV/IF1ILC8hTxlV6dZ/dkdJ57d
	0PjSHSAIarXhAAy1Vt0wb110kH1YGclgEckXBs5zj3LfkxNlMylL6O21GkCISNWu4w0wgdueNHH
	d+L9/A8FTAYEbLBrO0kJOEGQaIu/N5wcY54Z1Qy+44bQiRUVVbLCsT0IxS9JyHyUwcwqEqZlIJQ
	h7V3WkNdWHYRk0GO+S3gzsjUsThzSztgc4a9/vWBnlHG+EkNN4iO4DY6at0cYqwUCrnask6QTdM
	lSN3hUMFrOJvj9R3/ac1kbFN3xXXKt1Yr+nl1lcTj6NyyLHg=
X-Received: by 2002:a05:620a:199d:b0:939:48ab:3632 with SMTP id af79cd13be357-93948ab36f2mr239122785a.10.1788191291685;
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:939:48ab:3632 with SMTP id af79cd13be357-93948ab36f2mr239110885a.10.1788191290565;
        Mon, 31 Aug 2026 08:48:10 -0700 (PDT)
Received: from trex (250.red-81-38-139.dynamicip.rima-tde.net. [81.38.139.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b456sm1558315e9.2.2026.08.31.08.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, stanleyjhu@google.com, beanhuo@micron.com,
        beanhuo@iokpp.de, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, can.guo@oss.qualcomm.com,
        sumit.garg@oss.qualcomm.com, jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: [PATCH v5 1/2] ufs: rpmb: retry power-on UNIT ATTENTION on the RPMB WLUN
Date: Mon, 31 Aug 2026 17:48:00 +0200
Message-ID: <20260831154804.719528-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831154804.719528-1-jorge.ramirez@oss.qualcomm.com>
References: <20260831154804.719528-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX8ktikGV/EpYj
 porSXJSwSr8nmsIfaZLSZVHlhgO5PI4ZE/K2UAiOf95/6NK9fLLhc3SQT9nC1IhVtmCDXuY30SV
 FENm05Q81PToawnLfFjTX2EAgx6p+EA=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95a23c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N2KLPU99T7rsMuN2xAoQUA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PY6Zn8H8AAAA:8 a=1XWaLZrsAAAA:8 a=w0io_FmA1e-6CLxyNa8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-ORIG-GUID: FP0CabiuiJZ-xtClm3So-rXcwfgRvR8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX1tWg7SxRGXGq
 3Xp6H2foquyat88m31jvuOQZ0ZM08svyXyYV/gK9ZzMdynsSXctidZqwuUaCFADpjojFQQr9k65
 MF2sJhC4KNRssclcWI584AWDOF7jTttfou2rpDL6b+VR/GyV4xdyjB6R8Bd9BlMDayZlScSwo03
 QICkX7AxZ+RhPfVjeRfElaHylpEo/Vkby21MEvEUNcwOROE1sG0OYWPbvE9p1YSUYuTvQ/b1BQw
 4bvS9ONNl6nD6SqDx9NVq7WikaduBPbJPILEM+Nbtvav66FQkVBMnuqyoQygG4IUPLkXPvBiSew
 tMLP22DJL7hco7COLgNxvsul8wDIBJ+PUaOgz+j4dRc30E8pcfW1+3zwion05c1WdSN77Ac20u2
 G4x12I5YDWl99YOEh1Hva+oOYK0CpJAOKgO2OwuzP3oyLiFMxLG0b3DdrN3luFP+dxQZEQK3cjU
 B/UNTdoDZU1GLYmYi3Q==
X-Proofpoint-GUID: FP0CabiuiJZ-xtClm3So-rXcwfgRvR8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135

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
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
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

