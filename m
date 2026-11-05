Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889003;
	b=kZrNsN/D+PWw9mK8NtRd+ijqdtP/D83M5c64LkBZZUg0XQs9FTRAceYBwsT0m6VwdwZj
	 HZDZVM9Rpj1yKQUK6ISD7ZCsmcOPeCsJ0mFY8EEdfmcH9J+GEy68EFzCYXkGoK4V9APib
	 6tN/KVD1uQadhzXD2LNCBlEtLLnlbOgALP7qMZ6CGbA0ztogJt6DWBX4Ui6pZFOOoMSh/
	 nGuUItrUISt2yRJlprkFl7yBjyrjI1CiHJovns6p8XrqbRwa5VyoO78hBpNC71061yVLe
	 NMimcDJaaGZ55ioWnBYX6nXMbRvtMipagmmSMHJ435eJI+VdXYifx9jBRqO1ixBvn/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889003;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QBN5F5BOBNYgA8RLkTPielNH7SMCn60Of7vIVfmEPko=;
	b=TQUG93FUvVeimKeXEPimPdYURjJnYZbpjoMCXrIPjrR0wHqlSIny4MAtqPiI4wtvGd9o
	 4jASvujAQlqaUBiK78HbPKe3E6GmXOOob0fXjk1kKCjY3NDMPVcCHwM4Jo4S/0/pCQ81Y
	 g+kdNfJzHjz45FvXWMQoc2FKZ5+nWE2KHV+y4cRC00NpDXhpWcb0AL+jNl13Jxu4feWMg
	 dYJGFGC1MhlVY+GnJHrPWiuNT2U9mpzLVUJjtGywb024HQ0oIFrdkT0/yRI2LWr5TZhIo
	 GD2sEaxmdxZZr2D0u8m3OxLd8a2x1PWQDIEq+3/kc5TRZ4wv37QoKhsnb/2VJ/ZdqmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlg68ev4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A90606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlg68ev4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF87F1F000C1;
	Thu,  5 Nov 2026 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889002;
	bh=QBN5F5BOBNYgA8RLkTPielNH7SMCn60Of7vIVfmEPko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlg68ev45M9aQCUBa10+14y+e8dqXHO++KTG1+LuUiU158SYUynD0Eishqwm2z4pp
	 AtnjTu4rRwePPNr15mLDhe7+uQWzQNkjQKHSyvx44Yvqanq0rOTWVMkt6NGPAvCM3J
	 zFFgnX4nA8YjEYm9Qm7cIdDCvyOeLNtnsoouIgiIW90VHPLBMmXypquFsGcE0/dPzE
	 Akszo7FcyBFhbCuRgXulTqFU8SedmiTu125WAgPh9tX3xN+DLsA+5P/nNuVrlhdvGV
	 T1ft5Ph55jM5rSTVMoo7Jh0K+iUHBLyfLPVGUriuZg0u3+Xu4OEQBTePSqYvoN8ZR6
	 dqh78QkFR7BIw==
Date: Thu, 5 Nov 2026 14:30:00 +0000
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
Message-ID: <auyFYsbsMm8qGThW@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-4-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-4-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:53AM +0100, Vlastimil Babka (SUSE) wrote:
> Enabling slab_debug has the side-effect of disabling all percpu caching
> of objects (now via sheaves), which can be sometimes useful for saving
> memory for e.g. kdump kernels. To make this possible without the
> overhead (CPU or memory) of actual debugging options such as poisoning,
> introduce a No-op debug option that only forces the debugging slow paths
> and zero sheaf capacity. The new corresponding slab flag is
> SLAB_DEBUG_NOOP.
> 
> This will also allow reimplementing CONFIG_SLUB_TINY as a boot-time
> option.
> 
> Two details have to be considered, as suggested by Harry Yoo [1].
> 
> - While SLAB_DEBUG_NOOP is part of SLAB_DEBUG_FLAGS, it should not
>   prevent cache merging as it doesn't affect object metadata, and lack
>   of merging would go against the memory footprint reduction. Thus
>   exclude the flag from SLAB_NEVER_MERGE.
> 
>   - However add the flag to SLAB_MERGE_SAME, per sashiko.
> 
> - SLAB_DEBUG_NOOP alone should not request disabling printk pointer
>   hashing. Thus rework the call to hash_pointers_finalize() to not rely
>   on the slub_debug static key state. Instead determine whether the
>   global or per-cache slab_debug options include any flags that are not
>   SLAB_DEBUG_NOOP. This does not change the fact that caches created
>   with explicit debug flags (i.e. slub_kunit tests) later in boot have
>   no effect on pointer hashing, which is determined in
>   kmem_cache_init().
> 
> While documenting the new N option, remove obsolete SLAB references from
> the F option description.
> 
> [1] https://lore.kernel.org/all/arUx56ee_nkxYP_f@thinkstation/
> [2] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=2
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

With the sashiko report to this patch fixed, this looks good to me.
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

One nit comment:

specifying SLAB_DEBUG_FLAGS depends on CONFIG_SLUB_DEBUG, and with this
patchset there is no way to minimize slab memory usage w/o SLUB_DEBUG.
Sounds like it's time to make SLUB_DEBUG unconditional. It's enabled on
all distros listed in kconfigs [1].

I built kernels w/o SLUB_DEBUG and the difference in the kernel
binary was about 40 KiB.

[1] https://oracle.github.io/kconfigs/?config=UTS_RELEASE&config=SLUB_DEBUG

-- 
Cheers,
Harry / Hyeonggon
