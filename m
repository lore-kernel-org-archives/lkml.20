Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889B387596
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966239; cv=none; b=rZyWX1t8bZHFGKYIFAQH9nOTF77uYzDAk3pl3foZAnFf/ykd4nlhoShUAygoowNmjFtmfk4w5C2ml+rWZuVYcQClI/4tZobOil2TiBmRuywqvrMC1sV4UiXxnh5JUPJcZodKESK4YaY0fD5B0cAQe8r0mIKFGIAkWUEBSlF6qxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966239; c=relaxed/simple;
	bh=OLXC7qw5IjejpZgUTQx1wM51wAjGcyUwJPApHpQcNVQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=E7STFcLNMG8ILgj8OVwV5+hMeFnOovqplqZ+d0rKX0gLpg8M3vQFrzvmshbiznvbronXbWWdFD3nA9oIJ0FcLeyfd+NyMtJNgX/H0Mk+ogpbelKyn98K3GGMhnZWPBDOIRE/HUKNmcQCfQOiNs9u1lkcAyLEE02iSMlMfNRI2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pEHQ7O/b; arc=none smtp.client-ip=95.215.58.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pEHQ7O/b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OLXC7qw5IjejpZgUTQx1wM51wAjGcyUwJPApHpQcNVQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791966235; v=1; x=1792571035;
 b=pEHQ7O/bjvhjp+IrhX+KbDztmvxS1SAMcfaFZiKHYOIdq5lDlBmxX6hbYGAR95EirfqsY7ln
 Gcyepyo8d2/FL6+usTFgOYPiM1qW4R4HeTjTR5x812TyC0BnOrBqCCvIRewbHY9iP0lR4VfXH2W
 W62ZB0xbHwMpIB25vbQeSf3M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1780a9b33c14a0b1;
	Wed, 14 Oct 2026 08:23:55 +0000
X-Mizu-Trace-ID: 1780a9b33c14a0b1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2] ipc/shm: fix RSS accounting for hugetlb shared memory
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261014082218.2236088-1-tongweilin@linux.alibaba.com>
Date: Wed, 14 Oct 2026 16:23:38 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Dan Carpenter <error27@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <05518093-AA04-4525-96F2-FC7AC327DCDF@linux.dev>
References: <20261014082218.2236088-1-tongweilin@linux.alibaba.com>
To: Weilin Tong <tongweilin@linux.alibaba.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 14, 2026, at 16:22, Weilin Tong <tongweilin@linux.alibaba.com> =
wrote:
>=20
> Commit a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in
> filemap.c") changed mapping->nrpages to count base pages for hugetlb
> folios. However, shm_add_rss_swap() still multiplies it by
> pages_per_huge_page(), overcounting RSS in both SHM_INFO and
> /proc/sysvipc/shm.
>=20
> Use mapping->nrpages for RSS accounting across all backing types, and
> account swap only for non-hugetlb shmem. Use READ_ONCE() for both =
counters
> instead of info->lock, which does not protect nrpages and cannot =
provide
> a consistent snapshot.
>=20
> Fixes: a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in =
filemap.c")
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

