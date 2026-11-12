Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473654;
	b=WgTUX4DPZmYbjyi28DzoMEXSZymtPb15+cBaqhf9OVpxNOg2WuBRzDHZHKmnMNzcfVY0
	 78Ws7TGItzbuiu9pCSdDaZc4hVrnRt71Mz61ZXabo9SCOxjoLoN5sWRefBQfsRlAYwigt
	 WnKCwW7qir6mWpMr90O3zt6NodVEFUSh5blgjOgKNLEHYrm7HVx/LLEKfpKqML9Q3S+3H
	 cKozDO8R4K1XGZQvtMcalXtFnbiczVAGW+hlE3pzEzhxOCdABCVRwkc0x9+NSpVaWNP7S
	 B1HpPuQWQu617nHBLGzmxUcoERPrmpstkOVchLpGDg29T9pP/QMjo+IchBMRKGp7CnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473654;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OT4UYzJ55zbPPzE3sSYyUxZKuwkGev+001urY+Jtyv0=;
	b=NKDWu41ubhskCYYV+us6/3dvN7ePqKG7hczyNw6ncWnSmMEwESu9MwwbG61ZRDh+iKaI
	 /f1NtsJ0j2gQMq5GettajBJQGh7sqZ3jwtj67dxdzFVQ/KVZsy3U2z95lPffVaPGlMJpq
	 1UeYK9IY3dx+3D002r6UzD8vYWdWdZn94uiCyqp3RnUe6sJOcKypeyz6wBZ9+wRI4rhdt
	 8LD1cTTqpLpj6HUOAJ6mUptTiVSduVG42Ai8KMurIq1ApLzSh4u6Jopkyejzjrdrmsgjr
	 GKegSEmeEb9D0TmzqJQSQ7U57EcLHC42mkyjbAtVni55yGmXgXW0urQodSvWM4TuFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSxzzXAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F9606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSxzzXAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED451F00A05;
	Thu, 12 Nov 2026 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473654;
	bh=OT4UYzJ55zbPPzE3sSYyUxZKuwkGev+001urY+Jtyv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HSxzzXAQAXajBmw3uzuM1xXEfDxqd9aJG7PLJu051MyVrGQ1NaJm3jkY2BfPcSs61
	 KQVrEw+f/uZxjoPuRgJso2EKttZxcRCo50io39UiuYuf4Il8I1iDf4lFu29Je5hkke
	 wMxFFXLGjAE0evcUlapK2syy4lY2aGUBLtmwfUcQP5TEPNcCO9sC/3Oe+1isVNwt6l
	 Oe6xf2kLohBkQTpw7HlPYlVGuPoUTVTpLqvCRH7aIGvPwbYKHiCVA5kXV0VH7M8nio
	 zhe7wrGIvhQ6/RoYNJw700AstBFvZkICaw2fkm+pVWHqezWETqQZc1oun5vXPru4x1
	 ZsuSAGWiWPm2Q==
Message-ID: <bfe69f54-9eda-454b-a764-7a9b185e2175@kernel.org>
Date: Thu, 12 Nov 2026 09:54:03 +0100
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
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
To: Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, matthew.brost@intel.com, ridong.chen@linux.dev,
 shivankg@amd.com, willy@infradead.org, ying.huang@linux.alibaba.com,
 ziy@nvidia.com
References: <67275d3d-cc60-406c-a088-298b948d7577@kernel.org>
 <20261112024855.424402-1-husong@kylinos.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112024855.424402-1-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 03:48, Song Hu wrote:
>> On 11/10/26 04:09, Zi Yan wrote:
>>>
>>> It would be better to simplify the above like Joshua suggested.
>>>
>>>
>>> Like Joshua said in another email, it will be more readable if
>>> NR_SWAPCACHE updates can be moved into the then branch above.
>>
>> Can one of you write me the updated patch description? Thanks1
> 
> Sure. Here's an updated commit message incorporating Joshua's
> suggestion to describe the accounting model first and then explain why
> migration gets it wrong.
> 
> mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
> 
> NR_FILE_PAGES is accounted on both the node and memcg planes for page
> cache folios.  Swapcache folios are the exception: they keep
> NR_FILE_PAGES only on the node plane, while their memcg accounting is
> tracked as NR_SWAPCACHE.
> 
> The cross-zone path in __folio_migrate_mapping() currently migrates
> NR_FILE_PAGES through mod_lruvec_state(), which updates both planes.
> This is correct for normal page cache, but wrong for swapcache folios
> because there is no memcg NR_FILE_PAGES state to move.  As a result,
> migration incorrectly increments the destination memcg counter and
> decrements the source one, leaving the per-memcg accounting incorrect
> until the memcg is destroyed.
> 
> Reproducer, on a 2-node QEMU guest with cgroup v2:
> 
>   1. create a cgroup with memory.max = 50M and swap enabled;
>   2. memset 128M of anonymous memory in it, so reclaim swaps most of
>      it out;
>   3. fork to raise the swap entry refcount, then fault the memory
>      back in, so the resident folios are swapcache ones;
>   4. migrate_pages(pid, node0 -> node1).
> 
> "file" row of memory.numa_stat (bytes) after step 4:
> 
>                     without this patch      with this patch
>                       N0          N1          N0          N1
>                      0 (*)  51691520         0           0
> 
>   (*) the source counter has gone negative; negative values read as 0.
> 
> Fix it by updating the node accounting directly for swapcache folios
> while leaving the nonexistent memcg NR_FILE_PAGES state untouched.
> Non-swapcache folios continue to use mod_lruvec_state(), preserving
> the existing behaviour.  This mirrors the existing swapcache handling
> for NR_SHMEM in the same block.  It accompanies
> commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node
> migration") and commit c5eef2e03618 ("mm/migrate: move
> NR_KERNEL_FILE_PAGES on cross-node migration").
> 
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> 
> Thanks to Joshua and Zi for the helpful reviews.

Updated, thanks!

-- 
Cheers,

David
