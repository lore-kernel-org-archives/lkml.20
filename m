Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873546;
	b=Ewx1ffEIu15d3e18qFRaarbm0ZUuUFz0iQeeG2bwMIP130azX0076c45vCxe6pDU5MUW
	 ypVn9mzvTZRQMx4sVGqFOXpJzrTZfMW4/UfH1uEFam8gQGHMqiF5ECFt7uillTm5ON8tP
	 ftqyooWYJHveJDvRTSPyjOG/zSv7QEPQxuvPBtEIJ9MM9dKuxxm7JDdAGgjlzaLOKy4lR
	 CYIVCDQ5kPZXMbC+XlEDIxcVWkw96kmn/Icd0UAdTdjnlVd4Ik0xqL2XvIh37BLBMYv2M
	 KpXa6iQBb05nSmLX07VrJ5eyvKPhShMqA0wWgWSKvA3ihjU8diZnb86rJLY8/ftwdOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873546;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=5tdVeohczQcF/1PA58PpWxIbAKDKZLhIvKE2pdtIyoQ=;
	b=wmTbFGawRHRdE6Prm62Mld/4R4X/TYuJQJ5mvUaDT2EpEMETZJIR5r2mFWw+SgmSFgE6
	 8CInihxPmgSei9DePzGemanOsRIy4BlDKulWC3GLT6PtNmSCzqVV3Woz4O8rg/4TlfdhI
	 oI8+SBQGhkWKjpSZ4+ucSCuOB8Ue+57c5T40QI2+f/bVWT2dj9WvH27OIIV/378ovjs7+
	 Wpd0vrN774NbK6sV+HoZii9dfF1kNRxUZsKpxZ//cC4506avyyJHrA4rVldFFSqKZhmCd
	 vYDd/I09ywxjW5B4owpz4GHZtwJue0zHyBpWZ/dwJ8EhoIHs5ACf8AolLj+56gBSpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4m0xrqi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4m0xrqi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D294C1F000C1;
	Thu,  5 Nov 2026 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873546;
	bh=5tdVeohczQcF/1PA58PpWxIbAKDKZLhIvKE2pdtIyoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D4m0xrqitxKnrWDpcPxFMNQayxHP7JZMlYZ5EK9L/FyD5VpbLSYYjCq4BowIrvgNf
	 vIIq6h66ZAUN9n/FZNSd4ZndLixv7mhA5o4biggzhTz+9B16KSzt+ufd7Pc8f/dCgl
	 CRqUdeiMbCFAx4rLH3tZW8n4EihPBVurj1FGAeDVXDuEN4KD/koqm90KifjEL2JJhd
	 M8+2qqQlDlePkUvBiwvZfWGk/FvmUz2dvjbDFT5Qows8yTTvnTw5V4bcBrMuu2Pnku
	 X3tW1kgC4CBsoYck8rH98jh8Mo8OQud0pYI8ilYKXl4rdKb25LjwmiaggxLtyjJC8V
	 3thUu9pBgaPxA==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Hui Zhu <hui.zhu@linux.dev>
Cc: Hui Zhu <zhuhui@kylinos.cn>, stable+noautosel@kernel.org
In-Reply-To: <20261104091050.117076-1-hui.zhu@linux.dev>
References: <20261104091050.117076-1-hui.zhu@linux.dev>
Subject: Re: [PATCH v4] mm/memory: use pmdp_get_lockless() for the pmd read
 in do_fault_around()
Message-Id: <179387354148.17709.689999444954400279.b4-ty@b4>
Date: Thu, 05 Nov 2026 11:12:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Wed, 04 Nov 2026 17:10:50 +0800, Hui Zhu wrote:
> KCSAN reports a data-race in do_read_fault / pmd_install; the same code
> is in mainline:
> 
>   write (marked) to 0xffff8d52a75fb810 of 8 bytes by task 27487 on cpu 5:
>    native_set_pmd arch/x86/include/asm/pgtable_64.h:83 [inline]
>    pmd_populate arch/x86/include/asm/pgalloc.h:84 [inline]
>    pmd_install+0xe0/0x120 mm/memory.c:444
>    finish_fault+0x5bc/0xb00 mm/memory.c:5204
>    do_cow_fault mm/memory.c:5432 [inline]
>    do_fault+0x5d0/0x6e0 mm/memory.c:5526
>    handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
>    __mm_populate+0x144/0x270 mm/gup.c:2207
>    __do_sys_mlockall+0x2cd/0x380 mm/mlock.c:764
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/memory: use pmdp_get_lockless() for the pmd read in do_fault_around()
      https://git.kernel.org/mm/core/c/6ab55cfd

-- 
Cheers,

David

