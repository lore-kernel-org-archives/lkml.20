Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879431;
	b=3sKoN7Nj4kNWAgTsumZidNQTx9dB9F0H8anjePSpX/NtIzn8MBeQ2m44IctC+Gd0fDgN
	 4ock3Ng4OPdgXSv3j90g+LERUlmeJAuDljis4QINjM/hBYE0DwL5U7K9amvs8voQpPw+F
	 YTBCUYYgMf42ZKsBiyK6J1ZjDRljDVCIj4GmwmQX2T9ISMsl4EekYAiv/CqtAbdzEmHNV
	 mSAG1ggWlU4pGXkEJ3UeVTXUZiPqrbqVyHjswnU46z1ZHPANPt7GQVzVjG3TkfCymyTLJ
	 wqEEA1qPFfPzxbjNNYyuxUefa1NBozI+0B+/8jqk5YsT+O1CU8wFkq1n6mRq/jXr+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879431;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BIMOnFHtb/Mb13a3T/u5ttg244elHzKV/mc7yLX3gCc=;
	b=yH1LK7YzA8Txqct0rR5URT8O2a3LSwTt6WvCrAyPGeMycVWzPykMhw69qwek+QiAQgmO
	 P4YClgOHJVGMv/xzjhmR5ZzU12EMjS0SpNS9XR37jVWIUhFRmhyijAHu44mdtfc9LXX4P
	 XYmK8INpnQOpdU9bhv8KNJu9+Lx+fTWyjWy9kWi86j4+N8uk08RLNlGxz9rEY0tLgDAvn
	 m39VTXj4K2Ep0d5peTZQgUbrpesJ9unQwHfKR7erI+IlVh+y8GC+Vn+aE+ue21QYPapzu
	 uLCEThV+1DQB5amnK1sECFF/wG7jHDYaB+YwIulOvakvvdjeVTynHshgiOGbqOrsC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8dNYQte;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8dNYQte
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B5D1F000C4;
	Tue, 17 Nov 2026 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879430;
	bh=BIMOnFHtb/Mb13a3T/u5ttg244elHzKV/mc7yLX3gCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l8dNYQte0M53YUVdQTJ09cHEEm/GkG1g6FiQLENVmU4Tcmi9BNuZ6oyDbW3ql4gAA
	 0Bf3rOM9FBbFbrGVScLXwmi4RN28kdCu5fxWRCh3bwbZ21zUQahXy47KY9BPFeIrjt
	 doE5joDBU606+nuRIVWAKFzp+6zIFNYbe5IVRQS7XsfcSlfEKMJmCs1z9cieS/URJH
	 G1CRyLA9K6YRugwzoxlLQB/ef2wT4k5Mf0eySpDmsYyfKq3Hk0TFIo3EZky9BUhcxr
	 9/S+9I1zYLn79j9gspSdRuudOw6+UjyDsuyrppgEkgT+Vod2bKZzsEsEehkJosOCJf
	 0W8lcSOy7js2w==
From: SJ Park <sj@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/compaction: do not skip the free scanner's periodic lock drop
Date: Mon, 16 Nov 2026 17:37:02 -0800
Message-ID: <20261117013702.109081-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116125746.2897395-1-kas@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 12:57:45 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

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

Makes sense to me.

> 
> Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")

I understand you intentionally not Cc-ing stable@, buecase the user impact is
not that bad.  I think that makes sense.  I just wanted to call out this for a
case that it was not intentional.

> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
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

Why don't you let the later two lines unchanged?  No strong opinion, no
blocker.

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
