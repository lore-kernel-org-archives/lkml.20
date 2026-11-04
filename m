Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799756;
	b=Ur4qRdA48efbrUiwyAoek3PrVXtcc/6RjgiUPRk8h6U0l9o3rS+2VGjDA6NxZwLjWZdD
	 lC49cTrPqCpKDx3cnfPTxbZDMRQZsC/KBr0rISUhc0PP0ymFi2ppXSneEcsrUEcitNR8n
	 qwC1QaNvqjc2R2ITp3IfJTjhPWrVh9ILEBIZUjqDuUmhCVYZQcB9x/SLUL7kCmKIL4+Fo
	 NOERPLjOnZVwh6f4gXRfLfUY52cI9QvnJdg+Jo3EQle78UvKMQmOT5HSqBr3J1PFZifrU
	 78NYi2BZmqIuVby8ntGtK3kWXmjrs6fmO02Z1NRXhlHBwcuiEBw0GXGqyry3RzDajOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799756;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Esj8EGtkHfwSQcmc9iE2KqgGId8com+XiT/w2XhO/5w=;
	b=GVAihr9Rm8q1QF0r8PLxPCJVeYtKRWYxG8NkeROQXAxmJzY8tpxdlqpFkHLrKi+jEZwR
	 G/toJuQVHX170pFhmZme0z/rbCCcVcwbxAIunU5dO8l1ZQO3dpIdOPr0tT4axtsaHKXzb
	 eOhVIHZdRT+TFPyF4W5Bh9W9Ws14T7LfkUo2qpzjHKzEU96aTiloU3ssxBKKsvTFv9Iak
	 tr3jja7znnFTIhVzeIdknkvDwiBPv2g/5DEBZ2XpbsH28q+5/3kHXHcFjXnyksT+frB75
	 MnLTVB+s2v/LOQj/DhzJCCWbm80VMePF1WlimHi/V8u61iOAlvLVS9rqROnWupiz5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBplRVlN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F499606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBplRVlN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C011F00A18;
	Wed,  4 Nov 2026 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799755;
	bh=Esj8EGtkHfwSQcmc9iE2KqgGId8com+XiT/w2XhO/5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cBplRVlNGNXLgcOgO/+NzbxXf7EoY8ccfzz17hLNIISFlErjsDDUxP0r4++GlxKZ0
	 H2LWcO/wR6CNfnZ57fCbZiuucD+u6e3qjQjdbaMMZdgYskVj6G9DOl6VWGND9+QiEL
	 pFnUzmZgJ2HhcuhmC0/n1pUCgQnPKTJARsJ+broVwfYvKznB380+kfP7vESDq/m7My
	 ryQxu1NibOQv+aePOWlK0T0z+qrAITNvbGZwOeQeJms2fAvu2yfulKwl4elPSj5A77
	 YDusCrCkH7AjPYQLm0dZU0F8U/PnKW7y/A90IQUnrKZpyk2+TbGoMMepZcTAOiDtGf
	 IcNB86vyc/ZBw==
Date: Wed, 4 Nov 2026 14:42:30 +0100
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
Subject: Re: [PATCH v3 11/12] mm: hugetlb_vmemmap: unify vmemmap range
 restoration
Message-ID: <aus2Ro4lqS3FaPPL@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-12-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-12-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:09AM +0800, Muchun Song wrote:
> Restoring an optimized folio and rolling back a partial optimization
> both restore a vmemmap range, but the operation is currently implemented
> separately in each path.
> 
> Use a single range-restoration path for both cases, making rollback an
> explicit bounded form of normal restoration.
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
