Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439607;
	b=LLqCQmCMGQR0PAePJWx51IOJ3yjyhEnIfGsI2MLuYjnJYPf3ZsHknwGjZyKLwhnXU/Kz
	 NwXiMrM4QSkZiV+GznE2FN/9W3CjiozUCmvlM1LdYe8SSVbQKqr2L+d2xV+p/zR5bcDuq
	 bI2Kbo2klQgFJ088iIHiSWAc4tlvIVXEiQeo9btpTnqSTZ9V9oZxycBteC6fQoA/1er4O
	 FFR5pe15LJ/QjthN82h0VY6EvhclxtE9bkkJFqIueS5patxBRpgxWlflpWn6ZH20uc+Ls
	 u1wNGpZfiWUeYCmTEA1FHw67C1wEbfOQxOvaEoItpvq0mH43ndIDHbpFjlgKCvXi+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439607;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=U1Go9nJGbfGTucdmGG94RDyCyz/Xl64hJ2C69Ad2Aag=;
	b=HLx5e9gHHQK8Hnag0+mtiF/eDfuj1ru8oojnAew4GLkIrI3S/w36LwBXifBvWKdu9SY6
	 SgZLKcu731oChB3OlIO6l9g8TYHRDQC5cKa8tgajdCI5cg5lkg9X65VFnd/XjpBNumJq+
	 nCGULEsHKfH4wfmhXDobveq3hvQo3a8KJuOhTiZN8EhfyytLAIb6IycVfIypQTBFX4UZU
	 GZSAibx147Z83tfQN68LgOWi17zh0RzZNIV0jCNHe5onTfeNW7ZYBJ3PYJNXADL9FxnnJ
	 Poy1r3kwOKdgUXDMPGvxBCENj4Ph9ouSDu8iH2zL7mTt8I3DLYgBBM+AVUzXBcVuVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H2OoK787;
	arc=none smtp.remote-ip=91.218.175.253
Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4D60A2634
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC4D60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H2OoK787
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Tgc5aGENKoDFgK3qnx6o5GIsN/BgWLTJWU9rerjYc8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794439604; v=1; x=1795044404;
 b=H2OoK787rAwaaBJrJ8I0ZJj20RiTkWqSW05o2UUZBtr3ne4Qw4fn8GdliKKIQ1/mOxjnEmgF
 5ZS91Rgp3rzHgdtwqS7v2lllrzl8xcktQ71vPN0tDqfh5F38ObO2NyTTb3/lE3pbgfAqQgr15g9
 qBm9Rq8gmERgCYafqqR14U7c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2d26b6111cf784ab;
	Wed, 11 Nov 2026 23:26:44 +0000
X-Mizu-Trace-ID: 2d26b6111cf784ab
X-Migadu-Flow: FLOW_OUT
Message-ID: <5586b128-4402-4fb4-a535-f3766d807042@linux.dev>
Date: Wed, 11 Nov 2026 23:26:38 +0000
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
Subject: Re: [PATCH 02/13] mm: cachestat: count each page only once
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
 Chris Mason <mason@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Mark Brown <broonie@kernel.org>,
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/2026 18:13, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> It turns out that filemap_cachestat() can unwittingly return incorrect
> page counts, if large folios are present.
> 
> This can occur due to underflow - nr_cache is nearly 2^64 on a 64-bit
> kernel if the input range starts more than 64 pages into a folio that is
> split during the call.
> 
> It can also occur due to pages after a large folio being skipped if the
> range starts in its second or later XArray slot and the call reschedules at
> that folio.
> 
> Finally it can be caused by pages being counted twice due to folios in the
> range being split or collapsed during the call.
> 
> filemap_cachestat() walks the page cache under the RCU read lock only,
> and for each entry it counts the pages that lie in the range. It does
> not track how far it has counted, so the counts are only right if the
> walk returns each index once.
> 
> But a large folio can be split during the walk, or small folios can be
> collapsed into a large one, and the next entries then cover indices that
> were already counted.
> 
> Resolve the issue by tracking the current index as one past the last index
> in the folio, and explicitly using xas_set() to set the current position in
> the XArray.
> 
> Additionally, add a check for folio_last_index reaching or exceeding
> last_index and break out of the loop if so.
> 
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: updated to use curr_index, fixed comments, updated commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---


First time I have looked at cachestat, but it makes sense. Tracking curr_index
makes cachestat skip already counted entries, preventing duplicate counts 
during folio splits or collapses.

Acked-by: Usama Arif <usama.arif@linux.dev>


>  mm/filemap.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index b04be64a5069..7c05e4fad081 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -4638,6 +4638,7 @@ static void filemap_cachestat(struct address_space *mapping,
>  {
>  	XA_STATE(xas, &mapping->i_pages, first_index);
>  	struct folio *folio;
> +	pgoff_t curr_index = first_index;
>  
>  	/* Flush stats (and potentially sleep) outside the RCU read section. */
>  	mem_cgroup_flush_stats_ratelimited(NULL);
> @@ -4667,13 +4668,19 @@ static void filemap_cachestat(struct address_space *mapping,
>  		folio_first_index = round_down(xas.xa_index, 1 << order);
>  		folio_last_index = folio_first_index + nr_pages - 1;
>  
> +		/* Skip already counted entries, e.g. after a split/collapse. */
> +		if (folio_last_index < curr_index)
> +			goto resched;
> +
>  		/* Folios might straddle the range boundaries, only count covered pages */
> -		if (folio_first_index < first_index)
> -			nr_pages -= first_index - folio_first_index;
> +		if (folio_first_index < curr_index)
> +			nr_pages -= curr_index - folio_first_index;
>  
>  		if (folio_last_index > last_index)
>  			nr_pages -= folio_last_index - last_index;
>  
> +		curr_index = folio_last_index + 1;
> +
>  		if (xa_is_value(folio)) {
>  			/* page is evicted */
>  			void *shadow = (void *)folio;
> @@ -4721,8 +4728,11 @@ static void filemap_cachestat(struct address_space *mapping,
>  			cs->nr_writeback += nr_pages;
>  
>  resched:
> +		if (folio_last_index >= last_index)
> +			break;
> +
>  		if (need_resched()) {
> -			xas_pause(&xas);
> +			xas_set(&xas, curr_index);
>  			cond_resched_rcu();
>  		}
>  	}
> 

