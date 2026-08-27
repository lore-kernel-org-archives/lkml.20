Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10799456DE0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836081; cv=none; b=EwmcO2xuW0bL91FOF1cshN8Om6Fyk5xl9V2ZJ3IZAes40UjIBKuiZsfVEuAaRdFc7VYkpjHqxc1dozSF+wocGJuwHohh+/QDbSdHOYNADEW53q+OnlIkFPPl+4yS5wavJ9eKHp28TvGE3i7nELPxLsCzcORQegolhjtluH7ewko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836081; c=relaxed/simple;
	bh=oP+7K0U7f/7k6ULptFAlBCzvX6+UF6UEPqqqOr6WHTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b10fkJvgtf65ei9IAoPnJGvckCYzI+cEQy7RoNup9P3lSIVlmSwDDjtBPAFy872dLtiDzSiWFFSbJC0hxMKgknTC1fOPCq3ETa1z9sEIHScUYG0dRT0M0e/K2SWKyV13xyAmnrSfmrooi6pz5WefSl7bQY8/TyQINzjYTxNW9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1ZTwjkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1ZTwjkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011471F000E9;
	Thu, 27 Aug 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836070;
	bh=oP+7K0U7f/7k6ULptFAlBCzvX6+UF6UEPqqqOr6WHTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1ZTwjkku8NYz28tCgrC7ro8xgeZQIXfzQPBhs5PJHXFNMwZeTFG9jSnsgWtNJvO9
	 pzjf9YygEswaMc4vm0upoTYTJ5Jy1uDlZlYvTeS8WUe7BeZQxZh8XQZmVGh5eoVVz2
	 dlbYSCtk/1iGgs9KMO7tp5WP0HXwJI7tBQz3vBl+nOOzyzjhLKShNjIyeU7qglrU28
	 qwM1d+elfM8jndjAP8AFyEU/0bIzzIdDM/a78gMxoXndkcDKRcvItpkCFhmTk3ZOF2
	 3gVonNoZ0FH7GnXDv304QoWGSTsszNvSZKrUfRKrCwxk0+tkESGT/KcE01Fac3vtH+
	 VnVSTCZ8XhsWA==
Date: Thu, 27 Aug 2026 14:07:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apA2lxYv7r5qaJR5@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7S-wjzcMIgM3s-@thinkstation>
 <adf90329-020f-4a2a-bac5-fe815b692a7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adf90329-020f-4a2a-bac5-fe815b692a7d@kernel.org>

On Wed, Aug 26, 2026 at 02:52:27PM +0200, David Hildenbrand (Arm) wrote:
> On 8/26/26 14:04, Kiryl Shutsemau wrote:
> > On Wed, Aug 26, 2026 at 10:56:39AM +0100, Lorenzo Stoakes (ARM) wrote:
> >> Unfortunately my workload is such that I simply no longer have the time to
> >> give THP the focus that it deserves.
> >
> > Ouch.
> >
> > I guess my 57-patch series did help the situation :/ Sorry about that.
> >
> > It would be only fair if I share review load for THP. I will try to be
> > more active on review.
> >
> > David, I can send patch if you are interested in my R:. I know thing or
> > two about THP and can be useful there.
>
> Yes, please! :)

Thanks Kiryl :)

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
