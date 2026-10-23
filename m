Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765721;
	b=ixUOohvyPBvPi5HEK1TbVmJOXefLk7WHqBNgt2125RCrf6Qw4ZTWVymRReNX68u656nU
	 KsTsei+ILtv/X3IXKn9yhBP1y6y6LvIDsvMm7VIgbPSlb/H5bX6D/tOGkH4wn8y3HWqNB
	 5FJeM1j3Hl3fMkKRQXQaOMneNJrJB5EgTqdpaIX5TakArU1Khb8Gq66keMwUfpbNjEeDL
	 LrvkIYhg1eyyf3wor3bZuCZ1eH51gbwOQL8bJtky1gpqBEbdEpO7vxSLkbnfLY/kc1GwZ
	 GGwzBPz2gbQv/0S3UTZZvASuKSp1++bS4JOW26M2ivT46p4T1tRyBX8TSBkN3XasXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765721;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tYNDgS4FomXUNTZJNpkRvBZq74Kpg9AjMcOmrrvyONo=;
	b=rqEw0nokE75VmXSKcjq20hxmupBbl7n7XSgx4XDEkSxODKfpshCvFw6A9b7P4qNVJ710
	 9x6CTiNndw2g/9rYKwZqcsUJ29c+Wyp35Y9c4YsR/p4gIqgkJ6bELDi88csuwnyxyodFG
	 lrOGLeNyf/bleGqbblImYHTqpss1wDGfLB+Q47i7rboFV8GK9wdwuYuNefkYCmKZwLdjI
	 isYvJzU8qfFYvdTrT8YDy7smV53dCaRnt4PWS6OyL9A3n4+WydMJSEvXQwfov+vKTBXh6
	 jyXw9brP4WWjPLzoCwbUKstssCgkSn9ID1G7+UVfx3uvujXiNtr1SkLlzMYWAaIHGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WcT546oA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A91606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WcT546oA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DF81F01825;
	Fri, 23 Oct 2026 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792765720;
	bh=tYNDgS4FomXUNTZJNpkRvBZq74Kpg9AjMcOmrrvyONo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WcT546oAtz2NoyHVdhlcvqJKm4GjbeNvAjEtqDQfOsBT42lUpW2+FtAN4IhqCbXgZ
	 WjNeKIJToUsfoorYVo5RgDVK4gxldbsfrQSlcu7b3gTOZdPotOMt0vFF7IBJgWxQly
	 C9deb4IKsXnplNky9SWj5qd8Ib2+6Z3S+KEMbGz70WSVHa55IFhkwHouI0RRGZ9wF7
	 9ew3rHb5Q93zSwKlsE0IS7gwNRBNIxrMKtHZSlLdeqpZbz0PjQiDBRVCl26FzjWBm5
	 S+paaMUasLNeOpswdgGvM2H6qTBoagPr5/1qfsZ/gcTpbMzxcNHlMRor1wiKZDr6lZ
	 /WGLpNq11xSoA==
Date: Fri, 23 Oct 2026 15:28:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
Message-ID: <attuz_R1tZo6y1fX@gremlin>
References: <20261023023106.515365-1-luizcap@redhat.com>
 <atsWop95CHj6oTSU@gremlin>
 <538f7c6f-3e16-4ab9-9b79-232b34fb4d3e@redhat.com>
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
In-Reply-To: <538f7c6f-3e16-4ab9-9b79-232b34fb4d3e@redhat.com>

On Fri, Oct 23, 2026 at 08:15:17AM -0400, Luiz Capitulino wrote:
>
>
> On 10/23/26 4:18 AM, Lorenzo Stoakes (ARM) wrote:

> > I'll dig in + get back to you.
>
> Thanks Lorenzo, I really appreciate it.

You're welcome!

This report looks valid, essentially a pure expand should be allowed for mixed
mappings (with mremap() having already asserted it is a valid expansion).

Writing a fix now.

--
Cheers, Lorenzo
