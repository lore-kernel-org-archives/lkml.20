Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B14ED196
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871433; cv=none; b=K9tCMvaSAM0iHmZuU9fz5sey6clSfS5zjis/uvlJolhzx73Prjb/U0dnYNLuKgSpvcF5JwE8OBTxCDoUoRBn5eHBgdiwHSNWLMBqBrP8DlcQ6usKSfozTER+yHWiD/lds4P3G4cXjl9zCzJlQmsmn6kxw+4K2nPHPXxTomSy+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871433; c=relaxed/simple;
	bh=t03pAhrg8sAsoDFq8EgjjQCuTuHoKMxcqPqjdHAt6W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKa4HOSkw4jgyYK2xZJmLuEiXUkwUhb9tE3XWNMs/Mr090YPgER7EeB1qvfn4rNX46A40BuQG2QCGE/5fu8Xi6uu/Wv0VDvuTkNWTpPM0GNoPfxh/WbKxMiOEo7LaPCTFZiYiVzYW0nlG83uXyrOmt+V4OBvZIOjYBMbU+3QBX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=du+HeX4s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="du+HeX4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790871431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaWzhPI/4ga7lB6AzlBwiqIvEeBTon/cp7AmGF2eujE=;
	b=du+HeX4su0hZ7nLDHSt+6w48ftMafjwZGKm+IENKTd7WxTQDRSNkAtRvRpIjIv9nsOa7J3
	oHlxA1XbYBxXETaRNQv/dimIPh7n3uS2mxeNlH7hq/iJ72ut2SU5CAiNpr7TDLks9EOLD/
	aoXgQ3GFRCHvQPMVrzE/xMcMcI7KsDY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-ME-69OrSOs-kA_iiKjdjQw-1; Thu,
 01 Oct 2026 12:17:04 -0400
X-MC-Unique: ME-69OrSOs-kA_iiKjdjQw-1
X-Mimecast-MFC-AGG-ID: ME-69OrSOs-kA_iiKjdjQw_1790871422
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB5241865DAB;
	Thu,  1 Oct 2026 16:17:02 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8254D1956089;
	Thu,  1 Oct 2026 16:17:00 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 01 Oct 2026 18:16:49 +0200
Subject: [PATCH v3 2/2] firmware: qcom: scm: Allow the SMC request to
 freeze
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
In-Reply-To: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790871413; l=1435;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=Tki6WuF5Bd2kjmDxtI05kkaLnTRE19oCA3VmssMCIp8=;
 b=jOSG7EbPs5F6nzTezckgMAcoyFjJSgMjWdSpHRJclhZJfSbDefg1vLOWuZXgbfYje8WaoxgMp
 kFsI6pnvOmKC8I7JBaUEhwLkMYrAaGA0SjxBYNPo7C6dF28AHiUwD0k
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>

qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
uninterruptible, so a thread parked on a firmware waitq cannot be
frozen or killed. A long wait then blocks suspend, and shutdown
cannot tear the task down.

Wait with TASK_IDLE | TASK_FREEZABLE so the freezer can freeze the
waiter during suspend; after resume it is still waiting
for the same waitq completion.

TASK_KILLABLE is not added. If a fatal signal aborts the wait, the
driver returns early without issuing QCOM_SCM_WAITQ_RESUME, leaking
the TrustZone execution context.

Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()")
Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ea4481385412..92cee2263ed4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion_state(wq, TASK_IDLE);
-
-	return 0;
+	return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE);
 }
 
 static int qcom_scm_waitq_wakeup(struct qcom_scm *scm, unsigned int wq_ctx)

-- 
2.55.0

