Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700FDCA4E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344378; cv=none; b=CmomabDj6sLEoc8O0FKJR2YIrqPUekV3469myMJ7MWlQJe7h095G2VGZCU4cafygqbcXUCGtzxhykQf10Ho2kpkqzKWuVsQRlxwdO5o8jPOjHr3ytg3mPWmnGBRupe91v46fDxot47qFgh4otTXVXtD3HVKbkqBLPY/NZLXPmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344378; c=relaxed/simple;
	bh=YNBzGpsY4TRZ868D2eOsuLhaYXWg3HI0W+ATKOGHXws=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dczAfc1steeEU3hEwXPe5QmA+2gQDuav+XwCv0VsfcWY8e1+QUv3G505YcFVkqSLRs3KwVaXJoPgWg57EjZaU0jeeVx5vUCEd7j05/rSh2FMgMOWXlmE9Kl2IkmoVg8y7qo7ZEIv03JsCb4ta+Yp3Jr4FTZUoTRnXadnoGKY180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2YxWVSJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2YxWVSJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8031F00893;
	Mon, 14 Sep 2026 00:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789344376;
	bh=Su0hEBl/tTccQuFuMZxbSxyFv5/u7rTwJgD0ngyxkSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2YxWVSJX8NhuiWELeDbfOUuu5obbl4dKht9GLFyCSfUz9F04D/TFWsa3zSQhLwzYF
	 IKoCvasLZA0NTdRJtQmuVJApSy+iH6JvpjS04cV2wNFs2axYNzJUcepA/qYKZTjF+C
	 tmQEx77XilPD0GPVcJ9krLROV0RJADLo2RuUOK1A=
Date: Sun, 13 Sep 2026 17:06:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: andrew+netdev@lunn.ch, apopple@nvidia.com, artem.kuzin@huawei.com,
 baolin.wang@linux.alibaba.com, david@kernel.org, Liam.Howlett@oracle.com,
 edumazet@google.com, harry.yoo@oracle.com, hramamurthy@google.com,
 ivgorbunov@me.com, joshwash@google.com, kirill@shutemov.name,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
 torvalds@linuxfoundation.org, vbabka@suse.cz, willy@infradead.org,
 yuzhao@google.com, ziy@nvidia.com
Subject: Re: [PATCH v6 0/3] mm: improve folio refcount scalability
Message-Id: <20260913170615.cd43348e579d8dde5d556fb8@linux-foundation.org>
In-Reply-To: <cover.1789239015.git.ilya.gladyshev@linux.dev>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 22:50:07 +0300 Ilya Gladyshev <ilya.gladyshev@linux.dev> wrote:

> From: Gladyshev Ilya <ilya.gladyshev@linux.dev>
> 
> Recap
> -----
> 
> This patchset addresses a scalability issue of a folio's add_unless() operation,
> noticeable during contended IO reads from the same page [folio_try_get()]. The
> main idea is to replace CAS loop with optimistic increment (and deal with
> failure later). This requires splitting refcount into counter and separate
> "dead/frozen" bit.
> 
> To allow for such modification, this patchset also slightly refactors page_ref
> API, consolidating all implementation logic inside mm headers. For more
> information, check individual commit messages. The original performance issue
> and previous attempts by other people can be found in [1][2].
> 
> Performance
> -----------
> 
> To my regret, I don't have any access to high-core CPUs that I can
> benchmark on, and a 12 vcpu laptop isn't really a scalability test. So,
> here I can only paste my previous measurements on Linux 6.15. To be fair,
> none of the related code paths really changed, so I don't expect any changes in the
> numbers here.

From a quick eyeballing, this patchset seems to provide performance
gains which are similar to Kiryl's ill-fated "mm/filemap: Implement
fast short reads" [2].  Is that accurate?

> [1]: https://lore.kernel.org/linux-mm/CAHk-=wj00-nGmXEkxY=-=Z_qP6kiGUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/
> [2]: https://lore.kernel.org/linux-mm/20251017141536.577466-1-kirill@shutemov.name/
> [3]: https://lore.kernel.org/all/aqAIFV4nOGPbWiDS@thinkstation/

