Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785225;
	b=5bUJdCRPvgSeCKUFM5YU0UJCMHr5B/6mdi09LgUbFIyNjsV4S0h1j9HcppiK9xPQx5SE
	 UtK7fA0W9D3daD+mQCxxWwzYAZmpm6CUJVDJX6lDishmh4g8qQUp/7yiyML/FVue0Db2k
	 TvoYzaxnNEkYPNGWNtjS5b2ojzCjDKd4ftkdsoqtrnpFqncQE8hujOyQNY3vl54m4n3sq
	 pgG08xcb0ph/jSPMhubmh4gTB9PLB5r9xIjn+NWTYb2pLwpguTehiT6weEbbwcC2M6YnB
	 wA/p73KgJiWswTzSt1Dio9llR2ri6cTmBWzunERDqv9/wGQHUQaFzlR3sXCgLQ2iEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785225;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3LbmTa3BVHVnVv2Si7sxzWxDFszjGNRZ9XOev2sXbGQ=;
	b=VaGDVQwZk68f8VljefutJA79A91fyEI++lVCLFn6+jBsjJmKEIp1bLLEsb7XS/Vvf2ay
	 zwVeNhQOUIKSOJxg6GMuSSHK/utgx2jSOlBoQD4+aDALn843mkpqOhaZqebIHQw5fibE3
	 tOkRJv6OlfbXcBlEtK8v1XyOIXQfqkTmeDXTITTTEnXgV12kC9/uKvhzuZM7teLjXAlX0
	 g5nBlWZixMQsq9jcaKo/B1idQtMcP5QraJESbj8n7VHxDrqZRO2hIhJLBROIJVhUoDjIR
	 83j6edOXWfhlHYETUrq/NGgisLYJOaf/8M8GzvxN96g2diACVpyjP/ms6wlnl13M/6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHKTO2SN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B244606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHKTO2SN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B4A1F000C1;
	Wed,  4 Nov 2026 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785225;
	bh=3LbmTa3BVHVnVv2Si7sxzWxDFszjGNRZ9XOev2sXbGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UHKTO2SNGPckrCl1XoFlOzMisCwxok8mqGhz6lG0NrgZtsFW8nPQcWgjZCphendEd
	 e9/0DCryoJpHx3lZLLa1Q/rmuMzaF7+GOtZKyHamhTpAl+GbZUdxSDMes72UIP92oI
	 Q9NpIi5pYXPdLFPHc+mMnbRg4afAFCCEUXKk6GQ51MLLU+NOh2ukMKTFjw6MORQswn
	 qKMut1cKcdCieRf0vumxZgxqoJ6ZykAlYDjhEj3suMD1jlG5zxyf8PpqbvHznSM92V
	 B47NPf43vUKkwqMMkfvULdEq7dw6/ZW6DehUcPHZurnUQn/ui0DFUD6RkKILeLpDil
	 lf8Ed0ibbUeow==
Date: Wed, 4 Nov 2026 10:40:18 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page
 handling
Message-ID: <aur9ggEKK1i-MO77@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-4-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-4-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:01AM +0800, Muchun Song wrote:
> The new head page is already tracked on the vmemmap page list before
> remapping starts.  Passing it separately gives the remap walker two
> ways to refer to the same page and unnecessarily complicates its
> interface.
> 
> Use the page list as the single handoff mechanism for the head page,
> removing the redundant state from the walker.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
