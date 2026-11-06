Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956911;
	b=q4Y+X1dBn5fAPRFbPhL1VCZoAewQxxeD3G0bfD8hmCnKU9hsn2Sbdwp9pqHWpUVijtT/
	 W4rabGbooTEqMqPkn8ZzXsI3d4HgQI26rr0lEHILNtyVjH3A1re0OavJ7thef7l2HpeHC
	 Rnf6Ggo83y5CWPfnzAOBH9h8o/qlY1J6mkBoXhQxCFvlpZsrsby2iuodsoVbJ15GF7Ihd
	 gMWPahWWq0zL676F4+zJoyfHV2mXRbBh9VDF6kf7EpG842YTY8BBNAJci/f/8GYP8D6nN
	 I1aMhjrbEaOjaoSBhSK7VmpttJ3Sasp4lHiHMfaL5r9vTlIgxgYvdcubalJITWmSJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956911;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0OLeRDcRsIxPNSomaAo6s+K7OCLuQDG+64RQlcsvtls=;
	b=uwMcIi4tveKXd/Yj6LNp1Vqjx2zOVz92wSUX3T9ZjVOBAiohSYGYceOGpry3OVtFE+Pr
	 Xd7TPUafLG6fKC7A9UXHGD9Fxh3xspTkwpa1pzFhemLBucctEa5tOxG+L8s4yFZv6fTPK
	 pS3ZtrxSo/YvQCLcyGTOGjOERPXDZ3GEOP3IiZOiaOEU3KcntCSWni8kJAo2QyydbS0ui
	 vJRLb6dxOxqQqQhE9+nxx6SXuyjWn0HEMhOKDDCxuXFhsQN5xMggUBgZRImyj1J6CX5sH
	 a5dr5xFYb4MkOVJpoI9gnfcCV7dVoJqorxVx39U6O30pV4yTQE5yGhRAKqfYSk2jR+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fIsZeZWQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD32E606EE8F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD32E606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fIsZeZWQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADAEC2F;
	Fri,  6 Nov 2026 01:21:46 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E6C3F628;
	Fri,  6 Nov 2026 01:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793956909; bh=V9pEHYYt+1fb+K2GHWQyEStcJTnSm3pBD7VgR3s1gr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIsZeZWQpPOXbXYjkoR9EujxqwRASO0z2OUFf9dmTklUqNfi1aKtM5IYz4h5E/DZY
	 JsbhWtfg+GQVv6QxQur1YmIIhuEhI0vtNKFR0w2P2iPc+zjm8NJl0YvUvkiD8yRHgK
	 xnW0Xx3u+GPrgI77rJFTJvOhKrkyOrYZ68UUX6fM=
Date: Fri, 6 Nov 2026 09:21:44 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v2 2/4] mm: internal: fix inconsistent in
 folio_pte_batch_flags() for shadow stack
Message-ID: <au2cKP0SWaaHQPrg@e129823.arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
 <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>
 <auiI8jzumVHmmSV9@e129823.arm.com>
 <9a67e7f6-0ec6-414d-8689-c70eeed6100c@kernel.org>
 <auiZFJ7Bb6cQnqtX@e129823.arm.com>
 <d70b6ac2-a8b2-4c34-acc4-ee421eb70aac@kernel.org>
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
In-Reply-To: <d70b6ac2-a8b2-4c34-acc4-ee421eb70aac@kernel.org>

> On 11/2/26 15:07, Yeoreum Yun wrote:
> >>>
> >>> Sorry. But I couldn't follow. If we accumalate with any_unwritable
> >>> and check it out of loop once only, we couldn't properly nr value or
> >>> Am I missing something?
> >>
> >> Ah. The idea was to simply reject the batch entirely if that happens. It would
> >> only matter if some folio PTEs are writable while others are not ... well, ok,
> >> there are some cases where that can happen, but it's not really the common case.
> >>
> >> I think we should simply disallow ever getting large folios into shadow stack
> >> VMAs for now. So I'd prefer the fix below.
> >>
> >> Thoughts?
> > 
> > That's my preference too and we've discussed :)
> > I'll repost with below unless anyone has any strong comment.
> 
> Yes, best to wait a couple of days for people to catch up.

If there is no comments for prohibiting to set VM_HUGEPAGE for
shadow stack as David's suggestion, I'll post with this on early next
week.

Thanks!

-- 
Sincerely,
Yeoreum Yun
