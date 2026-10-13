Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D3372B2F;
	Tue, 13 Oct 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856899; cv=none; b=YlM4t0q58LGwa1BIi5o6mngD2luJfXHKcYAo8Sz6j6lrsIYfn00LYNhCTapdAxrbHJSmOfC8XBt60Pq3YMzEhSIddOXEXUGZ/xqDrl7OnHZ5LQiHEI0Cefy14oeyfbK65yHLMfuKYiF0ODkaFs1HJNBMBDo4c/t3G9Pi5VljTPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856899; c=relaxed/simple;
	bh=qD5BRu6JzvSGrOoFHTmszzALfagOJF4o1AbImbC9OeY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KFYpGBoUb/VlqxwI2+X5iwlkWQaAuPmerQlT/BtZdLZiGdPvyazLCgaNCwu3OjYwEF12Z2UzEh4nKyMhAgKDaukrPC1nB49krjStD8PSvOsAZ5dGZVz5DH/i5RR60Edc0R8cGBkJLltDERlaDh22duZBvrHOxLzQYuANH9Li2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XjBIN0xk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XjBIN0xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54DB1F000FF;
	Tue, 13 Oct 2026 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791856898;
	bh=90W+a59SeWDzS2sKdXAfXinvf5qK+MDO1trY3bKDzpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XjBIN0xk63p//9x9QZVkFqR/WBNgSRZUQc3b9MdStWw6XaHSxHKNzGU70UzQlpHwL
	 HITPZx4KQaWEJeFYwDwLYPbHB9IsMya63I5Isz7e3rLS9UqJqthAasqU824G2yks36
	 +tmunTACXhLQa6tluY2VYvKffI/Ki7ax5vyhHPPg=
Date: Mon, 12 Oct 2026 19:01:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 David Hildenbrand <david@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the mm tree
Message-Id: <20261012190137.9734b57074f35e540733b9e3@linux-foundation.org>
In-Reply-To: <as0D2sHzh_UnNF5L@sirena.org.uk>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 16:59:22 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the risc-v tree got a conflict in:
> 
>   arch/riscv/mm/init.c
> 
> between commit:
> 
>   f02f1d1437449 ("riscv/mm: fix hotplug page-table destructor handling")
> 
> from the mm tree and commit:
> 
>   79113093e9dc3 ("riscv: convert pgtable_l4|l5_enabled to inline function")
> 
> from the risc-v tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

> diff --combined arch/riscv/mm/init.c
> index 6f6b04795bb23,e2b738ca90cf3..0000000000000
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c

Well that's ugly.

I'll disable "riscv/mm: fix hotplug page-table destructor handling" for
now to make this go away.

A decent approach would be to add that patch via the riscv tree.  Muchun,
please confirm that this has no dependencies on anything else?

Otherwise I'll leave it disabled and revisit after -rc1.


