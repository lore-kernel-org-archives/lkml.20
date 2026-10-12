Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11310367B8E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813171; cv=none; b=Fz0WoE9KP4F0yWnPneaI6vaLb2Y7TAaNwJGZBh/S7Go6Inb9fdEZdl38kk2fAMI75JomWhn4I9rnzdyRt+/539yDLaM9+2DD38SDuJYUJRqPbSsUgSTER8qDWs/wfG5IkcSsn75TmYWPjWSAp4eJAkzqciM/nzp8I0ccfSR7Jt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813171; c=relaxed/simple;
	bh=VgZk/BFiBv6LU801ysM8erBrAAKc5EKBKXCMP/m+4no=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V0UOqrVVG2A2hnvzyEoJST8Ahg/BJLqDUw48wfL3JPvvg4g6rJYSric2PrJqyqC88h2cF2tW/vFcOizhelioXWya6wXXfqvWysSTAzPQ+jinNBkwmtbDXGGtXzOKU+AOr/AUX1+OfJ5FmWwfjyVd2fAsmoU4EYGK9EDnvBrHbmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4D7CJZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4D7CJZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4261F0089B;
	Mon, 12 Oct 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791813169;
	bh=F9zvoH+Az/uKJAB5P1uYqjIh12NKolhbo6fDlfYMw64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=h4D7CJZiCRGU+lPZNmqJvvEAhNSYLhq9GPvvpK7JAaEosOCbCqrc/e1vDiTCifuwv
	 GIaKs3DvMIyAGi/IX56wBYQLO8TqaOUHt5GiIKt28T+cezs8pyCeCRM/lKscYihELm
	 7dEcJMPE8V7cmMDkzLUzQV7zjTJYClCewLD1RpnBVm7glxBNyO1E4c7NPWINcLXiZd
	 lKSsnoozEOoy9p6OkGhHgTMNtbCaOnzR2zxcIbHptpod3PyPWB5Q7aFmeS8Cp81Gmk
	 h0BHrs+VLm1tvYXY+jntzjQn5CDroi9CdjHAiZWwYUdRe+HHYeja44ClQWRIaimzM/
	 l+5eIWxHtiXYg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  George Guo <guodongtai@kylinos.cn>,  Pasha
 Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH] kho: fix global scratch size calculation
In-Reply-To: <asC3-4WNiTF3n7l1@kernel.org> (Mike Rapoport's message of "Sat, 3
	Oct 2026 10:08:27 +0200")
References: <20260922131217.698809-1-sourabhjain@linux.ibm.com>
	<asC3-4WNiTF3n7l1@kernel.org>
Date: Mon, 12 Oct 2026 15:52:46 +0200
Message-ID: <2vxzo6czjaa9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Oct 03 2026, Mike Rapoport wrote:

> On Tue, Sep 22, 2026 at 06:42:16PM +0530, Sourabh Jain wrote:
>> KHO calculates the global scratch size based on memblock-reserved kernel
>> memory. It passes NUMA_NO_NODE to memblock_reserved_kern_size() for
>> this calculation.
>> 
>> When memblock_reserved_kern_size() is called with NUMA_NO_NODE, it
>> counts both:
>> 
>> - memory reserved for a specific NUMA node
>> - memory reserved with NUMA_NO_NODE
>> 
>> KHO needs to distinguish between these two types of reservations.
>> When calculating the size of global scratch memory, KHO only needs to
>> account for reservations made with NUMA_NO_NODE. Reservations made for
>> a specific NUMA node must not be included in the global scratch size.
>> 
>> Add memblock_reserved_size_nid() to calculate reserved memory for a
>> given reservation type and NUMA node. When NUMA_NO_NODE is passed, it
>> counts only memory reserved with NUMA_NO_NODE.
>> 
>> Use the new API for lowmem, global, and per-node KHO scratch size
>> calculations. For lowmem and global scratch, count only memory
>> reservations that were made with NUMA_NO_NODE. For per-node scratch,
>> count only memory reservations that were made with the corresponding
>> NUMA node ID.
>> 
>> Remove memblock_reserved_hugetlb_size() since it has the same
>> implementation as the new API and differs only in the memblock
>> reservation flag being checked. The new API handles both kernel and
>> HugeTLB reservations through its reservation type argument.
>> 
>> Define the new helper as a static function in the KHO implementation,
>> since it is only used by KHO and has no users outside
>> kernel/liveupdate/kexec_handover.c.
>
> I looked again and this feels like a band-aid to me.
>
> I think we need to step back and rethink the order of the
> scratch/kho-bootmem sizing and consider how NUMA and lowmem are involved
> there.

Could you elaborate? How else would you calculate the sizes?

To me, the idea sounds fine (although I also share your comments on the
code style). This is what the global scratch size should have been doing
from the get-go. Today it over-allocates by counting both global
allocations and _all_ per-node allocations.

There is a separate problem with CONFIG_NUMA=n, but for that I think we
should just have a different allocation path where we only do lowmem and
global scratch.

>  
>> On powerpc, the difference can be seen in the scratch_len values
>> reported by:
>> 
>> cat /sys/kernel/debug/kho/out/scratch_len
>> 
>> Before this change, the global scratch allocation was 0x12000000
>> (288 MB):
>> 
>> 0x1000000   (16 MB)
>> 0x12000000  (288 MB)  <- global allocation
>> 0x5000000   (80 MB)
>> 
>> After this change, the global scratch allocation is 0xd000000
>> (208 MB):
>> 
>> 0x1000000   (16 MB)
>> 0xd000000   (208 MB)  <- global allocation
>> 0x5000000   (80 MB)
>> 
>> The 80 MB difference is the per-node reservation that was previously
>> being included in the global allocation.
>> 
>> The same issue also affects lowmem scratch memory, but its impact is
>> limited because the lowmem scratch memory calculation is restricted to
>> the first 4G of memory. The changes also cover the lowmem scratch
>> memory case.
>> 
>> Cc: Alexander Graf <graf@amazon.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: George Guo <guodongtai@kylinos.cn>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Cc: Pratyush Yadav <pratyush@kernel.org>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
[...]

-- 
Regards,
Pratyush Yadav
