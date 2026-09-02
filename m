Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5A476CD8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348485; cv=none; b=Nxxd84OHwWm82CxHKnpn1C1Oy6fj0fZoIrZoEhIqXyXefTEW3HaxSrtuoOM0e3J6iOt/dqV40CtEdBg2O4qX8rLSEcneXgAfx7mHTjSakSn1vKmjMzOsESsfPK1r/efJUq4LGQSfbBjduuH+Wz70Rot5slo9TsP0shjWj0RJlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348485; c=relaxed/simple;
	bh=/l+qT2GZtfpH3jkbWji2vH6zm0eEwMhdC78X97wO+tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMNrvApWYwhXuM4fufiTDSQ7vgQ+xRP28pr1AV6/Z9z82Bjyzb2dHmU/vGB7jtTE1imhTwirLrExFGlrvMSmi1Ev88HUMkqhMV6uLHgSdF7G1TmovW9OjJfS+AKdEzTaVPZXq5WYnNOG2Hn5isu33joedYiQqc8L4WQDcVO/8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTnS4nix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTnS4nix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D801D1F000E9;
	Wed,  2 Sep 2026 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788348481;
	bh=jOkWaTR/rl0qR/SlR48VncMxFLhFzReZRLMpk5f2CtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LTnS4nix+lkxGZFdMT9owY8sNAP2Fm00l2wZiWUZaMK0WnBxMYzlEkKLDz8j741ax
	 1jTn66jrsywkmyeDPoAedANWTuhkmMGYyMpfyAvVuQMbICNiD5gkvNPhAlBDM1WPob
	 ggnU7wh3w4MhajY559HTtkxyMOOk+JbV0RduD6OBBvSgl7bocO4W/0MCmbAn6/hweq
	 qK7mBz9qxZEZj4qv4Q97QUiRMqGCn2Dp0S02CLG/SuujwoKVfPe/Bd9+a1ws6OqD7p
	 Nn7Yv6ttUysNOgQ34XY0CZFuFalBS0IxW4d2MNMP3pVE8z0HJpPhAFJq5EtmIe4dUF
	 NnJXShK2uI2fg==
Date: Wed, 2 Sep 2026 12:27:59 +0100
From: Harry Yoo <harry@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Hao Li <hao.li@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slab: take n->list_lock for the list_add() in
 __refill_objects_node()
Message-ID: <apgH-QpYrRU1qzX9@nixos>
References: <apPa-cGLcyt90l-E@v4bel>
 <apQU8wjMlvbKBQgh@dev>
 <apQ7osHcRj3vdJPn@fedora>
 <ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org>
 <apgE4TWLFGoqoOos@nixos>
 <apgHa1tISzqsnc_C@v4bel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apgHa1tISzqsnc_C@v4bel>

On Wed, Sep 02, 2026 at 08:24:27PM +0900, Hyunwoo Kim wrote:
> On Wed, Sep 02, 2026 at 12:20:34PM +0100, Harry Yoo wrote:
> > On Mon, Aug 31, 2026 at 02:55:06PM +0200, Vlastimil Babka (SUSE) wrote:
> > > On 8/30/26 16:35, Hao Li wrote:
> > > > On Sun, Aug 30, 2026 at 12:45:17PM +0000, Harry Yoo wrote:
> > > >> On Sun, Aug 30, 2026 at 04:25:45PM +0900, Hyunwoo Kim wrote:
> > > > Since introducing a new variable seems unavoidable, what if we temporarily
> > > > stash this slab in a pointer like below, and then add it to pc.slabs once we
> > > > acquire the lock.
> > > > 
> > > > struct slab *leftover_slab = NULL;
> > > > 
> > > > ...
> > > > ...
> > > > 	if (__slab_try_return_freelist(s, slab, head, count)) {
> > > > 		leftover_slab = slab;
> > > > 		break;
> > > > 	}
> > > > 
> > > > ...
> > > > ...
> > > > if (!list_empty(&pc.slabs)) {
> > > > 	spin_lock_irqsave(&n->list_lock, flags);
> > > > 
> > > > 	if (leftover_slab)
> > > > 		list_add(&leftover_slab->slab_list, &pc.slabs);
> > > > 	...
> > > > 	...
> > > > }
> > > > 
> > > > PS: If I recall correctly, Vlastimil's initial patch was actually fine. It was
> > > > my suggestion to save an extra lock/unlock pair that accidentally led to this
> > > > trap...
> > > 
> > > Ah, thanks for the reminder. This [1] was the original attempt.
> > > 
> > > [1]
> > > https://lore.kernel.org/all/20260421-b4-refill-optimistic-return-v1-1-24f0bfc1acff@kernel.org/
> > > 
> > > I wonder if the fix should be to return to that approach and just have
> > > __slab_try_return_freelist() handle the list_lock. The code would be simpler
> > > with not "bool locked".
> > > 
> > > It should be really very rare that we would end up returning a partial list
> > > and also have additional slabs to return on pc.slabs? So I think there would
> > > be no noticeable performance downside to the simpler code potentially ending
> > > up taking the list_lock twice instead of once.
> > 
> > Agreed that it should be rare and not worth the complexity unless
> > we have data to support that.
> > 
> > Hyunwoo, would you please adjust the feedback and post v2?
> 
> If you don't mind, could the maintainers handle this patch on your side? 
> I'd then move to Reported-by:.

I'll post v2 with your Reported-by: then.
Thanks!
 
> Best regards,
> Hyunwoo Kim

-- 
Cheers,
Harry / Hyeonggon
