Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921987;
	b=P5qBY7ssbvol0Xmq1yOA1+kwJgveFDNi0ga97COzdTyLqHliltva4XJsQ2ZUlMjFny0m
	 0DzvfOBtpEUMzgpVBlYmiNMMv/grGfMZVsjP/yBXqmBMIY7zIz132eDMavWXrLtGmvpO1
	 mSMKyQSse2SLhLxuQFsfR4Fr6v/TY5jgOvYccsLCIwP05t+6ZWbHpxizmFTLeZtmrkGV1
	 JM/oZPbXybMjDJ+GfwEE37aa9WsW/uxfyhozSlyi0Xe2Cy8eFGwX0wvqnqerjBg1ppBSE
	 gDFF85QAFHbVAuQ5XBk1fo8x7ZSiKUhJKFMTFaGibd9VR8ztDAF3bHQktOKriMQcTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921987;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rCoKdv5eyx8+bEKQ/D7gBxIEUDff2HqusNXsd9z3Zfw=;
	b=Uvc0m1P9LcbcPwYLu4HMw6yLgjzoJvLIVDI3vkobBy5Nif+aRNbwnIHwqz+cJfhCfjCz
	 kYc/5x6auKvXMAtAXOHTqgU4jYd+QBqtwrDEFxj7eTapkOw/QDKOqg7a4/ngYlqBNnc9w
	 pcXRHCK7CyPiucG3bS2a81Vu2WzTUSA8GR6x+xd3gVX6vM1E3js8TyQ1vmW+TVv7LEZx5
	 4o5VcLjeMFgaPauUrmImM/usrWqaUSYBgDyV4ogwFaWKRDc70A7XCPay0ZuZsnOuRtEIw
	 QTDDXaFQXcMwfbayIHe0lnF9s8Is3pTWv/GGQJ2Fdi27Ph+pjM4cLDniJuQgmMUh25A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="bl0/J+OI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A274606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bl0/J+OI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8051F0089F;
	Thu,  5 Nov 2026 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793921986;
	bh=rCoKdv5eyx8+bEKQ/D7gBxIEUDff2HqusNXsd9z3Zfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bl0/J+OI4ezSk/4AHOsUzY1DM5c6/1998yEWg2PnGHys9rxGEnN38LLVedu7ca1zc
	 m6OFdKe/0gVYUJRUyjaUR2owSy8o7wVgnLtbtYUhrjTy7HpXtGg8GchEbNxi3iGtZW
	 Tcf6rC/GUxnX3T5NkJK/ivmLT4CxHW/7tVxqBL7g=
Date: Thu, 5 Nov 2026 15:39:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Bundschuh <mkbund@amazon.com>
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>,
 <jiaqiyan@google.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mm/hugetlb: add htlb_dissolve vmstat event
Message-Id: <20261105153945.e4a6415d8d0e8742887e9a86@linux-foundation.org>
In-Reply-To: <20261105191508.1021974-1-mkbund@amazon.com>
References: <20261105191508.1021974-1-mkbund@amazon.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Nov 2026 19:15:08 +0000 Mark Bundschuh <mkbund@amazon.com> wrote:

> Memory offline and memory failure handling dissolve free hugetlb folios
> and lower nr_hugepages. Nothing records this, so when the pool shrinks
> it is hard to tell whether that or a write to nr_hugepages caused it.

Can we please have a much more detailed explanation of the motivation
for this?  I assume it's for the benefit of ops people, but why do they
want this and how will it be used, etc?  y'know, that old use-case
thing.

> Add an htlb_dissolve event, counted for each free folio that
> dissolve_free_hugetlb_folio() takes out of the pool.

I'm wondering why it doesn't account offline and memory-failure
separately but without the above info I'm at a loss!

Thanks.
