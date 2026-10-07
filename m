Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826E17BED0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339483; cv=pass; b=rLQBKnnBqJ0nNExgZI7ctZMtl4Sf4LcOMjJvzfYCyng3x+EhWzJGOAmQg+shaWB9b//qFCmSgObiyd6sWMUzGeRLWZxzr/w3jGuPcjlryy5Pel1PxOgyO01R9YPbHrmGBlmlwyzYLOk6R30cAJONysXHOWdgeV0M5xS/0aYMO0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339483; c=relaxed/simple;
	bh=VIu9IqjAGNeJ5CxJ1aJYgp/RLiXbBj4etI3szwtdgyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJREHtnV6YJ6TLUXMqKhU++WAwZ5TK997lyatq2MUJMCdIdsdx7UspJttaEuDrVoY0Sm3UpN/Rulu5VJEF+e1PBqHmZrwa52n5ReezBdV817TCQERqAZQ3GNLRpEGX2JCwrXmk2yohNT+aDz0vrQ4anzbLW3tr8X42rTB2AH+ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VofLcoyb; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VofLcoyb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso13324575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 19:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791339480; cv=none;
        d=google.com; s=arc-20260327;
        b=ciRRoyVX62H1Puzm85ow5Jd8kR9u3XEq7lOYMR7R1aBSzKfCgiucgQZoTTf5HFDOp0
         mO2+2IwSTsCnqJPDPUznz9xLb/IWVhj0moafnsCYn78MrFWmWDdINdWpjXaHBo6FJuE2
         n9w7Au/3mcWa1b798Cgiw18WYVS5Tabs8YO2LtU6sq77yNpSV6ukypwhxfGkWSaekrgs
         ngLf2GEVFJwPmWWk6eQMVTC5LfEAtu4F15v6ssticj/j0kF5kfWDrwOCtcPqYv4mHpeD
         nOT9iGqSYrHLgzGMugr8BOmdoxtQ2PLtG9oICuWD3zI94VdrdcX3tz2D9V0Cq+iBtQOG
         a7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXQll5yKwAszJJzdt/Gj5gkr0StYojizfaIPuW3tx5I=;
        fh=KlDLwIhYu9UVtrQIYmeVE/ISsJIkTC8+c+YeKK8FnkM=;
        b=Kz1K5t2C9LbH7C5AkC1j0TCkzG+au4KMUZzjNk/op+WA1OXz7/f77JBJZQXsxT7gZp
         s5/pzsUdjGINtfI33OXTMmbC1g3A+UUhtRp44SfkRUcyUDELuyWSLcm0nJSM+pytN0TV
         7fuCSl5YzF0ZCNjgOSbKBsLmpf0uq0vcqjtvuZs0l2fbsr3aGCNozUW975LMTnjCtgzF
         wIoFOasF+8wo8FU8R7bBnG0mmy0PVd9PJ04TRcFHggv56Hv5GrnB4LEWnekdagVNKvZg
         r7by9pq+ZkoMJfRKBJY/FzHr8UtVlLqmn5UF9bEDXkW3t0/JTgvezKH6xIeUSVTPyRfM
         IQZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791339480; x=1791944280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXQll5yKwAszJJzdt/Gj5gkr0StYojizfaIPuW3tx5I=;
        b=VofLcoybAjP8tljDjf4cOLqPDw3Olb8lls7AxLzkbmAmq337C0Fwn3glCmVFCxV/R2
         2O5HkTC6wWAto/92mXbeagm0Mxe+0YQqkof2eLKij0s4I7S3Na5ramc/JJ0PC8/14hvb
         9eXVuTYtDSFsh+0cz7zVyrpXwaYgkVN5n4nW20TOi9NqcYLtDPxJjeMdgMa65KaSWbPX
         OuH66l3liaHcoUJK65tjyym43pFC27su8itKQx3iLA2920d7DveZ6Iw9XY9eyAbNNqhu
         LG1vpIVy4Wk11rZvoCM+iLWIKGPdS1a1ck927312PFY/a/FZCZfN4cYRhMqHpD+nmCOF
         Pq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791339480; x=1791944280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXQll5yKwAszJJzdt/Gj5gkr0StYojizfaIPuW3tx5I=;
        b=ECT53+7LENBr656kcofdOd5XkQm1Y412jcddwi2RwSNBl7a0wwkBf4Zl0JIsogNpDA
         4vJrHSGNRiZS6X9CYisw1Yr6Vsrd+dASn9bwaw5fvs0Rybu+saN7odk1MSX7JMZBT9CL
         eKFw8zyAviYD2bfi6+q7hx544Yrjw0qhS8UT80oq1uFnzAC0HC0UnaULRCw7+cXzDz75
         87divYjH5Pw6WKVuN8wz0g3QoMla/HAVa/XzwdsezVuQ0jwdG/rqgYWASWukMjZgfpY+
         AhYeRu39xLaHG0xAw/T8R4TvoxD/mbQ/9vnfNTKBn1Ti1kv5LLyDmzduZCsGpotJItZS
         teig==
X-Forwarded-Encrypted: i=1; AKwUvBwCcmZW1wCDtmg9Zt+DBdrLfrwKJcBso0ETXXIKNbPj61TAGyLFgPAo4ORsmWg5DUzuQrGKpj0Enh1IvsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l+Ugt/o92fYh/0iFyMQ7z4lTCTHo5axQ8p1UXxHYjLcbVOFzAV
	zDo3K5J17Fiqjly3xlMffx+v7Y+ArV8B9SZ4ZlWr3gOsLhHOHy4RBvuuB2TFZknnEzM22aq6iIW
	RbBclSUrytWKfoR8NTXqm6cQCHnX79ps=
X-Gm-Gg: AYBFou0ezcsNhaBCg4upQl+8bNqp4obSCMdRGNDgxSchNehY+FhIvjCIpJPeIm9IZ6M
	YatNfS/Q9JhWW7/vHIC5VFvBjewTRkxYdmKv++4pTdZICWji16XO1G8R/9n4MLIEcNMCVTJFYDt
	hUG4li/xFC240L6CwHd8x3rCNqMViBi9aBB+m1g+Glc8VeUAxdHk5Q78XRU9CxCbapnedy9fEdx
	Sh41nl7ojsBP/wkT5SX/EJQPr7G+5peYReQIjXTJlUmKCA5I90BH/PhC+XxXS2IZU9YHmL3oOBo
	wXMADvKCvcbCfLNRrmoxisMwH/f6+ubdlkLEKtHczkrQvaTd0zMIo+tfDw==
X-Received: by 2002:a05:600c:19cd:b0:4a0:62d:4424 with SMTP id
 5b1f17b1804b1-4a180311245mr8251415e9.8.1791339479862; Tue, 06 Oct 2026
 19:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002151757.3605081-1-kunwu.chan@gmail.com>
 <20261002151757.3605081-2-kunwu.chan@gmail.com> <asO4ey3X6JK0IzlY@localhost.localdomain>
In-Reply-To: <asO4ey3X6JK0IzlY@localhost.localdomain>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 7 Oct 2026 10:17:48 +0800
X-Gm-Features: AclHuK-tHY6YeG6Ua4SUi-gCDEbMeVVo3yQ2NB_FnxZ7-i_GlcPQuqP0AElsGHs
Message-ID: <CAN_Opa8NjWEpz1wbsBEmyCQ=q3nqrUaYiVa-nbsiOEXPdAwWRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()
To: Frederic Weisbecker <frederic@kernel.org>
Cc: arnd@arndb.de, anna-maria@linutronix.de, mingo@kernel.org, tglx@kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 10:47=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> Le Fri, Oct 02, 2026 at 11:17:55PM +0800, Kunwu Chan a =C3=A9crit :
> > Per-CPU variables are sometimes accessed from different execution
> > contexts on the same CPU, typically task context and an interrupt or
> > NMI handler.
> >
> > A plain READ_ONCE() or WRITE_ONCE() marks such an access as an
> > intentional race but does not express where the racing accesses are
> > expected to come from. This distinction allows concurrency tools such
> > as KCSAN to tell an intentional same-CPU context race apart from an
> > access that may race across CPUs.
> >
> > Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() to identify accesses
> > to a per-CPU variable which are intended to race only with accesses
> > from other execution contexts on the same CPU. For now, they are
> > simple wrappers around READ_ONCE() and WRITE_ONCE(), so generated code
> > and tool behaviour are unchanged.
>
> But there is a plan to handle that with KSCAN, right?
>
> If so:
>
> Acked-by: Frederic Weisbecker <frederic@kernel.org>
>

Hi Frederic,

Yes, that's the plan. Thanks for the Ack!

Best,
Kunwu

> Thanks.
>
>
> >
> > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  include/asm-generic/rwonce.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.=
h
> > index 52b969c7cef9..4d4e009a4489 100644
> > --- a/include/asm-generic/rwonce.h
> > +++ b/include/asm-generic/rwonce.h
> > @@ -61,6 +61,17 @@ do {                                                =
                       \
> >       __WRITE_ONCE(x, val);                                           \
> >  } while (0)
> >
> > +/*
> > + * {READ,WRITE}_ONCE_THIS_CPU() identify accesses to a per-CPU variabl=
e
> > + * which are intended to race only with accesses from other execution
> > + * contexts on the same CPU, e.g. task and interrupt context.
> > + *
> > + * For now, these are simple wrappers around READ_ONCE() and
> > + * WRITE_ONCE().
> > + */
> > +#define READ_ONCE_THIS_CPU(x)                READ_ONCE(x)
> > +#define WRITE_ONCE_THIS_CPU(x, val)  WRITE_ONCE(x, val)
> > +
> >  static __no_sanitize_or_inline
> >  unsigned long __read_once_word_nocheck(const void *addr)
> >  {
> > --
> > 2.43.0
> >
>
> --
> Frederic Weisbecker
> SUSE Labs
