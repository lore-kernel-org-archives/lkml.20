Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504CD39CD19
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080317; cv=none; b=OFpUDs3k4v3ADTphdOGAETbAtoNI4L4yX/x82JJd9/bDYXhfoZmPGgw/gWeVYJkc5vPkpUgA8JfcXTYzjlsbIldaz8eB9Ywv8dBXn+tEPbJBJlvm3d27Y/pfulq9axV54C3ISazRpqqtr43AbJmMIyWV/WEHIjSZ+TZp/atntgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080317; c=relaxed/simple;
	bh=VFDmm85HdcrqW28rrf0KVGdJrRu48BAlvYF7+FX/nXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXCqTd+Xp0WSCxZQioBaM0PiFm3NGRPAWR5Qeb5MtvhNT+W5TTq+Jiu/Y9m8+cRZdabLCdcBP6GPpOYgJBX5NyrtkKqw2bQvGlhwd3W1QfIiFAi0w1/E6zSSFRItMKSmQNlbtWbl+ZShvuXBHhGeugffIdGSa6n1pGYBhhym1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY5Arxmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY5Arxmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CF41F000FF;
	Tue, 22 Sep 2026 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080315;
	bh=wgfbzJ9oPP9ly+/ZofI347OAniIHtGHDp63c7r9RtT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fY5ArxmcNAiTphDnL8XETO7h7c7so5WH/19YBz/+V/PjJVShyMVeAUSsML9ehwWb4
	 PyYOkN0udxEuDF7kj8k0wNJ+deK8I65tG+zisKoRb6PNH5vT8iq7SvQP6GVDcf8F+D
	 iDYHJpIxz0nqcVpZW5pSICkYuBHeUkFUGVWyCx206oW4OXhsVSyIY9TnGJ1i2t92wW
	 1dI/c3n3/QFD1q4zaBmJgZNGtzyyw9koY0FKXAb3yf07LR8iJ8j7oDkdfCQO8IAuJU
	 bZYGEYHqi9iAOYBKI9lgJq2Fa8U5StBWZXawA81BG7U/bJ6qQk0VQmqmIKqrPvG3oJ
	 NfxBE5kbHsPKg==
From: SJ Park <sj@kernel.org>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Potapenko <glider@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix typos in various comments
Date: Tue, 22 Sep 2026 05:31:49 -0700
Message-ID: <20260922123150.2763-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922031843.2857104-1-hanzhijian1991@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 11:18:43 +0800 Zhijian Han <hanzhijian1991@gmail.com> wrote:

> Fix spelling errors found by codespell in several mm source files:
[...]
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2328,7 +2328,7 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
>   * This function checks if a given region should be skipped or not for the
>   * reason.  If only the starting part of the region has previously charged,
>   * this function splits the region into two so that the second one covers the
> - * area that not charged in the previous charge widnow, and return true.  The
> + * area that not charged in the previous charge window, and return true.  The
>   * caller can see the second one on the next iteration of the region walk.
>   * Note that this means the caller should use damon_for_each_region() instead
>   * of damon_for_each_region_safe().  If damon_for_each_region_safe() is used,
> @@ -2486,7 +2486,7 @@ static void damos_walk_call_walk(struct damon_ctx *ctx, struct damon_target *t,
>   * This function is called when kdamond finished applying the action of a DAMOS
>   * scheme to all regions that eligible for the given &damos->apply_interval_us.
>   * If every scheme of @ctx including @s now finished walking for at least one
> - * &damos->apply_interval_us, this function makrs the handling of the given
> + * &damos->apply_interval_us, this function marks the handling of the given
>   * DAMOS walk request is done, so that damos_walk() can wake up and return.
>   */
>  static void damos_walk_complete(struct damon_ctx *ctx, struct damos *s)

As I replied [1] to your another patch, the above DAMON side change cannot be
accepted since the same fix is already suggested and accepted.

[1] https://lore.kernel.org/20260922064216.43053-1-sj@kernel.org


Thanks,
SJ

[...]
