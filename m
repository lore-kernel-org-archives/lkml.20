Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04544B7149
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447031; cv=none; b=AL98YdNkg5NpN8e8CJNtUP0/Yjb8K6UdU1HJXe9YDIAfK7kR+ecn/S8cCD3AuVOBYKcH4jL7HTJUXDB0S8MpKTlHSFES31b0L8s4CPM7mo+3U1wCkk4nYbxMVfW+J7BcRGU54vmPSAPZeKJIA7SsmVS4XdoVIhmZVjn7Ej6QMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447031; c=relaxed/simple;
	bh=71dubQWPUhXeftrI6CvSb4Clf8XT4NBBKdYMV+2RhTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO37ptPYs8nzAD8xUGKq13YPX85Eny5UlPDAJSV0dBqCvIixZv4p8nO3xz+I54oBhsK8XsarQQfG2d1WaN4lFTvNEb5wEfaJBB7R1bI98cmIj1tZlW6IU3AgAyLEl6L/D5r0ZCaggkR0mSLwDL8F/KooDm/q/50oiLK65zyBwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir74EYxC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir74EYxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DE31F000E9;
	Thu,  3 Sep 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447030;
	bh=ybxJBVLrXv/G3fxvl3wlgNthJjWeu9EpETK3/009/H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ir74EYxCSi717vuRxLlY/suOWYRLiI3ARno93Hw2EEQMh9oHLge35gVxy456p48/2
	 KwLpLVLWBV4X+1qLOnv+agr/f2r5u7vmJ9Q6XKveTHF52awOqHG/+AbNnLkCc1uVMg
	 4mfG2C9uO9Yx6qUzgFzuL9TNjBSPmzr6sxmOMyPeKydyQpOZjccWlHPte9SqJeLjWS
	 bjyQe4geRdOF9Q0OEokI8NS50k6uXBlOV9imxF8Ryz/vyX/EnfeYKrK5AfJKDmMGzV
	 kRAJX3Ik8GUPLkJPPNZZVjePV75QPta+dMdIdMxzYHAdB/4xfjeTkWNKkfnqgAL6We
	 5OGQihEoE6/BQ==
Date: Thu, 3 Sep 2026 16:50:24 +0200
From: Thorsten Blum <blum@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix memory leak in query_perf_config_list()
Message-ID: <apmJMLS9bdriCN03@kernel.org>
References: <20260823205028.178597-2-thorsten.blum@linux.dev>
 <178815839811.55476.6042238739250760944@jlahtine-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178815839811.55476.6042238739250760944@jlahtine-mobl>

On Mon, Aug 31, 2026 at 09:39:58AM +0300, Joonas Lahtinen wrote:
> Quoting Thorsten Blum (2026-08-23 23:50:28)
> > When krealloc() fails, free the original oa_config_ids before returning
> > to avoid a memory leak.
> > 
> > Fixes: 4f6ccc74a85c ("drm/i915: add support for perf configuration queries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  drivers/gpu/drm/i915/i915_query.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index 0c55fb6e9727..11157fb14db3 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -403,8 +403,10 @@ static int query_perf_config_list(struct drm_i915_private *i915,
> >                 ids = krealloc(oa_config_ids,
> >                                n_configs * sizeof(*oa_config_ids),
> >                                GFP_KERNEL);
> > -               if (!ids)
> > +               if (!ids) {
> > +                       kfree(oa_config_ids);
> >                         return -ENOMEM;
> 
> Instead of duplicating the code once more, could we just refactor into
> "goto err_ids;" style to clean up the function?
> 
> Regards, Joonas

I think the cleanup should be a separate patch, since this minimal fix
should make it easier to backport to stable.

Thanks,
Thorsten
