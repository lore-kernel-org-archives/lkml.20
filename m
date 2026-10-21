Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578760;
	b=GqhFcWZarcUiPmNnaQ/iMGJRFDMdubq6UcrTT5vDjbmt9ImBBgilfDKTM8MujJL0QIHX
	 L/DW2SEoK3fDNW/Argvsvmol18modWhjxgTOTPlfs5X5FCgjUlj4vqxgVsmLoko2ii85O
	 cEn4k+vCdegqtdEdpxHQQenYEtUECAgnw/FFZDmVgheRWEhjQufJynQKWBrRRdQOPKzoo
	 kZ9NB0Koq6nfbWyFtgahxvHV9Hg4W09hxylJ9kX4WPx3JzdSZb+gRCFLIOpJSb+KoBIoB
	 iB1G0EmExjSTwDMOlAH+OpUvP4bWMNa2VbVMFYvc8Xh4Cd4us7EPk6CD6YOzZpzZ0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578760;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ao5wRKo7Aqr2EOL/H5SIhA5Ty28X4+tjsBNb2koDVLk=;
	b=cR837VDT54hvXn2mRUPZ5yMKreVRFRUu7V5JO4X4nl/2YBaNUINFNpUfm1PAWorMHX9h
	 iWtcuC0IWI5QV14xcxwQsXZvtPDgQlBquHNeH7J6968QjBzXzpW9ZrFqCJu2T1KxQa0za
	 5qX9yoVhJJPuhMkPa2ITo1kFHL4nqPBqx5LAuJZMwm9di3GYV+4Hnz6QMpMRPlcg8wgKp
	 H+VMVVqFQy0BNnovf5ZO26dSG41aK0Hp68yCOREiKAVWTksESygp+JTkz2zTkCozhUINU
	 olxSeUTS0INR75ler+5NYKAnRmOmwfdPBbjmqIoadEY7M/dB0tBd7g8SgFRHfOOBB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm3 header.b="gTQv/y+7";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MJgpk6uJ;
	arc=none smtp.remote-ip=202.12.124.137
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93373606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93373606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm3 header.b=gTQv/y+7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MJgpk6uJ
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id C10F61300F49
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:32:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 21 Oct 2026 06:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1792578753; x=
	1792585953; bh=ao5wRKo7Aqr2EOL/H5SIhA5Ty28X4+tjsBNb2koDVLk=; b=g
	TQv/y+70dORm84A9UVOlvuGtZU5F5a6eVyc9ce1ghh5B3pn0Gs0GBHqcb88ZnWUE
	10/z/DrERnxWRJgZmKtEZkKH+ZSur0OSpGN7nkq/RmazT6yep5OrLPFFw/e5CLUb
	3m84BSkGkeq+iZfJKEdsxJZ8F/HDxq853WekJU9SJeMp0d4Wx9fkNwpjOFe8yjqc
	avvI2hkIpMMHXVd1So+RJrjY8I/HFwO4OMiryEq2NlJIzbcdUTN1c0ngGOqR4Tsg
	RL1ErZufY87JziKGMgSeqJtpzvMKznJksCJhuCbur35v09Z32ExWRilIx8TVAOOo
	l/jacfUdJ4Delw0mbOIjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792578753; x=1792585953; bh=ao5wRKo7Aqr2EOL/H5SIhA5Ty28X4+tjsBN
	b2koDVLk=; b=MJgpk6uJafFLWK+gdZFyqyUsQlaTa0QnI5DJA10VyKNB22nHFra
	FCVPB1W5dtzlKcYdCaqTT1mGosqtro480kUsJZ4fE2Cqrvb6aY+R4FqwUGyt/4YP
	5zAId++Y9wjMTdoo9wvvEly+Q0rKCIlcvHLA2uOChmP+Q2oKwFzVjGOQWKDuh39K
	l79BstO0BIbb1Ox39I/b3tAmSFrx0h13hUSLE+09IJXgzPX13mf736vQoUfvGGNy
	GE5J5qVCClgh2KPifcJjL7R1zHuJ3KtqWuo8ht2OVeJIPshiE8VlVVGnpixbP7eG
	8rxOd08G379YiLLAThVa+KLSI3KijqVc0kg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792578753; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:DEbxtiDXIY763KTole8fjWLbss4UT7k+PwZ0PaVjFaxGsnc
	z+zzqmYFyJeUEkeW4WrDKw4/PX2DYUF0aN1yAeurSB7+UcAUbCP+e6kOJEXTWK2Q
	pcKth+Z6cstp3+UdU/bNHrwHI8VBY3gApgoaTzEuWUu9nANwPA4oQmvw/3wIcu37
	eITiPb4teqCvCBp4mJ4tmdQz0zsYFVrqfR6W0paZ1H18VjxMLAveyZl93BV/RjPK
	sZmlW9aoU87oUU7ut50uAjDryh+sKn50zYZnO8XcLOdKWyg31BOXm3kK5L7QxFVz
	J0STzodcoDJklOotrcpxI+dl9R+CNILTd2tr89g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:0iGKCJbhYU0ofzk6Npyui0jqKKmOu7ZXpeh+imW0Z1s=:mab1Cv011TVDlRjbYop1LecBevJxhFR5JHPAi3J8Mhw=;
X-ME-Sender: <xms:vpTYai6ULHsFAu42jW498bwd6049ted7JtILPFXi9lYmxuk0U19jfw>
    <xme:vpTYaqaVGYsnsptwmD18SuFUP5TxvXfRTN1sbL5CArHrpNy4O5v802sS64-OZ1Tay
    5ccGLinrpbuzWeUPKFRG-bCOfFtGlXyTXjSprJj_3cI7jKIyY62qpQ>
X-ME-Received: <xmr:vpTYasQC0CIXhNEIntXyHcCwBuEQ77dfXpDNjz57lXnVj3m3qeOqzYJosBQ>
X-ME-Proxy-Cause: dmFkZTGnhrpawq32AodX1hclL8yoAmMZid0tB7OC5CEHocuh1cymOwJ/kQUvMQgGQBVneN
    fn8CQg4VkpXP52MPdVTziNPQNJDcNRcCzcA2XkYozz8Co44DHKT0iojkng6oG6FZQPyeVf
    BuHkztAvyKVOK70eSgjlNcQ1X5qCyAOLTNgi6uIWn6ugxfP2yjp+nn9XkM2Ob0etdtfI3U
    /4ZOai2ZCpmogZJNmjgkqW6zBtui9lcmEVCtmyVG7Yd8+BYH3ldpiGfPnNBWVht3EVBxTI
    EKI7KJaz5TnGAEPE+KhN1SRn4FjeHqOcRrH3Q4kQjYUDRgF0j+C1/wppVqIurAQNRysQbo
    lKkElDR2XjPF92/HwwcyPJZ/uI/Xk+ipBJbxpFveG9enESiTU6AmhcIhg/5iSX03xjrA5A
    RoWHvF4GHpHXuGVZWO0l/UwDjFLYUExUnyRls5uJpu3ktDw/ly6xGie836xV0vmAOcqQGY
    mm0w1xkMTvxiCoygk7Kml4uouDmn7PsmDgirrXZ/c0ClvHpK0aLmB/OEGUenwYQ4r3ATvb
    AAhCvG44jf7L3OFZ8+/vBcKB9aA6MoZvBGnS3D34OPsU+YQxTSsYJHOgnSr9RzRaJjrKS5
    kHN5SATJPs13eTr/9agmzcnG0slflFQFjvRlUlMDEEPW455Am3Cpy8evEslA
X-ME-Proxy: <xmx:vpTYalXRMx9bq4HmCdqouGvgUZwGcn382lcgaR4ziZNzWin0NwO20w>
    <xmx:vpTYahqIw7KlUNZuVtCzIk1pS660kj_MXpzeYUE-8UGfH6eF6MXz4Q>
    <xmx:vpTYanUJH2RoHRR8kiduC9R8zG4MZfWSxarW7upO46YsDq9z5T_-Mw>
    <xmx:vpTYapQy5KclNGY066cOMw7t9255muo-ve4Pyrqulm6Qsqvjmz3D7w>
    <xmx:wZTYav7C_aV_drMgYUoF5iXAbmfYqY0GnH0Hxy8k-fmPodU3tviYko3->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 06:32:30 -0400 (EDT)
Date: Wed, 21 Oct 2026 11:32:29 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@arm.com>, Usama Arif <usama.arif@linux.dev>, 
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>, Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
	Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH v6 02/19] selftests/mm: skip collapse_compound_extreme()
 where the PMD is too large
Message-ID: <atiQmWnz8zx2AKI7@thinkstation>
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-3-kirill@shutemov.name>
 <5862cddb-a78f-419f-a5a1-15e16a422bf5@linux.dev>
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
In-Reply-To: <5862cddb-a78f-419f-a5a1-15e16a422bf5@linux.dev>

On Thu, Oct 08, 2026 at 07:52:18PM +0800, Zenghui Yu wrote:
> Hi Kiryl,
> 
> On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
> > compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> > therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> > at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
> > 64K base pages -- makes each of those an order-13 allocation, which the
> > allocator cannot reliably hand out even once, let alone 8192 times.
> > 
> > The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> > whole binary stops and every case after it is lost.
> > 
> > Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> > still cover PMD-order collapse on those configurations, and 4K and 16K
> > PMDs are unaffected.
> 
> collapse_compound_extreme() failed on an arm64 virtual machines with 16k
> pages.  The VM has 8GB of memory.  Not sure if this is the same issue that
> this patch attempts to address.

It is the same issue.

Memory usage for the test case, assuming 64-bit page table entries:

         4K pages:  512 x   2M =  1G
        16K pages: 2048 x  32M = 64G
        64K pages: 8192 x 512M =  4T

64G is a lot, but I don't think we want to give up on this test case
on 16k machines completely.

Maybe we should treat a failure to allocate a huge page here as a skip,
not a fail? And remove the PMD-size gating.

Zenghui, do you want to experiment with this?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
