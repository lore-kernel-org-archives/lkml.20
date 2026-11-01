Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563373;
	b=4gkhVLadIlPvvBQY0QKqhjB/0+mh7ALrYSQ/0SFDmGabSZTqW/oS2zP/oCZu3hvDXHzt
	 K5vpKi7tGy9RanTDZzZtYShNfLSocCyNmejz1QUhO7vwwlcmXSMBcxfT4rPs2eWeQoyNp
	 ptFMVUqN/mSRcaXA25oUfyGmU+Rd0uau7xvCyUWpDhQcGqkZhTyuGOJCuAbR0Rt/0C2ov
	 UUrpNpnJoYAJ0sBl6FILiS5op0+ewB6gg8GT4fo465y8C5CDkhv8ZsaJkE9F1p3SayATy
	 NIC3Zq6wyFMLtLi3p+6W47NVIDEMpcKdhboH6c7ykRba6ysaTdXgWRzy8dcDkx+QsWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0SOJOJhsdif+go/5LJX1b5wSejdt1NsbUiyp9y70uTo=;
	b=N5TcpWObLV+tpIiiz3Q/VvbZZDNAB0NhpBRsM0GB6kY0QEk8ElFbyrD8iSlEHWxPW24Q
	 gTwAB+3aQerlWiYIzIKQBTyUpwVkJzukfcMo3jeiXjir4aBtbCJVpt5GoSsMVXKuFl3jZ
	 pLJQrnz88r4ZGLT+rhDDXJj2cbNGCnk+pJNbs6H7Sklw4KhkUEI7Zq9gXPm0zL4ak7qIo
	 ibPrKn1ecib7xN9Yb0Ag9cQk0E9A822QpTiQT8GLBlM8iHxTa09b1TGzIL6K/BVjrMVzX
	 BDj8uQ7sHb5VI01cyRSouAbNQ7DwQk3elDvGRloo7Ovnh2m/FnAxM27P+cv97Zcb/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPNGg2UF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B4606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPNGg2UF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD5F1F00A1F;
	Sun,  1 Nov 2026 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793563372;
	bh=0SOJOJhsdif+go/5LJX1b5wSejdt1NsbUiyp9y70uTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPNGg2UFCH8oHLxBKLsk+XSbOwxF9rgh4nqmQJ4tGq+b/EXkueNSv/mUnpHe3LXTa
	 vVluDdes8rduQB1kHH0qnPxYIyTpIdeNMxc8d3/hE32sD/nAC42CBB2NZjzjwaoFKq
	 VSfWDWS4ofbNNxRwkpWxOicfIWhXrFR5GTU++pvsJt1mFFhIjNQMHzbTibJdmUZwEl
	 shnLe4dYc7bBcVf24pjhWeZ+yUtZLJ3rqG60ptgsmN8Uot0ZF7l/u6/9+ih0PTdWtU
	 cK/6PBKoyC0PY6UDnhR/dmnnBtE45aSMdmbZobi90DRIuD7AmkyMtioQdRZsBRVIOO
	 QgUz6fdgRIgag==
Date: Sun, 1 Nov 2026 22:02:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: vrilutza@gmail.com
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Borislav Petkov <bp@suse.de>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] mm: Factor __pfn_valid() out of pfn_valid()
Message-ID: <auea3Sn6eOHFyM_R@kernel.org>
References: <20261101-kmsan-serie-v2-0-f97f66dc57ef@gmail.com>
 <20261101-kmsan-serie-v2-3-f97f66dc57ef@gmail.com>
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
In-Reply-To: <20261101-kmsan-serie-v2-3-f97f66dc57ef@gmail.com>

On Sun, Nov 01, 2026 at 07:04:38PM +0200, Viorel Cernateanu via B4 Relay wrote:
> From: Viorel Cernateanu <vrilutza@gmail.com>
> 
> KMSAN needs to validate a PFN during metadata lookup without entering
> instrumented code. Calling pfn_valid() also calls
> rcu_read_lock_sched(), which can enter instrumented code and recurse
> into the metadata lookup.
> 
> Extract the PFN checks into __pfn_valid(), whose caller must already
> be in an RCU-sched read-side critical section. Keep pfn_valid() as
> the wrapper that acquires and releases that protection.
> 
> This lets KMSAN reuse the existing PFN validation while providing
> the required protection without instrumented helpers.
> 
> The wrapper now also holds the RCU-sched read lock during the
> initial range checks, which previously ran before acquiring it.
> 
> Suggested-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Viorel Cernateanu <vrilutza@gmail.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/mmzone.h | 42 +++++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 17 deletions(-)

-- 
Sincerely yours,
Mike.
