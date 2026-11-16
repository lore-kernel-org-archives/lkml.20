Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859309;
	b=NFHuDSRxx9Ft63KPRt5zEJOA210Hq7BsINwZSoZL7j2CJRdbLfj+idQy1EfSqegPuLIm
	 K6wQK90bhgXOaAOXH75Xp2HHiworpxWJ1Ni8jb8xqn94cPYLf6Vsp8JT5YjHrXWGQvPJm
	 kRfCdxe4JFGaEgbdoJl3Jw4djw6+0ZBEcTbVcGr/hCrkE98W4boyDN9iVgTei+QLjoFPq
	 bnlwB2wMsp+IS7OxEnXgWGxRp0ztD0CcNpYkLrazGuruM7PFEbM0i0oxb9DWQTxjbPPtN
	 Esyr9RaSjoM0QAzKdrtjsGs0923F7OtmpD2Da3DOcln6W6nxFeIW2oi51clV9U6XSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859309;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BYQI4k2YlNhinRECPNarKD969t6u+tmjOYMybhqbmkw=;
	b=X+T5oOsnq7a8x1i0CFgEffZgy4gdtTysa6CVyvX3DEzerJCL/jA+YJfbHqd8PJ09aSO6
	 XbLTrVcERbP0pQZTfjrTuHhkNKbR5lxZZf7qfbMOM8o4n/CF9PFPohQeXBIVmVg0i751n
	 BUcb2tG2Lqkz8rJFIM02L9b+IOT+GJktKtLZqClJOXNhPtegLX51hprl6YSXh7oQ5Kaed
	 4N8Pbz8M0JRoIzyYHh7YjNdCsjrc2fL6SSwIYxhjNzgNSp+KQ3XgWfyyC0Wyks6cFXuaV
	 zMD+zBqN6qExcZ9esF6ErPgtNELeny6TFUhGal7EdAcvFu6tAN3MdFZ+eVDmcT6tA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=l93QHocs;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE95606A31C;
	Mon, 16 Nov 2026 20:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=l93QHocs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794859306; bh=BYQI4k2YlNhinRECPNarKD969t6u+tmjOYMybhqbmkw=;
	h=From:Message-ID:From;
	b=l93QHocsQSWskrLVdkeS9aDHS7mw+f4rfV11pvb4wJoG1CUtOqKPnZehlvZwhJND9
	 6UddRLR8DrxwO20MgiZ8NnGya9LsrPIlAWF/f4bO3RFdRZ/B4YkUHoKSI9kuKj8qaZ
	 Wyqk9IB7zYMc/VbGtwWduLOl/jyE6xPaDLpCaOz4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 81C02C094A;
	Mon, 16 Nov 2026 21:01:46 +0100 (CET)
Date: Mon, 16 Nov 2026 21:01:46 +0100
From: Willy Tarreau <w@1wt.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <avthKmdjADe0-P3M@1wt.eu>
References: <20261116191436.188098-1-sashal@kernel.org>
 <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
 <20261116195205.335116-1-sashal@kernel.org>
 <20261116115859.0e89464677cf765681cf35d7@linux-foundation.org>
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
In-Reply-To: <20261116115859.0e89464677cf765681cf35d7@linux-foundation.org>

On Mon, Nov 16, 2026 at 11:58:59AM -0800, Andrew Morton wrote:
> On Mon, 16 Nov 2026 14:52:05 -0500 Sasha Levin <sashal@kernel.org> wrote:
> 
> > 
> > Willy pointed out the other side of this: ask an LLM for the worst case
> > and it'll stack up every config option, module and USB emulator needed
> > to get there, while for backports you also want to know whether
> > innocent users are affected at all.
> > 
> > I think both fit if we ask about the two cases separately. Something
> > like this on top?
> > 
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -63,14 +63,26 @@ from upstream, so include anything that could help route your change
> >  downstream: provoking circumstances, excerpts from dmesg, crash
> >  descriptions, performance regressions, latency spikes, lockups, etc.
> >  
> > -For a bug fix, this means saying what the bug does to a running system:
> > -the worst that a user can see, and what it takes to trigger it.  An
> > -account of what the code does wrong is not a substitute, as it leaves
> > -every reader to work the consequences out again.  If the bug was found
> > -by review or by a tool and has never been seen to happen, say so.  If
> > -it has no effect that a user could notice, say that too.  Maintainers
> > -and the people looking after stable trees decide from this whether the
> > -fix needs to be backported.
> > +For a bug fix, this means saying what the bug does to a running system.
> > +An account of what the code does wrong is not a substitute, as it leaves
> > +every reader to work the consequences out again.  Cover two cases:
> > +
> > +- Users who are not looking for the bug.  Say what a normal workload is
> > +  likely to run into, and separately what the worst case is and what it
> > +  takes to get there: configuration, hardware, privileges, timing.  If
> > +  the bug was found by review or by a tool and has never been seen to
> > +  happen, say so.  If it has no effect that a user could notice, say
> > +  that too.
> > +
> > +- Someone triggering the bug on purpose.  Say whether an unprivileged
> > +  user could do it and what that would take.  A race that no normal
> > +  workload loses can still be won by a program that retries it on every
> > +  CPU for an hour.  If that makes the bug a vulnerability under
> > +  Documentation/process/threat-model.rst, follow
> > +  Documentation/process/security-bugs.rst.
> > +
> > +Maintainers and the people looking after stable trees decide from this
> > +whether the fix needs to be backported.
> >  
> >  Quantify optimizations and trade-offs.  If you claim improvements in
> >  performance, memory consumption, stack footprint, or binary size,
> > 
> > If that works for both of you I'll fold it into a v2.
> 
> Looks good, thanks.  Still
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Of course we don't have to get this perfect.  Close enough is good
> enough.  Deploy it, observe effects, fine-tune later.

Agreed, looks great to me as well.

Reviewed-by: Willy Tarreau <w@1wt.eu>

Willy
