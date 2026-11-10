Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320358;
	b=qucKcqYdxmtr06gACmqf8NovBVMi4/qDQXMjgWWLPYrF7NWjGVXLqBmfexeeNUuDQHuP
	 fpdpOt0JtU+ELnuD21oOFI5Wz6n2ZOlcBKEOSmsmx8VBlobul6+Xy9CqCQhFcul9MOG1+
	 qThN2ugidMYF1Iqcu/xP/io6i6IkPQ0Gttr8ZBv4kXcCxN6CZtHBY2UssKd79wjpBF0kU
	 W/Ku8WVwsOHz8WfjiRU9VUW7XWGAKoXa/6p8wuYvjIkRNdyWmRW41QIx/GUCRy6UK1COe
	 239fXloIdgfVuIn8JQRSINjX5r8zzm0jl8XdLFlLKTdAkc7WCMh6YwtA/qM7mDpz9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320358;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NswPdYD+4dmbwkzDe2um0c4vj/yM8sDWJj139ef1Kl8=;
	b=Mwmfzmm1/WsKqx2Hj6TfGsdALqsfSWmq2d9fQeeov6gKu6HvShkxLHwemILlb0yANYSs
	 9W/COaDdBesqg6kUkuuO7utlzAMprf5qIzRifr6BoAh4FDKzpCLyLxisNk4/bVX01ndYO
	 +cOh55a5uonW3mXgoLXqybFpxClYOKNJGUSjeIUiBGQT35VLWXuWqh3vjs2LprftgSkvG
	 aFa5oc/GiAXCqk+nVkv0CRyMbMcWfF1zS687hZ1m1U3Q9Bj5BuD9SJ0n23ZxbzFPNM/cH
	 I6ylMkaDZj91madjdmw2pzOPRAq83cIuKRUEUPh7YHJrvky3Lgk/OzHmi7RcAplfh1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H6h6dNkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CAF606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H6h6dNkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A661F008A4;
	Tue, 10 Nov 2026 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320357;
	bh=NswPdYD+4dmbwkzDe2um0c4vj/yM8sDWJj139ef1Kl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6h6dNkHfWawjmJeLOrTrBqKVCIjAE15bg6/SHpyCmk/j88xtvRteVi8bf4il1gZY
	 bZsIE5MekScVaw9uVsxTA5JBppNVKBuEEgUStb8DM4Y9SVPY04nITL58cs90uLnx1U
	 xbW1OJ5YwYKS9T8NmL58RLRoaFnklglpoYR7UuSFAzZjDb4tv4tZBmzA/zXdDu/XNw
	 R5CefROFZMzj9bIiMKlrZMFTRdYwegXbq6id6pZJ7aqt1UtNFWoNg2yq6QFNT/lNra
	 ftv1oeNQZO+LwXtRjT4jognUa8U98x1bKxIo66noOm/9Nlr4/jd0TI3yG96WKJGrIE
	 1MIUOVan+sgFQ==
Date: Tue, 10 Nov 2026 15:19:15 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 08/10] mm, slab: remove remaining compile-time checks
 for CONFIG_SLUB_TINY
Message-ID: <avMmmt4_pkknitPX@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-8-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-8-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:57AM +0100, Vlastimil Babka (SUSE) wrote:
> Remove several minor aspect of CONFIG_SLUB_TINY to allow it to be fully
> a boot-time decision:
> 
> - remove check in cache_has_sheaves(), with no change to functionality
>   but only on code elimination
> 
> - remove SLAB_SUPPORTS_SYSFS dependency on !CONFIG_SLUB_TINY, thus
>   /sys/kernel/slab will exist as long as CONFIG_SYSFS is enabled
>   (for now leave SLAB_SUPPORTS_SYSFS around, can be cleaned up later)
> 
> - remove the control of __fastpath_inline so it's just a wrapper of
>   __always_inline. Leave it also around for documenting the intent, can
>   be revisited later.
> 
> - remove a comment for SLAB_NO_MERGE as we don't want new checks for
>   CONFIG_SLUB_TINY
> 
> This leaves the only usage of CONFIG_SLUB_TINY in slab code to set the
> value of slab_tiny_enabled around.
> 
> net/core/skbuff.c keeps using it to control SLAB_NO_MERGE but that can
> be dealt with independently after the config is deprecated.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
