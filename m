Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893676;
	b=cTfa0UzIPuiK3yK71hzQna10Q/ClUNyFkRseXgXW9eS88Zbzg6WF5o+cFTlYy8voEg8t
	 zDhvr+W0YP/iNBJe6MG6MEWAK4dO7908bpi1OybKPkp27zjZtOGY1IhcAy3lUKfW8z53l
	 X1onIQ/eU6D7PXAivDg9o/3EO03jqTuGz3LU98FvrTyfBMtx9gLIgBpUB1N88pJ8Bwdm0
	 hGdeFw0jg7uZNi/vtoJbWDeuK7M1qitonqSj7Ui/hKiZT0VvFwe2zZnO54Y57xnjpV6d/
	 7sbU/DYJh7Q6jPnKW9jzgFK7U3c04KLiQuhFd3oIPnszzpCL52MFmMztLtKPrJROPJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893676;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K4qUuinC9l0nXsJ9wo2WhPeiho5YCLulx+dy9SOsQmU=;
	b=DHw8E1Dp7Ccwx6RlWL274z5NVhYk+CqlVkYtwp/sx9P2ZGkfKv4PH46omgPob322ePsH
	 eRhpairJn17YnwG4NDz5WNr1UtwZ7GmRjTdN6JPr/Y1euFio1bjiIvSddDlqpee0oyy51
	 P/59vFneu0fFUb9g7qsqNJWHsBjzarHs1J448XDm7iStNFW6KyPe+z+1lUtmPMiGvn87O
	 pepNN0CBJq7RCFd7ED/sB+UaxBo8U+1k1+EBz67CVGSYG7Fdg3p8+FNESc14Zv//NU/Xf
	 JO+rrVp2O+C3Y7ngeZOop2Dev1pBEh+D7exTVTQZJLqOZt/G4H5OJ7sHsrWk3o4yDEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cljy+74T;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AB9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AB9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cljy+74T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE83C1682;
	Mon, 16 Nov 2026 21:34:30 -0800 (PST)
Received: from [10.163.156.60] (unknown [10.163.156.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 630D43F673;
	Mon, 16 Nov 2026 21:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794893673; bh=9wpAqerGs8CtCKiOTYUfXIO7LwZz3rDBgRhX5IB37qw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cljy+74TxavYmZ5OMGowaSyr+FZ/kIWYBKPcRvIjWhXsDrTPZYub684MDMkXe3M1t
	 6RWuxz2Onyh+yLPj3rxC4RXTA6BYsP7ypBNJBH58Q/mchtzAD1mNSykN/+Pmy3LGJM
	 1qRvsG2CvQ1rTYVgrZYiSZpIRHuKPWmE7DBDBpqE=
Message-ID: <ad8a7751-c9c1-4b0c-969b-27efd0945dc1@arm.com>
Date: Tue, 17 Nov 2026 11:04:25 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/compaction: do not skip the free scanner's periodic
 lock drop
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116125746.2897395-1-kas@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116125746.2897395-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/26 6:27 pm, Kiryl Shutsemau (Meta) wrote:
> isolate_freepages_block() drops zone->lock, checks for a fatal signal
> and calls cond_resched() at every pfn that is a multiple of
> COMPACT_CLUSTER_MAX.
> 
> With a stride above one, the scan steps over a compound page, or over a
> high-order free page it has just isolated, to a pfn that is not a
> multiple of the stride.  From there it never reaches a multiple of
> COMPACT_CLUSTER_MAX, so the rest of the pageblock is scanned without the
> check, possibly with zone->lock held and interrupts off.
> 
> Count probes instead, and check every COMPACT_CLUSTER_MAX of them.
> 
> Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Cc stable?

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/compaction.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index f1b2060eb201..4465c1551406 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -579,7 +579,7 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
>  				unsigned int stride,
>  				bool strict)
>  {
> -	int nr_scanned = 0, total_isolated = 0;
> +	int nr_scanned = 0, nr_probes = 0, total_isolated = 0;
>  	struct page *page;
>  	unsigned long flags = 0;
>  	bool locked = false;
> @@ -599,13 +599,15 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
>  		/*
>  		 * Periodically drop the lock (if held) regardless of its
>  		 * contention, to give chance to IRQs. Abort if fatal signal
> -		 * pending.
> +		 * pending. Count probes rather than pfns, as the scan does not
> +		 * always land on a multiple of COMPACT_CLUSTER_MAX.
>  		 */
> -		if (!(blockpfn % COMPACT_CLUSTER_MAX)
> -		    && compact_unlock_should_abort(&cc->zone->lock, flags,
> -								&locked, cc))
> +		if (!(nr_probes % COMPACT_CLUSTER_MAX) &&
> +		    compact_unlock_should_abort(&cc->zone->lock, flags,
> +						&locked, cc))

I see this is an unrelated change but I don't mind.


>  			break;
>  
> +		nr_probes++;
>  		nr_scanned++;
>  
>  		/*
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

