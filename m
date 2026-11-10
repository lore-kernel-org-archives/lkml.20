Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321560;
	b=XxDXwNQmnBrPcmQiZmtE2gQ58c8ZN+KJ7r2dRZv+QJuIMLI/HgaH/JUM/v6viDZSe4JA
	 24VYrkCSP9lMDFicE2AZbLR5JZ0mr6EgbR/GV16Mrvmo5d0iNkVuVeScVxplzo+ghac5X
	 QSl+02JPmsPxxipx4V6x+8AHgAtmdSMxcwlYU0x97uGx2IuyvNhZVSkwqImoOB5lbowNV
	 JqvHqAy559dyDR+vaYKpQpfmO3gQGp2fZ8gXC9gFsEwmVdxgXQy/d5ju6xK0WRhTDsZy/
	 YB5wYbimA6sNsy0391pWLIEoDUfAcAaLzqMXpSMYMGVau6zcguZX0UWCGN+v7rkNTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321560;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3xGvOJLWQhllaVLukgTz+i4tETD+3mmWO2tAkOXX1BM=;
	b=oJDBxrFzl2v7kcZx5yTqvjs9RXDLXPM9WuXRrXDoGN8sHowHsjfKwqLoRaXEUuu700g6
	 C9JbJLQadV0LiBFiNSQRJNjq+5Tg1L10Tg00A2F9HUVi2fIBOFivA7MMUZP+OB6Omq9mU
	 UiE8oRZ34C+loe7Mbq+lE2DxQfPUdmcTUDrmyVTZp6pR7FjP4GMzWxAWxwtrsFjSudoM9
	 ywzvxjvwKhpbQ56NuXGlz/seUpLfwykoVkWOUlmYsC79v0uWqywnHn8J2iwh5pmAFBf9w
	 bsJDboCfW3WT94VMs4zg5h9HW666QdhRwfLjOQOTa23xkXLiVLkVk4MgAxVZieoorbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Cz//o2m1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C460A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cz//o2m1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6721F0089F;
	Tue, 10 Nov 2026 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321559;
	bh=3xGvOJLWQhllaVLukgTz+i4tETD+3mmWO2tAkOXX1BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cz//o2m1vDWGkNLoGL1DsXDe6cKey5guPiaVnFD8xr2NwO8innlcJgvWZcAW4qSgP
	 mvanF71Tt7qoC0VHQdAYCfG5V4UE6wu10S1hXw7MTuZ2X7ez70VWsWImkZqMbOZFwP
	 aI8i1T0Z/cI9mWHkw6udVUvKmuONIGK5Ygi4Xok9eBNloQ6UpzO62DCRN7NJ2DTUSw
	 t0SlTXOUdhaSA8/333vnzILdq21tY9bgQNkpUaLLtjJzUTQ6ZHdh76tAC/z2KlMASC
	 XSBR756DSoLE4O1UCW0XYzy8iX++VYsPpOHox84YG7pBNW4WyCnYw8SwyvvCL7emif
	 Orb47sGKIaFdw==
Date: Tue, 10 Nov 2026 15:39:17 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 10/10] mm, slab: deprecate CONFIG_SLUB_TINY and reduce
 its Kconfig effects
Message-ID: <avMpvYcc9-IddPWN@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-10-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-10-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:59AM +0100, Vlastimil Babka (SUSE) wrote:
> At this point CONFIG_SLUB_TINY only affects the default value of
> slab_tiny_enabled which has a boot-time parameter. Thus deprecate it in
> the Kconfig description.
> 
> Also remove its interactions with other Kconfig option, as they are not
> necessary:
> 
> - KASAN, SLUB_DEBUG or SLUB_STATS support do not need !SLUB_TINY
> 
> - KVFREE_RCU_BATCHED can simply depend on !TINY_RCU
> 
> - various hardening options do not need to be excluded, although it's
>   unlikely that somebody would enable those with extra memory overhead
>   together with slab_tiny
> 
> - SLAB_MERGE_DEFAULT does not need to be selected, although it's likely
>   to be used together
> 
> Keep the "depends on EXPERT && !COMPILE_TEST" as there's no point making
> the deprecated option more visible.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
