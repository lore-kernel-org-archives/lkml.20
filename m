Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5873B0AF0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669940; cv=none; b=lt3YGgwbdLasD2EoI9Xl8nTvyUZttaFR5CtBKWVydkvZBEPv1f2Ptmp2TWfugtigXBpU0wKiCBKo49qO4GFvV4RSfq475zhHnDObNGHu5o/y4f+oGmVMZHLyhvHsl8rgb8fFK1+Fi5bqXyOgG/aW44anP74NS+TjigH7PIra4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669940; c=relaxed/simple;
	bh=Eg7huFktSTH0iO6sc8NlUvvvypIBkgU7qSdOLcBKalk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckjAj45Knz/s3cXbhjl11wi/h9DWZpz/SEazxm8RTYlVHr4Fs1MjdEW2YogFqNcx7k2XiW6iCnBiiz5PoHj8RCvoXWhtogVkuASLlqG/0eXOeindIZs1wUDGtYWv+a2ANiUF23m/sPqQyfB6VBOhI8POtxSPwsoi3THEnBpiJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRcuYHBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRcuYHBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA2E1F000FF;
	Tue, 29 Sep 2026 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790669939;
	bh=pWO0ss/zDd28rzucB/2zd0IrAHiHXnuFXdCJFizW22k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IRcuYHBA4xV4zUDI0KhjRizXMZXgHbA+hJHP5v8zjAMskG2DL85W8pp/x+06rfMbx
	 XucIPQLm7KLhQvcHGpOVoDLOVxSdOvyRRfAbUOUuai2MRFroes3s2xASo6lxIRg91z
	 MLa4l7GLlrCgpSAJKFZyn6WKguCIjG8+ZK45l4DbFeHFloGqGvXaNzTWQQn5zFxEIG
	 Q9I0pgpL3oMlauZCxaXGRa5PP2pakCkySWw20ubKu5gQi+pkLdykcVHkIKApSfhCem
	 uKAj9Yp79zeT0Zmr3bMVC1nqkyl5WZtScjDwWZzDN5aeYBmVKVoUwWiumGwJWrXRgI
	 USfOm5qsA5YoQ==
Date: Tue, 29 Sep 2026 09:18:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zongkun Lei <leizongkun@qq.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm: swap support for hugetlb folios
Message-ID: <art0PItp9LoUXIcd@gremlin>
References: <tencent_501F9D3CED07B66BAA97D5352FB63EE1A709@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_501F9D3CED07B66BAA97D5352FB63EE1A709@qq.com>

Hi,

What David said - hugetlb is in freeze so we're unfortunately not interested in
such a big change.

Also you somehow sent the cover letter and the patches separately.

But also:

For one of several possible reasons this mail has triggered an AI
detector script.

Note that, while we are fine with AI assistance, it is kernel
policy that you must disclose this with an Assisted-by tag like:

Assisted-by: LLM

See https://docs.kernel.org/process/coding-assistants.html

It is also kernel policy that you must fully understand and take
responsibility for every patch that you send.

See https://docs.kernel.org/process/generated-content.html most
notably:

        If tools permit you to generate a contribution automatically, expect
        additional scrutiny in proportion to how much of it was generated.

        As with the output of any tooling, the result may be incorrect or
        inappropriate. You are expected to understand and to be able to
        defend everything you submit. If you are unable to do so, then do
        not submit the resulting changes.

        If you do so anyway, maintainers are entitled to reject your series
        without detailed review.

In general, if you are a newcomer to mm, we expect you to do smaller work
before moving on to larger changes, so you build understanding of both the
technical aspects of mm and how we do things.

--
Cheers, Lorenzo
