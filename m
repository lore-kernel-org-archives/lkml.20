Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA343C06F;
	Tue, 15 Sep 2026 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494856; cv=none; b=HQkuDHY+/Hqll1jVH1E3h/tcFa0MshxydTC/K2PesFSPg4nyoBCdeBewow/U+vrkKRcFAvsyk+OdefOcuhyFOmNKC5A6uBYj7scTNv0HMIPJ71ugVMZfWaV7ZKKz+RPWRVJAoRq+mi1IfHZjbljGktJPZ1dEMGrJAxIbiNMXk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494856; c=relaxed/simple;
	bh=iYyScffWSSg30jdEj10v8+V9dlkqE1/7ViOvLnLcFdY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Utkql0jmjchqRX9LlMIWSW9PeAHRRzIkHocTx/qPOkjWcw/qhcgpPU7l9wEOdnzcMiA9n0tDuiDvJ01uslYV9NZDG/PyjkLWBN+5jVnxYGuRebz0FC39OHS+6o3VrSiI1nBqtQrL5L/h7PVMkEDjbLSsRlEVXEseq4lMrODTJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MB/srOeq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MB/srOeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59E01F000FF;
	Tue, 15 Sep 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789494853;
	bh=sjEdUfw3irW1JuDcMIomQI/HBWKCyFnR8IioGtQMfKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MB/srOeq7FDFfqWuzsJFCsin55LL85uQQsPxovPYNpyKbT8GqZyl2fyi4cBZg/ZVw
	 rBFQWGtxKdGxXLd2qWKgA22f3KFrclzYDv0hEeIpc/+DCw2REzziF3YPpNMwJVPbAe
	 v8LJAMuztKdSxHebWQaXKHxdt86sdmZm7fHwocrI=
Date: Tue, 15 Sep 2026 10:54:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krishna Iyer <kiyer@crusoe.ai>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, SJ Park <sj@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm tree
Message-Id: <20260915105413.53146d2718de082bdff61706@linux-foundation.org>
In-Reply-To: <aqlI5oRGnTQDCgQu@sirena.org.uk>
References: <aqlI5oRGnTQDCgQu@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 14:32:22 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   mm/damon/vaddr.c
> 
> between commits:
> 
>   6acc47b87e9f0 ("mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()")
>   24f6b1a0ab44a ("mm/damon/vaddr: respect folio end for DAMOS_STAT")
>   f256012bb6a1c ("mm/damon/vaddr: respect folio end for DAMOS_MIGRATE_{HOT,COLD}")
>   fa5b61fcf5c9d ("mm/damon/vaddr: remove a debug message")
>   ed6700504e3f5 ("mm/damon: move damon_hugetlb_mkold() from vaddr to ops-common")
>   88ac1f509a7e6 ("mm/damon/vaddr: support prep_probes")
>   68ce5caa141c4 ("mm/damon/vaddr: support apply_probe")
>   45e6bd6ac2868 ("mm/damon/vaddr: extend apply_probes() for hugetlb")
>   4144f08e72a48 ("mm/damon/vaddr: support pgidle_unset probe filter type")
>   6a00e5447c45e ("mm/damon/vaddr: support DAMON_FILTER_TYPE_PGIDLE_SET")
>   3dabc621c0cfd ("mm/damon/core: extend probe_hits_wsum() for moving sum based calculation")
> 
> from the mm tree and commit:

hm, "mm tree" isn't a branch name.  I assume "mm-unstable" was meant.

> 
>   566380a1497eb ("mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()")
> 
> from the mm-nonmm-unstable tree.
> 

Something went wrong here.  "mm/damon/vaddr: avoid hw-driven pte
updates during damon_hugetlb_mkold()" is in mm-hotfixes-unstable. 
mm-hotfixes-unstable is merged into mm-unstable and mm-nonmm-unstable.

