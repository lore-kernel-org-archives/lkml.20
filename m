Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194D245C713
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052296; cv=none; b=B8Y2MvmQBdEuZDkpWDgx3/mrG+xRF4WHjqeuVf1qRt4dBBJTVwklHcWR5Y7qvg1xqNUQqIVrC1q2gShjUytASTawikI8yKFxzTYVHDkvkzI/IflsjPcwZ7Ux+zGvY6GJM3bWvty2ryD3/f9tuZTVliPS+raWNvjWGuV9TDC2dfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052296; c=relaxed/simple;
	bh=0kFr3D5FvsgC2LOBK21m86A/xV+WAKHLDtmLCDaUSaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6TNAfgNPJ5PLNcoqceIm3KQ7yS4+H0UtZWQzp7f84SJOfEYBYYT5QXG/GF9xdt2wroO9OiEQDIHYeDuRBwPUbF8bQ2RUE9HGJyyMfIbxMcRRyVKu5YmFtW2BIjlirKpFltJ2fPUqtPgHgJDCIt4f1TWpPEzcNZyVqaNRguy+IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eNty05+z; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eNty05+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ot
	+qOFZFVZOItYmYp4bFu2oN34nACjYQS1aVECcSY40=; b=eNty05+zS3WgKpx3X+
	9LJ4vCKETMFK1shhfbuNJkCswgEv4aJ/ShYqENOZzelleUHL07vjIl1nmM2vhaU+
	6kk0xC5HuqlStntrvxvJczDdxFSHpB02GHN/kfpf/cfZtrPHdBh5257UjVVGhZ1O
	Rweozedy2zFWQbYnkTo5hQCQQ=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnu+87xaJqT7Y8Bw--.49711S2;
	Thu, 10 Sep 2026 22:56:59 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Thu, 10 Sep 2026 22:56:58 +0800
Message-Id: <20260910145658.2003786-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910120029.1207437-1-kayracizmeci@gmail.com>
References: <20260910120029.1207437-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnu+87xaJqT7Y8Bw--.49711S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFy7AFWUuFWrWr47Xw4Dtwb_yoWrJF1rp3
	y8Ww1Sy3ykZFW8Z3Z7Gw48try5uws5ZF47urn5J3sYyrs8AF1kWr4Sgw45Z347CFZ5WFy8
	Ca1xtr13ua4DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl4iUUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvxzDzWqixTxQwQAA3N

On Thu, 10 Sep 2026 15:00:29 +0300 Kayra Cizmeci <kayracizmeci@gmail.com> wrote:

> > Testing has shown that in our system with 18 CPUs running at 2.1GHz, where
> > the first three sd_llc domains each contains 4 CPUs and the last sd_llc
> > contains 2 CPUs, under same fillback scenario, select_task_rq_fair_thin()
> > executes 25% faster than the original select_task_rq_fair(). It saves 22ms
> > over a 10-second period, with this optimization accounting for 0.174% of
> > total system time. Additionally, we measured the execution time of
> > update_idle_cpu_scan, which took 0.5ms over the same 10-second period. If
> > we use select_task_rq_fair_thin() instead, this time can be eliminated,
> > accounting for 0.04% of total system time. Therefore, the overall
> > optimization contributes to a reduction of 0.214% of total system time.
> 
> Okay. Can you specify which tests you ran or what you used? If you can?

I used a relatively crude and straightforward method, which involves
subtracting the time at the beginning and end of the select_task_rq_fair()
function and then accumulating the per-CPU time. I retrieve this accumulated
value a kernel module (ko). The detailed script is as follows:

Below is the test script for comparing the effect of select_task_rq_fair()
with and without the patch:

#!/bin/bash

insmod testselecttask. patch=0 on=1
sleep 10
insmod testselecttask.ko patch=0 on=0
cat testselecttask_patch_0.txt

sleep 1
insmod testselecttask.ko patch=1 on=1sleep 10
insmod testselecttask.ko patch=1 on=0
cat testselecttask_patch_1.txt

Test results:

root@hobot:/map/zhaoxin# ./smalltest.sh
ins: ERROR: could not insert module testselecttask.ko: Invalid parameters
insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
zhaoxin: enable[0] count[179226] timens[09325] avg[460]
insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
zhaoxin: enable[1 count[180836] timens[59444800] avg[328]

From the test results, combined with the following information:

Currently, the machine's overall sys time is about 7%, multiplied by 18
cores, which results approximately 126% for a multi-core CPU. The test
duration is 10 seconds, and within that time, 22 ms is saved, which
translates to 2.2 ms per second, equating to 0.0022 for multi, or 0.22%.
The time taken by this function is generally linked to the total sys time,
and the optimized portion accounts for about 0.174% of the total sys time.

Below are the test results for the execution time ofupdate_idle_cpu_scan`:

root@hobot:/map/zhaoxin# ./smalltest.sh
insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
insmod: ERROR: could not insert moduleselecttask.ko: Invalid parameters
zhaoxin: enable[0] count[179226] timens[82509325] avg[460]
insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
mod: ERROR: could not insert module testselecttask.ko: Invalid parameters
zhaoxin: enable[1] count[180836] timens[59444800] avg[328]

From the test results, combined with following information:

Currently, the machine's overall sys time is about 7%, multiplied by 18
cores, which results in approximately 126% for a multi-core CPU. The test
duration is 10 seconds, and within that time, 22 is saved, which translates
to 2.2 ms per second, equating to 0.0022 for multi-core, or 0.22%. The time
taken by this function is generally linked to the total sys time, and the
optimized accounts for about 0.174% of the total sys time.

--
Xin Zhao

