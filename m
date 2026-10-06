Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2A73EF0BD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289950; cv=none; b=usxarXppSBfCMcLl6rOlz2godXxTH8tz8BiQc9Z1Y7ujbXassfKIxJbtWz3kGgMSrfkPlsYMmC2EgRzb1xaZ0O6qSlWMigLM2eRLOXp46BOMsCer5PV59HVXPBY9Rl2oHX90Wq6NegLYnEyraVlWcT+iwttQ9cqGXNr7k9wLMR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289950; c=relaxed/simple;
	bh=nXOfDn4KEb0ZRHsBf8D5SWwj6+kjfcLqNo0zqeCTz64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzW74eX+NmcOn66QXjH7Y84HRoM0jTa98Fp7qwoQbr/c5Mwl88m4OROTPmJPqHa+228aGlBc5YXsZypZS8yH8Rt9OLo+vFWIPjTXkijlTwF207pfWutoEg/1xRB4LZDiHtyJjvsd5EjEi2YiNAQmFDWMsrowHmFMDp6RF6Wt/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGNycR/D; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGNycR/D"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so2723789a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791289948; x=1791894748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HKRIiBlfoiGul+mMoQpEEjIcPaSF4T8zm8QS66XhNQ=;
        b=mGNycR/Dec+13DVA93FlxBFT5y3i4PtT2b7ypWY0DMmieZXOE28/Z1e6B5zEEilGBP
         FTHHdpioSBROSJqGmerzgess8opa9wgH9PQwlboEyTk9mmHV3/mfDqPw0CLTJf1koHKL
         evqxTOf/8qFbtAjB/ODZYamjOhD+zma8W06spoCiYXD/opfSykriUB1gejcJ/uEJnO4v
         4NnHb14cDS1xwrkcoawIaywHjJ6Rz+RktHb7HqcCzRVtFyELlJQLYl8iLP0HDccSJ0z3
         Wo9pQsaGN5oIT7BOWMk9hssBwAObpf0s9L5ubUpHmh1brqpUwU/KB1TOeSxjD8lBi2Od
         fV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791289948; x=1791894748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1HKRIiBlfoiGul+mMoQpEEjIcPaSF4T8zm8QS66XhNQ=;
        b=H+fy14kPM7mTpWybrFCpbeAWVwpafDKrhcyoooHLpmh8i5b7Ll/TYxgVT4amf5F63U
         BtuewdhjPn+h/d1U3/01/DY3KT17E/3k3hA06Zgu0mlEUDLinEXgM8XCoufs2HZ94R+/
         KS6Acpbw6meDhIzshMJwU1ucE8/3lGVYxqouJRVjuOV2qVBuvhIfmzfy3rZenVuqQhJo
         aNRbGfPXsFIZdjlcKKru91AYzfDFwSIO+pt4r52Gdb84KEViW3HDM6qPCrIcta5w3eaJ
         8puBjZ8RqzidvXAOr+wEz/6LOyBNQoBXxQaxKG027VSO8aAEGuBrqwXVA3x735yfTdgm
         QBwA==
X-Forwarded-Encrypted: i=1; AKwUvBwSZ7P0VX1lwtf8r11KkNTcpkVOaDp+r2KSrX00CqQEKQg13ue6+u/O12nWsuwhCqCNeRPoTfKVIJBPIuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv+G6cN3i5Z2Ic9vbc0bQV1KBM9khL/2xfC6pI/2/xMCOWNSbO
	9Hi1zS8/s00X6X42tH3pQf3LPj0hsENWXOFTe557Fkjg3dq/1OX7WRm8
X-Gm-Gg: AYBFou2kGlSGDnifSP6Qq6wOtzdeA1fa2kflr5cb5OP5cjw6pkh0FV0HZTiF2O2DF1g
	ziuZz3Y12C9nHwBhjFxUtDfkQWt0q3PlFe3svAs72UwJDGO3TOkggEh+8aBEYXeJHa9+wztriNm
	zHaw3kwcT3Ko3QdiBQxsTNofAaqnWrGnGHT1Aeg2jKClI7PG3qBFHN5fUqS0b63MVxilH2dfiNH
	FZDMFVN+Gu3ySZN/70l3iiFl7l7G5HPx1trLgLnrDwyEiwfx4ytO7iuJ9e6xG4TBUfG26+4eaiu
	tkb7vam9uBy7UH3Hj6/55WNZ39HoeXcoSOXlSvbutPNORWJQak/uL6Rv5DvwL3X9s9T/vtB3zHf
	5Cn+eTdaeigQ43kNBy/DNBkeDiinp8iMgiFvoPxm28TEX6nLijVZGXCG8tX82G4hGnOEovAKaov
	ARcE7Jrkz4p3rx2NuZuxKC6c/CQsr7FC1e9R2ebfNBAELLvxGFJV2ige/D6Fo7pjUoH7/fkwsXT
	lpJmQRBFsDY8A==
X-Received: by 2002:a17:90b:17ca:b0:3a8:748e:c422 with SMTP id 98e67ed59e1d1-3a8748efef9mr1039769a91.8.1791289948330;
        Tue, 06 Oct 2026 05:32:28 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853d00fc5sm4898516a91.16.2026.10.06.05.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:32:27 -0700 (PDT)
Date: Tue, 6 Oct 2026 20:32:13 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	mhocko@kernel.org, ljs@kernel.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vernon Yang <yanglincheng@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] mm: vmscan: don't count per-node proactive reclaim as
 memory pressure
Message-ID: <87a35a80-07fd-4915-82f4-447c61d1b6bd@gmail.com>
References: <20261005062236.564210-1-vernon2gm@gmail.com>
 <CAGsJ_4yKSoCwcEDhtd=biKoUjUX9eTJJhFJGFAZWc=WsAyXycg@mail.gmail.com>
 <4cdb95f5-4140-4116-8247-c04f4b2a5c4c@gmail.com>
 <CAGsJ_4x3n1g1tqxFnnLj8mS46fyYNWQq6goqop+_2QoKO09eeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4x3n1g1tqxFnnLj8mS46fyYNWQq6goqop+_2QoKO09eeA@mail.gmail.com>

On Tue, Oct 06, 2026 at 06:17:02PM +0800, Barry Song wrote:
> On Mon, Oct 5, 2026 at 6:21 PM Vernon Yang <vernon2gm@gmail.com> wrote:
> >
> > On Mon, Oct 05, 2026 at 02:30:36PM +0800, Barry Song wrote:
> > > On Mon, Oct 5, 2026 at 2:23 PM Vernon Yang <vernon2gm@gmail.com> wrote:
> > > >
> > > > From: Vernon Yang <yanglincheng@kylinos.cn>
> > > >
> > > > When the cgroup has no memory pressure at all, writing to
> > > > /sys/devices/system/nodeX/reclaim triggers proactive reclaim on
> > > > NUMA node, causing increase in the writer cgroup's memory PSI.
> > > >
> > > > Due to this reclaim is performed in the context of the write(),
> > > > accounted as memory pressure on the writer, like
> > > > commit e22c6ed90aa9 ("mm: memcontrol: don't count limit-setting reclaim
> > > > as memory pressure"). This is unexpected, the phenomenon resembling
> > > > senpai will appear again.
> > > >
> > > > The Documentation/ABI/stable/sysfs-devices-node documentation also
> > > > notes that "This interface is equivalent to the memcg variant."
> > > >
> > > > This patch unifies the semantics of the memcg and node interfaces:
> > > > per-node proactive reclaim is no longer counted as memory pressure,
> > > > and the per-node proactive reclaim interface no longer produces
> > > > phantom pressure.
> > > >
> > > > I ran demo[1] that performs per-node proactive reclaim 10000 times
> > > > in qemu, writer cgroup memory.pressure as follows:
> > > >
> > > > without patch:
> > > >
> > > > some avg10=31.53 avg60=13.42 avg300=3.31 total=10602985
> > > > full avg10=31.53 avg60=13.42 avg300=3.31 total=10602985
> > > >
> > > > with patch:
> > > >
> > > > some avg10=9.59 avg60=3.41 avg300=0.81 total=2686221
> > > > full avg10=9.59 avg60=3.41 avg300=0.81 total=2686221
> > > >
> > > > [1] https://github.com/vernon2gh/app_and_module/tree/main/reclaim_node_psi
> > > >
> > > > Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
> > > > ---
> > >
> > > This seems to be a valid concern. Personally, I don't like
> > > having the code depend on whether `__node_reclaim()` and
> > > `node_reclaim()` are called from proactive reclaim or page
> > > allocation.
> > >
> > > Can't we check whether `sc->proactive` is true? Am I missing
> > > something?
> >
> > It is also fine to directly check `sc->proactive` in __node_reclaim().
> >
> > I chose the current coding because a previous similar fix commit
> > e22c6ed90aa9 was written this way, and it is also very clear.
> >
> > Of course, it depends on everyone's preference. If everyone prefers to
> > directly check `sc->proactive`, please let me know clearly. Thanks!
>
> I personally think the following is much more explicit than the
> current implicit code based on path dependency. no?

Yes, both implementations are fine with me.

I usually wait 1~2 weeks to give all maintainer/reviewer to review.
As long as no one raises objections during that period, all suggestions
will be accepted in the next version, don't worry. Thanks for your
suggestions!

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a931b576b7d..048ba11852fe 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7997,7 +7997,8 @@ static unsigned long __node_reclaim(struct
> pglist_data *pgdat,
>                                            sc->gfp_mask);
>
>         cond_resched();
> -       psi_memstall_enter(&pflags);
> +       if (!sc->proactive)
> +               psi_memstall_enter(&pflags);
>         delayacct_freepages_start();
>         fs_reclaim_acquire(sc->gfp_mask);
>         /*
> @@ -8014,7 +8015,8 @@ static unsigned long __node_reclaim(struct
> pglist_data *pgdat,
>         memalloc_noreclaim_restore(noreclaim_flag);
>         fs_reclaim_release(sc->gfp_mask);
>         delayacct_freepages_end();
> -       psi_memstall_leave(&pflags);
> +       if (!sc->proactive)
> +               psi_memstall_leave(&pflags);
>
>         trace_mm_vmscan_node_reclaim_end(sc->nr_reclaimed, NULL);
>
