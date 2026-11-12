Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493752;
	b=GeZVIHBO1vi2zIDkOqYaLdcURFhJYyC+4JMUhVsI12E3CyIxcMK/n5aXwtUmKPl1npgz
	 agAdyItCw2rpjJKfCnNB/kVOTovLYcXiboh6/7yYjhYbeWOiJ8MGy933W9UVUhmMtBK/w
	 EoqMKgsXRNkMsC1zCTOnXDvsCoUV3Ae4HxD1E7i+TcoNgHzKHyImcaLZws7PZzjSRwkhr
	 XvsYeKeESkxbST2Dk9asJohMsiyeQwVZD4Rhn9pV8z4nzL+L5pYlGVIeQ7ZvD2aP/21/U
	 c3j2d0GMR6HHpH+AAIAXXdXW6IY5TZv/4OzU3Wt5/j2hpZY67UzzoEVwREYVar93gLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493752;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sRazLDIEc7CMUp/9vgq2YR+tcffN4fGN/wRdKhy4qfE=;
	b=dCAbOXLlPeS8dtKFGuweVkTxCpWU/ERxP1fVp0abB59N7ZVvsZqxYZXZaIhAichGQDFr
	 8Mm44LW3LYsuC4dk7uX4ybpriGXS8Akh+W1UHJ/Wvdkvi22xF2eUg493c0ebQqqPPCB+k
	 cPm2/2u4AoqnRR6SeTIa+zGkGRVZM+Uqte3ia0pSWcGzA6xWbjeT6oh5oaEWVLjdCsE4o
	 YEy8pj4c1yvIk508aX1qFTtQsjtKacoV+EjBbjKzWmOPynODvXH/Iz4nzi5UEBp9Dcxy8
	 PZj2jPjUoWTUd6ifZUsHpULqdUAMQFCs9v9vgKLPUJqJ1lLGsmbpB3kuqQRKti4j22Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fby67aXm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E084E606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E084E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fby67aXm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07A61477;
	Thu, 12 Nov 2026 06:29:07 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D93B83F673;
	Thu, 12 Nov 2026 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794493750; bh=XiaNpbbvxm6cKE/zgmNwmyN9+sHlHIuKTGnW432EXr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fby67aXmxYqsYQ+cJC3GcBthEnnJJfdGSIYm40Lcu20zGsDk9qauSSN3TVDH36s+A
	 aizxncjEclC0Gap/jNtf43T4IKOjBghSsjwIFWshSDsu1J7xkfVFbrN8L9ZwyHuEn+
	 GCODgR3flC+q2PeYAw8JU5AHNQWkEmCxf053CvKo=
Date: Thu, 12 Nov 2026 14:29:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale
 TLB entries
Message-ID: <avXNMuvCNyLwk7wt@arm.com>
References: <avPxZjjdBIlM_8_g@chrisdown.name>
 <avQvk0oxEHTLFacU@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avQvk0oxEHTLFacU@localhost.localdomain>

On Wed, Nov 11, 2026 at 10:04:19AM +0100, Oscar Salvador (SUSE) wrote:
> On Tue, Nov 10, 2026 at 08:39:02PM -0800, Chris Down wrote:
> > In Meta production, we have had tasks get stuck in a fault loop while
> > using hugetlb on arm64. During my investigations I found that affected
> > tasks share a private hugetlb page.
> > 
> > Looking at the stuck task states, I found the following ordering:
> > 
> >   CPU0                                 CPU1
> >   ----                                 ----
> >   read page
> >   [read only entry cached in TLB]
> >                                        write page
> >                                        hugetlb_fault()
> >                                          hugetlb_wp()
> >                                          [reuse folio]
> >                                          set_huge_ptep_maybe_writable()
> >                                            set_huge_ptep_writable()
> >                                          [flush local TLB only]
> > 
> >   write page using stale entry
> >   hugetlb_fault()
> >     huge_ptep_set_access_flags()
> >     [entry already writable, no flush]
> >   retry write using stale entry
> >   [fault indefinitely. well, that's not ideal!]
> > 
> > The reason is that when a write fault makes a non-contiguous hugetlb
> > entry writable, it only invalidates the local TLB. However, another CPU
> > can keep the old read-only entry, so its write will fault even though
> > the page table already permits it. hugetlb_fault() then finds nothing to
> > change and leaves the stale entry in place, so the same write keeps
> > going round in circles.
> > 
> > This is particularly bad because, if the kernel is copying to user
> > memory, the retry stays inside the kernel and the task can't act on the
> > pending signal.
> > 
> > It can even remain unkillable while holding locks across the copy,
> > resulting in further failures. For example, a read into a hugetlb
> > buffer can hold the pipe mutex and block other users of the pipe until
> > the loop ends, causing cascading lockups across the machine.
> > 
> > To fix this, when a write fault finds nothing to change in a
> > non-contiguous hugetlb entry, let's invalidate the local entry.
> > 
> > Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Chris Down <chris@chrisdown.name>
> 
> This makes sense to me, and I see that commit cb1fa2e99955 ("arm64, tlbflush:
> don't TLBI broadcast if page reused in write fault") only invalidated local tlb
> for cont-hugetlb.
> Reading the changelog, I guess that was an oversight because I could not find
> the reason behind.

I think you mean non-contiguous hugetlb here? cb1fa2e99955 switched
__ptep_set_access_flags() to local invalidation, used on the
non-contiguous hugetlb path. Contiguous hugetlb updates still broadcast
through get_clear_contig_flush().

Ordinary contpte mappings also switched to local invalidation but those
go through the generic fault handler and its fix_spurious_fault()
fallback. That fallback is what the hugetlb path was missing.

-- 
Catalin
