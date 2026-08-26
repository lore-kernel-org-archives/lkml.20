Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293E3B6C16
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743877; cv=none; b=tULbWa8mSzACmQu88IJSd5t7r4wUNLQkXVFGzs4VfqgyGUcHgwD7MH4vBTxnsXE+KES8GiYtGvSt9vGfOnfhZDCbQrZDfl3b2rACjc1WFqyox4L+Jt2X1momdOzGSrRV2ZHgqOqng/nK/l85zyAcy7GVme/KAu/LkP+iNiAEofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743877; c=relaxed/simple;
	bh=yRKGEdmSCqT8eqCxlO+o3wuXtVa3okmerdtAPmey2Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qS4q6S0IP6WDtT/MV6eliJDTe2SXvPnMMaksmnQ7RZ82hR6Vyesq0UwnBUjr+avQF8Icvo8MLHuOlvT2oz3ip/brIB0XJq7fPUT40K4si4mIFtYWItYHDCPP1VoVKY0eu5JIogLTJF1q96IsZ6beZu/L1XbYN/S3GuYD32/EdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIbpn6RK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIbpn6RK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1811F000E9;
	Wed, 26 Aug 2026 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743875;
	bh=/Bd2roISMg/MEEHMt1PrIQbAqlMT3O5loRi1WuUYSWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TIbpn6RKj5Jg7PWffs8l9yuqXdFBY2Y/dHc8eHBedV1zBP+UpJsC3CakCTxRQ6J/N
	 WW7zuiHQJ06zB75p3npsyMm92D6BsW047WhhsopZCt/Ud2YhIDyRR0sCbo58f1Ycnb
	 0mslxCfOLJclfW/eBh43B/I86rYYQARbNv4eVOQ50nLK2AJxk0B0zaL6527yLAkON+
	 AmfdzmqLS63ivRxzZsmn955lj9muWNjCNjYf+VXy4dAApDkxJUymdbwEXn8PUGAYDM
	 l4kcCZiHpz9YTrwEAopE2WwnuhpduwKmXueQ1IdIzvrpWzKgynEWN1ZBrw2j/opMm0
	 JAI8zmSyaeb3w==
Date: Wed, 26 Aug 2026 12:31:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <ao7Nr_FALfP7cTY5@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>

Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:

	~107,000 words of review across 948 emails (in 279 distinct
	threads), counting only prose you actually wrote — quoted text,
	signatures and attribution lines stripped. That's a full novel's
	worth of review commentary.

	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
	and your longest single review was 2,404 words (mTHP collapse
	support, v12 — the khugepaged/mTHP collapse saga accounts for most
	of your top-10 longest reviews).

	Estimated review time: roughly 300–500 hours, centred around ~400
	(i.e. ~7 hours/week for 14 months).

	1,615 THP-related emails in the window: 948 reviews of others'
	work, 278 replies on your own THP-touching series threads (~31k
	more words responding to review), 382 patch emails, and a handful
	of MAINTAINERS bits. Busiest months: March 2026 (131 review
	emails), June 2026 (113), August 2026 (111); quietest was December
	2025 (5).

Think I can be happy with that!

--
Cheers, Lorenzo
