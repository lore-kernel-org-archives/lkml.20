Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545B949C4BA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047248; cv=none; b=cH/yUeA6Xn4rW3s1kd1AWfY6mUPDmyefuMPxKQE1dCnrDmEkXVHq3jRFsmqPQVF88nFfyAVcaAr2pa5hz60jbf/U7sA8kxx0ncurHxWHXicaVCtrIroHAD8qgwckOaUpJD4n+wgTUrCs+cOTbJjZn0DGjVohRghXl9vlemUp9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047248; c=relaxed/simple;
	bh=CnUD6diQUQrPgJ0bmmJ/Bs1uiUC4OqVWH/JwLqy5WxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+EbXid8Ms/J9XcMJcG4D3RFRXfq5Eb1C6awVWiAChZZbE1BPcaLvwJIfn8RBYxSXOj2lo1lSLFvbEMhgntn9R8YwPmpQG3q8uIlwno65N12+P+zQutar7RHpNvFQ5dpD5lmM8TfD+tagFm2TuvBvccB/pO8D/F4/iELtBlki70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kgJ2+Qa3; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kgJ2+Qa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tP
	vgyb06xNIl8mLWuhZ7Ugv+kB1PpHBmh4W+zXrX9jo=; b=kgJ2+Qa3Ks0zoscVVl
	TkZR5NzTg+5Ev1SZs0X2USwoJdam/6KznQ8amJSJKamvV4zmwn5Gmv/uMMGGqCY0
	iq2x4rXHi3CwON0/hy2Muk7q1v1s/fpkl0bMwawSMDbtX229v4SD2xfFll6jZ8mZ
	aMvpt8MUuxfFY7jBfOba+imxQ=
Received: from deepin (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgBXlkgFsaJq_SyHAg--.42403S2;
	Thu, 10 Sep 2026 21:30:46 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Oleg Nesterov <oleg@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH v2] sched: clarify ptrace's effect on task_struct->parent
Date: Thu, 10 Sep 2026 21:30:26 +0800
Message-ID: <20260910133027.8453-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260910041721.8135-1-zhangcoder@yeah.net>
References: <20260910041721.8135-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgBXlkgFsaJq_SyHAg--.42403S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWDCF47urW7urWDWrWktFb_yoWfKFc_Za
	yxJw48Cr18GFs7XF17CF42yFyvg3yUJF1xZrW8KFZFg34DZFs5Gwn7Jry7t3s3GFsI9F13
	WF9Ygas7J3sI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIQawcWqisQZeuQAA3+

The current comment for the parent field does not explain that it can be
temporarily replaced by the tracer when the task is being ptraced.

This can lead to confusion, so clarify the comment to document this
important behavior.

No functional change.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
Changes in v2:
- Use Oleg's minimal wording suggestion to adjust comment.

 include/linux/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 705970d07..8aad8a8ef 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1093,7 +1093,7 @@ struct task_struct {
 	/* Real parent process: */
 	struct task_struct __rcu	*real_parent;
 
-	/* Recipient of SIGCHLD, wait4() reports: */
+	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */
 	struct task_struct __rcu	*parent;
 
 	/*
-- 
2.51.0

