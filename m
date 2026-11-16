Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802857;
	b=DPTyYxtpuaFgK3OXTyX4DAlZnBYIPymafPK+B5q4XC1YWLVWbJsgNAW238rAUSqSWW83
	 +fnXIpO+bDrS1BRYidwJ6oHJrCGZIWJERpkXMDtVgAoH6WEPgyW9gf6zinnYogWSJ+KA9
	 Uz9ZbSyho7FCyk5D4cxQw/e4M4Yv/8fyTfHG5oDWFflhO1sWFwDDfIOqSJkMyGqjbqydn
	 CCXax3XtCvtwNBeDCaMKdzH+F+kG6+GJ9CQKcgXdjxCH7cRkc4QCJOut9f3wxK/9lv6h/
	 u00LyHwTpfer84RuJ2CYBBq1Ct+48l3bXoaHCLJHf8MDkIC0ULgtz/Ir+GJHUbezjIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802857;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hwx3UqmvUcD/HyRqK0DpAUkWsr95XozabXUp3cBOCMk=;
	b=XT0Z0z1hedlACX/Z7h/bmrcZsk3SPJfeEdtx6LjXR/ERCT0NEIn+aNbaHarazphI4+fo
	 +LguyfpDXQnBWuihmLR8s/GqKJLGCxQpS55CcWRHxpZMHuGH3zK+LvM6nMY5bt567riiJ
	 ePBQox2QKWar17SJKpwTRMEZIVT0PwyjcWc2U8hIi6UMxxHFHqbrLledxYXVscLENSVRB
	 azgcN7omBRLU1O6qiW6j4WGoW5+4BDI983S9UNZ8jc0A4fwpqA198esTdFcK7/46f3OUf
	 8RiPHMh9zQ+jn6ch8wLyWyp3G5Zzy17M1NUINwbpHMc9Zj3AiACBY9vsJlPCObkudWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TQUol2j4;
	arc=none smtp.remote-ip=91.218.175.217
Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5159606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5159606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TQUol2j4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7pW8AZ8R/uTepnlgwO1WpGRt3bCUzg1YhLz1Re5mJrg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794802854; v=1; x=1795407654;
 b=TQUol2j4Aagt78om7KOFmEdN1Ij6QCkrL8ywx9HPQx+fSwH5132izO9ORmIpD6VPL5LdSrFo
 Y6l5ayhTHz6gNcR7ruhQ4oiCztTGwZknXVRkSoAizIzsMjBU8u0UahPGGNqGG769FAZMtAsPWv7
 jGDqm0FH3EW8dcnDGmYQ1pLg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad4f7a5ec1aa5aec;
	Mon, 16 Nov 2026 04:20:54 +0000
X-Mizu-Trace-ID: ad4f7a5ec1aa5aec
X-Migadu-Flow: FLOW_OUT
Message-ID: <080c7d55-f140-4265-a30e-e5d568f3b954@linux.dev>
Date: Mon, 16 Nov 2026 12:20:40 +0800
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
Subject: Re: [PATCH v2 00/14] mm: Unify memmap initialization for compound
 pages
To: Muchun Song <songmuchun@bytedance.com>
Cc: Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261113033442.62970-1-songmuchun@bytedance.com>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/13 11:34, Muchun Song wrote:
> Hi,
> 
> This v2 is based on the mm-new branch at commit daed51c91051.
> 
> This series is split out from the earlier, larger series
> "mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
> generalized vmemmap optimization across HugeTLB and device DAX. One
> remaining piece is the separate compound struct page initialization used
> by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.
> 
> This v2 also folds in Li Zhe's two-patch series, using that series' v2
> as the integration point [2]. Those patches add
> memmap_init_page_from_template() and use it to reduce bootmem HugeTLB
> tail struct page initialization overhead. The surrounding patches in
> this queue are adjusted to build on that helper directly, so the merged
> series keeps one template-copy helper and then shares frozen compound
> page initialization between ZONE_DEVICE and HugeTLB.
> 
> The first two patches are the merged prerequisite series. The next four
> patches make the generic memmap initialization code suitable for
> sharing. They add zone-consistency verification to template copies,
> factor the PFN-independent page state, simplify the ZONE_DEVICE template
> setup, and introduce a helper for initializing frozen compound pages.
> 
> The HugeTLB patches then make boot-time gigantic HugeTLB initialization
> rely on the common frozen compound-page helper. The following small
> cleanups make now-local helpers static. The final three patches move
> early-reserved CMA pageblock setup into cma_activate_area() and then move
> MIGRATE_MOVABLE pageblock initialization into the shared memmap helpers.
> 
> After this series, boot-time HugeTLB and compound ZONE_DEVICE ranges,
> including device DAX, use the same helpers for frozen compound-page and
> pageblock initialization.
> 
> [1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/
> [2] https://lore.kernel.org/20261112112816.55095-1-lizhe.67@bytedance.com/
> 
> v2:
> - Fold in Li Zhe's memmap template helper series, based on its v2 [2].

Nit: actually, the link [2] points to Li Zhe's v3, while this says v2 :)
