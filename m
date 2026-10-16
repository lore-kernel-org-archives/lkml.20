Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959449427D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174080; cv=pass; b=cvzxkXl9W1iumvh0uXryqcIBZb7ViDxDwE06Lm59jvi85EJ352AdBpl6YZl2JIxy3MHBVNRXHhkHeS4wxTLheoN0gTgMAy+yMT2N5sS2nf3XZaMy9gTmZk0y1pFzPNMUZN0Slk9XlzwDguJ+Y/cCUQQvAec2oykGcaIfECT+2bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174080; c=relaxed/simple;
	bh=sMkLb9nQ9fCtzm22CHkC0HyaqziMXzV9SAb8UknqaGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssThnRRPPUoqUvIj1xZqFBAkD3hsmo6XTDB1lOVzUwDaKueikXNd5TbePvKsW2phmmolsLicqBomoheERYsWschJszij08sn6feKThGGr9B/5klfw9tTOaeHSMxQ/ns/BFmalgqQGQoeag6uSEnhbrlqhLOBL6gRtB1CDXjXG5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLWdHcuu; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLWdHcuu"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so153856a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792174076; cv=none;
        d=google.com; s=arc-20260327;
        b=jnSEHBl/FGwlce79sQ+uveQoLOwurzpM0ZKLBgMPgNAzdjAjZaSw7z/69r6A3cUoaB
         Sj3Dju7OxPor9AsmAYiyvuEoG0sOWXjNp5l6iqzGLfKSyUGldLyKKCrdaTGP46/URj1l
         14E5Et5OOvKHi/3BGHReVOd3e9UQDOflZxj2iuKcqEO08soUTUDiQMiUQ6OOBLfyRTcG
         Q85dEoCZQSD+DHjsZ5IUY1XFq9wCyx26E1X89gQmKOE+a20edSso82pv3MRy661vSaMz
         BQZtlrDeFVYofPb204YevgSMut0WPGZ/83k3rUPqQAuff1TStqupkwcTvFWz/Z0IA5LK
         SRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J/I92v0wF/kyQQm7cPSQOQrVX4Fd6/5rEbr+DzTDJM=;
        fh=okB1Ggvi+lsdiOuSRRMQaoX+AB7pHxhEmhhhZm/pA4w=;
        b=REp6ibGNLSds5Yp2a5g3OG/fZ+t7bWGueHSTGzI9Oyh+adGeaOJZIeYIbn2kjgEqtX
         fb32WFbuPWIE69jxEZYRHe1jDb+G1lCQTbme8C5GyzO3T9wT9bWjqzdZ7pVOeonn1776
         NH0tf01qPfYbt5IQZnn7fzdkGNmh6YOohd0rt7/TQykTqg9ETYawIjFuxABggjyEGDxU
         kpYLogQVXA3KYXe2zz6JqTDG/2bfSB5LHyEWMZaDihWb/g9DqVzSMZsNIdAMFrNGjMpB
         WiXE1u9RLwhsLPASXon+8hOKiVn/Si6waJgaOhe1Fx9gbsg9fYzlsMp+yq8epkjoR7RB
         5bgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792174076; x=1792778876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J/I92v0wF/kyQQm7cPSQOQrVX4Fd6/5rEbr+DzTDJM=;
        b=PLWdHcuuU/h69rkbwcmTpm2QAlKlV/zGFq3lv3JZZG3SlBBRdEMh80rGtkEYU70sT8
         3tfuDBsYxhpYUPWp2W863sEGHMXKuhy5izGcpwGLXTHV8Dr2OtRyJjA9kxG144j5IUBx
         tODU9UeJaBMbIrovoQG5A63sccHk5V64P0wWtvNjEvgNR5ki/juO/clDMDdOYoKRShZP
         gKuHQ1jRJ8dsSIeazLOfdo2w0L8jj4TgQJNiIm8DzwJvToKc2aNbnjZoDIBUfYgwYevO
         ie1IBMq8/y3VP1k+Dxn0+hdn2zng8QjylCLI5s319fs+tBBIHsL+qWQOPGKCvhg3fjJS
         34Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174076; x=1792778876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J/I92v0wF/kyQQm7cPSQOQrVX4Fd6/5rEbr+DzTDJM=;
        b=vKem//1jIq1vbKoaW2UK7BEVrzwNhfysMaQZ2oXZCqpVg2KxNdUHhXwoHZ/yx4Lf3N
         aqSvoQSHWuL9ybhkRHacArJwMcsuD2KKnpZ5nngwb4Ny6WAWLPqymKH7hdlbOT6rwvtB
         Rmp5tjQcof4mWYe+RGGMHdJ8jN6Kdkpkc9dlv8a2xZgJe0Cndl35qxqgycH4iUl4vUZ9
         RjjvWFtUe52epQQgt/zheK6lxvrJ0iIgEd+EhEfOARGLstkt7OHbRfkwrN4J7YPmMHz8
         wurkB1z+050gv7sAudFsDlC+G+xBOOMfWoG2oYaGP3ZWJi8o+FHn/X3bGqIj6XnpwY6R
         NqyA==
X-Forwarded-Encrypted: i=1; AKwUvBxRL3IBHjfrNokKkTETSdLE/7/Bq7MhztIAmCfdQJy9kpqyuHfNW2pRbszbQCgRsSjwRL8i0XKyMhdWucM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyXHdiGBIS5/P3BZ/khv8Q/oFGDLF4EoiXcwO4PqGDlPCWmMRC
	dBIzWfeSstfVkLA8U8C+ybyH9F/liZMPPWJUhYCOArbTLDsQjLOqk4BRP3nhb3kI9W9UcZ3hCJh
	LyrmfdXDAYLFpNFrrvCyM7sk3DlgRRkU=
X-Gm-Gg: AYBFou3jhSlGQjcOpfGtemF4Q0ax8SGx2EgIgxOlY9rFfnkOOWwRTalF7U0Yqqcv4TY
	IjxArK3VP7nIEL2dPZ8ND7JLqqFgFAD3or3zQOZLwVEGpmX0ubpP6P3IiFAHjtflCPGPNUeJMp8
	AZ62sVSmOnufSwaXqCDDJFEoz+kPKlZ1GH4rgqjnrDy1f3Q6s1EqEZtBpQ081k4pfFgNCH2sfkf
	tv5hFRq8FmldxUicxMBi+iSKQ98mFwf0PfubqOsyTg/k3XEnoyJq6Jk4wFp3yKVNsBVYWvLC33t
	LKHx+JQGRo0CW6/8pAeHk60VGNRYh04cu6TYaCcFGe9QBZK7QDgeumzRQqrt7TAOt1g+8OvK6hT
	Be+x0qbX6soPy
X-Received: by 2002:a05:6a21:3949:b0:3de:46cc:b63c with SMTP id
 adf61e73a8af0-3e225f34c37mr102562637.11.1792174075994; Fri, 16 Oct 2026
 11:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015080157.269079-1-hui.zhu@linux.dev>
In-Reply-To: <20261015080157.269079-1-hui.zhu@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 17 Oct 2026 02:07:16 +0800
X-Gm-Features: AclHuK8W2xBl5s5IN0J9HKfgoDwSB5xTrWukdNvfZ_qsxUCZoxD7lnzavqz6gEY
Message-ID: <CAMgjq7C+EXJBdLUh-JxLGkZHb6wiuvLsq85V7ph6+gPND6mq2g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v7] mm/vmscan: throttle MGLRU eviction when
 isolated folios pile up
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:02=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> The legacy path throttles direct reclaim via too_many_isolated() when
> isolated folios pile up, but MGLRU's evict_folios() isolates folios
> without this check, which can lead to unnecessary swapping, thrashing
> and OOM.
>
> Add lru_gen_too_many_isolated() and throttle_evictable_types(), called
> from evict_folios() before the lruvec lock is taken since throttling
> sleeps.
>
> The check is per lruvec rather than node-wide: reclaimers contend per
> lruvec, and a node-wide check would let isolation in one memcg throttle
> reclaim in another. The threshold is the evictable size of the type
> divided by MIN_NR_GENS, approximating one generation.
>
> Since isolate_folios() picks the type from refault feedback and may fall
> back to the other one, throttle_evictable_types() collects the types
> that are not over-isolated and have evictable folios, and sleeps only
> when all of them are over-isolated. The mask is passed to
> isolate_folios() to restrict its choice and fallback, so an
> over-isolated type never blocks the other, and isolation never lands on
> a throttled or empty type.
>
> An lruvec with no evictable folios at all is not over-isolation:
> reclaim stops immediately instead of waiting. Without this, allowed =3D=
=3D 0
> would conflate "all types are empty" with "all types are over-isolated"
> and send the reclaimer to sleep, and since the kswapd exemption lives
> inside the per-type check, which empty types bypass, even kswapd would
> stall on an empty lruvec.
>
> Like the legacy path, kswapd and !writeback_throttling_sane() reclaim
> are exempt, the threshold is raised for GFP_NOIO/GFP_NOFS callers, and
> a dying task fakes progress to exit reclaim quickly.
>
> This builds on the recently merged NR_ISOLATED accounting fix for the
> MGLRU reclaim path, which makes in-flight isolation visible in
> /proc/vmstat; the throttle itself uses a separate per-lruvec counter.
> The nr_isolated numbers in the test results below therefore come from
> that fix rather than from this patch.
>
> Tested on a 10 CPU / 8GB QEMU guest, cgroup v2, MGLRU enabled (0x0007).
> "unpatched" and "patched" are the same tree built without/with this
> patch; every configuration is run with identical parameters on both
> kernels. Test scripts:
> https://gist.github.com/teawater/3ef51251f2e91a5a600e3d26bb477e34
>
> 1) Synthetic (mglru_iso_repro.sh, mglru_iso_repro_v2.sh): threads
>    write-touching a 48MB anonymous working set inside a 16MB memcg,
>    with swap on a dm-delay device (50ms) to slow swap-out and lengthen
>    the isolation window.
>
>    64 threads, 60s - neither kernel OOMs at this concurrency; the gain
>    shows in reclaim quality:
>                           unpatched       patched
>      OOM kills            0               0
>      total touches        246,499,132,369 301,456,426,692 (+22%)
>      scan efficiency      0.0261          0.0194
>      mm_vmscan_throttled  0               35,645 (all
>                                           VMSCAN_THROTTLE_ISOLATED)
>      nr_isolated peak     0               230
>
>    The patched kernel completes ~22% more work in the same 60s: the
>    throttle keeps concurrent reclaimers from trampling the same
>    generation, so less CPU is burned in reclaim.
>
>    192 threads, 60s - over-isolation becomes fatal without the
>    throttle:
>                           unpatched       patched
>      OOM kills            1 (task killed) 0
>      memcg oom events     51              0
>      total touches        0 (killed)      682,300,039,725
>      mm_vmscan_throttled  0               512,292
>      nr_isolated peak     0               335
>
>    The unpatched kernel cannot keep reclaim ahead of allocation and the
>    task is OOM-killed; the patched kernel survives the full run and
>    keeps reclaim making progress.
>
> 2) Real workload (mglru_build_repro.sh): a CI-style build pod -
>    repeated from-scratch "make -j20 vmlinux" rounds inside a
>    memory-limited cgroup, with the object tree on ext4 over dm-delay
>    (10ms) to model slow storage. 20 concurrent compilers charge into
>    one memcg and enter direct reclaim at the same time, while dirty
>    object files stretch the isolate->shrink->putback window. Each
>    kernel runs 1800s per pressure level and the metrics are cumulative
>    counters over that window, which smooths run-to-run noise. The
>    headline metric is the number of objects actually compiled (a full
>    round is ~3,800 objects).
>
>    memory.max =3D 1024MB (extreme pressure):
>                           unpatched       patched
>      objects compiled     4,744           7,211 (+52%)
>      pgscan_direct        2,901,083,521   2,228,776,807 (-23%)
>      scan efficiency      0.195           0.242
>      workingset_refault   565,169,241     537,686,479
>      mm_vmscan_throttled  0               511,441 (all
>                                           VMSCAN_THROTTLE_ISOLATED)
>      nr_isolated peak     0               1,152
>
>    memory.max =3D 1536MB (heavy pressure):
>                           unpatched       patched
>      objects compiled     18,969          25,124 (+32%)
>      pgscan_direct        1,223,905,508   816,812,074 (-33%)
>      scan efficiency      0.320           0.338
>      workingset_refault   390,048,986     273,442,445 (-30%)
>      memcg charge fails   8,344,775       5,868,167 (-30%)
>      round wall time      199-391s        182-275s
>      mm_vmscan_throttled  0               503,117
>      nr_isolated peak     0               1,053

Hmm is this because of the type fallback? e.g. too many files isoalted
-> scan anon instead / too many anon isolate -> scan file instead.
>
>    At both levels -j20 is oversubscribed (20 cc1 processes need ~3GB
>    of anon in total), so rounds end with a cc1 being memcg-OOM-killed
>    on either kernel. Normalized per completed round the kill rate is
>    the same (13.2 vs 13.1 at 1024MB, 5.8 vs 6.1 at 1536MB); the
>    patched kernel simply reaches that point sooner because less time
>    is burned thrashing, so it cycles through more rounds. This patch
>    does not claim to avoid those OOMs - the point is that it performs
>    23-33% fewer futile LRU scans and gets 32-52% more build work done
>    in the same wall time.
>
>    memory.max =3D 2048MB (light pressure - no-harm control):
>                           unpatched       patched
>      rounds completed     6               6
>      avg wall time/round  271s            270s
>      scan efficiency      0.984           0.978
>      mm_vmscan_throttled  0               0
>      nr_isolated peak     0               144
>
>    When reclaim keeps up the throttle never fires and both kernels
>    perform identically, so the check costs nothing on a system that is
>    not over-isolating.
>
> 3) Service no-impact (mglru_redis_repro.sh and
>    mglru_redis_shards_repro.sh): a redis-server serving a 1KB-value
>    dataset larger than its 96MB cgroup, with swap on dm-delay (50ms) -
>    first as a single instance (100k keys, 200 clients), then as 8
>    shards with AOF persistence on a second dm-delay device sharing one
>    cgroup (8 concurrent chargers). The bottleneck here is swap-in I/O
>    serialized on redis's single command thread, not isolation
>    contention: charge-induced reclaim is a trickle (~400 scans/s vs
>    10^5-10^6 scans/s in the build runs), isolation never piles up, and
>    the throttle correctly stays dormant on both kernels:
>
>                           unpatched       patched
>      single instance      41.6 ops/s      41.2 ops/s
>                           (avg 2999ms)    (avg 2999ms)
>      8 shards aggregate   333-419 ops/s   310-358 ops/s
>                           (mean 376,      (mean 335,
>                           4 runs) (*)     4 runs)

Hmm, I know this could be noise but it looks like a regression?

>      mm_vmscan_throttled  0               0 (all runs)
>      nr_isolated peak     0               0
>
>    (*) the aggregate is dominated by a preload-end residency lottery
>    (which shards' datasets happen to stay hot) and swings by up to 26%
>    between runs of the SAME kernel; with 4 runs per kernel the
>    difference between the means is within that noise (Welch t=3D1.95,
>    p~0.11). The throttle never fired in any patched run (the tracepoint
>    covers preload as well), so both kernels execute the same reclaim
>    path here, and the kernel-side counters agree across all 8 runs:
>    steal/scan 0.59-0.63, swap-ins =3D=3D refaults, zero OOM. These runs
>    document the no-impact side: the check is dormant unless isolation
>    actually piles up.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Hi Hui

Looks like a good idea in general.
> ---
> Changelog:
> v7:
> Patch 1 was merged into mm-unstable, so this is resent as a single
> patch.
> According to the comments of Sashiko, Return instead of waiting when the
> lruvec has no evictable folios at all: allowed =3D=3D 0 previously confla=
ted
> "all empty" with "all over-isolated" and stalled even kswapd for 20ms.
> Move the v6 cover-letter test data into the commit message.
> v6:
> According to the comments of Barry, add real-world workload tests:
> a CI-style kernel build (repeated "make -j20 vmlinux") inside a
> memory-limited cgroup with its object tree on dm-delay-backed storage,
> measured at three pressure levels (1024/1536/2048MB), plus redis-based
> cache service runs (single instance and 8 shards sharing one cgroup)
> as no-impact data points. New and updated test scripts are in the
> gist. Rebased onto the latest mm-stable; patch 2 is adapted to the
> current isolate_folios() type-selection context (is_single_type_
> reclaim()), with no semantic change. Re-run the tests and update the
> test logs.
> v5:
> According to the comments of Kairun and feedback from the test scripts,
> make the throttle check per lruvec (new nr_isolated counter) and skip
> empty types in the allowed mask.
> v4:
> According to the commens of Baolin and Barry, rework patch 2:
> drop the throttle_is_throttled() helper extracted
> from shrink_inactive_list() and leave the legacy path untouched.
> The new MGLRU-only throttle_evictable_types() only sleeps when all
> evictable types are over-isolated - v3 throttled as soon as any of
> them was, which unnecessarily blocked the reclaim of the other type
> and passes the mask of the remaining types to isolate_folios(),
> which restricts both its initial choice and its fallback, so that
> isolation never lands on a throttled type.  The v3 gate did not
> constrain the type actually isolated, so the fallback could still
> pick the over-isolated one.
> Re-run the tests and update the test log.
> v3:
> According to the commens of Baolin, remove the redundant nr_isolated
> check before restoring the NR_ISOLATED_* counters in evict_folios().
> rename the extracted helper to throttle_is_throttled() to avoid
> confusion with the existing wake_throttle_isolated() naming space.
> Use for_each_evictable_type() in the MGLRU throttle to check each
> evictable type's isolation instead of only the type returned by
> get_type_to_scan(), since isolate_folios() may fall back to the
> other type.
> Re-run the tests and update the test log.
> v2:
> According to the commens of Kairun, Rebased on mm-unstable.
> Split into two patches; patch 2 is new and adds the
> too_many_isolated() throttling to the MGLRU eviction path, which v1
> did not cover.
> Add test infomations.
>
>  include/linux/mmzone.h |   2 +
>  mm/vmscan.c            | 184 +++++++++++++++++++++++++++++++++++++----
>  2 files changed, 172 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 3b96d6c7123b..7759a53326ba 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -564,6 +564,8 @@ struct lru_gen_folio {
>         /* can be modified without holding the LRU lock */
>         atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
>         atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS=
];
> +       /* the number of folios isolated from this lruvec and being recla=
imed */
> +       atomic_long_t nr_isolated[ANON_AND_FILE];
>         /* whether the multi-gen LRU is enabled */
>         bool enabled;
>         /* the memcg generation this lru_gen_folio belongs to */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index daa7e37c2236..36887117d76a 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4332,25 +4332,34 @@ static void set_initial_priority(struct pglist_da=
ta *pgdat, struct scan_control
>         sc->priority =3D clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
>  }
>
> -static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int sw=
appiness)
> +static unsigned long lruvec_type_evictable_size(struct lruvec *lruvec, i=
nt type)
>  {
> -       int gen, type, zone;
> +       int gen, zone;
>         unsigned long seq, total =3D 0;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         DEFINE_MAX_SEQ(lruvec);
>         DEFINE_MIN_SEQ(lruvec);
>
> -       for_each_evictable_type(type, swappiness) {
> -               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> -                       gen =3D lru_gen_from_seq(seq);
> -                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> -                               total +=3D max(READ_ONCE(lrugen->nr_pages=
[gen][type][zone]), 0L);
> -               }
> +       for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> +               gen =3D lru_gen_from_seq(seq);
> +               for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> +                       total +=3D max(READ_ONCE(lrugen->nr_pages[gen][ty=
pe][zone]), 0L);
>         }
>
>         return total;
>  }
>
> +static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int sw=
appiness)
> +{
> +       unsigned long total =3D 0;
> +       int type;
> +
> +       for_each_evictable_type(type, swappiness)
> +               total +=3D lruvec_type_evictable_size(lruvec, type);
> +
> +       return total;
> +}
> +

The helper split looks clean; it could be a stand alone commit I think.

>  static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control=
 *sc)
>  {
>         unsigned long total;
> @@ -5012,16 +5021,142 @@ static inline bool is_single_type_reclaim(int sw=
appiness)
>                swappiness =3D=3D SWAPPINESS_ANON_ONLY;
>  }
>
> +/*
> + * The MGLRU counterpart to too_many_isolated().
> + *
> + * too_many_isolated() compares node-wide isolated counts against
> + * node-wide inactive sizes. It predates per-memcg LRU lists, which
> + * moved isolation to per-lruvec granularity. MGLRU reclaimers contend
> + * per lruvec, so this check is per lruvec as well, and isolation in
> + * one memcg does not throttle reclaim in another.
> + *
> + * The legacy threshold, the size of the inactive list, is not usable
> + * here either: in MGLRU the inactive counters are only a compatibility
> + * shim - they jump around when swap runs out or a memcg hits its swap
> + * limit, and proactive aging can inflate them. Compare against the
> + * total number of evictable pages of the type divided by MIN_NR_GENS,
> + * approximating the size of one generation - the same unit the
> + * original MGLRU aging heuristics used.
> + */
> +static bool lru_gen_too_many_isolated(struct lruvec *lruvec, int type,
> +                                     struct scan_control *sc)
> +{
> +       unsigned long isolated, evictable;
> +
> +       if (current_is_kswapd())
> +               return false;
> +
> +       if (!writeback_throttling_sane(sc))
> +               return false;
> +
> +       isolated =3D atomic_long_read(&lruvec->lrugen.nr_isolated[type]);
> +       evictable =3D lruvec_type_evictable_size(lruvec, type);
> +
> +       /*
> +        * GFP_NOIO/GFP_NOFS callers are allowed to isolate more pages, s=
o
> +        * they won't be blocked by normal direct-reclaimers, forming a
> +        * circular deadlock.
> +        */
> +       if (gfp_has_io_fs(sc->gfp_mask))
> +               evictable >>=3D 3;
> +
> +       return isolated > evictable / MIN_NR_GENS;
> +}

The magic number of >>=3D3 looks a bit odd, others are fine to me.

> +
> +/*
> + * Unlike the legacy path, where the LRU list to isolate from is known
> + * before isolation, isolate_folios() picks the type from the refault
> + * feedback and may fall back to the other one. Therefore, instead of
> + * throttling on a single type, collect the evictable types that do not
> + * have too many isolated folios, and only sleep when all of them do.
> + *
> + * Returns the mask of the types isolate_folios() may isolate from, or
> + * 0 if reclaim should stop. Also sets @fatal to tell the caller that
> + * the task received a fatal signal while waiting.
> + */
> +static unsigned int throttle_evictable_types(struct lruvec *lruvec,
> +                                            int swappiness,
> +                                            struct scan_control *sc,
> +                                            bool *fatal)
> +{
> +       unsigned int allowed;
> +       bool stalled =3D false;
> +       bool has_evictable;
> +       struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> +       int i;
> +
> +       *fatal =3D false;
> +
> +       for (;;) {
> +               allowed =3D 0;
> +               has_evictable =3D false;
> +               for_each_evictable_type(i, swappiness) {
> +                       /*
> +                        * A type with no evictable folios has nothing to
> +                        * isolate. Don't allow it, otherwise reclaim can=
 be
> +                        * redirected to it and spin making no progress, =
e.g.
> +                        * when the only type with folios is over-isolate=
d.
> +                        */
> +                       if (!lruvec_type_evictable_size(lruvec, i))
> +                               continue;
> +
> +                       has_evictable =3D true;
> +
> +                       if (!lru_gen_too_many_isolated(lruvec, i, sc))
> +                               allowed |=3D BIT(i);
> +               }
> +
> +               /*
> +                * Nothing evictable at all is not over-isolation. Stop
> +                * reclaim instead of waiting, so that nobody - including
> +                * kswapd, which is exempt from the check below - stalls =
on
> +                * an empty lruvec.
> +                */
> +               if (!has_evictable)
> +                       return 0;
> +
> +               if (allowed) {
> +                       /* Wake up reclaimers waiting on the isolation to=
 go down. */
> +                       wake_throttle_isolated(pgdat);
> +                       return allowed;

This seems counterintuitive: we reach here because a reclaimer is
starting, and we wake up even more reclaimer?

> +               }
> +
> +               /*
> +                * All evictable types are over-isolated. Like the legacy
> +                * path, wait once for concurrent reclaimers to put their
> +                * isolated folios back; give up if that makes no progres=
s.
> +                */
> +               if (stalled)
> +                       return 0;
> +
> +               stalled =3D true;
> +               reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
> +
> +               /* We are about to die and free our memory. Return now. *=
/
> +               if (fatal_signal_pending(current)) {
> +                       *fatal =3D true;
> +                       return 0;
> +               }
> +       }
> +}
> +

Hmm... this part looks a bit too complex, see below.

>  static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruve=
c,
>                           struct scan_control *sc, int swappiness,
> -                         struct list_head *list, int *isolated,
> -                         int *isolate_type, int *isolate_scanned)
> +                         unsigned int allowed, struct list_head *list,
> +                         int *isolated, int *isolate_type, int *isolate_=
scanned)
>  {
>         bool type_fallback_allowed =3D !is_single_type_reclaim(swappiness=
);
>         int type =3D get_type_to_scan(lruvec, swappiness);
>         int total_scanned =3D 0, scanned, tier;
>         bool tried =3D false;
>
> +       /*
> +        * The preferred type may have been excluded by
> +        * throttle_evictable_types(); start from the other one.
> +        */
> +       if (!(allowed & BIT(type)))
> +               type =3D !type;
> +
>  retry:
>         tier =3D get_tier_idx(lruvec, type);
>         scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> @@ -5036,9 +5171,11 @@ static int isolate_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
>
>         /*
>          * We are running out of the current reclaim type. Fall back to
> -        * the other type if allowed.
> +        * the other type if allowed. Only fall back to a type that is
> +        * not throttled.
>          */
> -       if (!scanned && !tried && type_fallback_allowed) {
> +       if (!scanned && !tried && type_fallback_allowed &&
> +           (allowed & BIT(!type))) {
>                 type =3D !type;
>                 tried =3D true;
>                 type_fallback_allowed =3D false;
> @@ -5072,18 +5209,36 @@ static int evict_folios(unsigned long nr_to_scan,=
 struct lruvec *lruvec,
>         bool skip_retry =3D false;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> +       unsigned int allowed;
> +       bool fatal;
> +
> +       allowed =3D throttle_evictable_types(lruvec, swappiness, sc, &fat=
al);
> +       if (!allowed) {
> +               /*
> +                * We are about to die and free our memory. Like the lega=
cy
> +                * path, pretend some pages were reclaimed so reclaim
> +                * unwinds quickly instead of looping back into the
> +                * throttle.
> +                */
> +               if (fatal)
> +                       sc->nr_reclaimed +=3D SWAP_CLUSTER_MAX;

And reporting a fake nr_reclaimed looks a bad thing to do in the first plac=
e.

It seems a lot of trouble is caused by the design of the reclaim loop,
so will it work better if we calculate the number & type to reclaim
first like CLRU?

There is a demonstration from Barry:
https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=3Dk=
airui_scanbalance_0.3

And instead of throttle at the reclaim loop, balance the scan budge
based on (size - isolation) number, and throttle a while LRU simply
when the total isolated number is larger than total size /
MIN_NR_GENS.

Just an idea for reference, seems could help get rid of a lot of complex lo=
gic.
