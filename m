Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E542AFB2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788046971; cv=none; b=p1fPzsIJTP2X+HU0XO3wzzxFv7a6CPmJ5myXRZBqFaKLhXkbNpLI50dMuq/Lyy98tQ012RG4Iml+WKbSq0+UTfaL3Ui35kRxfYO+0WHE2uAAgFVKUu69v9OLbNUT+nrYOlarRfMIfbvqpdT2QMEoBUivutpWfeHUxzVbnIzT46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788046971; c=relaxed/simple;
	bh=hvib3xu+mCh3dIdR57++m42eWeewyViREqC/GFZPOBA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JZlqfeNc5mST1L3X+8JU/59VOH7F1zz3zhhY3dQEL3oMAF7sCtoSP6TMsw7hc+70pU46i4j6u/qVh+1CVoYUFRMo+Qu1tMQitFVG18Wt0O6WMj7mjAiUfnz7ZxOmbPs8wqGDFQ6s0UTNiYWeDCYAqzUNfa2IQBFnbnVZO5f1+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FIKyqdI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FIKyqdI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2011F000E9;
	Sat, 29 Aug 2026 23:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788046970;
	bh=2mRCQiRBd4NuPuRSBBLbKKxxhzvurCwnhLr1piTDSSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FIKyqdI6RBvZQtl6PV7p2HB3PZzFD0Q95RBgzRmslyl1V5W/kT494hjE1GHYn/LwJ
	 8NBRk1WYTe/Ua10h9hD4nxM9vXMNE0C4TaIe2oEOxV9MBTZN0Bj83YPCmoSCu4nf0O
	 6xguUizHJB5Y41BdhY0cxqZvyIWOh/qcDHrZRx2o=
Date: Sat, 29 Aug 2026 16:42:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, "H . Peter Anvin"
 <hpa@zytor.com>, zhanxusheng@xiaomi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] minmax.h: update the stale 'x' versus 'ux' comment
Message-Id: <20260829164249.78372631e4424a07bcf8c9da@linux-foundation.org>
In-Reply-To: <20260817121613.3846511-1-zhanxusheng@xiaomi.com>
References: <20260817121613.3846511-1-zhanxusheng@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 20:16:13 +0800 Zhan Xusheng <zhanxusheng1024@gmail.com> wrote:

> From: Zhan Xusheng <zhanxusheng1024@gmail.com>
> 
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Well that's confusing ;)

I'll assume @xiaomi.com was intended.

> Commit b280bb27a9f7 ("minmax.h: reduce the #define expansion of min(),
> max() and clamp()") made __sign_use(), __is_nonneg() and __types_ok() take
> only 'ux', and commit a5743f32baec ("minmax.h: use BUILD_BUG_ON_MSG() for
> the lo < hi test in clamp()") did the same for the clamp() limit test.  The
> comment describing the old split was added one patch earlier and was never
> updated.
> 
> 'ux' now carries the value check too, since __is_nonneg() tests it rather
> than the original expression, and nothing here looks at the value of 'x'
> any more: it is expanded only to initialise 'ux' and in the error message,
> as the first of those changes intended.
> 

Thanks.

> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -38,9 +38,9 @@
>   * Note that 'x' is the original expression, and 'ux' is the unique variable
>   * that contains the value.
>   *
> - * We use 'ux' for pure type checking, and 'x' for when we need to look at the
> - * value (but without evaluating it for side effects!
> - * Careful to only ever evaluate it with sizeof() or __builtin_constant_p() etc).
> + * We use 'ux' for both the type and the value checks, so 'x' itself is only
> + * expanded twice: once to initialise 'ux', and once quoted in the error
> + * message.
>   *
>   * Pointers end up being checked by the normal C type rules at the actual
>   * comparison, and these expressions only need to be careful to not cause

