Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7B4483BE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756388; cv=none; b=u9ni03IGzFuGzUvYq/Q8o5nORnW56HmIbmarHXrsfrqZBu78KfjSTmAfGfWdKA6jyWlWX/HqGqjqwiL/fQjM2dT1NhQsnhiAmAR0D1670r0aFpxMdD7MYBTTY/BlNYrtNlOvm565MOitd0rM6enmaEjodPwJ+b2pTJgpcEGU9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756388; c=relaxed/simple;
	bh=MK17grmiiLuIJXG/CYGDrodsaOHw9YiOKsXMD72dySw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zi2ZUBUa6xIQyVW//cXcpEMvQ88++aW6Q0HWJBFHb2CAxcA3JWN7ZvlseYi4FWMDhozDlnyFdoYeh9oXeNMs1VipJuEX0tNkAZQLQ8VQQEKoYvFu+rKJ/mhRG2Wbkn5u0i6Yg4ZURXEfnZ1pX/3aiidDAcX8wbTLC6Kk2KS6sVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVHiiujR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVHiiujR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA55D1F000FF;
	Wed, 30 Sep 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790756385;
	bh=JDjw+45ZNrtvu5F2t9lQCEebxqfaUjTzsJjMtfW+q48=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=BVHiiujRfXo4lkjG0Xe27sjzAAibGxO1GEfBaiQC06ZMGsL8CPZg4SEawGP7ZnC3h
	 A3kTawXNUNP30NfDDI/GqHIDxsAcFHJtmHZPtjc2piUEzzjlQ3N4gKcgXfJ7F6EqXh
	 7XNLIgPea2BU/uhD8VweCZ5Iq2RIQU41dnsfyl54ftq3pIIlKPD4WFL4y/6avNA3DQ
	 E+4vcx8Loii9VnezNjNp/WkWzGVROkHzKBj1uSsL8j6VUEd0izqh0y8L0irwoDgHhI
	 LeTijnJwrwMy5Jn4xz1cIS9lSPOLbIbPDknxvbD3lLnis0Nhuoj2nHyFqAbYamJs7T
	 bt1AV2Y9qgNdw==
Message-ID: <95029d2e-4cea-4c2b-a253-9b7efd989028@kernel.org>
Date: Wed, 30 Sep 2026 16:19:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Tal Zussman <tz2294@columbia.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v5 07/17] f2fs: convert the ->private flag helpers to
 folio-only
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-7-bb68b6a21869@nvidia.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260920-remove-pg_private-v5-7-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 10:28, Zi Yan wrote:
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
