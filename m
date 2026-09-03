Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B025B083
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421321; cv=none; b=JlSf4XRPBrDPNctgReMmMn7uwWlIE0Y+NfffpD3vMdUMDeJzggQETydFgLgsXebGWD1z22tD/soSXZxR97Z1HHqdeRdsGsuPDi5tXoy62A7BiFkt2q2YPDnEKe7YD+5LD74qpiAzDkw7MCJ4YC+gOJtpZX3U4t9jdqrL1aeVPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421321; c=relaxed/simple;
	bh=r2mySitCm8xZAfu7BGhS1SrRCHq8wTD0UYn0zUS4Mm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbrDiGH8jUfARnQ68pJp0esnTc55nFvDsytOqZVUgldVHS9/lAyoCLM6AXdEh5WiYnJxZPrEVXEIvGb3jlVpGQFpKVVcNbJMMmOXZD4dkHs+n9XHou8xdPuVObIiswe0p0HSPYutdyGhLS7VMXIKYSAycYMobBCvU0yJr0fijvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OXii/lR9; arc=none smtp.client-ip=95.215.58.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OXii/lR9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r2mySitCm8xZAfu7BGhS1SrRCHq8wTD0UYn0zUS4Mm4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788421317; v=1; x=1789026117;
 b=OXii/lR9UHrPY8uY4GTmcjcxIudOQS3tOGTvevDFPd4vuWFleg4BnVElLPHCSwORl6ywsYsl
 QQxfR7swoQK7olcNLbe9PJHqlEfF7024jn+HWMwdlCdD+jVJysEZs+2iiVPSfh8aY4MJp9LK2pN
 O+1+nvBtvSbWvUzzQQNklRKU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 40945f90da2aaa8b;
	Thu, 03 Sep 2026 07:41:57 +0000
X-Mizu-Trace-ID: 40945f90da2aaa8b
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 15:41:51 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, lyugaofei@xiaomi.com,
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com,
	yuanchu@google.com
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in
 isolate_folios()
Message-ID: <apkkvyLNEt4_ETiz@fedora>
References: <apjM5ZBOJrdGQM_g@fedora>
 <20260903070500.76379-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903070500.76379-1-baohua@kernel.org>

On 09/03/26 at 03:05pm, Barry Song (Xiaomi) wrote:
> On Thu, Sep 3, 2026 at 9:27 AM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> [...]
> >
> > Thanks, Barry. These number is very convincing. The retry for swappiness
> > 0 is worthy. Then the patchset feels like doing two things: refactoring
> > the for() loop; improving the eviction for swappiness 0/201 by adding a
> > retry and this also makes them be consistent with (1, 200). While the
> > cover letter subject, patch 1 and patch 2 feels like it's not easy to
> > match them to the corresponding part. Maybe merging them to one patch,
> > or rearranging them? Just personal opinion.
> >
> 
> Hi Baoquan,
> 
> Thanks very much for your suggestions and review.
> We have two patches:
> 
> 1. `mm/mglru: make type fallback logic explicit in isolate_folios()`
> 2. `mm/mglru: make retry logic explicit in isolate_folios()`
> 
> One handles fallback, while the other handles retry. I think this
> separation makes the logic clearer. Could we keep the current
> separation?

Yeah, it's also fine to me. Thanks for the effort.

> 
> But we may really need Andrew's kind help to squash the change
> you found below:
> 
> 
> From 1fb8046662a8b23be1b87a21cc9964e9ff9e1eb0 Mon Sep 17 00:00:00 2001
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> Date: Thu, 3 Sep 2026 14:48:52 +0800
> Subject: [PATCH] mm: revert slight behavior change for swappiness 1-200
> 
> Baoquan's review found that we unexpectedly introduced a slight behavior
> change for swappiness 1-200. We could now have a case like:
> 
> 1. First scan -> `scanned != 0`
> 2. Second scan -> `scanned = 0`
> 3. Type fallback
> 
> Step 3 was impossible before. Let's remove this possibility.
> 
> Reported-by: Baoquan He <baoquan.he@linux.dev>
> Closes: https://lore.kernel.org/linux-mm/apfZQE1X6zGAsBb_@fedora/
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index bf2786c7247d..ba7adf36e69f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4939,7 +4939,7 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  	 * We are running out of the current reclaim type. Fall back to
>  	 * the other type if allowed.
>  	 */
> -	if (!scanned && type_fallback_allowed) {
> +	if (!scanned && !tried && type_fallback_allowed) {
>  		type = !type;
>  		tried = true;
>  		type_fallback_allowed = false;
> -- 
> 2.39.3 (Apple Git-146)
> 
