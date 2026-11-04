Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811011;
	b=kqYpgKMHq011lIckRUD2E5+equn8Q3Y6ivTI5wI2UZHIPwRZeZLX+OZ9wHMFEWLPva90
	 An18RIag2dlUfbofmERA9QOR8jhcyqrSPPhdzPvqizZR6MGBSdclpcR82gYoc4YklGTo0
	 RztGT0Alw+4Vtc94W8B9S/kXqn3OTCp7s5IxaWHZ1ZM/K9/Z1RwSRafexf4nGzxtX48Lx
	 mKwZSvSWJj2UiGApjwKVnh7sMsYSGv5vyYT9PYJxiA/XUcbokVtIvqHCd5JM30mGZTD9R
	 OVRi1x2XFQfz65e6Ap6GhGI8IOtCmom3xOtL95fUzb1PT4HbaeMjxgUG9A+nEryLChA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811011;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h9wu6kihgi9yB1xWkuSesGFotgBTDc+RlqCdPr5bB/c=;
	b=CSRnkPzrhmlbKVG6Pi9NAjUJHmfHQZzrAFPjjkfushHarvNN4w5pZ/v9FbuaBOeovd+V
	 mZUFievqWQBz5Qe+BpTJ2NF1yZPyVMCbHxhpzOSeifwuFv6xIEm+W7XkeybYkRmZ0hA5g
	 N1uljyfbVlTr7nXekylq3Qel0ME2dfbpPl/aT7HXSL6BoKQuF1O2B9Qekob91oSfCI4Ph
	 /amDIkeyeI2vprC0gS/wxDxYUPAtt7y6ZBJpRrucQpwtI76dLhHYbhpIhZXXwPxCM8tMJ
	 GniKDyYh4cI/7ODvi/AUSm8uYfYUN/TQNFWi9lT6JKVuVCphu5TDwemnX+SGGIvQb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKWIpJro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21505606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKWIpJro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCD41F00A1F;
	Wed,  4 Nov 2026 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811010;
	bh=h9wu6kihgi9yB1xWkuSesGFotgBTDc+RlqCdPr5bB/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKWIpJroWZmQuSMKmkcHkS+KBMrgb1w1jTz5HKzXIOr50CEf78uf0IDuq69Df3xiG
	 McCrtoOIvk0xb6p6wbnwjGvzKd6b6pyVQf4nKgBFJap0yATUxKBBuOYv3hAxPCo9+z
	 5piNj6JnHodsMU9py/wzB+LPq7CLnzXj5WQz0Bj42hex+bec+bW9zqWjC7hrHRS2IJ
	 tlvXHJC7RxLi3+LmQyX6yRcwvcx28ds5CuCBBa4/hScO7VelF15BopQikaxNJn608s
	 0vUMHKv70OmXy28yj7eKHQK9jOI7XNRssHsj8OdrzqaI+XX28zWZTY9aH9cN7yI7GJ
	 05o1Esz3NWV3w==
Date: Wed, 4 Nov 2026 18:50:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
Message-ID: <autiPITgQl7nhFER@kernel.org>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
 <auo3PzmisfK3br1l@google.com>
 <ausVbqZd9qgZf4zc@kernel.org>
 <autM3_pSLuOGZQCh@google.com>
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
In-Reply-To: <autM3_pSLuOGZQCh@google.com>

On Wed, Nov 04, 2026 at 10:32:14AM -0500, Pasha Tatashin wrote:
> On 11-04 13:22, Mike Rapoport wrote:
> > On Tue, Nov 03, 2026 at 02:48:36PM -0500, Pasha Tatashin wrote:
> > > > @@ -852,56 +873,32 @@ static void __init kho_reserve_bootmem(void)
> > > >  	 * reserve bootmem area in low memory for lowmem allocations in the
> > > >  	 * next kernel
> > > >  	 */
> > > > -	size = bootmem_size_lowmem;
> > > > -	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
> > > > -					 ARCH_LOW_ADDRESS_LIMIT);
> > > > -	if (!addr) {
> > > > +	if (kho_reserve_bootmem_area(&i, bootmem_size_lowmem,
> > > > +				     ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE)) {
> > > >  		pr_err("Failed to reserve lowmem bootmem\n");
> > > 
> > > You are adding a helper that returns an error code and then ignoring it 
> > > at all call sites. Even though it can only return -ENOMEM right now, 
> > > dropping the return value is not good practice.
> > 
> > I don't think error code is important here.
> 
> Perhaps, but it is just not elegant to add a function that returns an 
> error, call that function from three places, and ignore that error every 
> time.

Because it's not important what the error was. 
 
> What is wrong with:
> 
> err = kho_reserve_bootmem_area(...);
> if (err) {
>         pr_err("Failed to reserve lowmem bootmem: %pe\n", ERR_PTR(err));
>         ...
> }

More churn for no value?

> -- 
> Pasha

-- 
Sincerely yours,
Mike.
