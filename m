Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04C3BD62F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872796; cv=none; b=IA2+UKaCSqq16UWoR/8eSMDRRYSf85sWaruFIUy9t8er32CU403d4NVBHQ5SJRnm+nQ7m0EMGUmhfhvfSji6gNMPIysI2137u4skh413WaU9LROP/Vm1AU9QTAXr5i/Q5x3KF0F8xhcEx/hYMZKc0TWNKzLy3i0QxkwFCNVjU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872796; c=relaxed/simple;
	bh=V1z7LYxVZYm2d5SCLa7VIfLzltAwNUlzIyRa/cyq158=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyU8YkvqggdESPmn2ZXy1i46xqPP5pQNehHF2jB1I0yq/V5DnBkbYKu4OL286dgsk4htfgI+yBmVItKkRMKvIIfhqpYrzZURJRPcq8e4zkkyFF6/Cg5WLz2xHpxc3zCDpgnTAGwxg2PWivhe4Gno7ykJpeM/eyfFuhOeEgrq/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nZbivMti; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nZbivMti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fR
	cmh/W69BmqI1WSDrwh+faRi5phtDzOv/xupfFwuiw=; b=nZbivMtiPM65I1VSz4
	s5Kv+ygooQ8ekAMO0yFD2gBSvsKXcD6RCqXeykZ+DMz5lkadHlWGnvwHgsjAvph7
	bAtr50nGp9xgYlPNme8NvNiKosTQ3THpfdPuE1u+ayhaRsgJ3nLq6h1ECjAKmHQb
	8XqNpDefgy0rwsQHFNYEaohp4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHltVWSq9qY0lsAQ--.21956S2;
	Sun, 20 Sep 2026 10:52:08 +0800 (CST)
From: albin_yang@163.com
To: kayracizmeci@gmail.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sun, 20 Sep 2026 10:52:06 +0800
Message-ID: <20260920025206.1237461-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260919102420.108000-1-kayracizmeci@gmail.com>
References: <20260919102420.108000-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHltVWSq9qY0lsAQ--.21956S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1fZFWkuF45Kr15JrWkJFb_yoW8Gw43pr
	W8KwnrJF48tryxJr45Aw4xWr1rZrnrJry3tr1SvrWFkrs8Wr1avw17Za1aqrZ5JFnFqFyf
	Z3Wjq3WUCa4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUoBT8UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC7xgv0WqvSljuyQAA35

Hi Kayra,

On Sat, Sep 19, 2026 at 01:24:20PM +0300, Kayra Cizmeci wrote:
> No? can_migrate_task() skips delayed tasks unless they are both delayed and
> migration_type not equals migrate_load.
>
> And can_migrate_task() is called from detach_one_task() which
> gets called from active_load_balance_cpu_stop(), with a custom
> env where the migration type is not set. That means, the migration
> type is migrate_load, and can_migrate_task() can return 1 for delayed
> tasks on this path.

You are right, thanks for catching this.

migrate_load is 0, and active_load_balance_cpu_stop()'s lb_env does not
set .migration_type, so it stays 0 == migrate_load. Hence in
can_migrate_task():

	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
		return 0;

the condition is false on that path, and a sched_delayed task can indeed
be migrated.

It is also a bit broader than the active balance case: load_balance() ->
calculate_imbalance() sets env->migration_type = migrate_load for some
group types, so regular load balance can hit it too. Either way those
paths re-attach via attach_task() -> activate_task(rq, p, ENQUEUE_NOCLOCK),
again without ENQUEUE_RESTORE, so they hit the same bug.

So the "load-balance migrations are unaffected" part of my commit message
is wrong. The fix itself is unchanged and covers those paths as well; only
the description was wrong. I'll correct it in v2.

Thanks,
Wei Yang

