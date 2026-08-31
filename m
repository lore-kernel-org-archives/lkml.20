Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB334DCE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166059; cv=none; b=tohOMsQt1TZYV4+O5lbJipDeEC0KI5BCuBnJiWZaBQXhAXbyCO26Mm5KHnqTS2E3SeuFKNjawheFuUEsqv0kFh1Am8mqJdg8A1X7cOrHFX96aQNnHEo4XxIHg88KpPPt5mnnHR3lk3FrmAzhfXj55XsrAlqoJCzDxYXwXwTP8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166059; c=relaxed/simple;
	bh=wbu8RT5VatC4TtVuOFTjBePWXgugb9wnJsoIyMAKsTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+0OllDetsHa2Y/toHun/AJJdL8fDg050jDoJEv4hbD5LRis8KGvdzGL+ykC7oV3tFKFUGVYiSP9HHMLyQNOHE7VT6xWIuIKIpFxKs1xAX608fkyyl83qx5lTY3+izJqFPKKvyb/gnMTzXLQqJH9/Jbf8CNKD+7GYM+AdS5nDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osW0C+zL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osW0C+zL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1121F000E9;
	Mon, 31 Aug 2026 08:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166057;
	bh=hgZaDb3jHysBqG5gB9RY2SL7OLUO+d0tIyfCa7KbGt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=osW0C+zLc5yaIb04oog/nGyF6+E90eFC8KRWcs8FLjK7CYAJaCJgtQYTdBco03hs/
	 RYz2owG58VuRKUUXweV35ci4IELrNDuY9A/3xGW1G9xLpmD8ItO0ZWuj1QWLd/phwY
	 0ZkYouih+GFY4Xi/kihvBtYNycjLJCe60AFuV1iaH2ItDmI8hzk6XVRfhqc6KXVVAX
	 43bPA2BB7VUii81IacrrzvxX3OJcp5qm/GtYNNVOmayLhRD7Z8h6kyoZcQ3rOBJPJM
	 watbr/h3vc6DxdX8t+6JPYC7wf2jRjlwBS/3B5oEVXXWLIoncJG94/atutv0ofGZ9M
	 ePKWhKdp1CW3w==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 41DE31980082;
	Mon, 31 Aug 2026 04:47:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 31 Aug 2026 04:47:35 -0400
X-ME-Sender: <xms:oj-VasIH3hqD_0nrmirlt1UyI7RSoXdG4acjCz7UYDn_DEdsUPVxpw>
    <xme:oj-Valp8yon14r5lI7GobNZVhMihyFZVf-XAg0BlidiCbsnIwNN6ON0gGzDJmkq71
    1U6w71xHz7_ffD_FmENfLA3lFKNqFIAtOop0j9EpCemumjVE2kwKbw>
X-ME-Received: <xmr:oj-Vag_7mnjrxq56rbDtStjApMTY-Kra22BSkJdP35NpVty2G40pIqFiolw>
X-ME-Proxy-Cause: dmFkZTF8AnKVRZxti1PyxKUQhgoh6fkIiLRKSDqX5+0I8QAvrjxkIUL+BQ10yr9hmtk99G
    pMpYdorUKGcR+yTaZtXLylI2S6vtx4c+chOuEgbSUZjQlPnmrZ9zCj1rF0M/Yhb12AbdNc
    BYpMQpkYUl3fVZYnEfpOD6aa73TS5tCd/nmbLMHGX4lCdQM9rLl8kA1v4wdRRCrjW+Iv8U
    MpAoosOpq/o8hsUUe67K3OOrl40WcoRYYwHbeVrayNXXWVzchIqBNGgr+6ISGiUcQ13m5N
    YaCSSLjEFub8qC9Ka1FGvDTLqHGfpp3aOXUce5CGJR8pTEpEb7ULvXQfHaLl4HgPD3AzaX
    oSUBJQbvX3eoVQE0dM0CWzCnBnKphJo3yTYs0NvARQoAtsNkrIfngil/s9r6SWIoIMS0mj
    1RmAkc7+E91fRKttvamj8f22Squa84WukcOR2snrRLHOnStRSjUvXCoU0g8yP/+/VDfwG2
    cJDXNllLwDLe139QxvJoh2nYWhloaffjY1l49Yb2dRGJf2TjxTnoV7bic0HJb6plKyg3xA
    YU596B3AAriWI39a81wNE5JoieM11LKwX5C7go3LBsdrOqopTFiNYXWQF/EZ4DBMXzUt05
    7ppsHkzY2s8/dR5kLmlKkletfSlW0IjXb5rD09wr//SvMSJ0wPohPv6gIpMA
X-ME-Proxy: <xmx:oj-Vag-q3XkirMERcMkFnT6on28mivxPArYM4sH_6O6-Spkkp5g-PA>
    <xmx:oj-Var4y3M81RqikESNXnd5XgNBApn4rSYDuo6C5FePSucGpspAJWA>
    <xmx:oj-VaiJr2lzfc1kuWvroRPTxcBOa6EmWauR_o0fMuKc3J7-JTTQoAg>
    <xmx:oj-Vaq4tYId9--hUEiVwOH3Xjvi_0Sc_5pq-ufrp8VqAONtmn_q0Bg>
    <xmx:oj-VaiXY1l-HEJ5la51w-F5_Swh6B4uO9wFv7eypD-haDG6qA6B73mIf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 04:47:30 -0400 (EDT)
Date: Mon, 31 Aug 2026 09:47:29 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apU-lExw89P-zKgD@thinkstation>
References: <20260831075635.2244437-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831075635.2244437-1-noren@nvidia.com>

On Mon, Aug 31, 2026 at 10:56:35AM +0300, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> pageblocks for every eligible populated zone before capping the result
> at 5% of low memory.
> 
> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> configurations, but scales poorly with larger base page sizes. With
> the default arm64 pageblock sizes, the contribution per eligible zone
> before the 5% cap is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Consequently, min_free_kbytes can reach excessive and unwanted levels.
> 
> Add an absolute 1 GiB cap to the recommendation, in addition to the
> existing percentage cap. This bounds the automatic recommendation to a
> sane value on systems with large pageblocks while preserving existing
> behavior for typical systems with 2 MiB pageblocks.

I am not against an upper limit for min_free_kbytes, but I think the
root cause of the problem you see is the size of the page block.

We at Meta switched to 2M page blocks on 64k ARMs recently, targeting 2M
mTHPs. A 512M pageblock is not practical.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
