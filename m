Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742661;
	b=QVG1qUseZbI+lK61KtpNuNwRO/6kGP7x/ejJvWGq9d65AeeUIjwT7CwAHnwfZwxr6m48
	 aFLrDPqS0i8tzhv6+bbcdLY8Kmqy7Tir8o0/MnbSdFXq6h6ShC1uMwOvwh+B3dzu0uYfz
	 Zln+njnP1r76BKp7E3BotPAgFcxgE5O7ajRHPioCxJR+JF8mB2SYJqpF7m/ulbXoakwAf
	 h9H83v4URZIJBELt42xb34jNA5aZa6X91XoS8LC92Vmb10RZZ5bWj6kF0OHlrYAY7KwUD
	 e3P0qcZPiDMuqk7tBbYyYrOJdC1Kme4XLQdtyjxFvM8+nQoo8L2QLCzyRfzJ+YAuQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742661;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IdLhW5v/uXp4ejNif40TjF7Cr8YlsY2rrfu5zrwCz7c=;
	b=NKzl1NGv/gf7cu44NuYoH4aLqV5DdlV6urRPbnj1e2JI2oTUhRxWKck/vCymur4J3RZi
	 Zpdt9Bz7+d18NjB3CQAKE1riYz0zcblrI1c8eirkZNYlp6w4AquPhQG1hAKlL8GaqTjPe
	 YxGCsrD8uGq3RnYQKPDaewVPyAmWJMENGNDlxho02TNjf00N/QyNTlH6uJJNC3Dhu+sQ+
	 o3hRS68wbObk4hevgujtb95N55MhCxM71+rYIUpsn3q/ye3KLxEp0ey1eAJ+WM/iXeTLg
	 6IeQAqvPd2l6YudmD3f7h9gu1sYbqfx5YouFN9eCjNBKU/EDBsvdPyGZDe26kMCd8Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLvHS0z3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D1606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLvHS0z3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F141F031E1;
	Fri, 23 Oct 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792742660;
	bh=IdLhW5v/uXp4ejNif40TjF7Cr8YlsY2rrfu5zrwCz7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DLvHS0z3aZq5esQJCFYVnmr4BZd8HRgdUe7FpM8c/zwhoNvsqtTxGjMcmiUJ954iy
	 4/qivbqF8g3/ACcZlqnn7TNf7fVKzzyHmS80beVWwifppBXCr41RqxdOUVP0yvmsK4
	 z5dMIazWDzhhA6GBnOLndxrdRIbVWdl0R8wsiexT4ZvZYWXKiQNSOpnYySqtCl722M
	 2S1zVy7NeBI/Hlvcq6cT0Adjjwv2wnEW8/Tvwor0Cn8lYHtACdwi35eIJ+bwbjnrJ9
	 70xMSu1I8xSLZlTqeVgfBxKDJxrNtSZotA+PsWNANM9e7IrLI8p53uqS2R+a6A2QUM
	 K7oqvPGi0nEqQ==
Message-ID: <f60ccfa0-088d-46cf-841c-b44546ab3e2c@kernel.org>
Date: Fri, 23 Oct 2026 10:04:16 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] mm, slab: introduce slab_debug=N
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
 <20260923-slub_tiny_rework-v1-2-a0e66d536eb5@kernel.org>
 <arUx56ee_nkxYP_f@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <arUx56ee_nkxYP_f@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 16:48, Harry Yoo wrote:
> On Wed, Sep 23, 2026 at 05:45:07PM +0200, Vlastimil Babka (SUSE) wrote:
>> Enabling slab_debug has the side-effect of disabling all percpu caching
>> of objects (now via sheaves), which can be sometimes useful for saving
>> memory for e.g. kdump kernels. To make this possible without the
>> overhead (CPU or memory) of actual debugging options such as poisoning,
>> introduce a No-op debug option that only forces the debugging slow paths
>> and zero sheaf capacity.
> 
> Just to clarify, the intended behavior of slab_debug=- still
> does not change, right? (the name "No-op" could be confusing here I
> guess)

Yeah it doesn't change.

Perhaps, later in the series I should consider what exactly slab_tiny=1
slab_debug=- shhould do. Hm.

> And My LLM flagged an issue here (that I reviewed)
> 
> Implementing it as debug flag has a few side effects:
> 
>   - pointer hashing will be disabled unless hash_pointers=always is
>     specified. [+Cc: Kees]

Hm that likely should not happen with =N, will adjust.

>   - Disable slab merging. Since this does not affect object metadata
>     layout, this could be excluded.

Right, also we want merging with slab_tiny=1.

Thanks!
