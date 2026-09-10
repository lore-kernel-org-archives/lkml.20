Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72618DB35
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082654; cv=none; b=qAzjYpzSX1AtniotlYXRHONAeZNBtB6K8HVGiwuUuHpDvfZtIYPPufA0UXN+b+osy0ei1hbqZJaIGXKiaoDRCrrjBqys7x/iBVWKytvych+axy8LGf+4471Af0envlsWPLXGKnzgtuCGtoeMBNMC2p6/7LZHQfk2g4MBKv9ignM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082654; c=relaxed/simple;
	bh=BHvRZqIeR3kwdWWh9RTyR2PTwocIL6Mnu8sdCSVyHo8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Jlv9qMVO/yfgShE9ym4bIMJCPbxf2d/Xg2ZF+gqlxJsmp/M4w6Dx/zM752DSgdrsHi94BrcjQ8ZlCjBhwt9e+EGpCMylYlu+9to3oMMbYepHyngErJOhuL9lLzMiQwzeOfc9165NzNfQAB8YJVPFu1C132aUQzOzyIOtqHZ7x+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZKVlkcho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZKVlkcho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1111F000FF;
	Thu, 10 Sep 2026 23:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789082652;
	bh=28p549CSsOmgPJIFzIZAmk2dWOo7LjPPNJpI2Q0OCPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZKVlkcho0tV1KE1J0zSWwoIRXEVkCT7QdQFEPdd3bQmJJgFLSscp1f0wnihKx3Yjx
	 DuLouAg5JFHdkRyPThEwMxNAoYI5aDCdBTHwWBSft6ydFat/H4WV/KYH6aDZx95I85
	 a0DOVqkrCodo9TycG66iw+z58DPwj5AZPKqxEgKQ=
Date: Thu, 10 Sep 2026 16:24:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: James Houghton <jthoughton@google.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 liam@infradead.org, Nico Pache <nico.pache@linux.dev>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com,
 hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
Message-Id: <20260910162411.d3bd211927c10e049c6652b8@linux-foundation.org>
In-Reply-To: <20260910023411.514987-1-jthoughton@google.com>
References: <20260910023411.514987-1-jthoughton@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 02:34:10 +0000 James Houghton <jthoughton@google.com> wrote:

> Userfaultfd minor faults provides userspace with the ability to manually
> install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
> holes in the VMA when a naturally-aligned THP is present. This is not
> true for khugepaged collapse: the PTEs will be retracted, but a PMD will
> not be installed.
> 
> When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
> userspace is likely to expect UFFDIO_CONTINUE to succeed on the
> should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.
> 
> This is not inherently a problem, as MADV_COLLAPSE is an explicit
> userspace action. But, especially because MADV_COLLAPSE can be invoked
> by an external process via process_madvise(), a rogue caller could break
> a userfaultfd-minor resolver thread. If khugepaged is later updated to
> install PMDs for khugepaged collapsing, that would be a genuine problem.
> 
> Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
> faults, as MADV_COLLAPSE will only resolve such faults if a
> naturally-aligned THP is present.
> 
> The naturally-aligned THP case is the only case where this quirk exists.
> Collapsing otherwise requires all PTEs to be present for
> userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
> correct. This check is essentially bypassed for naturally-aligned THPs.
> 
> ...
>
>  - Drop cc:stable and update the changelog for the main patch.
>    khugepaged doesn't actually install PMDs, so it is impossible for the
>    kernel to silently install mappings that userspace didn't ask for.
>    Therefore this patch does not need to be backported.

Thanks for explaining that.  It helps.  My life :(

Sashiko had a stupid niggle about the selftest change and made quite
disturbing claims about the existing try_collapse_pte_mapped_thp() code:

	https://sashiko.dev/#/patchset/20260910023411.514987-1-jthoughton@google.com

I'll queue the series for test-n-review.
