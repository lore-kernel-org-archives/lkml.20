Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120D2347FEC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673740; cv=none; b=VqdOLFW7g9F0LBcCktBc8iv75lFotI7OTh+EmMDbS2hEfnSQ/msezTZPF56lvs1XEipyodt7uvgvDWL2Zjnw7XQ0uPDCyxUyViLpxbA35R5Z+M+tXB5LXAYAiDhMJSVSK7R8+qv/OJfX7l7FT1/L2MohsN2M90lzYP3Pb8584jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673740; c=relaxed/simple;
	bh=YnsaxkvYSmVBJbx+TXtv+AuajvqXUcz88gcYsHBVh6Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XT3r1DBKrr8hpoxj5Olg9R3NVDNRbXWAMpC7rNH0SKeQy61s9CntWxiV1IKvBTCab6rulpfX6pMHyo6MlWAGzGV+4a2DXyumykFiUPwjv0A7LCop3cPTUcchbqitNy7ipFFcQW4meQ6Ikb1eNHxl4zhDu2IKyA4B8hlJAxioSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f4v/YhLt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f4v/YhLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9E41F000FF;
	Sat, 10 Oct 2026 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791673739;
	bh=rAXy/cK21ZmeHIqHlk18cF/HDJsVMpirRnzgaO3i4qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=f4v/YhLtx13bm86tsULK8CBGPMecMSpR+qAduWLeb94ZfAD37o7gaj8gu/MM13rjD
	 qqavHG9bGLie/HVhg0Aby7D7sxz5QM5zylu6sEG70mVnngKNrSRN1pH0sT6bFsbBzb
	 aslhdG7rpBc+Xfj9UCXCCtYx69COkzxPb3cuVz9U=
Date: Sat, 10 Oct 2026 16:08:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tuo Li <islituo@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/test_meminit: handle kmem_cache_alloc() failure
Message-Id: <20261010160858.453c904ce17dfa8868ba3f9b@linux-foundation.org>
In-Reply-To: <20261009073040.2995938-1-islituo@gmail.com>
References: <20261009073040.2995938-1-islituo@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 15:30:40 +0800 Tuo Li <islituo@gmail.com> wrote:

> In do_kmem_cache_size(), kmem_cache_alloc() may fail and return NULL.
> The returned pointer is subsequently passed to check_buf() and
> fill_with_garbage_skip() without being checked, which may result in a
> NULL pointer dereference.
> 
> Handle the allocation failure by marking the test as failed and
> continuing with the next iteration.
> 
> ...
>
> --- a/lib/test_meminit.c
> +++ b/lib/test_meminit.c
> @@ -241,6 +241,10 @@ static int __init do_kmem_cache_size(size_t size, bool want_ctor,
>  		}
>  
>  		buf = kmem_cache_alloc(c, alloc_mask);
> +		if (!buf) {
> +			fail = true;
> +			continue;
> +		}
>  		/* Check that buf is zeroed, if it must be. */
>  		fail |= check_buf(buf, size, want_ctor, want_rcu, want_zero);
>  		fill_with_garbage_skip(buf, size, want_ctor ? CTOR_BYTES : 0);

Thanks, but we have an assumption that __init-time allocations cannot
fail and so they don't need to be checked.  Because if they do fail,
something has gone horribly wrong and this kernel cannot work and a
later null-deref of "buf" is a suitable way of reporting this.


