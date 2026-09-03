Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE231716D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444248; cv=none; b=H5Tfd8pOxBNSoSmtrgjwmSRwA8vJsC7MIcKE+Bubjvll5dKbmKRc2mZ6BJ3GsvRCoqTgqKXXgbnKi2Dc7EOWOyt4OeKd/UM+PuhePJ381OIEwoU8mlGfcWKTQankLsNMi6TBxenh8F6d4j6uRg/XFuuVCXVFjLBOV7maJrk/67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444248; c=relaxed/simple;
	bh=H8k/JurwcVNu7DRkWrrbuDfL0eOQ/gndxF7xLu0BWFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4+0tJwJuI+v0pCwAvljKs4Bw3LqZmkJsCYyIVRD4ttX5JPMVChrFtVP86WArgxzK98etaxhqEeMmmrmNZm3dvTviJpCe+bIRyWa1N4xVhqFtn4nZNn3S4xSXw8E2gca3+yeMe8AO4Aa8RdReP4w9hxgENt13xwBlEwvnuTpC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKcvgfMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKcvgfMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924891F00ACA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444226;
	bh=SIkCVMXueZug7Awhe2bDRHsi+uaKaNMKk8EAPzdMILM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MKcvgfMpi72qQpfUBJdR6W1lHzc/2rNRHq0b0XCtBRAHeStSFPGp9K4F6s6o711he
	 Hl29qtTtA6faFKUb4JZtyrBdX8Ht1RrFF3+j8O8Dd8zRycPEb3pgPCumQ0HQwaiUGm
	 2nuz3JfDsa9vbXSb0BRKfeov+LvsmIlmRsMiKejnjW5C3nlICchVu9SZ+XGb+8SJZh
	 KEU/Y+JQX9DKwpiVZm0b8VdU8BJ567YPPauQzwUiA06AKyPQqIcldyKKHzfFCbSy6j
	 1l1gIG70zoXuS0jtcNW//96UEnEcFVe7mfHa03SwITbF+EJbu1DJfeg+2eI+lFbNnc
	 meHyLfNnc2SZw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2569aa5116so170383766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzMJEqbMHUT8PRwGYa4DHKIKJtGMbrkQ2WlfO1Mvfb5tX3oj5XJWXfXbQTMiiO+NJDxEDiGClF6KYVOYI=@vger.kernel.org
X-Gm-Message-State: AFuF++nPlJI6JOFQqYxG6aNbjoYBuN4TkJKCLk6PD/PFHnlYzXe/i4p2
	ywNDgzTp9dop4ppuOaCpLl6B6amARxwkIxSk/uclnql56o+Mj1/pVtsyQL70VhiL5Uw4TnJ6Dic
	QTd6DyT1R6oMCgkFQzZH0Ff8vv4Km1fA=
X-Received: by 2002:a17:907:8323:b0:c25:f7dc:2e0 with SMTP id
 a640c23a62f3a-c25f7dc0985mr100970266b.33.1788444225414; Thu, 03 Sep 2026
 07:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com> <apkhSHr3by5Bf8jW@tiehlicka>
In-Reply-To: <apkhSHr3by5Bf8jW@tiehlicka>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 3 Sep 2026 07:03:33 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
X-Gm-Features: AcwNN1Vh9NEyJMK2-RqtsSvN7Ew3MbvuJfwRRlZGGsd6gh2ct7StqfMzBcy6rzk
Message-ID: <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
To: Michal Hocko <mhocko@suse.com>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>, akpm@linux-foundation.org, 
	mgorman@techsingularity.net, david@redhat.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, quic_pkondeti@quicinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:27=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Wed 02-09-26 16:49:48, Yosry Ahmed wrote:
> > On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > > pcp lists are drained from __alloc_pages_direct_reclaim(), only if so=
me
> > > progress is made in the attempt.
> > >
> > > struct page *__alloc_pages_direct_reclaim() {
> > >     .....
> > >    *did_some_progress =3D __perform_reclaim(gfp_mask, order, ac);
> > >    if (unlikely(!(*did_some_progress)))
> > >       goto out;
> > > retry:
> > >     page =3D get_page_from_freelist();
> > >     if (!page && !drained) {
> > >         drain_all_pages(NULL);
> > >         drained =3D true;
> > >         goto retry;
> > >     }
> > > out:
> > > }
> > >
> > > After the above, allocation attempt can fallback to
> > > should_reclaim_retry() to decide reclaim retries. If it too return
> > > false, allocation request will simply fallback to oom kill path witho=
ut
> > > even attempting the draining of the pcp pages that might help the
> > > allocation attempt to succeed.
> > >
> > > VM system running with ~50MB of memory shown the below stats during O=
OM
> > > kill:
> > > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > >
> > > Though in such system state OOM kill is imminent, but the current kil=
l
> > > could have been delayed if the pcp is drained as pcp + free is even
> > > above the high watermark.
> > >
> > > Fix this missing drain of pcp list in should_reclaim_retry() along wi=
th
> > > unreserving the high atomic page blocks, like it is done in
> > > __alloc_pages_direct_reclaim().
> > >
> > > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> >
> > [Sorry for thread necromancy]
> >
> > Hi Charan,
> >
> > Are you planning to respin this patch?
> >
> > I know that Michal was questioning the need for it. While doing some
> > stress testing I came across a couple of OOM kills that had significant
> > amount of memory in pcplists. Something that would have been prevented
> > by this patch.
>
> Could you share some numbers to see the scale of the problem?

Sure, here's a sample from an OOM log (ignore mapped/free_mapped, it's
from the ALLOC_UNMAPPED series):

[   40.336188] Mem-Info:
[   40.336195] active_anon:96 inactive_anon:1540181 isolated_anon:0
                active_file:51 inactive_file:0 isolated_file:0
                unevictable:382720 dirty:43 writeback:0
                slab_reclaimable:20339 slab_unreclaimable:26597
                mapped:382858 shmem:153 pagetables:8291
                sec_pagetables:0 bounce:0
                kernel_misc_reclaimable:0
                free:17264 free_pcp:16890 free_cma:0
[   40.336199] Node 0 active_anon:384kB inactive_anon:6160724kB
active_file:204kB inactive_file:0kB unevictable:1530880kB
isolated(anon):0kB isolated(file):0kB mapped:1531432kB dirty:172kB
writeback:0kB shmem:612kB shmem_thp:0kB shmem_pmdmapped:0kB
anon_thp:10240kB kernel_stack:2576kB pagetables:33164kB
sec_pagetables:0kB all_unreclaimable? yes Balloon:0kB gpu_active:0kB
gpu_reclaim:0kB
[   40.336202] DMA32 free:34808kB boost:0kB min:11028kB low:13784kB
high:16540kB reserved_highatomic:0KB free_highatomic:0KB
free_mapped:11032KB active_anon:0kB inactive_anon:1487720kB
active_file:52kB inactive_file:20kB unevictable:393252kB
writepending:4kB zspages:0kB present:2096760kB managed:1991156kB
mlocked:393252kB bounce:0kB free_pcp:42404kB local_pcp:2460kB
free_cma:0kB
[   40.336205] lowmem_reserve[]: 0 5976 5976
[   40.336210] Normal free:34248kB boost:0kB min:34024kB low:42528kB
high:51032kB reserved_highatomic:0KB free_highatomic:0KB
free_mapped:34028KB active_anon:384kB inactive_anon:4672764kB
active_file:180kB inactive_file:0kB unevictable:1137628kB
writepending:168kB zspages:0kB present:6291456kB managed:6120144kB
mlocked:1137628kB bounce:0kB free_pcp:25156kB local_pcp:764kB
free_cma:0kB
[   40.336213] lowmem_reserve[]: 0 0 0

As far as I can tell there's about ~65M of free memory stranded on
pcplists (in an 8G VM), which would have kept the amount of free
memory above the watermarks and prevented that specific OOM kill.
Although, as I mentioned before, this is a synthetic stress test.
Perhaps in practice it doesn't matter all that much in practice, but
it seems like the logical thing to do.
