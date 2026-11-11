Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405397;
	b=ag/ru9Nay7ylt1LKakvbfpdemitqg5sMNqPEquIRJQ86YevSkoymZEpsJ8Tsl0HyoCI3
	 iYymNirr+JkHLg6aB2HoT1a/zxSaNcjRZ/4ayPUNKCkLgU76gYuLz5uzjUlmflwv4qYCD
	 I/LzRqw5izOiYCvDEZzLrFy8hLA4VqWW7BzXxODZ72zzZrx+4kurJXOJLtqnMI9hySyBe
	 vtMPCSxX3SHmUojUF/GgxjbggCTgfMks3CZf6eDU2aMncQSjhPK874ivcoBlzjo46aw2L
	 DIjqkd2nCZX822CSrxRQQa/CTMLCS+Ymc8DvcMNSKIIIRBLX9rT+5NZc1pJZSsVJmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405397;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5ZprzqBsLH6ZE5J0bCuqoeiq0FzWeb9tyEOoiXRncj8=;
	b=mIeqFfWzrfM91thPOxjKpz5iXxjELpAoCG+LgEXKK3rh+qcU3FGfK2+E8Gp3ip6aAz85
	 Vxn3lOMz095MpijH3c7aENfojFeVsGj05qzNGVFQhsqUsjcvt7PlxIRrbxqQg+4QXhoY5
	 5GlH8tyjRNDWYrQUdmNm0MQvKCIxjEhfjlY83Y35f+ap5b6LgK0zWyOivNOEtT14OVkkq
	 cL79wQo0w44gyX/VIgrzENsonOKhNYcg0rUYHBTVgIhl+36i1pDhiIFXlY0j7PO9FgHfw
	 MWOhZnMVyATpl1wrvrVP3CvMYR5BXLsLMgINeqaXEbdPTQcULNiBLnla+U0L9xWbcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o8Vd0J1f;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D45606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o8Vd0J1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5ZprzqBsLH6ZE5J0bCuqoeiq0FzWeb9tyEOoiXRncj8=; b=o8Vd0J1fHNGNtONDwu8XhXGyhW
	f3oWEFLVw/OX4VYfptAZIMKVenyhGo9cOgQ8eiDB5tcfBJWniGMJh7bOk0C4GzR3kLnqpicte1KJS
	D96IQLW3iiqRft7QDGkjEdOgVeJVL8tORv+nvr7TqFQowtvE121/oE/pC9aQMbjuZFZ3+4Mm8nNta
	PI/w8x+DuOK5RZTlbwcpIZM3mEa65hUmXeAVlXsk0ztc6bnj1HFlAECyK0mHNMRYbTJzQKgv8L+hV
	qi7wFwVoH7Z1vBjb4gUmkttJzM10qu4ByS7gwbNEbMNNXYixUSdwS7VlRyiOlhh+VWczjTQST0P0s
	354W34XA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8oO-0000000AY7Z-0AOg;
	Wed, 11 Nov 2026 13:56:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9A493005AF; Wed, 11 Nov 2026 14:56:26 +0100 (CET)
Date: Wed, 11 Nov 2026 14:56:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david.laight.linux@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com,
	dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
	torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
	riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261111135626.GK2668564@noisy.programming.kicks-ass.net>
References: <20261111132214.2979125-1-usama.arif@linux.dev>
 <20261111132214.2979125-3-usama.arif@linux.dev>
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
In-Reply-To: <20261111132214.2979125-3-usama.arif@linux.dev>

On Wed, Nov 11, 2026 at 05:20:53AM -0800, Usama Arif wrote:
> Since commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
> memory copies"), memcpy() uses REP MOVSB only on FSRM CPUs, so ERMS CPUs
> without FSRM, such as Skylake and Cooper Lake, copy every size with
> the scalar loop. Large copies matter there: in Meta's x86 fleet, about a
> third of the time in memcpy_orig() is btrfs zstd decompression copying
> pages into and out of zstd's buffers.
> 
> Use REP MOVSB from 2048 bytes on ERMS CPUs. On a 1.4 GHz Cooper Lake, an
> aligned, cache-hot 4 KiB memcpy() then takes 66.8% less time (123.3 ns
> instead of 371.6 ns). In a single-vCPU guest, reading a synthetic
> 512 MiB btrfs zstd file takes 14.8% less time (median of five kernel
> pairs). Smaller copies keep the scalar loop: using REP MOVSB from
> 32 bytes made 32/64/128/256-byte copies
> 111.8%/68.0%/63.2%/15.6% slower.
> 
> Prepare the return value and RCX count before the FSRM alternative. On
> FSRM CPUs, REP MOVSB replaces the jump to memcpy_orig(), followed by a
> RET in ordinary text. ITS then selects return handling using the RET's
> execution address.
> 
> For ERMS CPUs, shift the scratch copy of the length in RDX after the
> 32-byte check. RCX already holds the count, so large copies need no
> reload. Copies below 32 bytes skip the check, which is a single NOP
> without ERMS.

So no real objection to these patches from me.

However, it did remind me of something I have on the TODO list for a
rainy afternoon, namely merge memcpy and rep_movs_alternative.

It makes very little sense to me that we have two (divergent) copies of
what is basically the same thing.
