Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8A3B27C8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355170; cv=none; b=jhx5fNgFZWNTqU6e/vL/rEVBHCeAcS9gPpZMflc7hE+OOJy+t3iMauL3FpG/qe5Tw/ItnQUQRiUOpuDqCoqf1hbvtnSCaPL7aWX6wIq3SNpPMYfqeGcMejWJAYgOlnxEa0b5Z3lW9CRTX/5yES6bTvlg0B2jUdZ09U+QHQ+O7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355170; c=relaxed/simple;
	bh=XPMq30xEgQ8dtmDEF1xK65u+nuNkxIbYPl0WkEp5J+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efRXudodiAOH+3K+tjkpEVL7cHzOrhU8xkJiTFUuN7HXIaOa3GnGpiKW/ul1hh/SMtFqIapyuGA63OYSAjH2H1iQwXEfg39H04u2c4WFQ5mzfT6V84om7cP88bi/3H/QKVh3u4CiTbb2fsYyIJUoNII+Tu1n33heUez9Rnh33j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FH2OnJUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYeQ47XR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FH2OnJUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYeQ47XR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG5Luk1759231
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+i
	kneyzsNs=; b=FH2OnJUcJKzR6etr06VCWY7F2vTLkk0/bC11smXGZVZ9kR1/lS8
	Vz1CBjPIbRv91wP8mNFKYKMXRBFsSQrFgnQEq3rou4vP5TFj4PgIiX5DtzXgDiU+
	hcIoYlY1ICPsvB6LGUvhsrR2YWpCnkA9s8YNSANAylVuLF56C/Y/7ea9RXu+jfjf
	uoV76KENCzuZXcnNkUbWyDlJCBrUX+ZHdnyCqK2rOA/4EHg52/ds1P1vtpq0/PzZ
	sJsUsl1wrnH/wavJLnLE205F0MyLobWfiTweoghpEbA7yNVxotrnskA082tfezop
	t9Lw1OjVb1p5gXpE6HG0ZckXBGxRpZ7Fw9A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv5yr62x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:52:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9143a95c6b9so11203836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790355160; x=1790959960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=fYeQ47XRsrQ5spF35+ULNLoMSbuw85OhIJ8JjCD+rTBjUo5r4vhBAaciM1junK6kEX
         n+u21KjESV7GrcUUl5+lHvnuvVuf6eluprouhoUHZqD/aXwkfY0x5eDbIJW7OUHuBRwK
         nJS1RBaOI3l+CY9nmGisCZyg4UsQapFJBCRnHR4zDR8J7n1EfyoLsAueEjpVGwenSfi1
         Jb2qMB0Sackd2NpSGxKzqct/Y+7lRbzbo0llG2/PX/46TTCaGm+uo1Rjv8kk3t/Na4FX
         RgIo9Z1A4Ud/yVMbxmEgh6p3BVdi31SmFjDroz5izlN9rtCpj1d1eJtKgsZcik8d7PMZ
         Ztig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355160; x=1790959960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=onNjUZ4MGivCsgC+x6cD20eR6KMnWVol6Iov0PIuXHL9GT2x9p+mbfgvxh3FSEKmy7
         3jDqaA3ZCt1fgCAfA/galKumWhDPkp3r2KSOXyisEUR2SA3+khmde/qA0GE3KqzoAlMU
         viCb+EHYE9fg5sQN/54EDAp+bljWwli+J35QuN/lBsdBA6SUPBbR1r7TOVRw6q1VNOhH
         CPi0y/WaRqirQAoWCjXonZqrnOxeJnTO+BBQ4akblD76Y1u5QSnV/g/LTFrGEeqG2uiV
         1NwBxyFWSS58Uw5G5YVOTlemXP/i4+JAEyPvcFOtbQNnHGj9DnGSdhxfK77wzICD3Kvq
         AKwA==
X-Forwarded-Encrypted: i=1; AKwUvByBfDaTFk4Vm+I7E3WpEjLUQ0+LO4TIfcLCK6C8WbGNrGmLpAoT+0YOCc2vKwOK+idOtZtUZh0JHHUpYDY=@vger.kernel.org
X-Gm-Message-State: AFuF++kFlFFqkj03AwWpqsgR8YPOLBjNsVb0CQsuLszvac46bNgAD/Tj
	I+d9EpEk01V0rAcSgixwgKbYg/vYddUAymb8z3mkBEvSqvvyyuZHULHnh4AlzacLfYHCXVtzFes
	Asxr+wdZVaT7iexkiEZ3CKw2nCRZ6+lwbu0llRZ61igYoFmRBZbrZJ0i5hwbCeuvjSo0=
X-Gm-Gg: AYBFou1phiJEkeBb6J6TT5ZZxVSvHPQqxoRtAlqHo4asZWvB3/wW9jOZ8g3neB22HZz
	lDeHeleVJBfACDm4E3J4l18190ccA5jtEYMdWXoOx/AN5ukdmEsBKzuqtNkCDEfaw7CBF4OSbC+
	qQztctwqIxK8dyW0u4y4EHJngRt8g/aeNmB5gGAJDpxLw6QKAtFFyHtrVZUT8eNoevUACF11cug
	TbwTgFx+ngjHQ7s7YrEOunlFuNuT1qAB7mJ2m5mJFSm2sizl5ahELUKyR2FGHcBpuVkoMmKkSvg
	tmY24wbTjKPlh2jri88dl7Fqv24N3SzWQN5GbHQcIY4jgKTXDqlpSpyw8dDUGNc7JUESwJUXZ3F
	/ZKKeLjXG3LuoKezm/u0V6nkA+HI=
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50170336d6.16.1790355159908;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50169846d6.16.1790355159275;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430da9123sm21023336d6.16.2026.09.25.09.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:52:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
Date: Fri, 25 Sep 2026 22:22:31 +0530
Message-ID: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfXykoFZVP6sBot
 F5qY8mfRIXYK/WNccbj5re+oGxaotASsLLJ5FxTgM2avLNPV+h2OZWhnnDO98F7zBOwQOcX348p
 Iv9VdJ6+X5YhAOkV/lbb+oQQtDYz1RPMIp3dqNNtF8BNBNRKFauw8iCUVo+oksdcArCUl3M03sF
 IBpBE/MN1SQUaqMeQH6qL06pKCiTJFsXOHhyE4ajsA8gVom5Oun/jzGlB22qrEiA1dTieZtlqWv
 QOeZnR+9IL8st1jRF8me4FIGOWZCE0ZQJMTysFYKDPveLgbBEO0C6u7s+bFm7GmBWqARJtHQbCx
 r+V+AdZtYR6EVLUEqKS4ERBChw7V5//UaV8nGzouAvA/+PulWTJa2ThxVvCTeQRFymY8UgXEKYV
 I9LOc1uWrQzMd2hGD/LqwXYDOCZgctTukQbhCpb+leVgqqwVz4Obs4qt+JhACkGE6YUD8bIu1tt
 kwMVB2p3OUmDHLKDNwQ==
X-Proofpoint-ORIG-GUID: Vb4LSFgOzr2YJ9v0Rww72dt9MFwgRI8W
X-Authority-Analysis: v=2.4 cv=EoRHPicA c=1 sm=1 tr=0 ts=6ab6a6d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bTXooOE2z_dFbhIuKS0A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX/Bf868tWgcxJ
 nQc8nZwL2x4rpMY8MiGGw6G0u6bBZGT/G3imVv/98PMhfpXmBnIH7QEiDHsfUWMQjyhU7FGJJ+x
 h/3xNExe/ev4gepCRNcyF7ZLyrfF0m4=
X-Proofpoint-GUID: Vb4LSFgOzr2YJ9v0Rww72dt9MFwgRI8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250067

The PAS image initialization path retains metadata whenever a valid
qcom_pas_context is supplied, although callers may not need the metadata
after initialization. This leaves ownership implicit and causes unused
metadata buffers to remain allocated.

Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
wrapper release metadata unless the caller requests retention. This applies
uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
for subsequent PAS operations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v8:
 - Commit rephrased a bit.
 - Make the commit aware of all present backends(scm and tee).
 - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com/

Changes in v7:
- Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
  the changes related to it.
- Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukesh.ojha@oss.qualcomm.com/

Changes in v6:
   - Other patches from the series is merged.
   - Removed dependency on below series by adding keep_mdt_buf
     into qcom_scm_pas_context structure as well.
     https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
   - Addressed minor comment on the documentationi.
    - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com/



 drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
 drivers/firmware/qcom/qcom_scm.c       |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 24485dd0fa10..93d78a5c1201 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
  *
  * Return: 0 on success.
  *
- * Upon successful return, the PAS metadata context (@ctx) will be used to
- * track the metadata allocation, this needs to be released by invoking
+ * If @ctx requests metadata retention, the PAS metadata context will track
+ * the allocation, which needs to be released by invoking
  * qcom_pas_metadata_release() by the caller.
  */
 int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			struct qcom_pas_context *ctx)
 {
+	int ret;
+
 	if (!ops_ptr)
 		return -ENODEV;
 
-	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	ret = ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	if (!ret && ctx && !ctx->keep_mdt_buf)
+		qcom_pas_metadata_release(ctx);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_pas_init_image);
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd754..dc57c87870cf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 879c465c4a7a..ae93f693358c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
+
 	return 0;
 }
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..1d132e89536e 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -22,6 +22,7 @@ struct qcom_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
-- 
2.55.0

