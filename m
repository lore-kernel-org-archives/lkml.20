Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B942576E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187106; cv=none; b=DXCr9p8IfgjkVL3hCy36aJ8njHOz1Zy0zHCcdVszBePQqBwpuoCfP+Aa+lQ5oLlrhpsaZcjBEanJ/nIWbWCPMhaqdRpuOGMC8Nk4zvxBC/hmeZXo35iGGVohyj96PZjB357CRHGPtUuxLeSAPqeDp60ZY9KHU32Rvm0kI3lWjHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187106; c=relaxed/simple;
	bh=SmvdaJdHjccHn3fm6k8hW5KRkIkJM+J+coardOZYz2s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=St9EnjalyEVEY0u2TqmulsHR4Ylkkem+6aemtEwipI/P7nA3x2uB7grMeXv4PKeuuDjrNLd2uFt7NHG8pBtgO0AfscbWvJFnf4po0eafSIqMUS9O8kw87MnT5jlybokTfYyyPrEtDetRu1C1wZj62o4JG9YW2oKVHeeTm8BxYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BwBMXooH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BwBMXooH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86D01F000FF;
	Sat, 12 Sep 2026 04:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789187104;
	bh=WD2psr2yzjyCJK4w/2X5moNA7VDH939yz28Da2OB/Wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BwBMXooHh/FNWX+eVvSFWRbzYe6GxMeInSjLfY6+Uh9LrW8QyR6o6r0+nH+La9maz
	 b4H+drJ6+Gacit9buekB7BqVmjK0WJWa7BwKTcv7DOFGdtVXy8KSOZdZNjfMHdgOMB
	 jgsKImFGNu+YneeknvNigWDwqdNFh/vSUHU/NFhc=
Date: Fri, 11 Sep 2026 21:25:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org,
 jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 ying.huang@linux.alibaba.com, apopple@nvidia.com, peterx@redhat.com,
 jgg@ziepe.ca, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/2] mm: stop calling pmd_folio() on special PMDs
Message-Id: <20260911212503.bcf8461db17ebbf51233826a@linux-foundation.org>
In-Reply-To: <20260912034833.2952750-1-gourry@gourry.net>
References: <20260912034833.2952750-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 23:48:31 -0400 Gregory Price <gourry@gourry.net> wrote:

> Reproducer
> ==========
> 
> No hardware needed.  An out of tree module stands in for the drivers above:
> three misc devices, each with a ->huge_fault calling vmf_insert_pfn_pmd(),
> plus VM_HUGEPAGE so the fault path takes the PMD branch.

I take it there's no known way of triggering this in current mainline?
