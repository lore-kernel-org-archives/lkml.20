Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF03A75BD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014090; cv=none; b=j3vSkhX4KVtLKkrDi9v/XcxV7Gdb1+HA5LsCZlzAKI4O8BmFa/55cly8CLjp45otiQR7MWzvvS4nK2SglgrLVmQ8v+cIymOsQ9l5qQjwjpeHFqR+5Ro7IqJOVYt2qjL17m5iBneFpBzuFspOjhT2uCeVoqDPWgH6y0ATaEjf1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014090; c=relaxed/simple;
	bh=BgSyOPjBQIbBxpQHcEA4Ovc9yJffVNYTMFQQIyNsJ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjAIOT3+45rCuq/3yCgC4Dbi8li+45+zivqx9zqKntEygXvBX44nt64blRP2VnMRp3dFVu4CGgca0CDpzTOk++KiK76cS1Ljbtv7GqbK1QU1DReaCo/Aql+kkG1xJS6wCKSCu2T8fyGgB6aWv7d0gbluiVatErUKQ8Z5L0HDIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kcnSa80S; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kcnSa80S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sW
	XfMpWgvRr3nWlorZHGFqFte7Ve6CjvoFF32NTf3Vg=; b=kcnSa80SV2TSMXmP7b
	DGR1FPLInL8XiYDwU0YUn8FuLtpoZSPaV7o3qeFZmKQ5Zq/b6xOvtQ/bS2f8mX69
	yTe4d+hS6VWY81WjW2MQiYXO8fL5sDWqkSkViRRTtvQWzIM33UCH67V3Uuw6AnY2
	6wFlI+ylJPMFlJEHzAfl+r71s=
Received: from deepin (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgDHr4RoL6Jq2j6BAg--.44320S2;
	Thu, 10 Sep 2026 12:17:45 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH] sched: clarify ptrace's effect on task_struct->parent
Date: Thu, 10 Sep 2026 12:17:21 +0800
Message-ID: <20260910041721.8135-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgDHr4RoL6Jq2j6BAg--.44320S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWDCF47urW7urWDWrWktFb_yoWfZFg_Za
	1xJw48Cw48GFs7XFnrCr17tFZ0gw4UJF18Z3y8Ka9IgFWDXFs5Z3Z7GFyxtryxGFsI9F13
	Was5Was7J3sakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIAkp6WqiL2mRLQAA3b

The current comment for the parent field does not explain that it can be
temporarily replaced by the tracer when the task is being ptraced.

This can lead to confusion, so clarify the comment to document this
important behavior.

No functional change.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
 include/linux/sched.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 705970d07..977859a63 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1093,7 +1093,11 @@ struct task_struct {
 	/* Real parent process: */
 	struct task_struct __rcu	*real_parent;
 
-	/* Recipient of SIGCHLD, wait4() reports: */
+	/*
+	 * Recipient of SIGCHLD, wait4() reports. Normally the same as
+	 * real_parent, but temporarily replaced by the tracer while the
+	 * task is ptraced.
+	 */
 	struct task_struct __rcu	*parent;
 
 	/*
-- 
2.51.0

