Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694113;
	b=RLV0BhTgifrisFNmuWpy4QDyGCn1by69AW7yr6lpWJ4Vj609aZGyJCg8rB6E6xRq/IbK
	 gis5ycKoFTwCN2JqwTiibmrcXC2UoPoXmxt8Tjexj5oZcbSHjKtabTgX/upfFu9IP7G5x
	 0zhbGy4oTxPkmdYEGcBw2KEfoZQ7vYcH0apaUk6+bWoLYgzy1B21iJlOpe3lpdn7FQKMF
	 8IGwFPlVODhxzlT4tgfsxe3nwUrbM/g3wT04zPeuLEmvJXqbhFhoshJ+uoMA38UuqkeCT
	 Ajr72cq403zBIZeL5YTaszisyTprxxHr7rge0a0xmMD5ZCYRWzGy8D4q8xnjgBtUIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694113;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WixHpB8N4M++eagrGtYe6t/Wu7Mqek2EVGnTx2XIQrU=;
	b=sQ2bUvlMXUQN9EWLvzoZEC0wvw1RORQUif+xgcWximzd14yOpvzC7KaH5R9f2l/QtGr0
	 QR4YYU1jwMrTxF+sZpnZNxfQ/b8RhbMgsjQsps+Ujep/ltUaGPl55dqWMlhdTSBY08V2p
	 i2HuRNeorLuujIvZHd8HUinFkLhgTw1EX9WTJvh3y91P/er79bhPz+O71sJGxBIswjcU+
	 /cQb0e7ISTbZoHKw1/O2gKsCgWMA1VksPib8nNIC0w78gOThPG4FDefQfi8G7SdDaEV+V
	 erpltpCuDbR/qGvFzJkU4HIyMElcqC5cl2XMua7jasQpcwh4AhK1cNjYKYdbiidvPgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="j/gYoG/F";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E46606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j/gYoG/F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536201595;
	Tue,  3 Nov 2026 00:21:47 -0800 (PST)
Received: from [10.57.66.208] (unknown [10.57.66.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A46D3F628;
	Tue,  3 Nov 2026 00:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793694110; bh=gCf635Z0t+q9uenx/i536l/3FLqnNeuLKcM86iQ5qzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j/gYoG/FtE4TTRjotanpcFBp2bzYU6509gZ5lRNBX06r3efUVt6QoF1M15Yu1bu4v
	 WrPwLfGgDCenVXItO2rJ5kfhAr4eGdu+AnbMLVmVlPV6uvIwyGl5engvULJCPx4qCU
	 YCrz2Q7n13cf8qVN64VlvjsbtENu/zpKFsbEJHFk=
Message-ID: <6faca00c-dfd5-46a3-9766-9f573ad71d75@arm.com>
Date: Tue, 3 Nov 2026 08:21:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sched/delayacct: blkio_start recorded on the wrong task
 when a delayed task is blocked from pick
To: kiln <806144828@qq.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Balbir Singh <bsingharora@gmail.com>,
 Yang Yang <yang.yang29@zte.com.cn>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 06:01, kiln wrote:
> Hi,
> 
> I think there's a delay accounting bug that came in with DELAY_DEQUEUE.
> __block_task() calls delayacct_blkio_start(), and that helper always
> writes current->delays->blkio_start. That's fine when __block_task() runs
> from __schedule() for prev, but when the task was delayed and gets
> blocked later from pick_next_task_fair() -> pick_next_entity() ->
> dequeue_entities() -> __block_task(), current is whoever is scheduling on
> that CPU, not p. So p's blkio_start is never set (or is left over from
> an older sleep), and when the I/O completes ttwu() calls
> delayacct_blkio_end(p), which adds local_clock() - blkio_start to p's
> blkio_delay. For a fresh thread blkio_start is 0, so the thread gets
> charged the whole time since boot in one go.
> 
> How I ran into it: per-thread blkio delay (taskstats, and field 42 of
> /proc/<pid>/task/<tid>/stat) on some hosts showed threads that were a
> couple of seconds old with ~7,070,000 s of block I/O delay, which was
> exactly the host uptime. Always freshly created threads of a headless
> Chrome (ThreadPoolForeg, Chrome_IOThread, Compositor and so on); Chrome
> creates lots of short-lived threads that soon wait on ext4 journal I/O.
> 
> Kernel: a distro 6.6.102 kernel that carries the EEVDF / DELAY_DEQUEUE
> backport (Alibaba Cloud Linux 4, 6.6.102-7.alnx4). I have not reproduced
> it on mainline yet, but as far as I can tell the code there is the same:
> __block_task() in kernel/sched/sched.h still calls delayacct_blkio_start()
> with no task argument, in v6.12 and current master.
> 
> What I measured with bpftrace while starting Chrome a few times
> (roughly 70 s per run):
> 
> kprobe:dequeue_entities    { @in_de[tid] = 1; }
> kretprobe:dequeue_entities { delete(@in_de[tid]); }
> kprobe:__delayacct_blkio_start {
>   @start[@in_de[tid] ? "from dequeue_entities" : "from __schedule",
>          curtask->in_iowait] = count();
> }
> kprobe:__delayacct_blkio_end {
>   $p = (struct task_struct *)arg0;
>   if ($p->delays->blkio_start == 0) { @zero[$p->comm] = count(); }
> }
> 
> With DELAY_DEQUEUE on (two runs):
>   from __schedule, current in_iowait=1:        11081 / 8691
>   from __schedule, current in_iowait=0:            0 / 0
>   from dequeue_entities, current in_iowait=1:     50 / 61
>   from dequeue_entities, current in_iowait=0:     52 / 103
>   blkio_end with blkio_start == 0:                 3 / 10 (all Chrome threads)
> 
> With NO_DELAY_DEQUEUE (two runs, same workload):
>   from dequeue_entities:                         0 / 2
>   blkio_end with blkio_start == 0:               0 / 0
>   starts vs ends: 12057 vs 12056, 9612 vs 9610
> 
> So on the dequeue_entities path about half of the starts land on a task
> that isn't even in iowait. A kernel stack for one of the zero-start ends:
> 
>   __delayacct_blkio_end+1
>   try_to_wake_up+1509
>   wake_bit_function+57
>   __wake_up_common+118
>   __wake_up_common_lock+129
>   wake_up_bit+127
>   journal_end_buffer_io_sync+48
>   end_bio_bh_io_sync+38
> 
> This looks like the mirror image of c96f5471ce7d ("delayacct: Account
> blkio completion on the correct task"), which fixed the end side the same
> way. The obvious fix would be to pass p down, something like
> delayacct_blkio_start(p) setting p->delays->blkio_start (checking
> p->delays rather than current->delays). Happy to send a patch if that
> direction is okay.
> 
> Thanks
> kiln
> 

This should be fixed by
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/urgent&id=5d010dd27be92a68eaac3af4f5ef0555bcde6031
(please give it a try!). It being in queue/sched/urgent should mean it
comes in with -rc2?
Peter any reason this isn't in tip yet?
