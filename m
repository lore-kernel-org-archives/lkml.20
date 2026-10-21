Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590099;
	b=L6uSSVlfo5RHbK/rDoNB5XOI4y8rXhekkdkU16c8NytfPYbOa1UvpP/wN3aa6CUFwmAW
	 yluB4ziT9l/iAHu8LpaamKC0lw8cuBj1CUjiMUml4SdzOWmHOhILV5E+e1nYhWQXKPLxQ
	 +EoTY6k4kAUqyNM1lJNyU6ynNnFivk7XVzcQ935Sj3stG296lZrGOWmtsr4enP0TpTTz/
	 E+C4rwASai8PP6ph6KAzoLHcUZ6x0nKPvmB3EtTi5WYuQDvGg2rTbDpfgXAraq5oAPKZG
	 GiKkk2IcuP99NgErsQ0pthgqO1Sm5MPZD2F8mGu2lp8sUrqt4uN5tLJAYhwMepyZM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590099;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lTFhtZqgicHqPLQLHq7f0+ApWdYensFNsFbqs8ibbZ8=;
	b=TzZDomQoaTT2AX6OvBhzFEQN/FNfSFQrcjRRzmiGmXWNwqSH+Dwl6EDftK55R9AoqjWv
	 yAnMx4P8H2b8i/kluHsNVuFOQ7kVr2Vgn1OL4BaFC8nPzKbasVbEL2fcUVLuFMb4Px18F
	 fvrd5O9Q9G+bAIn02veIDD0KcWFl2F9d/wj+Xc94IY3RddZmmznXS37SV709xBRHF9EeE
	 YmSK5kBqqeooFWuV5LG6u2vWN39zpPQU1ZgUuSL/m2QSAVLXo8vlk1PwRTvrSYsVqpPYg
	 W773+WNEsv1IOssCqVdPjET5AzTSamZUrlOJOT3dx6NbUp749oj5fDEFiCsVWafgItw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIPX+SlG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CA606A321;
	Wed, 21 Oct 2026 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIPX+SlG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5051F000C6;
	Wed, 21 Oct 2026 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590099;
	bh=lTFhtZqgicHqPLQLHq7f0+ApWdYensFNsFbqs8ibbZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aIPX+SlG7yHmfF6l9Vgd8xZG0tgIQpxmgyph8tOgd8j+PPYZNdq1QjbE37zVFdcmO
	 ztUF/I0qJQnq0n634ioclSbE1tc5KFfKuv1GVcF8TL7NDRewd7OAtuJsOr9zX5rd53
	 7/DN9LPcwLgXw/lt/s6+hBabQpIgAG9a6nljg6UJaq8RegqQ4UZi4SEZrZbkdBnXeH
	 xpVswCNUD9WTtU0jL9qSHqTZ8IMxYBRhwqOdD8IPNe3g7DtkkYAEJ+HXeYqRR5xtqX
	 UEA3BTPnzlXGgZ6JmozO4UHtfUj7YbolwGEqOoebfYjmapFDqlCd4yxcysw3TuXF1F
	 NVJ9/mpUwJxyw==
Date: Wed, 21 Oct 2026 08:41:38 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
	Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
Message-ID: <20261021134138.GC3667411-robh@kernel.org>
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com>
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
In-Reply-To: <20261015082315.56876-1-m.szyprowski@samsung.com>

On Thu, Oct 15, 2026 at 10:23:10AM +0200, Marek Szyprowski wrote:
> Mike Rapoport suggested [1] how to properly use dynamically allocated
> arrays during early boot.
> 
> Use this approach for reserved_mem array during early scan of the
> reserved regions. Having all the reserved regions in a single array
> removes the need of the two pass initialization introduced by commit
> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
> regions are processed"), so implement it to make the code simpler,
> easier to understand and ready for adding proper error checking.
> 
> Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
> with early mappings were discovered by LLM.
> 
> [1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> 
> 
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 
> Changelog:
> 
> v3:
> - allocate the reserved_mem array only after all static regions are
>   reserved or marked as no-map, so it cannot be placed inside any of
>   them
> - record failures of the early static reservations and print a single
>   message asking to fix the device-tree
> - restore conditional compilation of the early mapping code, because
>   some architectures lack support for it (C-SKY & Sparc64 as reported
>   by kbuild robot)
> - allocate the array bottom-up, to avoid allocating from highmem, what
>   might be an issue on Xtensa, C-SKY and MIPS32
> - don't use the early mapping on PPC64, where the scan is done before
>   early_ioremap_setup()
> 
> v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
> - removed superfluous ifdefs
> 
> v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
> - initial version
> 
> 
> Patch summary:
> 
> Marek Szyprowski (2):
>   of: reserved_mem: group allocation helpers together
>   of: reserved_mem: allocate and map the reserved_mem array early

Can you confirm the sashiko issues are not issues?

I'll apply this after rc1. Are you willing to be added as reviewer or 
maintainer for this code? I'd prefer not to have another entry just for 
the reserved mem code, so you'd have to filter out the rest of the DT 
code (not the bindings and dts firehose) which isn't too much.

Rob
