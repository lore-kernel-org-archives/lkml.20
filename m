Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FC1A275
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480371; cv=none; b=ZWACKVM6Bwx3VOLcEj31uKJR+37hXrjA6VxbAjxq+ONcmOiNvbl6E9rJJOOSSzFCwEwPBKcDoF0cvYfoTAyNGv2MnvQgmhTlDTPi4psGv1e/ZLkNGO5hw7I/Czjd+7LYG5uMVkUlAIlHHB9dkIvVD6U0cSk/xTQV+oGm3SfNLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480371; c=relaxed/simple;
	bh=v/UusaEKbuSzM6wa4VpSHVUpZCScz0LtutuX5boQrr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLvRZsGRDL21y6vIK5uXpaDvdFScnPsBnM1pd3HKWNTzYQ3SDxrpPl81cEbMprCrLs1PAmZTB6apjd25HZeh1Nr4plbYadWscCu1ZVXZ/yeFpRfqgxmnkeXWqbLplhUR4YPqGp6Q3YQA5I3qndFqXQyZ73j8DZRWj/JGuKNVZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQqz0yLp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQqz0yLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DF11F000E9;
	Fri,  4 Sep 2026 00:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788480370;
	bh=DAqrTyyalVk6hMFOjupnL/nVpoH8Trr74L0HK5s083E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iQqz0yLp5Iu0SyAe6Lwf9Z1TOLbYKepCy0S830iqWpadqZXJ8QnO/GlV7ad9XdbiJ
	 8gEm8nODDu2z3oVS8ALswbSprcwlDWiAHNw0HtojITt3VnhfHg74lLCdcC+K6LfIHk
	 7HIhiBh1ffjdOmou20h265ublqJ/VH+wiSarVBu624w//QlMWhDp9XrWyo+OOmGBSo
	 iXLABn5O+mkG4tijSioUtLqzGWMlWWeYCCxo8YzBTJnWq27UJmE8USCsF+Tr8Jr30h
	 LHoxXQ0VEqIihNI8cBgsWoBrU84SDIqG0NhYB6cUorInaiJv3F616B7P63Lcy9KGMU
	 7MaA5gpQEy3ag==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in zap_vma_range_batched()
Date: Thu,  3 Sep 2026 17:06:00 -0700
Message-ID: <20260904000602.24574-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904000028.149656-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  3 Sep 2026 17:00:26 -0700 SJ Park <sj@kernel.org> wrote:

> Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
> final unmap")

FYI, this commit is in only mm-new.

> added zap_details parameter to hugetlb_zap_begin().  But
> the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
> As a result, build fails as below.  Fix it.
> 
>   CC      mm/memory.o
> .../mm/memory.c: In function ‘zap_vma_range_batched’:
> .../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
>  2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
>       |         ^~~~~~~~~~~~~~~~~
> In file included from .../mm/memory.c:48:
> .../include/linux/hugetlb.h:253:20: note: declared here
>   253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
>       |                    ^~~~~~~~~~~~~~~~~
> 
> /* TODO: move below to commentary */

Oops, somehow my tool didn't process this...  Sorry for noise.


Thanks,
SJ

[...]
