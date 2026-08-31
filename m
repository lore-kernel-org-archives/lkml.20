Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166A3CAA31;
	Mon, 31 Aug 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164080; cv=none; b=R4LnU2Jid6qGWuP3OwdboLe+yPvw+vwXD2kaEnMQdjEl9Om75qsPoAKOV2/8D7Hs/MfGhewW26GA94svV79e3ucxZCncBMzenDw+Z25LmOiFVux1/OixGMpNgxQ4MiDazXr9jahmqE5q436PqYD18xVC6U5X6jDjPABvVVI9sYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164080; c=relaxed/simple;
	bh=1UQ3XKLpRxLaB/IHRKyQ0RKRV0DNP+Kr27aR4M+LLOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pp0rMiTo0AEpPthMWyrBgi1lrszAncG9rt6ypoNKc8gE5FOjzgcGEYxr9Qc6iUtOjGv0V8mhY5l3Ih/axIbsdRfkXwK2MYKTR19QYJj0InatL8HlJHPsJHEiZqlDZYb5vmHbRYlfrBEhWD8HJlw4jb8wIGtYZRij/4YWm01GLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlXXvRJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlXXvRJF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD245C2BD01;
	Mon, 31 Aug 2026 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788164079;
	bh=1UQ3XKLpRxLaB/IHRKyQ0RKRV0DNP+Kr27aR4M+LLOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RlXXvRJFsfxEjavvl5ZriBDON83Y+Ts0aeFV6bKApFbLb4Et78s2uo/wm+u+CGcfR
	 OOkBXDT8FlH+1cWwwrtTB6tj4pMY7BdAJzQXqoLAWhRwHqGV0mODSWJ643bAHYaDlM
	 g4Uq9ZH43wc3u/mxw87M/9iJ18gHyfKcUEq6F4HheKrm12L1Bi4HUIR9nLUKBXwoE/
	 dSdaZ7M9SHtbq97ve4Ul7yU9XDQiiOd81yRoHYE8yy5L1YCG7dsg7vanNH1tsIaC87
	 9K5kuUFfjhWmwLZBPCnB7u1AsC0Mt1+R0DYvuULS8/GZO9PRDH7nCio2OLlzg4Qwwh
	 xOnMmOPxpPU2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B998EC624A5;
	Mon, 31 Aug 2026 08:14:39 +0000 (UTC)
From: Albert Esteve via B4 Relay <devnull+aesteve.redhat.com@kernel.org>
Date: Mon, 31 Aug 2026 10:14:38 +0200
Subject: [PATCH v2 2/2] firmware: qcom: scm: Allow the SMC request to
 freeze and kill
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-port-scm-patches-v2-2-bab5595e77b3@redhat.com>
References: <20260831-port-scm-patches-v2-0-bab5595e77b3@redhat.com>
In-Reply-To: <20260831-port-scm-patches-v2-0-bab5595e77b3@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164078; l=1339;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=Tm4UTIwoxQT5KHbYSrQ/GqM30LVTWUwE87PSxfkz9NU=;
 b=oNQQpiWcgeyV0r3wh52GzmqOnGF3Nsk7qtYxhw3PxFjha2ulbeEpp+NVUy/Pqvm7ho6h2o6vS
 Ne0d0i/PKa7BZnJ+NFIPVZMc9puwT+5Dz9z3qUXiQ7RKX6ZnKvnDD9Y
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Endpoint-Received: by B4 Relay for aesteve@redhat.com/20260827 with
 auth_id=993
X-Original-From: Albert Esteve <aesteve@redhat.com>
Reply-To: aesteve@redhat.com

From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>

qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
uninterruptible, so a thread parked on a firmware waitq cannot be
frozen or killed. A long wait then blocks suspend, and shutdown
cannot tear the task down.

Wait with TASK_IDLE | TASK_FREEZABLE | TASK_KILLABLE so the freezer
can freeze the waiter during suspend; after resume it is still waiting
for the same waitq completion, and a fatal signal can abort it on shutdown.

Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()")
Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ea4481385412..3e12258d0da7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion_state(wq, TASK_IDLE);
-
-	return 0;
+	return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE | TASK_KILLABLE);
 }
 
 static int qcom_scm_waitq_wakeup(struct qcom_scm *scm, unsigned int wq_ctx)

-- 
2.55.0


