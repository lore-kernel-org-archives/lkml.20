Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8941CB47
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443169; cv=none; b=L2fjSG75rwekMPdnMzhkhV8bRBePOIE2FbI/txILrwHGuClm/CFaWeeisObly6CPTjqM6ib3AeQO8nHEjns9sScF059y7pNZ+np+7Rrjn7OSw80JPHg+QwYs+NDWDJcjjeysLNHu/MBYelpj0uZRIxYiK+AcUSfZv9xkXQTze90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443169; c=relaxed/simple;
	bh=DdMzJC7f82TYBCh5nHufnkJ1wDEh4gcxjxAYgcfkf24=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m8q7gOCzn8fdANsyNaaOjCTsgJyXj3GJcPrz+FRLKwEGoaYRBfHEnTvU2DEllzSOyFfsBhFFfMHdFDgepSxnObaHJwGE3liKrQkhK9u6hBjv1kZcyg1ZZnvgInjkUMVWYv9tR/a2+p2Gok9RQbpoFQ3NdQI3p1nnWW9hAlQ5o6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KN3s6g5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KN3s6g5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659241F000FF;
	Tue, 15 Sep 2026 03:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789443159;
	bh=DJtcw4lxYMd8BUGvL3QH2Kt7L1pNOwjIdoeAGicFQhc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KN3s6g5UDIFToTuKC/4IKEROBfIZbHDioOFVA642QfWaU1gexfPME6VKQ1glqN9fR
	 xO5508ebHeJkD4uc/AZHTb9TN5Lw+qX1lN2TYymv9X8m/h02fIJUMv00BjZTQDCzGx
	 NBEmYzVvUWyfNrzjcJ4TzKIT1f7NC2p/6dR3cLjU=
Date: Mon, 14 Sep 2026 20:32:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david@kernel.org, chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org,
 ziy@nvidia.com, linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan
 He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 alex@ghiti.fr, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, Liam R.
 Howlett <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil Babka
 <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org,
 nphamcs@gmail.com, shikemeng@huaweicloud.com, yosry@kernel.org,
 qi.zheng@linux.dev, luizcap@redhat.com, kernel-team@meta.com
Subject: Re: [RESEND v7 00/29] mm: PMD-level swap entries for anonymous THPs
Message-Id: <20260914203237.7cdfcd4c320470f4ae5cafd2@linux-foundation.org>
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 05:27:50 -0700 Usama Arif <usama.arif@linux.dev> wrote:

> When reclaim swaps out a PMD-mapped anonymous THP today, the PMD is
> split into HPAGE_PMD_NR PTE-level swap entries via TTU_SPLIT_HUGE_PMD
> before unmap.  This series introduces a PMD-level swap entry so the
> huge mapping can survive the swap round-trip and do_huge_pmd_swap_page()
> can restore the PMD mapping directly on swap-in, without waiting for
> khugepaged to collapse the range later.

Thanks.  I'd describe this as an inevitable step along our thp journey.
Has to be done sometime.

I'll await more review, especially of the core parts: pmd swap fault
handler (#27) and swapout producer (#28).

And it's a 29-patch performance optimization without any performance
testing results ;)  Is efficacy testing in the works?

