Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3795509EF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466933; cv=none; b=N7FGwbv8oYAEqNQRoVEndtksvs6rrqH19a9w62jS9s5iGBXbWnKtUA+Xv3fxtkuxLt98/8HmAdRGHmnTGdpqLaCrv6Poir/JCH1p3Inbq/Il8xpcFN6CfZFMCpOdCQzH6CCOKawHtB1wkIYxlneOBASgD2TJ+424vcGmyZWpQP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466933; c=relaxed/simple;
	bh=Xw/QCmGsiPhHe4vbjLjTQ/7AhKKMRSwKftYe5nN/Mo0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IXwhzRTI3PVo9s1trQ/O+CHoR6IYFEbYPf4//o3GNOid6W8rmSdP2dJ63Mwei9BO/mnhNsewzLbhxHEsJphmZi1lrBopQ92qre7UKehBNDjbgz9/LKcx+IXXjhmU6rgmB6FmAg3xpemFso3qBQhkJmtiRLdaSiK9DtslXnzb74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wCbSM/uE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wCbSM/uE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF7E1F00A3D;
	Thu,  3 Sep 2026 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788466918;
	bh=yky/f0WiCrxErR0j6vYpCOZ1PkjzKLIdBoCOJhOCRD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wCbSM/uE1oD6985EqHCqBqSnG48CDKxjN7yXXCahMDkRVLlrzMMOFyfx68wlnDvq7
	 bW6uTyvqsmNt7n9oH1y90q/o2uADoC6HmWE/UkyV80dpYgv0eQ6QmQovitbA0xVHu3
	 Tleif4F4rJHF6eL7YS2htB0nylm0rIYx973Eh0/0=
Date: Thu, 3 Sep 2026 13:21:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com,
 vivek.kasireddy@intel.com, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hongfu
 Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] mm/memfd: fix hugetlb reservation accounting in
 error paths
Message-Id: <20260903132158.a2d6f965477220838d884bae@linux-foundation.org>
In-Reply-To: <20260903030134.7407-1-hongfu.li@linux.dev>
References: <20260903030134.7407-1-hongfu.li@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 11:01:34 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> If hugetlb_add_to_page_cache() in memfd_alloc_folio() fails with
> -EEXIST, a concurrent fault has already instantiated the folio in the
> page cache, and the reservation now belongs to that folio. Calling
> hugetlb_unreserve_pages() in that case incorrectly removes the region
> backing the cached folio. A later truncate or inode eviction then passes
> a negative (chg - freed) into hugepage_subpool_put_pages(), corrupting
> subpool and resv_huge_pages accounting.

Ho hum.

I've asked so many times "what are the userspace-visible runtime
effects of this bug".  Nowadays I often just ask Gemini instead.  It
told me:


  Over time, these corrupted counters would leak huge page reservations. 
  Applications using hugetlb memfds would eventually find themselves
  unable to allocate huge pages, receiving unexpected ENOMEM errors even
  though system memory and pool capacities appeared free and healthy.

and

  The corrupted accounting caused hugepage_subpool_put_pages() to
  receive a negative value during a later file truncation or inode
  eviction.

  While this typically manifests as kernel logs (WARN traces or
  badness flags regarding subpool page counts), it could cause
  misbehaved resource tracking that impacts subsequent system
  operations, unmounts, or process teardowns interacting with that
  hugetlb file descriptor.

All of which sounds rather unpleasant, so I suggest a cc:stable here.


To help people understand why we propose a backport and to help others
understand the impact the fix will have upon their system, I'll paste
the above into the changelog.  Please send any necessary corrections.


Please also update your prompts (if using them) to ensure that the
changelogging includes this info in the future.


I'll queue it for testing and shall await maintainer review.
