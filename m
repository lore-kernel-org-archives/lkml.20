Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D323E4113;
	Mon, 14 Sep 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372107; cv=none; b=c8pYfllXzpm+5iUJw3Q+ayYFaDr5xTxnpVbcCY+ZSoG7XjyyTbb3mYeJhyWUCMAtQ99FldbEVTCtzjWhHsFXpazU2GTa1o9JZ6fyobn1xGc02uf0Fu1gsvgvvrBEwoNhbEGeQArF4MdnVLesKt3AAzvXrDKPr8FLztVHhyldNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372107; c=relaxed/simple;
	bh=4fXomTUjLLc8GcAWZXuJxuDub+KGI7QKZdS1HcaX80c=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=T4o3ZuxH9pZkS6yrrPxAN+ABll6JmcIsDHTHX3vo06Ba5rssMQ1nCRBrs9AdB/pK94yjh4w4fBuzxonGM/bhXOePVkYQWqHmkhFOjFhUA0RrNUohAUkOhF7fNODybZQNGwsEdGeD5jA/bWbXAzoEfCNhEM4JlOL41UW+8gBqRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLdtUM3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLdtUM3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9971F000FF;
	Mon, 14 Sep 2026 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372106;
	bh=KClFb1VkJGLkCtI9WH4c0jXlSTsGRG9fGPGrsgOGFto=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nLdtUM3zSn5yjHCXAQDEJt8zxWnibA6ikmvc29vVbrh8Ln3dybfNcrz11rsuUPiEH
	 5KCUQOuV4EQE90HKBkr0a/v+1VvUJVsxbcvjzjVApP+WrhsacfI9YY0VRuBkLu+Kkd
	 YgXkpu7rtKeyGbBpMQNP3XsuLaw0F4vuiQDXNJ3EwNQGpZveLv6/xNAJ/IOU19I/sb
	 2qFdKNiExZ6B71Cb1V/gYrS7EqO5zgaBEJVicA5k/tU5oGlQwEcpu0XBDijLiv9kai
	 mSqrIdhSOo41skGmUtaFAPfB32scbc46USqILXRyS8XI2lgF+Rpg/5cvUro+uG/+rf
	 0ps/oyP1ttzlw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 02/11] mm/sparse-vmemmap: factor out shared vmemmap
 tail page allocation
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260911050228.58884-3-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
 <20260911050228.58884-3-songmuchun@bytedance.com>
Date: Mon, 14 Sep 2026 10:48:14 +0300
Message-Id: <178937209456.4188640.108482640666201896.b4-review@b4>
X-Mailer: b4 0.17-dev

On Fri, 11 Sep 2026 13:02:19 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> HugeTLB and sparse-vmemmap each have their own helper to allocate the
> shared vmemmap tail page used by vmemmap optimization.
> 
> Factor that logic into a common vmemmap_shared_tail_page() helper. It
> allocates the page through vmemmap_alloc_block(), and uses cmpxchg()
> to install the per-zone shared page.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

