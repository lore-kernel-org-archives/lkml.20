Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119EB29AAFA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685716; cv=none; b=CGGTGjpEaUiwAj/d7d0dtj8NDdPUTd2aP4WsQzkbQWNkAFottUspkOUHMIc6UTdWu6uibRscPTOE4jh+VlZ6m+p8vxvqMYyA6C/4xNR53rYxMnozEDri/Qwb5+iTMLKSBxJWatlL4p4h/f/pTT9qTdXTCzPpgqrAinIZkehOFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685716; c=relaxed/simple;
	bh=JkJs5cjwoBN8rlOLehu73BkS/JnVO/ZOc7zaJC1P2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOqFusgkBRMpTMFWdKevC2ln9FlLxC5rhbPElkSHn0jhO0bTqubtr/joGyQGsNGQwJbBTQQtU5rwC013HAE5T8WgKQqnLgbkZYj/2QVVyKHOCY4QM29Tv99c6nfUBB21TemySVokcKcgtdlIS13Hwzlu4+/rZAo71jODkd62R6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gt9my8yL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4dAB7Go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gt9my8yL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4dAB7Go"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1pGMO2046723
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ycrZJCW/C+c
	BFwnxVGbXP+DEuGIvdHmEJkIies5awEk=; b=Gt9my8yLJ8dw5Airr2HzhdeZcvW
	rvjP5N+OodY2AVB00O4HMqtFacSlZ7hJC1Etsrm3wY2Z7tzOr5P4aahztQvlrURF
	Z2o5v05bUd4gX6pMKu0Mu7oSrrAW80kuDR1lBxp3dg1XoMiNI+S5yCPVRNTjpwTF
	95HFakdrkVXh9pVS6ke3IiOOxB86zygjZhp/kKMq7uEcreiS5W3l9eNZL/BGjA7q
	C9WkUmN8g4Mj3yP4K7zUA5W3/+LxOT5i12zMVDxZZsJ//I5otBsJp7RqIU1XFRgP
	sK35Xkm8SJozxD7/LO9YhpYjzCori0Ao/0X56YDX2iGe2lkmMKQ85u3237A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmtkxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1522700eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791685713; x=1792290513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycrZJCW/C+cBFwnxVGbXP+DEuGIvdHmEJkIies5awEk=;
        b=j4dAB7Go0QwmFy/LfgDxVEllgN6HCjBVrflFP0m/dSMsStAjSYtb8iyT+am75HYbfF
         3dSojorIXd6Iwxmr2Wy/8Y0O6q5xYVPZOEyOo24qnjBUW5QV7DInDtGX/WjbU8emLjVw
         3d+w83JlQuS//UqO7cgAaKpRY14Xp9SKKlkhlNPogA+iNHfmRakmESVsBXKIMH41qabf
         U0XxDrpym1cwcFHY4o/AvaA6l8nsOV2RsFFj7bpLXKtHdys5nfXeHB7dyeKcPezdrSGG
         o/Vtdhp4Z45pMriRS7qOoO6fH0/9j/td1Pzx61PqbhF5kEep3s6iWRdKeg0s3zjaTeFq
         PjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685713; x=1792290513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycrZJCW/C+cBFwnxVGbXP+DEuGIvdHmEJkIies5awEk=;
        b=mrmYRkR2BvLoYye++aa5lj6GcCe7F+5xEtzuFQcUnr9yFq1bBqtYAjuPgng3gQFNyn
         mAMO8dfU7dxgc58v6fuSKr94yHDUx10bkU0zwh5IXsY06BFvjjrH6VhbBVxzcYSpyBkl
         57Z928wSCYrEn7UYF2tROFPtlznSEaOvFjZ4jrCUstgP3sXUBt96Rc4OFURANCg74fQq
         Mz9+29plizI3Xuwpg4KV14cLzAkaMLZaMp/a4Tk6Lw52ZknWx19jd9gzOX6G/KCMVkhY
         9NL+57LlqvNRUmZ0BJojLjdLhmnwvGmGM1uxxkg6yQMcpZV+/iop38aS3AQTCQ3estv+
         +OGg==
X-Forwarded-Encrypted: i=1; AKwUvBwa8QVTp6Qk01PXzmpajYeCk4TViwxk0oSFsKU9K57pSS8fh9K3uvORYnMs8Jsbzop4zzYoohQQaRy7yV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJoPWgHOEqtqIPHSuUGVjuahxRTIDwKc5uYh1/9fML13GF59Uc
	nZx8VtmPPdCdvVxBtzvn6+7ydHhc0aK9R0BT9Klf3XwDTZzfUAmxmrpSNCvfIIleK3Toy6HEPtY
	wRF4NgTzk5EAim6bgnEACb+kRWQzjBELPeEaSSoVVjhiklJni4qah6nzaNFGq4ULdGFk=
X-Gm-Gg: AYBFou1zi/LxFUnfqNVNF+HkBFoTCzun56chQc83tGuUDA24za4COzBbVgt6c4fzcaV
	hH68DWFsfGpI0huRnuEjH6F2zqUqTkSyPo0JrBn33bi4Giu1yputmbA+tv8jWYJcYni1TmpiYIB
	hlTNRXQsGvzstoMQnI81W6fmY5ffYu9VoKrk/EwQ8EWUIiHQRJJ5A6YqxxCfaow2Kr3gpXRuk8N
	jxGnBVTaeOmXakC38DcqFLy66YSn+r9pXJbf/K5OHsQU8BCYPB9DBxFeE6XzciIAaEO/9idHHHO
	PGXE/NvQxElC1J4Sz5I4HlEWpV2wGY6IArx3qv3r2xw721bBQ8bH+/+YLXZJzY7w0VBwgEbqxLj
	CbtUeFe/uKcdLf41d1+xCFNaAWpMCJ3iwbPlnLubqZAwF/rS0KSjwv09UHxs=
X-Received: by 2002:a05:701b:21ce:b0:151:ece6:b16b with SMTP id a92af1059eb24-16a5dcf6531mr7618989c88.7.1791685712555;
        Sat, 10 Oct 2026 19:28:32 -0700 (PDT)
X-Received: by 2002:a05:701b:21ce:b0:151:ece6:b16b with SMTP id a92af1059eb24-16a5dcf6531mr7618950c88.7.1791685711927;
        Sat, 10 Oct 2026 19:28:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22068243eec.3.2026.10.10.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:28:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Sun, 11 Oct 2026 10:28:01 +0800
Message-ID: <20261011022802.4069489-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX8DzbnEb4SxBK
 C2MZlhtHJqBv8f+8kwy0mZnJONWjWa6VjYPqyHMoFEqq75DXw3uPKx5anJO6OuyxK/1Dh1kH8a3
 shtgE4VE7pSwdEyhGD9hkFkWGV650zI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX9sI+3CZpiCF1
 YzVwqUysXcKqITBYXqhPhircypRyG/EQWqCG+TMWrGLcC5PAMUM6A2sxBOMBBuZBqVdmiR6wsLg
 Pw4eV+0//qnp/8isTPEShiAlKfZHKRtmTykL+hY8YqnhelnWySWgvfc31u6/l1foZagN0amU8ri
 iaAJxaVFGVVkfdCmsroNPMloDNYe9AkNKXa+MPC+MRppgXRv3n8xTZlkAbbeNud2Li/KvzcItM/
 hSlbXwXbZfRg1hEIKSStN2xW1KG4FKBS1zE1doXwDezQh3ZfNbPmjVG4D8MvejkLg23tj7gIvrI
 2vJBrbisWvYnN2x+KuWKOlGKApJ6OFZmqewi7tyAo9iQmptT+FZ+BeI29tl9Q45TuQIEfIK4DHU
 bCaJnsUVgye/Sx3NW9Aq6U5cUf2vkTpZzYn65u0z3Q7CDmBcHcLV91UUl6hyhFo7H7ZYQIf7kX/
 FffUAiWaCGHMLmdXZfw==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6acaf451 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=WnWnooUoZOtDcxsU7t4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZO9jsIRFOlwIx_ye6Yo-OF0xAeqDGyDN
X-Proofpoint-GUID: ZO9jsIRFOlwIx_ye6Yo-OF0xAeqDGyDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110009

For early_boot subsystems, probe unconditionally marks the rproc
RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
bootloader actually started the remote. If it did not, attach sets the
state back to RPROC_OFFLINE and fails, expecting the core to boot the
firmware instead. The core does not do that: rproc_boot() treats the
attach failure as fatal and the remote is never started.

This is hit on Nord with firmware where XBL no longer brings ADSP out
of reset. The remote never publishes its inbound SMP2P entries, so the
very first state read fails (debug print below) and the ADSP stays down:

  qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
  remoteproc remoteproc0: can't attach to rproc adsp: -19

The ready, stop-ack and sysmon shutdown-ack signals cannot change while
Linux has not yet interacted with the remote, so there is no reason to
defer the decision to attach time. Check them in probe and only mark
the rproc RPROC_DETACHED when the remote is up and has not been asked
to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
path is taken. The ready state is read first so that a missing SMP2P
entry -ENODEV is treated as "not running" before sysmon is queried.

qcom_pas_attach() keeps only the fatal check, since that is the one
signal that has to be acted upon once the rproc is attached.

Assisted-by: LLM
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..56179b71fd2a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 static int qcom_pas_attach(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
-	bool ready_state;
 	bool crash_state;
-	bool stop_state;
 	int ret;
 
 	pas->q6v5.handover_issued = true;
@@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 	}
 
-	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
-	if (ret)
-		goto disable_running;
-
-	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
-		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
-		goto unroll_attach;
-	}
-
-	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
-	if (ret)
-		goto disable_running;
-
-	if (unlikely(!ready_state)) {
-		/*
-		 * The bootloader may not support early boot, mark the state as
-		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
-		 * start the remoteproc.
-		 */
-		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
-		goto unroll_attach;
-	}
-
 	return 0;
 
-unroll_attach:
-	pas->rproc->state = RPROC_OFFLINE;
-	ret = -EINVAL;
 disable_running:
 	pas->q6v5.running = false;
 
 	return ret;
 }
 
+/*
+ * The bootloader may or may not have started the subsystem. Inspect the
+ * SMP2P state, which is static until Linux interacts with the remote, to
+ * decide whether to attach or to load and start the firmware.
+ */
+static bool qcom_pas_is_running(struct qcom_pas *pas)
+{
+	bool ready_state;
+	bool stop_state;
+	int ret;
+
+	/*
+	 * Check ready first: if the remote never published its SMP2P
+	 * entries the state read fails with -ENODEV.
+	 */
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+	if (ret || !ready_state) {
+		dev_info(pas->dev, "Subsystem not running, not attaching\n");
+		return false;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem found stop state set, not attaching\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1024,7 +1026,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
-	if (desc->early_boot)
+	if (desc->early_boot && qcom_pas_is_running(pas))
 		pas->rproc->state = RPROC_DETACHED;
 
 	ret = qcom_pas_setup_tmd(pas, desc);
-- 
2.43.0

