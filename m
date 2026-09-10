Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE2379ECF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030157; cv=none; b=KJgJVpxrFpOqwCyRLi/dzexNiqo9vEGyA2IoY0Po+Sl+GGg059+GjwCmuDbJmi8hkeU/VYQus/5izR5QSPQg2fCaEaqyQrtB0KAQvI/SS2+ApCgwCaWectV52CVvuLqxoemPxLXPr+j8iTkIPW4fxPPAk0vKkzb7eXQmrHuKxm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030157; c=relaxed/simple;
	bh=cKuwuIWP8qEeczDc5QlfnsAOInD0LRisQ2KVelC1a+w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CzBWwUSzxb6OwapStiezIkTeVMi69IZLyI8wwyOiU9In5KwT2LWKJg/eF6esPz4BlAQ0gyJxJWrRSmG41s15SyLtJxBNyNf/eNxhUxoucsziyKPlr5s2L33Jk+PlI2GF3AlKTS6wQoe0+S6K0w5zFgxJJUkHWlA99ZNBVzYQ/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eKzxXpg0; arc=none smtp.client-ip=95.215.58.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eKzxXpg0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cKuwuIWP8qEeczDc5QlfnsAOInD0LRisQ2KVelC1a+w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789030152; v=1; x=1789634952;
 b=eKzxXpg0e1hs7CJm0Qn1KX2+hceWPwqalu45lskTdhbCW5Nulqynl++5BsJreCVTkezCZecP
 GzYgaW49lP3XNbbcYYShqGF9C7JbSoTzliszift/7eZltVl5Q6V6TJ/HcOn3L2jeo07DTKrp4U0
 RmWjPObmw1oToqhVro9EVsZU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6767c20d1bd6aecd;
	Thu, 10 Sep 2026 08:49:12 +0000
X-Mizu-Trace-ID: 6767c20d1bd6aecd
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm/hugetlb: account for allowed nodes when gathering
 surplus pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
Date: Thu, 10 Sep 2026 16:48:56 +0800
Cc: osalvador@suse.de,
 linux-mm@kvack.org,
 david@kernel.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A0F6014-4E2C-4F07-9732-2DF32418B986@linux.dev>
References: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
To: Huaisheng Ye <yehuaisheng@open-hieco.net>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 15:46, Huaisheng Ye <yehuaisheng@open-hieco.net> =
wrote:
>=20
> Hugetlb reservations are accounted globally, but hugetlb_acct_memory()
> also verifies that the current cpuset and MPOL_BIND policy contain =
enough
> free huge pages to add a new reservation.
>=20
> gather_surplus_pages() calculates its allocation shortfall from the =
global
> free and reserved counters. If the global pool has enough free pages, =
but
> those pages reside outside the nodes allowed by the task, it allocates =
no
> surplus pages. The subsequent allowed_mems_nr() check then rejects the
> reservation and mmap() fails with ENOMEM, even when
> nr_overcommit_hugepages permits allocating surplus pages on the =
allowed
> nodes.
>=20
> Calculate both the global shortfall and the shortfall within the =
allowed
> nodes, and allocate the larger of the two. Include surplus pages =
allocated
> outside hugetlb_lock in both calculations when rechecking after =
reacquiring
> the lock. These pages are constrained by alloc_nodemask, so they =
satisfy
> both shortages.
>=20
> Easy way to reproduce this issue with 2+ NUMA nodes system:
>=20
>  # echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepage
>  # echo 3 > =
/sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
>  # echo 1 > =
/sys/kernel/mm/hugepages/hugepages-2048kB/nr_overcommit_hugepages
>  # cd tools/testing/selftests/mm
>  # numactl --membind=3D1 ./hugetlb-mmap 2 21
>  TAP version 13
>  # [INFO] detected hugetlb page size: 2048 KiB
>  # [INFO] detected hugetlb page size: 1048576 KiB
>  # 2048 kB hugepages
>  1..2
>  # Mapping 2 Mbytes
>  Bail out! mmap: Cannot allocate memory (12)
>  # Planned tests !=3D run tests (2 !=3D 0)
>  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>=20
> This fixes hugetlb mappings when, for example, a task runs with
> MPOL_BIND on Node 1 while the existing free huge pages are on Node 0.
>=20
> Similar issue also could be found in ltp if the free pages of global =
pool
> reside outside the nodes allowed by the application.
>  # cd ltp/testcases/kernel/mem/hugetlb/hugemmap/
>  # numactl --cpunodebind=3D0 --membind=3D1 ./hugemmap10
>=20
> Signed-off-by: Huaisheng Ye <yehuaisheng@open-hieco.net>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

