Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476380;
	b=uQNzfRdYhnK+yCgj0mB5ugnVWSCHDOHxErCQ9euUzpz8Oxm1frS6KA1MRHsukvBna6s2
	 GXpw6qV9oH+PV4F5+crbl3wbiYsX/6aq205YFIdWaDY3Y1S55HXmPKgZbkUs8XIcK95tS
	 aeFJ3qPdqunA3tRsarNUAkwQyOCiwyQ/Ft1G3UWX2Qcukjt6ZNOn9xbgIWCKrbDgxPGeA
	 vXST042zlSArB1+pDY+SQTtDoUX/ADOTKBnDi/6KTRkaUKP0zkmy7oxsKCzKVkEXiXcwB
	 BZh+BuHg+Rpbu+GOCcE+f3x+xeOsrUFTltEOQj5kNVIzJc8OCh4gz/MDHp8IXk37ZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476380;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=+qZVe7H4KMKBxamxaLHZL9oGHtOAsg+pNoHshyfPpG4=;
	b=gN1G7ccS7VIvP1xKJ9948DZYvE21h6B8bwL/yPESj99Xty5fNLPmBSzDuFVTMlkTMjzO
	 saOqx07FzWs4W90ULeFq3RQ5tKKvxW244v5xDWRbhE3/AuwVa2H9Z+txUBphcTBzk+5Ti
	 jPVScIf/rW+KR4EKJDogzxxDjZNyvIgwA9RMiTrGUqKGEL3JP9ZzQHN1inEF69jW7nvu1
	 DPG7eaT/nERjH2/O5u6yXIIFhpADQuJZ1BsAPogRSFqXq8VF3F/qnVpPruo/ozlPAPI/t
	 XsZL1MyI49l/Jl5yo5b7UhTC+2MpbzZRVqC8fnwfrMgSk7JMyzoWnOmMogXFpivvmoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODECxA9y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3575606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODECxA9y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5761B1F00A05;
	Thu, 12 Nov 2026 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476379;
	bh=+qZVe7H4KMKBxamxaLHZL9oGHtOAsg+pNoHshyfPpG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ODECxA9y1Z6siZR8OwuwDYoboqLxQIe+qqo+J8zI+sp0yRBw8eyM3kziDFpXndHzD
	 SzqJb37cgvobwr0NhpIFwN6EKQcHRMQMtWLqjPtFdI7TkHoKwVLstwdAltvciPMEFH
	 uDcWdPxB0/l9k5ljUxPxSlpK9BJavvlwQsqsMQeCe9qv6QmxxVGqG2G7xHjOS0/I4m
	 pm7Azv+TNXUWwscLesUbHMh/wGg7iGAy23eT4GBCeBVnA98fELahFI0yW9V/965Va7
	 XmsaZ18t1AuZZJB9uyJWo214iVZacmLDi9/tKYe5X6ZQpQOA/nI2KKKYY0kJHS5u+I
	 fISEXgbfmoBCQ==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
Subject: Re: [PATCH v3 0/3] mm/khugepaged: bound mmap_lock hold time when
 walking an mm's VMAs
Message-Id: <179447637396.7058.8722598190835864744.b4-ty@b4>
Date: Thu, 12 Nov 2026 10:39:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 10 Nov 2026 17:19:10 +0000, Lorenzo Stoakes (ARM) wrote:
> This series introduces a couple small changes to khugepaged to improve its
> behaviour both in the face of mm->mmap_lock contention and to reduce that
> lock contention when possible.
> 
> Looking at the first change - if the mmap lock is contended, an attempted
> mmap trylock in collapse_scan_mm_slot() will result in the scan being
> aborted wherever it happens to be, and when next the mm is processed it
> starts from the beginning again.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: thp-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/3] Revert "mm/khugepaged: remove definition of struct khugepaged_mm_slot"
      https://git.kernel.org/mm/core/c/3734f01d
[2/3] mm/khugepaged: scan mm's more efficiently under mmap_lock contention
      https://git.kernel.org/mm/core/c/f4720f7b
[3/3] mm/khugepaged: release contended mmap read lock after scanning enough VMAs
      https://git.kernel.org/mm/core/c/f616e41a

-- 
Cheers,

David

