Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C7A443C22;
	Fri, 11 Sep 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125048; cv=none; b=euyB9ajUrU8MYglGdiXuBoS59Tg6TJ9Q0NuHT/GzuTYwMXAKjV4ZmO0A9KQmDB03Vocbf0ooC42FlTIqArSzdUW1vVRlLtw4qs2U9ERyK5biMFh0o4sJSI2zsMF9vnFp2zCyhUGgg/sY0MyPfdgibjJqbMHXm/qEop2WaJWPKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125048; c=relaxed/simple;
	bh=SbjWx5GGOic8mYPwlQV5hJXTJJoGvqSbM7MyodcEElI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYkI6CXwq0VnnIRKpjhdl482cz6Mw1XvQsxQ8so4OIWyrYuuHS9uarUdHFEq/0Wdh5Mgv3RUSE93bwGVCzMW18Ul2KomuUmA9635VRhF3IP+wxGUma4NXp8fuG/y/gfZ0Kk7wI7k4r+zN6bSMGzvgVp6B1zI+/Zh+MSYv+khMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/c+qFhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/c+qFhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC01F00893;
	Fri, 11 Sep 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125042;
	bh=SOHnzJY8zoaiZvHpHO0QM8mcDeIkQPrxEZz8rSneVIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/c+qFhxD20GqIbFToMJMf/3OEJTO8Zt02a1EHl9g+WuvtTnQcvBmYWeS9rs4soLk
	 YPLaZCkzRNQ2CllBH/SJwdb3mfBQcmBrLxkTNK3Aj6bbavz8HHLc3JqColBpJn12Rl
	 eCNOgXQ6reGJu7ZXrrd45MV8rODJeXLAsEffal2t33SAIS2mQM+GzCwHBjOQnH8RQ3
	 28e+/AVvvd3QwJTKtF6k4qIu/QIjuWMFwA+NfoqxuIDExhWYUlpRxpQ1q/Eu+Qm3UF
	 2nIUpWB+SUiC0H7zA2NyIIW7MN9dEorrXLzYITdkdHdE6DfhR789d9AhDErogP/9fw
	 4iawhW/J8MX9Q==
Date: Fri, 11 Sep 2026 12:10:40 +0100
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm/slub: preserve one previous object lifetime
Message-ID: <aqPDpORERiVkBmBf@thinkstation>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
 <20260813161244.74476-1-pengpeng@iscas.ac.cn>
 <aoLcw91-afP2Mjtb@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoLcw91-afP2Mjtb@fedora>

On Mon, Aug 17, 2026 at 06:30:51PM +0800, Hao Li wrote:
> On Fri, Aug 14, 2026 at 12:12:44AM +0800, Pengpeng Hou wrote:
> > SLAB_STORE_USER replaces the allocation track when an object is reused.  A
> > later stale free can then replace the free track as well, leaving the
> > report without the completed lifetime that created the stale reference.

Can we explicitly mention "double free" to make it more straightforward?
It confused me twice already ;-)

> > Store one additional alloc/free pair.  Before recording a new allocation,
> > copy the current pair to the previous slots only when both records exist.

Hmm we should probably instead:

1. Copy TRACK_ALLOC to TRACK_PREV_ALLOC before updating TRACK_ALLOC
2. Copy TRACK_FREE to TRACK_PREV_FREE before updating TRACK_FREE

I feel thinking of one pair as one 'lifetime' adds quite some confusion
because TRACK_ALLOC/TRACK_FREE sometimes form a 'lifetime', but
sometimes span more than one lifetime.

> > Keep the current free track intact to preserve existing SLAB_STORE_USER
> > behavior during the reuse window.
> >
> > Print the previous pair when available.  These records are diagnostic
> > history and do not infer semantic ownership.
> > 
> > Assisted-by: Codex:gpt-5
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > ---
> >  mm/slub.c | 45 ++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 36 insertions(+), 9 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 0653def0fe36..355fbffb981f 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -1113,12 +1130,22 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
> >  
> >  void print_tracking(struct kmem_cache *s, void *object)
> >  {
> > +	struct track *prev_alloc;
> >  	unsigned long pr_time = jiffies;
> > +
> >  	if (!(s->flags & SLAB_STORE_USER))
> >  		return;
> >  
> >  	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
> >  	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);
> 
> When object is in allocated state, under normal case, this "Freed" line
> duplicates with the "Freed" line under "Previous object lifetime:"

Good catch!

> Would it make sense to add a check here? something like:
> 
> if ("free track" isn't the same as "prev_free track")

Perhaps it's better to never make this condition true to avoid
confusion?

> 	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);

Pengpeng, do you plan to respin this?

-- 
Cheers,
Harry / Hyeonggon
