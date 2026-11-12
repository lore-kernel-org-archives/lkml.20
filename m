Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513130;
	b=c3mSvBph2TTgk4dlLzMU6/pyKBLHYzDX2JAVFOuFVKV8za1hJH8vxrK/SNoCIU49TK5N
	 uFHRAyTzFj0EpG++ZyGdBxN5oupGoIB+0/lXRzVu6VLiXQ0lEiPKIv1AHVXs2yyg5KSqb
	 GAfjd4ZOhiuTs4e96EJUBtjAfX9R03NXxL378ELuZElE4qUewyo+poJeezzmar72xbyLf
	 VpNXcYHIcZ3gJv3Cn6PDGkDc1C94oTCZDgB2Nd6m70q4z/G38r6rkJZVL8aGSOlJlBH3N
	 8+XoN5cI/8DT2S/aecUioy2D6njYK5ijX4xaqS0qU4bVzqv+7LL1TOxPZ4lakWkQGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513130;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MlVYwKClSr6axkVUrsf5Q0/gbt/MU2NgZlbXv3TdhJo=;
	b=3HyV/OGS0a1GE5la6dNVGLeJbfyBb7a7beR6BUpME4W0TcDLGEy0HGZoqKbxckN1WWEG
	 apySaP0oqe3cQgvVqVjfvWJdeh8DKwLR4jBvuxh4iF+XE4qeRnlKianMo5yQsWCBEkqDB
	 DSHZ2yze+eA8oBzgfvPTQUPzP/tRRS6crEkRnTMIVYInj8pTVPeFNOvKRVOXAAJK80R0w
	 p23oawbblE+SZ6WF7voxQCQe3o8dA+lUmmxWQ7niUbAlbhdib4o5qXVEfGPIxN2bYOUbL
	 tTDT6/WH56/zw+qJiNnjnK1SPzVFcqpRd+q+ZDSHTgQj5p4DA9b54SITV2hw/gTYcwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dMalAwg4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA6E606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA6E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dMalAwg4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA9E143D;
	Thu, 12 Nov 2026 11:52:05 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314893F632;
	Thu, 12 Nov 2026 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513128; bh=Qn1sSaGxO+vJ/OI4LVM3KSf/PAWaWZcvH2r7l0WtDFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMalAwg4D4V11GtglDiciAsH1CIOvW0wiKBRJMTJRqkwqvppyFadYrD9i9e1KOQ6d
	 XaZJTrTpq7zdX01yAvHL7Q/+H7ypEJCScq9umkQj/XaFrI1xDhKuikjesnO25SEGOq
	 SkVbBI3G8Ex2o+VhAnoyh30a19eFbGVFB2cTCik0=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Chris Down <chris@chrisdown.name>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale TLB entries
Date: Thu, 12 Nov 2026 19:52:00 +0000
Message-ID: <179451296802.3304937.10304187215137449416.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avPxZjjdBIlM_8_g@chrisdown.name>
References: <avPxZjjdBIlM_8_g@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 20:39:02 -0800, Chris Down wrote:
> In Meta production, we have had tasks get stuck in a fault loop while
> using hugetlb on arm64. During my investigations I found that affected
> tasks share a private hugetlb page.
> 
> Looking at the stuck task states, I found the following ordering:
> 
>   CPU0                                 CPU1
>   ----                                 ----
>   read page
>   [read only entry cached in TLB]
>                                        write page
>                                        hugetlb_fault()
>                                          hugetlb_wp()
>                                          [reuse folio]
>                                          set_huge_ptep_maybe_writable()
>                                            set_huge_ptep_writable()
>                                          [flush local TLB only]
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hugetlb: Prevent write fault livelocks on stale TLB entries
      https://git.kernel.org/arm64/c/3c47ec82540c
