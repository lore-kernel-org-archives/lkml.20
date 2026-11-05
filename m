Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877367;
	b=n5m752HoWk6Iprsa3wiV+zI2uTQN4U0Sdb5QCCGokUf+uFgel+ohhaTLomCv1cVtTxg8
	 EoDwuJz/sT8ft/m3nlSAp8Vp3WnAwUNvNvdbCN1BuhaA4ShWZEGtoCRjOcZUIsSEllBOJ
	 DN8cWcgJPqRMuCY9ag4JSUo4adbTm3hzY1a/0Fo86rsYi8mUobrKQBObb93lf1kDI95g2
	 vS7bxxETUrOHDv0wHG10B1qyYXs4RTS8O3K5wgBrpH0JV87tXCjnTaxKoI0bPLry1DRs/
	 M/bFH/6ZrJvo2ElpDbkOpRgo3JwzMETKe9jb6X115PGmMCBhVGoxcRCcPNAyLHXYOEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877367;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=BY1Dg6PGL8d5GpZbftmGKeUS0DHtggqdSG8YeMGHgD0=;
	b=YdxbSZvPBLEAJPV3OqGGsnjCcDo2seit0gyVdfyzIPbmb67t+e7D3LzV3LU49/wPdCo9
	 ujyoA6wfRbu9vy78pMoG8ZUaLEXGAzL722DJjSDf2MUX8cg3DCnRgHzz7N8047BVM0Cvn
	 dd6Ebfe/HpO5QgHKWZEdEo1rCenYWlYxCbTcNbeD6LOGIa1B8EtTTKbNqPaC8actGWCmF
	 0NqqYCEtgTBbBfQDVbq0CVmgICXOogAMsLgwO8WJjfpVRLhsHhoAL6hmmJ//M8WjiPDKi
	 knOZ4xtbKqtGSD+Yj9C5cvWo6x8g1pF/CsJB6n+9oV4BciyzMtNitG/nlr0QrM/tA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="t/x59jgJ";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB65606D80E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB65606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t/x59jgJ
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105111604euoutp023e9e6cacaa1a79c6681a1dc0ea7e86a7~lIfVYTZEP2208922089euoutp02T
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:16:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105111604euoutp023e9e6cacaa1a79c6681a1dc0ea7e86a7~lIfVYTZEP2208922089euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793877364;
	bh=BY1Dg6PGL8d5GpZbftmGKeUS0DHtggqdSG8YeMGHgD0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=t/x59jgJW7h7a6QOEwYXKNY/PYOyLI1NahDhOPjXqM9l8R9j3rov1+WIIOSfVFeHB
	 AIplQlrkPh3q/mAzTjWfh502STejKRXIRrcwNyThsXp2kzJrrPT1HscyAhooddgW3H
	 0yFDZIi44DMqcNQ+Y3Jmg5dNtBBPm8qohtzrwjfc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261105111603eucas1p2a053b96a64ea38c216f29e8a8aadee80~lIfVCJvhj0087300873eucas1p2v;
	Thu,  5 Nov 2026 11:16:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105111602eusmtip25f934707ecb1a30edcdc073421339480~lIfT6mRkz1654616546eusmtip2M;
	Thu,  5 Nov 2026 11:16:02 +0000 (GMT)
Message-ID: <49204e2c-0710-4c61-8d8f-95ec76f56014@samsung.com>
Date: Thu, 5 Nov 2026 12:16:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Luca Abeni
	<luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, Tejun Heo
	<tj@kernel.org>, Weiheng Qiu <weihengqiuu@gmail.com>, Ingo Molnar
	<mingo@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261105111603eucas1p2a053b96a64ea38c216f29e8a8aadee80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958
X-EPHeader: CA
X-CMS-RootMailID: 20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
	<20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
	<CGME20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958@eucas1p2.samsung.com>
	<eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>
	<auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>

On 05.11.2026 11:38, Juri Lelli wrote:
> On 05/11/26 11:20, Marek Szyprowski wrote:
>> On 03.11.2026 12:26, Juri Lelli wrote:
>>> dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
>>> to determine a task's current root domain. For a sleeping task, this
>>> is stale: it points to the rq of the CPU the task last ran on, which
>>> may belong to a different root domain after a cpuset move.
>>>
>>> This causes incorrect bandwidth accounting when a sleeping DL task is
>>> moved between exclusive cpuset partitions and back:
>>>
>>>   1. Move root->partition: task_rq(p)->rd = root, destination in
>>>      partition -> different -> bandwidth transferred correctly.
>>>   2. Move partition->root: task_rq(p)->rd is still root (task never
>>>      ran) -> looks like same domain -> no transfer. Partition keeps
>>>      stale bandwidth, root domain is short.
>>>
>>> The root domain then over-admits, and when the task exits total_bw
>>> underflows.
>>>
>>> Introduce dl_task_root_domain_cpu() helper that uses the task's
>>> cpus_mask (which still reflects the old/source cpuset at call time)
>>> to find the root domain where the bandwidth is actually accounted,
>>> instead of relying on the potentially stale task_rq(p)->rd.
>>>
>>> Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
>>> narrowed to a single CPU by migrate_disable().
>>>
>>> Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
>>> Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
>>> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
>> This patch landed recently in linux-next as commit b4a61fdc19c5
>> ("sched/deadline: Fix stale root domain in cpuset bandwidth transfer").
>> I found that it triggers kernel BUG during CPU hot-plug tests on some
>> of my tests boards. Reverting it on top of next-20261104 (together with
>> dependent 41a7968022ca3) fixes the issue.
> Others have found issues with the set and we have been working on fixes.
>
> Can you please check if the following addresses it
>
> https://lore.kernel.org/lkml/20261104211207.1392343-1-mathieu.desnoyers@efficios.com/

I've applied the whole patchset and ran my tests. Everything works fine now. Thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

