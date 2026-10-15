Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A63403FA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028332; cv=none; b=u/JLI95RPNSnKnm4Xr1tS+YgYn0fnLrl83BgDECTTmu4MD2h9aDsVrV7kTRW7xlJCDT2RZU+MDwpQ6a13X7Pev3ZLaocPlqsXifiaY6JtB+OAejJ+cS861509IrfzDUPLZNLU3COExQk2xOAY8jB1UABNRDFwyt5MqOsIpGmZ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028332; c=relaxed/simple;
	bh=1GgmLeFnWC2w5RPHnjAu6+rSppEjKsnJM1u/ggqhPeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbwAlwATEGyMp5musnuLgvRLtnZos30L4JsOT7SthA6BMIzR98VYzPhUVi77uk1iWEC1LNop444draFBnr1f3cpZI7fetuPyoVwgXuyMKgRrz5e/sxA3utLYZcrLckCHIThDymaV7SfnXbX+I4WB+LJo+KUhG+ZRJpNfEb55XBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b04vKikQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSreFlGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b04vKikQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSreFlGb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENQW8J584763
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QIhdkwrLd+/
	3owLQL908r6Nq0sAF6ZPN/2LcHn36TWQ=; b=b04vKikQ+bzVdguMzloSf/ROhZe
	fIDbkGwwSTMHNpJfWFv0u6PYinpHsV8kdANbaNsNZHe1ZLzlJno7KD6PPKRfCr3S
	0m4YI+QXKVSCjqt0pu+biwLpaGD2DstnR/lkXF0+B5+gh361AB35tDTtpbbS9m1G
	jvFs1jpPztYPajQ+A+4Y8Y6LhCFLSqfx7NortWn/QwQP8DtF1V7vSikg+NKRW6TZ
	XxdXTAsasnKJApjnIUbhmWnVopMQesSKyRSJJNVBzJOlYlpXLHQ6/VR4DIZHwW3K
	mgeolT7ckcbF/iyDAMtI9V3hHmTDeEkGeEfPS+FZVa/dyBIYCU7dfO6snzQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakderbyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:38:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so4764140eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792028328; x=1792633128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIhdkwrLd+/3owLQL908r6Nq0sAF6ZPN/2LcHn36TWQ=;
        b=ZSreFlGbSvk4ixC3lTeW5HRkUHW3EDGx9J/QPEOnMrAvVPGM7yK6h/5NRRe8J/V0vK
         bi2or4kXz5UJj9lfoIEuFS2vI1YKuvR1gE0v/pHJedgErsuZjPblh0l/EHHUd4FUtKZj
         KD9ERJPRVxS54aQUm+OsFTTkGceAJ+DSs9+a0TnJMzyGT3a4+ir0DICjnMR+9K/jr9Zl
         wctsGK3zxEJdFerhQ3BGpOiq5GGMkUO9ELdtkFbFXPZtwJLIobhIqQUA2o0Oa/K/HktN
         xbXLHtuMhrO1WIM/J8ZyaDWjGHuWarVPhXsv7t8iGaM7kgY5iVMX2h9VmjDYJ0FXYNnq
         eIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028328; x=1792633128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QIhdkwrLd+/3owLQL908r6Nq0sAF6ZPN/2LcHn36TWQ=;
        b=h3z8jVlFs0uHAKUQJEwNCH0dh+wq8bmV1CuFggAbFIXuD+BXT53maHL09pFbL9XAQF
         t/nheIj02A4/63caOmI3yM4R2uWJ6eufay3ld9mB8zrrDXNg4z8Yot9biPENO5GSR9db
         RniOZpTQcVFo5LTUGQBfutEQ7W5xN5g6lWcRPi4eakKHJbXS0yjpsqy9yEx2S7i30RHN
         61PSLb/qRGZ1cSexfiZvVcDzXLW2t3gem+FBJrduLgxkukcLPiwzn+I7ewUSqoER4Bic
         +D6Ey8tUHQ61KG5iL0vTv7lLKEGwDyAKUH8GJ6eSv+mu8vJxtRNkE5sGbBPGKedK3vH/
         mp2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeFfiFFHGpoXZkT/4mrFrPPRyiYpp6eZ+KeJGE3Zg87oGeZuu4VVblGb24CNUQniYqgW8iiL+Dr6kB9V4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLJxnLEgV/tVD0iOdkKvo+OOPuC36uICmw8lBOhEXG5NKDsrrZ
	B+toJkM7wMOeljE4le2Y1I383tRfEmP8vWY0pO4vfQewDKK9YODH9Ayp9lVJFrfOAKoVia3JRn3
	UYRM1TOsJvw0NlHY9CAkhRXbN+39NUTkaaYV8GUJDlGSRHMmeysX0aZSq39zfcJfMW2M=
X-Gm-Gg: AYBFou2DeAmH1QvUMo+1KmY6KyZ5YuyxNINBBRO5Gl5bkwHw59+3/y/LoOT1C63IXKG
	h0ww6g5jZuu5QM5wVW7xbGMX7XYB8sRu62zD6MgX0j1iX3o5LLKsHzbydVKhlBA8o4D5Oh2nfGb
	rXHLjU0QaRkfwyS2rRhtvNXMxwlrKDlblY6kHsGsOrUwbgkHsAG6J3L/NeNda0NGOyx+/hpUtiI
	QmdwRkThWZEWRwmiD5TvE5uH6/JT5t9Acf+A51KsP6WAQdhVqbd56Lj+CLGCmKMvn38vZZLJ8Vl
	8OPsAXQvgbvLoOxn1f2/lTqY5eHy55kVIz4GERQlFxSH4TOJv+zFnd5a/wPFt1sBrJP5bun/lgS
	3NsPiZz+7ljYB66LQ/3FgDyLdAu0EihPHUjYdztwkFUlK3iwcl2afL3Bx/88=
X-Received: by 2002:a05:7300:55a5:b0:35a:29b6:b466 with SMTP id 5a478bee46e88-35a29b6c486mr14209911eec.30.1792028328177;
        Wed, 14 Oct 2026 18:38:48 -0700 (PDT)
X-Received: by 2002:a05:7300:55a5:b0:35a:29b6:b466 with SMTP id 5a478bee46e88-35a29b6c486mr14209866eec.30.1792028327240;
        Wed, 14 Oct 2026 18:38:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm56908182eec.16.2026.10.14.18.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:38:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Thu, 15 Oct 2026 09:38:26 +0800
Message-ID: <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad02ea9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WnWnooUoZOtDcxsU7t4A:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1uXMBkkKJTa5bLk2uWRoGj1ejaIpb1XP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX2mGWaTZGoezg
 mLGzCCtoA5p04sHiVlEPNLsQM0Ko76nZlY4xtNu8ipy46fairRVhP/vqhzN0D+QDGhWf4JaumQ8
 a6q9LX40gm1mvYMD9xE0sJHgnQRxhIyfie/VeHiN5SUX/3qFM+sUPbz6cld+slD3Vj4ZWCPYemP
 MFWoLrFnwtWRRfzueWdKCVl4xOlCKvo7qLujTT1bH2dlEvJQw+Uk7iEp80mtZN5yJB2WZVVmB8H
 4sv5NXHJQbIARWbNV6FrPoYvzhERbO8cs3copRCkIB8zsWaDH5MGfuNtlY1/mytX8dDFVRopI+B
 y+pxkz6XX+/gcbslsEYvyES2xxejfQdhAWJOWMkpFsBzNYEpuFzLHIhcAfMyqUcOjFtp6PRnvWt
 Amyq0eYDXreGz1m4ulM1GEaHRgHpl47TnK72Xs8uk7w3jiWzrnE87cfZWCOjHan+7MRUFVHkBNW
 tbR9cmqZT2/tIQU/+fQ==
X-Proofpoint-GUID: 1uXMBkkKJTa5bLk2uWRoGj1ejaIpb1XP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfXxHD7vCw01Uyo
 oR2BO9l8hrh/6wcfL53KrOuwyZOx+kG2ifskOafvoh78mejYOC9JkaHhpNYa8ypYBKpwcrBTa77
 bOtBjKbTnrAVYhyVdOxIiSFAr1/Gw+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150006

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
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Cc: stable@vger.kernel.org
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..89450cbdb1ee 100644
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
+		dev_info(pas->dev, "Subsystem has stop state set, not attaching\n");
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

