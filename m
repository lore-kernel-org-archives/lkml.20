Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBA47206F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926818; cv=none; b=tSTGZJlyRelVE4FuUPKhQG/g9UUzKhXDUFTEulmoWaZJtmJm6XRbRk7GLSLcORrcKgjZ96lHo1+V0osOsqy5Ll1DS4KYGMsOa5lqnft4NjD4KZoBzVvRizzRGYQ1kR+xhGe0igbWcFuRWWe8liusvzcFXKxrmO5tzVIphuIbqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926818; c=relaxed/simple;
	bh=sZCBoepaXGep8DXKy1TmsJ8XRqlFxxn1MFwlhw9HP5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1sKKqIwqsfqTZxJk9yUAqdZiwgr4mKEz34v6ga/jgIDaBd2cpF8rZgbN2HvpqY2+/yjo3AjoUMX4cHo0SnWaMGwlXrUBsGvIakPuTN8HwLtFRzWdLNAfGAxdpEXJKwC/JT28/pfJ3yRNRGzFO/RC2DmZVOrFLFyE2pZ392S57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fo2zU4PE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fo2zU4PE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so295496a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791926814; x=1792531614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GzEeHLHpLUAjss0Bc0f6712VJU1Ix+vhwimhrdH+AU=;
        b=fo2zU4PEJCn+gRGbUnLTXrTUqWT4CUba5dKqeILMv/MDVoyUrkRq5y60GeESO9Y1GZ
         8K4b1QTLh4NWJrqTGVOT25LVeOMTFEvy86y3zV4gSDiQ6JFFAaV86ttgIC5xTIfGeaX7
         S7TfoAHg5zrWmM0vWKqcimaCTB0kjLNF6QR44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926814; x=1792531614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8GzEeHLHpLUAjss0Bc0f6712VJU1Ix+vhwimhrdH+AU=;
        b=nFZBl2+kIxpQC1BupHgx3v2f0x814i9rBOBfDWzF2+mePb580A9TvYBQtno7dbJOgD
         0G5P64C2BTiq86V9gIkopz/HbIqGORPhfs9og9TEJkPeObspLsN5xdx0TW8HHwoiJUoC
         OSon0LPPaVVRl5Q9s4T1xJU4/UQ/vDJNBVEyjGSO/iGS8+j1G7zGz4S2ataYLKqdIRJs
         begkvURwIylEcO7kXUozhkkSd4UWLkA8FrC0gDPhSP7bSCHRM7eVTbci+j47HmuYaXfE
         wygQE9pKzmmEVPDg66WQPJmUeCaYAsaMAocHFduBfMpEHWSMEaFzkZ1QTX9h6IpmApC4
         +ViA==
X-Forwarded-Encrypted: i=1; AKwUvBxlcIBch53jsOpOU9DbcVt5cDtPy0h5wX31D8fE90A8s25+2aWG+vMKHy2SvSlEOjJ8Yar3gjImw9qf0MA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWcyOD0FVxyKrW5ux2tZaQriqeCZFYaB0wdRckPvkzK2iinPql
	UvuKsMfpAhoiidoOaoihs6lmwRa6kcHUEYzJFiZy1PK+MukzhWzmXbrlDwLtkw5Y6/3ocu027Hp
	ChaRY9DU=
X-Gm-Gg: AYBFou2pXO0+JVJ+SxfZnnlYfyNlzecJ2ERTcSliMY9iafKXGUf5My5TTl2vIGaYrMv
	Md1y+pjUyRmsYB869+stKdYfnhWWDiERAqyd0mEQfcAO6jJE05NyR3lwDg444xP+gYCSkek6E+z
	+39gr5hT3a0Qo0bNOaSZRoG1Ae62A8QAniWRsLcC2d4C0D3WrFHFhHVS1nNo+kglcKCS47MyXCp
	+rz5OH9Ki0hPy2jiteWHwvlev532JRyjA7oRYAFOBCn4wqnP8wLR6DOyumMWbQ5L+8Wu7P94Zdv
	tV1nF7mYfX95QAV0GO9aqj3NHbQoNWuzAeftfJ/1+sd8rC+8vXnwpCP0EHsoIovHCwLHYeNlM6m
	3ey4RvyQp4lyDc1ZeMbZf1r0JDdQB4hqkiVVz8SSX9ZrpVhodTKSFaz0L1xIPTbsP/QQdNIb0DT
	oKyJqocJ03iEJ2fah1/6r/940foErPkUlrZMxZHGO4DoTBOpFQJy6hNhZEG6oLe+kzhUbD0f9qr
	L+1EWmN1yYxeTYd35ylGjapvG+k3F58atgRrYmVTayd2a9DwRAS3LGW/CXz
X-Received: by 2002:a17:907:7f90:b0:c2e:3124:e9c0 with SMTP id a640c23a62f3a-c31a9b0ad3amr1297428566b.17.1791926813949;
        Tue, 13 Oct 2026 14:26:53 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm639153566b.3.2026.10.13.14.26.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:26:53 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2a4e013a44so61968166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOIap87oL/aSY6uJGDF/294U0oEKcDSldVnrUGAcgMEdvhIGYYnFPOLQjuy9i3zbYCztqnjR1j+ffO1VM=@vger.kernel.org
X-Received: by 2002:a17:907:6d17:b0:c2e:4627:285c with SMTP id
 a640c23a62f3a-c31a9d14aadmr1321776166b.21.1791926813105; Tue, 13 Oct 2026
 14:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6ckC9NJVB8JBuV@casper.infradead.org>
In-Reply-To: <as6ckC9NJVB8JBuV@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 14:26:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHMFdA9CE4qu7W9vUh=CBrH5w9RMjf2kx=U5BJobrrZA@mail.gmail.com>
X-Gm-Features: AclHuK8M1AfgFef6tEhvDZuFcuNwYe9MGQmI8EMTOiu9NNmYmP3zZYe2xiwpZO4
Message-ID: <CAHk-=wiHMFdA9CE4qu7W9vUh=CBrH5w9RMjf2kx=U5BJobrrZA@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Matthew Wilcox <willy@infradead.org>
Cc: David Hildenbrand <david@kernel.org>, Kiryl Shutsemau <kirill@shutemov.name>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 14:03, Matthew Wilcox <willy@infradead.org> wrote:
>
> I don't like the PG_rcu_free flag.  I hope we're guaranteed that folios
> in the process of being freed by RCU will not be mapped into userspace.
> That means we can use PGTY_rcu instead, where there is no shortage of
> available types.

I don't see how we could ever map a page into user space *while* it's
in the process of being free'd by RCU.

But no, I don't think we can use the PGTY_xyz flags, because while
they won't be mapped into user space during the actual RCU freeing
period, they *would* be marked for being free'd long before that.
Including, very much, while being mmap'ed into user space.

IOW, the trivial way to do it is to mmap a file, and then doin regular
enough regular 'read()' calls on the pages that they get marked as
hot. End result: folio marked as PG_rcu_free while still being mapped.
The RCU freeing itself obviously won't *happen* until after the page
has been unmapped, but the flag needs to be there before.

> The workload that Kiryl identified (truncating/holepunching folios
> from files) is not the normal way we free folios from the page cache
> so while we need to accommodate it, it's not what we shuld optimise for.

I wouldn't cal;l the current case optimized for that. It was the
simplest test-case for quickly removing a lot of pages from the page
cache, and as such it's the *worst* case in many ways.

> Most page cache folios get freed through reclaim.  I started sketching
> out a new state (I was going to call them "ghost folios") when I realised
> I was basically reinventing the inactive list.  So maybe we should make
> folios on the inactive list immediately freeable as long as one RCU
> generation has passed?

Honestly, I don't think it works. Or rather, you can *force* it to
work, but it won't ever be a good solution. For the simple reason that
you still need to handle this whole "immediate free" case by hole
punching etc.

Hole punching itself may not be the common case - but 'truncate()'
actually *will* be the common case in some situations. It's very easy
to trigger.

So you try to make the different cases (truncate vs reclaim) have
different rules, but I think you will only be making up special cases
and hurting yourself in the process.

End result: I'd put that solidly in the "Doctor, doctor, it hurts when
I punch myself in the face" problem space. The solution is "Don't do
that then", not to try to look for other solutions.

Also, honestly, by now it's been two and a half years of this.

So by now I'd also go: I have a patch series. It's clean. It's ten
patches, each of them cleanly separated, half of them *tiny*, and none
of them more than 150 lines of code. It works.

If you have alternative approaches, I think it's "Show me the
money^Hcode" time, not handwavy "maybe we could do xyz" time.

                Linus
