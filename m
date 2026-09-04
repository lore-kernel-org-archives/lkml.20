Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B803C585A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538189; cv=none; b=ONXk6FM7o8qZxknBMjw3XzMMnwYbXO+T0nWd3ENOMTK2hNf+HI6fqfmffjkK2N7HXG/D0NzmDY1xLAM1wRKuxyL7C3NZQDXtEoLI2k1KWyN08awlQZf1OWUEBCiKhe83XlGXSQy5ctBMl+mQHTM3Y0qmujhGc+O8G0GfeuiLdxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538189; c=relaxed/simple;
	bh=6ouzDVC79cXNw75e318MwqRDCYf0r6uFT9/xncoPI78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptYw8u0br6ORgJlSujMD9dSglwtRZs4pk4tz9/6/c5hZVzzBwuURyv1utAm0/LH98uAam+TxnwAEbE4U2ZbjmdSC4fTH9YzNWiVa7IEF6dg9iA+3QN4LNJu9s9E86pdUvFkzU6HP5mc8eANyiUJtm+LPNRoeP8ZAa4uvFGs5kRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOYe2PR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOYe2PR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB191F00ACF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538187;
	bh=Eeq1cCGbIWkkHc8XN84l/PkE/s3OPAx4E/DdJKyKEcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VOYe2PR3MDiMotRQLT7leWQ2WJJprtf6szl2QmGCnwpsMPNduyy5iI4sE4U86VJAL
	 VCUT7yTGxb6+dQmdmCxfM+9Fk4uWK25UBCH8MLtV3Pn1QyN5lmIG8sHYZuVSGQQikI
	 wLfO3JHOlKD8HFz4OluR+8zmcmQf0IzKEWnSlJEhM6NZG7CXJtIzlLtYD2buSAqLOk
	 Lu1JE3d7U+GmLygai1R9RQxvBA8KtF3fj1Jazu2M3xNiHZcfeA2e/4FDG4OXtT7++9
	 /AB35hSJlxt0IPLv34h1e3iyHEYSq3AYs2n6CvKSm7MIjPQzYJQL4HOu0qZ/0YzXJV
	 UvlHEbVrOS2nw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250f28f1cdso192635366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:09:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvQBY4OA+2xbm56T8655UnpOygFfBCjEN7zwI6iGJdz01erSjGxDsLYWHOMgm5wYCYvtgZNRlA7vqPdXg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+8ZMHSAMWhPfVTdW92OPmyEV0wxeDwxDTppbwsr5bz3Bp3kq1
	y6K0R2CZZfYWHFXXfUqjwpMxdcneMKkqoYcJ7nTtMS6i74S4LCx+TPyNliirTCUDpciwt7+FbjB
	ZF6xgjrep+dplZPMt2AhFqT6cpfCw6yk=
X-Received: by 2002:a17:907:6c0f:b0:c26:19de:9ac7 with SMTP id
 a640c23a62f3a-c2619dea67cmr159398866b.31.1788538186259; Fri, 04 Sep 2026
 09:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com> <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com> <apqppFukssaAQz3w@tiehlicka>
In-Reply-To: <apqppFukssaAQz3w@tiehlicka>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 4 Sep 2026 09:09:35 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
X-Gm-Features: AcwNN1UI8vVflFBHpjQw18qMFlO-gIfm7g3j2hfRTedEMhop9xXtUozwNzZigZA
Message-ID: <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
To: Michal Hocko <mhocko@suse.com>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>, akpm@linux-foundation.org, 
	mgorman@techsingularity.net, david@redhat.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, quic_pkondeti@quicinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:21=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:
>
> On Thu 03-09-26 07:03:33, Yosry Ahmed wrote:
> > On Thu, Sep 3, 2026 at 12:27=E2=80=AFAM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Wed 02-09-26 16:49:48, Yosry Ahmed wrote:
> > > > On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > > > > pcp lists are drained from __alloc_pages_direct_reclaim(), only i=
f some
> > > > > progress is made in the attempt.
> > > > >
> > > > > struct page *__alloc_pages_direct_reclaim() {
> > > > >     .....
> > > > >    *did_some_progress =3D __perform_reclaim(gfp_mask, order, ac);
> > > > >    if (unlikely(!(*did_some_progress)))
> > > > >       goto out;
> > > > > retry:
> > > > >     page =3D get_page_from_freelist();
> > > > >     if (!page && !drained) {
> > > > >         drain_all_pages(NULL);
> > > > >         drained =3D true;
> > > > >         goto retry;
> > > > >     }
> > > > > out:
> > > > > }
> > > > >
> > > > > After the above, allocation attempt can fallback to
> > > > > should_reclaim_retry() to decide reclaim retries. If it too retur=
n
> > > > > false, allocation request will simply fallback to oom kill path w=
ithout
> > > > > even attempting the draining of the pcp pages that might help the
> > > > > allocation attempt to succeed.
> > > > >
> > > > > VM system running with ~50MB of memory shown the below stats duri=
ng OOM
> > > > > kill:
> > > > > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > > > > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > > > >
> > > > > Though in such system state OOM kill is imminent, but the current=
 kill
> > > > > could have been delayed if the pcp is drained as pcp + free is ev=
en
> > > > > above the high watermark.
> > > > >
> > > > > Fix this missing drain of pcp list in should_reclaim_retry() alon=
g with
> > > > > unreserving the high atomic page blocks, like it is done in
> > > > > __alloc_pages_direct_reclaim().
> > > > >
> > > > > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> > > >
> > > > [Sorry for thread necromancy]
> > > >
> > > > Hi Charan,
> > > >
> > > > Are you planning to respin this patch?
> > > >
> > > > I know that Michal was questioning the need for it. While doing som=
e
> > > > stress testing I came across a couple of OOM kills that had signifi=
cant
> > > > amount of memory in pcplists. Something that would have been preven=
ted
> > > > by this patch.
> > >
> > > Could you share some numbers to see the scale of the problem?
> >
> > Sure, here's a sample from an OOM log (ignore mapped/free_mapped, it's
> > from the ALLOC_UNMAPPED series):
> >
> > [   40.336188] Mem-Info:
> > [   40.336195] active_anon:96 inactive_anon:1540181 isolated_anon:0
> >                 active_file:51 inactive_file:0 isolated_file:0
> >                 unevictable:382720 dirty:43 writeback:0
> >                 slab_reclaimable:20339 slab_unreclaimable:26597
> >                 mapped:382858 shmem:153 pagetables:8291
> >                 sec_pagetables:0 bounce:0
> >                 kernel_misc_reclaimable:0
> >                 free:17264 free_pcp:16890 free_cma:0
> > [   40.336199] Node 0 active_anon:384kB inactive_anon:6160724kB
> > active_file:204kB inactive_file:0kB unevictable:1530880kB
> > isolated(anon):0kB isolated(file):0kB mapped:1531432kB dirty:172kB
> > writeback:0kB shmem:612kB shmem_thp:0kB shmem_pmdmapped:0kB
> > anon_thp:10240kB kernel_stack:2576kB pagetables:33164kB
> > sec_pagetables:0kB all_unreclaimable? yes Balloon:0kB gpu_active:0kB
> > gpu_reclaim:0kB
> > [   40.336202] DMA32 free:34808kB boost:0kB min:11028kB low:13784kB
> > high:16540kB reserved_highatomic:0KB free_highatomic:0KB
> > free_mapped:11032KB active_anon:0kB inactive_anon:1487720kB
> > active_file:52kB inactive_file:20kB unevictable:393252kB
> > writepending:4kB zspages:0kB present:2096760kB managed:1991156kB
> > mlocked:393252kB bounce:0kB free_pcp:42404kB local_pcp:2460kB
> > free_cma:0kB
> > [   40.336205] lowmem_reserve[]: 0 5976 5976
> > [   40.336210] Normal free:34248kB boost:0kB min:34024kB low:42528kB
> > high:51032kB reserved_highatomic:0KB free_highatomic:0KB
> > free_mapped:34028KB active_anon:384kB inactive_anon:4672764kB
> > active_file:180kB inactive_file:0kB unevictable:1137628kB
> > writepending:168kB zspages:0kB present:6291456kB managed:6120144kB
> > mlocked:1137628kB bounce:0kB free_pcp:25156kB local_pcp:764kB
> > free_cma:0kB
> > [   40.336213] lowmem_reserve[]: 0 0 0
> >
> > As far as I can tell there's about ~65M of free memory stranded on
> > pcplists (in an 8G VM), which would have kept the amount of free
> > memory above the watermarks and prevented that specific OOM kill.
> > Although, as I mentioned before, this is a synthetic stress test.
> > Perhaps in practice it doesn't matter all that much in practice, but
> > it seems like the logical thing to do.
>
> yes, pcp lists are quite (unusually) high. Is it possible they simply
> got repopulated after the first direct reclaim run? Or is there
> something else(odd) going on?

I think in this case there wasn't a lot of reclaimable memory (mostly
anon with no swap), so at some point direct reclaim didn't make any
progress. __alloc_pages_direct_reclaim() only drains the pcplists if
reclaim makes progress, I am not sure if that's intentional. An
alternative would be perhaps removing this condition, something like
this:

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8d79f76cdd0e1..98e9079240ad5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
unsigned int order,
        psi_memstall_enter(&pflags);
        *did_some_progress =3D __perform_reclaim(gfp_mask, order, ac);
        if (unlikely(!(*did_some_progress)))
-               goto out;
+               goto drain;

 retry:
        page =3D get_page_from_freelist(gfp_mask, order, alloc_flags, ac);

+drain:
        /*
         * If an allocation failed after direct reclaim, it could be becaus=
e
         * pages are pinned on the per-cpu lists or in high alloc reserves.
@@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
unsigned int order,
                drained =3D true;
                goto retry;
        }
-out:
        psi_memstall_leave(&pflags);

        return page;
