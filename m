Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920567;
	b=hHnshdRW19ukerOde2WcGt1RzHdroSYImil8uIaQrISoo0U1BMapmzvWsOi3o/8uOgNw
	 YQZXzouiDpcTnTg03ucrfmnD5WofMMdPh1/kN0hYz1X+mwQoS/+e/tCBba7039EAbppO8
	 G4l+fgZ2nwfJFVG7B7Y10DVg2OxKHYb8LOxuTGwnxd3SrwdseKsAd4zY8l2FvSMp5MAtr
	 NPvPdyLqNhLoNS57gQg7nUnXoof+VLzcc07XZzXFeYY9QtjgqDOZAtlmg7ahSHQ7pNkl6
	 B4T4kt7kfvMouQB+Aca18d0B1On1+vox82swL+nEfYfrNN293GH6D8paU/p4A8R8SZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920567;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NHTczoTsGMT8ANQ9iC8XTxFw5jbc16CYKcnRaKdRcNg=;
	b=k8OiQi7VGUzWrc7OBs8l5ohE98k5qCYVH2lyieUCeGBs5ZWFEnbuK9VZ/vRyX/vgkc9S
	 8rdzHwY/WUN7a6lH5673vrbHeNcJWy5YEia/RlktSAvxST2ONiZ7AqXluB9NQl0MNRDDn
	 645zXek4hWH1rE+obYBFGYAmF9w6z0m1EjRP+KupZh4sT6Dy68C882tiiS4jMSQnw9+/L
	 Q3aJmDMWOfXfMnUvYKjQITfvM80Jto8Y2UaJfoULSPVXh9ya3rGufgaoZqbhHUnNqEYWg
	 npesXWxVFY8Pjid9tFME3IqiF8pFyAFPa1tPGOcWTgHFhATrjTuR9YNWdh1sbtdOvQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfxT8tOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A0606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfxT8tOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A401F000C4;
	Tue, 17 Nov 2026 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920566;
	bh=NHTczoTsGMT8ANQ9iC8XTxFw5jbc16CYKcnRaKdRcNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfxT8tOqXRdUP5ZGhbJ9mvTZb9kVbJlCny4E1YJEXq4QCHqILWvyyL92de395wqXz
	 ZTrkgEVjPKlbgziWlZZ4lU4NGMJvegsJS9UdZVHQqjkki7Eg8n79kHP+P0J14IUu1m
	 qAFCqvOiSA82cYhO0NFWvAkLMME2hOz0vOS/DKYraMWvIMTHiqfxg+U3mtFG8BNRoX
	 auMV2ID2jVLzveFiwbhv6laf8XUc7xNBW/FtCrxj97dZhjmBpX2yKjrgO+s7yWkrz2
	 GJWoW2qpZh7gDEMEwvedgCqZxTby9dujjuZ34/yaCqfCq38tc+6fFdz6QInoX2ekgm
	 AuLwBMwCmpP2A==
Date: Tue, 17 Nov 2026 13:02:38 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muhammad Haris Awan <m.harisawan@icloud.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
Message-ID: <avxPvfV4NxKL58ZR@gremlin>
References: <179489519663.1444496.15875846661591982934@icloud.com>
 <0b565b9c-1462-4fed-8836-9a7d08e4b861@kernel.org>
 <179491109101.4015489.11185824873441987133@icloud.com>
 <f75945f7-82bc-4ff2-92ac-9ec057347a41@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75945f7-82bc-4ff2-92ac-9ec057347a41@kernel.org>

On Tue, Nov 17, 2026 at 11:54:28AM +0100, David Hildenbrand (Arm) wrote:
> On 11/17/26 11:24, Muhammad Haris Awan wrote:
> > Hi David,
> >
> > Reclaim isn't touching the new mm being initialized (which isn't added to
> > mm_list->fifo until lru_gen_add_mm() at the end of copy_process()).
>
> Oh, that makes sense.
>
> >
> > The KCSAN read is on oldmm inside dup_mm()'s memcpy(mm, oldmm, sizeof(*mm)):
> > oldmm is an already-live mm sitting on mm_list->fifo, so when an adjacent
> > exiting mm calls lru_gen_del_mm(), list_del_init() updates
> > oldmm->lru_gen.list.next/.prev under mm_list->lock.
> > > Since oldmm is live, lru_gen_del_mm() has to update those list pointers.
> > The alternatives in dup_mm() would be taking mm_list->lock (plus
> > mmlist_lock) during fork, or avoiding copying oldmm->lru_gen / oldmm->mmlist
> > (awkward because struct mm_struct uses __randomize_layout). Wrapping the

The focus on __randomize_layout is really weird. What, were you assuming you
could avoid it by using offsetof() or something? That'd be an awful solution
anyway?

> > memcpy() in data_race() avoids locking on fork and matches dup_vma() in
> > mm/vma_init.c.

(BTW this reads like it's an AI-generated reply... sigh.)

_My_ LLM says that lock thing wouldn't work without really fiddly changes as it
relies on memcg and you'd have to double-check a concurrent change didn't take
place and etc.

All to silence a once-in-4-year KCSAN report...

>
> Yeah, the only concern I have is that this is the big hammer for any members,
> not just the ones where we expect races.
>
> We hold the mmap lock in write mode, so one would assume that nothing can rally
> modify it. Well, besides these list exceptions.
>
> Let's see what others have to say, but I guess this is fine then, although a bit
> suboptimal.

Replied, but this for me is far from fine, since it means that we basically no
longer have any KCSAN protection against most of what fork does.

Since it's 1 report in 4 years, I think we can just live without it. And I don't
really trust the submitter to not try to slop some broken alternative solution.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
