Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350389;
	b=xJwG8Kms+MWNBrqTcSXqw3aEszw1jkCSK0FWzEcTX1cJO71lKJXse1ij25u4/55ubKF+
	 JfApTnMLYNPviKiVbiFZayjaKakM7FWB3QEipaWVnMkAhDcQzuokUYQ6HOZPvEhCQGZd0
	 HERaNw3nrFRkK7ASJyEO6Tn4MdeXOqA8HSeMT7Xb68V1shi3bekc0XWfjcwsa7t3p9dgw
	 pO2gPLy+48hi8pufILDc00OKESQL5f7sYbhUWID6UkMMCI8U93H9OVljvV19vnX7XU2oH
	 gHC2mwCvfOnQWbWXuuVuOl4JvabuSOsPi6NwSPHzq+mCjwIcjAvk17gffuPLXBYev9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350389;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=a1bHwZlYSD2BW5v3v1BOVUB7uMkjZmsOG9hh7y5BbEg=;
	b=USDt5stpxF2lM6MNtMmu/ozlVVkejF/zJUbwFh0Le2JtdlGctpGacrp1Yc3CPMVZ+aMX
	 chFzHRTgVPATeX8Wpm2ZE0LKlcURuYxJv+4VcpFibN6wNQT582nBeQu0JIWdO5jCtVDpx
	 cQfBsYdZhP4Zz077V+DpCyc09/CW85hH6fHmUyjUNzj7CtV357bWKkRvSebu2OOBwau4e
	 TFGg/tx5rFluTWc+qk+WVIaD4WppjklwabcW1YWLY0tcvD9Gt/xaZ0a2mucgNzGEewe6q
	 8WvyZVcfnzBYY9aloXtytF0a3yR2x2KHTcGK08o6D886sE7QmQy3yQ4A10NIC3RvNyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YuC5jIUj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2222606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2222606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YuC5jIUj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CA191477;
	Tue, 10 Nov 2026 14:39:44 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F9B93F85F;
	Tue, 10 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794350387; bh=47N9Y/9hU3S6BEA5zDQDwUZ1lx8KQxi4n7ENHeqP1eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YuC5jIUj1X4tX345MmGh7nc7u+Pc11yyRl68eR0M3uBMl/DcVeFxxAPb9/Dw3+Xz5
	 ZwcijTHo30ovBbbvqc6VSlBzIHDdw8xsEUIneSa1VBhrB+Fnmb6WFHT9gwCHXMu8b2
	 jUXE5r1P/97US5vMO/dxrYae/4S1BOV1imprjiyg=
Date: Tue, 10 Nov 2026 22:39:43 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Rik van Riel <riel@surriel.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
Message-ID: <avOdL2ctoS_2zi0x@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
 <avLqwIWHa5CAbHO2@e129823.arm.com>
 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
 <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>
 <avN8WISVUF7u4bXl@e129823.arm.com>
 <5db7a358c293393a93984ac3c3cc58e810edd75a.camel@surriel.com>
 <avOMKWJe3wwNb2sW@e129823.arm.com>
 <0ff8276d-9535-449a-94b0-912651411bfe@kernel.org>
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
In-Reply-To: <0ff8276d-9535-449a-94b0-912651411bfe@kernel.org>

On Tue, Nov 10, 2026 at 11:35:25PM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 22:27, Yeoreum Yun wrote:
> > On Tue, Nov 10, 2026 at 03:23:15PM -0500, Rik van Riel wrote:
> >> On Tue, 2026-11-10 at 20:19 +0000, Yeoreum Yun wrote:
> >>>
> >>> Hmm, Wouldn't this name be semantically much the same as keeping
> >>> the existing gup_unshared_page(), since both essentially convey that
> >>> no unsharing is required from GUP's perspective?
> >>
> >> The function measures how many pages in
> >> this current interval do not need to be
> >> unshared.
> >>
> >> I'm happy with any name, though.
> >>
> >> I would really like to just see this
> >> code go in, so I can post my two
> >> GUP series on top, first the batching
> >> for the GUP-slow path, and then the
> >> series that allows access_remote_vm()
> >> and friends to work under the per-VMA
> >> lock.
> > 
> > @David, If you don't have any strong comments for original name
> > -- gup_unshared_page(), May I post next version with resolving other
> > comments so that Rik's series be posted soon?
> > 
> > Otherewise, gup_skip_unshare_pages() works for me.
> 
> Let me think ...
> 
> Maybe just throw in:
> 
> 	gup_pages_not_requiring_unshare

Agree. though name is long, it would be better to explain anyway.

Thanks!


-- 
Sincerely,
Yeoreum Yun
