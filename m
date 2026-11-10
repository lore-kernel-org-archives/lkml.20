Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311506;
	b=Cq+H0ulRn+HGovFZ8sXxgF6xSeS2lI6YzRRl3MCVZnocLrBkNKCola1DJ7pdZguQD3MX
	 O0t4ZqREQ/A3hINZypQvMfqHN684bjFlgWbM2QiFETGEvJ1Riquz3pxN2eQrAzy7bZMgz
	 ce7UTZeCKhlNnshFkZYXt/g8IocWt82rfBCDU6Cm4ZJCRnEcd1YMijv3LLj/EFmR4Xk1y
	 vhlBretzCPSH8y8CPeDSdrNNdRBdWnvhPYPOqH6YTojuP4ic0QTGKztwhGYxpMMPZ+UEF
	 +P0s4X7y2IQMFrO5+Hd4jBphK1eO3xWRiOJZo6HUSILu1nxtpgs1nVUeip7y+ev0Ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311506;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=O6X3Z9fBtxilcMGd2LjGjP2OdK0/6YVs2YfALZnX1Y4=;
	b=gQjSS7QwfNW09KrAQcuHeS4I2Go5W7Dfx0p/dtnyuJ1YDpz9GXkGZR8OcMrLDaFkkIrt
	 c5BlngDHiMmu0xar9B4VDQ/xvdjJMRw9LOERIUJPM/BnfKVH85qpRqK6r9+yz0I6+ogfa
	 f/QJCwpHk334TgdAr+zgsmr83/HWihzuZqN0mHLZU6DpDU/8gvuN4Yx6OGHW5iNd0+XXj
	 1/OkZ4XD/g0jDZRZCHGw7w7/Xd3te5e296Ifm4jDOR8wkjynTI7zLiuXe6XZPY4ZWYHWo
	 PjrCO7ThCpAryF3mffZa5hLT0QAZnUdttBctIjzgbHOfpjDEUxIfAA5P0dYRaHnkL9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oae+OodQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82002606A9BE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oae+OodQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF371F0089F;
	Tue, 10 Nov 2026 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311506;
	bh=O6X3Z9fBtxilcMGd2LjGjP2OdK0/6YVs2YfALZnX1Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oae+OodQ78mRo/uzxIlp3uK3oFdwp52ecWXJSOmm/c62ef4MUimKFBNXtSOohv7gJ
	 7cQBQu13y+Ijgpl4UpJX4dZYBQA3QxmmEUygGTvVzHunGnk4oEjGV0w8OJa9EskmKe
	 6UIWD73lnNe9RAsFl9T3k+3G0Ieajp+GtzFfa/4f6ljg9oJxqcArHpC9rDL3qnvhtm
	 6TC0eVHmZ/HvD/5ruz0+S01wKOwrpb9McGIUsVjVTkus4D4oPprh0Mc1nuri07smtB
	 2kOQULzo4VTmgO1t4AHUN6ryMYO41DUj6dqEprjJ/Fkor+qX6s9Dk5jxC5Hexp7enl
	 SEK+cjTRPm2nQ==
Message-ID: <895188b0-b79b-49c0-aba8-c04cb3292e10@kernel.org>
Date: Tue, 10 Nov 2026 12:51:40 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SECURITY] mm: split file arm of unmap_folio() drops RWP PTE
 state
To: n3rd <18670333770@163.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ziy@nvidia.com" <ziy@nvidia.com>, "ljs@kernel.org" <ljs@kernel.org>,
 "kas@kernel.org" <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "security@kernel.org" <security@kernel.org>
References: <3f250fc2.bbe22.1a1c5441381.Coremail.18670333770@163.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <3f250fc2.bbe22.1a1c5441381.Coremail.18670333770@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 12:42, n3rd wrote:
> 
> Hello,
> 
> I am reporting a security bug in the Linux kernel.
> 
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline, built and tested as 7.3.0-rc7) is affected and was
> reproduced on two fresh boots. v7.3-rc6 carries the same code and is affected as
> well. v7.2.9 does not have the RWP feature at all, because UFFDIO_RWPROTECT,
> UFFD_FEATURE_RWP and VM_UFFD_RWP were added in v7.3, so it is not affected.
> Triggering additionally requires CONFIG_TRANSPARENT_HUGEPAGE for the PTE mapped
> shmem big folio and CONFIG_USERFAULTFD_RWP. There is no upstream fix as of v7.3-
> rc7 and no CVE has been assigned.

Please don't indicate uffd problems where we lose a pte bit as a security
problem. It's not.

-- 
Cheers,

David
