Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541535;
	b=e+mRU3zCmi4tTu3Ypl7KpAchg+HMXzZPjm5mJB79Z1bNfp4UnZa3bGFE0bk+UBwxPQTO
	 abSYYMpw5fnBf9Bn2jwlE3uLRCwnv4s3L+qRKKPasfgJD+4TShF7soRL6tI/FA9fCqm7p
	 Pn1r8OSsZYAYW3VoeawZhtlYHhINI599WKRvj6TTklar1wG3uJjlw6skaThTWGtbFyYlc
	 7D4jtp+X3M99WhzXal6NYHTR1HBtMlFyGdhATvLGBGzT09iu2NieLsn1GpYZ6O0otZGa6
	 IcDZRiheAP/Yf5lm2GoO1mGVTTcelqVkXfNexGObKjZOA2PcJqc4LfAUpI3MLsJhDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541535;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cOxbniIZrsE6Og7OO2rhA2lJPg4qjRGzVzOR2aSt5t0=;
	b=bDFvIodfeADyGX7gJC2LPm6p3LEEQNkFvnq3+4TUOY0edTvoxOxaCn5I1Q+vFQ4FhvqA
	 AZxHqWpX1u/RMDIh8OH9U/IrAlaG3aR/DXCXVd5uhg8JUscOWnDuovlLGVueo7ppgObdh
	 mvqxGYCVpf0ClXdyVjMcAZEDpq8RtuljQP7IpI4psLQFp7ARvpr78XTkRLDYKuJZIxmQ8
	 FnrapcuvExYxVcdFeU2Zwvxg/WoRnPmfBO3QmHNVWE6phoflNK23sz/3lEjrvH4rc62hE
	 Z/gUfsIuy1FGUcfM91mD3kN8Gn+x1s7Eo4z7WDMht25B9ixge2Jmzp6ayDcIT9+m/Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exUnIpcg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987EE606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exUnIpcg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B731F000C9;
	Wed, 21 Oct 2026 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792541535;
	bh=cOxbniIZrsE6Og7OO2rhA2lJPg4qjRGzVzOR2aSt5t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=exUnIpcgy8YrF3HQV1sjeuWXOi/pQ7hYlvdW4SH44TO/9Wz91OVgCaRDtpuW7cwKi
	 mt83i9iLn7TQ8rlR1BqaaUJj7yj43EyTZwDbmxgRDQpRmISrS9WpeFuPXI/ArtavIH
	 dYEWmu5pMBvpj4F7yOkvbZHUI7/vn++z9ZhnmoWwI0cO+MjAIS7K9fD38UY50hMwRc
	 TZFUOGg4b3lnt4kF9YX+dTrElDQx50MnVoaEbHRUKua2GnoElNDvMrrpX6WhyUN/mm
	 fYSxU61fqAJZ0/ssxPy3emvmND4VWvlzDf67iGRMGBHy7DyV8rHZjRZo6xmvuvcmpH
	 CGcsdZUEKekMQ==
From: SJ Park <sj@kernel.org>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/shared: catch a failed posix_memalign()
Date: Tue, 20 Oct 2026 17:12:07 -0700
Message-ID: <20261021001208.93708-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020033128.1934349-1-liam@infradead.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 23:31:28 -0400 "Liam R. Howlett (Google)" <liam@infradead.org> wrote:

> posix_memalign() returns zero or a positive error number and never sets
> errno, so the checks for a negative return in kmem_cache_alloc_lru() and
> kmem_cache_alloc_bulk() is not possible.  A failed aligned allocation
> carries on with the pointer unset, into the constructor or the memset().
> 
> Test for any non-zero return.

Nice catch, makes sense to me.

> 
> Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
