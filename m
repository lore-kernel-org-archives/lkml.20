Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B719439F77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976363; cv=none; b=NMf6G4xCm/6U4Qkh3KgmCSM4gDu62UNaqEXjBSli8Gs5Rr6k8WmXMuktRSt3vz062vvIJ8UgJAyw8orDwPJ+M/wXUG8dl/TTd8u1BO3fIHt5XIgMvqjD2S4KMT0WCjEKFNKnw7D89I+TwrlxYnxGl331XipOjC6z284fv3eeTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976363; c=relaxed/simple;
	bh=QASj6Z6chGBEQBYT8Fc20eY9OhWz9aaUtq7xvhcRKKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBGnEtFUrXneTywoBvV9+GjZKBv1NsLhIWrob8x/x38jQlXcqioGvOmeqK7D4PvxVlM7s9SmecEbw+/Q75bwF4LFSZla5/GNAGznkhsX8+ZpEc5XS3aPcaDtO4YRSw7es7F8iXu97pAgGa5qZGE93E/d/qro7mzrZis9PAdC9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MOHCbkyB; arc=none smtp.client-ip=95.215.58.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MOHCbkyB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QASj6Z6chGBEQBYT8Fc20eY9OhWz9aaUtq7xvhcRKKw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789976357; v=1; x=1790581157;
 b=MOHCbkyBVQm4tJ9DsrkkobQByRHrE03xCq8KQR+8P5TLGQdvpA2xiw0OsToI6SmT3OzfUNhX
 YUV98ukDxnv+7lT/oLUAhR6Isgqc6ZcLsMsVdHz/vkDAC+jwA5IyymPGOPbhwE797N4owb37Dky
 9z0gJsjcNnH0jPxfd2YE9QHs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57f2f9324be8538a;
	Mon, 21 Sep 2026 07:39:17 +0000
X-Mizu-Trace-ID: 57f2f9324be8538a
X-Migadu-Flow: FLOW_OUT
Message-ID: <b71094a8-d5b3-4d24-8423-18882fbe0cb8@linux.dev>
Date: Mon, 21 Sep 2026 15:39:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/17] f2fs: convert the ->private flag helpers to
 folio-only
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Kairui Song <kasong@tencent.com>, Tal Zussman <tz2294@columbia.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Qi Zheng <qi.zheng@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Nico Pache <nico.pache@linux.dev>,
 Dev Jain <dev.jain@arm.com>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Shakeel Butt
 <shakeel.butt@linux.dev>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-7-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-7-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:28, Zi Yan wrote:
> page-based ->private flag helpers are used in the compression path, where
> large folios are not enabled. They can use folio versions with
> page_folio(). The two remaining users in data.c and segment.c can use
> fio->folio instead of fio->page (two are in a union).
> 
> Drop page-based helpers after the conversion and rename
> PAGE_PRIVATE_{GET,SET,CLEAR}_FUNC() and the PAGE_PRIVATE_* flags to
> F2FS_FOLIO_PRIVATE_* to match. Convert the folio/page union from
> f2fs_io_info union to folio only, since no page user is left.
> 
> The folio helpers do a plain read-modify-write where the page ones used
> set_bit()/clear_bit(). It is fine because the converted code either holds
> folio lock or, in f2fs_compress_write_end_io(), matches what the
> non-compressed code does in f2fs_write_end_bio().
> 
> Assisted-by: LLM
> Suggested-by: Tal Zussman <tz2294@columbia.edu>
> Co-developed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> To: Jaegeuk Kim <jaegeuk@kernel.org>
> To: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Tal Zussman <tz2294@columbia.edu>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nice work! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
