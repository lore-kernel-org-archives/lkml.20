Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610103;
	b=PR70qNBfwvG9X2Z7GAwlJf2DV8fxCpR7bZh9myfMix+QSyfsblJxw/F8xG+zFIcqHXP6
	 3XSwLMUtVmMvhh6ji6gWySSPNB/icwlIHiNeeRqpWZ4h16sW9kM6eX2cDHmcbZmxpwBbP
	 txsDCI9vLAZtW6lu/u3fes+isQXfaXXjIK6GzJrfTMsVyGzhS8frQrBN05ixKpgOcBaW4
	 JS+PvIYHotygMjRVY9yD69jjnfbwkrwntNXb6FjcyeRkhp9R286PR6kGsGcmWI1mSwbDs
	 3fVFqHpqCRfoDKlCGrTjHfZ0v52xhhdZ+iGRLZ2Nq1TBj6DXfpOSeR1XRz4vR3R2EhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7ILwAwzu57MKsu2U8qvPn8STc7HTVnKuk72Aio8hCfI=;
	b=LTl9xb03yfxvl55dl3BEDXHQ094ZZ+kAJv4ocT4sz4ZGQnFVIu/ahuiJ9tGZly+vB9De
	 3n5aDn7F304DHOodk6YSaIEG3PAoUqSnZCeTvfAE259aEA5Aq9RvsOdf1YPUwlT5O59Zg
	 DhXB1C+yOYT0DmV/FAB0LxxHLPGj6HnLERjBzJETrwvuOkrKXA+s7PLdp0waK4zHZfIb6
	 Ny18DZfR5aBlkegSoorab/kfrLQ7FCxXHZ9pwQbjtB1KZ0/ML7sggV4LrE2dWnYgKIIZD
	 9QtlE/tQ4+C2uPCpAWWVgyrN5OxK/zHRikyMV+tE2CCJBmm9DAeuee+foPJJkgboRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5G8ABaj;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38560606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38560606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5G8ABaj
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3959243a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610101; x=1794214901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ILwAwzu57MKsu2U8qvPn8STc7HTVnKuk72Aio8hCfI=;
        b=r5G8ABajWTPMobPfIBG5jCancplWK4shOqnFdlG1SNxDmV4pC6Fi9TbofcbNEh7hnc
         kLmnGAyNXh/oR2Oc8CC2q+SL1fiWXczsbQbKZFx2qUflOiHy/G6ylku2B3Z7S/sP7bCx
         k4jA/kv16ueOmycQEu0Pyfwf1iDk2M0hqP1rgVMXlzEzPDrKd0LoRxsmF2WRGIx53uPt
         sjS/FtV14/iTgWBw/Z+fKZ2c9TGTj1GlkgFukI9zLRG8XQtTkC+h0KV+unhWB6qVKAoO
         p/p9Cd9/hfF3UYPWYlZN8f2xtSn0GzvkLPMyit7OyBtFkxuy4onct4YiIareIEYfGsa4
         WmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610101; x=1794214901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ILwAwzu57MKsu2U8qvPn8STc7HTVnKuk72Aio8hCfI=;
        b=yuz+gRVnf3UI5KBe/8JA+M4TDbvysmjTVK+JvmCHTRiCi5hBQ5llWBYTrZojl5uyLd
         xu4/wdo+TWuT4ECZNwlgEaWrLEHOxNdRgSZqJg73uqIqat2fqa9lbNxfUnaEcLXyzyfy
         fws2txyV8TtFqtRyyTeFUo1LsHWrEToybngM23G7c63AiouNZR4OdxKidIrBNOZ8emSa
         TxFmCDJjfsOvWvPx4y5jo2mzbGkE5SE0kzMCMG6s1mzG1UupG4c0OEkQm9dNSCEtPzFI
         BiEs8y36JpQ4CH02+TBxw4BJ2i+gC32TbYvNSTd2OIQ2KC2aj/Yjs16te4GrFq/GX5Tw
         bvuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNlWEN5eHstmj+ybKVxSikGQoeOBjup43MTWE46xZsdvsHdILAykH6NFwj2J2h0p74S7aAyaUyuduzhPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG+ZUxApOvZUo4n/lAsDZIsQZt+rIegQQMieCwkU+Ycnh1QWaW
	4jhsCXPuyhdM574c5ImwnmadNrvILeGfFBYanDb/RaMlheAgLspZ+K/Zrz30kTfb
X-Gm-Gg: AYBFou3usOMh6V8VuYEguPJCXTPbwY+whS/p0Lap7//ZhgzactVDfY/tUr8iATyzViZ
	nyucgyKAYUOhtFjkjjMoujt9Yu6WvY56Qf3hpoMCdW6amB7Ty4GGAIt+q3GE75ZPQxcMaX6eubT
	IwvZj+psO7ARcal3vKqv75mMiyBahcu84rmGlrTzpjVj4SgM8tDAqngBLEz/MMVVRsEm2m0IpUd
	n4nZq1s9gTQuGGSKRPqcv5th3GUG0snMTGiLtWVzso0KM5m7FzJkO3VPHQlp3ndTlJF091r/XFJ
	4TdvTjVTQbhuh7SiaBcZ5IzNJQW26t4V5mzW0jkJCMwzefB+BGJ2ITHbNMWwofZEBTER56S/kQi
	69iepUuExVbkpT82L3vzgY2N/P1GeRRq2hPWyVdaRU4i+7gXJByYAf3PPVq1p1T/X2yv89L3ynb
	TI4RqGKIe3YPvOaPZfu/KeZXutAV1nweBxkD/3eW7atUos23Xqdz9HEYxhg10rZo/sIIDH1sp/H
	1C46yG5rJNgHCpYxQjZcydlIiXMYRK5sld7+K8sCoM8l/WmYzH9/VX6urNURQwGIVMo4OJ3Goz9
	XnZq7Mg6BH0KSbnv+QsJ5nMKQROFm8t9dstp/LMpGAOEzS6uVUULxhOcl5RTHHgpM69u3J72z/0
	E+DQ3ZQ==
X-Received: by 2002:a17:907:9805:b0:c46:723d:600 with SMTP id a640c23a62f3a-c4ca7aa4e06mr708475966b.41.1793610100432;
        Mon, 02 Nov 2026 01:01:40 -0800 (PST)
Received: from ptb-02009389.paris.inria.fr (wifi-pro-83-031.paris.inria.fr. [128.93.83.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm21082461f8f.31.2026.11.02.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:01:39 -0800 (PST)
Date: Mon, 2 Nov 2026 10:01:37 +0100
From: Ella Ma <alansnape3058@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: alansnape3058@gmail.com, cocci@inria.fr, linux-kernel@vger.kernel.org,
	nicolas.palix@imag.fr
Subject: Re: [PATCH v3] coccinelle: free: add a checker for
 `__cleanup(kfree)` usage
Message-ID: <20261102090137.6brrzpq2zohop2il@ptb-02009389.paris.inria.fr>
References: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr>
 <20261007164316.15102-1-alansnape3058@gmail.com>
 <f635d9fd-8dd5-47f-7996-239bc74bd828@inria.fr>
 <20261016135718.ab5322cdyozostuj@ptb-02009389.paris.inria.fr>
 <cd96489d-e980-c4a-9990-7a96e8b31ea@inria.fr>
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
In-Reply-To: <cd96489d-e980-c4a-9990-7a96e8b31ea@inria.fr>

On Mon, Nov 02, 2026 at 12:46:11AM +0100, Julia Lawall wrote:
> 
> 
> On Fri, 16 Oct 2026, Ella Ma wrote:
> 
> > On Wed, Oct 07, 2026 at 08:27:33PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Wed, 7 Oct 2026, Ella Ma wrote:
> > >
> > > > Using __cleanup(kfree) will pass the stack address of the annotated
> > > > local variable to kfree functions. This will lead to invalid
> > > > deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> > > > recently detected.
> > > >
> > > > Signed-off-by: Ella Ma <alansnape3058@gmail.com>
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Add virtual rules `report` and `org` as suggested by Sashiko
> > > > - Remove `kvfree_sensitive` from rule `cleanup` as suggested by Sashiko
> > > > - Add `free_percpu` to rule `free`
> > > > - Add `kfree_const` to rule `cleanup`
> > > >
> > > > Changes in v3:
> > > > - Edit the error messages to clarify the reasons and results
> 
> I applied this, but I changed the first error message to:
> 
> "ERROR: __cleanup({n}) will cause an invalid free: the stack address of
> the annotated variable will be passed to {n}; declare the variable using
> __free({n}) to cause the pointee to be freed"
> 
> The original message made it look like one should use __free when calling
> kfree.

OK. Thank you for the change.

> 
> Furthermore, there is one report in the kernel for this case.  It would be
> worth fixing it or checking whether it is dead code (it's immediately
> under an ifdef).

A patch fixing it has been reviewed by Thomas Huth <thuth@redhat.com> in
https://lore.kernel.org/lkml/ffebbb7b-a4f9-488e-8834-199da3073b96@redhat.com/
Should I reply something to the thread about this new coccinelle report?

ella

> 
> julia
> 
> 
> > > >
> > > >  scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
> > > >  1 file changed, 112 insertions(+)
> > > >  create mode 100644 scripts/coccinelle/free/cleanup-free.cocci
> > > >
> > > > diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
> > > > new file mode 100644
> > > > index 000000000000..48e47ed2186a
> > > > --- /dev/null
> > > > +++ b/scripts/coccinelle/free/cleanup-free.cocci
> > > > @@ -0,0 +1,112 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +///
> > > > +/// Find __cleanup(kfree)
> > > > +/// Using __cleanup(kfree) will pass the stack address of the annotated
> > > > +/// local variable to kfree, causing an invalid free.
> > > > +/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
> > > > +/// Such usage is impossible to be correct.
> > > > +///
> > > > +// Confidence: High
> > > > +// Copyright: (C) 2026 Ella Ma
> > > > +// Options: --no-includes --include-headers
> > > > +
> > > > +virtual report
> > > > +virtual org
> > > > +
> > > > +// Suggesting using __free for the functions with a DEFINE_FREE definition.
> > > > +// Update this list when new DEFINE_FREE definitions are added.
> > > > +@free@
> > > > +attribute name __cleanup;
> > > > +symbol kfree, kfree_sensitive, kvfree, kvfree_atomic, free_percpu;
> > > > +type T;
> > > > +identifier v, n;
> > > > +position p;
> > > > +@@
> > > > +
> > > > +(
> > > > +  T v __cleanup@p(
> > > > +(
> > > > +  n
> > > > +&
> > > > +(
> > > > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > > > +)
> > > > +)
> > > > +  );
> > > > +|
> > > > +  T v __cleanup@p(
> > > > +(
> > > > +  n
> > > > +&
> > > > +(
> > > > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > > > +)
> > > > +)
> > > > +  ) = ...;
> > > > +)
> > > > +
> > > > +@script:python depends on report@
> > > > +p << free.p;
> > > > +n << free.n;
> > > > +@@
> > > > +
> > > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > > > +coccilib.report.print_report(p[0], msg)
> > > > +
> > > > +@script:python depends on org@
> > > > +p << free.p;
> > > > +n << free.n;
> > > > +@@
> > > > +
> > > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > > > +coccilib.org.print_todo(p[0], msg)
> > > > +
> > > > +
> > > > +// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
> > > > +// The following list only contains frequently used functions. Supplement it if
> > > > +// necessary.
> > > > +@cleanup@
> > > > +attribute name __cleanup;
> > > > +symbol vfree, vfree_atomic, kfree_const;
> > > > +type T;
> > > > +identifier v, n;
> > > > +position p;
> > > > +@@
> > > > +
> > > > +(
> > > > +  T v __cleanup@p(
> > > > +(
> > > > +  n
> > > > +&
> > > > +(
> > > > +  vfree \| vfree_atomic \| kfree_const
> > > > +)
> > > > +)
> > > > +  );
> > > > +|
> > > > +  T v __cleanup@p(
> > > > +(
> > > > +  n
> > > > +&
> > > > +(
> > > > +  vfree \| vfree_atomic \| kfree_const
> > > > +)
> > > > +)
> > > > +  ) = ...;
> > > > +)
> > > > +
> > > > +@script:python depends on report@
> > > > +p << cleanup.p;
> > > > +n << cleanup.n;
> > > > +@@
> > > > +
> > > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > > > +coccilib.report.print_report(p[0], msg)
> > >
> > > Hello, this is more words, but is not what I was hoping for.  You explain
> > > the effect, but not the cause.  And to fix the bug with confidence the
> > > reader wants to know the cause.  Here I would have expected something like
> > > "__cleanup usage for a function without a DEFINE_FREE definition. This will cause an invalid free"
> >
> > Do you mean only the second rule needs a refinement, or both rules?
> >
> > ==> __cleanup vs __free, both rules:
> >
> > Using DEFINE_FREE declarer only defines a forwarding function that can
> > be annotated to a local variable via __free attribute. Defining such a
> > function with DEFINE_FREE will not automatically make __cleanup correct.
> > User still need to use __free instead.
> >
> > FYI: __cleanup will pass the stack address to the annotated function
> > directly; while __free will first call the forwarding function defined
> > with DEFINE_FREE, and then the forwarding function will correctly pass
> > the pointee address to the annotated function.
> >
> > ==> Only the second rule:
> >
> > Yes. For the functions without a forwarding function definition, one of
> > the root cause is lacking the definition. But I am not sure whether this
> > semantic patch should suggest adding one.  As these free functions are
> > all those frequently used, perhaps the DEFINE_FREE definition should be
> > added to the corresponding public header files.  Or, do you mean this
> > semantic rule only needs to report this missing, and the users will add
> > them where they think is good?
> >
> > Besides, after adding a definition, the current error message will
> > become misleading, as there are no rules to search for existing
> > DEFINE_FREE definitions in the code base. Do you think it is necessary
> > for this semantic patch to search for the corresponding DEFINE_FREE
> > definitions first and then generate the error message accordingly?
> >
> > I.e.,
> > with DEFINE_FREE:
> > requiring replacing __cleanup with __free.
> > without DEFINE_FREE:
> > reporting missing DEFINE_FREE and also requiring replacing __cleanup
> > with __free.
> >
> > ella
> >
> > >
> > > julia
> > >
> > >
> > > > +
> > > > +@script:python depends on org@
> > > > +p << cleanup.p;
> > > > +n << cleanup.n;
> > > > +@@
> > > > +
> > > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > > > +coccilib.org.print_todo(p[0], msg)
> > > > --
> > > > 2.34.1
> > > >
> > > >
> >
