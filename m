Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109536E468
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835257; cv=none; b=HflxOz+f3ceD7xltyPz3Vs/TDh6Luk4wQRqAWzLCGmVbTANLXnEEOjaSiRmxLfHHwraN/LuMmCo0UPAeUmBqs0jx/LOhG0vDk4Pe557qkyRh2mXnNJckJIIl2mwZNguk1EyKH2T5NHoikaKu5uf4A7pBCkdJcJV+qv+PfeLqnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835257; c=relaxed/simple;
	bh=6vOpdpVrT9nSwqNG5f9Rttbekr8dOWOZc7OUfRzPIfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjKfb3/9z2YwDuLtx1lJMcnCKuHfZsenD9s27I/DaHyk0JsJXXM44BzIN6/cVRKGlgU/pGC7AvGcDcWn3B7dtJubAacWctGQSj1zAj4ver2Q5b2OANEAsV55WiGOtBkJzD7q26Ds2PmZJvRvm3vgh4D0ZAjgWUKH0dmNGR5k1gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGMl4N5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGMl4N5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA7F1F00A3A;
	Thu, 27 Aug 2026 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835248;
	bh=QIg5zZ6JbkUL9eFTbcsNK+W1dAOW66BzRH+VRLbvREg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oGMl4N5knaBxQYzcV5hV8JqGOLHJsX+4mrivGNvXRPfNnLTmdZK0vUS501dgYx1Vg
	 zTyOV1I6DUgkteLYdvJn4/3r+CjgY2tfHFm9KPK/xwTmdxFZ5hvhgIQlk2aEe96Me4
	 x7CCAEsSL3Cstz09IvD1eSrcoeg+mw0GHgd2Q8llQBwJdFkcLoAs0gspto9GqfJktw
	 V6fmHcHZk8jLHVjW2k2gZKoZ8++rJfcS+Bm99R4qTAhQLwOVswUMPENOucSRjKQ3QG
	 7k+sqXfOuusHJt7B+bRKeDMVkMS2O5BqMN/LHV1Wj9c3zrdqb+a6Kly2b4QgBdVvUs
	 KEF2Kz3Sle87A==
Date: Thu, 27 Aug 2026 13:54:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apAzXyJhWfiBpIVV@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
 <25baffdb-fd65-489b-ac9b-94e1ad676eaa@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25baffdb-fd65-489b-ac9b-94e1ad676eaa@linux.alibaba.com>

On Thu, Aug 27, 2026 at 04:38:12PM +0800, Baolin Wang wrote:
>
>
> On 8/26/26 7:31 PM, Lorenzo Stoakes (ARM) wrote:
> > Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
> >
> > 	~107,000 words of review across 948 emails (in 279 distinct
> > 	threads), counting only prose you actually wrote — quoted text,
> > 	signatures and attribution lines stripped. That's a full novel's
> > 	worth of review commentary.
> >
> > 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> > 	and your longest single review was 2,404 words (mTHP collapse
> > 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> > 	of your top-10 longest reviews).
> >
> > 	Estimated review time: roughly 300–500 hours, centred around ~400
> > 	(i.e. ~7 hours/week for 14 months).
> >
> > 	1,615 THP-related emails in the window: 948 reviews of others'
> > 	work, 278 replies on your own THP-touching series threads (~31k
> > 	more words responding to review), 382 patch emails, and a handful
> > 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> > 	emails), June 2026 (113), August 2026 (111); quietest was December
> > 	2025 (5).
> >
> > Think I can be happy with that!
>
> Hi Lorenzo,
>
> Thanks for your great work as THP co-maintainer (we all know THP is one of
> the busiest subsystems in the MM :)). I am glad to work with you and very
> much appreciate your review comments and suggestions.

Thanks much appreciate :)

--
Cheers, Lorenzo
