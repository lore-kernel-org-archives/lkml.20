Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9303F1061
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882697; cv=none; b=ovu+2jbjsJ+vyf12tp81ml1EgpfOTuK347thFQ6PlKogIBfPf9DMhU8QhnWgBItKuRONuv0MRx1LMans8JbQ2KOXxadvGRBp0dfrKoKyts7Z3NZaAD6JJx5us3bvC+FIi2YMrX6D9fD2glEo5ouP3SCsybwSHzV/CRy9JnFbawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882697; c=relaxed/simple;
	bh=BPpprhiLo0SJ76XrqgQv+GPuRO+NcplCZZTkbCmLnm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Buh6iZ26Xi0RnVH2ztAKnZwzAxM4Rf1hVa+oULNiupgcYfJ0hUjdhCVGGebtl8H+ph3sYin8v+FB5UWwCHu/bObc2wzcSsEsKc1ExbiY+IZC+abDMcg4v2A8cXzQdu4Oe6S3Rpx1tBoYUxpynNNo1sf/Ke30vkRgz4uegBJBGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey/AGnc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey/AGnc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165661F000E9;
	Fri, 28 Aug 2026 02:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787882696;
	bh=kPYhDntKUbKFR0MvZcrkWVZ13EiO9Mm3bt/51nZroU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ey/AGnc12E9eD9yjRs1EZ//iBMKvApH6ALON+TU8st804Gc/VD1RfJZMQVrPV1wmh
	 VK7Al6DXUGG6aLRCgsCPCR348LeP4oxbOjhhT/xtuBihtEItwnGqFKol4nCx0A5FcY
	 KvdtcKiOTHQpwFi2X/NS/4k6kxu0gPQ9pnZTJ7XtSFGxqng/CzmSf9nQFYiVoi5BNG
	 rHO0RBQmN9xVVp910pIoNnVUlFuQR47bL+L5gafdYycr1tluxMEg49hz8lSAnSFuU1
	 eZBHVb29n+eQY43Up8W5ZxA6+YGCqQO08rRvFpg7LoZ/qPvo89PfeZk935ob99/HnH
	 XwtoOUI21OIfA==
From: SJ Park <sj@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove unused anon_vma_trylock_write()
Date: Thu, 27 Aug 2026 19:04:48 -0700
Message-ID: <20260828020448.121914-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827071845.17636-1-hao.li@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 15:18:06 +0800 Hao Li <hao.li@linux.dev> wrote:

> The last user of anon_vma_trylock_write() was removed by cc22b9978509,
> leaving the helper unused. Remove it.

Nice catch.

> 
> Signed-off-by: Hao Li <hao.li@linux.dev>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
