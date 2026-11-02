Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614739;
	b=Z7OfJwlBqLVHj9Bq4AIWtQDDNCKc49ezY6v6BC4eoaZ10bmgWu0F8cjfQWgYvK0wEo3M
	 MzqBmMHZdFUvrpuWx5udS110ldqr+RJedot1cvqZHeakvMEx69JqzgpcImXCLWFHdxYAC
	 RYXXWSFFfxaUChQBjvl4eNqvCnhAybFQqrq1XpqsWQDu6hiVrxmiIpiytOLn5G27oyfg/
	 fRpFf6fPOYwcm80YrOS7cLpUaEP8rAVk09Iedlr/4VMkgny3NJBnBI8UOtGIfoSVvZLLF
	 ZCL/kgj0KkAHuzW92QjTkQw2EviWLaYsKxTKP/HoKw2JNFD6lLB4fr4kNhSVXKqhTXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614739;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=Cj9lF3Wd4061fuv6JiYbvsg11hF4xy75NweMbSIOwdY=;
	b=BPp3o8TfaZ0NicuhMN5RWdEJYFohXQg2eU9iRE1dK4D8ZZ1F5PwfXrs1u8gSkooGRx/v
	 DrRNICJBwhVJoBVqoHDQlGgdWDE8tpOjKkZb5w0ckK2vGjhYwD1HYeWm/Gt0bPqmiPI6R
	 oiWMErXTwitWCihJmZqvg9aVDlmmqwVHIrO635kY2SKHJKp29aaVZsCzUzBsO6iU77adD
	 OYaEfI983eRUuZogUCL0i570sJtXv0xTPqzEQGTDeEQmB5SApd8TVxvKaepexkMh5U3hS
	 DYE9OW5QEUJy6UXCQXRQw5LJrk16j7/wRBc9JpmuUeRnrixI+bSey88rvwkQG2o2JiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzxEgD2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF060A261F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzxEgD2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44141F00A17;
	Mon,  2 Nov 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614739;
	bh=Cj9lF3Wd4061fuv6JiYbvsg11hF4xy75NweMbSIOwdY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NzxEgD2yTHi9uikTgeQOwHwTV1Zgl58Qd6LzkGWevW8+X9X96cuCn1szfeyFTTkjk
	 koQfVbOCKNK+419WNPDlYyg759bwaa2g3oGzTTLybhKjdXq++DDirIe4KmmKYgPdqt
	 cTKgIt2Keis9vavblKoKtUn2MNa6X9IqU8k3HGWLfI4QMwAitiK338tPwnswtr/KI5
	 pQsCNionkjwelpbd1WZmUihirMZ/BqE4l4AGLDkyqAQ9+DcxPadwHr0Ahr/FeflmGm
	 3ujlw3P6olmbJOWTFVxhwB1W4MaY3AxHIGXwjuZ11vO/w7dZWRuCayWeAgcdOr929Y
	 2mYBzciBijylQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 08/12] mm: hugetlb_vmemmap: move
 alloc_vmemmap_page_list() next to its free helper
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-9-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-9-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.17802347708774525919.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> Keep alloc_vmemmap_page_list() together with
> free_vmemmap_page_list(). This also allows the folio-oriented
> optimization helper introduced in a subsequent change to reuse the
> allocator without a forward declaration.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

With the comments for patch 4 addressed

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

