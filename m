Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DDF46D572
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122649; cv=none; b=VU6q2vVvdraDdVec/qidZJDIDeu/ANqQHYh0CvdXBRUKnFg/rMXosVQEsY/y7DIEWsPbBBJxiGjVDpizM7sV/bd5+6/G/W5MLAOVBs+boqlouUokO5Xwz1whDAlp7x8USFHPCi+Yl17fBQ8rOD/9krSjgeiCd8g/UqQToMjIlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122649; c=relaxed/simple;
	bh=4rTcP8+UgLBMGKegWTDcIxrsqGEZaPZudzA6ouxcHXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eYd7stDzAfo+gO8FPAG6qwFcqQ9vu8jFBXzfoWdjchNeVknwLFIy465JXnVssv3pdcamG0J8knkwhlAF/oU1mtyCNf62xl6d6eQq0V5lHVTKcUs46Y2CagkZCrL30+KEqlkDB2+1IzhOhYGKKIWY/f8VmDXn2JpRGFKdtWsdXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=JouC1oqI; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="JouC1oqI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=SXtNA177EaxUe1pCfpdcWJYpJ0qgTjwrK2zCDmLSJ/4=; b=JouC1oqIKqdhe82qomR2hEEDcR
	Be1a7n9WWWjtd2Xu7+ujJPFrFnzhS+SNhVbGp6y9iwVX7jDVHygUtFNLi1nyoNBVPP4eVXAo+oaNO
	MlcnKQFrn/ePBzU9lVF0jqCU6PrPsvH0MfKNJm1SkMsloov9Q4n+U6G96nHaNzMF5o5aMEMIwdg1i
	5oDFJkaDGJOCwdGlJmtwulEU29pFZdF4MvnN5PvbfzffAKBH5AObXkOp3u5kasjgu1fE8PiZ/sP4/
	3eBmhaOcLFcfJYi0VOYAHiDl65c2Hnhjpa8QS/4zwXkJ9KwItQ+YTss3u8JF4k9RMvQFfT7xJRKjK
	IN3W/aVw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4yWe-001E3M-0e;
	Fri, 11 Sep 2026 10:30:32 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 11 Sep 2026 03:26:28 -0700
Subject: [PATCH wq/for-7.4] workqueue: BUG_ON() a pwq release before
 workqueue_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-tejun_bug_on-v1-1-8ee9083f7a7e@debian.org>
X-B4-Tracking: v=1; b=H4sIAFTXo2oC/x3MQQ6CMBAF0KtM/ppqZ6ISehVjiJUBx0UrragJ4
 e4mvgO8FVWLaUWgFUXfVi0nBOKGcLtf06TOBgSCeDn5jtm99LGkPi5Tn5M7xlaGzrNEFjSEZ9H
 Rvv/ujM+8H3Nx7e6Ay7b9ADEPcgtqAAAA
X-Change-ID: 20260911-tejun_bug_on-5b72d9012b12
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=leitao@debian.org;
 h=from:subject:message-id; bh=4rTcP8+UgLBMGKegWTDcIxrsqGEZaPZudzA6ouxcHXg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqo9hEGX3qe0ZMyMh/ri69ZSrE7dIhBu6fv2bE4
 3/ooOJCepuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqPYRAAKCRA1o5Of/Hh3
 bX3oEACfK99Rojig75MIVUpVQICvkjQxkt3Ogy4JJP6P5w2i8gIFn4KngEo7AppY2aZhAI3rv7E
 i6jCXDFRumc6RqfE3z+HccZp+6cigqDwmMJAmzIoB+hQj8kLAfFSWg2UfYcejdrgDORdOqE7k+n
 kj0X0v34afkGz80ZZMfgUE1fBcYWdpGqTn2THk3IaSNRRE8tczgShMKxWNttM12gRYHhRDeSsrM
 BO6HGX5SSzlBqrmHSppGCBEDqMFmu+UmnkAugaCw09par55X+wD9VFl9BGQSEl/tdAe6reOg0dZ
 FhpuOsvPtErLFxctnQL8q/Rpf+PLZb8M/khhEmAUZUYc7esjh56wTf965dJGtpSaLBbepiqEfr6
 nEr9qew0VMvep4v1ch06Jq5tq0LqxMW2VrMDEs9IOSblih2KoY0HL6I8F1nNCVdf9HEMfLdjfB/
 jWOG/YbFO3ESt+sge0OOpzKxVqoNve7yc8S2JzKL8Ofu5cMUmDpgA/DodVf314tickP8i0CnIkx
 7JTMp3bNdwMT4QeDMG3eBTI0Tw+k8WvKPgEImQEjvm2FjZDQmZmhu6hFMeyWV+eGMBFMh8Jhllr
 tybnXpSn7jTNVRf8sOn7q5gKIMN4lFjBTgksRxWC0X5vXiO4+ajf5fuFxmW2QAPhxT0HGX7LVi+
 UzfdZI6qCYMWunw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

put_pwq() bounces the release to pwq_release_worker to get out from
under pool->lock. workqueue_init() creates that kthread_worker well
after workqueue_init_early() has built the system workqueues, so a pwq
allocation failing partway through apply_wqattrs_prepare() unwinds
through apply_wqattrs_cleanup() and dereferences a NULL worker.

There is no way back from that. Running the release inline is not an
option, that is what the bounce exists for, and workqueue_init_early()
already BUG_ON()s a system workqueue it failed to allocate.

BUG_ON() the missing worker instead of oopsing inside
kthread_queue_work().

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/144b3dc986135ebe34f671cdd02bd8aa@kernel.org/
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 39187f424c34e7..e618108c6127da 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1771,6 +1771,14 @@ static void put_pwq(struct pool_workqueue *pwq)
 	lockdep_assert_held(&pwq->pool->lock);
 	if (likely(--pwq->refcnt))
 		return;
+
+	/*
+	 * pwq_release_worker is only created in workqueue_init(). Getting
+	 * here before that means an early workqueue allocation failed, which
+	 * is fatal anyway.
+	 */
+	BUG_ON(!pwq_release_worker);
+
 	/*
 	 * @pwq can't be released under pool->lock, bounce to a dedicated
 	 * kthread_worker to avoid A-A deadlocks.

---
base-commit: d8c2ce77cd09077ec57c4bed5678f76425157ccd
change-id: 20260911-tejun_bug_on-5b72d9012b12

Best regards,
--  
Breno Leitao <leitao@debian.org>

