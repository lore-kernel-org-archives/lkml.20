Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341A33C536
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014711; cv=none; b=B7TlSBGN3p2Ij1aDbunlLl044Mt2A4bcD3H+dwTeyJ8BPkOBrQ5GEOnrI+KOT26KMbtYU/gNeJCBdt7CtARgq+eAQ7QUyw1KA7DZwtg2FjlEFGrKJDSiNgRY4apZGDiPHoDB7uV21jAHg2ccP86OUU/jrHQ2NR0qy7pNIVxw6S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014711; c=relaxed/simple;
	bh=IYwCHGvRCE0IUY7GbipIBjw2hj/OsJ7eLxHeg+OkQyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tB4OP6VbNeBSakfRdXijYjpMpRemtgnyC2BQ0IWHIjH444ak6pFMVX7mRdhvOLu2hbVT7MHASIg3eKKXrXVxaERXQCc03Y/Uds8nCfEz71Jvu7btlgeY3u8ibhwxhI7TpYW2Lyfj9gCbPTllEnh4uoc/GoVrXnPg8APOrXdPKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SmuMhkLX; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SmuMhkLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wn
	OvNfyp/TALdwlgN291rg+EW9FopoczSlJR5mBkWNc=; b=SmuMhkLXgGfU8H+7mq
	5RJ6G17x9h4s2D/kDVPCs/+djAEu0Bassr/gUTt00YfUA1gCwhwid0GZOzWqD7CQ
	CxHniWcKFSnnRmJe8vs81fwyxV/p6ht4YuGHSD0xkMRRB+Hk1jHqYpo3HY89HFtU
	GitAQF/HAK6O8w6sPUtpMymWY=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S4;
	Thu, 10 Sep 2026 12:29:56 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 02/10] scbed/fair: Remove duplicate check for busiest_cpu in active_load_balance_cpu_stop()
Date: Thu, 10 Sep 2026 12:29:42 +0800
Message-Id: <20260910042950.1619727-3-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1UKFWxuF43KFyrZr1kZrb_yoWkZrX_ur
	nrurn3Kr1jvFn09ws3CrZ3Xr1F9a4YgF18G3W0gFZrCry0qrZrKrZakFn5Xr93W3yIyFZF
	vwn0gF1jqw1DujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREjjg7UUUUU==
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wTg6mqiMkSBhwAA3R

The check for cpu_active(busiest_cpu) already ensures that busiest_cpu has
not gone down. An additional check for busiest_cpu != smp_processor_id()
is redundant. After this modification, busiest_cpu will no longer be bound
to smp_processor_id(), allowing the active_load_balance_cpu_stop function
to accommodate more scenarios, such as preempt active balancing feature
that will be addressed in later patches.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 13e873b1ef58..11c104010b2e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13769,9 +13769,7 @@ static int active_load_balance_cpu_stop(void *data)
 	if (!cpu_active(busiest_cpu) || !cpu_active(target_cpu))
 		goto out_unlock;
 
-	/* Make sure the requested CPU hasn't gone down in the meantime: */
-	if (unlikely(busiest_cpu != smp_processor_id() ||
-		     !busiest_rq->active_balance))
+	if (unlikely(!busiest_rq->active_balance))
 		goto out_unlock;
 
 	/* Is there any task to move? */
-- 
2.34.1

