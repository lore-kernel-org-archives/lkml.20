Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317855;
	b=oUs/6feP6LLBJ1gfKqczhR7Vv1v8MWUm4qMgPLRBsVxDYMZ3r1gOLKehHvc1acpM7K7c
	 JfTnk5j7w4jExW4tVkOAdCbbnpOMEnrIPbo2aDcxCoVAMfkAP64dGYvaQ/bfUQyQIbp/b
	 aUttkPK6SJAi6TRMVqNNjiV6IGMcu3FUQzySlPesLsE+YqXCJBrP/SrvpyGFb0GcjNtt8
	 86thyU8qsDOw1pG6CnqSP2IWG9/izwGNL5dqV7aqhTXeekg79Ojbj9XjnIPc1yk8PN7cO
	 m2mfj89bNJnUW9yuj4zIvaPAtdMIXKP9V5HifUfLGkb68HgIrtLQgT2zV/TzemL7asw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317855;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mZHrabfWk4S2HUCqdB68Rskp0Af4pRxUMfzSm1U1JdE=;
	b=x1InVthvxlcgFjefwQ20o8YFOdQeT2RXNOrVxt/pvfEtk9ttHEnkaN41crC+GoirP8HE
	 KQ/So4rebK5niz9/lK0AWIw7v+e8DsaSIdx/6+ekGg13l81qfb6PqxKRyd8Q5kqjPk0d4
	 is2htyzUxc3CdjijMep6chbaXC/Q8MPKR7ByjnwJNOl566rse/dlKmwmBBL24uuYQ1DSz
	 YcXDE9a0PhYqfDXLxsNVzIRdCwYU/HcB6LKOxngfO/GPVDeZrkbXN+6Lo4D6q9glLusiN
	 xMh4yHip8WhOgopgehOp+s8KSFxd+ViC7y3WC4U5ocbvX5A8crkRNVw+imRWf4jS0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QRR/ihPC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8780606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRR/ihPC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0880C1F0089F;
	Tue, 10 Nov 2026 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317854;
	bh=mZHrabfWk4S2HUCqdB68Rskp0Af4pRxUMfzSm1U1JdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QRR/ihPCYTxS6rbD4+czUP/fyN+1My280e+0RDFv1ILWSPIXy1e6pJYallZfxpona
	 s42yRP8xnZvKzdGEmaJCk2DcEvbHjBAgm8/f8HaKuLgmmYNe+L8dJHUaeBqvWxr/jm
	 xv5n9hPYyaO4TQwWp8bBoY3qYs+VgmlrnhG2vwQVQm07tVfa8ovhpXCb/y7PCt+Gso
	 rbmI7FpZKlcDmugp0tBK/vzVs+RJxcZCFy9BDNNz8NXUeu2tdZM3QEL5KLqN18Ja1t
	 QTIlEJMQWFHCd2kjHbierwai3L+jWV7ydbgQn2hRhaqZxtylTaE3km5aTKDNhQGbeL
	 Y5Cmf+C+N7FVg==
Date: Tue, 10 Nov 2026 14:37:32 +0100
From: Harry Yoo <harry@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Hao Li <hao.li@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH] mm/slab: remove outdated comment in
 create_kmalloc_caches()
Message-ID: <avMdQuXxfqMCBbBA@thinkstation>
References: <20261104144753.2266231-1-ekffu200098@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104144753.2266231-1-ekffu200098@gmail.com>

On Wed, Nov 04, 2026 at 11:47:51PM +0900, Sang-Heon Jeon wrote:
> Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
> removed SLAB, no kmalloc cache is created before create_kmalloc_caches().
> 
> So remove the outdated comment.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  mm/slab_common.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index e66c0778ee98..c4a386f0dd90 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1029,9 +1029,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  }
>  
>  /*
> - * Create the kmalloc array. Some of the regular kmalloc arrays
> - * may already have been created because they were needed to
> - * enable allocations for slab creation.
> + * Create the kmalloc array.
>   */

LGTM, but maybe let's just drop the comment?
The name "create_kmalloc_caches" already covers
"Create the kmalloc array"

>  void __init create_kmalloc_caches(void)
>  {
> 
> base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
> -- 
> 2.43.0
> 

-- 
Cheers,
Harry / Hyeonggon
