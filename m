Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424747;
	b=2qUaUmiBARCrLL6Mj0IVm6naQKXBHqt4RHcLYsl78PyDYTkRk5xISAyxJ914GuROFN9K
	 ol2ZTQfkfT3YfONo6DaLOu07JHjJRaZMS9ZNmyNUbvbuU4Xdvxo+IfVd+YfIsjVFjCkH8
	 B71NUdd9ykvncGkLvbA+lCdwhN2WvRdFVibvsdQLcsuVVzay8w0BfJgsnQyHMWM+iQhZs
	 C8pnJR02Mx0hnrPHPuF2a1YpuhB/i+ruG1y6G5kuBhyDsdfEcy/dB/N4SxJsTa+QK7ZpQ
	 ISU2zI71bHmCC1SIsx6ShARVqkTGpHbs2eNwBfUJ3P3M496NMi1GZxZVIioFf/LWHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424747;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qAPPZVTkRlTwW1+3PqzGIZjGZrGorIqtZwoux0Jo1t8=;
	b=YDPAZvFLBeOrIf7zuhfpL56pA/aW4WRwlZak+qvjY+pT+ACADIXVKv71WSkNwfA5oJ6C
	 D4Ri0UXTEpSDSDSB5Jk37k0zDruVldTIkNog329+giXSKJuTxgTowDWKi0rNc0jpRjVUd
	 ELJnVv501JmxIAOXGpHgYfgrLHgrKF6kmvkPBHV9NC9cHn1jmV/qDncKQRzAPUdbw3MIk
	 H7h0Ja7MKZ2nZacR8ZkByS56qgA4ARUIIQKNqdmiLLbMQJmD2IbEUdI1fw7grGLuCZdLI
	 W1nT0AP7LoZiB7o6qULqWvPwcnPaOP1jmlj7CF4zrSyOVHDU1JQmzyMAeMTU0oZ8j/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jN8xl8uy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AFB606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jN8xl8uy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3D31F00A07;
	Wed, 11 Nov 2026 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424747;
	bh=qAPPZVTkRlTwW1+3PqzGIZjGZrGorIqtZwoux0Jo1t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jN8xl8uyWxmv2uIiItBYJrA7J3GD07lP8UBakX7bPdZOsi3/k2ug6PPdtIMCnK4Os
	 amnP1YUDR4/T4pwSUgkp5+JcHRPZAbZYb5aMdcTwof1uoiynngiIEdWycThTBjmudu
	 woqN4zn5dOVUATWwbgqhkB6iNPXjztGdmPwgBGXpk5AswBP0aUNWVT5WiuR7yehVwk
	 UNTAqtyuGnZoMq0o5/bQDrXyBu7NjHXJen8Jpz57AvuKTT0SW5Sucnl9vBGwRcPVx8
	 +5PKe42lahspMkM2jIH4DW87DKIxgq9pFVsQPRcHSXjc2xBn+Awbygf09wPY5tuEBT
	 aO1p8luxO05hw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 29859198003A;
	Wed, 11 Nov 2026 14:19:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 11 Nov 2026 14:19:05 -0500
X-ME-Sender: <xms:pb_0anxl5grZleYVCEAHUdoMH_SIdXgNi3YSamqe-e5ICnkz1tGVgw>
    <xme:pb_0anj4-ow4J-Se1P-HX4G-18PohrUySEMfY_cCS7lwhGvvhDfrubhKQv0XyM6vC
    PENWpNMYUejKoGDTcfI4npDv7t9ZqBXQy1cNES9UyrELkCHzVW2KG4>
X-ME-Received: <xmr:pb_0avL9ISgP6BHP6GeBHZCV9oJpcCy0y8t1mPqxNIyK1fbV2GJABeZC8i0>
X-ME-Proxy-Cause: dmFkZTEN7KIAjWcjeVWSiqg1tb1AV3/0ocRjzhPZnrhv3Y9U5nJDiFMvHQfgcNVbET2IHS
    V4PgnXLV9GMRFgEU71pzcq6gDDgB+miAQQzBL2ylvgYsAvj0QwsytTmr4w0cUsyke60eOy
    uJ6Hvpqb7Yanyi8J+98etPY14DsAqvHzmY5dXKhYnySsPS3S7QJZ/cGuW3BHs8xDfim0NH
    MUNL9Qj6r+CWWTM1Cj+OeR2EF3jO1lP67NDR8ZmuFyjEXx8bdLK1a9V7dJK+wa1ehM6+lI
    pj6EITLBXH0M9k7DH7EEEU3dSIOSx0j0jWAnqHk/C2/g4M6eZpEQa7nxOkec3pGqah7MS8
    eerAnsVmA/fyaJ7yTNv6jfnGcFrsI2GHWkfZXfUCLJpXT2qURk1xU83UgPK+e+gvCXUz4z
    nuMl5ejEY1zX8zCH9Q6C7PlXbAgwKNDJ8VDGKcAZvL6VHUw9t+lWjBJpRGJ8Za1Lb+P6vM
    49kWRACh9Tdxm2S4cXwNPUtrTngDa7lskaOikaGR4VI+Y9r4nFTlvEklE/yCMmbGpk0R7A
    9qhI9mAw/GZWRLLTTQdklNUxuAFU3ccIPHnjNF0BINrY4KEHMNMh+9EVJNv1DG12kcYOPl
    zamrk15mS2yRIKoeTbObYg6PttDCkx6vUt9yHNXH+OLLP5esTe3qIo1MqZiA
X-ME-Proxy: <xmx:pb_0amfQkex2AYXXuqLj5bosFxgke5x06wC7JqYEKkSx_dz-wO57fQ>
    <xmx:pb_0ajg02CKYIzWlBSgSCGDx37QItlV9TVwSxDOJWHWiO0zyd9xSuw>
    <xmx:pb_0ark10NYuWkVCt-oUoafq6WDDt67eV93dfUXX1vf-hCtqLpjPIw>
    <xmx:pb_0aqVfRrB4FhOwkLuDgt4nXNI86V05WUNmvz2UCGKQ4OzjjMmvfQ>
    <xmx:pb_0aoo61dkYFNf3bBx8bvoZ1ywawEbkp1leS6v-OghpHYIw8xqMxwFP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 14:19:00 -0500 (EST)
Date: Wed, 11 Nov 2026 19:19:00 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	Sashiko AI review <sashiko-bot@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/6] fs/proc/task_mmu: fix make_uffd_wp_huge_pte()
 prot-update race
Message-ID: <avS_WaLHYxvwoZXM@thinkstation>
References: <20260529172331.356655-1-kas@kernel.org>
 <20260529172331.356655-2-kas@kernel.org>
 <avNEgmvYdoukt6MS@gmail.com>
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
In-Reply-To: <avNEgmvYdoukt6MS@gmail.com>

On Tue, Nov 10, 2026 at 08:23:11AM -0800, Breno Leitao wrote:
> Hello Kiryl,
> 
> On Fri, May 29, 2026 at 06:23:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> > The non-hugetlb sibling make_uffd_wp_pte() does this correctly via
> > ptep_modify_prot_start() / ptep_modify_prot_commit(). Mirror that
> > pattern for the present-PTE branch. The migration case stays as-is --
> > migration entries are non-present, so there's no hardware update to
> > race against.
> 
> I am  seeing this on next-20261109 (arm64, PAGE_TABLE_CHECK) while the
> pagemap_ioctl kselftest runs next to a workload that migrates pages:
> 
>     WARNING: mm/page_table_check.c:206 at __page_table_check_ptes_set+0x168/0x178, CPU#21: pagemap_ioctl/894691
>     Call trace:
>      __page_table_check_ptes_set+0x168/0x178 (P)
>      __set_ptes_anysz+0x50/0x240
>      make_uffd_wp_pte+0x104/0x1c8
>      pagemap_scan_pmd_entry+0x1b98/0x1df8
>      walk_pgd_range+0x7b4/0xd00
>      __walk_page_range+0x108/0x510
>      walk_page_range_mm_unsafe+0x150/0x3e8
>      do_pagemap_cmd+0x418/0x7d0
>      __arm64_sys_ioctl+0xc08/0x1338
> 
> given you've touched this recently, I am wondering if you've seen it.

I have not. But I think this patch should help:

https://lore.kernel.org/all/20261111-uffd-state-fixes-v1-3-00713d368976@columbia.edu

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
