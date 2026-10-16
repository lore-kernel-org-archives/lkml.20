Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A347DD64
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159044; cv=none; b=kBCJ3ETOfGk/khtdMKesxxYDfN3P5kR6JuDkG9OfMuYa4Emkesy95mvCsil0LknD4flz543UHOeAaEWCFfx7cgpm/Or6iluvNlw21aLaHGoJNfDO8Ea17APau3FVvVTME4W/UxPCWBIGSJN2xE7wmS8BMX4QZJpy9OvLx5upEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159044; c=relaxed/simple;
	bh=S7X1mMDwx723lVqSZVdRuT2D932pXIMIiHueG/CDdG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfd5IiHmM0foGGpcN6/cNquliAnTuIOEfRF3AthmqSnWqoZD5zycWxo3xqNSs7BA7FhTV2WldTg97OxzFwcKNp5a/vsgKXAjlRHiIEYKhr1qErKZdoskqSqXaz6YpnRzY7iZrs47f7pHozQraDlDJ3EI4OGx2kmR1dGrXOi3rjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwnZvJ7U; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwnZvJ7U"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c263415982eso834067966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792159041; x=1792763841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uM/uqb6jB5bPusJ8VZ1C6mfq3AmMpsh982OmnP2N20Q=;
        b=DwnZvJ7U6iW0NFiiKVIjyjglbPFx7A41WWxb7vyCVioNUWrHeutIm0WoqRDukoVXT1
         If7mrbiF+3DMZ0yb0CzKc+8rR1GWdvIixcLjUhyiIF+W+tDhI20ED7eQCN/UlbSc8U/I
         XO2hKIAiNzLNV/4EBStlP7yRitc5+sybsbOycAWGMmpkharAjN305m/u0akNc9BGUtvb
         Kr1ADUC2sUdKQ5/1hPAKfl2TTz82tdhT0YmSwsgVeNvkamwcW1Fzm4Pi0lMifPDYoBQG
         dLSrksjeUqBzZV5YaFS5YaoIm0AtYuZC1a9hRKUBXy+8HLhhwVJcYVVSQgeDOF/5Yoy6
         S4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159041; x=1792763841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM/uqb6jB5bPusJ8VZ1C6mfq3AmMpsh982OmnP2N20Q=;
        b=CwpMxIvoZrGcv/wq54IXw0gLG5CVDZayuPJUSMzqhpUkypIXa6bhNqTtADEXQ0wSmd
         bOw56BeTfZM76btsdABUDIe7r3SIeApWwoZYuDj1nBiz3puzD0is/v2XkpfQDTjHr/F8
         biSbQzV0SFj/99RKy2Gy9KLumEQ1Lpre2kIoH8G8n2SXwZHHr2wLIgg42Xb/DGjkpdMj
         E9i45PspWroGllQaIqK4abqWnGkkZpHnWsM1sP8xmWNV+HkLTD/nyX92b1tMWYohmpQr
         1Mtdg1RutTVE8Insz68v5vxm/l/Gm2Fif0WtjnIoOxXAFBB0lccpVdNmzMm4v8RKWDRd
         phKw==
X-Forwarded-Encrypted: i=1; AKwUvBxbyxmVpHzWhEmc/fAvQ9Y9aY/IN3VnCBP+FLD1W9xsVPf32hwM3D3dF4OL/iSqj4mcThfP+CS+1hzLlps=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf/KftEizit/gJ2iwQMbDvJmTKtcPOWJeDNLPPyOHAL/opl6mq
	JgxYAmGOZngmzTZvC45gu2Va56qkTY6x5lvi41LDyM7AvXvLTKoYxTZ6Bu80lYRL
X-Gm-Gg: AYBFou1Oawu4qegVAqrzv4VzwnlSLsUQ3ync1XYLWBKeauQw3L9kaXz/qQp7RjstDc5
	a5DDxKUKpl4dCmm+jo75/7vrKgwdq/SRFsP3s6tgzlyAPrcRtyMGMMc1Zc7PFSp2d7mZck8297j
	I7hORs4qmP0XDV6NDzD5fEfGicd0WWlFMB/6Z+pdUAfbXR1UsZqwTL0UOAXw6QIkPGiRHnDbmiB
	96VCY/Wrq9vP7vo3IiNtj2KWuTFwF3cscAj7YM2mbvWc+4vUw2lbjmbkPglKac8vhN235f7nO2H
	QsK2YM+xJO+DchmZiTSIqw1/Z5I2PbSh0TBG9tkkssDPeEgfdPkclH8taZTbw36mzlIfvA/+xkF
	bp3KUGCTNVWEzM2L95/jVAMXDI5D/3iAjpfPo/DYVyAx4wsdGED0cnDqXnVCQlOR3pcQzEWAtPw
	3Rg3iWoWsDWyO5+4hXFxJytAJqLEZopM40yZnFr+aXS0a7JG5+CbE4OMXRKDBVCwCJkBL7QSNLX
	e3lJZqdnQ2JMvf1w7k1/X7Ub9asEYro2HXEH6UiKzfcVl1mXed3nA==
X-Received: by 2002:a17:907:3f18:b0:c41:735b:968b with SMTP id a640c23a62f3a-c41735bb4b3mr39888566b.3.1792159040829;
        Fri, 16 Oct 2026 06:57:20 -0700 (PDT)
Received: from ptb-02009389.paris.inria.fr (pd956db4d.dip0.t-ipconnect.de. [217.86.219.77])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c1282sm72704866b.63.2026.10.16.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:57:20 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:57:18 +0200
From: Ella Ma <alansnape3058@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org, nicolas.palix@imag.fr
Subject: Re: [PATCH v3] coccinelle: free: add a checker for
 `__cleanup(kfree)` usage
Message-ID: <20261016135718.ab5322cdyozostuj@ptb-02009389.paris.inria.fr>
References: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr>
 <20261007164316.15102-1-alansnape3058@gmail.com>
 <f635d9fd-8dd5-47f-7996-239bc74bd828@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f635d9fd-8dd5-47f-7996-239bc74bd828@inria.fr>

On Wed, Oct 07, 2026 at 08:27:33PM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 7 Oct 2026, Ella Ma wrote:
> 
> > Using __cleanup(kfree) will pass the stack address of the annotated
> > local variable to kfree functions. This will lead to invalid
> > deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> > recently detected.
> >
> > Signed-off-by: Ella Ma <alansnape3058@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Add virtual rules `report` and `org` as suggested by Sashiko
> > - Remove `kvfree_sensitive` from rule `cleanup` as suggested by Sashiko
> > - Add `free_percpu` to rule `free`
> > - Add `kfree_const` to rule `cleanup`
> >
> > Changes in v3:
> > - Edit the error messages to clarify the reasons and results
> >
> >  scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 scripts/coccinelle/free/cleanup-free.cocci
> >
> > diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
> > new file mode 100644
> > index 000000000000..48e47ed2186a
> > --- /dev/null
> > +++ b/scripts/coccinelle/free/cleanup-free.cocci
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +///
> > +/// Find __cleanup(kfree)
> > +/// Using __cleanup(kfree) will pass the stack address of the annotated
> > +/// local variable to kfree, causing an invalid free.
> > +/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
> > +/// Such usage is impossible to be correct.
> > +///
> > +// Confidence: High
> > +// Copyright: (C) 2026 Ella Ma
> > +// Options: --no-includes --include-headers
> > +
> > +virtual report
> > +virtual org
> > +
> > +// Suggesting using __free for the functions with a DEFINE_FREE definition.
> > +// Update this list when new DEFINE_FREE definitions are added.
> > +@free@
> > +attribute name __cleanup;
> > +symbol kfree, kfree_sensitive, kvfree, kvfree_atomic, free_percpu;
> > +type T;
> > +identifier v, n;
> > +position p;
> > +@@
> > +
> > +(
> > +  T v __cleanup@p(
> > +(
> > +  n
> > +&
> > +(
> > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > +)
> > +)
> > +  );
> > +|
> > +  T v __cleanup@p(
> > +(
> > +  n
> > +&
> > +(
> > +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> > +)
> > +)
> > +  ) = ...;
> > +)
> > +
> > +@script:python depends on report@
> > +p << free.p;
> > +n << free.n;
> > +@@
> > +
> > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > +coccilib.report.print_report(p[0], msg)
> > +
> > +@script:python depends on org@
> > +p << free.p;
> > +n << free.n;
> > +@@
> > +
> > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> > +coccilib.org.print_todo(p[0], msg)
> > +
> > +
> > +// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
> > +// The following list only contains frequently used functions. Supplement it if
> > +// necessary.
> > +@cleanup@
> > +attribute name __cleanup;
> > +symbol vfree, vfree_atomic, kfree_const;
> > +type T;
> > +identifier v, n;
> > +position p;
> > +@@
> > +
> > +(
> > +  T v __cleanup@p(
> > +(
> > +  n
> > +&
> > +(
> > +  vfree \| vfree_atomic \| kfree_const
> > +)
> > +)
> > +  );
> > +|
> > +  T v __cleanup@p(
> > +(
> > +  n
> > +&
> > +(
> > +  vfree \| vfree_atomic \| kfree_const
> > +)
> > +)
> > +  ) = ...;
> > +)
> > +
> > +@script:python depends on report@
> > +p << cleanup.p;
> > +n << cleanup.n;
> > +@@
> > +
> > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > +coccilib.report.print_report(p[0], msg)
> 
> Hello, this is more words, but is not what I was hoping for.  You explain
> the effect, but not the cause.  And to fix the bug with confidence the
> reader wants to know the cause.  Here I would have expected something like
> "__cleanup usage for a function without a DEFINE_FREE definition. This will cause an invalid free"

Do you mean only the second rule needs a refinement, or both rules?

==> __cleanup vs __free, both rules:

Using DEFINE_FREE declarer only defines a forwarding function that can
be annotated to a local variable via __free attribute. Defining such a
function with DEFINE_FREE will not automatically make __cleanup correct.
User still need to use __free instead.

FYI: __cleanup will pass the stack address to the annotated function
directly; while __free will first call the forwarding function defined
with DEFINE_FREE, and then the forwarding function will correctly pass
the pointee address to the annotated function.

==> Only the second rule:

Yes. For the functions without a forwarding function definition, one of
the root cause is lacking the definition. But I am not sure whether this
semantic patch should suggest adding one.  As these free functions are
all those frequently used, perhaps the DEFINE_FREE definition should be
added to the corresponding public header files.  Or, do you mean this
semantic rule only needs to report this missing, and the users will add
them where they think is good?

Besides, after adding a definition, the current error message will
become misleading, as there are no rules to search for existing
DEFINE_FREE definitions in the code base. Do you think it is necessary
for this semantic patch to search for the corresponding DEFINE_FREE
definitions first and then generate the error message accordingly?

I.e.,
with DEFINE_FREE:
requiring replacing __cleanup with __free.
without DEFINE_FREE:
reporting missing DEFINE_FREE and also requiring replacing __cleanup
with __free.

ella

> 
> julia
> 
> 
> > +
> > +@script:python depends on org@
> > +p << cleanup.p;
> > +n << cleanup.n;
> > +@@
> > +
> > +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> > +coccilib.org.print_todo(p[0], msg)
> > --
> > 2.34.1
> >
> >
