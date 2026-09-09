Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D24304BB3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919864; cv=none; b=DlYFnt66xb0+gqhaFrHuO7aDSV+IlSIO4fuwpXZhNjf31IhLLWXK/GU8Y6Lub0SuFXI3w+ZnGjmJsQKrboPql2PqARMa2pGi8ro6dg9i9+psE7C3eziIEn7JMtpjr2e/dI+ZcE9HcJ+z068oLKEDmvBtorsknjLt3HO0GMuTrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919864; c=relaxed/simple;
	bh=BBbOaKTnJnpepW8POdkddw03RpPaiiA0yOuzu2gRC1k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jlXhrao6pJvY3R53NV2QSU1eSXpbynosF64mJPZcs7HSoacvNXvgv+Oc/hrYQAoSc3SRoPnhx8c3zUQcPXA+Y0k1NwrEXHmue2Kt0ux0vyRLYDNJBmYo4dKCWXFY8vVdY/WaR9XX52NNBC5teV/QMevKRDtMkeQSqQrVzvV8euk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TBWXfbMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TBWXfbMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDF11F00A3D;
	Wed,  9 Sep 2026 02:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788919862;
	bh=mMSpRkJWb1wgpS9PsxD2TN7ZwnY7QPSvbK47zQ4NDI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TBWXfbMPLS8g9kkKXMOlBKV+f849NpEd6kXPivu1/gkzm8jPDUILHgCBopFXMKiZ2
	 EpnaYznFF14lACVkxuVV7nM96DplBqn+hHv2GvofhRmktc7O+1noxxv520ErN7Nj++
	 O3+ttNW9LEyNWFW+BmXcMy05uaDkupzbjsydxpCk=
Date: Tue, 8 Sep 2026 19:11:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: john <love_goo@163.com>
Cc: liuye@kylinos.cn, hannes@cmpxchg.org, mhocko@kernel.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com,
 mgorman@techsingularity.net, yang@os.amperecomputing.com,
 zhangqiuhao@huawei.com, wangkefeng.wang@huawei.com, mawupeng1@huwei.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Wupeng Ma
 <mawupeng1@huawei.com>
Subject: Re: [PATCH resend 0/2] mm: vmscan: fix scan overshoot and
 ineligible folio scanning
Message-Id: <20260908191101.b6e5a5a52cb8efe8f3883a81@linux-foundation.org>
In-Reply-To: <20260901084706.3784449-1-love_goo@163.com>
References: <20260901084706.3784449-1-love_goo@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 16:47:04 +0800 john <love_goo@163.com> wrote:

> From: Wupeng Ma <mawupeng1@huawei.com>
> 
> Rebase to the latest v7.3-rc-1.
> 
> These problems only surface when reclaim targets a lower zone
> while the LRU holds folios from a higher zone.  Normal userspace
> allocations go to the highest zone.  The zone-skip branch stays
> dead under typical loads.  Lower-zone-pressured configs (DMA32
> module allocations, memory-constrained devices) hit the issues.
> They inflate scan cost and delay the OOM.
> 
> shrink_lruvec() drives reclaim in SWAP_CLUSTER_MAX (32) chunks, but
> isolate_lru_folios() may scan far more than that per call on a single
> LRU.  The excess is never charged back, so shrink_lruvec() keeps
> rescanning the same folios round after round.  When reclaim targets a
> lower zone, the same scanner also keeps walking zone-ineligible folios
> that can never satisfy the allocation, inflating nr_reclaimed into a
> false progress that delays the OOM.
> 
> This series fixes both:
> 
>   [1/2] Charge the isolate overshoot against the scan quota so the
>         next round skips already-scanned folios.
>   [2/2] Stop scanning once too many zone-ineligible folios have been
>         skipped, instead of force-isolating them.
> 
> Background
> ==========
> 
> We observed slow, unexpected OOM behavior during extreme stress testing,

OK.  But why should we care?  Don't do extreme stress testing on your
revenue-generating customer-facing computers!

IOW, as long as the stress tests don't crash the kernel or lock up the
box, we can spend our time thinking about kernel behavior which really
matters.

Now, if these changes can be shown to translate into improvement in
real-world workloads then they're useful.

Am I wrong?


