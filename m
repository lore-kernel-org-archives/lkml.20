Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803408;
	b=qUSSFcD/QD9/4gOxj58+zfWSMA6SgY55lvxRnPezU8f/PHKYPC77kNwWHKJHjIcda7Bt
	 4V7GhvXcXiu64gqZSsx3upQDErNHCpab/bkIEmowXDavosV2XdYO41v7w/WwL9Zq6nFP6
	 u6fdusdJPCKr8kkBEnqzRNZsMQySZo4aH2KQUPTD+s2fG76aIcz70+08eVOgalGhEyRnT
	 EN8pXKqMWJAuRXH+nQP4iDbMMN8RQyvSpPAQROWkySiCXa4yKyLtfUndnXRlwaZWbAq0J
	 9NN8NP33YnOtKt3IPI24TbMFSYKip3jjxX4NxPvIY3mXWmYPyVgztuihfZsc5sz7ahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=hKqJ2uEOYtzQRvkSXtbhCR2QllFPzuY2q8Y7E0Q6qWQ=;
	b=iCL+zrOfnfZqzaN3OV73zuT3jUhwa1QbqwivrkDzViHOsOTtc7RtieqaqIXPxy8OlPyB
	 BQ122cxn95s0s5yE09FmMH93e61/BR3V7IThjwloZu99eWQKaGr7jHSx8UE7WJwY8n6vM
	 a6dLG5pGTp00y0jHseB/rvmdxs6giquCIDSypTC7zOnwGzoyCea9Q7oQENFpD8osJZZR+
	 OuSbVdPdbRVv7vHeg9ONyA95CgN2uvmiHtK/IRbAQYmynL9GWVM2eCYYPXWVmDNdEiYs5
	 OuEocrQTFvlYMRgNODuBPSV+lZ9bUbctpvJxhKR9wBOhKQe1gxvo7OIWkYX0AME7hzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="KQM/cjnZ";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D14606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D14606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=KQM/cjnZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hKqJ2uEOYtzQRvkSXtbhCR2QllFPzuY2q8Y7E0Q6qWQ=; b=KQM/cjnZBeXbhClEjzLNifwdvv
	1gwqKaOIRYpt/7Zp2XKHAGBHin8pIN0KOwxdBBigiJFWAafnEGpiv0j51/I1BC5w0FOsuGQ0dkWQV
	UQAIq9uCc5RxA1rHorLv367s39pjOe54LQ3uPosGpFkWX0SJQSMPvGTndfvNKWgO6oVz6tEIPRzQc
	auFZUwTBBNslh4KF8MVJUhdkoytWqLZLrnKvIFSi8sytczmoToUnnLzQL5TxDMjtMG7agAC428D38
	WptdPp+zMLc1uvDFYzBg93zI/0GbsbeE5vMLkfH6qapySueK8lNICrM9XtOyjTr8+WHVslaJ4Untr
	IVnIX+yg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOcCo-007nSH-1w;
	Wed, 04 Nov 2026 14:43:14 +0000
Date: Wed, 4 Nov 2026 06:43:09 -0800
From: Breno Leitao <leitao@debian.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, SJ Park <sj@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3] tools/mm: add hwpoison-panic tool
Message-ID: <autEaeyHvhi8vvSK@gmail.com>
References: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
 <12f80449-9d6c-4fb7-bcc4-e7d38e868da2@kernel.org>
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
In-Reply-To: <12f80449-9d6c-4fb7-bcc4-e7d38e868da2@kernel.org>
X-Debian-User: leitao

On Wed, Nov 04, 2026 at 03:35:16PM +0100, David Hildenbrand (Arm) wrote:
> On 8/13/26 13:45, Breno Leitao wrote:
> > Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> > sysctl, picks a kernel-owned PFN and writes its physical address to
> > hard_offline_page.  Three page kinds are selectable with -k: rodata
> > (default), slab or pgtable. In all cases the host should panic.
> > 
> > Example:
> > 
> >         # ./hwpoison-panic -k slab --yes-panic-my-kernel
> >         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
> >         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> > 
> > In dmesg, you will see:
> > 
> >         Memory failure: 0x100032: unhandlable page.
> >         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
> >         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> > 
> > This lives in tools/mm rather than selftests/mm because every successful
> > run crashes the machine, which is not something to run from CI.
> > 
> > The --yes-panic-my-kernel argument is required so an accidental
> > invocation does not take the box down.
> 
> This is not upstream yet, right?

Right. :-(

> Anything missing or is this good to go in?

I would say this is good to go, David.

--breno
