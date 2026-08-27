Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD98286881
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829559; cv=none; b=SOIpRMWVlePlDhUWa9BXWg2AXaKvqAowwC7//+4XXLATtqJV6397JtllTH9DpJSkvM5sgV9G/DjTnj3BsJ1OKwhKtNYztlzZByiLTTFgLye0e6YJu7Yc06J33IhG/2DCBdnPJNJ0twf37KauzjXUPooz1SKrzDe7G12jkmn1Cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829559; c=relaxed/simple;
	bh=+37gTzZm5BFKOrQX4cWZ6uaE9noNLHNVnyWcjzdruXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jj9Tm2yRGPHlOz+n4gwAnnCoDkO6Ho0UUrhTh2AdhrX8b7veRrI94nBzxjIDRW5VmqI8s3U0cEEcExiUkESzAvkIKB78aQbSyZMAGiAxIOfM6PS1E/FSwwbXvyPQAWUbt3HDla641HTk0GjjI88+pCGeRPEVum92AiGDnSNRNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/Ms9sjR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/Ms9sjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C5C1F000E9;
	Thu, 27 Aug 2026 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787829553;
	bh=XCzE3itXjJUxzC9B+6gmiKda5UI49/xCWZiO/v/Kk0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J/Ms9sjRIBOD4opV5PykseCnOEB0SJWT+HJFd0MvqGaqkJDDkvf0DskfhxvNVSN2s
	 kNOYwcEzbujP0zWdpjbs6Zhqj1nC5485I9R+IcIvO6jraO1Z3NBb0tH6WbbdCDV8Cl
	 ixS3HcqzCFy1rQQK/B1ajjeJSeeolKWuq9h14SeUO/E8Srk9afcX43d64mnxfFvXUI
	 NCu5VPATV3QYISml47k79SJEK6M/HgKU7D0+4zuuURiy0TR9uAL1YP3L9N9k8GhdTd
	 CmbdiVmcsL8FC93t5vcBXKbkYlLR0VGUVO5k8KkyU2zcv0KLdjfBlTs9JWBwhnhhzz
	 DUczcSUJO9dbw==
Date: Thu, 27 Aug 2026 12:19:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Message-ID: <apAdICpnFIAUi0ny@gremlin>
References: <20260827103435.1371882-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>

On Thu, Aug 27, 2026 at 11:34:35AM +0100, Kiryl Shutsemau (Meta) wrote:
> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
>
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks :)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1be7da9b6e2e..f5bb29ba41c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17264,6 +17264,7 @@ R:	Dev Jain <dev.jain@arm.com>
>  R:	Barry Song <baohua@kernel.org>
>  R:	Lance Yang <lance.yang@linux.dev>
>  R:	Usama Arif <usama.arif@linux.dev>
> +R:	Kiryl Shutsemau <kas@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> --
> 2.54.0
>

--
Cheers, Lorenzo
