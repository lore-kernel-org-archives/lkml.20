Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DEA3D6475
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427570; cv=none; b=SivqtwRtn/e3c1GGukv0432JNfE23L4PcrXZ4no5RI6ndZPKchBRCzdz2H5IJVMew2unyAp5+fmPcOP8yRlGop+gRzrF3+0pDwmoIBCEYVq3hUKYvRio4tzwz3LSRIEqhuNsGHNKQw9+N4l6rnK+v8HztRT5d7od3ziVqJ7ozgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427570; c=relaxed/simple;
	bh=1rAM4yZLqfdTiClDIqQynZS5pGmOJECmNDdN9ROI69A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jsu5FAGFc3vLsLxjrXBi+PcP+Ul1cFCFs3CTzEm2XAqKBGlxjg4b9cStFXM+eNeRmr1pk1ZjWx7Ey9JCmVsEi7lo9bgplWjZ30I7Wu7ZGajOGwfDjN6Fxjc1Sa4y8xSZHB1tkrhQIdINctBJs7bge/RlPXcM7OSijs+ElqfGpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrMz255s; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrMz255s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789427569; x=1820963569;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1rAM4yZLqfdTiClDIqQynZS5pGmOJECmNDdN9ROI69A=;
  b=SrMz255s2NhyjW+h1HjD1ciFZDXQS09M4s0FLpH+cSbF7F+QcMJ6a9bZ
   HM6iCAcwoASWS/7L7lZWCyRCVpRtsYq6+QOGAYWfZpL9R7w8an/5hD7di
   KcvQET9vIw4rzZOZgbYI1bFGawy9StRyzxEMxM51MiePA3/nqdBha2m5Y
   apU/DObtJynD5Y99/Pe2UHtg9eQB6yagr0DcHuCtoP4e/9+Z41DNrRqyf
   ns4NOY5CCNKfkDdsQ7CzRZ2POfts62PEiftVsc+fDxh568CD1eUHedGCQ
   7AOJeBqqeHZBbTut/5Ba3CtOoksog0eaWZZyi1Xk2xnqQAi5dDHGtGf/K
   w==;
X-CSE-ConnectionGUID: fpBeZnHqSim81B09Oe7Mmw==
X-CSE-MsgGUID: qtRXiDjgQHWU68tyq6rZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101302444"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101302444"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:12:48 -0700
X-CSE-ConnectionGUID: opY4XyPxQuirdB2JPGTqSw==
X-CSE-MsgGUID: PRuEn3drTmOboUL62QqHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="982218"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:12:47 -0700
Message-ID: <eb77a9a6b27940f1ae9acc0b87f75f3b46f28a13.camel@linux.intel.com>
Subject: Re: [Patch v4 01/22] sched/cache: Introduce infrastructure for
 cache-aware load balancing
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, "Gautham R . Shenoy"
 <gautham.shenoy@amd.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall	 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider	 <vschneid@redhat.com>, Madadi Vineeth Reddy
 <vineethr@linux.ibm.com>, Hillf Danton <hdanton@sina.com>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, Jianyong Wu	 <jianyong.wu@outlook.com>, Yangyu
 Chen <cyy@cyyself.name>, Tingyin Duan	 <tingyin.duan@gmail.com>, Vern Hao
 <vernhao@tencent.com>, Vern Hao	 <haoxing990@gmail.com>, Len Brown
 <len.brown@intel.com>, Aubrey Li	 <aubrey.li@intel.com>, Zhao Liu
 <zhao1.liu@intel.com>, Chen Yu	 <yu.chen.surf@gmail.com>, Chen Yu
 <yu.c.chen@intel.com>, Adam Li	 <adamli@os.amperecomputing.com>, Aaron Lu
 <ziqianlu@bytedance.com>, Tim Chen	 <tim.c.chen@intel.com>, Josh Don
 <joshdon@google.com>, Gavin Guo	 <gavinguo@igalia.com>, Qais Yousef
 <qyousef@layalina.io>, Libo Chen	 <libchen@purestorage.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 16:12:46 -0700
In-Reply-To: <343a7e07-7fad-4979-9c9b-82ec038c293c@linux.dev>
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
	 <6269a53221b9439b9ca00d18a9d1946fb64d8cff.1775065312.git.tim.c.chen@linux.intel.com>
	 <343a7e07-7fad-4979-9c9b-82ec038c293c@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-15 at 01:50 +0800, Zenghui Yu wrote:
>=20

[snip]

> I sporadically hit the SLUB "Poison overwritten" reports on the mm_struct
> cache while running mm-new:
>=20
>  [Poison overwritten] 0xffff8001076ec8e8-0xffff8001076ec8eb @offset=3D514=
32. First byte 0xff instead of 0x6b
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  BUG mm_struct (Tainted: G                 N ): Object corrupt
>  ------------------------------------------------------------------------=
-----
>=20
>  Allocated in copy_process+0x1e48/0x2078 age=3D2 cpu=3D7 pid=3D11866
>   copy_process+0x1e48/0x2078
>   kernel_clone+0xa4/0x498
>   __do_sys_clone+0x5c/0x88
>   __arm64_sys_clone+0x1c/0x28
>   invoke_syscall+0x54/0x110
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x54/0x424
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x1b0/0x1b4
>  Freed in __mmdrop+0x108/0x180 age=3D2 cpu=3D3 pid=3D11955
>   kmem_cache_free+0x290/0x53c
>   __mmdrop+0x108/0x180
>   __mmput+0x150/0x154
>   mmput+0x50/0x5c
>   exec_mm_put_old+0x74/0x84
>   setup_new_exec+0x7c/0x90
>   load_elf_binary+0x4b0/0x1914
>   bprm_execve+0x300/0x83c
>   do_execveat_common+0x168/0x1cc
>   __arm64_sys_execve+0x44/0x68
>   invoke_syscall+0x54/0x110
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x54/0x424
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x1b0/0x1b4
>  Slab 0xffffffbfc1076e00 objects=3D23 used=3D18 fp=3D0xffff8001076e2140 f=
lags=3D0x13fffe0000000240(workingset|head|node=3D1|zone=3D0|lastcpupid=3D0x=
1ffff)
>  Object 0xffff8001076ec640 @offset=3D50752 fp=3D0xffff8001076e2140
>=20
>  [...]
>=20
> The corruption is always exactly 4 bytes (0xffffffff) with everything
> around still being intact poison.  The in-object offset (51432 - 50752 =
=3D
> 680) resolves to &mm->sc_stat.cpu, and 0xffffffff is just -1.  My AI mode=
l
> points me to this write in account_mm_sched():
>=20
> 	if (READ_ONCE(mm->sc_stat.cpu) !=3D -1)
> 		WRITE_ONCE(mm->sc_stat.cpu, -1);
>=20
> and helps with analyzing and fixing the issue like below :-) .  Please ha=
ve
> a look.
>=20
> Thanks,
> Zenghui
>=20
> ---8<---
>=20
> From 992b515f18710e77308cf5f88943cc3ce918a525 Mon Sep 17 00:00:00 2001
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> Date: Mon, 14 Sep 2026 22:00:18 +0800
> Subject: [PATCH] sched/cache: Fix use-after-free of mm in account_mm_sche=
d()

I think you have hit a similar use after free issue that was discussed in t=
his
thread.
https://lore.kernel.org/lkml/apPb-Dr4nPYuHQOK@v4bel/

Can you try the last two patches in this 4 patch series
that address this issue in a comprehensive way
https://lore.kernel.org/lkml/cover.1789061845.git.tim.c.chen@linux.intel.co=
m/

Thanks.

Tim

>=20
> account_mm_sched() accounts runtime against rq->curr and dereferences its
> ->mm: it updates the percpu chunk mm->sc_stat.pcpu_sched and may write
> mm->sc_stat.cpu =3D -1.
>=20
> update_se(), which samples rq->curr and calls account_mm_sched(), is not
> only called from local contexts (tick, context switch) but also through
> update_curr() from enqueue/dequeue paths, which frequently run on a remot=
e
> CPU while holding this rq's lock (cross-CPU try_to_wake_up(), load
> balancing).
>=20
> In those remote contexts rq->curr is a task concurrently running on its
> home CPU.  The rq lock guarantees that rq->curr's identity does not chang=
e,
> but it says nothing about the lifetime of rq->curr->mm: that task does no=
t
> need the rq lock to execute execve or exit, and switches and drops its ->=
mm
> under task_lock() and mmput(), neither of which orders against the remote
> CPU.  A remote CPU can therefore sample a valid mm pointer right before i=
t
> is freed and write to it afterwards, corrupting the freed mm_struct (and
> the pcpu_sched percpu chunk, which mm_destroy_sched() frees even earlier)=
.
>=20
> Observed with CONFIG_SLUB_DEBUG=3Dy as a sporadic "Poison overwritten" re=
port
> on the mm_struct cache, with the overwritten bytes resolving to
> &mm->sc_stat.cpu.
>=20
> Only account the physically running task (p =3D=3D current), whose ->mm c=
annot
> go away while it is the one executing this code.  Local tick, context
> switch and sched_ttwu_pending() paths are unaffected; updates skipped in
> remote contexts only cause minor under-accounting of the sc_stat runtime
> heuristics.
>=20
> Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-awa=
re load balancing")
> Assisted-by: GLM-5.3 OpenCode
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  kernel/sched/fair.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ade1eceb39b8..2bbf59370d23 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1731,6 +1731,9 @@ void account_mm_sched(struct rq *rq, struct task_st=
ruct *p, s64 delta_exec)
>  	int mm_sched_llc =3D -1;
>  	unsigned long epoch;
> =20
> +	if (p !=3D current)
> +		return;
> +
>  	if (!sched_cache_enabled())
>  		return;
> =20
