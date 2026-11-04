Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786692;
	b=euq1HNNzZCxIxJm37PdOr5A3xMIOVGgPHO9MmyQo8TNwAglxdN76jJtyuu/vgYjsLXvR
	 3qMfwhnQJbCaHHrBuXhvoECvFdZpCYrqBlVE5ISJSJvtvocvDvMsqQQiD4cHQBS3EeXKI
	 nDBQF8qigqAL47WLCiIsMTjACyZJ+dT0w+Dq6ivAy4is9FyTX+BiEGP0MB4z47cczysWD
	 Gv1zenzLffxICG/cGYMnsbgBPWsm2iVpC6YhkGR8h9yFrXkp+ta2LyUZzbCIuDjdZJgNQ
	 o/ENQtZB3AySBkitsjiyARk5ZG7PeL9bEL7eIspno/CbB3HiaH1jVw/DB5yq3yh5Ltw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786692;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P2KjKjh/TdBjCqqnAgRGDOggqlOjddLap+BafnZlf3I=;
	b=jN4PzeUW7JjwwmJaO3CNDdidfCi5GVFrMDWFU8+JNWO0FSQDHYfN2chIDQQyEENgJho9
	 ctAiwhxOpnhaSz+1uyXFBjJWpUezyF4onSLKR+3s22qms+12XIvIHclNv8W+awCEOedlz
	 nD6EZndVaektQ2t+P3mimwI9UnyiJrFIDuICoIwZqm4Wxl2o+zxE8IwNwmC8J0QCFh201
	 KPEYb/Ik4JbFen1vGG4BNxauHFOye0+SMmG2oqHHNd3NwRXtqSreUV3C2U/R1/qEtFnb8
	 nRI0DgsVe+nRx0L7QA7fgQEZ5qysliqDZ41RkPCDoCt1w3QjySKfM2I8+BBL7CpRseQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DS/I9zUU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D1606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DS/I9zUU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667A51F00919;
	Wed,  4 Nov 2026 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786691;
	bh=P2KjKjh/TdBjCqqnAgRGDOggqlOjddLap+BafnZlf3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DS/I9zUUp2SDaMLz5BdXJWOAv1ehgWBSJr0edZ5jQUlxXK2HpjCdf7Xsmcm2/RT5k
	 dWEqvZFpvtAqCe0Lung+MJlwqqDZAB3Ktu9y6ythH8uYKnxnPrGN+GwId5GSArZ4ov
	 NL7btkRHm0Yu3gMxms+PflHlvaADjmHj4gXN8FA4l4TgKdqvHG5BRIPJhsUjNWl30m
	 L4ylDs3JQBx5SVHs7aAgErcr+jFT6OycAuhkUcEoAqxS9PekxCgc7ImtRrKGB1CHw+
	 amCG9RgzbhFgPxF+f7RKqwOeIww/kyGG6Jn6lulbxwjbBHVwMLcOTHFWsmRG4QR4ZC
	 iKLzudqQtqj8w==
Date: Wed, 4 Nov 2026 11:04:46 +0100
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
Subject: Re: [PATCH v3 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte()
 to vmemmap_optimize_pte()
Message-ID: <ausDPuMzAyA6EylN@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-7-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-7-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:04AM +0800, Muchun Song wrote:
> Both optimization and restoration update vmemmap PTEs by remapping them,
> so "remap" does not identify the callback's role.  Use "optimize" for the
> optimization callback to match "restore" and make the two directions
> explicit and consistent.
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
