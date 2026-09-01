Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA138C2A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271623; cv=none; b=ljFT/0pc2d9CU/qxf+Wma7kFihH31fou7nprElaW6jWbelrEwwRwjNM21S/pPWOdZQCCGNib2CLKpRTzouZMHOR+6yXEihDIws0WaqE+sws0jOq1+7Y+XvmeGXE8+l4mtm5eQ00uajDMfGV8COk8EvCw5v3sgcpciHC03hbxMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271623; c=relaxed/simple;
	bh=s9wH90IkEfj4svKmDN1IKJ2ekEfKRcwsrvHld8ehUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2v9ZLQrlBjxtXQHYyMqa5hATi3lOI+HKcx7Q5CXJ0DxZBIMQbWfTvoFOXcTClpdtMp5s5Wogr9HuIhBd23mDn2UYaCjFZVG+xtmyKbN2XPNu2lXSef2NDCHtNhQkPByNtKEtjxVJ7XRfwiMK8Kd6/iRhwpn5DMgSsJHHRdc/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZz21cI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZz21cI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882191F00A3D;
	Tue,  1 Sep 2026 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271621;
	bh=U694HL5ojZa8uw66A72yukjcRjflrodlQXMrYuMj1do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZz21cI9D+NN9OF0A//H6XEzlV3SxcJjEPiGFrlS77mbI0Lb3NK/tlxmleC6UUeQE
	 1zZ6YhL3ZXCjB4MrJnjHG69Wg7bJ2JwK8ImtTUSewyoftUaH2CQv8GoCxW5l59/8tf
	 /DyjSchVeYoqHbDubAU+9jERc5CXMGW8KW/1aDhTUQaIXaybJUdq+2Y3xcoTVDJkxk
	 2nZuk5COkxFaiq9u+1n/dFr6nDsUAe4axVdacY8VR/9x2FJNow7zbaLxOwIyt9UpfZ
	 MRD1Dyl38DezY2IZCNZyv0ZI6ieHleMwsPP4sXM1g0ofh2+iaG5WI8CQztjzISz9g2
	 CWxFb6xprc9PQ==
Date: Tue, 1 Sep 2026 15:06:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
Message-ID: <apbbw0A0f98nlVol@gremlin>
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
 <20260901-mm-remove-unused-helpers-v1-2-f092d086f7dc@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-mm-remove-unused-helpers-v1-2-f092d086f7dc@columbia.edu>

On Tue, Sep 01, 2026 at 08:59:20AM -0400, Tal Zussman wrote:
> totalram_pages_inc() and totalram_pages_dec() have had no callers since
> commit 7fbc5e26123e ("memblock: extract page freeing from
> free_reserved_area() into a helper") and commit 287b89773d81
> ("powerpc/pseries/cmm: Use adjust_managed_page_count() insted of
> totalram_pages_*"), respectively. Remove them.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

With additional change requested below addressed, LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/mm.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e3736c42c4db..c105a3758915 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -57,16 +57,6 @@ static inline unsigned long totalram_pages(void)
>  	return (unsigned long)atomic_long_read(&_totalram_pages);
>  }
>
> -static inline void totalram_pages_inc(void)
> -{
> -	atomic_long_inc(&_totalram_pages);
> -}

I also see totalram_pages_inc() in tools/include/linux/mm.h - could you remove
it too to keep things consistent? Thanks!

> -
> -static inline void totalram_pages_dec(void)
> -{
> -	atomic_long_dec(&_totalram_pages);
> -}
> -
>  static inline void totalram_pages_add(long count)
>  {
>  	atomic_long_add(count, &_totalram_pages);
>
> --
> 2.39.5
>

--
Cheers, Lorenzo
