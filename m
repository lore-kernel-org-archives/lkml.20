Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725563;
	b=LeWKA3PUBRQAnpyUvRYAbqLjyhDeLsk11ua0e+4PezpHbznDEMHvpoLQJBSdHLvCyxti
	 qTq9nR1KMtDQ9yoOK0yNxUe89leYQMrEMJ8VrHY9Z1Tab9yv30t5uMHQk2v2tJHvZRQEL
	 eNElCWm6f2Iur6aXPnt2AycNhU/cmA9HNQpEE3i6kElamcq9uWJDXdXfADuSD/BnaBu8j
	 an4qQ2Jz2Y+JrIbpn52KLgx7kRV8BeD+LyH/q/c+4MOMGYrxxqt+U6AqGu8FpfEKIFNFw
	 7/k3mjTf7cID/ox8XtpaZXt+lS95tlBSX+32iqrvu+TP1wgYwisX6uTWmQxK9e8jl/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725563;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wxf6VcWVYeDuwwRp0i4M/JreyaoXeCjGc7I8ozu8W/I=;
	b=HwnG3HvHE3RDmeJc8EG4mVqP/bmkHWoDAhnb217uaBOlUoXKSUzjQlSbBbHJJzzT5uZC
	 39fztqhhAMFyX6S06/qGreYQQmEmbXiXky7BN9bl3cqSXxz74I38gXXQLqiK7bTXAZKPO
	 NE7IakCKY6c+Aba+RLIsvsSyWjFcCSUdS94ICMHao0JeL8ujd3n8HsHk04PShPgoEublx
	 wNJmUvY8ropWLlH/2r+ZTMxlW26h4lmYs7gbJJ+2xXjI0W+pHmgbfEJ1DByFfa1nfaezd
	 E/trhrKraZU4P0nVm5+r8doDAqCzIHf6+kox8bKidXN1A5v1Dei3a/fTwRd6jAQfx+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=czzNPX1q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E1606A339
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=czzNPX1q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6F91F01828;
	Fri, 23 Oct 2026 03:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792725562;
	bh=Wxf6VcWVYeDuwwRp0i4M/JreyaoXeCjGc7I8ozu8W/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=czzNPX1qDw0hEzblUzLG4mY4jMqGFO9wUYBLvjI7WNcg8xoSFGnXLCeVfkQh7QkFE
	 uOGV31XC1bcSaneMRWDPZHqnjb9s1DPQrZmCHJfStx1q2PC5n4raDN+/MuXI585ZfG
	 ARyGpQK5VRoKfVvMvwSwLCOt7pSbg+TIRAD/p/uU=
Date: Thu, 22 Oct 2026 20:19:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin
 <npiggin@gmail.com>, Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
Message-Id: <20261022201921.e418c25c44fd24e46405a3ba@linux-foundation.org>
In-Reply-To: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 16:35:20 -0700 "Shubhang Kaushik (Ampere)" <sh@gentwo.org> wrote:

> vm_map_ram() converts its unsigned int page count to an unsigned long
> byte size without checking for overflow.
> 
> On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
> the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
> and vmap_pages_range(), so it can allocate and map only the wrapped
> number of pages while returning success for the original larger request.
> 
> For example, with 4 KiB pages, a count of 1048577 produces a
> PAGE_SIZE byte size after wrapping, allowing a one-page mapping.
> 
> Reject page counts whose byte size cannot be represented.

Thanks,

When fixing a bug, please always fully describe the worst-case
userspace-visible runtime effects of that bug.

AI tells me:

: On 32-bit kernels an overflowing count can currently cause vm_map_ram()
: to return a non-NULL pointer to a mapping smaller than requested.  The
: patch makes such requests fail before allocating anything.
:
: However, I haven't identified a kernel caller through which
: userspace can trigger this condition. The callers I've examined
: appear to constrain the page count appropriately.
:
: So I'd describe this as hardening against invalid kernel API
: arguments rather than fixing a demonstrated userspace-visible
: failure.


Also,

: On 64-bit kernels count is an unsigned int, so the comparison against
: ULONG_MAX >> PAGE_SHIFT is always false.  Clang W=1 can warn about
: this, potentially breaking WERROR builds.
:
: Could we instead use:
:
:	if (check_mul_overflow((unsigned long)count, PAGE_SIZE, &size))
:		return NULL;


