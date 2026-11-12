Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507725;
	b=2tkyAiajSt8D+af0T0delbAKopp+m2+3DxBj7S7h2MH1s177cApFwztulN1lfBuueCBQ
	 0G5J2pPA5rIny4JxheSvImlXlgNr2OFKd8WW3Q7wLxP022OGVLQlQMRkcFFAyVEyZtpi5
	 JumcvABkHHXGqfJFq0Mwa5qKLWb/j8TrS4Y7ad7ZUx4YGkE5rLCcehTxC6sdWe79+bK8o
	 W3k4Ke471k+jC82S3W92DMicwJueStOqSf6ma5xGmzm0w49/6yGwRYJkmvIDZNsT1xiwP
	 GlGel1PGEFXpXXPEWTM//Y275F3tsULkGAGYxkARWgmYLONSbhuyEAdLPqnAX9ZO7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
	b=eTKlL/gJEU43ydRvl1n4KgT8cv5WLUt8jD5dS+AzpzBK9QYB+2OrpbJZYRiRnC9CCljU
	 7X4kCmae57UXbxUGFbWJDtjQJoLF9mp2NRFH9C4808PgumYcTh9VWDEkqpkGNyOV4schZ
	 QUML2kvwRjIsDrpfTy0g5lLi4Mjsa+XT6gy3M2DTiUHEQngW3JpuJH6mkfG0pHt7o80ul
	 tFLxOIZwtyM7GmRHr97UQCBP9SNvQUvP4a44lMyH9g3UrLQal5MTHZ2mbNhyOY3ev5yYU
	 37meOzs5rQcawcyt+tfqYp2Ge+P5q99kTlZgr0YrwX4qZoHLa4ZEKRH2hd5gUDRH9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e+Fu5t0w;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB0606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCB0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e+Fu5t0w
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46509ab0149so60191fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794507723; x=1795112523; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
        b=e+Fu5t0wQU/zqG3zMaP0dIhN10Fv0XsJiWYtR+kmFemhiVnwSgWH69gnd+sVSms2dr
         +zV0RzMuP8v9E9n6uz1OZXptheMpHQWozcGws+r58DJc1lc9wckLdaxzEshISrJkR7ZG
         2tuZR4PDgGp7P++qpuNyedALlzvC0XlQle605w92KYNfuOJ4oq3a6n8qTnbtqtLd+0/1
         /SXXon+J7ZYXflap70qN5CCLqlDGlamI1d6jkt72PkE+GeFVW2+q1wjjjp8DCqnHLx5c
         KuNQ/OgdfDMbP3a3dZy9Q7ggQ6rW7PV9EH1QKALzeOjnEDaTKmHfcGEpb24UhsSjPSgD
         EsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507723; x=1795112523;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
        b=WzQ2k9YlTTt7udsl59YM5K4BDGyg6bU5mc7YSEyj/l0Tw0YR+7zrkMUAc+pW9TEjvC
         /k/D2DFEMGHatq6lodQ/YX8LjZfODZXP7xY7rL9bd1NlD7mgnAfUWDlheYnrnlzpcXfq
         4tcy4KlmkhTdGZT1zbii2jf5NPBB6v4PIFa1+XhoVuvg02ox7ucyXUMvNjNFQ61OrOVs
         ZTZB/gmCmXEGBEfAY5ZVpmSs3Svjr1IrNGxdTgJ+gsNhQEWxlg81WNq6oPv/jY7lBe8V
         XH+NojcNUuf7EtJab9/grWCtZbf8OPDCgW+FiHjn5cZHnUKCn8wS1NkykUN7Ze+nQwJL
         0TwQ==
X-Forwarded-Encrypted: i=1; AL+hErEz+oD5Ho7whmjv6iCg4d5t6I8rjvToujwTUvNJ0NaTADQM3hI+dtuxpUs8CmM7wQVe8mPk1uPcAyWsWsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IBWZGY608Tu2SedSMP9ZnLvsYbTuGxNsK/xH2aGmtAhZkDodF
	pNe8rovjIJxjB1JaRyxboTZlRIuZgeJKornZR8NOLyWe0r5a6dupj2kVP58vQS7Y+d+9WHvmSYS
	W9iAdchy5qIyL+GAssZnSduXHwg==
X-Received: from iohf17-n2.prod.google.com ([2002:a05:6602:a5d1:20b0:9c7:6dd9:edb5])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:6687:b0:4a7:d759:9b8a with SMTP id 586e51a60fabf-4afdf7a6881mr466138fac.53.1794507722962;
 Thu, 12 Nov 2026 10:22:02 -0800 (PST)
Date: Thu, 12 Nov 2026 10:22:02 -0800
In-Reply-To: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260914223212.i.829-kees@kernel.org> <20260914223219.901347-2-kees@kernel.org>
 <20261112004039.GA523044@killaraus.ideasonboard.com> <avWNCC3_Ff0knO6J@devuan>
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
 <202611120905.DF88D9849@keescook> <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
Message-ID: <avYBdaCYclTyX9pX@google.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
From: Justin Stitt <justinstitt@google.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"

Hi,

On Thu, Nov 12, 2026 at 09:23:18AM -0800, Linus Torvalds wrote:
> On Thu, 12 Nov 2026 at 09:09, Kees Cook <kees@kernel.org> wrote:
> >
> > One thing Justin was poking at was adding a "strict" mode to typedef
> 
> Honestly, the sparse setup is superior. It does that 'strict' thing
> (except it calls it 'nocast') _and_ it has 'bitwise' that is a nocast
> that also disallows non-bit type checks (which is *very* useful for
> things like "this is a big-endian value: you can only do bitwise
> checks against other big-endian values).


Cool. I wasn't super familiar with how sparse handled `nocast` and
`bitwise` but your insights led me to look into it deeper. I'll take
these learnings over to clang when I get around to implementing strict
types :)

> 
> So the compiler addition may be worth it, but  even the "poking at" is
> weaker than what sparse already does.

Right but I suppose the benefit is that compiler-enforced things are
caught vastly more often than sparse-enforced things. Plus, like I said
above, maybe I can aim to reach relative feature parity with sparse's
own analysis on this type of stuff.

FYI, there's some prior design with `strong` typedefs [1] in the form of
a wg14 proposal. I've also been keeping a close eye on that stuff as it
develops because it's essentially strict/distinct types with a different
name.

[1]: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3320.htm

Justin
