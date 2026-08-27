Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49A53DA7D2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818634; cv=none; b=nD3rat+KefIUaHtl11hV0RAgwPhiO0xnwoRMqoY3UzrrFvDNltOfKf8H+AvtmPpeGdPcgJ/4y0XWSSNLIpq/iD0dp6m42RjnfWEcldHmHTjK14CC5WMqGGqtsR2HcN+U/I2gHU2rr5Axo82HyIAzgMQJ/7NkPflfIcZ6uhtXQt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818634; c=relaxed/simple;
	bh=3v1/IdLNCsT/qBsISOCiyBli6VQz9iDJt7iwfW00B1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8VQzARaX5Nvi8LSkdI/nAho9W+lotSos/TAD8RHqWbgQFLkUrz7uTKXtXTP4IdBi3DGq4p/0tZNxhcCbz/xtlcwPPW/drzk+obktcW+dwCJ6LLhDWMIjCaoBMnwK4lR6f5SKk0PMZ0+Zbr1P7kfe41RLb+rSP1QDuxvW3Ga/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb3+VZf0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb3+VZf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0E1F000E9;
	Thu, 27 Aug 2026 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818632;
	bh=IoV2JLyDthha8SRAUynv+MIxi6zER3ywHmEQ0B1FVZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Kb3+VZf0uc9hFIhgW8al0piOdE/JqGk3Kq7nxZ23oY2lo8kbzImiw7RY3gKQyIGf3
	 egGYVWXHOgMkrPimJ7z4RryeJxr4bUze9but/U8U/wUqhRY+4unAJQvzCq76Kj6ccI
	 uTmYJ8ZuSp6Epwm425ch7SAH0A6cGcNQQOsRNVz3lYc9YZs2A9AFohonNK07ozVTSU
	 W7VHt53CL/qm2315HgfsuzMC8jtrtR/WjkPBguh8Wk3GrcqRN3ww0VbKniXISd5wRE
	 ENaQF9nrIOUZ+QO2fI2NsvHb4YveXmDwiTs0i9lbnAm0NSXByY8bwviHpGiztS6Y1Z
	 SAG803NYX3JDA==
Message-ID: <62ba2ed2-d030-49d8-8872-d714ca0df8f2@kernel.org>
Date: Thu, 27 Aug 2026 10:17:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: annotate data race for per-cpu pageset fields
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
References: <20260827070546.1336383-1-hui.zhu@linux.dev>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260827070546.1336383-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 9:05 AM, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> zoneinfo_show_print() reads pcp->count, pcp->high, pcp->batch,
> pcp->high_min, pcp->high_max and the per-cpu stat_threshold while
> holding only zone->lock, which does not synchronize these fields.
> The writers are the page allocation and free fast paths under
> pcp->lock, decay_pcp_high() which updates pcp->high without any
> lock, pageset_update() which writes batch/high_min/high_max with
> WRITE_ONCE(), and refresh_zone_stat_thresholds() which writes
> stat_threshold locklessly.
> 
> The race is benign: the values are only printed to /proc/zoneinfo,
> they are naturally aligned integers, and pageset_update() already
> documents that users of batch/high_min/high_max must cope with the
> fields changing asynchronously.  Annotate the reads with data_race(),
> following commit af1c31acc853 ("mm/vmstat: annotate data race for
> zone->free_area[order].nr_free").
> 
> Found by KCSAN testing on an older kernel; the same race still
> exists on mainline.  No functional change intended.
> 
> BUG: KCSAN: data-race in zoneinfo_show_print+0x355/0x520 root/klinux/mm/vmstat.c:1774
> race at unknown origin, with read to 0xffff8e1835410808 of 4 bytes by task 22653 on cpu 12:
> zoneinfo_show_print+0x355/0x520 root/klinux/mm/vmstat.c:1774
> walk_zones_in_node root/klinux/mm/vmstat.c:1496 [inline]
> zoneinfo_show+0x41/0x70 root/klinux/mm/vmstat.c:1806
> seq_read_iter+0x30c/0x970 root/klinux/fs/seq_file.c:230
> proc_reg_read_iter+0x10c/0x170 root/klinux/fs/proc/inode.c:305
> copy_splice_read+0x2a1/0x4e0 root/klinux/fs/splice.c:365
> do_splice_read root/klinux/fs/splice.c:985 [inline]
> do_splice_read+0x139/0x1a0 root/klinux/fs/splice.c:959
> splice_direct_to_actor+0x16b/0x540 root/klinux/fs/splice.c:1089
> do_splice_direct_actor root/klinux/fs/splice.c:1207 [inline]
> do_splice_direct+0x10a/0x180 root/klinux/fs/splice.c:1233
> do_sendfile+0x6ea/0x7e0 root/klinux/fs/read_write.c:1363
> __do_sys_sendfile64 root/klinux/fs/read_write.c:1424 [inline]
> __se_sys_sendfile64 root/klinux/fs/read_write.c:1410 [inline]
> __x64_sys_sendfile64+0x117/0x130 root/klinux/fs/read_write.c:1410
> x64_sys_call+0x1cc7/0x1ee0 root/klinux/./arch/x86/include/generated/asm/syscalls_64.h:41
> do_syscall_x64 root/klinux/arch/x86/entry/common.c:46 [inline]
> do_syscall_64+0x75/0x2c0 root/klinux/arch/x86/entry/common.c:76
> entry_SYSCALL_64_after_hwframe+0x76/0xe0
> value changed: 0x000001b2 -> 0x000001b1
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 12 PID: 22653 Comm: syz-executor.12 Not tainted 6.6.140+ #672
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  mm/vmstat.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index cb57714539fb..a3e809c57f29 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1837,6 +1837,11 @@ static void zoneinfo_show_print(struct seq_file *m, pg_data_t *pgdat,
>  		struct per_cpu_zonestat __maybe_unused *pzstats;
>  
>  		pcp = per_cpu_ptr(zone->per_cpu_pageset, i);
> +		/*
> +		 * Access to the per-cpu pageset fields is lockless as they
> +		 * are used only for printing purposes. Use data_race to
> +		 * avoid KCSAN warning.
> +		 */
>  		seq_printf(m,
>  			   "\n    cpu: %i"
>  			   "\n              count:    %i"
> @@ -1845,15 +1850,15 @@ static void zoneinfo_show_print(struct seq_file *m, pg_data_t *pgdat,
>  			   "\n              high_min: %i"
>  			   "\n              high_max: %i",
>  			   i,
> -			   pcp->count,
> -			   pcp->high,
> -			   pcp->batch,
> -			   pcp->high_min,
> -			   pcp->high_max);
> +			   data_race(pcp->count),
> +			   data_race(pcp->high),
> +			   data_race(pcp->batch),
> +			   data_race(pcp->high_min),
> +			   data_race(pcp->high_max));
>  #ifdef CONFIG_SMP
>  		pzstats = per_cpu_ptr(zone->per_cpu_zonestats, i);
>  		seq_printf(m, "\n  vm stats threshold: %d",
> -				pzstats->stat_threshold);
> +				data_race(pzstats->stat_threshold));
>  #endif
>  	}
>  	seq_printf(m,

