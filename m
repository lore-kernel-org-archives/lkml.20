Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65B04A49B8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639481; cv=none; b=V4mb9evKuS1DTBOMgVcqNDot3S/zW1ywEo9tVJEYOOhQvTIfTGjpfW7weJ6Q3N7oQxEabdPbxIQETIolIvQTdYPj+k8mFkWlmOYcTENxyi5nlZg2SgDDqCgo1hl3TfqpamW2qc1or3WSoXtdUtq7NCwl7MTbn6cBlmiWbbKBlfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639481; c=relaxed/simple;
	bh=um+kB+/1dd3CrZpB7pm7ZqNd5aTE9oIXH5aBLAcW9WU=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=QjIsRcWFU4IxmEIeISKWdCoJeIPZUCF5QZx5Sv3QDu+mnB1C2SxA779c/JRy9+Bmr7nfEbYWQnKNQ28rzAQNHrFYPipssIKzU2fcSS03T91Gh/P7ak0MIn/JoPckzu7O3XSmJxwyFFIJfznePKRgybc3peJoFY82B2nBPHhmIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QVR71EpC; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QVR71EpC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=um+kB+/1dd3CrZpB7pm7ZqNd5aTE9oIXH5aBLAcW9WU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789639464; v=1; x=1790244264;
 b=QVR71EpCz0PgY6oK/noJmZH71vrf1S/sB7dtcl2QkvQmu1FQj2vEhV1XyW3oJfQGYQ4zB5Q5
 Gb3YVEXkKorYYXX/5CaB0Jxa2SwoW3Hx1DNkjJ+9t96IU+8vRWQT1Wt3RnsjKwUcA7j7U8DFxHr
 FlbtefRU/UUWFcoUVGuNtY6A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b18fe0d830ae10e;
	Thu, 17 Sep 2026 10:04:14 +0000
X-Mizu-Trace-ID: 4b18fe0d830ae10e
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 10:04:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Li Wang" <li.wang@linux.dev>
Message-ID: <3f7c7f35866b47158369bd526cc4a17244cbcd92@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] mm/hugetlb: account for allowed nodes when gathering
 surplus pages
To: "Huaisheng Ye" <yehuaisheng@open-hieco.net>, muchun.song@linux.dev,
 osalvador@suse.de, linux-mm@kvack.org
Cc: david@kernel.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, "Huaisheng Ye" <yehuaisheng@open-hieco.net>
In-Reply-To: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
References: <20260909074642.7308-1-yehuaisheng@open-hieco.net>

>=20
>=20Hugetlb reservations are accounted globally, but hugetlb_acct_memory(=
)
> also verifies that the current cpuset and MPOL_BIND policy contain enou=
gh
> free huge pages to add a new reservation.
>=20
>=20gather_surplus_pages() calculates its allocation shortfall from the g=
lobal
> free and reserved counters. If the global pool has enough free pages, b=
ut
> those pages reside outside the nodes allowed by the task, it allocates =
no
> surplus pages. The subsequent allowed_mems_nr() check then rejects the
> reservation and mmap() fails with ENOMEM, even when
> nr_overcommit_hugepages permits allocating surplus pages on the allowed
> nodes.
>=20
>=20Calculate both the global shortfall and the shortfall within the allo=
wed
> nodes, and allocate the larger of the two. Include surplus pages alloca=
ted
> outside hugetlb_lock in both calculations when rechecking after reacqui=
ring
> the lock. These pages are constrained by alloc_nodemask, so they satisf=
y
> both shortages.
>=20
>=20Easy way to reproduce this issue with 2+ NUMA nodes system:
>=20
>=20 # echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepage
>  # echo 3 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/n=
r_hugepages
>  # echo 1 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_overcommit_hug=
epages
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
>=20This fixes hugetlb mappings when, for example, a task runs with
> MPOL_BIND on Node 1 while the existing free huge pages are on Node 0.
>=20
>=20Similar issue also could be found in ltp if the free pages of global =
pool
> reside outside the nodes allowed by the application.
>  # cd ltp/testcases/kernel/mem/hugetlb/hugemmap/
>  # numactl --cpunodebind=3D0 --membind=3D1 ./hugemmap10
>=20
>=20Signed-off-by: Huaisheng Ye <yehuaisheng@open-hieco.net>

Tested-by: Li Wang <li.wang@linux.dev>


Regards,
Li Wang
