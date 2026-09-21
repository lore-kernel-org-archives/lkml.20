Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900533938C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976980; cv=none; b=eVFf6jrog4OfPwz7obyqA6BXNgSYVDkHAR+gxLUD0YpQF/mhJJRElekaJGOuQ4KGGdeHFJRIFLatjfU0SarNLrwpSdDgw8WNqlh23lxiQ58KxtbY49+xrwNdgS79rw9NtUL8xh/LTVGT/yQIq75aEAW7yg+GKTHFKLwRqx011U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976980; c=relaxed/simple;
	bh=4ZidIhTiy0lyqoizVqMDmFo2U6gX7wCYzRoG5JaKq2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh9qk8klPKTzDgYGHBtNo34p2b5LKP3GQmY9MOySuX+41f3DYolw5H3UFlR5Uj4bH6jzeqbfhUgZAaLcMMmLomG3FQSTyo323HuNhdU3qxARcrjXd1Hk3yah0iJ/yQgeQSF3/JED9XBtJApwZRKlQvGxk4OoIUOyuxwDso4mgTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YfEYoAa/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YfEYoAa/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so13653815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789976977; x=1790581777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1vigVIqG6XCaXAXwVAejbP6zF3lkMv0QAYSAYCRl1I=;
        b=YfEYoAa/zWW8r3w2+DsDkWCyNnv1ergzOmuH1Np41/1hxWoQeBWqBH6o462/+7PGRM
         XJaOMzOowxKXVqb31/pnBVTIM20+hUEKM4os1mpg00fPFYoHWH9PLpXY3hz2l6wIoqG7
         TM06tbUl2NV6SCmtlaGix1rze5sk6LIXdmhiMf7ORF0kK3HlojfCEAyBS4BqPjDCCJbl
         /sNjA5Shs8iJILh3IOveRxuqzmVV5s6cNduH949wBtupciZPSgemvljFuRsHQA50whtU
         PIEQGgBg5zoKvtG8trSbW58dXgM0P8fzotVSgDdwQRTMfP4yTRqRpD2s3oVHSkWh/wTf
         SRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976977; x=1790581777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1vigVIqG6XCaXAXwVAejbP6zF3lkMv0QAYSAYCRl1I=;
        b=La6jeFf0cKHRa/jnNJNSkR7s5kxh9UPM8PmKX5b94BzitdKSP6Bi9CSNV7MvOud3BJ
         jfpqI7Ua2UwtBkNtXlaiUr+u6SwvzLFtfe8CZnomaNSsxlqV6Sd1P1K795ke8OrBpqZf
         K5IcQe8AixAufObT9acGQ4xbexUUmn51Sz5W5qArcblXFQlSs09kG3ERiBWyM2xbmc1v
         MEnz8t4R+7sRD+Q6VDOWYlotYxcauIbELgf72XE93/4Rvfy8YxQSJYjUaxKbINpb+saC
         tGe1tNFHv7Dl0wlYXNUCzJZmLrQ+H9PuYt+RgA9QKujAlAl4LW6KqBgUKkVsBQq9wf7u
         aE6w==
X-Forwarded-Encrypted: i=1; AKwUvBxUmYjdJHvzsmrsp+5EjZEUSnQk66A+Sb9co9YtZRWsxJF2+En8wyqvco2bppHepp6KE2SwJKuVYzzLMDM=@vger.kernel.org
X-Gm-Message-State: AFuF++nA8L+putlnzDQuQQP7zbtxWXLxtGRO+QE08xYPCVnMuzNaco47
	7V8KDmalXX7BW4JxVkn99hEQW+NclXMxflhYOVOR7k71Z5P2Bmsd90XuLXCD/8fs+Tg=
X-Gm-Gg: AYBFou1ZgpQyOuPXw+BjXodiuxYOCifoiTeavvje6kArqtpAyMwWVI4agoxZhcmBqwW
	agpRi/ogDuvl/iYHXIbl+qNEU/M63x97tQ7OeITnZkwuDWs0PiFJLLDVMZugkuG9/VkP23m+RPv
	EZMWC3O2zxyO77oxTm9+wQ+pir2sUfVrhGWJsO+SsRt3GzcCl3myQQVwXYkO7V/0ksRn0qqJQOp
	HwdMCgmcYI938bBNnlPZ6MsNz4FtjhUH80etbKewc65pEYB2sgzEVAiF8JNx/7WjTCMD1teuLD+
	Tz8ZWtTa2q1EMQzwUS7W+oph7lFxK1+pdIY3rrDa69C9VSndiTtl3AHhlIMBpnnhyRZhmm7rlLv
	qdy7z7B+/vdXfHkmsb54gVvKu/3AjaZmMLx2ftzFyqu/5UYdG8V2ZRq3k/71H7xdzt6zCx/uqB2
	IdSPZy4xG+IFMeWRN6WVWEeIvqXuSahSO6TYyRKWyA5uS/Iq8eH/F+24qjkE3jYfNwimJYASBp1
	zmV21YoRQ==
X-Received: by 2002:a05:600c:3e07:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49fc58594d0mr133016185e9.32.1789976976661;
        Mon, 21 Sep 2026 00:49:36 -0700 (PDT)
Received: from localhost (109-81-82-61.rct.o2.cz. [109.81.82.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459d409sm19992757f8f.33.2026.09.21.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:49:36 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:49:19 +0200
From: Michal Hocko <mhocko@suse.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] mm/page_alloc: enforce upper bound on
 min_free_kbytes sysctl write
Message-ID: <arDhf-LH0ZAxsd5V@tiehlicka>
References: <3c1598eaff225a155cdec5e92d5c97fbfc6c00fd.1789724312.git.med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c1598eaff225a155cdec5e92d5c97fbfc6c00fd.1789724312.git.med08elkadiri@gmail.com>

On Fri 18-09-26 11:45:51, Mohammed EL Kadiri wrote:
> syzbot reports a kernel panic ("System is deadlocked on memory")
> after writing a large value (e.g. 3145728, 3GB) to
> /proc/sys/vm/min_free_kbytes.
> 
> calculate_min_free_kbytes() already caps the auto-tuned default at
> 256MB, with a comment noting larger values don't make sense even on
> big machines. But that cap only applies to the computed default --
> min_free_kbytes_sysctl_handler() lets a user write any value, since
> it only sets extra1 = SYSCTL_ZERO, with no extra2.
> 
> An unbounded min_free_kbytes drives watermarks past what the system
> can provide, so every allocation triggers reclaim/OOM with no way to
> make progress, and out_of_memory() eventually panics.

This is an admin only interface and we assume whoever has access can
realize consequences of the set value. Auto-tuning really cannot make
any judgment call so it needs a cap. The same doens't hold for the
admin.

> Fix this by applying the same 256MB cap to the sysctl write path.
> 
> Tested on top of upstream master (5dd1818b15d9):
>   - Before: syzbot's reproducer reliably panics the kernel.
>   - After: writing 3145728 fails with -EINVAL, normal values
>     (e.g. 200000) still work, and the reproducer no longer panics
>     the kernel across repeated runs.
> 
> Note: this covers the reported case (a value far above any real
> machine's RAM). It doesn't prevent a smaller value that's still a
> large fraction of a very small system's memory from causing the
> same problem via lowmem_pages in __setup_per_zone_wmarks(). Open to
> a follow-up there if maintainers think it's worth it.
> 
> Reported-by: syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c61d6962d0b7e698439e
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>

There is nothing really to fix.
Nacked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/page_alloc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 12fac9084c48..8cb62879bf41 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6933,6 +6933,9 @@ static int percpu_pagelist_high_fraction_sysctl_handler(const struct ctl_table *
>  	return ret;
>  }
>  
> +/* Cap sysctl writes to the same bound calculate_min_free_kbytes() uses. */
> +static const int max_user_min_free_kbytes = 262144;
> +
>  static const struct ctl_table page_alloc_sysctl_table[] = {
>  	{
>  		.procname	= "min_free_kbytes",
> @@ -6941,6 +6944,7 @@ static const struct ctl_table page_alloc_sysctl_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= min_free_kbytes_sysctl_handler,
>  		.extra1		= SYSCTL_ZERO,
> +		.extra2		= (void *)&max_user_min_free_kbytes,
>  	},
>  	{
>  		.procname	= "watermark_boost_factor",
> -- 
> 2.53.0

-- 
Michal Hocko
SUSE Labs
