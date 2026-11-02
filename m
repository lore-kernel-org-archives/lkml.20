Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614751;
	b=j5WyteH0yIZrx+kftYZTYUiYu/ntNs5OTPbaCBQxqwCnFhQz49UOrG4fQzVlrjHxSIlx
	 8rfrTy7uVERi3+6aq6ndDHWZV1uwXQFVsnaqvzUvz0mPbOdGdR94rF5Py8wU1U1SdeKqU
	 klVA2Eden2U5w76RcGEI/SnhKBNqARIy9371L2VZeX9oZeOMGgzhfLi050UwiUUSyjyvS
	 zTrZ79gTe+jj0c/ClnTWLh64ayxzEIgXgBeUT9mIAAJw+2ZoR8cWCa6k7pozq6izIJ+9e
	 v452HYg96KcvBwf0kcFa/fk0y//Ooa1w+JEmmxgraNdC31MwY3sPWAH7qcl89FpNEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614751;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=aADuHu477sQH4Tu++GJajWCrL5Sk3CdsR++jz6SNP+4=;
	b=w1X5vAuJWBxWDae/XUHTPFKZO/yDXfXNF7oBd2NYDqfYnlreH2jrJyrRsjWRBTuZmQAD
	 dNYz+K7CkFSXt+tooYdkQokJ7hd1LE+GxCSgYwrkKJU5mc1poaPRu3IC6WTHhw9AVXl6j
	 z4UcH5Fay07qI24TWAgf6CjiGBhOhJuHFA97UX3/EJ3hQS4dwK7iKWxHaV1P8+8Xon2jU
	 JDeWUr5KR+Ybr46J0Y3AhR91WR7M+qWYHQBHa1WHn3bQ5Ro2SGa7psk5ZsyxgC7J19Ewh
	 hpfdAYTrENgzqgMYy8zzJaQVQJozdQjABoFri40ytrSDU/FRaFw+5FTXgulyuAZfiag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTpt5q+D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654B60A263C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTpt5q+D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2971F00A29;
	Mon,  2 Nov 2026 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614751;
	bh=aADuHu477sQH4Tu++GJajWCrL5Sk3CdsR++jz6SNP+4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XTpt5q+D844aIjL3UOk1tzbOum+O9MzTqJm44IaHp2JQE4Ib82zFbyCcDBJHifd8x
	 LDyPpLoGm3vwj3lWd+XuARf4Lj+I5jCImzwUOd0OAbp1xII1XN44sRyuUW2VMG8qL9
	 cmtGSP3dz4saGLGA6gnRp6emsy5f9CWWZXIQcmJxMeFckfIf0VO2NF6HgfzLbQHfa6
	 GTUBjnJUhRDcxmrXGPek1DRRGxMMsHElci5cItc9Xqy7jM+GGKNUxTpxaWomNk4umZ
	 OHL2RIRfMrEbcW2syUF48PpMonIsVm+QluG1dWNafdA0cy3qwCvkMqe597xFOEE5TB
	 lObVuEZBiq8Jw==
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
Subject: Re: [PATCH v2 12/12] mm: hugetlb_vmemmap: make vmemmap PTE
 conversion folio-oriented
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-13-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-13-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471105.1337633.16877955237876084324.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:25 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
> operation, but the current interface exposes a raw address range and
> hardcodes deferred TLB flushing.  This splits the common mechanism
> across layers and couples it to the HugeTLB batching policy.
> 
> Make the folio the unit of PTE conversion and let callers select the TLB
> flush policy through the folio-oriented interface.  This keeps
> HugeTLB-specific eligibility and batching outside the common operation.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

