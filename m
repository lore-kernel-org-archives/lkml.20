Received: from out199-5.us.a.mail.aliyun.com (out199-5.us.a.mail.aliyun.com [47.90.199.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F937207D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429416; cv=none; b=PU4QtFL4G+zwe7RloQLdSGHRRb5S/LNuj1DrjQTbhky9gafng2l+Ih0QOzMz1BVdP+eOK7mtDrWigqiMZn0tTkNuxWNo3C7cGOSF/hn4COxocvyxdyHGDYd1VxNqNjWuA6m+kaDOrsj+95RbDO34pB/zy3OF5/hRd97qLSYoEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429416; c=relaxed/simple;
	bh=h7vW9TwyRDKmnR9AbRyZseO1LqWqOkZtsVtX1td4ryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktfCP4GeB2M+0HG/Wi3knYM2N4J0ODCwYJ5d4nR4PvRVNvmAeNqFB8FQaefEmTRCgbS6fpyHRNeA9vHyhlESuZIVzGipzBcrmX0fI+cOVCMBkeaSqiv+P17KLmX1MSMAhQL5FmJeUbZBS2+2l3p5Xv1iw+zgq7uNEKipOTcV4ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lJdtan7X; arc=none smtp.client-ip=47.90.199.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lJdtan7X"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791429399; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gYC58sdTkm8+Fm/Mk5bZ1bqmLj44HUBXCl/MsXafSqk=;
	b=lJdtan7XmHluQ+X9XUxobhhyzSdYhlvrnkkODs43A2Of3w2E95HGNsdeASz9/MDjFzAEEEAH1UFkyMROieLFPO8F5ws9G81r9JB7Guw4rL4R+O3gARq8wA9DLCU46crwE902lqKpupWlINPHK9Du6zdv6ieivOGgYYJbjkK8A38=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XCJIB-._1791429397;
Received: from 30.74.144.149(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCJIB-._1791429397 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 11:16:38 +0800
Message-ID: <b1aaff8f-c4b1-4c2c-939e-7051e7f9b6b8@linux.alibaba.com>
Date: Thu, 8 Oct 2026 11:16:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Make swapoff interruptible when unusing mms/shmem
To: Chris Down <chris@chrisdown.name>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Ying Huang <huang.ying.caritas@gmail.com>,
 Kelley Nielsen <kelleynnn@gmail.com>,
 Vineeth Pillai <vineeth@bitbyteword.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <ar2YlFYjYUZ49ZA5@chrisdown.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ar2YlFYjYUZ49ZA5@chrisdown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/1/26 7:17 AM, Chris Down wrote:
> try_to_unuse() only checks for a pending signal between mms, and
> shmem_unuse() doesn't check at all. That means that once swapoff gets to
> a process or a shmem file with a lot swapped out, nothing can interrupt
> it until every last page of it has been read back in.
> 
> Just as one example of where this can concretely show up, freezing tasks
> for suspend or hibernation has to wait for swapoff to notice the
> freezer's fake signal, and gives up after freeze_timeout_msecs (20
> seconds by default).
> 
> Here's a facetious example where one swaps out 2GiB of one process to a
> swap file on ext4, starts swapoff, and half a second later tries to
> freeze with pm_test=freezer. Writing to /sys/power/state then fails with
> EBUSY and this in dmesg:
> 
>      Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
>      task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:2955   task_flags:0x400100 flags:0x00000419
>      Call trace:
>       [...]
>       io_schedule+0x44/0x70
>       folio_wait_bit_common+0x1ec/0x3d0
>       __folio_lock+0x24/0x40
>       unuse_pte_range+0x2d0/0x348
>       unuse_vma+0x158/0x248
>       unuse_mm+0xfc/0x150
>       try_to_unuse+0x104/0x3f8
>       __do_sys_swapoff+0x220/0x5d8
>       [...]
> 
> The same goes for anything else that wants swapoff to stop, like an
> admin hitting ^C in a panic, of course.
> 
> Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> try_to_unuse() was driven by find_next_to_unuse() which checks for a
> signal before every entry, so let's restore that behaviour.
> 
> Just as an example of the improvements, here's how long freezing takes
> in the same test while swapoff is happening on my computer:
> 
>                        before                  after
>      400MiB anon       8.925s                  0.028s
>      400MiB shmem      1.639s                  0.003s
>      2GiB anon         failed after 20.003s    0.011s
> 
> Fixes: b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---

Make sense to me. But ...

>   mm/shmem.c    | 4 ++++
>   mm/swapfile.c | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index ae08cff4500c..72c8a61db76f 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1742,6 +1742,10 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
>   		if (ret < 0)
>   			break;
>   
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
>   		start = indices[folio_batch_count(&fbatch) - 1];
>   	} while (true);
>   
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 254ce86fa923..c3288910b3e3 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2689,6 +2689,8 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
>   	pmd = pmd_offset(pud, addr);
>   	do {
>   		cond_resched();
> +		if (signal_pending(current))
> +			return -EINTR;

Should we return -ERESTARTSYS instead based on the similar issue 
discussed in the following patch?

https://lore.kernel.org/all/20260720044103.905191-1-richardycc@google.com/

>   		next = pmd_addr_end(addr, end);
>   		ret = unuse_pte_range(vma, pmd, addr, next, type);
>   		if (ret)
> 
> base-commit: 2ddb90ee544ae97215afc4698dc223293997cc43

