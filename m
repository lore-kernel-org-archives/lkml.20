Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573D2DA749
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017815; cv=none; b=tAKIyWHCK4VsaQ8jlAaGHIAcHK2YiTpgWOLBq4iIBrUJhrc+eSyEdCV86m55UzKNqL4B3Mgj1KSalDgQL/hPjxkgBmOjHgAe20glvNzLplrsmKXl+ymaB5D46jT9ldfVGoGaAneUGCTrpVlf5Pnn/5lLloUlgLdMlq1Ha/QAuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017815; c=relaxed/simple;
	bh=DmqzOPvdAGU1mZLEAMg4+b2UENmpPXkcNULZcZmcEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUSCswG3hzroArH77sd9TsEriuF8Ef5WkOXcdRC1Ijkcv8jTVrfpkLGjR6nNPdBt1C970qbQfHvGYaHEyf8mhOipzIT9SHsoHncbcc5mwIA7/neytneaEOfp49UrdrzFn3eDeLFfHkSFJT2dU3lC2uxKedILc0xOXCQDvTH1AQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q0A3Nz6/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q0A3Nz6/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jeRfXS7iZQ2FkEJ81T5RqxCWmbqtTOTFyVTa1mARMcU=; b=Q0A3Nz6/pla0TSuArKEcesDcHd
	k3WPi/TCrAlGRw64ZbL7aleMDC0Mu7RzDOXIr/sfMsifmDiM11KZD50aS5cximnLL9JJOxngFKG2T
	xhIrBV+ACbCBMsYZkKmipMXZFYQvRPLVwHJ7it7V9sK+vgOO4TEO5ybRBp/Z5ZVttUu9EpHknsEBq
	xKS2IXO+6QjjjghsTifG7dralwLJCCEtrK9kRZFsJMBz6kvsG/kTwU0hUTZYsCu9ryY8n43GKNuXY
	JCvDAP9UufKAEAJcXkT2sZD8VUEAL68ROAG7gNqHy5DKYfSk9dSyNSWVLara76zY8KxYUQnPbyPu9
	yWkShbSw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0L6v-0000000GhcR-3ihs;
	Sat, 29 Aug 2026 15:36:49 +0000
Date: Sat, 29 Aug 2026 16:36:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Message-ID: <apL8kdB0j561wl5G@casper.infradead.org>
References: <20260829100034.423064-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829100034.423064-1-trintaeoitogc@gmail.com>

On Sat, Aug 29, 2026 at 07:00:34AM -0300, Guilherme Giacomo Simoes wrote:
> The race occurs because the reader (__vmf_anon_prepare()) checks
> `vma->anon->vma` without holding the mmap_lock and withou the
> READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
> mmap_lock and updating the pointer, it creates a data race as the two
> access are not properly synchronized.

also this explanation is bogus.  i don't have time to fix it right now.
