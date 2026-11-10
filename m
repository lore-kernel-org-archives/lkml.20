Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319920;
	b=mXZcegDVt/pH8LYfoDbwixJl6tw5Pi/PJ4cTMc9qGdECb5oGVXq+5H3Ai8+9rFsXu8Qc
	 Gh0mwnGMVjEfayTYj0qBRbnDOIOZL3v3y1Zq9SY5ip4gwo1vRE2+xdlk7df6gPh29gzBP
	 +NMpQ7VmWDPtKVIlAEr6Ydvr7otGAtLXMJBKF5mnJ8RMGA1E9wHH+vkRVA0ZFUJSZwXJj
	 yCeM+3riwOlCV7DqAJlyVuH7zpGrFyiFLkzhpQvnzCmzeY66KxJD06eYdeZ6FQKzN0ubq
	 C0yrV71iV6zARW3tUKq7z/iH20klV1fhDPIKTiKghsz4yeXzuaR5szOha52AIrLI/Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
	b=2Y7uKrIfz1MNj4ZpjGR3TvcU/M+rpx0dV81Pnipd1mD1Di6+5KTPfz8/xUySwN8ZiEfi
	 ydm1h2KMtO5EQXsViXRGxEebe1IR5j/TC08zYUlk+oDcOIW30Q0kFc21pq2tDw5qMwCD0
	 yjImfRsk1grGV4JCOixm64slBQF8CRqG2ckKVq/fY2ydCrNWP0iCQpN+CkttPkAF0wLSN
	 TY7AhloFeeTrbU+9DBB3A8WHWyrGK2CFPkdDwPWmo9sic9MBeCyEPn8W/Cl0HyTkicih4
	 jj1zH5L6GYmdSK/1l82g1us/jKkrVoU7mdJg1eXiMddMCtkycldxh7N5rSDW/PKwK1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPbDPbbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fdx522Aj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FA60A3814
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 066FA60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPbDPbbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fdx522Aj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9uO53228440
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=; b=LPbDPbbOP9fP28+0
	FbsJJLXydj54lFnKGF1psb43s0LwUkFHKzC1V/QJPbX1yaZVM1ppYVChRuh+Hcsf
	oJzsqb6QrI/wdhblL6wTpb5ShbDXtzBNylOa9gi7zzf7vWEF68qVIE6TP5lArGVw
	uE7XnoDGQkG/YA4fSm8/LQdW7eDEHop/OEePqYW6amsiHZllo7PGOGmtKtsbBq5N
	BgIQirao8F8QOveb6Wj62Kbokxi8MRc9sMVBM38GixZnb3NsIDw1ubLKd2dwSwA+
	At6kLUZQ+h786ckdg+Nu1rk5SpMV/+T8lQtPQO3toBdiCVGug0iLQDwaK6i4ucqM
	H+1nwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d9ajh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so1173277eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319918; x=1794924718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
        b=Fdx522AjDV41gcXBiVCi9Lt1/YuZLWVJfBi2EIh8H6BgskifqkOcADubVKDxuFc7FP
         qJTjFCupHZ8IpWFEEuOmhJnQekDE5siumk1G+Y8YK0jFIWhrhlzjF4QGSFcV1KKwKjT4
         DMRH7kYih9ebN9G+94DobM1lJxl6ngbDzIrKCa0brhUnFLKZ5WFHGFqgnWXGr1Z/lUYb
         +FlIioo4i1SwqQmNRMS69OFm8z/eJfQ8UpLBa1AIWYfb8XTTm6h+7i3F64fYwSO9vFkN
         K72ZaVBMVuV88SjLzBfxVWp/1/2h6WdX6KuvB+Nbws0xy06WSr3yszZo6FxzS1KYuR4s
         Yyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319918; x=1794924718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
        b=OquW7SPPtyF8tzEdUKVNQ51h+edMUJs0kPrkJ9KzT5myx83l9syCO1lYrW5dRUJdY0
         mKA6LYOYy2AbC1NXoZ9kUZGxM0C2O1ZELMPoHN5etT7RIXNavU59yJDKAEjFrJK8UcXp
         1eM5LXt1gZ9Ck2G5coAKdsijRApLBwata676lBBAlZQ2hkx3F07N1leKFR9beuR8o/lN
         HeX5WQ4Ezhq5F3d/iV0FaWxAi8Bs6yUE7jFkPcGqueqziwqeeQQMPOnEb9cS5QPriu71
         PQl7PBLApa2lWShyYcpqXPEyiL4/C7VxFRR6EQNUPmDDJJg6Nkpee69Aq2MGO3mxrwb/
         nx+A==
X-Forwarded-Encrypted: i=1; AL+hErGl5jMHUpKU/eei6mVbEkY7wNqCgaYvvyBuU5aPnmYUBFXq/dtO75jsFdZNeXBkqe3GhJ4dkzPOLVY+PQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+7qtl3JI2A3YfIGTsWrwCrh08OLyQ1LMXcRWaiMq+tSaVULmf
	3GRawgMy+7vixCta/SlSgo4enMQBBj89UgzBPnRhgYd7bLQUez8ptb9phhWt5vIHP5rYUY3MPAP
	/iUPprn4EItyJIj9K3lo5wa56uhmbk/uED3wHpP/HBggZi4ALhs5MV19hD+86E4H2Kto=
X-Gm-Gg: AYBFou0VR/G95zjQnW1rRB/pV60kx/oKjZVKEvFkogeFjWpOOCz1/eRkn3xUuO7JAq7
	TQNUdvAvqFAka+qDZ/h4MIdG5c3ACw2ACJ+KlfQeaBqz6d2TO7vQhabZJUwTHEy44zUA+VqswF7
	7EEysiq7i/G9eIM+pmgwEuhHCyubaTty6DrQvFFz+G+0jMGULSDC5PxhJaZ2uf0Uf5vD4QaQUzR
	Uh/hrskHHv5e9CIxwKYOpScVkhRpU9FzQvllZYMmYe/HFsfMP914gHffoTq9dqRmeBHTFwukJe/
	sNQWJvV7dlLJDUbUmho/bCiA3/ULij0tbDgaO/l69IIeQItgc9T7wAZjzKtt17xIoahke+IDY2M
	KaxWU8vu1Pgp3N8REI1HZoKLm9WrOwZxtRufpH9GvTs5LUuisI8dAdcaPgObqqTtiFgZIs4lfkq
	32FhrgdD0=
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr4276274eec.37.1794319918267;
        Tue, 10 Nov 2026 06:11:58 -0800 (PST)
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr4276232eec.37.1794319917540;
        Tue, 10 Nov 2026 06:11:57 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:57 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:52 +0530
Subject: [PATCH v2 4/5] media: iris: Wake up blocked clients when the
 driver is removed
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
Message-Id: <20261110-iris-handle-unbind-v2-4-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=3688;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=p29h8OBXt3F9xRaxGiuMS+CHBCIAi6zq9MGnLRFIvd0=;
 b=vaPc6dJN89IQWMT5PNXwtXQaSRSLYKjRFXub4X8WJJ1lqkgjB+x+fhyNZFZFb3LflnFtcULr+
 NparqXkVY3rB9W4O8bkiQXc2XVAAVYUchtvuLb6Q85g8Ay6jDeiNn+a
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: xR-4jCSfjFW9SNkQNYC7CS5DHIHCFKli
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX5kDcNUfFV3za
 KkVl9vD3ZZzHsMl+jvTrdR31AbbOlLDmCkduf7nYnwBDSibD0TmasRwu20PArrF1pXzRnakxTdv
 PLhJ3yL4fJvY2agpIDiLpmeF+7x0ROQ=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af3262f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OLikLUY__WNYvvbHpiEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xR-4jCSfjFW9SNkQNYC7CS5DHIHCFKli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX+6/kAl4YoDFg
 YU096XHKMxemIEZM+T8BqZd6Vks+kJ6MdGMPznYHfpX+s1wE4/RlE8IOMVmF+Mvt0wiDWET9ijP
 w8NQLTl3unr9zvDZh0VXxmhjxtRROvxxuU3DqZFU6em/v8Jx4msxgq1L4g1ZHTEJAWXGX7WNjdf
 fyU31eeaOF+Q2eFtXfBsZc0alwZoJuPX6Ry7ZDon3A8JcIx3naK+/6sN0HqtaEFEzpjFpsET6eU
 ayRdFKBj3bc/EX4wPQcv103v6oRXvH3wAVuPum6Jd06Gjdgi+tp7pGmsZr8vmnoZqYoAZXgG/vD
 mfVKPYJGD+eDcOyH0iaVmCA1N1DtoyPLJmp8Sd4jWLNShJzN6AOgbMURgT9ygCjgVa2xIAxkiL3
 nET1+pi+kE3zrlMMM39FZKziznjlJD6BKR0gBmdWaeWZObfLl8a5QJ2XOCEavucZZMe6nqAsqKo
 BuFFiy5BJwLkuEtAZjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

iris_remove() does not wake up a client that is blocked in
VIDIOC_DQBUF or poll() on an open session. The client stays blocked and
keeps its file descriptor open.

Flag the vb2 queues of all open instances as errored after the core is
shut down. This wakes up the blocked clients, which fail with an error
and can close the file descriptor. Skip the instances that are already
closing, as iris_close() releases their queues.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c    | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.c     |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..cb84753e4f91 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -50,6 +50,7 @@ struct iris_hfi_session_ops;
  * @icc_data: structure of interconnect data
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @closing: set on close, skips the queue error during removal
  * @sequence_cap: a sequence counter for capture queue
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
@@ -98,6 +99,7 @@ struct iris_inst {
 	struct icc_vote_data		icc_data;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
+	bool				closing;
 	u32				sequence_cap;
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dc83daccea5f..51054862bc64 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,8 +12,10 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/ubwc.h>
 
+#include "iris_buffer.h"
 #include "iris_core.h"
 #include "iris_ctrls.h"
+#include "iris_instance.h"
 #include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
@@ -259,6 +261,18 @@ static void iris_core_put(void *data)
 	v4l2_device_put(&core->v4l2_dev);
 }
 
+static void iris_instances_vb2_queue_error(struct iris_core *core)
+{
+	struct iris_inst *inst;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (!inst->closing)
+			iris_vb2_queue_error(inst);
+	}
+	mutex_unlock(&core->lock);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -278,6 +292,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	iris_instances_vb2_queue_error(core);
+
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 04bd37b93445..bb3519eff3b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -312,6 +312,11 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 int iris_close(struct file *filp)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
+	struct iris_core *core = inst->core;
+
+	mutex_lock(&core->lock);
+	inst->closing = true;
+	mutex_unlock(&core->lock);
 
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);

-- 
2.34.1

