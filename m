Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786563;
	b=WnzHjVELMm6dmw2FQo82KA8hPl4XjiWtuAheKN+yASRCeCABmx7x+WZ6jZtRAsZ79itv
	 lVV3WJb+JfX4P+2cXxp4UVoU9SArjdTaaXzE65dBM2M8YP5eM6+ae/MoQ3jp6SCN1O/Tw
	 d1Np+/H9lEvLVdCEVW2pU4HpvpvNsjcOw7w3s7Hj54lfnKJPJciN0TB5WYtpx3aQk5nM+
	 HHVeZ0QiAg+5zcIwVeQ5NlDVbuRH6GsPXKrlEZ1ohVEKclwj9SFwg+TCCrnNzp7FQuz8e
	 sdLdlQmF4uz1CvzFgY7c6lYQ8Tz8FkopQrYe6n05ZqbpU2og2uvgeDwwQB/y1NM16zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786563;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gsMsIdsVful1BlmTIAizWyUZ84e/BlfvPlGTZJwyYZo=;
	b=RKN97ohsWf4/22VC1LRaBA1NXpT4mX8aDh8NzoK8UxwbeAUOl5/cokW6pFFesvysVs7S
	 iuOaTSZH2k14ppuhkb7QbAV78hzLQecmq7r8U1sHQpMgFGByxroNxhNSf/ffueK2RFzTd
	 5zxjxZsx18zyQpNO3CfRGNi+gRNmVv07FHu4HMTnqSm2mWEi75XDdEAN1MRBOuPSNdQdW
	 jYOmFmqGgAN9f8JUBXbZ5UatWsExjedGpXtmQGupwc9kIoYHElRChCQWre5hSCGeLwbqp
	 Zunfys4kiKo9YdTwNATbrV1iSmo0dcQELBSpATwtGZpCpFg8q/zDurbcmSajGBSnMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/vrYRp0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/vrYRp0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5A51F000C1;
	Wed,  4 Nov 2026 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786562;
	bh=gsMsIdsVful1BlmTIAizWyUZ84e/BlfvPlGTZJwyYZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V/vrYRp0MYR3H+LKzmfFDqD/fLBwB3C5OIC2C/3QFYR4pkt151g8I4L2ubXnpDYzS
	 jqlDUYgty+BebpKbd4uwaqVdMtN9XeNXHlSCxyXz25/V7fXSiLINzTr1SJMFIq/m+2
	 n4ih3ckd26s9najTUSTzlx/TnyU32tGdT4NYbCCjQQuiXY6t41uv8EhdpjhfhJkajE
	 mnagPWy5P9KhWGo+9MlY5XxlImzi7tzMZZAywGnl2f1y5W0pYnUVHQjcvOi97Fz4xf
	 Ni6oMAQEiM+IW+mxOHWIjJyPkeS4IEFZiD8RWGIpuc53LL9E2NHKt7zOkpH8JNLwUq
	 MyqqO6i2sNlLw==
Date: Wed, 4 Nov 2026 11:02:37 +0100
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
Subject: Re: [PATCH v3 05/12] mm: hugetlb_vmemmap: unify writable vmemmap
 page preparation
Message-ID: <ausCvbbDFKFC4oIi@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-6-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-6-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:03AM +0800, Muchun Song wrote:
> Installing a writable vmemmap page requires consuming a replacement page,
> copying the current contents into it and making the copy visible before
> publishing the new mapping.  HVO currently splits this sequence between
> the page-table walker and its caller depending on the remap path.
> 
> Centralize the sequence in the walker so all writable replacements follow
> the same copy-and-publish protocol.  This keeps page preparation with the
> mapping update and removes path-specific handling from higher-level HVO
> code.
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
