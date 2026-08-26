Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEE471265
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762863; cv=none; b=WCNeyIYSlnnq0OHhjbpNArgHJpe8cU7aeIs9VfK7Vgy63JQLKKcM8mHfazO1uONA6i44bPkAohQYCzdrxl4Oa/C7MVRlkABioL5Oub2VK+6pFHWUU4rTmjWcMQZfrFkLGV2838p9iscsm3tPFVqv+gcfnAhQSvnGOB30QwXjXvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762863; c=relaxed/simple;
	bh=+fXa7sLn9dPScTZKkQbBvHV4vrC8hDwDqHI7xuGWKOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=En1F6w1S8EIGnQyOd68DMhZGqBiYS3dukWBk/LO7uHRAEhKzJSPONaLl6qZo3rs0mGTLC+FQLQxdxAZ/iZPqThGGIqErZV3cLb1TE7wDjEQ6BMfubHSgoQHNVuHpJQftJ9WYEzi2JLh3UKWJF64NqN6QebKxy/8XTe3tsQoF6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmjRSNiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmjRSNiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E71F000E9;
	Wed, 26 Aug 2026 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787762837;
	bh=1DSSzfZy/8TicLVWwNtrldrAFs7EU5V9nHRFHxpXEAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hmjRSNiQdRRu5uBLAFtgQwWWGwsxL+0r6TiQUiLwYR8RY9opCXbTamEK37n/8SB+K
	 A+g0mM31Vo50QsnnBktl5ybfnczn5dLEm26BEl9P2oGIDBpJ/sBy3G1eqAjj1Cxizq
	 YS8vmXAkAQW8vZVM4u7CmZb0/wc5pU6LCXIgxcfOeMqNwu29j1JjCbcxJy3mwrJiX6
	 LQGJh+YPhUOriz45CPDU1H5ZbLRVRtapZAfTWjGQ8P+X1/Jq/XFeF5v/YYVDbeOihC
	 P6g4NhnGPQi3rvLOaDf+0MGXbSbHC4qXh8EApXahbIsJEP0dZvPmtN/QzB9SDE6YrB
	 7kw52RLIT6AWw==
Date: Wed, 26 Aug 2026 18:47:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/i915/gem: Use simpler versions of min*()
Message-ID: <ao8YOAaBsWijMecG@zenone.zhora.eu>
References: <20260825093552.4088094-1-andriy.shevchenko@linux.intel.com>
 <ao2bfCVRT8LuOJCb@zenone.zhora.eu>
 <ao6lOyo5abFmwpN9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao6lOyo5abFmwpN9@ashevche-desk.local>

Hi Andy,

> > > -		nr_pages = min_array(((unsigned long[]) {
> > > -					folio_nr_pages(folio),
> > > -					page_count - i,
> > > -					max_segment / PAGE_SIZE,
> > > -				      }), 3);
> > > +		nr_pages = min3(folio_nr_pages(folio),
> > > +				page_count - i, max_segment / PAGE_SIZE);
> > 
> > thanks for your patch, but there is another patch involving (and
> > fixing) this line of code[*]. You are welcome to join the review.
> 
> Thanks for pointing this out! Do you prefer my to be rebased on top?
> Otherwise one can apply this patch first.
> 
> > [*] https://patchwork.freedesktop.org/patch/746877/?series=172332&rev=1
> 
> Note, my patch doesn't change existing behaviour.

yeah... besides that patch has had some reviews to follow up;
Krzysztof will have a little conflict easy to fix.

I reviewed and pushed your branch to drm-intel-gt-next.

Thanks,
Andi
