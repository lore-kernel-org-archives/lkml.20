Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770703;
	b=OL453LjsstUYkx4x43C08adOjeONnK42jsfCotiZuf8rZyD6CP8ZLEpYK6hXNEjgqdIH
	 iA2ggPWNJVrO2F40Wubv6J6VaVNEIJoGo1tfqSt7LpZwW1iyYEKJ+RVIaMg7v53Mav7Rl
	 SxbUvpKcm4HW0yKVadG8LnWLBtHJiaiUmEAYDPmNWYb5QRq5otEdV1ggogPP0f+QmsOQO
	 6Upp3yXguRzIbk87nJkJusmtM3NCdnnd7pv3kZl6OKFyWdbuadQbrj0QshhYY7dFoNd7y
	 qijgPxAu92Wkq0p1sD9k/fnlYjhpYKjOFojjH1aFlUeoHPP6apfTKL603G0XATTz5vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SHhiHhKM/Y0ThxDxV4gz8y+nbHryua5zu4b8nmjksY4=;
	b=fQcCFxe2h7MmiKULWImr/WAOxnEetZMzq8gsQHpmh9o0LQCrP2uUTZqAZrTH2WWJGq4r
	 hd4QRZ7tPSSFwMrLw8U9675xnOc36axQDJ9pteQkplibKUkPULIPVekIDCptvL75u+kgU
	 T7SSJtdqLhJ6B2WxnNrB5A4hjcLGC3DrhVCCbK6kaEPLCiaQmQhPogfwjRK9coP+7hyr+
	 rydP0T9miWsUTlNtlGPjq9vrZj0mBkYfgZr7B5/OssAza8geNxtzSzbtLMdjRQxOpQ766
	 2CflVYfvPud6d23rTI1HpMijeG9u0EXd/Ks3u1HqgbPfyVjfT4WjAFLqml3ERnNcsnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LKhM2RMD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368EB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LKhM2RMD
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso530460b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770702; cv=none;
        d=google.com; s=arc-20260327;
        b=aVhqInh2kseXrkjMDVsH8w/h9NbfxSKJF1UPDA/ulZvYKzn/97UmOXH2bQUSEfTIZ7
         fX2nmORZoYx9qHi7F19GAJqMcLc7zyW3x6dwPVdtX8igmOWqXA/pzvzxduxyr3DV1uQg
         P23740bLb3ffP3h3QiNs+XZzX+j9ARjEeF2fEZFPzX0eX36Vm70g4/KI6NgduTHj6TvO
         EedqnE32+ar/4LezOpjfNWbskaGc2D6Lx7+8Ix0yibf8/LFEVhIHi+feVMBKFo84WrEO
         4MJmfiZQeX6OwCwrNj989fY0ozYiHWHw/DWNCDSNVjyBvCaPoOGobGMeyeP0IM8u9h0e
         9A6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHhiHhKM/Y0ThxDxV4gz8y+nbHryua5zu4b8nmjksY4=;
        fh=pYDZvQXosiWYSydih3oHKh19BAqotDKtRQQF8cbkr28=;
        b=GgFc30DYOwschOuKbI2bxARVL3QMJgszDONO7VVoUOOdugpGMeu6cWqOIwRrLOF58I
         PamqbuAn9w8lpS0evHpnc59WwYnKpNgXGX9UdwvmZaeJpmwdBKwf+rkmsxNFw9YsPcDH
         80R+CdjqcMTS3aP2pi+FPOiY9ZyhpNw090hUeRyyqe3QqtVgrPaD6r4jNWzxI2qkNALK
         CIq10dqbAJAH3WVo7fNNgyKayYVc4I0G8JCnI0chB3Z5OUObu+26v7yJpd92Fl1c4nA5
         ySF4pZdwVOl/kITiDMZ6PewTewoTeGjbSlDmbXFuHGLgB5/YQVPKw/Bbd64T3LlsKwU1
         +SMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770702; x=1793375502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHhiHhKM/Y0ThxDxV4gz8y+nbHryua5zu4b8nmjksY4=;
        b=LKhM2RMD/yy6eNuY/aXAhqOUblZobWKXklBwU2KJtDh4+U+0rGE6P8QkAleFaUpLJX
         K6jtxlYYdZPpvGj9U9GK5j4XkZzG1bqS6OB3jbkeFV2gzZT+kEr27Ft4fSbDkyeddFYz
         k0VemDQh7Lwaa1MPE2ZnXEAsJaYp5nzG1ownJmnImLgff4Q/hOZErRJcJ0F26Fu/BQxX
         7bsQnE6hnHz8RSDP7/uTZ2b/6TgrOeQktH/aw7CYQnMpxWbjCywTLYkQlTt1psDIkCg7
         UNVOTwst/TTb4Qvgv1ZdYExPct4KnyjJuJUpkF2GfBExV15cmQR5luNBVDKNihgqP6ap
         29FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770702; x=1793375502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHhiHhKM/Y0ThxDxV4gz8y+nbHryua5zu4b8nmjksY4=;
        b=ADev1eYftJkS6Uq/fnsaEaYsnypLu01ckB7IAnu8nA7w+0pohMPHxJqBhSPBGus76X
         dTUBrOOI2MXbE6kRISd1p7wKogqVRDgP9to2PzgAxu7Q+QfyF3kD5qc++5Vsvo6JzHUK
         v7EblNuzVpgilZ7+4Dx8LgQ605geQdYeOPKw/kIL0GljDg2Owtgt8+mgcOmwx/5NcPZm
         ttFP/jWmVLgCK2D5MLIaA7lXBuGzr2wlg7StFOZlXox36bJdCCz+ctfifleGAjyafuxt
         nvTuMS5jb8tnSxXffI8KQi3ZEd3r6UjY9yk2tjoTLTvrJce/5Xh0KsyzhV0zCFhl0UWO
         s1dA==
X-Forwarded-Encrypted: i=1; AKwUvBzHM/M726CdITdEEjuofGucV6pKreX4x+VO4iJNKjx4fXTpYavfYmaizmquxbzarcrfTJVdZlW7mllnHS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi7kzhchSr+5fQn5GtRFCIFHoxJdHi7zpLWPwVCQAiYEZEUJLX
	u6hfFC/Rm7ZXBf83TvCYeui7+LyB0nyYtuAbuXvfBmAhTnqrtLkfybbaiwOZ13QmQGD5LTb+cOU
	CWfGxgC/NuLwasgxB/iH6rfOsE0x4VgY=
X-Gm-Gg: AYBFou16xn5XXcDz4LDSPBla0dHS1aJ2azvxAAK/Gmas/c2uYyHhEF/Ia9vs7DSujV3
	CREzmCescEafrTRMyZiWOxK6IvdDk3VOaybDuJphzUrpSivz7aoJUuOy3A2jGZQbbKw0mMCAwdG
	3lHZ0bTwaBqbCllmXIroTJY4yPIj4ShpT6UpMGVFKW5w8YQ4T0Piw3ousJH9AbYUV5u0wa5+Iso
	hUtlSxeWdrzJq9g3XjT7M9ZkAc9TYnoM9HGA2OelepEN+nPBXD3j28cbQIbadYaBT4ppYhRG8kJ
	bamnw9sIALRN/oPNaH/LxBYPA6wcpuGlKm58VkwOHiHWpVLZsRM++9xD9YpmPzLgbJHN5i7cRDq
	FT3We2M7w9fltvRlbVsLX4jLcQyasz+w6JU6vI84yKt/vlnh4ydcbVOoOJF7AALyzRESP1w==
X-Received: by 2002:a05:6a20:244a:b0:3e2:7c10:d48c with SMTP id
 adf61e73a8af0-3e3691fbd33mr2349848637.17.1792770702261; Fri, 23 Oct 2026
 08:51:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015080157.269079-1-hui.zhu@linux.dev> <CAMgjq7C+EXJBdLUh-JxLGkZHb6wiuvLsq85V7ph6+gPND6mq2g@mail.gmail.com>
 <94afeb74-44cc-4e02-97dc-961309a12364@linux.dev>
In-Reply-To: <94afeb74-44cc-4e02-97dc-961309a12364@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 23 Oct 2026 23:51:01 +0800
X-Gm-Features: AclHuK_-O6edOwhNZ9Fh0WLzPGUakbHyGCUsqDJICDWCabdqPF8tTv3nvnZMfJ4
Message-ID: <CAMgjq7By+mAje-QbZv9UVLosaafjR-NNbm6m_egq+26jBiuMjQ@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 5:29=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
> 2026/10/17 02:07, Kairui Song:
> > On Thu, Oct 15, 2026 at 4:02=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wro=
te:

...

> > Hmm, I know this could be noise but it looks like a regression?
> >
> >>       mm_vmscan_throttled  0               0 (all runs)
> >>       nr_isolated peak     0               0
> >>
> >>     (*) the aggregate is dominated by a preload-end residency lottery
> >>     (which shards' datasets happen to stay hot) and swings by up to 26=
%
> >>     between runs of the SAME kernel; with 4 runs per kernel the
> >>     difference between the means is within that noise (Welch t=3D1.95,
> >>     p~0.11). The throttle never fired in any patched run (the tracepoi=
nt
> >>     covers preload as well), so both kernels execute the same reclaim
> >>     path here, and the kernel-side counters agree across all 8 runs:
> >>     steal/scan 0.59-0.63, swap-ins =3D=3D refaults, zero OOM. These ru=
ns
> >>     document the no-impact side: the check is dormant unless isolation
> >>     actually piles up.
> >>
> >> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > Hi Hui
> >
> > Looks like a good idea in general.
> >> ---
> >> Changelog:
> >> v7:
> >> Patch 1 was merged into mm-unstable, so this is resent as a single
> >> patch.
> >> According to the comments of Sashiko, Return instead of waiting when t=
he
> >> lruvec has no evictable folios at all: allowed =3D=3D 0 previously con=
flated
> >> "all empty" with "all over-isolated" and stalled even kswapd for 20ms.
> >> Move the v6 cover-letter test data into the commit message.
> >> v6:
> >> According to the comments of Barry, add real-world workload tests:
> >> a CI-style kernel build (repeated "make -j20 vmlinux") inside a
> >> memory-limited cgroup with its object tree on dm-delay-backed storage,
> >> measured at three pressure levels (1024/1536/2048MB), plus redis-based
> >> cache service runs (single instance and 8 shards sharing one cgroup)
> >> as no-impact data points. New and updated test scripts are in the
> >> gist. Rebased onto the latest mm-stable; patch 2 is adapted to the
> >> current isolate_folios() type-selection context (is_single_type_
> >> reclaim()), with no semantic change. Re-run the tests and update the
> >> test logs.
> >> v5:
> >> According to the comments of Kairun and feedback from the test scripts=
,
> >> make the throttle check per lruvec (new nr_isolated counter) and skip
> >> empty types in the allowed mask.
> >> v4:
> >> According to the commens of Baolin and Barry, rework patch 2:
> >> drop the throttle_is_throttled() helper extracted
> >> from shrink_inactive_list() and leave the legacy path untouched.
> >> The new MGLRU-only throttle_evictable_types() only sleeps when all
> >> evictable types are over-isolated - v3 throttled as soon as any of
> >> them was, which unnecessarily blocked the reclaim of the other type
> >> and passes the mask of the remaining types to isolate_folios(),
> >> which restricts both its initial choice and its fallback, so that
> >> isolation never lands on a throttled type.  The v3 gate did not
> >> constrain the type actually isolated, so the fallback could still
> >> pick the over-isolated one.
> >> Re-run the tests and update the test log.
> >> v3:
> >> According to the commens of Baolin, remove the redundant nr_isolated
> >> check before restoring the NR_ISOLATED_* counters in evict_folios().
> >> rename the extracted helper to throttle_is_throttled() to avoid
> >> confusion with the existing wake_throttle_isolated() naming space.
> >> Use for_each_evictable_type() in the MGLRU throttle to check each
> >> evictable type's isolation instead of only the type returned by
> >> get_type_to_scan(), since isolate_folios() may fall back to the
> >> other type.
> >> Re-run the tests and update the test log.
> >> v2:
> >> According to the commens of Kairun, Rebased on mm-unstable.
> >> Split into two patches; patch 2 is new and adds the
> >> too_many_isolated() throttling to the MGLRU eviction path, which v1
> >> did not cover.
> >> Add test infomations.
> >>
> >>   include/linux/mmzone.h |   2 +
> >>   mm/vmscan.c            | 184 +++++++++++++++++++++++++++++++++++++--=
--
> >>   2 files changed, 172 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >> index 3b96d6c7123b..7759a53326ba 100644
> >> --- a/include/linux/mmzone.h
> >> +++ b/include/linux/mmzone.h
> >> @@ -564,6 +564,8 @@ struct lru_gen_folio {
> >>          /* can be modified without holding the LRU lock */
> >>          atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIE=
RS];
> >>          atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_T=
IERS];
> >> +       /* the number of folios isolated from this lruvec and being re=
claimed */
> >> +       atomic_long_t nr_isolated[ANON_AND_FILE];
> >>          /* whether the multi-gen LRU is enabled */
> >>          bool enabled;
> >>          /* the memcg generation this lru_gen_folio belongs to */
> >> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >> index daa7e37c2236..36887117d76a 100644
> >> --- a/mm/vmscan.c
> >> +++ b/mm/vmscan.c
> >> @@ -4332,25 +4332,34 @@ static void set_initial_priority(struct pglist=
_data *pgdat, struct scan_control
> >>          sc->priority =3D clamp(priority, DEF_PRIORITY / 2, DEF_PRIORI=
TY);
> >>   }
> >>
> >> -static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int=
 swappiness)
> >> +static unsigned long lruvec_type_evictable_size(struct lruvec *lruvec=
, int type)
> >>   {
> >> -       int gen, type, zone;
> >> +       int gen, zone;
> >>          unsigned long seq, total =3D 0;
> >>          struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> >>          DEFINE_MAX_SEQ(lruvec);
> >>          DEFINE_MIN_SEQ(lruvec);
> >>
> >> -       for_each_evictable_type(type, swappiness) {
> >> -               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> >> -                       gen =3D lru_gen_from_seq(seq);
> >> -                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> >> -                               total +=3D max(READ_ONCE(lrugen->nr_pa=
ges[gen][type][zone]), 0L);
> >> -               }
> >> +       for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> >> +               gen =3D lru_gen_from_seq(seq);
> >> +               for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> >> +                       total +=3D max(READ_ONCE(lrugen->nr_pages[gen]=
[type][zone]), 0L);
> >>          }
> >>
> >>          return total;
> >>   }
> >>
> >> +static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int=
 swappiness)
> >> +{
> >> +       unsigned long total =3D 0;
> >> +       int type;
> >> +
> >> +       for_each_evictable_type(type, swappiness)
> >> +               total +=3D lruvec_type_evictable_size(lruvec, type);
> >> +
> >> +       return total;
> >> +}
> >> +
> > The helper split looks clean; it could be a stand alone commit I think.
> >
> >>   static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_con=
trol *sc)
> >>   {
> >>          unsigned long total;
> >> @@ -5012,16 +5021,142 @@ static inline bool is_single_type_reclaim(int=
 swappiness)
> >>                 swappiness =3D=3D SWAPPINESS_ANON_ONLY;
> >>   }
> >>
> >> +/*
> >> + * The MGLRU counterpart to too_many_isolated().
> >> + *
> >> + * too_many_isolated() compares node-wide isolated counts against
> >> + * node-wide inactive sizes. It predates per-memcg LRU lists, which
> >> + * moved isolation to per-lruvec granularity. MGLRU reclaimers conten=
d
> >> + * per lruvec, so this check is per lruvec as well, and isolation in
> >> + * one memcg does not throttle reclaim in another.
> >> + *
> >> + * The legacy threshold, the size of the inactive list, is not usable
> >> + * here either: in MGLRU the inactive counters are only a compatibili=
ty
> >> + * shim - they jump around when swap runs out or a memcg hits its swa=
p
> >> + * limit, and proactive aging can inflate them. Compare against the
> >> + * total number of evictable pages of the type divided by MIN_NR_GENS=
,
> >> + * approximating the size of one generation - the same unit the
> >> + * original MGLRU aging heuristics used.
> >> + */
> >> +static bool lru_gen_too_many_isolated(struct lruvec *lruvec, int type=
,
> >> +                                     struct scan_control *sc)
> >> +{
> >> +       unsigned long isolated, evictable;
> >> +
> >> +       if (current_is_kswapd())
> >> +               return false;
> >> +
> >> +       if (!writeback_throttling_sane(sc))
> >> +               return false;
> >> +
> >> +       isolated =3D atomic_long_read(&lruvec->lrugen.nr_isolated[type=
]);
> >> +       evictable =3D lruvec_type_evictable_size(lruvec, type);
> >> +
> >> +       /*
> >> +        * GFP_NOIO/GFP_NOFS callers are allowed to isolate more pages=
, so
> >> +        * they won't be blocked by normal direct-reclaimers, forming =
a
> >> +        * circular deadlock.
> >> +        */
> >> +       if (gfp_has_io_fs(sc->gfp_mask))
> >> +               evictable >>=3D 3;
> >> +
> >> +       return isolated > evictable / MIN_NR_GENS;
> >> +}
> > The magic number of >>=3D3 looks a bit odd, others are fine to me.
> >
> >> +
> >> +/*
> >> + * Unlike the legacy path, where the LRU list to isolate from is know=
n
> >> + * before isolation, isolate_folios() picks the type from the refault
> >> + * feedback and may fall back to the other one. Therefore, instead of
> >> + * throttling on a single type, collect the evictable types that do n=
ot
> >> + * have too many isolated folios, and only sleep when all of them do.
> >> + *
> >> + * Returns the mask of the types isolate_folios() may isolate from, o=
r
> >> + * 0 if reclaim should stop. Also sets @fatal to tell the caller that
> >> + * the task received a fatal signal while waiting.
> >> + */
> >> +static unsigned int throttle_evictable_types(struct lruvec *lruvec,
> >> +                                            int swappiness,
> >> +                                            struct scan_control *sc,
> >> +                                            bool *fatal)
> >> +{
> >> +       unsigned int allowed;
> >> +       bool stalled =3D false;
> >> +       bool has_evictable;
> >> +       struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> >> +       int i;
> >> +
> >> +       *fatal =3D false;
> >> +
> >> +       for (;;) {
> >> +               allowed =3D 0;
> >> +               has_evictable =3D false;
> >> +               for_each_evictable_type(i, swappiness) {
> >> +                       /*
> >> +                        * A type with no evictable folios has nothing=
 to
> >> +                        * isolate. Don't allow it, otherwise reclaim =
can be
> >> +                        * redirected to it and spin making no progres=
s, e.g.
> >> +                        * when the only type with folios is over-isol=
ated.
> >> +                        */
> >> +                       if (!lruvec_type_evictable_size(lruvec, i))
> >> +                               continue;
> >> +
> >> +                       has_evictable =3D true;
> >> +
> >> +                       if (!lru_gen_too_many_isolated(lruvec, i, sc))
> >> +                               allowed |=3D BIT(i);
> >> +               }
> >> +
> >> +               /*
> >> +                * Nothing evictable at all is not over-isolation. Sto=
p
> >> +                * reclaim instead of waiting, so that nobody - includ=
ing
> >> +                * kswapd, which is exempt from the check below - stal=
ls on
> >> +                * an empty lruvec.
> >> +                */
> >> +               if (!has_evictable)
> >> +                       return 0;
> >> +
> >> +               if (allowed) {
> >> +                       /* Wake up reclaimers waiting on the isolation=
 to go down. */
> >> +                       wake_throttle_isolated(pgdat);
> >> +                       return allowed;
> > This seems counterintuitive: we reach here because a reclaimer is
> > starting, and we wake up even more reclaimer?
> >
> >> +               }
> >> +
> >> +               /*
> >> +                * All evictable types are over-isolated. Like the leg=
acy
> >> +                * path, wait once for concurrent reclaimers to put th=
eir
> >> +                * isolated folios back; give up if that makes no prog=
ress.
> >> +                */
> >> +               if (stalled)
> >> +                       return 0;
> >> +
> >> +               stalled =3D true;
> >> +               reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
> >> +
> >> +               /* We are about to die and free our memory. Return now=
. */
> >> +               if (fatal_signal_pending(current)) {
> >> +                       *fatal =3D true;
> >> +                       return 0;
> >> +               }
> >> +       }
> >> +}
> >> +
> > Hmm... this part looks a bit too complex, see below.
> >
> >>   static int isolate_folios(unsigned long nr_to_scan, struct lruvec *l=
ruvec,
> >>                            struct scan_control *sc, int swappiness,
> >> -                         struct list_head *list, int *isolated,
> >> -                         int *isolate_type, int *isolate_scanned)
> >> +                         unsigned int allowed, struct list_head *list=
,
> >> +                         int *isolated, int *isolate_type, int *isola=
te_scanned)
> >>   {
> >>          bool type_fallback_allowed =3D !is_single_type_reclaim(swappi=
ness);
> >>          int type =3D get_type_to_scan(lruvec, swappiness);
> >>          int total_scanned =3D 0, scanned, tier;
> >>          bool tried =3D false;
> >>
> >> +       /*
> >> +        * The preferred type may have been excluded by
> >> +        * throttle_evictable_types(); start from the other one.
> >> +        */
> >> +       if (!(allowed & BIT(type)))
> >> +               type =3D !type;
> >> +
> >>   retry:
> >>          tier =3D get_tier_idx(lruvec, type);
> >>          scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> >> @@ -5036,9 +5171,11 @@ static int isolate_folios(unsigned long nr_to_s=
can, struct lruvec *lruvec,
> >>
> >>          /*
> >>           * We are running out of the current reclaim type. Fall back =
to
> >> -        * the other type if allowed.
> >> +        * the other type if allowed. Only fall back to a type that is
> >> +        * not throttled.
> >>           */
> >> -       if (!scanned && !tried && type_fallback_allowed) {
> >> +       if (!scanned && !tried && type_fallback_allowed &&
> >> +           (allowed & BIT(!type))) {
> >>                  type =3D !type;
> >>                  tried =3D true;
> >>                  type_fallback_allowed =3D false;
> >> @@ -5072,18 +5209,36 @@ static int evict_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> >>          bool skip_retry =3D false;
> >>          struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> >>          struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> >> +       unsigned int allowed;
> >> +       bool fatal;
> >> +
> >> +       allowed =3D throttle_evictable_types(lruvec, swappiness, sc, &=
fatal);
> >> +       if (!allowed) {
> >> +               /*
> >> +                * We are about to die and free our memory. Like the l=
egacy
> >> +                * path, pretend some pages were reclaimed so reclaim
> >> +                * unwinds quickly instead of looping back into the
> >> +                * throttle.
> >> +                */
> >> +               if (fatal)
> >> +                       sc->nr_reclaimed +=3D SWAP_CLUSTER_MAX;
> > And reporting a fake nr_reclaimed looks a bad thing to do in the first =
place.
> >
> > It seems a lot of trouble is caused by the design of the reclaim loop,
> > so will it work better if we calculate the number & type to reclaim
> > first like CLRU?
> >
> > There is a demonstration from Barry:
> > https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=
=3Dkairui_scanbalance_0.3
> >
> > And instead of throttle at the reclaim loop, balance the scan budge
> > based on (size - isolation) number, and throttle a while LRU simply
> > when the total isolated number is larger than total size /
> > MIN_NR_GENS.
> >
> > Just an idea for reference, seems could help get rid of a lot of comple=
x logic.
>
> Hi Kairui,
>
> Thanks for the pointer. I had a rough look at kairui_scanbalance_0.3 and
> I am quite interested in it.
>
> I think that branch still needs an over-isolation guard. The scan budget
> answers "which type and how much", but it is computed once per
> try_to_shrink_lruvec() and does not see what other reclaimers are
> holding. Each reclaimer's in-flight isolation is bounded by the batch
> size rather than by the budget, so N reclaimers entering together all
> see the same state and all proceed.

Yeah, exactly.

> On the other hand, that branch would also make the guard much simpler
> and clearer. Since evict_folios() already takes the type from its
> caller, the allowed mask, the type rewrite and the fallback restriction
> in isolate_folios() all go away, and the throttle reduces to a single
> check on the totals in the shrink loop, which is basically the second
> half of what you suggested.
>
> So I would like to ask what the development plan for this branch is,
> and whether you think it is worth moving the MGLRU too_many_isolated()
> work over to it.

Thanks for looking into that!

I think the isolation protection is definitely needed; really
appreciate your work!

However, many things are currently happening in parallel for MGLRU.
Will the code be cleaner if worked on based on that branch? And
MGLRU's budge will be more similiar with CLRU, so I hope maybe it can
even be unified with CLRU for this isolation protection, just with a
different gating (size / MIN_NR_GEN vs size of inactive), will be much
lower LOC.
