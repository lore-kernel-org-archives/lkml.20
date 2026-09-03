Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DEF1B808
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398845; cv=none; b=M1JJif2nPh4tJFcE3CqYHMU03mjvunnVU7Jb7XMMcTKJT6R0IannJ0097cGfgDOkB7SC7GStI0iwXRXmnLK2zEa2wgLFHMc4J2T6oqGglPZMWr5vRbMhIpyjLXkYOLzqsUbvcvprU9CvmjkLK0jOujeZsT8FQprWn1yThczoq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398845; c=relaxed/simple;
	bh=dk9sKkN5uRP0GrbLFA2P9o5pKt0fKi/knsyrlgEkpNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAHTh7ICvP4u+or3ioQfn8fAJI4bM1MpbAWEGHyfmVdXvlmmNnVdo2f7XqeVJLFjYFUeI78mAaVi5Cw8sVVd0FymmA16WJoeE8OchFEX0VZ+cy2n/IdTTBje/lV81DmouXE7nTadQ9OnnV/m65OlEVtzJ/lCmjBI3kpEhRrrm88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mRTfkmyK; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mRTfkmyK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dk9sKkN5uRP0GrbLFA2P9o5pKt0fKi/knsyrlgEkpNI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788398840; v=1; x=1789003640;
 b=mRTfkmyK+n2fXNvwuewlN5f7xIVOEHqEFIpuM/W0GpCCTZjKeDQowKsfy61Z9h3w7qlA9unK
 ca5f5cmdtgIGeVpqhT3uVtxT1W1V2RZROraqt4WAa3yK3p+0yfrJqWxVGSjuasZUufN5sHdK6de
 EMzSnTth7STcGQpb+zvuyJJU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4a836954cf0dfae8;
	Thu, 03 Sep 2026 01:27:10 +0000
X-Mizu-Trace-ID: 4a836954cf0dfae8
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 09:27:01 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in
 isolate_folios()
Message-ID: <apjM5ZBOJrdGQM_g@fedora>
References: <20260829074204.45304-1-baohua@kernel.org>
 <20260829074204.45304-3-baohua@kernel.org>
 <apfZQE1X6zGAsBb_@fedora>
 <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>
 <apf3ivSCu9kQfM9F@fedora>
 <CAGsJ_4zfDJ2+qG-NHQoSi=KOPdsfi3YHL63gZytDGUhW1HOpvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zfDJ2+qG-NHQoSi=KOPdsfi3YHL63gZytDGUhW1HOpvQ@mail.gmail.com>

On 09/03/26 at 06:08am, Barry Song wrote:
> On Wed, Sep 2, 2026 at 6:17 PM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > On 09/02/26 at 05:20pm, Barry Song wrote:
> > > On Wed, Sep 2, 2026 at 4:07 PM Baoquan He <baoquan.he@linux.dev> wrote:
> > > >
> [...]
> >
> > Hi Barry,
> >
> > Agreed on the one-line change for the (1, 200) case - I traced it and it
> > now matches mainline exactly (no extra third scan). I personally prefer
> > the for (attempt = 0... ) style because I feel that makes logic clearer,
> > while everybody truly has different code taste, LOL, just a weak opinion.
> >
> > For 0/201: my concern is that on no-swap systems (swappiness 0 is
> > file-only), the same-type retry when the first scan is busy may be a
> > no-gain run if the file generation is dominated by protected/ineligible
> > folios - the retry re-scans the same sort results. But if you see a case
> > where the retry does isolate folios on the second pass for single-type
> > reclaim, keeping it for consistency is defensible. Do you have such a
> > case, or should we drop the retry for 0/201?
> >
> 
> 201 only applies to proactive reclamation. I believe the retry helps
> avoid having an outer loop. For 0, I ran a kernel build test on x86
> with swap disabled:
> 
> # free
>                total        used        free      shared  buff/cache   available
> Mem:        23991248     1315020    20554564      331312     2121664    22099256
> Swap:              0           0           0
> 
> #  time systemd-run --scope --unit=kernel-build -p MemoryMax=1500M
> make ARCH=arm64 \
>         CROSS_COMPILE=aarch64-linux-gnu- vmlinux -j20 1>/dev/null 2>/dev/null
> 
> With the following patch for counting:
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index bf2786c7247d..e8d5603cd56e 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4913,6 +4913,28 @@ static inline bool is_single_type_reclaim(int swappiness)
>                swappiness == SWAPPINESS_ANON_ONLY;
>  }
> 
> +#include <linux/proc_fs.h>
> +
> +static atomic64_t tried_isolated;
> +static atomic64_t tried_not_isolated;
> +static int reclaim_stats_show(struct seq_file *m, void *v)
> +{
> +       seq_printf(m, "tried_isolated: %lld\n",
> +                  atomic64_read(&tried_isolated));
> +       seq_printf(m, "tried_not_isolated: %lld\n",
> +                  atomic64_read(&tried_not_isolated));
> +
> +       return 0;
> +}
> +       return 0;
> +}
> +static int __init reclaim_stats_init(void)
> +{
> +       proc_create_single("reclaim_stats", 0444, NULL,
> +                          reclaim_stats_show);
> +
> +       return 0;
> +}
> +fs_initcall(reclaim_stats_init);
> +
>  static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>                           struct scan_control *sc, int swappiness,
>                           struct list_head *list, int *isolated,
> @@ -4928,6 +4950,13 @@ static int isolate_folios(unsigned long
> nr_to_scan, struct lruvec *lruvec,
>         scanned = scan_folios(nr_to_scan, lruvec, sc,
>                               type, tier, list, isolated);
> 
> +       if (tried) {
> +               if (*isolated)
> +                       atomic64_inc(&tried_isolated);
> +               else
> +                       atomic64_inc(&tried_not_isolated);
> +       }
> +
>         total_scanned += scanned;
>         if (*isolated) {
>                 *isolate_type = type;
> 
> I got:
> 
> # cat /proc/reclaim_stats
> tried_isolated: 12096
> tried_not_isolated: 23061
> 
> So we see some cases where the retry gets isolated folios, while in
> others we still encounter promoted or protected folios. But my gut
> feeling is that even if we don't retry and instead go back to the outer
> loop for another iteration, we'll still encounter those folios, since
> they are still on the LRU. We would just reach those folios in a more
> costly way.

Thanks, Barry. These number is very convincing. The retry for swappiness
0 is worthy. Then the patchset feels like doing two things: refactoring
the for() loop; improving the eviction for swappiness 0/201 by adding a
retry and this also makes them be consistent with (1, 200). While the
cover letter subject, patch 1 and patch 2 feels like it's not easy to
match them to the corresponding part. Maybe merging them to one patch,
or rearranging them? Just personal opinion.

