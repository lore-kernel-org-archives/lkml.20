Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578596;
	b=ieiaiqUG332KewaLCS28JwDBht2pJeRkx4fcJ6u5jZopQecIXdLFKUcwDa0NVGxN6/E9
	 wUGBIrmpDg9bzMm40+mwCJGRey6RmrIY0viLgfLlD/soLvl4zQkDyK7f4q+BivDVDTCV+
	 u+Q4ZxYUOPUZwEqh/ABKqqjlX0y5Qymwwuy9KZdAK83MWW1/OY1AnX9kfy4Bsj5MvAZpL
	 opKPIG6Jn1s8IeF6vqXSYwprATQYwS42EQEu2A7+FqK8NTOdph9CYe1KUu2OUterRJYnl
	 dLSFm7ut+DJP1E6d4TG0RD+zbeuzrprlj2W9aQPM4VYUyYUKGFaIzlYVjvUlqNu39fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578596;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q981tRUWKrBz32Jw1Te3BR+cA0g5zfyV4P8NPMxGZO0=;
	b=ex8Zg++wXOd7kKn8PRLmqPT4NLDOUbBmo67ETRMbtl+hkFNJOyfH4c0IPaKKKWuCg4VX
	 k4Lls/dOQYoLLYxiA0KqcLwll/Kvk1ZTyop/T1BAmU7isgAJGbGw3NOEpVhhRfmXwyVrR
	 m+WeLp2SLR1/kI/mMdWQmRbs/61dKtKasmdoD4YvSyGL3EdmzRqwbDWCoBeO8uXijuyLE
	 VO0uEGtdPjk1wQuYmkIwV+T3+Qe7EMcCSw71ZnYwx2riQyR7i3bHEB2G0WwwAN9PvCITc
	 2mSYZ62VK3RChWv+p4PN/IaDlLr4u1h7qabPaPKiqfIOp6By5XUAyXtdunu9BYg9zHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5ZND05d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490F606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5ZND05d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE3F1F000C6;
	Fri, 13 Nov 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578595;
	bh=q981tRUWKrBz32Jw1Te3BR+cA0g5zfyV4P8NPMxGZO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A5ZND05dZNdOaJh1LC6dIa2ZRCkXytqKLIGSws8HvATHSWeCOCBfESWR4fidBdr8C
	 4EtJi1Vd152F89eHaknz/xtBxsVRe0YvTY9c/KLiBUGbtbyhuTS1H2q0E0P8c4sbcf
	 YdY9ZK4GXxmmGQZ9XhMJ4ZUT6C+xPtulkL4sRJSI+YPzosb7RksaffNl5QYfmXJQJ7
	 Aip49j87YnBRsVxu4PMLWwt68ag31Pe2s7IaNDBEezpDDv6RWvCzC9wZP+x34Bd2Y7
	 MTH7zxYFJlQn3Uem7t/+4s/Cl0ISGk4uL0Z48vQWpEwrOyv5dBUsZX44Zh18XYEEiK
	 UQAu7Xx90O35g==
Date: Fri, 13 Nov 2026 14:03:11 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] mm/ksm: extract helper functions for scan cycle
 cleanup
Message-ID: <avcYRcPvzpw37pfo@gremlin>
References: <20261112125754.176930-1-xu.xin@linux.dev>
 <20261112125928.177598-1-xu.xin@linux.dev>
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
In-Reply-To: <20261112125928.177598-1-xu.xin@linux.dev>

On Thu, Nov 12, 2026 at 08:59:28PM +0800, Xu Xin (vivo) wrote:
> Since scan_get_next_rmap_item() is getting too large, extract two new
> helper functions, ksm_prune_migrate_nodes() and ksm_reset_unstable_trees(),
> to reduce indentation levels, isolate local variables, and improve the
> readability of the main scan loop.
>
> No functional change intended.
>
> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>

Thanks for doing this! LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

One small nit below, but it's not a big deal :)

> ---
>  mm/ksm.c | 56 +++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 23 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 5e24b5ca8dc8..49977bcf04f7 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
[ ... ]
> +static void ksm_reset_unstable_trees(void)
> +{
> +	int nid;
> +
> +	for (nid = 0; nid < ksm_nr_node_ids; nid++)
> +		root_unstable_tree[nid] = RB_ROOT;
> +}

Recently I learned (and PeterZ reminded me :) that it's actually valid to
declare the var in the for-block in linux kernel C.

So this can be:

static void ksm_reset_unstable_trees(void)
{
	for (int nid = 0; nid < ksm_nr_node_ids; nid++)
		root_unstable_tree[nid] = RB_ROOT;
}

:)

--
Cheers, Lorenzo
