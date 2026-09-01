Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70C4756AE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258925; cv=none; b=eEc16kiePe64zyJQ5uGBuZr+IwaB1awszjb8+Q9VxvM9nwn3eK8hrQqyIz9umiZxQjxVRZNZzSPx27SSI0efk8q6wkih7dOaWfjsNRGjEukhbQ7KihcjIy6TDEpVD3CG+LzaZ80rxpxMNHtqtD0V4gwMyk3Uasv8DqlyGotGu7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258925; c=relaxed/simple;
	bh=aw9k60djUqep7PosMklBHBSSfddhEhOp83WNis3Iua0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTCPNP8B7ipfv4DbYR+JvNTLH1eEvoOtKedy2pEoCBCUVV7x3hi/F4I18TWpbFM9ace5mF1StYEDE2iTx7fQWtHtKRunkR6Hy4N4OkVB2Cv+BGIz+84J9kX1GlvCom3To9L+nJotVV725OXmEscnFvlQxoLk20JgBbD8gMa549g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXuSImGD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXuSImGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539491F00A3E;
	Tue,  1 Sep 2026 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788258924;
	bh=vcCpSEftgA430RoM1FBDWtUuyGK8FaBAzL5tRn5s8zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXuSImGDshsC4cMw06Og+zCSkRUrxIotWKrIurPV2r5a//sQklqZqXJ2pQnRp/NGJ
	 eHpbL9vnBaHsA+RUhHdpCWd6M8gZJdYoSKuoco+SwglBa32xOOPPXWMOP48TsaBOql
	 3rLj2othD9ZBlqSH0QGklrOg3xCfjm/pE6hw52OPHWQpTjGXCbtxORz6TuuUj/1eRw
	 5eQX2nuIcnUF5oTCEOPUPf5pnnpXamchYWVRyryc/i1OccBRTask/gkmpD2KqsPaQj
	 +t2hE/0gwVxIPo/ifZCo1td+HYFneUJyROwonZEblR3RkcroOr9riQoERgEU13vAo0
	 F2kU2R3ymXfkQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id A5ACC1980070;
	Tue,  1 Sep 2026 06:35:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 01 Sep 2026 06:35:21 -0400
X-ME-Sender: <xms:aKqWagsNt5TTV4gNgXZv315Lf8cdhJW2t8g3ySjbdpuhAarRq_jl6Q>
    <xme:aKqWalA_Xq7_s3fbgnGzaZWx-otnKzHgXcPY1as0MbtgFyqa35LmwaEfrtGBb4Hbh
    OupnuQVrPdKjdQy5QGcEWiGgbnPSb34i4pXkjnw6poAYqrEFRBROLGW>
X-ME-Received: <xmr:aKqWarbfbcPjzbzfKU3pkfrtXQfEiRUzWDmJ1hxPJ0os5et-UQQn2RUlvZc>
X-ME-Proxy-Cause: dmFkZTFiNb433Q2Ib/Q2x5Tb/4fJV8R4aY9r3SmdNboMtRz6Yw9Dgi3VJue9v5So8a+3MX
    c8D5JOWRer9UtNw34dj/pFkuNTqEx574YOQuIJnWF1VTpPE1UxviOWyB/6xe9WD02Vwldw
    JlDOX17LoDRvA8e2NUMfZpnZMzDayPynx8l8SHwrlGTrs4F0UwLCyL9ROUV9+XC3gpMpMf
    /yFsNvsuUyH1amP65pfRfAGTMrIcTnRl8ZGqeI38P4WJ14uOAMw1z8CCC+CEk0eInXqQsC
    OdH8W6nIHpsooSUt7rkU6agVnxag7Ep7LfdC9ruY0VEnlLLkrKHevYBMy7v0U422JUJkr6
    ga7jPiK3xF2RTpK0L5Wp6bZN/7855JjuBlsxScXRS66u8fe0eSaw+Fs0dwqtQv1PY+2DaW
    Kh32s9Ae+8h4FerOMfa31kCiJT9bGNunOe8k6onHLb9vCWueohqLVm0dqGxa/wmqw1ZmCt
    gfXVfB8UmAh1iP5Q3JKn7YBFWGMczIi7l/6rEa6tDxQymL/IJwRLysGrn7Gs266djH4NaH
    rCOaPVYQ26pwBxQ31eB2DWmhTVnyj/DYVcMNCet/D8mtOaHcEJJ1uwzMeOKRcjToBWjOZK
    OJ9P52T/v+4Ml2vpzQ6FX1Iss19dPN7mKpHXv7uSue01Xm2m3Dlky+YB906Q
X-ME-Proxy: <xmx:aKqWav8jQbCBf0d0UbO-aeNLn7jzbvgdFa0O-lizsk8U2TkuGzjtMQ>
    <xmx:aKqWanj1ePc6ksqrncvGqdGffNYL0t-qljzEnBot__oZhMnP8JFBZg>
    <xmx:aKqWaiiSMEXjcRacLgnTDvj_3pWhpdSFxRh_9k22qkxdBaZ5nvm2BQ>
    <xmx:aKqWat5G2vtz8fwGPazKHNlBrNvQiPmivEKQCTs-_WcBJXUQT4sUjA>
    <xmx:aKqWakTsqQHhDVe1-YddCq2AA021DMF7cbP5ZdE14e9nKjgS7ImAxnP->
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 06:35:19 -0400 (EDT)
Date: Tue, 1 Sep 2026 11:35:18 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/gup_test: prevent overflow in GUP batch
 calculation
Message-ID: <apaqJk91uAN-zD66@thinkstation>
References: <20260901083452.115365-1-sarthak.sharma@arm.com>
 <20260901083452.115365-2-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901083452.115365-2-sarthak.sharma@arm.com>

On Tue, Sep 01, 2026 at 02:04:51PM +0530, Sarthak Sharma wrote:
> __gup_test_ioctl() calculates the end of a GUP batch using:
> 
> next = addr + nr * PAGE_SIZE;
> 
> If nr is too large, it can cause the next to overflow and wrap around.
> If it wraps, the next > end check is bypassed and a large value
> of nr is passed to the gup call, even though the pages array was
> allocated according to gup->size. This can lead to out of bounds writes.
> 
> Compare nr with the number of pages remaining before performing
> the multiplication. Clamp it to remaining range so that next does
> not overflow or exceed end.
> 
> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  mm/gup_test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup_test.c b/mm/gup_test.c
> index 44c1cdfb9c37..910cbef709b4 100644
> --- a/mm/gup_test.c
> +++ b/mm/gup_test.c
> @@ -139,10 +139,11 @@ static int __gup_test_ioctl(unsigned int cmd,
>  		if (nr != gup->nr_pages_per_call)
>  			break;
>  
> -		next = addr + nr * PAGE_SIZE;
> -		if (next > end) {
> +		if (nr > (end - addr) / PAGE_SIZE) {
>  			next = end;
>  			nr = (next - addr) / PAGE_SIZE;
> +		} else {
> +			next = addr + nr * PAGE_SIZE;
>  		}
>  
>  		switch (cmd) {

What about this:

              nr = min(nr, (end - addr) / PAGE_SIZE);
              next = addr + nr * PAGE_SIZE;

Seems to be easier to follow, no?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
