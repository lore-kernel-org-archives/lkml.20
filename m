Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329598;
	b=jItN3PkgAxVWEQtaXZvWMrfvdO8eDyNwlIQfojEWNPQQ3+pEVARelG14Vp2/67Px/hQ3
	 OkbuSLGwo2u/nzrZGuvGYLZCuhVpi4C9B9gNUhOLs39TlWkyNgE5h7W9kCnxiw4z7VojF
	 SuwZ+Ib2mT3iVQLi+JV3i4NLJyEH66CjDgmxE/FnI8YkD/cz0bgB39ju6Umyr0bRs175K
	 oNVBHUQqtK4//zLhSCp1bXehryUXb5rRGPHVLtPKHBD/AamwrEoeivJtLqBUmMagGdj8T
	 dk2TxkkM4kw0VTgrIqM/UD/zJx1+vassjW9QRYvOrhvTsgmFEM7boMdedmi6Qs7qs3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329598;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i2VJTtYw7p41+nbQfzio+hE0iHbWtKdnYrR8e4ZzrjQ=;
	b=Q431xVjGOvu5TJDLamXaw0A93JDf7aDbixIO7lZXrHkQmxDPdNeXd1c32+GObFcIwyfZ
	 6Up5/H9rVKao4hQDfYCSINYJESyOI5l65Jj6goVFiYCx6mvMoW+J0XGybnCEzJnFXeRf6
	 KIvbrC8eiDrc8hZD9BLkM0WuOEJjH+LFwiXkuCwDZ7o1Xd/r8p3ufL0VCEoZJJvrQsRQa
	 MD8jTvOMjP9Oen/y6rCxBa30W4CQgO9twixFgixp3EfC2A8Zj0D4ulzoTN6nfkfs7dIr0
	 ggUYpn4fRfE0na4XiKVDIney/Ly2wB144Jjbkj/hTQTYfcJhJMhsy+MKI5JXirPjBUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xe34Pdrc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A26606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A26606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xe34Pdrc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B9151477;
	Tue, 10 Nov 2026 08:53:13 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3ACC3F85F;
	Tue, 10 Nov 2026 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794329596; bh=GKYJeH4RqLoW0npt46xF2JW0pmyqRHWIS4lSVGmTTLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xe34Pdrcs5eclzRe8DMJrEqP7QHEqI+DtkZ3gnyOAg7F6rF0Xiw5kfgu4ab3VztSF
	 jFiJfejd7smBSDUHt/QND1knom/6Y1EEUnOrwv0lbN5Sh48Z/C4YFmV9rWZQaDwQ7d
	 HKB6i00WeQPP4tIsQIf15BcO38OAy9sNM0ITSV5c=
Date: Tue, 10 Nov 2026 16:53:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: kmemleak: serialize disable-time cleanup
Message-ID: <avNL-a2YoZ3zqnoi@arm.com>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com>
 <149d93f2cfe20d355f4d9882ce2bf99030217772.1793871596.git.tongweilin@linux.alibaba.com>
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
In-Reply-To: <149d93f2cfe20d355f4d9882ce2bf99030217772.1793871596.git.tongweilin@linux.alibaba.com>

On Thu, Nov 05, 2026 at 05:52:49PM +0800, Weilin Tong wrote:
> kmemleak_do_cleanup() drops scan_mutex before removing tracked objects
> without kmemleak_lock. A concurrent clear command can therefore start
> another cleanup while the background cleanup is still running.
> 
> Keep scan_mutex held until the background cleanup completes, serializing
> its lockless removals with explicit clearing and report readers.
> 
> Fixes: 2abd839aa7e6 ("kmemleak: Do not corrupt the object_list during clean-up")
> Assisted-by: LLM
> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
> ---
>  mm/kmemleak.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 20c0eb41c..d959d11f6 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -2507,12 +2507,13 @@ static void kmemleak_do_cleanup(struct work_struct *work)
>  	 * function.
>  	 */
>  	kmemleak_free_enabled = 0;
> -	mutex_unlock(&scan_mutex);
>  
> +	/* Serialize the lockless cleanup with report readers. */
>  	if (!kmemleak_found_leaks)
>  		__kmemleak_do_cleanup();
>  	else
>  		pr_info("Kmemleak disabled without freeing internal data. Reclaim the memory with \"echo clear > /sys/kernel/debug/kmemleak\".\n");
> +	mutex_unlock(&scan_mutex);
>  }

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

-- 
Catalin
