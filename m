Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274619;
	b=1fUY/pFpwSeRm676iIC8xz5nRZ1WJgqTYozZOyO03IVuBhM0SXoXVGQSoPCKvPapX85d
	 fBzpWO2xdhevIgHL4wirDNpY5yV5HSQ42otRis8/nj/lZ6eb2NdGiCxrrsLeVMxCsiMxG
	 /acIXAZz/9t54YUkiY2JddP427pP54Q9MiXVlVEauslLObOxKT578w4G/jDugiAe6X3yE
	 0p0Q8Y2eRJmEHTFxEyjWUUZsLU5q5Eu7f0lp8Nx+x09KE5SQtTccqRZuDIa3r87gBKX/j
	 KxIC0Aeo3dXxtzpq+XpPf8Zd5QccKYdtRhrC1UIsTpRxHydCUc9p7kzO1sq5xmqWGew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274619;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FQbRhh+GNMjRVzFPOt1jBxmudTlDGq1Egh6Ph41W0P0=;
	b=X4sR6pKWQhMQDQxS+hj0nN6ahZkbzBkRLDGpFsmsAR8Y0XSKlLEcod1T63XSpvZq4vXe
	 pMk/AQXm8vOEAC+WxqABnRH38z6xkKiHqnRR8h3MP8f+x0FvRuwMy4EwHCo5/P5XBR3DF
	 y6pdvtFi+CuAyzbOsongoAQ062TGy2V2EyXIeSZQHmmv3hszfgRLO9XRWKODeSiUBgj1Y
	 wPFgPqCG4igLReMKhl19mHWYHh09xXkxuF6u9Tg+xXg2VLhimcKG3lsDZpbn6rMHegsgY
	 nKajIzWqT5+qN3lm4VJ3DWdxcPbqLjoIjpzGBOwbuEwC2nzYsCnklR/KrO6lbrwSYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdgWz5xe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454660A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdgWz5xe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39361F0089F;
	Tue, 10 Nov 2026 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794274618;
	bh=FQbRhh+GNMjRVzFPOt1jBxmudTlDGq1Egh6Ph41W0P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IdgWz5xedYv0YMzMAFuy66/+S83z3FE0Dopuxd0yDm+NTsqKhiKQRrT2Iyhyf9FOS
	 IQNvv6LvKWjp2fVyXYh9WxeZfa9QhpqPgbi5CPDJAhxHlxjnIlaTAVBdz9kWULYzLh
	 1FpcFNA1E7gtETP3GwlG0xXNu6Voow6ibUrA6QH513mn561bxqdioIewr9F95134FL
	 xMGi6uvfZAf7MOiKcgDmkRG+IeFWoLMcnjzBF7ufW4KlGxHI6S13L/ub/aPm97JKjj
	 DOtbFFahPUAY2FGgEZTZNMVc9T+ftiPr7HzihEJ/Dg/ANInaKFINuNL38/RsZGc74O
	 eKn0ygDXQ0x1g==
From: SJ Park <sj@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhen Ni <zhen.ni@easystack.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] tools/mm: add page_owner_filter to .gitignore
Date: Mon,  9 Nov 2026 17:36:50 -0800
Message-ID: <20261110013651.107001-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109110139.216653-1-sarthak.sharma@arm.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sarthak,


I found you forgot Cc-ing below people who are recommended by
get_maintainer.pl.  I Cc-ed them.

- David Hildenbrand <david@kernel.org>
- Lorenzo Stoakes <ljs@kernel.org>
- "Liam R. Howlett" <liam@infradead.org>
- Vlastimil Babka <vbabka@kernel.org>
- Mike Rapoport <rppt@kernel.org>
- Suren Baghdasaryan <surenb@google.com>
- Michal Hocko <mhocko@suse.com>

On Mon,  9 Nov 2026 16:31:39 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> Add the missing page_owner_filter to .gitignore in
> tools/mm.

Makes sense to me.

> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
