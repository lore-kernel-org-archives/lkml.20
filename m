Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500C49250D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715667; cv=none; b=Sh1l3T336/ComfhzlaQgn4cmS5aJvQDro5P7tjutFez3sIL3yuIyffLEdAEjmG00ydqRvshLqzwI2zj3wAwIMO50PZEsYyUPck8vhvLTa1HJv1u0CoDQRSPpp0RgaC1skLKUOXWY3JnAEl4/+8iJwcsHq4+h6dWm9ni0R4PX9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715667; c=relaxed/simple;
	bh=SRwgVeSzfr2d1kmO/jE7+Zdnv9+Grbau07c6Hpo9Avo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBH70OP+6XM1zpiLSXJAJ/7Ma8swv8Hm8bhqoqi/3mFBQz6vIt/e64VYHoz1MVNei9aMoTMkyUniXzF3sSf+1gFK8T71NJ1Oc7L/tJ71fO8Dg/m3L+XAD0k52yFPtP0L+/y36KmjO2FNkOVkJsv5vXOoVaj1Tjl0wFwIWeyiT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VjbOapjp; arc=none smtp.client-ip=91.218.175.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VjbOapjp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SRwgVeSzfr2d1kmO/jE7+Zdnv9+Grbau07c6Hpo9Avo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789715660; v=1; x=1790320460;
 b=VjbOapjpDsDIf0/WndOz4/EXLB9tseIi13noDTFHeQqBWcxOodeT4iDjK1WTBzvjXSxusdGg
 m2VTDSzXwoQlwf3Uq5nQsiRGJz/JpEEBKsQDb//pGG+gJ3TMrPO4rZId75mQtYILTGXlmBCrB0S
 VhW0yvhv02AcgtsIgclvpC8o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59af9ff2e80a45a4;
	Fri, 18 Sep 2026 07:14:19 +0000
X-Mizu-Trace-ID: 59af9ff2e80a45a4
X-Migadu-Flow: FLOW_OUT
Message-ID: <c17acc22-8e59-4980-8c30-ec53d6a7e35b@linux.dev>
Date: Fri, 18 Sep 2026 15:14:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 01/22] sched/cache: Introduce infrastructure for
 cache-aware load balancing
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>,
 Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>,
 Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>,
 Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chen Yu <yu.chen.surf@gmail.com>, Chen Yu <yu.c.chen@intel.com>,
 Adam Li <adamli@os.amperecomputing.com>, Aaron Lu <ziqianlu@bytedance.com>,
 Tim Chen <tim.c.chen@intel.com>, Josh Don <joshdon@google.com>,
 Gavin Guo <gavinguo@igalia.com>, Qais Yousef <qyousef@layalina.io>,
 Libo Chen <libchen@purestorage.com>, linux-kernel@vger.kernel.org
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <6269a53221b9439b9ca00d18a9d1946fb64d8cff.1775065312.git.tim.c.chen@linux.intel.com>
 <343a7e07-7fad-4979-9c9b-82ec038c293c@linux.dev>
 <eb77a9a6b27940f1ae9acc0b87f75f3b46f28a13.camel@linux.intel.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <eb77a9a6b27940f1ae9acc0b87f75f3b46f28a13.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 7:12 AM, Tim Chen wrote:
> On Tue, 2026-09-15 at 01:50 +0800, Zenghui Yu wrote:
> >
> 
> [snip]
> 
> > I sporadically hit the SLUB "Poison overwritten" reports on the mm_struct
> > cache while running mm-new:
> >
> >  [Poison overwritten] 0xffff8001076ec8e8-0xffff8001076ec8eb @offset=51432. First byte 0xff instead of 0x6b
> >  =============================================================================
> >  BUG mm_struct (Tainted: G                 N ): Object corrupt
> >  -----------------------------------------------------------------------------
> >
> >  Allocated in copy_process+0x1e48/0x2078 age=2 cpu=7 pid=11866
> >   copy_process+0x1e48/0x2078
> >   kernel_clone+0xa4/0x498
> >   __do_sys_clone+0x5c/0x88
> >   __arm64_sys_clone+0x1c/0x28
> >   invoke_syscall+0x54/0x110
> >   el0_svc_common.constprop.0+0x40/0xe0
> >   do_el0_svc+0x1c/0x28
> >   el0_svc+0x54/0x424
> >   el0t_64_sync_handler+0xa0/0xe4
> >   el0t_64_sync+0x1b0/0x1b4
> >  Freed in __mmdrop+0x108/0x180 age=2 cpu=3 pid=11955
> >   kmem_cache_free+0x290/0x53c
> >   __mmdrop+0x108/0x180
> >   __mmput+0x150/0x154
> >   mmput+0x50/0x5c
> >   exec_mm_put_old+0x74/0x84
> >   setup_new_exec+0x7c/0x90
> >   load_elf_binary+0x4b0/0x1914
> >   bprm_execve+0x300/0x83c
> >   do_execveat_common+0x168/0x1cc
> >   __arm64_sys_execve+0x44/0x68
> >   invoke_syscall+0x54/0x110
> >   el0_svc_common.constprop.0+0x40/0xe0
> >   do_el0_svc+0x1c/0x28
> >   el0_svc+0x54/0x424
> >   el0t_64_sync_handler+0xa0/0xe4
> >   el0t_64_sync+0x1b0/0x1b4
> >  Slab 0xffffffbfc1076e00 objects=23 used=18 fp=0xffff8001076e2140 flags=0x13fffe0000000240(workingset|head|node=1|zone=0|lastcpupid=0x1ffff)
> >  Object 0xffff8001076ec640 @offset=50752 fp=0xffff8001076e2140
> >
> >  [...]
> >
> > The corruption is always exactly 4 bytes (0xffffffff) with everything
> > around still being intact poison.  The in-object offset (51432 - 50752 =
> > 680) resolves to &mm->sc_stat.cpu, and 0xffffffff is just -1.  My AI model
> > points me to this write in account_mm_sched():
> >
> > 	if (READ_ONCE(mm->sc_stat.cpu) != -1)
> > 		WRITE_ONCE(mm->sc_stat.cpu, -1);
> >
> > and helps with analyzing and fixing the issue like below :-) .  Please have
> > a look.
> >
> > ---8<---
> >
> > From 992b515f18710e77308cf5f88943cc3ce918a525 Mon Sep 17 00:00:00 2001
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> > Date: Mon, 14 Sep 2026 22:00:18 +0800
> > Subject: [PATCH] sched/cache: Fix use-after-free of mm in account_mm_sched()
> 
> I think you have hit a similar use after free issue that was discussed in this
> thread.
> https://lore.kernel.org/lkml/apPb-Dr4nPYuHQOK@v4bel/

I agree.

> Can you try the last two patches in this 4 patch series
> that address this issue in a comprehensive way
> https://lore.kernel.org/lkml/cover.1789061845.git.tim.c.chen@linux.intel.com/

I'll have a try.  Thanks for the heads up!

Thanks,
Zenghui
