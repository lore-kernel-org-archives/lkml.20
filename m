Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1B345D5E4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844322; cv=none; b=ICVp61M8OyRRXH0EY4d2rClVvGioaK2ZnRUlXizWqDZSifmgOrjwemIBqAc7+G6KnvqUpU5kUigc1Wo+caW+qHOF50/s+BU5UPFry9NcrN1WQJgXhV674iBu6cBnIqWjFCkhTELxrqZH2sfKE6Yzn7OKYSqN18giYPQStjDSvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844322; c=relaxed/simple;
	bh=GNf4jyoJ784mH1uHAmA38aNbPIuOv1jajxGUxa3SIN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODZzs+YnbqtpCdZET3J3Iymu9SMgq7maqkvTNom7cbM6hNXuDO/WxYsMVhyuuZUPDzdxh8bUFWF/6YfJQN8ozZgMYGm9vi6TdO+P8uszGiVzjMrhWU3VDNLUzNLPsm26OTPINkRBWfpf3WjXumbKWdvyM+aOMBwXFL5cBL4X0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDby3Q/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDby3Q/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1DD1F000FF;
	Thu,  1 Oct 2026 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790844321;
	bh=Wvo5HyJ0MjlzdhRhjdhOVClTsA5gXTsfWJt8z1QNjxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WDby3Q/o5geKNbiE/KasRuOVuLsbJxajLaXMQrOYoQi/rWIBL0hSlpP823Ds3lE0/
	 hs+UB9mDSFste6A2r0GEY/X5XW+Dz5GMWIcSX9pT2ZoWH/bEQAsPe2nK3+uyzBF2cl
	 Yj1490Xz/w9sr5ASF0RySkI5Wdpw4sx9JTVSNPmLEdMp8KewtHQoQJdUUv4SN7wOQP
	 7NKY2doQheYldFNGK6hvPl/eaBQscl0FOeGgmj369Hq6aBRee6ukRG/3M707cdUT1M
	 pZxTDa8onCB/FKanCZXWJExksHplUysiM2O0O5jlRXVa2j7dwkHc2C6Hr7groYYgZU
	 GcD1UOBck/OhA==
Date: Thu, 1 Oct 2026 10:45:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Helen Koike <koike@igalia.com>
Cc: rodrigo.vivi@intel.com, demarchi@kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, tvrtko.ursulin@igalia.com, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2] drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET
 programming for ADL
Message-ID: <ar3_LjzklapoN1tM@zenone.zhora.eu>
References: <20260930170434.317671-1-koike@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930170434.317671-1-koike@igalia.com>

Hi Helen,

On Wed, Sep 30, 2026 at 02:04:30PM -0300, Helen Koike wrote:
> CTX_CS_INDIRECT_CTX_OFFSET default value is not retrieved from the GPU
> by inhibit+context save mechanism since it is not part of the Engine
> Context. Thus, at restore, 0x0 is programed back to the GPU, which is

/programed/programmed/

> an invalid value according to the PRM.

...

>  	/*
>  	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
> -	 * varies per engine class, but the default is good enough
> +	 * varies per engine class, but the default is good enough, except on
> +	 * Alder Lake.
>  	 */
>  	xe_lrc_write_ctx_reg(lrc,
>  			     CTX_CS_INDIRECT_CTX,
>  			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
>  			     /* Size in CLs. */
>  			     (state.written * sizeof(u32) / 64));
> +	if (GRAPHICS_VER(lrc_to_xe(lrc)) < 20)

Are you assuming that only Alder Lake is xe < 20?

As you are restoring the original code for render and compute,
would it make sense also add a check for class being
XE_EGINE_CLASS_RENDER || XE_ENGINE_CLASS_COMPUTE?

Andi

> +		xe_lrc_write_ctx_reg(lrc,
> +				     CTX_CS_INDIRECT_CTX_OFFSET,
> +				     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
>  
>  	return 0;
>  }
> -- 
> 2.54.0
> 
