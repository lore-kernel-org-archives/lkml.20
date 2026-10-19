Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443182;
	b=ide0nlTorZDxyN8hbs4gIcgwEMJ8eaPoBvzGYXay2d+yIImK7fQlF4IIju//NcPqzGlG
	 FhLXv7JlppZ/asnh6c9u0Grt7FREanaoiVMuH8WTqHx3O/pgbta4xwp2K9YkfvzO1coFz
	 O03rqxrC9DdGC0PQzIuH33XolulJM+b7N9AeSdrW9WKL4A0TCOYuhybBBJ7+Ny9iFG7+0
	 oxW2dU2MrcUu8j7GiVagHURWoCMxce751Iq5tPd2b3tu9MhHFK8X3O/CAMOC6vfAafVy/
	 MRI53SPmFtEKeVtqLpyRI9hhD6WevrIsvg8uYVo08g/tOssypUBgtD/m7FTYJvqInbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DKddisKzxLuVQIaXtLpNXNAV8kvVeTeFgFk5M6wbup8=;
	b=mE7Y9s8C3yMwD80P72gebHxs9GihxVz/b3vVeGh01N8e5PJCqRUI8IsIiU4XNppPnYdj
	 Qo+xT0CqJjIsVloJEV4h0wsVttFZ07n1I6U3Qw/jpcJfb6MNJNO3Nv1vnxNjS4ryQSQWj
	 Hv2Pyhny/83Vq+S21e29lA+At2rXuWvoYPVp99KBR1Rum0HcvI/as6AQ5HqNiNncfpQvl
	 ys6RhlJmAbmQj6mRWxCgRDAVELdn/vSYrXPwMlUcUo8Sf65hQBgrZ5WdSSTf3TbzxdFK0
	 rPDh+2Yepf5KsoXVLatgZEp0DaGCvwQByiWFpPjKrP23hFEUEpkYtaY7Cc5NE1i+TOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=siKfqgNV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB0F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=siKfqgNV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so850995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792443180; x=1793047980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKddisKzxLuVQIaXtLpNXNAV8kvVeTeFgFk5M6wbup8=;
        b=siKfqgNV2FfFT3a9umIN7lAM/RdIyTkmtGmIbRykKopdWDkshsB/yYG3sTdM5zI3A/
         sj2pjdXMKMuIybY1F/3DI2OY3k8vljkKCgGAZG2sEmhAGGINfVlZo2LVzOwLFh5JRWGV
         uTk1FfHECRrvfFPpvmWcaKOeJPH/1C5pTNgTrVir4Xlwt6pt/hxouCs4Zbrpr5mtRlIa
         DUGHy5wiWLHS5m3VMxq/EfVnIqFQ1tdZ8ARQ4JD4ZtdNKoOTW0aqoV9+qzOFmM43SLUp
         4R6Efqic4UBFGLP+KzKlIcM7c8YjJkeGnzFa57PQ/SWLW9Nj54cDqifIflVe+MilxujZ
         /eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443180; x=1793047980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKddisKzxLuVQIaXtLpNXNAV8kvVeTeFgFk5M6wbup8=;
        b=QQccBYFq5Ezr46Gvz3lIaW2WhGzgTWaA6RzWR7OP88X3PsQ3UodCMCo7vRqKDZPwK1
         ag+YeelVqqYlCgbWgd79X1nxWY/9oCQ3joOlksv7Ml8T/hM9MIcI0xD288XsZmKMsQQ9
         TXLKiOGy3bfY5LJ5fmLGopMq59Tmz6MX3Zc0T0wGcoE22nrFDROUV0PzJ9Pmf0S05p7m
         ccs546XP5gHntmxuVCAmXWGlPwUXNNo/Orcr6PBzsc6YelBvUr9B+CFGs0DeKsrdvxg5
         p5q9hZURRk1g0wcJJMyiD1ziO5RpLi9fLlhr7snbxOCShciD6JaTLzSe1gjZUPcsttXc
         R6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBycpjE8jN2098q0NcB+WulMl8Id39LDgEZzVSOzYMSmitxQooxr6VOVGvqnkw5eKLLx9yM9OFklXeyZzX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlMsZH7dH3LMxZ6T+n2CmJKlTYemzS9RbHKD5gI9erVNWEju57
	wfPrGWAXBRcsSIUoyKkgzJ2unPkzmKGuoYtfk2zE7qvOF4vwUUcgAhL/
X-Gm-Gg: AYBFou2MJ4TUza+4JVKJxekLh4akM2daCLqA5dHQk5Xqk1APEiJSUQpPfQy3ULlcSMB
	0WlnG/FuC8gJWReMR17LDeN0h9b+Usqiz+Qs6VKTy/GL+/V7cUiIYBE6muhjaQszJjMMeWeYfBu
	78fES2N3pH+ozLTCAeOasy+R/sNW0xWgG+9+C7F7pFob228sjEhibKjxU2h3dzwO5Zzhc1HHbGK
	1NKNYebqvKCCu8gIh7Mai/+kdjFb/6iJEP1hHe/B+uxal5gwZdHmLQr2LBIbSmwVJBr3+MbKQBl
	UITGCtM4loGZEGwSOsAd7aQbhG4QdEYwAGeX76iQXpxaKUlsQUBeSM4hmp9pckMwmTqBj3Yx4AM
	rShoX9iI7vIKNvwiPUkSdlxGIACN+RMfsXipsjSgyB4lPzsUSZz7drUOytqncMNRagvGnYSC7MM
	iWh/hxmdCsdoK9vTr5NC1wBnV5yp2Bouq48rKkNUmP4LjGphpHHX4DLRq6Wzi2AunQnT/3ZAmaU
	SdJxoILMTCtQ7iLM8P46WPvZLbvYtDPqP2ewyZTqksSo0WmSiS69y26dVF553lenzoRWd2eT3RE
	5jE1nPlgEqo/jn4L
X-Received: by 2002:a05:600c:4e8a:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1d7630cf8mr199302945e9.33.1792443179571;
        Mon, 19 Oct 2026 13:52:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c9f301sm16245455e9.2.2026.10.19.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:52:59 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:52:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Garg, Shivank" <shivankg@amd.com>
Cc: "tejavojjala@google.com" <tejavojjala@google.com>, "Rao, Bharata
 Bhasker" <bharata@amd.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "vbabka@kernel.org" <vbabka@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "surenb@google.com"
 <surenb@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nhuhuan@google.com" <nhuhuan@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "liam@infradead.org"
 <liam@infradead.org>, "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
 "bp@alien8.de" <bp@alien8.de>, "mhocko@suse.com" <mhocko@suse.com>,
 "ljs@kernel.org" <ljs@kernel.org>, "rientjes@google.com"
 <rientjes@google.com>, "torvalds@linuxfoundation.org"
 <torvalds@linuxfoundation.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
Message-ID: <20261019215255.17455ebe@pumpkin>
In-Reply-To: <b22a59fa30183e13043e69ee91dfc77eca4d4a26.camel@amd.com>
References: <20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com>
	<20261019131901.7a8fae90@pumpkin>
	<b22a59fa30183e13043e69ee91dfc77eca4d4a26.camel@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 18:54:26 +0000
"Garg, Shivank" <shivankg@amd.com> wrote:

> On Mon, 2026-10-19 at 13:19 +0100, David Laight wrote:
> > On Mon, 19 Oct 2026 10:06:49 +0000
> > Shivank Garg <shivankg@amd.com> wrote:
> >   
> > > folio_mc_copy() copies a folio one page at a time with copy_mc_highpage(),
> > > so a 2MB folio makes 512 separate copy_mc_to_kernel() calls. Each page
> > > pays the startup cost of the string instruction ("REP; MOVSB" on x86
> > > CPUs with ERMS) plus a cond_resched().  
> > 
> > Don't you always want to use 'rep movsq' for these aligned copies (on any
> > cpu anyone cares about).
> > I'm pretty even on some that don't advertise ERMS. 
> > 
> > The fastest a copy loop is ever going to run (on anything but the latest cpu)
> > is one write every clock - so 8 bytes/clock.
> > A 4k page will then take at least 512 clocks.
> > Even an old sandy bridge cpu will (IIRC) copy 32 bytes/clock if the destination
> > is 32 byte aligned (not much later cpu double that for 64byte aligned destinations).
> > So the copy part takes at most 128 clocks.
> > That makes 'rep movsq' faster unless the fixed overhead is in the P4 netburst
> > range.
> > (I was using lfence when I did my performance measurements, it hides
> > the fixed latency of rep.)
> > 
> > I've never measured zen 1-4.
> > 
> > I also suspect the slow part of a 2M copy is all the D-cache misses
> > (especially on the read side).
> > 
> > OTOH the longer copy is likely to be better...
> >   
> 
> Thanks for taking a look and for the detailed explanation.
> 
> In my measurements, 'rep movsb' and 'rep movsq' perform about the
> same for aligned, longer copies.

On Intel cpu it makes absolutely no difference which one you use.
But some of the older zen do handle them differently.

> 
> Since copy_mc_to_kernel() takes an arbitrary length, always using
> 'rep movsq' would mean adding an alignment/length, etc. or adding a
> separate copy_mc_pages() (or something similar) for page-aligned copies.

If you know you are copying aligned buffers it really is better to
have a copy routine that can rely on that fact.
I suspect it is only x86 'rep movsb' implementations that don't really care.
Pretty much all the others are going to have code to check the alignment.

David

> 
> I think that would be worthwhile x86 change on its own, independent of
> this series. Here, I'm not changing the underlying copy mechanism and
> behavior other callers.
>  
> Would it be okay to have hardware specific changes separately?
> 
> 
> Thanks,
> Shivank
> 
> 
> 

