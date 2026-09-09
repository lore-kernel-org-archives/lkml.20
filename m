Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F259B69B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988844; cv=none; b=SoDj2x4czDcZCbetlExjpL9RJpfvbawgvvaLeLNxhsJ8bu8RgxbfONFugIZAye6+fgcqFVZwkTEIxSeC+8yO3Y7A/fnTlNmblZJqRqfkm1veJAfy2uUSagL4c7RCo7mMT88znMYeOyeL9a2bslTzLBf5PIUW1LbbCdz1WjmRAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988844; c=relaxed/simple;
	bh=wwovJgUAkUuNMyLhfiqu0hQDEwfc+mhMAOAEAjGCe5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw7GYc5aha+mUtkwoj+YCdH0qAy9ySVP2dkCxyO70FG2FMRf/4AYhVwJj21DVN3MSkQJR0je199HS9L/3FX8mY2DK1EJJoGHPC222v/UQ9Inn2pryY6gGhMgCXzwZLfulIFEERHpXcID2xRNFZE9UVaG05lMAqgDHrpqi0lx4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4eLXKQK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4eLXKQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2CB1F000FF;
	Wed,  9 Sep 2026 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788988842;
	bh=+H+ZJH0ftAZSxJQeKW5qVtWQtWSEpir02EwuyhbdWBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k4eLXKQKxfoqeo96EwDFH5e65PpklSb2NNCZc1xLDyqE6L/5TJExkm3Iv6jqRygn4
	 giURXvSy+sW0CnLf9xIuffuTDL8mQ2kk8lEv5BJ+ZpUin5iJQ5YR30b/mopq28OV8P
	 S9pFNyQhgXFopvWQHHhO0PENVx4WstNpP1ixChDIZGe73LwdS/yP+BqXtT1XqY5W/C
	 o5/PMNfWJtvGL277DO/28712qqfdT0JvVXmVsyblY1gqV0KiOw+b2VSkUHRu0aGDpr
	 zbrxPvM94gque/w3xDflmQh83gixcGpchRNb3cWnhDgiespWi1pRFtbtI3JeDdCVw2
	 W88mya4WPARLQ==
Date: Wed, 9 Sep 2026 23:20:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix memory leak in query_perf_config_list()
Message-ID: <aqHNb7fH68g9aw93@zenone.zhora.eu>
References: <20260823205028.178597-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823205028.178597-2-thorsten.blum@linux.dev>

Hi Thorsten,

On Sun, Aug 23, 2026 at 10:50:28PM +0200, Thorsten Blum wrote:
> When krealloc() fails, free the original oa_config_ids before returning
> to avoid a memory leak.
> 
> Fixes: 4f6ccc74a85c ("drm/i915: add support for perf configuration queries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

merged to drm-intel-next.

Thanks,
Andi
