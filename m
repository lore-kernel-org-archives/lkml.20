Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421194;
	b=Fi/MnrNq3/DIPblnRSDlUcIlE1BmjwixYnrtMf4QlCXHSquZEoWou9vtxOwRPsXm01IZ
	 AvheWU0G/Z7sc/TGuggqrQzIMVXxzRn3NdFFZhu3ciFewGFgsPEu/PK2xIuH+MnvbBk7X
	 eyAK406Jc07BK6hCnu9+cYDKXi/dtlq/6+aE1llcAof0O/luV3J6mXK9pO6azHyPJour2
	 mtDGue0KJd0HnWDnTV3zJutHFGv+e6pWnykEkqrG0R15ymEgzXStX63e+ee6b94d8E75D
	 fjdIBqvq63IDMghjtcFsYDVYvH29t0gaeER2g8uN5u/N6CH7U3sAQo1BAjLhz8U2XDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tArUjAi7RyNIs44mDcDEd1/onmpGhyZQLsYyXwL8Y3g=;
	b=q93U5r7RM4kXG62xCDPjYVv7wFLYLRmzxKO5Q18YmMq6cDHqcLh1RXIsWOPpPCTcBta0
	 1Vnz7Wc1MC1Ar7ClsSWbZD7DZgFGTLKPzQT+ag1D1Bx5kCv3NfIf/i1r2oNsCogZZRq5p
	 38PCETzxxLzdGvBeYd5Q/pUiLI4IQfZyI0vs3AbcQxD+0dsf7k1WSfc22y0aZ7jp67E4u
	 JEqUsLuSkd072CMV6BsTgmlCdcFLVjIHELlBMAYBHNAv9nTWSNRjk8mqg1pVyLbUWxqvm
	 wgxvm41NaOzk9unxBOmKqT1lAPLoj4ToUhhLy4RY3xUIj99UQuDfcStIxJllyUN5R4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WOpYCKsG;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WOpYCKsG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tArUjAi7RyNIs44mDcDEd1/onmpGhyZQLsYyXwL8Y3g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793421190; v=1; x=1794025990;
 b=WOpYCKsGnPscv077a/P4k2fR3lPgouuI+BzM+t/LdCmOSmvzoxrN6BHTRM5GHtAheLl6VqR5
 5kpihFHNEoZQW5tqjixUpNOiMYVYKK2sUBoaaAZL45eKH4ldTR53gs5YB+BaJ5qqFKmnmLZE1o/
 tLqWAqPKTqoad2/KCk1KcPK0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ea78379c5260a3be;
	Sat, 31 Oct 2026 04:33:09 +0000
X-Mizu-Trace-ID: ea78379c5260a3be
X-Migadu-Flow: FLOW_OUT
Date: Sat, 31 Oct 2026 04:33:06 +0000
From: Jose Fernandez <jose.fernandez@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Krystian Kaniewski <krystianmkaniewski@gmail.com>
Subject: Re: [PATCH] mm/filemap: stop fault-around when the walk steps back
Message-ID: <20261031-jf-mm-filemap-reply-r2-7d4c1e9ab350@linux.dev>
References: <20261028-jf-mm-filemap-map-pages-lower-bound-v1-1-0bf126e876d4@linux.dev>
 <0a1ad7d2-ff0e-4248-8f03-2a64a9134aae@kernel.org>
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
In-Reply-To: <0a1ad7d2-ff0e-4248-8f03-2a64a9134aae@kernel.org>

On Thu, Oct 29, 2026 David Hildenbrand (Arm) wrote:
> Only read or also write? I assume only read.

Both. KASAN only reports the read, but once vmf->pte has stepped
outside the page table the loop will also call set_pte_range() on
that slot if it reads as pte_none(), so a stray write is possible
too. I'll call that out in the v2 changelog.

> Sounds like we want a Fixes: tag and Cc: stable? :)

Yes, v2 will carry both.

- Jose
