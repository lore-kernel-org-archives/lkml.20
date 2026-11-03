Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699468;
	b=WVkfdfDYTV3lC7ZszpZkJsYm3bAcYwBGdrE65I3GEm5rCV33pGEmq1LH1FTh3myXJFaf
	 SVhmLgkJBJCtGCDdXog7Tzu0+xtkNzfvCeApZOImpRyvzLO+WhS0CJVY/DuBJdVbeDKjA
	 yrqno+dsO+zZiZQxlZnFc0SGhRF+bj7OmgBD0QDVaYTaUC4zga1OF0T+PCuo2cK31RZZ+
	 UHHzQv80Z7tSvivtrvWdYsSZj/iXFLuQdpd8zlWFDxTeHd7RCfwgODEDXiaYMP91bf7xL
	 N9fdNW9Z/6eG+8iAe/T5i1zqjhvUnMsmRDbW81iFkdsAXqg7XJkvmxrFqXuae8LPAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699468;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=egFZ+CUkcSsEU6Plv0bPxdEnwjHAJmOsofwONArJtfE=;
	b=3klIrqQey2VH+e1XQq8aDUZWGikz27nI05tEWGqKMa62GQbjajiMNNXTA/WQFmLFTQ3f
	 71Ik8KDYwT0C9JUEpLUwZCifA7eaWo3GKuvRPUSBtTRhqHYm9hg9ifydNu3ZbcgDmeN6e
	 vEC2JY6u2kiXd2uiMx2AFeFspLfyyzW9sO2rtc+8I2tdhvqzOqbKBLXyY21Pfc9pZLg8m
	 cgqUAKuUMQVzUPhCu3f3xEd6WFEJrZnjVo0+VqTjTtR2fBHJ6YdvkYcH6iB2GMcKALoAx
	 eGFFsp3KJpRMBsuzSaWFHSIBw2mqSFJRk3PGBMMUxnC7eAqRdguggx9rs5dW8avWVcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0Si+w7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F71E606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0Si+w7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE14B1F00A1C;
	Tue,  3 Nov 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699468;
	bh=egFZ+CUkcSsEU6Plv0bPxdEnwjHAJmOsofwONArJtfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0Si+w7qQU48iOAROrEodVnySMaj/guHd6/W88us2r8ZRAO4Q+C+7sLJAf1kJxt5y
	 qSP05yf4pmmUWy8Ibd9AWYba6LMGF7yDFZN7Nw9nPw+nFGbCfXWeySAEYrBu47wxlO
	 W4UZNyHQTv0CyBbjpdSIhjhBTy/VKq1s3+MUkMHgMmDaCQfcJy46MkA4AF/dmIjwMF
	 CkVCHNHHIgMCGjcxPMwonrN5yb+ba+vIVB3vcFROdXgApLvZESvRNYmt65PbrH0c+S
	 WhrDyyUA+g11fbwY4ec8gsQkxRmhoC/xywBGn0BljwHmtGHTQKAfmIm35j+PLdnxA3
	 aWrl0WBcH/w+A==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id B4B621980052;
	Tue,  3 Nov 2026 04:51:03 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Nov 2026 04:51:05 -0500
X-ME-Sender: <xms:h67pal9ZnLbWHExwOAy9SGfyqSpwEUA3NMoQdTM_tJujWsv3OVjV0w>
    <xme:h67paicDmptRKFXkjwKv0nICnqf6UGXUOBoNs43PdN6dDU75HqZ_sRU53pb4eCnHZ
    NyYG72C9VWjHhnBKO_6yXDQ_XgwcuqbqayOrtgsPfmHuMB18PoKS6SVzw>
X-ME-Received: <xmr:h67pahuB-6My-vFtxfkBuHVD9wBj-SrVnKtNnHHVEzPKySakCJ2-hDMjBUM>
X-ME-Proxy-Cause: dmFkZTEafPFpDsB+iCHvxJAO8+/K3z3CdRdJQPrpIxEVD39bmGj4/U/LJCZAd51olEmH1k
    6qE564jpNX+1TdKbvOIB6IQqoEWMe6lmfsHXz/7H5av9n07ycVm9KaqNAIFuxM/2yQ6ZQf
    2WwWRfyTOBvsJefTEHwTSIlMEprKmlBMCaMQEiOCHNx9GlqItvdGfsqrXvTSv4YwWhfjog
    Hisq+Pm0kPe9yLdILX1nzJHxDiI4HZI/f/WiRyVg1IU5TnSyC+qdCi/OaPKH/o52uYw5Pg
    NWBfdHzJ6Nj9gleMoUsWymwlxC4s3Xd8EfbSP1s94cT1TvBMvX9Px0+DW0sTMVcz6ljQEA
    bNAqnrXT9kSnldOc7GBnoXknTZI4CrGQbGLxz5gcYZTcqrYDenzWioW72YDipsFCgRr9Nc
    uHBP0n3wHEHm0xd1bC4PM449f0K6KLv76IEdnFJtRBmsT/86yFTF/k+YNA7ynRtyx7gRna
    Kdv04/M7HAJayP6d0M6sfwsmt2NxrALe4AgmeDI6puNDmrhfuTxLwDKsNAcQvOKadj7BTj
    haYfLIDqjkraFwT0ww55Xb+vCFS+FGgc4wHxE4eUt8EVIgb2JTv4LQ1XW3ZWMb1d2KhaT2
    PU8/KLA1icWuLdOTL6ghs2iL36LEgDAWlkXyHmhA1D22rcIIoeNo1PaFssdA
X-ME-Proxy: <xmx:h67par3REpkKj-iFbIx6OpMTiClv6JggmrTZ2vnL95mTjoV1WnqWTw>
    <xmx:h67pauDaZfE9CaGgf87_XUEHj4UdQQBG6yShD9rbXk1nBnYJmINEwQ>
    <xmx:h67pagcoelXpPMERwyrq_euIeL4P3SsGx8hAa2itEDWuoAW_H3ASQA>
    <xmx:h67paoxeEzN5MwZep7_7iT4Ux1UqJY_4UkUcxyapsgxs5qXS9IeIBw>
    <xmx:h67pajNnJMxSw7lfAbohqfwd3JfPbixn6e8WbpqRLjWogVqlRQ-CqeHQ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:51:02 -0500 (EST)
Date: Tue, 3 Nov 2026 09:51:01 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yeoreum.yun@arm.com, ziy@nvidia.com
Subject: Re: [PATCH v2] selftests/mm: handle child status safely in khugepaged
Message-ID: <aumtBg9KOgrY9MIe@thinkstation>
References: <auhvkuDO8cP9Pip4@thinkstation>
 <20261102185130.30504-1-ampr.mhd@gmail.com>
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
In-Reply-To: <20261102185130.30504-1-ampr.mhd@gmail.com>

On Mon, Nov 02, 2026 at 10:21:30PM +0330, Muhammad Mahdi Amirpour wrote:
> collapse_fork(), collapse_fork_compound() and
> collapse_max_ptes_shared() take the child result from
> WEXITSTATUS() without checking WIFEXITED(). For a child
> killed by a signal WEXITSTATUS() is 0, which is KSFT_PASS:
> the parent runs its own checks and the test reports ok even
> though the child crashed.
> 
> Fail the test when the child did not exit normally, and print
> the signal that killed it. Also fail when fork() fails,
> instead of reading an uninitialised status.
> 
> Use get_child_status() in all four fork tests, and use
> wait_for_child() to handle fork() and waitpid() in the
> three blocking-wait tests.
> 
> Fixes: bd212a7dbdb1 ("kselftest: mm: return fail when child test result is fail in khugepaged")
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
