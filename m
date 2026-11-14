Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676492;
	b=gYx3kIadfvuRs6t5b9SmW98zdFoQAlK7AoUJ+PEzsV/A14Z69zgv/iybosVNRVFJ3iqh
	 5TyU9xko0ljqf4+kawharrUp7owSbh9y/mv6Vd0m1SH++VGFXHQ/h5v3yx0PNWZHxjnBS
	 4LoCD7Utprnq6cprrErTRVVEIcvWk03JXCpk1gyIUiWQmspg6OPf4tZV0FZda69fj3A4G
	 RzvsX6YYfXHau60HO3r2SS6Xhjh+h5cTq967wknCf8tyPvwSWQjJsym93Jn91e0cLtW5V
	 4N/PdVDkEpJFBWL7a2Ji8wvEKrBMVlbGNf/Mpo6gH5rinIf1VJops6noJtm8KMaINYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676492;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=amAldK0/T73Ry1qXMWa943LC72gx3MygeFvu1xpe5Ok=;
	b=MGSTEX1MBA0u//mI5gbN8QgBMJsxA8epdBAC7maYoGDjyJNv/wjcZwNnzZw1ZY+X1N+y
	 WCerIPvVoeXt+Q6Uig93z8fCVmtNIZ0DNn1opYA/by3QCsnB15zhCJsTvTxPit0YtwulY
	 lNH/uZFgwdAXP09ykaEYTfbnLa3Z+Ey+Np/pdbwruQeGP2M7Ab4NYl+3TdVT0vZkHlpbM
	 /Mz2uzfRu/ZXD6NKftp/iWoY/o5M+attwOoZQTAN+ZcgpXGLwV2c7SS2K6pjunJKVJn6k
	 qih8l2ScprqomUpgzcSwiR29RF87MKtMRo5Lz7/2lwIFL3v40m++d3On9Bf5xa+HBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8Ms1s7x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B9A606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8Ms1s7x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6091F000C6;
	Sat, 14 Nov 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794676491;
	bh=amAldK0/T73Ry1qXMWa943LC72gx3MygeFvu1xpe5Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8Ms1s7x3h9Tky0npGs3DcTcpD9x9ZNBOGIqUGiKFm5Kie6dXrVDT+00aDA6F5AEn
	 vz7YwCk5G2fn+PMuyvUVI7tlnFg6UkkPJa7t2ZWpGFrAqE6ib6pzwIR2H6dHWp+w0r
	 wnFO0yatYgaLzdKqVERxXCAse+ubatVks74swC1VOJq7WYOMPcepDTdxYbxcbkyedo
	 Oy9gbE5/EeOfRWTBaouQW8+sMf0CoqryfbpJv/u0WND5MRCDMHv8bPkyEq0tT6Xzco
	 LfNS3wg7kZq4r2bfLtR3V1V/bZwotoan9lJsRR5hsTUOu7zflwZAOlb3LVIrr2iQ8z
	 vjdt2l0CTsepg==
Date: Sat, 14 Nov 2026 17:14:46 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: akpm@linux-foundation.org, liam@infradead.org, linux-mm@kvack.org, 
	vbabka@kernel.org, jannh@google.com, pfalcato@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: restore VMA iterator on full-range merge failure
Message-ID: <aviVQ40at8rZEyjW@gremlin>
References: <20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn>
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
In-Reply-To: <20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn>

On Sun, Nov 15, 2026 at 12:46:55AM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> mm/vma: restore VMA iterator on full-range merge failure
>
> vma_merge_existing_range() moves the iterator to the previous VMA when
> merging to the left. If the range spans the whole middle VMA and a
> vm_ops->close() hook prevents removing it, the function returns without
> restoring the iterator.
>
> An mprotect() walk can then visit the middle VMA again. Restore the
> iterator to the range start, as the abort path already does. Extend the
> existing close-hook merge test to check the iterator after this failure.
> No crash or data corruption has been observed in this case.
>
> Fixes: 01c373e9a5ce2 ("mm: rework vm_ops->close() handling on VMA merge")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

(Not the first time I've seen this 'issue' reported).

This is pointless. No caller cares that the merge doesn't
proceed. Revisting it is a noop.

So this isn't a bug and the 'fix' achieves nothing except unnecessary
additional work.

I might go change how this behaves just to stop AI-generated reports... :)

> ---
> Tested with tools/testing/vma using its default ASan/UBSan options.
> The added iterator assertion fails before the fix; all 29 tests pass
> with the fix. Also build-tested mm/vma.o with W=1 on x86_64.
> This verifies iterator position, not a crash or a production workload.

Generally we expect people to mention their LLM usage here.

>
>
>  mm/vma.c                        | 5 ++++-
>  tools/testing/vma/tests/merge.c | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index c82e9306b11ac14f684f44b8d71a0026b7fc145c..c87b29f1beec4ceb02c23f6b37af0e5dff272436 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -983,8 +983,11 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	 * If we need to remove middle in its entirety but are unable to do so,
>  	 * we have no sensible recourse but to abort the merge.
>  	 */
> -	if (vmg->__remove_middle && !can_merge_remove_vma(middle))
> +	if (vmg->__remove_middle && !can_merge_remove_vma(middle)) {
> +		vma_iter_set(vmg->vmi, start);
> +		vma_iter_load(vmg->vmi);
>  		return NULL;
> +	}
>
>  	/* If middle isn't removed then it's resized, i.e. splits. */
>  	if (!vmg->__remove_middle && check_split(middle, left_side ? end : start))
> diff --git a/tools/testing/vma/tests/merge.c b/tools/testing/vma/tests/merge.c
> index b26f1a66a17074775d751a907eb627445cc1dda3..91accb5dc9944724cd11d1bfa47484a3cf9df54c 100644
> --- a/tools/testing/vma/tests/merge.c
> +++ b/tools/testing/vma/tests/merge.c
> @@ -680,6 +680,7 @@ static bool test_vma_merge_with_close(void)
>  	 */
>  	ASSERT_EQ(merge_existing(&vmg), NULL);
>  	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
> +	ASSERT_EQ(vma_iter_addr(&vmi), 0x3000);
>
>  	ASSERT_EQ(cleanup_mm(&mm, &vmi), 2);
>
>
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> --
> 2.43.0

--
Cheers, Lorenzo
