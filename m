Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3031E8332
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789182694; cv=none; b=drOsB4/O7+OSbhiU6oZODtrBNtCVDqgwu5QWae46BsV3d3zIZOVq8JCw6Bz8j4JnIzvsat2TgN5UpDM7rQg0HlK+3VKGbCCGHidBCcSOary7kzqFDxYFoSdhDmzeUsHtjrxEtITjIdIqLDWiNdorCq8GPb1bJWwo0p1L2RVB+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789182694; c=relaxed/simple;
	bh=44rZqpZhEH8P0al8mdGjQVEEhurovctXDBOm6bGHXVk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=sj/D1V0cyi8L2GNS0TZEArEfhGsnXFksOUvaMZGJxXwkd3jgZqEOFC16dBuwBfVsjwlKb/2oiH6R6mSTuhjfTIbMVFmKd5LXtvB29webvW5udFTVVsBjLpB/IcZuLSHfTB/STMvriNAhYQEvrJxIBJOfeuYuKnJikTi2e4laAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OTnYzwSA; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OTnYzwSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject; bh=44rZqpZhEH8P0al
	8mdGjQVEEhurovctXDBOm6bGHXVk=; b=OTnYzwSAp8Ms5R4UJF6tAsTZgkq9Y/+
	1jnV2brKcO3Vuz61Ug3y4AB3blt2mck/ctXTIz8dNToVlb48a6tcfHy/+xnbz95w
	Y3Iv0V2Jr9Osoy9aZ/mOrb8yfSutkDP7tAI6Yq4vZAeU6NQ26OaKX9hkS3YFpPH3
	P++7PrNeupmE=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAnIyKswqRq4ZmlRA--.7821S2;
	Sat, 12 Sep 2026 11:10:37 +0800 (CST)
Date: Sat, 12 Sep 2026 12:10:36 +0900
Message-ID: <aab6844e51f8600e1b152fc2ab13ac1e.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/migrate_device: consolidate compound folio handling
In-Reply-To: <664b3576-05a9-4c49-99c6-ba0928b25300@kernel.org>
References: <20260911061348.2869524-1-sh_def@163.com>
	<664b3576-05a9-4c49-99c6-ba0928b25300@kernel.org>
X-CM-TRANSID:QCgvCgAnIyKswqRq4ZmlRA--.7821S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW7uFy7Xry3ZrW3Zw4fZrb_yoW8GF1UpF
	WfK3y3trWDXrZ5ArnrZr48Xa4a9rWrua15G3Z5Jr1Ika15J34vkw43t3Wagr13Zrn7trWx
	Z348tw1UX3WUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYD7-UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwg2f-mqkwq2vNAAA3U
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi David,

> Two tab indent please.
>
> Just to be sure: there is no way we can currently validly trigger this, right?

Correct, as far as I can tell. I checked the current in-tree callers and do
not see a valid path that can trigger this condition.

The migrate_device_range() callers evict complete device-memory chunks,
and the migrate_device_pfns() caller expects large source folios to be
represented whole. In these cases, the supplied range or PFN array is
large enough to contain each encountered compound folio completely,
which is required because a compound folio cannot be partially migrated.

The condition is still reachable with invalid, truncated input. For
example, on a 4 KiB base-page system, passing only one entry for the head
of a 2 MiB device compound folio would leave one entry remaining while
folio_nr_pages() is 512. That would be caller misuse, and is the invariant
checked by the WARN_ON_ONCE().

I reran the original HMM migrate_anon_huge_zero reproducer on current
mainline. The private-device case passes, the coherent-device case is
skipped because DEVICE_COHERENT is unavailable in my test configuration,
and the test exits with status 0. I also instrumented the truncated
compound-folio condition; it was not hit, and no KASAN report was
observed.

I'll fix the helper parameter indentation and resend the patch.

Thanks,
Hui

