Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783747;
	b=NTymKuZRJXXHPuQDdjGkUu4b5BEkoExjNSWVYjsFg7qT0mSXn6VBs8MVc5/qY/1z+6o+
	 8+eU+NN73UdIk0UwqjQWvx6WDTGbEC4URjqdhitUD54nnciK0UWyzQh/3G3Q3yJ6nRpT6
	 iVZeprHa6JD1pVvKXy7BkoaKfKJKKx0NSrWokD267ABYtdp5MR3PnCDCJnrDS+3mH8VNN
	 tG88m+Pte6785S6dlCrcgjSrHf1OXx8GiH9Lw9uEp9o8pQybr/QieGLuiRUAB9XfV6TrD
	 09rS0al4xQ4Uz900prG/TmfPUZiII/iqaP9PfR0VsFXVM7uUrkiN/2amER3fYlRZ3hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783747;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R6nd2a1srhpplQhjW+m8iYpRcQ9IInw/BXmwf3MtK4M=;
	b=Hbu+hrETjJM0LGtuNZeelXazeW6QAGcO67znzlqHOB4Lz19ZlmTBZ4bqTVlVPuwaU7uc
	 jqaTJbBVpyEGfZHD3BFsFgQVhPxIRTagqU3rUXmmWRtRblO6ua0IADVIomOJx+qhrI73k
	 1Z5aAunL8VLd8PY6mEeOyVmZ4c1fGY+AQzIt5MYq+72BsUPMaItQ4XR+hb4OEq5cK7g0t
	 afCGxxcuQ8Ni5lqxDVlDzU9Hhty1g6oUdDyqDWKE9XnpmMxZS5TcGQKcVHhU9E4MU8ElN
	 j0CRuwAdOYi8Et+YIWT7uL6lf5GjA/WSuRHmqhNMml775WQgjE5JJh3QjHgVV0EfmbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2+bCu0E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC301606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2+bCu0E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0953D1F00A02;
	Wed,  4 Nov 2026 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783746;
	bh=R6nd2a1srhpplQhjW+m8iYpRcQ9IInw/BXmwf3MtK4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2+bCu0E3dVreX+haMDi/ZewO8sUAUoyk9PY7Y8/kbjxsI51VBMLyQgICDlHW0uGY
	 eyXBkOGWDa0HVEf13W+vQGrBHgIDiYBRLAoxWunTWxNdQGReeR1HGocTVjWklapusa
	 CfyxA+WHtGQSp5EfsMOgglQpSDxez2Nmh5Sxgj6pdV5pR6uwi367hlmAWg40I5kszC
	 ngLrHN1uqE7AM5Vh7opmHNrBRO+VuYCk6q90B8G7D07R2hbuuj7uf4AT6NDATzX3Wy
	 LVZdGnXfqG2Kc24QxBDTveEL6EXuT+wT8pE23PzbsfShpY4Wc23c7dO3md8sTEUSOz
	 7Hmvlk6cje9Ow==
Date: Wed, 4 Nov 2026 10:15:41 +0100
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
Subject: Re: [PATCH v3 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific
 vmemmap optimization macros
Message-ID: <aur3vUvlWCTAxA4F@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-2-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-2-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:34:59AM +0800, Muchun Song wrote:
> Vmemmap optimization is no longer HugeTLB-specific, so the remaining
> HugeTLB-local reserve macros are redundant.
> 
> Replace them with the generic definitions to remove duplication and keep
> the HugeTLB vmemmap code aligned with the common optimization macros.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
