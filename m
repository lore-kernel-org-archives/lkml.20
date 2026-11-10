Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319140;
	b=QvDQchiV+xXLsxbiVt3iNsdY5zrajee5l69eQLqZf6KWNoZKx3MCjB2ZsM1xExCK+S7F
	 aGTFXMuQX7/r+hqIqXNmoyVrTykRwQx4rdHhODaC+uLHdTk0yLH6Q9fjNYjABqr4O3htz
	 r5rrjXqHSeQ3MsJEr7jct6xE1IteIXayA4KBCdNAa1DjrV8vrkF+Me5gTx86gDQ7Blk65
	 1RR7knJC5PQapCztB3UfNpGywojA8EQ5MSYz0GIf/8Wfkdah+wyIF//JcUHMBi3aHXoE0
	 QVUZNXXlDtRl4NENhfuHUnbEZzTsa+/zp4SurBu9XFyz+N5Uktoex2UdyH/kxA6PRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319140;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=McJ7EzdjpZoZ9QnIZAXd1sj3iExgLNGvctdfccvpYpM=;
	b=vBG+TnH4rDDH7Ka1On8pWuRBEfyrvZGID2oqS+iLSR1naYvpnPWc7gspKVgsO+1GXkAW
	 kJ4EXr+Cjvx65xuPBcrMhPdc4+9QxAQV6fpMye8lJo3NiBRqiXudvlVnj3XhtTkZCUByE
	 Cmk7vkrItqjiVX9y5v+rQoR7rdbma/002hayA6+dAfVGfMxqs2xH15lVwZpN4IL+BBffp
	 ujINZunLXNcnWdQI5rPIX70p2eEYQlYRr2eCjb8rHHmKSTINK7mh/zDJlPAb0gn96DoAF
	 P1GWGGIS4tz1x2fiuotEpbtI4aM2kZL2FR83jfDbzWanrFdXdIBxfOYwxnYndq9+Iyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Bo+daxnJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9240C606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9240C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Bo+daxnJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE22B143D;
	Tue, 10 Nov 2026 05:58:55 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 664113F632;
	Tue, 10 Nov 2026 05:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794319138; bh=Stqf/UeMkAaff9pue0Ee0wx6NrZ9dhCynge/n1sKPss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bo+daxnJU7wVO39qjldL1mCt8K2l43nW8A4EEFDG2BDw2X9yQ4sVkQEEnUQJeGIth
	 seQjpsPN0+sL7sV49A5Wzf5Cf5Eiyuca3I6uLoZrElWR2oFoxcmnHu64gcmo+CFsRO
	 nXgKaFX1Y2fv6Z4E5kUG1KcyVND612FsKVUjed0k=
Date: Tue, 10 Nov 2026 13:58:53 +0000
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
Message-ID: <avMjHS81ani_PtQ6@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
 <avLqwIWHa5CAbHO2@e129823.arm.com>
 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
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
In-Reply-To: <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>

On Tue, Nov 10, 2026 at 02:04:43PM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 10:58, Yeoreum Yun wrote:
> > Hi Rik,
> > 
> >> On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> >>> This is preparatory patch to make gup_fast_pte_range() batchable.
> >>>
> >>> Introduce gup_unshared_pages() to count consecutive pages within a
> >>> folio
> >>> that do not require unsharing, and use it to implement
> >>> gup_must_unshare().
> >>>
> >> Could gup_exclusive_pages() be a better name?
> > 
> > Yes. This seems much better for me. I'll change it in next-spin.
> 
> Not quite the right semantics. For pagecache folios we simply don't need
> unsharing in MAP_SHARED VMAs. That does not imply that these are exclusive.
> 
> So it's all about "number of pages that don't need unsharing".
> 
> Any idea for a fitting name ? :)

Might gup_pages_without_unshared()..? otherwise I couldn't image 
better name than origin...

-- 
Sincerely,
Yeoreum Yun
