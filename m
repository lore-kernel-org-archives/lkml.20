Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09ED4FC8EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792836; cv=none; b=X6Qra6wfztBhP8FpyyNBa0nbY7rQAoJrxd9LXHnAZmXvskyiFWyzw1/x3jt2BOW/Zt4AO6lXLPBZwP/WeuPOplsya3ZBkXtKc8YrC/3B+54OmqJhthtJKzq9uHfJBvOmQZJu9adIQqWD2PWz0twIC2MoNPlbb+LFdJ0eJC8lU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792836; c=relaxed/simple;
	bh=sdIE3SzF6L6ZxINNNbZ0jvBKaiRVFXn2tAGQNxf2W9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtTx0NA26Dl9MiLmfWVETBIRP3qDI8ILMhx1+NNDDgnfr9G81UT4vn+fEn0ba4qBxUmWBnLpEV7hY/LXLTYfigt0hfLa1NLbQRVnAK/PjaY0ksr/eBCCd+j67qm5EmXQS4mZtAMFqvCFpa08LK0skPNGUu26vCdJUQu/Gm2NTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qqGgidLW; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qqGgidLW"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe528e9so900856d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788792807; x=1789397607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ2fjOmOWADKjy9JVfCK9DXQhlrOJjV6jnCnErtXuu0=;
        b=qqGgidLWDLI3rx5QV3+cok2OsjcRRciNAe8z/6vq1xz+l33ZXuxT01PJm3lWFuKDna
         mrMMvq2ZcPp5smupfc77ShFrR+feE3IDgh7Sx2AJYT7LwxQFiL47IPL5vhH+IWxbwpWK
         9UecyYEn5E0iPo6Ola9G/Y6n8m0JPhrCWshJW2+mdogUXqLyUOniX30qTy4Dt8jk2wVn
         1yMbgKtTZIyFLpZXOb8AqGAh3RPQ+AZXZrU54t19D2yJdCdnymXidk5HxsX3BkqbMOyq
         mvVzphQ0PWeO2Qwy53VjWtmTMPglXKsGCkbVFvU68NkdRW44i8KM0LAobvruh3kIsoic
         QaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792807; x=1789397607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ2fjOmOWADKjy9JVfCK9DXQhlrOJjV6jnCnErtXuu0=;
        b=QDZ/qAThCKzVTkO4Vfu9o92SJX8wBmfgVJSj+K1GNmAk4dd0hSeoOy69KJkwDeUa8I
         5uJxoTQtTlki1sOyVQaAH6kRpTmFNTROi7Jk/GI1FaKHiyUjVZunv6Rl44w7LbmcZ+vQ
         0rCKFQIJJ+Vb/8lbagSm2DwYtYYXEDo/7LIZTTKDBK17XDMWKKaaUNmz/RniIQfFWV5p
         c3Od6oNUzL8vGF+LbcG5t3KrACsK+J231f0Jm9iCiyOz58O6h12cDl1JW8HSxHywbZlG
         ZUqm066QxjCpnbQfRUAgwkzA/YaNTfvmmLPv5lngZabNRihFyVGQhNfRQ2I43q4MIDrL
         Weow==
X-Forwarded-Encrypted: i=1; AKwUvBzIhRGLWEOC78J1Nh7gSP+L2AbcONi4C/+LjzR4bcWNCoYSmv3zrB2GCIwWemuXHVCb9A8RsYIPcVWrlbU=@vger.kernel.org
X-Gm-Message-State: AFuF++m1cjpKh6DgP+0Bu3lyyv8plx7cSfPptVASDnv5tOR51mxVf2i9
	zT3UkuSaZRxZKcKdMRWT4AuTQdvzeN63hKRmfym2/h1pdIngJBVqXKZsOVZLFhGvGTE=
X-Gm-Gg: AYBFou3xMGV9v/CHziVZc/WiPE5911uH/JM51cdqTFteNVIrW9VGqYyOzf3Y1wHrwyq
	k42ycW0lLuzI+XSgDYIv1VJVee5q2W97N7Kxej5fA8nKGnb+Jyb3TfChAMtKR/2kgmQ5kgKmlAa
	AUo9Rr9/yj3HD5f3olPk0ikYfK4bSWcdqi6aU/2vGk2r/mspcccDajyzwfDElO9wFwkfdWQOFj0
	Ye4L6jWpeWTSOY+w/sLMpQMjNnoSZgjvpJa0bs73bSYeWpe2LH+ujeD9wsL0VfpyU87tH5ok7OD
	B1f2Uik3ssguMsk+9ypD/RxWHX4BrM+7tk0wtbJa50WVhRU2x6WWB14Uq1MhRIbKMe3x6wsXqOG
	SlEhA+yG4vSSN6/ZkV0n/fYXXPYjxeU24o/Ocf1u5c10pJ2RvduFt0MPPshY4n0vloKiEdPxh0I
	j6U2w8Vomq4zKn4L6ICZEXS4R4MAFwBVbQpf3WNBheBx3F5UqtFr/nLfrnErM8JjCcqsDFV0mbt
	L8/Xrk45QUSdOCd9f1e2jHf4vrfOv+/z6xpnG/3DikmyajTvznoCHlK
X-Received: by 2002:a05:6214:4001:b0:90e:940d:afe6 with SMTP id 6a1803df08f44-9106202083dmr14557396d6.15.1788792801917;
        Mon, 07 Sep 2026 07:53:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406afe48sm93131566d6.43.2026.09.07.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:53:21 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:53:19 -0400
From: Gregory Price <gourry@gourry.net>
To: liuqiqi@kylinos.cn
Cc: akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, 
	mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: page_alloc: add trace_mm_page_alloc to bulk
 allocation path
Message-ID: <ap7Pbm70m0pw_NqM@gourry-fedora-PF4VCD3F>
References: <20260907120949.418450-1-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907120949.418450-1-liuqiqi@kylinos.cn>

On Mon, Sep 07, 2026 at 08:09:49PM +0800, liuqiqi@kylinos.cn wrote:
> From: Qiqi Liu <liuqiqi@kylinos.cn>
> 
> The bulk allocation path in alloc_pages_bulk_noprof() does not fire
> trace_mm_page_alloc for each allocated page, leaving bulk-allocated
> pages invisible to ftrace, BPF, and perf. Only the fallback path via
> __alloc_frozen_pages_noprof() is traced.
> 
> Add trace_mm_page_alloc() after set_page_refcounted() in the bulk loop
> to match the standard allocation path. The tracepoint is gated by
> static key, so there is no overhead when tracing is disabled.
> 
> Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
> ---
>  mm/page_alloc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 12fac9084c48..d17c21775cb2 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5280,6 +5280,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
>  
>  		prep_new_page(page, 0, gfp, ALLOC_DEFAULT);
>  		set_page_refcounted(page);
> +		trace_mm_page_alloc(page, 0, gfp, ac.migratetype);

Sashiko asked whether we're also missing kmsan hook here as well:

	kmsan_alloc_page(page, 0, gfp);

Might be worth a quick look and just adding both in one go.

~Gregory

