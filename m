Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440325;
	b=gHKZaaKRjux2eH7yWUwG8uOC/SUSwAzNfWyZh65n8AS1zokIRb6uODKy1+xs2yRzRxLh
	 c8wHxyKCdvjWS35OCS3c2EMwDsfPVCB0yUozIMJDs4hdzJtjRPwFE6brQirfJB8bQw/ct
	 ivhSS0iWOMkwFgJnpOj/Td83A+6q2JQOuH9sDBRxwd/au/R1dXUApadA/qrXOJxbL2qj+
	 kCV0pICb2PfI5fB2/Wf3t1Lh5TxrqO6lLcmavDXNNP6QO2yZeZQ3CZ/YPcCN0K6vlizTw
	 QDX+e3KEb1fTg0Z6U+GKfy9kgs32Dsj2ULOvUFlb3GRQzWG1YeF1gepmsbmKAFUnS/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440325;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FBtMya5JHiIoe+mvC9LpyA8nsmCcAGgftQwnt4hAqeI=;
	b=BolY0JkHI2DFx4Us+fdelno7NMsYxBnglE5ZXKlnYqS0nJhEiltOSL4H93ihtdPJZXVO
	 SlYnQtmIO8CSw/Vcp77gm0fGm3CdowKn8uLzra+YFABsUcHRwjyg9NBcKXbZlxiDVCbWm
	 uWWGNxJ4khqOCwbbGHajGmOlz9S9l5O3/5mUoS3uBqegO+2xYY3Q95TDjqzsFe52VCM4n
	 YQb5fNPi4/ISM7QCoWDKg0Y5GLqAj4CliCh4HYYFGouHUGPM7vFpwkZTmfcGD7G/tmyzc
	 RlQZFhh0T4ND+bE9IIw6CaUoqwJ1VrCYoawQAygiU7V7Xpj5u0uod9yVbx4t2VMtdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cii2UW+7;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cii2UW+7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n4XGoevqqrbLPiJf0WVzjodKBgKSfEnOAs+PZZo3dNg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794440321; v=1; x=1795045121;
 b=cii2UW+7VcxrIVAWlCPVxc2A7k2LTA3p/TddiEUWVZc4+BUMo6mGN2irt4FP7mJoecm0BhLU
 yTLvkBYJJl7IaDDKdMTfb8bnEE4craruu464TSTbjJiZTaWR8fiCHC2lC4dM1J2JKz+ahIVeFrz
 zfvhBY1EHDqzCn2idFHrM/VI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b7a6aef2bc15d97d;
	Wed, 11 Nov 2026 23:38:41 +0000
X-Mizu-Trace-ID: b7a6aef2bc15d97d
X-Migadu-Flow: FLOW_OUT
Message-ID: <9b795d3a-1818-4265-a364-58fba139c651@linux.dev>
Date: Wed, 11 Nov 2026 23:38:39 +0000
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
Subject: Re: [PATCH 03/13] mm: cachestat: restart the walk after each entry
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/2026 18:13, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> cachestat() can leave cached pages out of its counts. This happens if
> the entry that the call has just counted is replaced by a larger folio
> that starts in the same XArray slot.
> 
> The issue is that filemap_cachestat() walks the page cache under the RCU
> read lock, so racing concurrent collapse/split is possible.
> 
> Thus, an entry can be replaced immediately after the walk has returned
> it. When that happens, the next xas_find() skips the sibling entries that
> point to the slot of that entry, since ordinarily they belong to that
> entry.
> 
> However a concurrent collapse_file() or __filemap_add_folio() (when
> replacing a shadow entry) can store a larger folio in the slot, in which
> case the sibling entries belong to the new folio and the walk still skips
> them.
> 
> Consider:
> 
>     cachestat                         collapse
>     =========                         ========
>     count a 64-page folio in slot 8
>                                       store a 512-page folio in slot 8,
>                                       with sibling entries in slots 9-15
>     xas_find() starts at slot 8
>     and skips slots 9-15
>       /* 448 pages are never counted */
> 
> Also consider:
> 
>     filemap_cachestat()                  __filemap_add_folio()
>     ===================                  =====================
>     counts the shadow entry in slot 0
>                                          slot 0: a folio of 32 pages
>                                          slots 1-31: siblings of slot 0
>     xas_find() skips slots 1-31
>       /* 31 pages are never counted */
> 
> Essentially the fact that large folios might be present means we cannot
> safely continue the XArray walk, and must reset the iterator each time.
> 
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: squashed 2 commits, fixed up comment in code, and commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/filemap.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 7c05e4fad081..c4e82891767b 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -4731,10 +4731,11 @@ static void filemap_cachestat(struct address_space *mapping,
>  		if (folio_last_index >= last_index)
>  			break;
>  
> -		if (need_resched()) {
> -			xas_set(&xas, curr_index);
> +		/* Collapse or new folio spanning shadow entries needs reset. */
> +		xas_set(&xas, curr_index);
> +

I imagine this will be a performance hit for the call, as each entry now
needs a traversal from the xarray root. Might be good to callout in commit
message. But is the right thing to do.

Acked-by: Usama Arif <usama.arif@linux.dev>


> +		if (need_resched())
>  			cond_resched_rcu();
> -		}
>  	}
>  	rcu_read_unlock();
>  }
> 

