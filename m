Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1724B43CE70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279295; cv=none; b=rijx7Lqu9WJWxCLmCPfJccvFHZ7BPpH+3Fbvkb+cDZBw4TJ+OoItYFu6mNpImJM7HvEHWZm/LIqvUIdzvpnjbbZ9HrVLwAeskpxMIuPEUznKOBKNlXQ4H4LOeaDg3cWt7G7Pg4uq/9PIo3K0t8ejPqudjsuz7bSL72tdRjO3VjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279295; c=relaxed/simple;
	bh=QSE1fX5b8UrB+kUAEtdWp40GzfR8DdvOuloaOmn5bds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ+PHNtaTVbl2q0xssstV4dokbaws/RNvgp8auEHsrU21k5gKitUiAaJrg7vZWzsisbO0Lm7N/X8j3dyZQfBIY6PBq1E/NpHurLKz7suNtJMOWQeofZbSfb7x/WW6pzrm7SJU8/3bIEEdGa0pyilf0J0C5YOnxSIkLF/rt8hFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8LA0aNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8LA0aNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664B31F000E9;
	Tue,  1 Sep 2026 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279293;
	bh=UpGvZ/6DOWCtk3ukkVrOi+zOXCa7mjUjaVjr1u6xFiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e8LA0aNfZmdy0npvHzO0TZxZ6Cm1N+lY1h71iSuixLrt1AJKuBsrlcgyO0Nlftf+4
	 14UTYdv49yO5un6vvj8+WNiRQRbhyAgUk+YEr8wmhFdwPlVSncQMpsXKqgAzpwdoPz
	 ZiK3Grl49WtZsHmRB3iqwQ7QGfYT6Lg7QyKpCofuhk2fxMfuFQE3d21G9hk/Wrpy+z
	 oo24q37vlkh49VlJ8opNB22U026en1YtjbEkDlstDQaNfsuLBAYDiRNybRW4VtbG+Z
	 0M0X75wL8vw0i93QRblV4qcZrE74t+y15VibNjc/4z16cuIX3Q5lBB5A0AaLhfhId/
	 lXPurPaP5eT3Q==
Date: Tue, 1 Sep 2026 19:14:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
Message-ID: <apb59oxMWqhtL-LC@kernel.org>
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

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

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
Sincerely yours,
Mike.
