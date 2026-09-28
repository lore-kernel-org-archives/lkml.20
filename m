Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E404F96D8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630621; cv=none; b=sXUbCjGuDVZWoX97WacdUH/25uu2OcA8IBimK7+yoGbmt9BPNDaLkgoERmo6vFhF2QejFRBjpTf0ogTH4Q4RuJFMww7hJ3yagwH3601wXDlAg5lmoxkOG4i/vVihSN1DIWa2GHL8pp3+5MDukHMzlH3KaWhb+FUXHavAv6srm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630621; c=relaxed/simple;
	bh=epEewSnMsd/C5Byows8lzPpFxI0hXhpnRATirts8nX8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WuqmrSKvR+dF7WugDJXtXAuOAmdvpAcBqEWJ55We4cN2p9NgX0bPwJFU2bSDJFAPQ9VQRsL4IfWCQPYKHaQGgEptNqoplYnfSyX6dRwLElN76xcutbjDIVggnhwZUEOpkA+0sWeYIv1kxFFQ2pABEPCZjgRAx4tcGR817v9ejsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tympz9vR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tympz9vR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4128B1F000FF;
	Mon, 28 Sep 2026 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790630619;
	bh=KPXcX47PeB1/G6r5SAEJKfY/PNsjCyhNbzJxA3X7IOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tympz9vREG90jSuR1uLWwOYu5BU59FiLtaT5xoUSBjDXz70SZGi1X5GKxqotL2I7N
	 JyTEFv6nN0POCW9XSg1uw4XQ3HCvIO4sVyB8lGUdU/6AaOM5MRzbJs7crXu3hHdAfn
	 0EuL7q7/UE7aD5OQYNy/F5kBhS//slN6gz32DA5Q=
Date: Mon, 28 Sep 2026 14:23:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmytro Koziuk <dmytrokoziuk68@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
Message-Id: <20260928142338.1c2c2ec80631bf27d2967a4d@linux-foundation.org>
In-Reply-To: <CAO63FDUNVzMss61+TUYCWSezo1K1PL94iAdt=kNUoWepU=nhMw@mail.gmail.com>
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
	<20260915153542.3b9afbd00f7e6cea87a3350b@linux-foundation.org>
	<CAO63FDVJaRzwE_z4-Yd6Z8fZNEGQyx=YbeFatBN30d9X8SYLtw@mail.gmail.com>
	<CAO63FDUNVzMss61+TUYCWSezo1K1PL94iAdt=kNUoWepU=nhMw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 19:55:22 +0300 Dmytro Koziuk <dmytrokoziuk68@gmail.com> wrote:

> Hi Andrew,
> 
> Just a gentle ping on this. Is there anything else I should address?

I was awaiting maintainer review before taking any action.

Folks, could you please take a look at these memory-leak fixes?

> Thanks,
> Dima
> 
> ср, 16 сент. 2026 г. в 10:22, Dmytro Koziuk <dmytrokoziuk68@gmail.com>:
> >
> > >  AI review might have a found a couple of issues - please check?
> >
> > I don't think the patch needs to be changed for these issues. For
> > normal iounmap(), the
> > caller must ensure that the mapping is no longer in use. Also,
> > the x86 implementation keeps the virtual range reserved until after
> > kmsan_iounmap_page_range() returns and its TLB flush completes.
> >
> > For the kmsan_ioremap_page_range() error path, the mapping has not yet
> > been returned to the caller. Cleanup and the TLB flush complete before
> > the reserved virtual range is released.
> >
> >
> > ср, 16 сент. 2026 г. в 01:35, Andrew Morton <akpm@linux-foundation.org>:
> > >
> > > On Tue, 15 Sep 2026 19:02:06 +0300 Dima Koziuk <dmytrokoziuk68@gmail.com> wrote:
> > >
> > > > While studying the code, I noticed that kmsan_iounmap_page_range() calls
> > > > __vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-page
> > > > loop, and does the same for origin. The first iteration therefore unmaps
> > > > the entire metadata range, removing the PTEs for later pages before the
> > > > loop can recover their backing pages.
> > >
> > > Thanks.
> > >
> > > AI review might have a found a couple of issues - please check?
> > >
> > > https://sashiko.dev/#/patchset/20260915160207.2952-1-dmytrokoziuk68@gmail.com
