Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18E519911;
	Mon,  7 Sep 2026 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798952; cv=none; b=iGwgjlB8gIxDp8Nt7CXYG66OR78pP6j8p2XEyjBam31Igb1CozbYgcIBhqev3hpPGWP8+s9D0aeByMSBvlZn98TOWLvT+qPdd6uC67Ns1BN+u8hM+ZovOy3TGzZ/mZk+pNaufMbFt75wt/fDnqVMdvxdTfvpmFIwUqb1SG/hQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798952; c=relaxed/simple;
	bh=/q1HorLuIRPE7FnuAWRU1YnE0Ay6JcAsXMH4eMVD4Qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fld0qe61Up5GB60fb3rOjFryknoMyh/4RjwulzYQH7ONZ21V3Y1U+yV0ODbAl2fAvZVsycbyfbgDEEtZemg8DepErrubZQdh+Oc13tgDTMj25EKctVhGwy2YZyZ7HOZIXID/Mnvamss83+g8UvUbOOxb9VE4pVmML+ni40W8mVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MwlcOGV4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MwlcOGV4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D642408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788798950; bh=DAoYuIcWZTaMIojt62cimuryvgo36WyvyhrXztzDc4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MwlcOGV4qbKIoF2pj4SqaiVN0lsc7ZrL5SFjn+ezQ7MH/4DPJyq/ApUQzDjcVMMjx
	 6Ba2igW5oSDoKf50wtRX61Z4eKDZY07aok/ov8x1oxNISjgI40E6z0H0tcd/A05/xR
	 173kja13E97DE0OIJQQLw8DKQgnXK+ETt759lS4BDmIM25A7g5xcRHHH1xn3/IvseU
	 doCFu+lkc/1A7d0lqPk+tw1myYJh+wy97Tk4ByevjPGmTosRJ/d6Dp8t3FE+/DXXRy
	 FwjiLBfKxglVpmUsqLkLk1MNPgkc10u9GstLb0Np6QYH1px1R+dyFF8JhU83D0V9T5
	 MUSE9OKipTbmg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0D642408FF;
	Mon,  7 Sep 2026 16:35:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, "Liam R. Howlett"
 <liam@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka
 <vbabka@kernel.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: maple_tree: Replace removed bulk insertion API
In-Reply-To: <20260905015509.76265-1-kmehltretter@gmail.com>
References: <20260905015509.76265-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 10:35:49 -0600
Message-ID: <8733vlqasa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> Commit e3852a1213ff ("maple_tree: Drop bulk insert support") removed
> mas_expected_entries() but left the documentation describing it.
> Document the current preallocation interface instead.
>
> Fixes: e3852a1213ff ("maple_tree: Drop bulk insert support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/core-api/maple_tree.rst | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> index 12bccfb6aac1..836342fb1eec 100644
> --- a/Documentation/core-api/maple_tree.rst
> +++ b/Documentation/core-api/maple_tree.rst
> @@ -214,11 +214,10 @@ Advanced Allocating Nodes
>  -------------------------
>  
>  Allocations are usually handled internally to the tree, however if allocations
> -need to occur before a write occurs then calling mas_expected_entries() will
> -allocate the worst-case number of needed nodes to insert the provided number of
> -ranges.  This also causes the tree to enter mass insertion mode.  Once
> -insertions are complete calling mas_destroy() on the maple state will free the
> -unused allocations.
> +need to occur before a write occurs then calling mas_preallocate() will
> +allocate the nodes needed to store the provided entry.  The entry is then
> +stored with mas_store_prealloc().  If the store is abandoned, calling
> +mas_destroy() on the maple state will free the unused allocations.

Applied, thanks.

jon
