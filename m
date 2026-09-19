Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36F3A7F58
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780095; cv=none; b=AlF/bSgeSK1Kv++attbRN3NiiCbEHuiWHnSJJMcGYbsLBeL8OOynhVAZ2a84dBBngqrf1YmwXA4v6N/Noo9rXK9G5WEJfQS+TpSl53a+OxTA97LvyLMeV6dJkUnGu2w8Ho68hOTWYGMxr7NSleBHQ/9xdY+GF4tP7fT1ngrIryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780095; c=relaxed/simple;
	bh=fr1FeFYxe8uP98Bha8ZGd70rVK8bjfX52e6hdS68lao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XV8XwjgKExbfYq5Fl8yLiPvE3/mMcE5bp0glBQ7ebtElMn/M9HicpVJV+fK6NXucOSvti4+Xa9W436Ci0+RQ5EOONWP1DeXKCvK37iTjuG9XcPEo4ukyWVJr8pNdoV46/y5zAjsjiMsih+32vV8L8o4O9ViH8FDjKTxL9t0bzPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZI/HLxis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZI/HLxis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F237F1F000FF;
	Sat, 19 Sep 2026 01:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789780080;
	bh=RCVvrn5mtkCx9ECwLg21MykICw5oc97e2nLzAerD+CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZI/HLxissH5hH5VDuH3i089DYmp1O3fYIaNM5DY+R8eLixtF6oEfmgvWwTDISc5Cu
	 lSJxNKR+PiMkM7E/ggWhXKL8bAZTJykq9gAFzWPcEeJSMT+cBw221CQCg++mpeeKWa
	 Q+HChrw2Md+Hn7cEiTTTeGbSy8KMbFw7vpA7JgePLvxRgp9gldPIbOqhQRWAmYbqv1
	 zVC5+RMxS2a+AaZBSxPsETAIUTnyir1hMq3mnVXIPWllAq+fAdvuqbbwT8cHZZOl39
	 k9gjA9y2umYl5zfYUz3a/1fkzNSuNRdJHO0oAecMarTmeXETMCQMVY1hWSREuJBLT1
	 CknYk/ge24rgA==
From: SJ Park <sj@kernel.org>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] mm/page_alloc: enforce upper bound on min_free_kbytes sysctl write
Date: Fri, 18 Sep 2026 18:07:52 -0700
Message-ID: <20260919010753.88198-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3c1598eaff225a155cdec5e92d5c97fbfc6c00fd.1789724312.git.med08elkadiri@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 11:45:51 +0200 Mohammed EL Kadiri <med08elkadiri@gmail.com> wrote:

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
> 
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

I think the idea makes sense.  But I'm not sure if this user-visible behavior
change is fine.  I'm curious what others think.

> 
> Reported-by: syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c61d6962d0b7e698439e
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
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

Would '_user' on the name unnecessary?

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


Thanks,
SJ
