Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD031E84B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955779; cv=none; b=fsBQ6hDY8PKAVZe5Njvx4hhHCkFlTj+mm1SK7Gg2cAM0U/Do5QLJ52PcMLwAz/Kscz6XUM/xkf/TnaGNgI1SI/jfJ/FvrdcCzg6FK6QfG8vRIZEM7p8zP5z91Zj8E5YlPvqfhc42O025eInlxGH2kvSMGZaE+Nk7/3kvNJR++6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955779; c=relaxed/simple;
	bh=7S9al65EP+IkxXQ5RtgQNtvrTeltqQQ6RpMdl2YTMv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7POLYfaIp/O479YNeZVuPkT5MhCy/3VkwzH5+J278c0VwtfDNk2wmOOSlDk2dq3m3/gJycXuW92d/7Y3GSSgUyaV5h4Xr9UYh3oceWZj8Xr5U5EF3s2THMlXpoho4BNgI1hO/Zz4ZKCbW/znnrNLJwexZDCm9gmdWj52D/rxKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvdUXkGB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvdUXkGB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA171F00893;
	Fri,  2 Oct 2026 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790955777;
	bh=KqWqAAPlKwxZDka4vPFIdL9fJ2MD7gHMuh0eSJBUyIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RvdUXkGBURvj9+GlFXWYdXsi+/yPP68ys9IVaxCvrJqaioIglvXzaGrUS18aQP9kr
	 4FjVDTWi9fjWEThrUBiWS5AUuCxV5k/v+rN30KdsHnH3oaIRUN4OJ4u74ym8t2HuXV
	 hLR/ICt3OQohgrTXAfyhcrgvPKrkf+n8sJDtXhCAFOqjyLKcG4N1K7JJBjrWyEZCAS
	 OsxQ872xDCml/v3NwB9KyToGUuC8ZQU/Cyd8jOVCWUvKJQ08JcXjSrfZcGaFFKOojA
	 xf6imembAorFL9gQAwFHYYzhMrDXZT3i3rPUWp3Oi5sWT1HjVqk3pLkkjp2gq7ShHY
	 zztNnYIlG5ElA==
Date: Fri, 2 Oct 2026 17:42:51 +0200
From: Gao Xiang <xiang@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, xiang@kernel.org,
	linux-erofs@lists.ozlabs.org, Jingbo Xu <jefflexu@163.com>
Subject: Re: [PATCH] MAINTAINERS: erofs: update my email address
Message-ID: <ar_Q-2yEkQPpnEnv@XiangdeMacBook-Pro.local>
Mail-Followup-To: Jingbo Xu <jefflexu@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, xiang@kernel.org,
	linux-erofs@lists.ozlabs.org, Jingbo Xu <jefflexu@163.com>
References: <20260921030417.87932-1-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921030417.87932-1-jefflexu@linux.alibaba.com>

On Mon, Sep 21, 2026 at 11:04:17AM +0800, Jingbo Xu wrote:
> From: Jingbo Xu <jefflexu@163.com>
> 
> This email address will not be available in a few days.
> Update my own email address to jefflexu@163.com.
> 

I will add your original
Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
here.

> Signed-off-by: Jingbo Xu <jefflexu@163.com>

Acked-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b..1008e14254c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9681,7 +9681,7 @@ EROFS FILE SYSTEM
>  M:	Gao Xiang <xiang@kernel.org>
>  M:	Chao Yu <chao@kernel.org>
>  R:	Yue Hu <zbestahu@gmail.com>
> -R:	Jeffle Xu <jefflexu@linux.alibaba.com>
> +R:	Jingbo Xu <jefflexu@163.com>
>  R:	Sandeep Dhavale <dhavale@google.com>
>  R:	Hongbo Li <hongbohbli@tencent.com>
>  R:	Chunhai Guo <guochunhai@vivo.com>
> -- 
> 2.55.0
> 
> 
