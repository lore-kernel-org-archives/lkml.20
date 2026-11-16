Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827902;
	b=Bc7+sCWQtA5opt3v8TBTRz+UPKgSpPNQD7NwJXy9hohNXjliqsXODwkTPINh145WSo8c
	 wwvP7T633A+iB4wN3+K+IgqIubkdb7BTmowwrLomRJ3JpwYTcBFnX8Y7PmW8mRkOhZviG
	 QCk6GDuvIz2R1eO8WVPYgHV8x9WwSfTWkFNOrdYKYkbD8G77vWlL1YMwwvtIJqYnNvYJ8
	 8HP3VWjB7OSyJjxZEDrDaGAEFsoGNCSaf9Pv/ZSS7BBflKOvKbk1pL80L2VcXk3AN/agU
	 9LXXpeDM3nzn147fcjKL+RQbSenebMgRDmFDas56sOLltPRGZBcMeE+YAqUO50nNr2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827902;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pInkU1Kj6zfIjFRdKgRmxjnKdwV+M8/pK6hiBzR2ods=;
	b=yyKn2pGzrYHa9beCVeZljVmkiIO5seiM7ktfWtdvQKK+gITkpALhJw/6A4AEj6AktmHH
	 EG3iloidyZTBKm0c3xMUM/W5Md/N8rAuAUsI2akxToUlnEIz4U69wcA2m5jm3feRJRCMq
	 9EZUps0n4JBkppOjdTTkre22iAtOLpc5F0lbV80VnSyFv1Cw7OEhvmohPum06W4vM8ziv
	 8oSMMdarZ+InGaGeX98LojL1mCTaxovwzLqBB7cN+sbq7E7kG8XxHjZ0YCqIm3DsD2Fn9
	 aOeGKITCWiG8mgZLydajKq+pfNxypxvz+kUQEYhZZgdb/ZyV2NpOG/VogLcDM8C4tCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFu4j6UT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86E606FD87
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFu4j6UT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DAE1F000C8;
	Mon, 16 Nov 2026 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827902;
	bh=pInkU1Kj6zfIjFRdKgRmxjnKdwV+M8/pK6hiBzR2ods=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YFu4j6UT5ULC/Wpu4+KyWDjm6pFeSFT78Jr5Y2tEVG2ZjhqbqIJj54d2Xf5k/FRk0
	 GvA5lLs2yMEbPT9qabJsgfvWpPUl60Q3tlEiel60ZqYYdFvPKnmK1Oo60pi+elAxRh
	 hO+U+xKxpxG4TzyRi+SSsLXIkvmXeUq3ZYpUJKUxJHYKcRmmQptwgjEBfTmxj2F/Ra
	 H+8dbl7siG03M+0qRpWBvATvQ9LpnBXSfJAhTjJ5ZMCcGQK54sLQwaXgDVmILXtC7+
	 ZpFu8l4nMega2NWEyqAhC1SNw2+FsGWbxqe7dn+/tSWNNNx2lV6+SlDYgqfpewxH1f
	 3tebTBTVM+Umg==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.ams.internal (Postfix) with ESMTP id 26FCB198003A;
	Mon, 16 Nov 2026 06:18:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 16 Nov 2026 06:18:19 -0500
X-ME-Sender: <xms:deb6av-zhn4UO6SdC9g8DgVodC_r7Qj_roodrs9WoCaIMWyAftrBtg>
    <xme:deb6aqLOlkggipP037eX6K_dJ5eEG6hNXo5LDFfjrp3nZTdqqBkZ1Nb7VoBE0TkZ_
    JrHh6ocp8yikgswn2tTy7Wa26qUaIYlpIbcgX7U8IfBMq-YX6lJkS4y>
X-ME-Received: <xmr:deb6akIOoF67Ycx3cI2pe4jE0Gh4n8Dw8dWrDpif4BkQSiyVUL7FBuYHrqo>
X-ME-Proxy-Cause: dmFkZTF0r54BgXdUKVHIIJLSxT1HUE8NMy+LX6nTbiUSt5B8TJTcqLVbZZh8ZRYGxOuiID
    I+9mEJoA3l4liwzf6OgguPCU94Yg13dir1yyQwjAQWjSXsuRKra8Aa8G7BK3FTh9HRP9Jv
    rj2cvt/z3cYpCGQ652b1ZBsuDX3ET4qjRSaLgC7WVmy5QVQTXY6sbLmFql+2DIr0rx7NhT
    M3uyi2NgsMt+zsW7zVSvCNgsfMIubG8+6aGmigIVwvy8okaCH1oKXVa1qr/yXDaXXUQhYL
    wQtnRcPUFJ8BoWqQLjWwv3vO8EB3TloW6I0sEs51CXCiQbhRAr0U58mh5FGUEhmjvEHWSn
    +VPClTVclES+wly6obFvXaBTbp0sdFCQVGmujFiHNt38j1bkOpFJP/hVszvj+kUEv35otN
    bmfgbpEzJae+7EBTBr16f3Ud+kCvxV2IXr1ntzK4o3iezmgClOlPvFseV0vflmxxYZ9iou
    kESLDD3GWrIuV/2TnimqZVAVpo3pb7YwUYkv3YHS/oFWN23u0wO22+mVta4CsJV6Q+JVjr
    42Xv3GRmkfN+/Is/JtGxh2xOrS8zHYVLimTuxF/xmbjO7EaTmdSUBpKlHLc63VrfFOnGq8
    ih6fQpFWjhuAt1G6ahVMklcAm01IQCnni76TUU1iXCK63PA9DCxg8g0NFnmQ
X-ME-Proxy: <xmx:deb6avASCCqAgKooRs_OHb_k04EofBRFHYPkDKSovsjMCsMNfnK8hw>
    <xmx:deb6annMl92x_IHuqdgUCC202iUwUi6CRl5td3U-fDcohK7NmEPJ4A>
    <xmx:deb6arF6hPMnQg6iDjfI3g3yPFaHoEonqnf6uFZGYGEZxs4uD06pxA>
    <xmx:deb6amj2_cj6M_CrprWZdkWb2H47YJLmvK3KRAG1FsN3TDgc_8GFXg>
    <xmx:deb6ajc_0UmiW9_O2vhBOFp-bxsnlE61bfeHCCShXbhxaxQPAoaNB5Oh>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 06:18:12 -0500 (EST)
Date: Mon, 16 Nov 2026 11:18:11 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Harry Yoo <harry@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/3] mm: vmscan: tell direct reclaim the allocation is
 ALLOC_NOFRAGMENT
Message-ID: <avrk2Vn3q8FUI1oZ@shutemov.name>
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-4-kas@kernel.org>
 <e16c46e8-d69d-450f-bf98-6f14755cdae5@kernel.org>
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
In-Reply-To: <e16c46e8-d69d-450f-bf98-6f14755cdae5@kernel.org>

On Fri, Nov 13, 2026 at 06:58:05PM +0100, Vlastimil Babka (SUSE) wrote:
> I'd perhaps pass whole alloc_flags to try_to_free_pages(), but other than
> that LGTM.

Passing alloc_flags down is easy. The question is what reclaim does with
them.

I can keep using only ALLOC_NOFRAGMENT from them, as the nofragment bit
in struct scan_control.

Do you want anything beyond this?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
