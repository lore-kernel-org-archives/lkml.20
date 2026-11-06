Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970932;
	b=hlex0UfPqlp0mtF55lNvZsyiMaoyKTAtjrIDlx9F1CtfmjxS0nESu9urvJ8+A9b2ETw0
	 czNLjt1QpJ6fa3LG7JqtYdA/VQllIRnSoRZpRcIxk6tFMEPw2LFWmB5xa+maXUhZkNhNT
	 zhced5qhwmYb5Zs5aL1wDp1DOgqAVEB35zlnDwP8gS9cS0aJntnfD+P/9SnzcRzGKKphX
	 807F8M8R0y9M0Lrn3oXftb8wP/z5qM0DEE/Vi3ndHmLCnrCxNd/ibgNlALgCJ4RHr31rk
	 w3LMbz0fe4oO9ydfG7IAgYHo6WyWuc/3ZVymVHsaciSGs2zpmQrrs49SiqYBAfHp2Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970932;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6TXkLHscwSMqxJsLbmecxFsJw68c+CWaCGWTtaOz1TU=;
	b=fUSoqnnTXPsW/fuDN0mZNpElxnJgewV8qzmdHlsds0MUrvNiB/1kJ0mAJo1XyZiOgzQ+
	 jUSoZbYF1hgoKzj5JmMC7ZI7ySN0P7GE+HexO+c+hFVM9Gjn2qKs9zXqpAs0MdRjZhKjr
	 N+tS3oEtKBe4KW/bTE26tzcfbz0Wb6+qX5ya2oWtHzC/5Bh6FUPe24Ar4gUpm8gLgZpxq
	 Ze8jXLEf5miYcNO6b1PMmsrwF4nwEKVAuoaKPdlRmcOQtn9jqAtBZQfWmlOTvJm9QCsMU
	 9yZ6s0xajHFxYKejZij3vEBYrgs8s6fSBwbyr1eSSIengRZ512vKhDJgIMBT8VsX+5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="bVLFw/pv";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003B3606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 003B3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bVLFw/pv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054A21596;
	Fri,  6 Nov 2026 05:15:27 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 232E33F628;
	Fri,  6 Nov 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793970930; bh=Oc8nVxfpMQKJNDpsFeRnkG5aGJsyD4jQTTT2hvVB/ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVLFw/pvUgSmVuQ7mtMONAlEQZ+X/4aGTifq/SNv8S6MB50rGt0Vk2B8CRnaXOs65
	 GKcIegd54xg0BNbFjSGPQufYPOjDAO+o12gJLw758dv8nUiDkOgPXYCQZGUGQ21IGY
	 JvtOPLCYOUTxMc1ypMdmW1SvBRiOxbUf55/sKNyg=
Date: Fri, 6 Nov 2026 13:15:25 +0000
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
Message-ID: <au3S7XlzNi1FktdA@e129823.arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
 <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>
 <auiI8jzumVHmmSV9@e129823.arm.com>
 <9a67e7f6-0ec6-414d-8689-c70eeed6100c@kernel.org>
 <auiZFJ7Bb6cQnqtX@e129823.arm.com>
 <d70b6ac2-a8b2-4c34-acc4-ee421eb70aac@kernel.org>
 <au2cKP0SWaaHQPrg@e129823.arm.com>
 <5521e876-3edb-4862-8b45-96118a21ab6a@kernel.org>
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
In-Reply-To: <5521e876-3edb-4862-8b45-96118a21ab6a@kernel.org>

On Fri, Nov 06, 2026 at 01:43:11PM +0100, David Hildenbrand (Arm) wrote:
> On 11/6/26 10:21, Yeoreum Yun wrote:
> >> On 11/2/26 15:07, Yeoreum Yun wrote:
> >>>
> >>> That's my preference too and we've discussed :)
> >>> I'll repost with below unless anyone has any strong comment.
> >>
> >> Yes, best to wait a couple of days for people to catch up.
> > 
> > If there is no comments for prohibiting to set VM_HUGEPAGE for
> > shadow stack as David's suggestion, I'll post with this on early next
> > week.
> 
> Yes. Can you do me a favor and move the fix to #1
> Also, I think we'll CC stable.

Acked. Thanks!

-- 
Sincerely,
Yeoreum Yun
