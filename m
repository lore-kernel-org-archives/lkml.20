Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A84C9010
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858747; cv=none; b=SR70fJutj/+H24/h/VBRBLV2q0jTPY4MDYmtzYYYHONBh6qUu/SCE4VQmEh2YPCDuuu40qFnvVR1BdirPx5m9KndGrSox3w1yKxJiCS4l4dlLeWx29aiGvKNBdqxyw/VYC/9ZACyS3KU2CxmCyFYc+Yy4k8OLdQwVJ0GlDbYj6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858747; c=relaxed/simple;
	bh=kxPh0WuMikjVIxMhGlyVx6DHT10KZS3T52C5dULvHFU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pGMTQZ6zHe0V1cHUuwiZgl6MWMX84GQh4KguewzkT6PcuaecxSWcoCCKR/Ktkt7dUAkWkXLrFZvl9jSJk5eLn1wkJkyXXaq4W9Tze9a0WqSISxk9pQPDf8GFzHkCMEVTgTfpbf9y7XkA/oPk9BegF0qphXulw3FB7H3mQPo91rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H5b7n2t8; arc=none smtp.client-ip=91.218.175.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H5b7n2t8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kxPh0WuMikjVIxMhGlyVx6DHT10KZS3T52C5dULvHFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788858743; v=1; x=1789463543;
 b=H5b7n2t8xEX7kB8ah1JxYVFXls5FQ2H1W8P3YqZqEeS1p5LmhzsbDAaSEaUxFa0y5wSwH1C+
 eUTJ6GoDjVhtEoBiBu9Cxf3XlEiZw1fWTV+Zw988vIV98UUZoZrjg5w+qJ9l7XZwZkMHaYpP1VQ
 rWWwPJHjD9AG6CFF7XB2SgQk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e6379ba285176541;
	Tue, 08 Sep 2026 09:12:22 +0000
X-Mizu-Trace-ID: e6379ba285176541
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v2 09/11] mm/sparse-vmemmap: drop the extra tail page from
 device DAX reservation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <f2f1f7e4-539f-4385-a28b-1fde074cdeca@linux.dev>
Date: Tue, 8 Sep 2026 17:12:07 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBFFB66B-86A5-43A2-95B2-37964D7D753C@linux.dev>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-10-songmuchun@bytedance.com>
 <f2f1f7e4-539f-4385-a28b-1fde074cdeca@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 8, 2026, at 17:09, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 9/8/26 11:03 AM, Muchun Song wrote:
>> The device DAX vmemmap population still reserves one extra tail =
vmemmap
>> page after the head page.
>> Drop that extra reservation and let the shared tail page cover all =
tail
>> vmemmap pages after the head page, so DAX follows the same =
reservation
>> model as HugeTLB.
>> This reduces the reserved vmemmap pages for optimized DAX mappings to
>> one and removes the now-unneeded first-tail population from the =
generic
>> and powerpc paths to simplify the code as well.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>  arch/powerpc/mm/book3s64/radix_pgtable.c | 46 =
++----------------------
>>  include/linux/mm.h                       |  3 +-
>>  mm/mm_init.c                             |  2 +-
>>  mm/sparse-vmemmap.c                      | 13 ++-----
>>  4 files changed, 7 insertions(+), 57 deletions(-)
>=20
> Looks like sashiko's response [1] is a false positive.
>=20
> [1]. =
https://sashiko.dev/#/patchset/20260908030335.96549-1-songmuchun%40bytedan=
ce.com
>=20
> __SetPageReserved() in vmemmap_shared_tail_page() marks the struct =
page
> entries stored inside the shared vmemmap backing page, i.e. the =
metadata
> templates that later represent DEV-DAX tail pages. It does not mark =
the
> struct page of the backing page itself.
>=20
> On hot-remove, free_vmemmap_pages() is called with pte_page(*pte), =
which
> is the backing page. That page is not reserved, so the teardown goes
> through __free_pages(), not free_reserved_pages().
>=20
> Right?

Absolutely right.

>=20
> If so:
>=20
> Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

