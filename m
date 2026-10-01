Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF3470134
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871429; cv=none; b=ceDIEQKuz5yYXecJyImZHIc/RAsk/ezjPCkvqc8+qbhbwYBdmlODcxennookjP0RFOR+8Lu9AK5yqnEcHMHhY31JvNUtAKBffwbjzhW00FXm3XTUbg2GgTFbReA0EnF7KrO58xrQqUOu7nBBIwrIjCdiqANM7xO49cD6pAFOhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871429; c=relaxed/simple;
	bh=8XIDpbXkj9CJFXKgKMb8K9KDabDBANEE0BQhM9zrdh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leP4UgwpqdoJgbqZmU1RnkFKYut3dyZniaaX26s279lRjCH5c1h7sR7/SUQ9UcemXEabhihFshV+1PCOFg7D5l19CjLwj+VhlYuPZDdwa06NycSx94hrRZj/8JeAtbf+EcaUUZ+TnmyJ8KLCwzRuw0AADaTkhcOrCGRPMBaPXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dmlCsi/s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dmlCsi/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790871426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D04hlHQwSMYmhn8+Fw1PzhjciD1AZPEP8mDwkb2tcw=;
	b=dmlCsi/saKzWbfxxi5vawjCO54PQGdDUp8EfBlisW4qD44txIFs48tqHbvDzRMVADsz751
	VM5iejOBpUy/1H7TyOgb0j/DL3rGygeSL16VnC5u4pmw7FHLgtv/ax6EZZHd447LQ5Z9a6
	0b7gkeTEaVW9+Mwtrbj7UO5Qb8GJf2I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-ySUmZ2MWN46e-oGxbgCY1w-1; Thu,
 01 Oct 2026 12:17:02 -0400
X-MC-Unique: ySUmZ2MWN46e-oGxbgCY1w-1
X-Mimecast-MFC-AGG-ID: ySUmZ2MWN46e-oGxbgCY1w_1790871420
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2893818009C0;
	Thu,  1 Oct 2026 16:17:00 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27B931956044;
	Thu,  1 Oct 2026 16:16:56 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 01 Oct 2026 18:16:48 +0200
Subject: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
In-Reply-To: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, 
 Murali Nalajala <quic_mnalajal@quicinc.com>, 
 Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
 Jian Shu <quic_jianshu@quicinc.com>, Guru Das Srinagesh <linux@gurudas.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790871413; l=4918;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=6/Qv9tRwdvX6/5mjo1VRSsiyGOM2ISs+NDMUgFQSqCE=;
 b=EFJbLMsIM+wOVEdtEJdPXqjwDkgHa7Ymp/E/FWzr2yG9DELz7r4eNk109p0epuSm1ZH0Rk9EZ
 bmMGfxuibMVDOcTn6XPqaEL/UxEJ7b06OOzdqdAo1E32E6gXoADZFRs
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Ninad Naik <quic_ninanaik@quicinc.com>

qcom_scm holds its global mutex across WAITQ_SLEEP and
wait_for_completion(). Firmware waitqs allow multiple SMCs in
flight (wq_cnt). If one call is parked on a waitq while holding
the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
and both stall on the waitq.

Replace the global mutex with a counting semaphore sized from wq_cnt,
with at least 1 wait queue.

Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq contexts")
Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
 drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
 drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
 drivers/firmware/qcom/qcom_scm.h        | 3 +++
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
index 029e6d117cb8..6afcbe6f7e5e 100644
--- a/drivers/firmware/qcom/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom/qcom_scm-legacy.c
@@ -6,7 +6,6 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -15,9 +14,6 @@
 
 #include "qcom_scm.h"
 
-static DEFINE_MUTEX(qcom_scm_lock);
-
-
 /**
  * struct arm_smccc_args
  * @args:	The array of values used in registers in smc instruction
@@ -173,11 +169,11 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 	smc.args[1] = (unsigned long)&context_id;
 	smc.args[2] = cmd_phys;
 
-	mutex_lock(&qcom_scm_lock);
+	down(&qcom_scm_sem_lock);
 	__scm_legacy_do(&smc, &smc_res);
 	if (smc_res.a0)
 		ret = qcom_scm_remap_error(smc_res.a0);
-	mutex_unlock(&qcom_scm_lock);
+	up(&qcom_scm_sem_lock);
 	if (ret)
 		goto out;
 
diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 127365ab11fc..1b51e0fb8292 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -6,7 +6,6 @@
 #include <linux/io.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
-#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -27,8 +26,6 @@ struct arm_smccc_args {
 #define CREATE_TRACE_POINTS
 #include "qcom_scm_trace.h"
 
-static DEFINE_MUTEX(qcom_scm_lock);
-
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
@@ -135,11 +132,11 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
 	}
 
 	do {
-		mutex_lock(&qcom_scm_lock);
+		down(&qcom_scm_sem_lock);
 
 		ret = __scm_smc_do_quirk_handle_waitq(dev, smc, res);
 
-		mutex_unlock(&qcom_scm_lock);
+		up(&qcom_scm_sem_lock);
 
 		if (ret)
 			return ret;
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..ea4481385412 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -78,6 +78,8 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
+DEFINE_SEMAPHORE(qcom_scm_sem_lock, 1);
+
 /**
  * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
  * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
@@ -2869,7 +2871,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	}
 
 	ret = qcom_scm_query_waitq_count(scm);
-	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
+	scm->wq_cnt = ret <= 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
 	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
 					GFP_KERNEL);
 	if (!scm->waitq_comps)
@@ -2893,6 +2895,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 					     "Failed to request qcom-scm irq\n");
 	}
 
+	sema_init(&qcom_scm_sem_lock, scm->wq_cnt);
+
 	/*
 	 * Paired with smp_load_acquire() in qcom_scm_is_available().
 	 *
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index cf90a565fdfb..06fdc5e56bea 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -4,6 +4,8 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
+#include <linux/semaphore.h>
+
 struct device;
 struct qcom_tzmem_pool;
 
@@ -15,6 +17,7 @@ enum qcom_scm_convention {
 };
 
 extern enum qcom_scm_convention qcom_scm_convention;
+extern struct semaphore qcom_scm_sem_lock;
 
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3

-- 
2.55.0

