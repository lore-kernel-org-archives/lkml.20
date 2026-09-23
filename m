Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DD3E49DA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200511; cv=none; b=aTvh4rdyJXHVN815x1T+/7ATrQTHFlQoqXlPoUIK/5W0fbxF1XKW4xLV+w62j7DK8/80ytpF+kMzfLkEdPaAS9lR9VoUGmiQAPwsyPhPsWa4AxkUypyKXBtSSCpEVmMG4obvTqaWPjz9Lfa4bxqUaXZU2dCY6fA5HiE5O4b0pSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200511; c=relaxed/simple;
	bh=p+ZNuXYJq6YNjelH1m1aPrewzztl95I1NAzy/Ny9jgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1InbK8POEblniW5WSuZPPFujz/muDpAGtmkl2TwjI08JdBFSWRRe4nKzIhgbeQGebtB8YMQCDf8tc8UWpYFi7zgH+WSqHNseeyL0LGdjIkChTfOKt0XWCcV1fkFY6fuCwqcgUCJFyA3uRoEKsIc46g8adLZ1OrC/7Ap+uDyhZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cgw3afYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cgw3afYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F096A1F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790200510;
	bh=SpXPGh64kpxQKL1N904LXrN6hkR3B6eHCfE5NZYijII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cgw3afYujNqlrWM/WhXomv6w5ymB9ASvZlKeEGsThrj5KwbV0o78k4RyPSTvGYY1T
	 xTyNNjPQe0dyBODmMwCzxN8qPec5CC32ksR7FpvgtShi3F+PYBHnxCAYj10pgVrMOD
	 Vj5VnKeKQwHskPqOTx692ErN7Y4A2tv32iesJZGxGgCM/bKkRNCR3vMflD+gWoPeoc
	 /PWLIAjHQMmje4LAJug8HdcgpZr5oYEJu/XYL+/eauTR3V4X8cOyB8KzwgnJqEpIcm
	 +zBA+oytBZPJyf6hJdHBl+fHVogHN+5Dv4xlWqZB+RzfkZXb1jT085vOrt9TGTd5eL
	 b3rlsOUx/FALQ==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067fso147130085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:55:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBo0qiVyKkk90XSHFu+gmvJIx7QBdNc6HR6US4STgu0AfQDZH6lAn4h3DFBbgXdghXAEtO2GpHs91jhtM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZfbajnceTDEWfJAGguAeCvF8sKZ0ojGh+GxNmGvwVzxZLZb20
	C4kI3XIeGfD/CI/Sg+McoHL3D7e2yhkXjK9BkpN71eObsZP3rsXBUS2R5D5lome8AmqklbY78ho
	+EcfG8MGc4n32EYoLStftjiqtGif6DL8=
X-Received: by 2002:a05:620a:284a:b0:936:dfbf:85b0 with SMTP id
 af79cd13be357-93c363a8152mr1388985a.35.1790200509327; Wed, 23 Sep 2026
 14:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789718658.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1789718658.git.zhuhui@kylinos.cn>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:54:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xuc0+Ehih7hY2YEhRR7tppbf+B5O62wdP3nxDp+K7oZw@mail.gmail.com>
X-Gm-Features: AcwNN1XTWzCfQmh8uM20cSrnV3apsyMT9Ecd9a8pnvLDRtaQT8_TZ6QtW38rdjA
Message-ID: <CAGsJ_4xuc0+Ehih7hY2YEhRR7tppbf+B5O62wdP3nxDp+K7oZw@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND v5 0/2] mm/vmscan: fix NR_ISOLATED accounting
 and throttle MGLRU eviction
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:07=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> Previously the patch was based on mm-unstable, which caused issues during
> Sashiko apply.
> So I rebased it onto mm-stable and resend.
> Thanks Andrew for the heads-up.
>
> The legacy reclaim path has two mechanisms around isolated folios that
> MGLRU lacks:
>
> 1. NR_ISOLATED_ANON/FILE counters are updated when folios are isolated
>    from the inactive lists. Compaction's too_many_isolated() relies on
>    them to decide when to back off. The MGLRU reclaim path never
>    updates them, so compaction cannot see MGLRU's in-flight isolation.
>
> 2. shrink_inactive_list() throttles direct reclaim via
>    too_many_isolated() when isolated folios pile up. MGLRU's
>    evict_folios() isolates folios without any such check, so many
>    concurrent reclaimers can over-isolate the same (oldest) generation,
>    leading to unnecessary swapping, thrashing and premature memcg OOM.
>
> Patch 1 fixes the counter accounting in the MGLRU isolation path.
> Patch 2 adds a per-lruvec throttle, mirroring the legacy behavior but
> adapted to MGLRU's per-lruvec contention and its dynamic type
> selection/fallback.
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
> Two test scripts are provided to reproduce the problem and validate
> the fix. Both are available at:
> https://gist.github.com/teawater/3ef51251f2e91a5a600e3d26bb477e34
> Test environment: 10 CPU / 8GB QEMU guest, MGLRU enabled, a 16MB
> memory cgroup, anonymous working set, swap backed by dm-delay (50ms
> read/write delay) to slow swap-out and lengthen the isolation window.
>
> mglru_iso_repro.sh (64 threads, 48MB working set, 60s):
> Drives concurrent direct reclaim inside the memcg and measures scan
> efficiency, throttle events, in-flight isolation and throughput.
> Neither kernel OOMs at this concurrency; the value of the patch shows
> in reclaim quality:
>                         unpatched       patched
>   OOM kills             0               0
>   mm_vmscan_throttled   0               35645 (all
>                                         VMSCAN_THROTTLE_ISOLATED)
>   nr_isolated peak      0 (invisible)   230
>   total touches         246,499,132,369 301,456,426,692
>   scan efficiency       0.0261          0.0194
>
> The patched kernel completes ~22% more work in the same 60s: the
> throttle keeps concurrent reclaimers from trampling the same
> generation, so less CPU is burned in reclaim. Note nr_isolated is
> always 0 on the unpatched kernel - the over-isolation is invisible
> there, which is exactly what patch 1 fixes.
>
> mglru_iso_repro_v2.sh (192 threads, 48MB working set, 60s):
> Raises concurrency to the point where over-isolation becomes fatal:
>                         unpatched       patched
>   OOM kills             1 (task killed) 0
>   memcg oom events      51              0
>   mm_vmscan_throttled   0               512292 (all
>                                         VMSCAN_THROTTLE_ISOLATED)
>   total touches         0 (killed)      682,300,003,972
>
> With 192 threads the unpatched kernel cannot keep reclaim ahead of
> allocation and the task is OOM-killed; the patched kernel survives the
> full run and keeps reclaim making progress.
>

Hi Hui,

I=E2=80=99m perfectly fine with using a script to create a scenario with a =
small
memcg (e.g. 16 MB or 64 MB) and many threads. This is how we do R&D and
build simple reproducers for complex problems.

But I=E2=80=99m still struggling to understand how this scenario maps to or
affects real-world workloads, other than `iso_stress.c` in your scripts.
Do you have any idea of a real workload that suffers from the lack of
throttling, which we could present in the cover letter?

Best Regards
Barry
