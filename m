Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD0329C7C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354740; cv=none; b=eSEmPDY7Q/Lori41faW6PmcAuTq0ydi4e3+Jy8mXe6LHtkpv/PXbfsVUEQ94P98N5N/+9tHP8A368k5Q+b76A1UApnQRJzWczm89+Kp7J8m8TECoIdOi8GloJubyF269RC/xoILeQFEwI1ROJo3Yw9VwNZ3JYsD4Xz+1WqLEiJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354740; c=relaxed/simple;
	bh=A7yAUSnBd7HoeH98LBMwrZlDpQbhvJ6foXDoX076yJI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uFdvrxavSlna9PbMcogBLfgtgZL5uz9BlvI6uudt3efcpoKdlgbXw0E/EFLQOt4HAeXI01qtrwEpdq86ye10SSy7Xr5eQ/+BhOK6TgWo4iRBpOZpf2OXMkfV4/xd/swiOmeNo0iRiexbfUsJF0gGjGBFUPvGR5jcvjgcwuruH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=guKGNCR+; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="guKGNCR+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A7yAUSnBd7HoeH98LBMwrZlDpQbhvJ6foXDoX076yJI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789354735; v=1; x=1789959535;
 b=guKGNCR+9qot8zKtwaMYdeeCEc1Pnviyq3uQCGNnxwQ8BmeF0G8ITGLl8kMdkAjAauor8A2B
 kaWQWIA4PlmS9E5/dhKoDJ7pyihtjtMPM3jSzGi5vj7aDEdoaOqsxTSOkx0+IQHixfFXAwap++F
 oBf0AbOQzGhpd4/6QDSa1qWs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 01a63c164231c3d2;
	Mon, 14 Sep 2026 02:58:55 +0000
X-Mizu-Trace-ID: 01a63c164231c3d2
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v4 05/16] mm/hugetlb: use direct assignment instead of
 folio_change_private()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
Date: Mon, 14 Sep 2026 10:58:35 +0800
Cc: David Hildenbrand <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: 7bit
Message-Id: <68F8CEE5-2DAD-44D1-A1FF-A3BC985EF2A8@linux.dev>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
 <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 14, 2026, at 10:24, Zi Yan <ziy@nvidia.com> wrote:
> 
> folio_change_private() should be used along with folio_attach_private() and
> folio_detach_private(), where adding and remove ->private content requires
> folio refcount change. add_hugetlb_folio() simply sets folio->private to
> NULL without refcount manipulation. Change it to direct assignment to avoid
> semantic confusion.
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Muchun Song <muchun.song@linux.dev>
> To: Oscar Salvador <osalvador@suse.de>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks

