Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792801962;
	b=RjZagJ4jekMTWpqTwORYFn+0TsnKau2aN8IgOUkgpUDOe7wISvRotJkgU80tQPCaKVjJ
	 kZZg09QZR9LlzQt1zdAAZ+dIWd0otAyaFDWrwxo/RzC1mej1ItQztiJjRbqBUKxBlYoY/
	 xQ6ud9Bz6MBuS81WoAEIJW3c+SI4bwMq8mvCdysly7G4LFMObRu+HWI6kX0pEdEgnulEm
	 NittyjW8GmP29hw78tG+AxmO5P20n4/aZvC7CK1V+esaj91YM4U5butyTlepibb0jJ5Yv
	 I3gu9yHWEZfuqZveskxtgnonDf1hT4mNFSDgmRg3vm5VAFCtk1LPaPbnRorVPXGRVMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792801962;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XyvT2RE/oWa975FzIOJtY2uQYaJ6b76CZmdE3rvCcGg=;
	b=T0ypCAReKSd/7aoyoX/NrNhz+J4wxLJJgaP8VIIdWEjg9z1Gv2i5QIN0WiuAQ6dTdlqW
	 EMT7zrkA3KaaonDzVqZ/Wris4E1RqZrx2OCtnAt7x4NdXSkxLKoFK3DVUSrhGJupdx1bS
	 lDjQietNgb/K4WvytId3/DikFEHhJG+KqfuRRvhHLLd4zyYgFKzky5PPiVhnAMUiPw76v
	 ksUdZJqH/IJndvncJVkb+m5FICzdnSXckdornuwenGXphj6J0wQEY9CgTBeA6MSE9VkNj
	 AOvMUZPy5u1rv9lsE4/vHMdh8jKueUeERAMx6GjRtsVIFE+oLYvGYWpMQUkT3muteww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FxGxOuh/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B5606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FxGxOuh/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5D71F01825;
	Sat, 24 Oct 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792801961;
	bh=XyvT2RE/oWa975FzIOJtY2uQYaJ6b76CZmdE3rvCcGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FxGxOuh/qmzaizPy8znUs4Ovs8LBRfCG0WpOIEBXvPML2LdenQK9hFoIwWZ1NSmNt
	 MuJef1AXNcPkYkL3YYRD7q5xpnIfJhxgmEsrJ9GmGbpP3Z2k/yUbwKsNdf2tjkPohV
	 b1V/68EyIIlXe80UExpffL2TLPJuVj17/6j5kXRYw6LPyPjEw4ZYJOmlNsys2cfGG1
	 d6OU06zSF9WH3QUWKdMFkmYwmCtNfOdsoJ5tS+YlMlZyFhwAO3+pJubyBTJqxKRCnC
	 4QAyZ5L0SjDspHzDsmmFunBu+l/sQTW1Eat9cPBaRwCTeHMPkvZ0SQtxXcF25iQV/c
	 XS6vIg+7xTBNw==
From: SJ Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH] mm/mempolicy: remove unused mpol_is_preferred_many()
Date: Fri, 23 Oct 2026 17:32:33 -0700
Message-ID: <20261024003234.86981-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023161003.59086-1-ekffu200098@gmail.com>
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

On Sat, 24 Oct 2026 01:10:01 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> Since commit a492abe28bec ("mm: hugetlb: move mpol interpretation out of
> dequeue_hugetlb_folio_vma()"), mpol_is_preferred_many() has no callers.

Looks correct to me.

> 
> So remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
