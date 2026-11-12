Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480925;
	b=LFmAEQRcMX5JPHpjclBf1wzHgADzPGWFf5Wsh+HkeFKTTJIDWJEF8PjaPSpPWuC1G15k
	 ni0DInq3y8LCe93yFYzorfrIjTptioUStAzRaRXONqR0fejf8XlbxBYEin4gRgeTfenpe
	 RPQbIUvK8dpYbBUtEyAaeJpceUMHiUmMBTbBkvJ4M6wqsKnmcyMv1KA42c0jczU8r4Y0Q
	 M/zSkaRf/vN0Cgjux3YJe+j5sSGorSxg8o3rfdp2YHyWtNeZQwFOct7TRIsYYjAbjGS/l
	 aNhTPPCgF+6tkqHg65G/vixS3Blh5ejSqxO21DPfT2dtMpMiJQWRztmMPyvsjleSGVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480925;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MmheJU6Q1TfEreGKF6QGCIAOg0LXxZZYNAd2NqNTzw8=;
	b=mnbVWhTX7BZtOpFkYZsUAIpqVW8XPA9MBwU7f5CckpZM+6a2ETAx3vnSd0g61pwUuDc+
	 4NINeHg5/0gAZKcdPFkKM72eQIBPVRN1vs4n+qKR/j0vP8zNnSJMy7eyTZF1zQFBiYlLA
	 IcRJerlmiiFOnLyEHuDJTqnUpAcf1xpooiUKFNq0PClsW4WXo6SLK5t+wtxKUFCnMszLi
	 1ubRLpedZstqsUew4MjAjzrGl3iGKcTHL+V0185eVyzwAvfa0hFW3zyOYea5bN4RJXgyu
	 rIEZ7ra/MfIU3GzZvauz6KI8V8HDYfzq22/tva2/qpcslgNbwwQ7uawghPEqkmK3UtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWaWETBU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWaWETBU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1901F00A06;
	Thu, 12 Nov 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480925;
	bh=MmheJU6Q1TfEreGKF6QGCIAOg0LXxZZYNAd2NqNTzw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aWaWETBULe5lqRTShuLTEzxp415DFCyuF3dsXHtF7yFzc+Kn7Id2TOuqeaO+Kxte4
	 rtkTWAvtps0ZdvaexqhiAowoW7uZyrxVkJWTu0jm2q71E7PWh08gg8bta4z4bfG/rA
	 qMXA1ioROTPQqukYSGYwDi6EN0NVMgNlhixe5lPvnp5fnySScGOD1hM6uMWB0Bk3ap
	 6sDxoW73DjdzfoLweO7EzI3FgS+CxndvzAAuefvS1R7DIs8vHgAjRLNEhGKtFfBbte
	 GX4cRddlvQwbxvfj14H72gFiI5aaQyLSM5RonsFF/xsHQb6t03J6/WJHDe1DRobYUV
	 +ySQ4q1HP1uog==
Date: Thu, 12 Nov 2026 10:55:19 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <avWbD-FfFJbFOuQB@gremlin>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
 <20261110-khugepaged-latency-fix-v3-3-6eea743cf9a3@kernel.org>
 <avNrPKIoZ3JHiAjh@gremlin>
 <a1ee8e44-5a3b-4bef-aeff-eb19d354f767@kernel.org>
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
In-Reply-To: <a1ee8e44-5a3b-4bef-aeff-eb19d354f767@kernel.org>

On Thu, Nov 12, 2026 at 10:26:46AM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 20:09, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Nov 10, 2026 at 05:19:13PM +0000, Lorenzo Stoakes (ARM) wrote:
> >> khugepaged walks an mm's VMAs under the mmap read lock in
> >> collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
> >> them if encountered.
> >>
> >> It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
> >> when these are encountered, however only checking this budget once an
> >> eligible PMD-spanning VMA is encountered.
> >>
> >> It can therefore hold the mmap read lock for a long time if there are a
> >> large number of ineligible VMAs present in an mm, over which time no mmap
> >> write locks (and thus no VMA write locks) can be acquired.
> >>
> >> Address this by checking whether the mmap lock is contended after 1-10
> >> ms (depending on CONFIG_HZ), i.e. the granularity of jiffies. This is a
> >> long time for a lock to be held, so is a reasonable compromise for
> >> determining when best to do this.
> >
> > Oops I left this in from the previous approach :)
> >
> > Replace with:
> >
> > 	Address this by checking whether the mmap lock is contended after 1024
> > 	VMAs scanned. This was measured to take around ~100 us on a fast
> > 	machine, and given VMA eligibility checking is a light operation, it is
> > 	likely this will remain at the same order of magnitude for slower
> > 	machines.
> >
> > 	This therefore establishes a reasonable upper bound on how long a
> > 	contended mmap lock is held.
> >
> > Thanks! :)
>
> Fixing it up as I am applying :)

Cheers!

--
Cheers, Lorenzo
