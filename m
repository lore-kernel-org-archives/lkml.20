Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101A390C95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272655; cv=none; b=tB9hdUh4vZeBHm0VBgE/ZtwcaUnYWq1aaTwzvIeK1K0L7sXk+JuAU9TRqOy2xGH3Rz8TROS8ByMsByQXuclWrz5/msdBKPBr9qCiP5Dxku5ioTNh2mZVKdRnZPJLFv1QU02POgFzAc6opRJXJQSc1zjyYT8pTg3qocrrM3Ilego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272655; c=relaxed/simple;
	bh=nVSgQIu7Lyxs6Z206eMtmsYLxDTp/HpmK2SloWeSO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsPsmIfeEyvqhRkxMlW1I+X4Si7MVKng24m5ky4/TLD4ntjD+RLi/tGIM4JB2YwW/ZEp6rJYIVDNZKonfvleLXpGQQyaq+TE/rYfaWi0iSGrJiOENaf5lT7XlWlhDHazCvhUwOwQ2FBnB/hWqnvb/SmY8rXy844rq3vSmcCyhxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oz5WIptN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oz5WIptN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9391e3b21fbso295151285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788272651; x=1788877451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMNw5MzyW2DJkQCetuS4jMUrMgDtCzVkmjImJH3QcQw=;
        b=oz5WIptNee8XscHGuyC73cFevp79vDp/jDAMb+2q+59SuGSoi67v5MkNHcxr65xj7o
         0zOFE4FAsCPnTdIAM3vjpfiOMPpCW1KUYnODQk5FhGFD2C5m4t8oD/T8RzTa0vI4KLY6
         VYiu+gIr5k8HK7PAc7MhxiIv2pu/5TcOPTikAr2vSIK4zY93Skb23FNU08GQg+7bPLe0
         2P98vbitp916TNQAzxQGjZca6Y99nmOJ+NtUBeP0SeQ5bEWWO4fd9XBhtidPO5tRD5N0
         +67eMFyk6Zbi30fyMJekEa3YR9DffpJswP1P8XXMR7RmGdLsXOt8maaV/bmh2r9mChqr
         NB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272651; x=1788877451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMNw5MzyW2DJkQCetuS4jMUrMgDtCzVkmjImJH3QcQw=;
        b=GJG7sCv0iImbqjpKPZyJ1TtmKwJfUERuzpB8zu6daQNmMWrPNrEQSnUYxHn35+pcof
         RhGYRA5GqN5hhszeHCWkR1rm4JSv+vm+KGxI6Als9IhnkAmslh4kBQDZuJdASfZLLyUg
         vd5Qln4muzBkQDRZ01dN/Q68L2Ky+7E8QOwTd6ryjW1Qr6NPDufzQMIHAgAAUDJ1sMlY
         TBaOmtL5CLIyuGMi3BpKSbL0YLkjtEodarhKkxQ5T7SmfN/jDdyZEohB2+cEbw5AvIqX
         Xk0gdLILNZinjp25uLSEOJFnTKWNGQ+ZsqCO5EMEjNmqi12ivuBk7Q7DUWS7/b0zcN2U
         cXWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9lOK4T5f2Va6IP0TPvvPHtcRAVVKgM1wqS49sRBm5WdvBTsZUnrbN8WT6JwYEpSn0mbnQXq+SsVHTUkw=@vger.kernel.org
X-Gm-Message-State: AFuF++kK/W2/qAyXeaxjQaq3kfF1cFG+mrl5s7IKOYTPTsKT/IoczlEt
	KZv2v2/ZrAf8DF80LAVu4qvny8T8t63MgKKrRG7p40co/Ve1/8g805OlGfGSkg5SYgc=
X-Gm-Gg: AR+sD12ta3QfPV4ITmgimVbDU+AIZjyqqjImkUZCuWI4VnwjncUXY95u3a8Y7GqflBs
	wP1Lh+cBP1ZGytOOKLSxlxZjFNRsLg4NX/9tpe2AscR/6QapmeFn2J/lZ0E0SO2Fu+kwJlSxnI/
	+zgs+SyFFs+xzh3jc8cAv0kGqf5wFIgi8KSOwrmbKJa8GrajBCQxJYrumTnD/wYVU63MwQ6pGGE
	KggsbVt3zyX6RgRFviZIT1DuxqC1hie3B12LFIo7h0ExdTlj/SvwkurJZKtWzd29P1l8gY0UT6c
	V4vl7OMWODqq214OdABSTlE+0fJXBzh8sD4+GrbeUSgzqN0IhoM5z0VF1nL0msiaiczUCh2X2BU
	O5D43f00LlAwWXh+/l03L5e7zyreGuga03ceyNTwihy7vUa5/UTnF3VDuBFweUUfUNTBYO3O8xf
	+O0pBMfi1qUnhyIHJPHQHhn9S2hJJa2GWYjecUs50J1MHlKuJG/Y6D1jZG/jMNeNfVkuDxGpNl+
	VYfPjsGjCyh8FfffBVH+qve/nJxxr9TW+VHlY+lVmuqfw==
X-Received: by 2002:a05:620a:29d4:b0:934:ab73:ac53 with SMTP id af79cd13be357-939134fe550mr3924451085a.0.1788272649971;
        Tue, 01 Sep 2026 07:24:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917012b65sm1040535485a.2.2026.09.01.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:24:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PPE-0000000BgeE-10ID;
	Tue, 01 Sep 2026 11:24:08 -0300
Date: Tue, 1 Sep 2026 11:24:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Russell King <linux@armlinux.org.uk>,
	Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 01/12] mm/huge_memory: zap deposited page tables after an
 RCU grace period
Message-ID: <20260901142408.GA56830@ziepe.ca>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-1-5456a81c8212@kernel.org>
 <apbOlyF77yDCV4cF@thinkstation>
 <apbcoMTVlL42G5tg@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apbcoMTVlL42G5tg@gremlin>

On Tue, Sep 01, 2026 at 03:12:45PM +0100, Lorenzo Stoakes (ARM) wrote:

> It won't be costly at the time of the calls obviously as its deferred. Maybe
> increase some time spent in softirq but again is 512x that big of a deal?
> 
> I'm not sure how you'd both defer the free and somehow utilise mmu_gather here
> either really, certainly not without it becoming extremely messy.

The less costly version is to thread the page to be freed onto the
mmu_gather through a linked list in the struct page memory. This is
super cheap since it is just a singly linked list operation.

Then when the mmu_gather is flushed it does a single call_rcu using
the rcu head of the struct page of the head of the list. The callback
clears the entire linked list of pages.

Since you have to tlb flush anyhow, it makes sense to always use the
mmu_gather. For example the design I ended up with for iommupt
accumulates all the invalidations and all the free-able memory into a
gather then invalidates and frees.

This allows maximizing the tlbi efficiency too. You can't do call_srcu
until you flush the tlb and if you call once per table then you are
also tlb flushing once per table too.

So if the kernel really does want to clear out 512 leaf tables the
optimal implementation is one range tlbi for 512 entries followed by
one call_rcu to free the memory. Hence the gather..

Jason
