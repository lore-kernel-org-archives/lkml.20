Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883581;
	b=l03Y79EFJETgXgsLaoy4KeNeZ0kKV7Rbj197/N1sRU1j/ZxS8xG1FbqWc8YCLUFZ8Ltt
	 7EwbGr12Yulw7/OlSo7g9Fb4fYiwe149BQA+Jbt22xwfGADK4lY5P7brVG9W4zeqBxO0m
	 tO2xVVw+As12dKvN5Vt9PxRouESQEf5/ewncIOeVQOmMztDKMm6HUNuZcIpsk0DMt3N9E
	 516gP1fpq0ZTwgKVNJLg19bKDXjf0MYfk0yON6pTzmzKDVOY2qmAu7VOdOufLQulYpjw9
	 3yV3YgdmwYxYvul2rZKObI0gujqKFv2FmC0gkjQ6MBXA2ZPWc3jn3/UHkVNdm09+Irw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883581;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z/gziC0JLIrvCdp4GmTMosiOJuTAZ2fDyAiYOPUD65U=;
	b=H1WUzJwdnfMRhbxFWO4rJzdQk3yDN74MdLpxjgK0BnfE2csTv/bhd9fx3trMtxbcrINF
	 XQ1IM0YJEPakrVJvbUoqX1lRapSXaPfwx9XkfWo50r5AftVl0LsGML+nbUiBo7QQfhmuN
	 ZEn/S0jvZeFHC7l7BbfaTm2mxbah/dI5R/VkUqW/8eszAmtWSDf/t7KtvrkPE0fCfigxQ
	 o0oQMR1SUi64Ids0ruAkZpKdveAGAV1/lnICiooeZyHMXSw/SSDMgQNqJtDWc7OPEjqEM
	 wcE/vwIfTiVTUhl7LDV5yn0TErv1PBTSQbqhtv9rNMhBtxOOKR/2JEMJhm40dKB3MUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RYGzJ9/p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4688606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYGzJ9/p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19611F000C1;
	Thu,  5 Nov 2026 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883580;
	bh=z/gziC0JLIrvCdp4GmTMosiOJuTAZ2fDyAiYOPUD65U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RYGzJ9/p0iFShU47y10rrIgFqPZdTiGgb9DmbgiqklepkrzDPFw2kBC9/2zqeWEUW
	 viaCxlogpvwX+3aCC0Sd8lUceLDljigJa9iLlCb9F10Yjlhj3iUQLny2d4YgsfoDa3
	 9/gwNyB3H1+V9zLO+cNJVvrzMZehr/KQStMXx3w7NBURr+o996im+MYc36G4g+NxEN
	 se/C/q0CTuMLefGDtpMkVF12OHR0TuBO1Ct6i9ir8QX5vXEXIKFI4HlBRW8n78msRp
	 hj62W4vFhO49wxFNmhDB+OVuLmD4BbTZ7PH5QxouxT1NQe2LKzMLX+QeyIgefcxJfB
	 DoRApwQsIJc5A==
Date: Thu, 5 Nov 2026 12:59:38 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 01/10] slab, kunit: pin test slabs by an extra
 allocation
Message-ID: <auxzbxa40B6uLAyN@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-1-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-1-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:50AM +0100, Vlastimil Babka (SUSE) wrote:
> Several of slab kunit tests allocate and free a single object from the
> test cache, perform intentional UAF actions and validation, while
> expecting the empty slab to stay on the partial list.
> 
> This subtly relies on non-zero s->min_partial. It currently compile-time
> defaults to a non-zero value, but in theory a sysfs write racing with
> the kunit test could change it.

> More importantly, the upcoming
> CONFIG_SLUB_TINY changes will make it possible to run the kunit tests
> with s->min_partial being a compile-time zero, which means the tests
> will now do unintended UAF writes on the page allocator level, and also
> report failures, as flagged by sashiko [1].

Makes sense.
 
> To prevent this in a robust way, add an extra object allocation to the
> tests, that will prevent the slab being freed. Use migrate_disable() to
> prevent migration to a different NUMA node, which would place the
> allocation to a different slab.
>
> [1] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=8
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
