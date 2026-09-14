Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F3480DEB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405531; cv=none; b=r+Jiy+yk1xqX2ixqUpLLptNHQV3g+JBE35rb+rIDVLZeQAKl3OdGUh9Iy7DMh5eICUWnjFPWO8YV6u4n3sSeIRhrpbafuO9Qv73iRUhykfBG2blkVjhBSFeIgDumbYBKwbQHzP45Yw8iahr4dId1LD2IOfnuSLIslt31G4zafeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405531; c=relaxed/simple;
	bh=jpmgZnur0kKgHy97IWplCoKDjj+PJquH9XtoV405wpc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date; b=nyqNfbxoEyOBpxftwYK0BecjYx4c7vBxFSTwHrNJmpT6Yzx3y0rLfcsRzP0W4F8G5cyqHn/5O8/c1O1HcpqD8Q/QHYF9IlPJFWBp7RR5z1nzVdPpPDpbc47D7lK4Gai5GkuJet1lXTE223ZanBr4ti7X0lcmL5dYg6yynB64FYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UPD4vVQO; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UPD4vVQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:From:To:Subject:Date; bh=jpmgZnur0kKgHy9
	7IWplCoKDjj+PJquH9XtoV405wpc=; b=UPD4vVQOgdeS1EfF5a5DjDrui6zG7q3
	DVGVr3NwrZfZlh09jSFyPtdB3XADz/uYCLo1L2GO+sAp2x/Cnj9G0pRQ81U3r+X6
	cxGmiN1qD6Lh8CZaPTlPkdtq8cUr93efYjkl0YxdlQLX0vDcxo6/gjOzBMOrQKV9
	FkKxJsuOqllQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAn_6AWKahq0RPOAg--.15017S2;
	Tue, 15 Sep 2026 01:04:22 +0800 (CST)
Message-ID: <f2f8ba0f978a894a949bf7b993594d4e.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: "zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] sched/proxy_exec: Detect cycles in proxy walks
In-Reply-To: <20260722120346.93000-1-soolaugust@gmail.com>
References: <51450a8f-f053-45b3-a2fc-2bd0b75181b6@amd.com>
	<20260722120346.93000-1-soolaugust@gmail.com>
Date: Tue, 15 Sep 2026 02:10:00 +0900
X-CM-TRANSID:_____wAn_6AWKahq0RPOAg--.15017S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4rur4rWrWxWw1fKrWktFb_yoW8CFWrpa
	9xGFW2yw4DJa4IvanrWr4UJa4Uuws5G3yUAryrtw10gws8tF1IkFZayw4Yga48Crs5XFyU
	Zws09FyrZF4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeyIUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRgVdGqoKRiNRgAA3A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Use the rq pick sequence as a per-walk marker. Mark each task visited by
> the current walk. If the walk sees the same marker again, break the cycle
> by clearing blocked_on at the detection point and deactivating that task.
>
> The marker is only consumed while holding rq->lock. Clear it when a task is
> activated, so stale state from an earlier pick or another rq is not carried
> into the next queued lifetime.

I have been experimenting with a different trade-off for the same cycle
detection problem. I sent it as a separate RFC so it can be reviewed
independently from the sequence-marker approach:

https://lore.kernel.org/lkml/20260914165455.2126134-1-sh_def@163.com/

The Online Brent version keeps the cycle-detection state local to the real
owner walk. It does not add state to task_struct or struct rq, and it does
not require activation-time marker reset. The cycle detector reuses the
owner resolution performed by the real walk instead of adding a separate
preflight traversal.

The trade-off is that Brent may detect a cycle only after the walk has
temporarily closed the blocked_donor cycle. In the tested natural recovery
path, the selected cycle member reached mutex_unlock() with blocked_donor
already cleared. A validation-only forced-stale test also confirmed that
the existing blocked_on revalidation rejects a stale handoff. I do not
claim that these tests cover every possible scheduling interleaving.

The RFC includes a comparison against this v5 implementation on the same
base, configuration, KVM setup, and staged testcase. The normal acyclic
find_proxy_task() timings were comparable in the tested depths; the main
design question is whether avoiding persistent task/rq visitation state and
its activation lifecycle is worth accepting the transient backlink window.

Thanks for the v5 implementation and the detailed discussion.

