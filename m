Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE1448D14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520874; cv=none; b=HdJv6Unkdf+NUtFWris90QOf5uBZal+ySF2vdnvE22dIuipJR0nUbZOjp2Kgkihe769ZAQtEaIiHY7C7GFNcjA/GqbofpV4IEskLpkSex6NUoCxRCoIvRd5tMbESsnGyj0u/TSbhv/S+GxQzkS1P16/x2Hx0ekSBnvs/KXWjro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520874; c=relaxed/simple;
	bh=NVynwhXQK6HX76zat+SCF/4nOQytl2z70Ij9SHcNq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+VHNixIY5jgj0t3OyK5cxOSRBuzLXUKYLqC3RmaIPm4AAOA5wTKu2t7p2bwOZRfPLIXvm4xaKGVJqF81QesDNbtQmTQlgaI7sWiPtuwNLc71NqSzwJ1nYrb4NKdD3N22XRkOHla8GdlBmDxN0pgSqG2vu+cdcZJUGLK2M+fJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YUbJQ7I2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YUbJQ7I2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484392e3d33so525340f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788520870; x=1789125670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vUJDxGrlaCkyExJEdPQB5RU8TkXl0JZWU/oumMAWGE=;
        b=YUbJQ7I2eifWSLtFA/uyHvjnUAVkyYLO5j1C/OOWwjoyrlvMfZYcfKYQ8f18IJuVOM
         PYzGwXR/TJ/vuXOUys6H7FhGp52VTgxImAt6ZPxd7OFUUau2ZhB/VWdabrJc6JFOXoai
         7mgi3xrSOIB0HEqj3Z7zmfkez0bK9Zo7EGK+TNgrZtm+0Hrgp+OY5rZJdguwDlCt0E8M
         kOi216qzOEgGjUSFNVyTnbhnCH2800uLag7IFKiJtVruj0rtyoZVJ2AGzpMgZZKn4Fti
         qpxbGLzy45vibzdLzEPe3pEZ785CbPN+IxGgJIic2hDHJOuiG1TNQvQhVinrQ9HgYu1p
         9EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520870; x=1789125670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/vUJDxGrlaCkyExJEdPQB5RU8TkXl0JZWU/oumMAWGE=;
        b=jfFquLe0wrd4lUXEzmBM9yINtp8eBucOiZwsRAMtaiGvS4Nz+ZbQTzUtaPCfV6bdkt
         vi/gEwRSog+8amFAPbDhvMm093AsTIZk3/6X1BFpC5zAL7zeLCeFKO0VeEBiTAnZoYA5
         HTLSLk2uNJJItbLqxRSYMWdj9GYzaTtHLkRjTfXNN3cleiadBT2JlWDQPB+3/5iZgCsS
         L3zQQq7Z1N9MHraXOtTw92ojnxn3MgH4osMf6iAYjlskmdegP/J3odD9FRUQsFB994oH
         FTFSA7yIMML9QDfcg+SSuJDynSXomRbUb/vcG4bTjuJIyZN/2WJ0mZDx5kEYLVpReuk9
         WWjg==
X-Forwarded-Encrypted: i=1; AKwUvBwX4nePdq9ZaEBZfGVXoRwuTVnVhU0XeFHZkWzr19cTAmKCbVxRMUQOOdVTx6SroNPCnclvOiCfRgSj54Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lJrlS7vq62wS9eMr+wrPJspBJG8LolffvGYSCekcXwoy5RebTA
	GRM995Owm1JSP24ZXdmjleexHL6lvBkZfH+pwiF93AuAQXsCxVotpRa381cHuYNeQ4w=
X-Gm-Gg: AYBFou3wByxi5la+iPdL9wI5v0PUb2CUSJk0qIdXLUANErSAU804XbwA5HxuVQ+iKpk
	jth+lwTY+rxf09SCJ4uQ8uRasb4ZQ3l9Re0Tu/3xfBmdcArn6sdAsoiwbAQJHBABwAOFcSog0SB
	FMpOhim9iCiSI9A8wM0AgPMgYk5BgKrcME3vr12sN/1A8f0Jwl/iyGKUXL3E2JKh0/2iDBSegg5
	/I77Zar0EAhHjeDAM4Vk5xYWZpptR43JxspbCi01WN0QMFNVl4G0RLvskYGWBVmUxd0SWmaQhEu
	IX1zUBy9ArLbvTynRPaGj9n7Yf5hCfcsRz1ePYowc0PvwEwDKRtAaltaNIylgt1e+jzIk7wg8av
	G8Fgc2yjEGifGDo+DUJ5J2VV+49zRGmAd5rhH5AZpPtMSilrx5opR5It20oi14/em/wai7Ov7lz
	1png8LvPQLk4HMqMlbNazc4mKHXhyM/jDrQpPxd4S6ZBNonXvoY8KonMMFkyuo6dq6MVVLPN/+V
	A==
X-Received: by 2002:a05:6000:1843:b0:485:8c17:975f with SMTP id ffacd0b85a97d-4858c1798damr2665575f8f.33.1788520870405;
        Fri, 04 Sep 2026 04:21:10 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm5223760f8f.31.2026.09.04.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:21:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:21:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>,
	akpm@linux-foundation.org, mgorman@techsingularity.net,
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org,
	quic_pkondeti@quicinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <apqppFukssaAQz3w@tiehlicka>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
 <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>

On Thu 03-09-26 07:03:33, Yosry Ahmed wrote:
> On Thu, Sep 3, 2026 at 12:27 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Wed 02-09-26 16:49:48, Yosry Ahmed wrote:
> > > On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > > > pcp lists are drained from __alloc_pages_direct_reclaim(), only if some
> > > > progress is made in the attempt.
> > > >
> > > > struct page *__alloc_pages_direct_reclaim() {
> > > >     .....
> > > >    *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> > > >    if (unlikely(!(*did_some_progress)))
> > > >       goto out;
> > > > retry:
> > > >     page = get_page_from_freelist();
> > > >     if (!page && !drained) {
> > > >         drain_all_pages(NULL);
> > > >         drained = true;
> > > >         goto retry;
> > > >     }
> > > > out:
> > > > }
> > > >
> > > > After the above, allocation attempt can fallback to
> > > > should_reclaim_retry() to decide reclaim retries. If it too return
> > > > false, allocation request will simply fallback to oom kill path without
> > > > even attempting the draining of the pcp pages that might help the
> > > > allocation attempt to succeed.
> > > >
> > > > VM system running with ~50MB of memory shown the below stats during OOM
> > > > kill:
> > > > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > > > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > > >
> > > > Though in such system state OOM kill is imminent, but the current kill
> > > > could have been delayed if the pcp is drained as pcp + free is even
> > > > above the high watermark.
> > > >
> > > > Fix this missing drain of pcp list in should_reclaim_retry() along with
> > > > unreserving the high atomic page blocks, like it is done in
> > > > __alloc_pages_direct_reclaim().
> > > >
> > > > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> > >
> > > [Sorry for thread necromancy]
> > >
> > > Hi Charan,
> > >
> > > Are you planning to respin this patch?
> > >
> > > I know that Michal was questioning the need for it. While doing some
> > > stress testing I came across a couple of OOM kills that had significant
> > > amount of memory in pcplists. Something that would have been prevented
> > > by this patch.
> >
> > Could you share some numbers to see the scale of the problem?
> 
> Sure, here's a sample from an OOM log (ignore mapped/free_mapped, it's
> from the ALLOC_UNMAPPED series):
> 
> [   40.336188] Mem-Info:
> [   40.336195] active_anon:96 inactive_anon:1540181 isolated_anon:0
>                 active_file:51 inactive_file:0 isolated_file:0
>                 unevictable:382720 dirty:43 writeback:0
>                 slab_reclaimable:20339 slab_unreclaimable:26597
>                 mapped:382858 shmem:153 pagetables:8291
>                 sec_pagetables:0 bounce:0
>                 kernel_misc_reclaimable:0
>                 free:17264 free_pcp:16890 free_cma:0
> [   40.336199] Node 0 active_anon:384kB inactive_anon:6160724kB
> active_file:204kB inactive_file:0kB unevictable:1530880kB
> isolated(anon):0kB isolated(file):0kB mapped:1531432kB dirty:172kB
> writeback:0kB shmem:612kB shmem_thp:0kB shmem_pmdmapped:0kB
> anon_thp:10240kB kernel_stack:2576kB pagetables:33164kB
> sec_pagetables:0kB all_unreclaimable? yes Balloon:0kB gpu_active:0kB
> gpu_reclaim:0kB
> [   40.336202] DMA32 free:34808kB boost:0kB min:11028kB low:13784kB
> high:16540kB reserved_highatomic:0KB free_highatomic:0KB
> free_mapped:11032KB active_anon:0kB inactive_anon:1487720kB
> active_file:52kB inactive_file:20kB unevictable:393252kB
> writepending:4kB zspages:0kB present:2096760kB managed:1991156kB
> mlocked:393252kB bounce:0kB free_pcp:42404kB local_pcp:2460kB
> free_cma:0kB
> [   40.336205] lowmem_reserve[]: 0 5976 5976
> [   40.336210] Normal free:34248kB boost:0kB min:34024kB low:42528kB
> high:51032kB reserved_highatomic:0KB free_highatomic:0KB
> free_mapped:34028KB active_anon:384kB inactive_anon:4672764kB
> active_file:180kB inactive_file:0kB unevictable:1137628kB
> writepending:168kB zspages:0kB present:6291456kB managed:6120144kB
> mlocked:1137628kB bounce:0kB free_pcp:25156kB local_pcp:764kB
> free_cma:0kB
> [   40.336213] lowmem_reserve[]: 0 0 0
> 
> As far as I can tell there's about ~65M of free memory stranded on
> pcplists (in an 8G VM), which would have kept the amount of free
> memory above the watermarks and prevented that specific OOM kill.
> Although, as I mentioned before, this is a synthetic stress test.
> Perhaps in practice it doesn't matter all that much in practice, but
> it seems like the logical thing to do.

yes, pcp lists are quite (unusually) high. Is it possible they simply
got repopulated after the first direct reclaim run? Or is there
something else(odd) going on?

-- 
Michal Hocko
SUSE Labs
