Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92949DB80;
	Fri, 25 Sep 2026 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374503; cv=none; b=Y9qjzI6Fn1YSbc4oKC8DUFfHZGLD8/zBZb8vrUiAV0NbakvK3OJuxF3QvpWvuDXmRn+LtOzoVW73h9JtNXR23ALKh9f7mCPvnLWYQcXamiSegCVJabo3QSl6dmMcECng1dPL/1fYiDVQZOMmY1bhiRq2OQsD/JrwgSvBnK9D3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374503; c=relaxed/simple;
	bh=2q+RDUY3jyCj0avmWeJvTt1W4LILIcflnxTZ01CqvDc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lovyu8+546CYDafNU5wPa7ZR+XJoJ7dHNZh9KUEM0sWjw/lXD0v2H/yLrsm3F8K4QbTlgzuFJFTa8Mk2P9jQDJuZJhnOX7z0brECFf7aAhZMJHQOR7gCxgNRkNHfLUqEK83hB+f/cd+v5WxBNUsQmnKaL5lVBJJaUfoXrzrfY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qxVDR1bg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qxVDR1bg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F4B1F000FF;
	Fri, 25 Sep 2026 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790374501;
	bh=Gv3eO9GNPrNvYVMn07KZEaWja3PX8hQiFyYjoNkPaLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qxVDR1bg1fo5VwO2/RGg5Vtr+CwwYlXKWaJbHeaOFrsRIEK1O6pCV38B9XtQQBxr6
	 hAlcZq47eA0Wku2HzDmgfyqeJG9EVIDe40BQoTe/mo/gXl0SW20FqiNtv6b60Ne3/8
	 BCCJDOSTtZbkTRGxu+3ULtmDL5DGFlj9DQTXGrRw=
Date: Fri, 25 Sep 2026 15:15:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Brigham
 Campbell <me@brighamcampbell.com>, linux-kernel-mentees@lists.linux.dev,
 syzbot+442828bb356b10813a47@syzkaller.appspotmail.com, Uladzislau Rezki
 <urezki@gmail.com>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org
Subject: Re: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in
 pcpu_get_vm_areas()
Message-Id: <20260925151500.75fcb001ef8cd7f4842e62aa@linux-foundation.org>
In-Reply-To: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
References: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 21:54:49 +0100 Palla Raghunath <raghunathpalla.0209@gmail.com> wrote:

> When pcpu_get_vm_areas() has to split a free vmap_area in the middle
> (NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
> per-cpu ne_fit_preload_node if one is there, and otherwise falls back
> to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
> pcpu_get_vm_areas() never preloads, and a single call can do more than
> one such split: on a NUMA system it places one area per node group, so
> the first split consumes the preloaded object and the next one depends
> on the GFP_NOWAIT allocation.
> 
> That failure is expected and already handled: the recovery path returns
> the areas clipped so far to the free tree, purges lazily freed areas and
> retries. But the error is checked with WARN_ON_ONCE(), so a transient
> allocation failure under memory pressure or fault injection triggers a
> kernel warning, and a panic with panic_on_warn. syzbot hit this on a
> two-node VM while creating a per-cpu BPF array map.
> 
> Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
> a bug, and take the recovery path either way. This matches what commit
> b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
> for the other va_clip() caller.
> 
> Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
> Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47

I assume sysbot hit this via fault injection.    The report doesn't make this
info easily available.  Or maybe it wasn't fault injection.

> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>  		ret = va_clip(&free_vmap_area_root,
>  			&free_vmap_area_list, va, start, size);
> -		if (WARN_ON_ONCE(unlikely(ret)))
> -			/* It is a BUG(), but trigger recovery instead. */
> +		if (unlikely(ret)) {
> +			/*
> +			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
> +			 * Anything else is a BUG(), but trigger recovery instead.
> +			 */
> +			WARN_ON_ONCE(ret != -ENOMEM);

Look good.

The WARN_ON_ONCE() is potentially redundant.  We could make va_clip()
remove __GFP_NOWARN from its kmem_cache_alloc() and let the page
allocator do the warn for us.  Doesn't matter.

>  			goto recovery;
> +		}
>  
>  		/* Allocated area. */
>  		va = vas[area];
> -- 
> 2.34.1
