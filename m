Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890953;
	b=rdDBodfxYNufGpjTSGplPOTKCCSOa3MMzT6wMCJ7HhhZYly3zH4xvbhzw4LmQZvmQ7j1
	 U1PhUm9FvxNz8kiWG1P/XY3WrdAlwAOdk+iIuEFeUdbsi8iLD3pgrBQyPHoGbbX8FmCJq
	 //yOYP6cK0Y6nA6sMfXNXqzyvTLhndT3xy8UmnOxj0f+Uokz7G+pXpl9C1ormGaVgOPsq
	 3TNn8XuW7oHrtRLNl8EUZaoJCLLjIeecwqebTzOvtE65Lyhct5Y94cq5eIftzY3vYgMuK
	 1br2Jns5darep898LMwo2RVDrnT0zwFLA2Pz71b7IuTH6yHbrx9geGO8eEjjvJ16Piw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890953;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3u/QstQSJV0UAJtzHBVB+ScC/OFteWXsBLmgkvMVYeg=;
	b=w24XDJfZ4HJyNHVBTmboBKMksqXfJP1YWhhUWuCPPbtYwLHbvAL9wtbDRi1b0ZjYxjFv
	 XNZfvV0BxSKBWE27xGy3Ku4KyFwSAbS59UQvexcKJqqWGVaTLbq9HpIDde1g7YicHi265
	 oQXE3a3CyXDQXFPsYsLLntm5L3mTnfC692Bf83/5f7XpTVXoA8J5L6dOczQC6wN3gN8tR
	 +W4TdKgvMFJKCNtyk7UV5AmhZQrRqIf6lVLGOHCLB401tni6/MWDJgFXG5LkhZHrxHX/7
	 n4rSA/iBQkYxz8c4/sTzCSmOrf5x0jXxkji08+I3fCNah+2Iyxf+XWkaE2AJvxAz02A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3f015KA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B7606EE92
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3f015KA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3151F00919;
	Thu,  5 Nov 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793890952;
	bh=3u/QstQSJV0UAJtzHBVB+ScC/OFteWXsBLmgkvMVYeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I3f015KAlphpMgxVJXHJjEj6LUkRUNl0e35EHpz7Bf+r0lLG5tpJ0rhDUpJmC2vUh
	 OgoFNWSQ23Zp3jChLiM9ItZ4AYJvFqDuPvOCQyZVIQJMi907dQsjOwuHxs6blN/ujZ
	 kKSUx+5KOd7BRdPiKZsYPXbsy25uLTdXsYxBz4OJqQbnzT28Uh7PsFMG4EoZzVyGFx
	 1T6CUjcRXNk/HshtQymxX/A5RgvQ+TMYsFplJO70khw5+qgx/7OmLUq50tTAhBXMuJ
	 Il+hnBRlB0G1Viyx2soDl9tb15sFDxcjbasPKLv/XSVlKf3ABMDet0FOdhfMmHQSsU
	 J8ttzRttzxbWA==
Date: Thu, 5 Nov 2026 15:02:30 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 04/10] mm, slab: introduce slab_debug=N
Message-ID: <auyVRU5abrWHVfgM@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-4-0484ce59eabb@kernel.org>
 <auyFYsbsMm8qGThW@thinkstation>
 <7ac409a1-fe3e-4b37-8130-4d49ecb6106a@kernel.org>
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
In-Reply-To: <7ac409a1-fe3e-4b37-8130-4d49ecb6106a@kernel.org>

On Thu, Nov 05, 2026 at 03:36:25PM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/5/26 15:30, Harry Yoo wrote:
> > On Thu, Nov 05, 2026 at 09:43:53AM +0100, Vlastimil Babka (SUSE) wrote:
> >> Enabling slab_debug has the side-effect of disabling all percpu caching
> >> of objects (now via sheaves), which can be sometimes useful for saving
> >> memory for e.g. kdump kernels. To make this possible without the
> >> overhead (CPU or memory) of actual debugging options such as poisoning,
> >> introduce a No-op debug option that only forces the debugging slow paths
> >> and zero sheaf capacity. The new corresponding slab flag is
> >> SLAB_DEBUG_NOOP.
> >> 
> >> This will also allow reimplementing CONFIG_SLUB_TINY as a boot-time
> >> option.
> >> 
> >> Two details have to be considered, as suggested by Harry Yoo [1].
> >> 
> >> - While SLAB_DEBUG_NOOP is part of SLAB_DEBUG_FLAGS, it should not
> >>   prevent cache merging as it doesn't affect object metadata, and lack
> >>   of merging would go against the memory footprint reduction. Thus
> >>   exclude the flag from SLAB_NEVER_MERGE.
> >> 
> >>   - However add the flag to SLAB_MERGE_SAME, per sashiko.
> >> 
> >> - SLAB_DEBUG_NOOP alone should not request disabling printk pointer
> >>   hashing. Thus rework the call to hash_pointers_finalize() to not rely
> >>   on the slub_debug static key state. Instead determine whether the
> >>   global or per-cache slab_debug options include any flags that are not
> >>   SLAB_DEBUG_NOOP. This does not change the fact that caches created
> >>   with explicit debug flags (i.e. slub_kunit tests) later in boot have
> >>   no effect on pointer hashing, which is determined in
> >>   kmem_cache_init().
> >> 
> >> While documenting the new N option, remove obsolete SLAB references from
> >> the F option description.
> >> 
> >> [1] https://lore.kernel.org/all/arUx56ee_nkxYP_f@thinkstation/
> >> [2] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=2
> >> 
> >> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> >> ---
> > 
> > With the sashiko report to this patch fixed, this looks good to me.
> > Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
> > 
> > One nit comment:
> > 
> > specifying SLAB_DEBUG_FLAGS depends on CONFIG_SLUB_DEBUG, and with this
> > patchset there is no way to minimize slab memory usage w/o SLUB_DEBUG.
> 
> Maybe not at this point, but unless I made some mistake, later slab_tiny=1
> stops depending on SLUB_DEBUG.

Ah, I see. Right.

> slab_debug=N itself does depend on it but I
> think that's acceptable

Yeah.

> > Sounds like it's time to make SLUB_DEBUG unconditional. It's enabled on
> > all distros listed in kconfigs [1].
> 
> Yes it's my plan to do that next, I did even discuss it with Christoph at LPC :)

Sounds good!

> > I built kernels w/o SLUB_DEBUG and the difference in the kernel
> > binary was about 40 KiB.
> > 
> > [1] https://oracle.github.io/kconfigs/?config=UTS_RELEASE&config=SLUB_DEBUG

-- 
Cheers,
Harry / Hyeonggon
