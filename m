Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2D37E5CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=KUN24ES+0SuBqEmIKYLVfqwI3xcpo4Jnq/TefkK5YpyrpuyG5EVt1X5UZgE5QaQ+PJpSkpWq4W6qo5r0EAJGBLPVeb1Wm48XLnnH6uk7e4ZPQeUXuQotSwCvTkmVDccaGLCxw5vEi+hBoms6QuRX0LhxeU+NpAMnuGbItu9Dipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=MmE42vByQegAZN4de4r4cEy2IgaWKlOiDSWRCGZyQM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n9R9V4V2Z9ETdnISBpjl2goIKpRwJtawlCKRxkCbKUfOUCML3Rca0v+zwx5ofAiJZi5egzfryxs8zZqZlA7yAMJzwqwJ264qoKexOznYBFciWJaQfkDnI0nlkfPGuzd8aVzYaqtBNYfvp3DV4cgDI08Z/YMyo2iSuJ/JYsCDJPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aMS/tKfb; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aMS/tKfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=A6
	5RVDN267qKaanvkAeYvWohUstOEpo7HrQt+WE9L84=; b=aMS/tKfbHEEcW5zvYz
	TXCClqtH3fNm/0upcqUi/ryL06s2EnPrKAgjsQ4okzRI2aEDYDsHXq9KqptxMdnX
	5U4UpRarEK0iwmL/Nk7kMlLW3aHQm7wlQPhRr/H8xRjF7CmJrSIJqjlVKapKbdVh
	mPDFYpW2FgB2WApMXyIExtcYs=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S5;
	Thu, 10 Sep 2026 12:29:58 +0800 (CST)
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
Subject: [RFC PATCH RESEND 03/10] sched/fair: Clear active_balance at the end of active_load_balance_cpu_stop()
Date: Thu, 10 Sep 2026 12:29:43 +0800
Message-Id: <20260910042950.1619727-4-jackzxcui1989@163.com>
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
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy5CFW5Ar48Zr15JF1DJrb_yoW8ZF1fpr
	WjyayIgw4ktayYvrZ2ka18ury7uan8Jr4UGrnFqrWrZF15C3s5tw1F934xur45Zrs5CFn0
	yay7tr4UCa4rGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UrGYXUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6Abg6mqiMkaCYgAA34

The rq->active_balance flag is used to prevent multiple CPUs from
simultaneously dispatching active balance stop tasks. Since there can only
ever be one consumer of the stop task, it is not strictly necessary to
protect the setting of rq->active_balance to 0 with the rq lock in
active_load_balance_cpu_stop(). Therefore, we can move the action of
clearing rq->active_balance to the end of active_load_balance_cpu_stop().
The benefit of this approach is that the task load of dst_rq will change
due to the execution of attach_one_task(), which helps avoid prematurely
clearing rq->active_balance before attach_one_task(), thus preventing
unnecessary dispatch of duplicate active balance stop tasks.

Active balance stop task is triggered only when rq->active_balance flag
changes from 0 to 1, and there can be at most one consumer of active
balance stop task at any given time. Therefore, we should never see zero
rq->active_balance in active_load_balance_cpu_stop(), use WARN_ON_ONCE
instead.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 11c104010b2e..20d03ceed9d7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13769,8 +13769,7 @@ static int active_load_balance_cpu_stop(void *data)
 	if (!cpu_active(busiest_cpu) || !cpu_active(target_cpu))
 		goto out_unlock;
 
-	if (unlikely(!busiest_rq->active_balance))
-		goto out_unlock;
+	WARN_ON_ONCE(!busiest_rq->active_balance);
 
 	/* Is there any task to move? */
 	if (busiest_rq->nr_running <= 1)
@@ -13815,13 +13814,13 @@ static int active_load_balance_cpu_stop(void *data)
 	}
 	rcu_read_unlock();
 out_unlock:
-	busiest_rq->active_balance = 0;
 	rq_unlock(busiest_rq, &rf);
 
 	if (p)
 		attach_one_task(target_rq, p);
 
 	local_irq_enable();
+	busiest_rq->active_balance = 0;
 
 	return 0;
 }
-- 
2.34.1

