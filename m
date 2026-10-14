Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C903C1992
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961298; cv=none; b=F2pavaNHMuMp10S67OpHqQz+BK2PqyH+e0xPIS3G+nXl3eonxXR6CCvumKq1LuCWvTStFn973KfCSSp3F/chGu9rj1lTnZ0FZVp8AdcEcy8rDRNW3dtQl0xK3pscQAFeMhHVweyAI91lyxdOJpi2l+QzCKakTZiCLayTIgwcsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961298; c=relaxed/simple;
	bh=/Fi3cEGG/0WdIJfEfuxJy0AklWIXf36cl0GBkUle6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hasldEKxedyChMUsqwM5Mc38kDG7+2i0co6yEF6yQn7u8nmP2Z6ijkT4GiDpQJT97Wkxgjzy2Bu2ucxXI09Ce6YDgbHHWtV6eC4cF4/6qiZHxk3I5CPtQS4/82Qmo8aEqSxVek4FAPwJHg/KLmvYF8kxyefslctAnaU68IXTn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0mE1aka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFV5oI2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0mE1aka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFV5oI2h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E66GLI3366064
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EQisfzLzBS4
	VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=; b=X0mE1akaMPbKmINU/Mi7VmITNYP
	uEMJE9+/3JNPYfRAdcvoFHlINQ+18yneC1kr0mMsHuOqLDgFr1sfGmFpeIxvjVfI
	sTAIv9ppb07whPd/B/ubwXBemZPM4gkVt8cWicbJDKjI1P+ewDOW5DzUgzribQBa
	72UJrU8dbzEc30uzpypAwzz/GHXlD5Yk4X+CnEOMmvd2ria0k6JhQERmFJSB16Su
	h0v492dANBD6/jU5UqJneryLuomTNgGI2pUV4y8pmzYOha8wMzk/nrM6tfYqL/iL
	Y3Qa7aY1SffYMjriJPPnF08MYJVVich1w/ImFxV2AkVIY4EaDNAMJ6ufN1A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620754-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:01:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so113593a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961295; x=1792566095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQisfzLzBS4VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=;
        b=WFV5oI2h0YuFVQIHJiRru87N5RXAVoyV8j9tkucpH2ZgXucvmQ3dzut/vLP+IIB6nD
         BuvQYvFdYRx/rkWJuhLW8Mng+CF59v3WbCfXGQddgE7ixcA5sAaS+fbov45e2SKEp++J
         JXS1orIVgtMa3mcGUDiU4q8tP5D21o82OdLDlk9gq2md1mQ5bU68pEQIJEeeJkLNAd+j
         ETfsXw10uzSZHg5McmyjJr1pezXEPatAMk0EUmq3pHsbuzW5H8+h2H8MHu4bzM+s4kjb
         d6tJFn685aQqf8w1giMbiV/QgCgCroOFPChocxCDu3GgC+vkC+Z24ZftZYo/zdXNh4FU
         hr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961295; x=1792566095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQisfzLzBS4VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=;
        b=HCs0hMMeOYvpoW73A2hbB89cscR8lYiyOhMy/ztvr1bMLPj8muI8d3kqvkvZorjo4e
         6q0F2NqEWSJSC06FR55rrKliCMSaGP8VDR906WI6nzAPSckZhmJs94DtumpaNdVj1fb1
         W5BFuf4/QdlIUh44vOzVFJkpEcadGqJkCDrLEEBcrIwI8Tnp1tCPTssVPlxo7qRJDqa+
         LqiDBRdZjc/0apQfrzzGNVgoYYUPkbc9jgtj62+p1DdrdPYwDzn10rw3LbToqFy76N72
         cPFXc9yXDWdmrcy46La4HQSYC6b3Zts/HRx2UeuGXc1sfaCD1soI2UhPAlRYmAvcwFCt
         uifg==
X-Forwarded-Encrypted: i=1; AKwUvBywS0uzkztbXvdkU/g0qLP5KmQAJ8EQCdejX6gPfCfRHTfUAsQqheZKjWMuRXlzsQZJOA1A8d6Y8+FKUrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWz8p505qBpSclOZeEjl8hke1HRRn2S5s5jMiLdQ0KS4GRTVA8
	T9lOM3E0VDQ0AcoSraSIrhuqPGEZ1rl4TPv/uxwDKNWS6JBZjISwNUHPD2OUreyAKanYilQuCab
	G00QAZPoh+eXMmov2bIUInObACGfaCsGIcYZUfzAnKiEir9DHWbj8taFImESxWnsLXas=
X-Gm-Gg: AYBFou2hQ0J20C2zkM6KwXscJUvRhuKBoFtZJv+RVk/LFraCGvCr4Qx0XyExyYIMwa7
	TYFPs0/noy63a2OQzqCGwNdUf7G0vS2a4MlLnleo7xyGPdifOatmMdGnSG8RFK+ItdizSelIuaC
	ILGWrljzCAwzdu+8H08R91JOwIvakr2dTHj6m6eWMg1JSv+CLkgiSq61CE4mgT2lvAv09iz2dJ3
	1k9w2/T8zjYokNGKHoamIbYzG/ZrkffM68hjk2+Pf+IEnNAW43jaRSrzuhVyH4CvSp053g74QM2
	3XYB5NYTXVlXHDzHNrhbmJNlz7Cupq0uIGea+y4GyVv4+9iVnbuHgQxKDTmo0A1tibiZDgXUgPi
	ZGdhVEXNRoWOAZI2tEQOSMgu2J9URSTw7X0wQTR4UO/mfztgeyK4th03w6VY=
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr5183209a91.27.1791961294705;
        Wed, 14 Oct 2026 00:01:34 -0700 (PDT)
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr5183192a91.27.1791961294141;
        Wed, 14 Oct 2026 00:01:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm444568a91.2.2026.10.14.00.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:01:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Don't fail attach if the remote has crashed
Date: Wed, 14 Oct 2026 15:00:38 +0800
Message-ID: <20261014070038.564879-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UpaVmh3c-OHfBXK-MxisZ5moEU95p36D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX7wuEidPnp0vY
 kakdh2IZmYtEe97/vRIX/40j38YcfvCiPRuIDiOrawtgJSSavT814HYw3fMAznm5rzRVn95muc0
 abJGkNYQpb+uKGWP74+nzndZFQ7uZDTlPDQV0dV01TLzlznUdS/w+TnBfW79nSk7Rhsu8enQpOc
 8u8FRJ4rvJmttcvY+uvWbMwkq5JUkT/D13H/0ovsBdM1VjYGe7DVlObTrBJIRZDUa/I9EWcASJ/
 ejMzp+1C2pUiUwJC6k/Xq4F0SEfbmneBKBqByKjwPTpk1DRl+7W/ysuRpv6bRDsP9jWdl9ZvVH+
 okUT0SU9h/fz/JI/ht77PvrZ4cDWBp7mhXVI8yyuUYNmMeSTTeIPPeAEsAqd8bJcMq2OIrAUCZQ
 5g8JY01xwNQvci0KwHs70Id/CeU0JSgzDO/Wb8NHe7sIGTZC7u1VZQRoim2y/Bd9w2eYrwOawfC
 9BVVsyA/AyFcXexhylQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf28cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Hl7sYoTBFiHLiXpXmLQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX4XlipUFhliwe
 nZLD7E0ACHeqZo9EuRloYPFPGqmcwrRmPBXZ8cyCHZyYK2tmFki+YoJqaWzBfdx7vRUbcUZUs0P
 Jpn16QMDW3jefc0qpcrO53g7V1Mu+as=
X-Proofpoint-GUID: UpaVmh3c-OHfBXK-MxisZ5moEU95p36D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140027

When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
a crash and then fails the attach. The core unwinds the attach while the
crash work is queued: rproc_boot() drops the power refcount back to 0,
and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
the resource table and disable the IOMMU. Once rproc_boot() releases
rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
torn-down state:

 - the subdevices are unprepared a second time by rproc_stop(), so SSR
   and sysmon notifiers see a duplicate shutdown;
 - qcom_pas_stop() and the subsequent rproc_start() operate on resources
   that rproc_attach() already released, e.g. iommu_unmap() on a
   disabled domain for rproc->has_iommu;
 - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
   "stop" via sysfs takes power to -1 and returns success without
   stopping anything, so the remote stays running. A following "start"
   then boots the firmware again on the running remote and fails to
   re-add the still registered subdevices:

  sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
  remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
  remoteproc remoteproc0: Boot failed: -17

A crash found at attach time is no different from one reported by the
fatal interrupt right after attaching. Factor the crash handling out of
q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
SMEM crash reason, clears q6v5.running and reports the crash, and call
it from qcom_pas_attach() before letting the attach succeed. The core
completes the attach with balanced bookkeeping, and the crash handler
then recovers the subsystem through the regular RPROC_ATTACHED ->
RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
not wait for a stop ack the dead remote cannot send, and handover_issued
already prevents a spurious handover on stop.

Assisted-by: LLM
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c     | 22 +++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5.h     |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c |  9 ++++++---
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..51b24cbd4336 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -147,15 +147,18 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
+/**
+ * qcom_q6v5_report_fatal() - report a fatal error of the remote processor
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Log the crash reason published by the remote in SMEM, mark the remote as
+ * no longer running and report the crash to the remoteproc core.
+ */
+void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5)
 {
-	struct qcom_q6v5 *q6v5 = data;
 	size_t len;
 	char *msg;
 
-	if (!q6v5->running)
-		return IRQ_HANDLED;
-
 	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
@@ -164,6 +167,15 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 
 	q6v5->running = false;
 	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_report_fatal);
+
+static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	if (q6v5->running)
+		qcom_q6v5_report_fatal(q6v5);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 8991ff090579..a0507860a21c 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -56,5 +56,6 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 89450cbdb1ee..c50744bee506 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -562,10 +562,13 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 
 	if (crash_state) {
+		/*
+		 * Complete the attach and let the crash handler recover the
+		 * subsystem from the attached state, as for a crash reported
+		 * by the fatal interrupt.
+		 */
 		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
-		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
-		ret = -EINVAL;
-		goto disable_running;
+		qcom_q6v5_report_fatal(&pas->q6v5);
 	}
 
 	return 0;
-- 
2.43.0

