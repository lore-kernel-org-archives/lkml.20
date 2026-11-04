Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797951;
	b=uKQscNCwe3Qd42Szv37J0M9i0Hv05Rk+ZGRUWmhooTNvfnlZEs6Zc+QspkOitEM5F2yX
	 B3PMonWeIvvd5Kf4ddZQma4iMBFncFGdfOcPU205NHRvNzv1rL0/ReH5SbShdCwdaD41X
	 EpPxqP6rCadkZZthJrpeCmmSlvlsoKfrBTV3iJBNsGzmhnnAm0m9h5f4nYyWcTFGZxNFN
	 Jn6jm7LdvgfajdjUF2A4XXk17dXiKxXmdxmgAsn/ujhdRjs/qvVJD64at6EZb5FiCQ1ST
	 kFQ4dceuajrA6bQ0qFZpTnk8jC6wBIiEzz3itNe8Ss6ijvVuZ7mhrKQUyEaTLHVxTVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797951;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=igfYjZBC1z7oz2tB7LOGKxebDo1zSqF72VL8oFRUUWs=;
	b=Zxlrc2pzMMmTBux0rNGd0QZpQectG6+9ruv61mTDn9zgUHVgoJRtMzWxnSHijuOhthei
	 vQlASwiCWg07H01/BJFXQXrvDrc9jqfsEyaqWGYJFvjihQgzOUDmcAbbuOq6H3ZUBKE+1
	 9PZeGieTf1CWhEfe+XoqXr5IpCU8C/hX/VQOPY4L+uBOQpZAdriJz6oOvdy7n/LcITYzW
	 wr5c9P4dR6FbX0AQb5StQHGZg/U9KO9+TM7R4XdBZCWxPUlDO6QrgYJwBla6EZEzzEeq0
	 gefAB5eCttpklG+abkC+iqTAQ6H8P9Yl+Lb/r/qi/E1oaNn/B6+7QPOdyJ7k2TDo43Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YszLrDm7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E8606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YszLrDm7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EFD1F000C1;
	Wed,  4 Nov 2026 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797951;
	bh=igfYjZBC1z7oz2tB7LOGKxebDo1zSqF72VL8oFRUUWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YszLrDm7E5X0ADtQEhQGrD8z6v6psWNerL88xMg8+OZgSubLYs+KtG+zHHUvooDMn
	 fDKL3vykaKW73ZG1MvhZXoYqBdoQN5Hyh1pkcN2rU/3ea6OrS7zJNnUTcsYV48Kd8T
	 a5iAa4my1Ew1KgtPhAnFG1sBdglz05Su+rkKtDaaXO7pXob0H/+FQYW6eYK4qi5gew
	 q070O9r7GI852zLWju7c6fFaH6Oi7jWjy/9r4/psGpCdtSjImn9MgDndpN6Tjxeikk
	 d4I6KL3r5dCjxaLbLtWxp+MuVm3jvoZveGlXI5uKgL2Ft6bnDsb3iPWPREl7JdRj9v
	 eTiX1I3yQB1xA==
Date: Wed, 4 Nov 2026 14:12:25 +0100
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
Subject: Re: [PATCH v3 10/12] mm: hugetlb_vmemmap: make vmemmap restoration
 folio-oriented
Message-ID: <ausvOSLonALVM62h@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-11-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-11-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:08AM +0800, Muchun Song wrote:
> Like optimization, vmemmap restoration operates on one folio at a time,
> but the current interface exposes a raw address range and requires the
> HugeTLB caller to prepare part of the operation.  This splits the common
> mechanism across layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap restoration and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
> eligibility and state in the caller and gives both directions of HVO
> consistent folio-level interfaces.
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
