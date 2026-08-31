Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F04AC2D6;
	Mon, 31 Aug 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189489; cv=none; b=Rhz9dICckU0z4RuKUeKwX1CCV5ulK21L477eOBHo3LRrrweOKhAUVxlAdD1MTQKAF6SXK0XlMHe/Tqpa/9DGfz6aQ8U8HceZcJs8vVzYByyl7r4RRsyPdtqbGp7TPHYUTX95uZ6qOo9CLXLEJJa2Lc6tN/CtxlSeuAujccF6tWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189489; c=relaxed/simple;
	bh=Qn8ysqawlZp/yUSDmvTipg4Ff5TdWXrtRIygf+X6Oz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tappqg6qFpxZMBprqCTTaf5AsM2a1tJ+wuVN9KIrtGecpmE5aQlT7VTPFFmRlcoAwtPwuWywlL9YIHHRaq8+/DIYzX6VQoBkcFNAd0bRcYHdPmmILiUpgMDTiLxiMSdgYPTMr5ZUgxucjO82ZzAoQ3hCg1u9/oIwJqg9VXw24tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcA1mr5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcA1mr5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088A41F000E9;
	Mon, 31 Aug 2026 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189487;
	bh=SdVo315P9z/oxh3HjT+Vou7ndb8hUTA516RNFcrLCec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bcA1mr5nW2Q87Xa7wuADOB7GSNjQyjXs6fWsOI9FpOQ8xKjB6jmONilBgTdjjYdno
	 c1cjRXX6rfxiFDKPy822jshHW1kcuwlcrkAFx2dkjx38+OMtzXVXTVZ5PPFKJgfWqk
	 +eQAFhcegiGI8Ca0783wV5ymF7xqxScAnJ7WN3u1HfOpM53ohy3z283gd8WdHe0OES
	 CGP9BjyZHHWrjsI2R7+ya2Cs7K4kdGIQhEjtcC3oAI3xHR7ZHPInXcQas7c/fRphBW
	 JDr0d3+NBlwvSJz0VqqyBmD9fgXCOqusYvOGBshuRlgXLrAbN3I3MrzA2lgClN2ukg
	 NGYdOM/ydjCQQ==
Date: Mon, 31 Aug 2026 16:17:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add memory related docs in core-mm/ to
 MM - MISC section
Message-ID: <apWbFQ6u0jqziUZU@lucifer>
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
 <20260831-docs-memalloc-guide-v1-2-547718c274c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-docs-memalloc-guide-v1-2-547718c274c1@kernel.org>

On Mon, Aug 31, 2026 at 06:13:02PM +0300, Mike Rapoport (Microsoft) wrote:
> Previous efforts to make sure that mm files are properly listed in
> MAINTAINERS missed
>
> Documentation/admin-guide/mm/
> Documentation/core-api/memory-allocation.rst
>
> Add them to "MEMORY MANAGEMENT - MISC"
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c9..707f93320ad72 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17275,6 +17275,8 @@ F:	Documentation/ABI/testing/sysfs-kernel-mm-cma
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-numa
>  F:	Documentation/admin-guide/mm/
> +F:	Documentation/core-api/memory-allocation.rst
> +F:	Documentation/core-api/mm-api.rst
>  F:	Documentation/mm/
>  F:	drivers/char/mem.c
>  F:	include/linux/cma.h
>
> --
> 2.53.0
>

--
Cheers, Lorenzo
