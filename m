Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D104A1DE3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366919; cv=none; b=K/7N7dFFQUM423pfqViY0oO4CvAnosj/4L3gJwDHQg19MxXDsGsNjpQ+5rNppDZmCfuKR6Us+GOSPQRkyZnKp9dI8urGvGCy3h9h/NODpE7ekbhcXLOgu/+Kir3CQCCFgkp1B92BmPfaF7P+UCUCy46+xUrQifUkkwrufGBwfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366919; c=relaxed/simple;
	bh=ZCOT8tJ001IxhkIKuJ1wdLG4ckufZHEN8Bcsa9fbZgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qs2fZ4NK5QHxcGKfpkhf8zaHdZu8eexadubCV+pVmtgLaNfj+jqRlBt20mX5TKNo1/BaIIAFnoYoh5yMmXCl1tZ2CKpR4YdxHeDPpKXoNA94yufqQYpxKCjLV6lYWjZ2sVN5k+aN90qhUkZjQS432KDVtVMsGIJW0tLk65ugD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EIv4EcZO; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EIv4EcZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yd
	K3QjQh/1Sd3MDTvxfEZkeVJ8J2UuktfraulV77OiQ=; b=EIv4EcZO9ntA8Ccxeq
	jJL2bKaXu5kTHS+sqI9POHfN57sKwIvzNic3e2QwHiLjNT4uoDrUzW/CxDCTb2Im
	A8yP3z7HUN2R1VEmikWCP5OphOVp72Cc6VEWX7hwS5DU+u8c7ib/E0xsXCoKe1qG
	+vGh8k8RNFOCR6QE8L9qBR8+0=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3Pz7hT5hqgqhtPg--.24813S2;
	Thu, 03 Sep 2026 00:33:38 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	metin.kaya@arm.com,
	connoro@google.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH 2/2] sched/cache: Use execution context for cache task tick
Date: Thu,  3 Sep 2026 00:33:36 +0800
Message-ID: <20260902163336.1552840-2-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902163336.1552840-1-sh_def@163.com>
References: <20260902163336.1552840-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3Pz7hT5hqgqhtPg--.24813S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy5ZrWxGF4rZw1DCrW5Awb_yoW8Jw48pr
	Wv9a17XF4kXay7XFW8ZaykX3y3W3s3AasI9F4DGrW09r15Kw4F9ry0q3WI9F4Yvr40yFsF
	vw1q9rZrGryUK3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zioq2tUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QLMLGqYT+KlAAAA3x

Cache-aware scheduling accounts CPU runtime to the mm of the task
actually executing. update_se() passes rq->curr to account_mm_sched()
for this purpose.

With proxy execution, however, fair_sched_class::task_tick() receives
rq->donor as its task argument. Passing that argument to task_tick_cache()
can therefore queue cache_work and update the cache scan epoch for the
donor's mm even though the corresponding CPU runtime is accounted to the
execution context's mm.

Use rq->curr for task_tick_cache() so cache scan work is driven for the
same execution context whose runtime is accounted by account_mm_sched().

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Signed-off-by: Hui Su <sh_def@163.com>

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 09ddb3802c28..866f2a5dd101 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15045,7 +15045,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (static_branch_unlikely(&sched_numa_balancing))
 		task_tick_numa(rq, rq->curr);
 
-	task_tick_cache(rq, curr);
+	task_tick_cache(rq, rq->curr);
 
 	update_misfit_status(curr, rq);
 	check_update_overutilized_status(task_rq(curr));
-- 
2.54.0

