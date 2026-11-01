Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576775;
	b=PFFUI7irKs0+agbLeOfMRT1ykyam2lIM8zL0I7BKC8IZAxZXghR2iK5YpDD4mN8rMmJ/
	 gi/Tm9hYxKTPMlkQp/hg3ZyV9RcLUZD1B8z16PbHnQiOBfNIuN9SIqDajDUPQWkeHYW9/
	 dPU4SEab/h5jqkBBVu41dDlyQ6cKyCLBYKF+KhZ+o26epWG6tp3p15/Y4MfWviZP7qSmM
	 kISBUW3Aihkk8+AIwfgU5b64fSeKyDmZteY7fQNMMLDy3/fdHgXM5BuJIZuWjNBulAmma
	 maam0Aqn3UxV7fjYra+v6W1Z7R7Ak1W1smQjiCgZt6Vopoe38aFpLmk0iQ3Q/xSULgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576775;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=8aR/Q5PsF/c9O1qTdyE8liCK5k1Cui/KktdW5caPo2M=;
	b=FEx4w1UxBKUFjV3GIlZmJqfwP683NrAilm2k79HVuVUjtSSGjG35RmAIW3a65tZYXpQK
	 4GL0z0Q4NlDtLE9BS3rKT0Ed2HzassrQx5CsxXgnTgeRqSHw7PsiftyyECAgByh2BMNzJ
	 hcWNqYlTNoq9/SoFYNW8gI9Hb8gZTZ4hTxx1nlVcIkj+pqvx+6J96cd0tWq7EQjzCsnfs
	 ml9oKA+CYppSHzyo4+9uZmBDKIa3PGxu65FMRCtML0TbxEfRhaI69bilMXy1wLJd/dJcW
	 gNZ8fB95Jxde/TZe1Yd4mt1bkJS1swAaNSxhwtrsORAleUEY9s2C398Nd5mvzRKNB7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=rJpaFDt8;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0746606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0746606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=rJpaFDt8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8aR/Q5PsF/c9O1qTdyE8liCK5k1Cui/KktdW5caPo2M=;
  b=rJpaFDt8CBLPZ2EzSZI1WVMTSip4mmcG7Gi7TuCF05cMZyP7WilYhJKm
   HFuBmeEV5ozh3dfQzqxqy+7ephibI4nowq4m/D5Pp0emHQ+mTfMuXPUzD
   y5ZbSS3Txax4vKv5uds4vB32JrG9BF9QlJNmSr0qBQnoLkTYpARM9Lko3
   A=;
X-CSE-ConnectionGUID: MdCRj7cTQXusdfFCArcjZQ==
X-CSE-MsgGUID: TrVOdOn7S8W4EUWF2CuJnw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="303236459"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 00:46:11 +0100
Date: Mon, 2 Nov 2026 00:46:11 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ella Ma <alansnape3058@gmail.com>
cc: cocci@inria.fr, linux-kernel@vger.kernel.org, nicolas.palix@imag.fr
Subject: Re: [PATCH v3] coccinelle: free: add a checker for `__cleanup(kfree)`
 usage
In-Reply-To: <20261016135718.ab5322cdyozostuj@ptb-02009389.paris.inria.fr>
Message-ID: <cd96489d-e980-c4a-9990-7a96e8b31ea@inria.fr>
References: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr> <20261007164316.15102-1-alansnape3058@gmail.com> <f635d9fd-8dd5-47f-7996-239bc74bd828@inria.fr> <20261016135718.ab5322cdyozostuj@ptb-02009389.paris.inria.fr>
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



On Fri, 16 Oct 2026, Ella Ma wrote:

> On Wed, Oct 07, 2026 at 08:27:33PM +0200, Julia Lawall wrote:
> >
> >
> > On Wed, 7 Oct 2026, Ella Ma wrote:
> >
> > > Using __cleanup(kfree) will pass the stack address of the annotated
> > > local variable to kfree functions. This will lead to invalid
> > > deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> > > recently detected.
> > >
> > > Signed-off-by: Ella Ma <alansnape3058@gmail.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Add virtual rules `report` and `org` as suggested by Sashiko
> > > - Remove `kvfree_sensitive` from rule `cleanup` as suggested by Sashiko
> > > - Add `free_percpu` to rule `free`
> > > - Add `kfree_const` to rule `cleanup`
> > >
> > > Changes in v3:
> > > - Edit the error messages to clarify the reasons and results

I applied this, but I changed the first error message to:

"ERROR: __cleanup({n}) will cause an invalid free: the stack address of
the annotated variable will be passed to {n}; declare the variable using
__free({n}) to cause the pointee to be freed"

The original message made it look like one should use __free when calling
kfree.

Furthermore, there is one report in the kernel for this case.  It would be
worth fixing it or checking whether it is dead code (it's immediately
under an ifdef).

julia


> > >
> > >  scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
> > >  1 file changed, 112 insertions(+)
> > >  create mode 100644 scripts/coccinelle/free/cleanup-free.cocci
> > >
> > > diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
> > > new file mode 100644
> > > index 000000000000..48e47ed2186a
> > > --- /dev/null
> > > +++ b/scripts/coccinelle/free/cleanup-free.cocci
> > > @@ -0,0 +1,112 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +///
> > > +/// Find __cleanup(kfree)
> > > +/// Using __cleanup(kfree) will pass the stack address of the annotated
> > > +/// local variable to kfree, causing an invalid free.
> > > +/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
> > > +/// Such usage is impossible to be correct.
> > > +///
> > > +// Confidence: High
> > > +// Copyright: (C) 2026 Ella Ma
> > > +// Options: --no-includes --include-headers
> > > +
> > > +virtual report
> > > +virtual org
> > > +
> > > +// Suggesting using __free for the functions with a DEFINE_FREE definition.
> > > +// Update this list when new DEFINE_FREE definitions are added.
> > > +@free@
> > > +attribute name __cleanup;
> > > +symbol kfree, kfree_sensitive, kvfree, kvfree_atomic, free_percpu;
> > > +type T;
> > > +identifier v, n;
> > > +position p;
> > > +@@
> > > +
> > > +(
> > > +  T v __cleanup@p(
> > > +(
> > > +  n
> > > +&
> > > +(
> > > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > > +)
> > > +)
> > > +  );
> > > +|
> > > +  T v __cleanup@p(
> > > +(
> > > +  n
> > > +&
> > > +(
> > > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > > +)
> > > +)
> > > +  ) = ...;
> > > +)
> > > +
> > > +@script:python depends on report@
> > > +p << free.p;
> > > +n << free.n;
> > > +@@
> > > +
> > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > > +coccilib.report.print_report(p[0], msg)
> > > +
> > > +@script:python depends on org@
> > > +p << free.p;
> > > +n << free.n;
> > > +@@
> > > +
> > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > > +coccilib.org.print_todo(p[0], msg)
> > > +
> > > +
> > > +// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
> > > +// The following list only contains frequently used functions. Supplement it if
> > > +// necessary.
> > > +@cleanup@
> > > +attribute name __cleanup;
> > > +symbol vfree, vfree_atomic, kfree_const;
> > > +type T;
> > > +identifier v, n;
> > > +position p;
> > > +@@
> > > +
> > > +(
> > > +  T v __cleanup@p(
> > > +(
> > > +  n
> > > +&
> > > +(
> > > +  vfree \| vfree_atomic \| kfree_const
> > > +)
> > > +)
> > > +  );
> > > +|
> > > +  T v __cleanup@p(
> > > +(
> > > +  n
> > > +&
> > > +(
> > > +  vfree \| vfree_atomic \| kfree_const
> > > +)
> > > +)
> > > +  ) = ...;
> > > +)
> > > +
> > > +@script:python depends on report@
> > > +p << cleanup.p;
> > > +n << cleanup.n;
> > > +@@
> > > +
> > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > > +coccilib.report.print_report(p[0], msg)
> >
> > Hello, this is more words, but is not what I was hoping for.  You explain
> > the effect, but not the cause.  And to fix the bug with confidence the
> > reader wants to know the cause.  Here I would have expected something like
> > "__cleanup usage for a function without a DEFINE_FREE definition. This will cause an invalid free"
>
> Do you mean only the second rule needs a refinement, or both rules?
>
> ==> __cleanup vs __free, both rules:
>
> Using DEFINE_FREE declarer only defines a forwarding function that can
> be annotated to a local variable via __free attribute. Defining such a
> function with DEFINE_FREE will not automatically make __cleanup correct.
> User still need to use __free instead.
>
> FYI: __cleanup will pass the stack address to the annotated function
> directly; while __free will first call the forwarding function defined
> with DEFINE_FREE, and then the forwarding function will correctly pass
> the pointee address to the annotated function.
>
> ==> Only the second rule:
>
> Yes. For the functions without a forwarding function definition, one of
> the root cause is lacking the definition. But I am not sure whether this
> semantic patch should suggest adding one.  As these free functions are
> all those frequently used, perhaps the DEFINE_FREE definition should be
> added to the corresponding public header files.  Or, do you mean this
> semantic rule only needs to report this missing, and the users will add
> them where they think is good?
>
> Besides, after adding a definition, the current error message will
> become misleading, as there are no rules to search for existing
> DEFINE_FREE definitions in the code base. Do you think it is necessary
> for this semantic patch to search for the corresponding DEFINE_FREE
> definitions first and then generate the error message accordingly?
>
> I.e.,
> with DEFINE_FREE:
> requiring replacing __cleanup with __free.
> without DEFINE_FREE:
> reporting missing DEFINE_FREE and also requiring replacing __cleanup
> with __free.
>
> ella
>
> >
> > julia
> >
> >
> > > +
> > > +@script:python depends on org@
> > > +p << cleanup.p;
> > > +n << cleanup.n;
> > > +@@
> > > +
> > > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > > +coccilib.org.print_todo(p[0], msg)
> > > --
> > > 2.34.1
> > >
> > >
>
