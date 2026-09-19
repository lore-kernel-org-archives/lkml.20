Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADA1C3F0C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789790534; cv=none; b=K0wkkk24jzAxO3QjdJYAEdIq1k83blbuMjfLm430dhpVSRF1kPvtBpm4tdy63+5b79SsDJ5S37VZfm78K1j4AgmkNVrJjRwlfbqlJwzllTyMejLBX/fZdNlo1s3Ld086njFOVVAg1NcHCna/CpLB0zv27fHSscy+FNSyWAQxbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789790534; c=relaxed/simple;
	bh=VZ+WmxgKkDvmA4uZcbggik3cdU4NCyqauBDtLBHYpIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fi1+vp2IjzyP2hfDBHL6pXcXf3eGGY2aLURJIolGiKh9i2ymrTesXMU4yiNG/zlhChBzFYKXcvpZgAgNcmgG2nWUAlX/Iwib4H/HMlk7DCTjYmBS4MJ/OscSu/AwoHArGTJqkd1B/T1XML5lvPwH8dyaFlYKn3KRo5untQDU6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Mxsgy84h; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Mxsgy84h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=K2
	0DC3fRPWJ/nksRsIeJefCHZPC3eftROuOPD+nwp+Y=; b=Mxsgy84hrDohBmI/ke
	XyqdaQOKbO6jfTj7UWhCVhmQZvdogqLMGxV4yifAVyFR5ZttsVQCYpLsxWwrt2Sj
	e+Sj3sN3zwg2VHqcODA0T6zZYkuolHePIlZaXQaHv1zzxrwxGvtODdbNCZYghJkM
	675blHOFbgQbJWvzALEmPT8LM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgB3vmu4CK5qh0bIAA--.37484S2;
	Sat, 19 Sep 2026 11:59:53 +0800 (CST)
From: albin_yang@163.com
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sat, 19 Sep 2026 11:59:51 +0800
Message-ID: <20260919035951.509665-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260909133345.1572954-1-albin_yang@163.com>
References: <20260909133345.1572954-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgB3vmu4CK5qh0bIAA--.37484S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4DKr4rtw4UGrWDuFy5XFb_yoW8Zw18pF
	WrK34Ygws2qrykJFnFy3ykuryrurWfC3y2qF95JFy2v395Xr4ak34Iqr1Yvr18WrykuFyx
	Zr4jg3ZFvFWqy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxgA7UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzht2GWquCLuBhAAA3I

Hi,

To make the bug more concrete, I wrote a userspace reproducer
(available on request) that exercises exactly the path described in the
commit.

Setup: the system needs enough CPU pressure for the worker to become
!entity_eligible and take the delayed-dequeue path. In my runs I first
start background load, e.g.:

    stress-ng --cpu $(( $(nproc) - 1 )) &

The reproducer itself also pins a busy competitor thread to CPU0 for the
same reason.

What the reproducer does:

  - A worker thread burns ~80 ms of CPU on CPU0 then usleep()s for
    150 ms. With the background load keeping min_vruntime ahead, when
    the worker sleeps it is !entity_eligible and is kept on the rq with
    se.sched_delayed set (delayed dequeue) - still "sleeping" but not
    really runnable.
  - A separate thread migrates the worker to CPU1 with
    sched_setaffinity(worker_tid, cpu1) ~2 ms after it goes to sleep.
    This takes the plain migration path (activate_task(dst, 0)), which
    re-arms last_queued at the migration time while the task is still
    sleeping.
  - run_delay is read from /proc/<tid>/schedstat right before the
    migration and again after the worker actually wakes up and is
    scheduled.

Observed result (20 iterations; run_delay delta in ms):

    iter   run_delay   expected_err   verdict
      1      148.03      148.12        BUG
      4      148.88      148.93        BUG
      6      148.05      148.12        BUG
      9      148.88      148.93        BUG
     11      148.06      148.12        BUG
     14      148.89      148.93        BUG
     16      148.03      148.08        BUG
     17      148.89      148.94        BUG
   (others)     0.00      148.00        ok

Every migration that lands during the sched_delayed sleep charges
~148 ms of phantom wait into run_delay - i.e. the *entire* sleep
duration between migration and wakeup. With the patch, run_delay
delta stays ~0 in all iterations.

So this is a real, user-visible run_delay over-count, not just a
theoretical one. The fix is the single-line change in
sched_info_enqueue().

Would appreciate a review / any feedback. Happy to share the full
reproducer if that helps.

Original patch:
https://lore.kernel.org/all/20260909133345.1572954-1-albin_yang@163.com/

Thanks,
Wei Yang

