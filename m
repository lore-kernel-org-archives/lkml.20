Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CCD4AB3C1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087521; cv=pass; b=ZWd/JqWI20OeCO7ye4nNCZCi4PZuuOJatTmr+hp7zLejQFduG/l9DRZ9kbuWvB+akq7Oq9zlETbBgAA8UN5kjsbCRx+g8x3ahs4bt+L4RzmKlVuC7YipDvVvk0EFgpUK6rmrnXRriExeQ65o6Sjdz3vRyFfA5ixVV4J7sFHuLMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087521; c=relaxed/simple;
	bh=9qqZFCxNvH9lQuYn8TifWIOPbxzX+/pJtiEqloKnb/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWRwGKMgQwuqD4SVkkQBpuFTM3ba4K3SJOxjDY0jf3evFY0BMnKtASL5unOwkXgvHU68QdbKRMK8ij49HybPWy2a2rlCOlxI3Ukm+nlH0FDqh6RwJMsI/lMaa+jUVLdiK0hBGOomEByqPoSwt3NiUtwpeSbNMuigreaAeUKhzUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N9486xIi; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N9486xIi"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c4818e4165so259442137.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792087516; cv=none;
        d=google.com; s=arc-20260327;
        b=bTk3LyJBSEPGwep4opzsBy9F9+Y3R+5SM0NuUf/rly01KIjHfr0ajwjVredwITzuXX
         CjY/LiUURvkN3HAsNvL5zKN4YKvZpfXBaghsK4TjbtAp+m1OdOfqih7BbfQWEE1cgVVi
         s9Zwas3W9IlcGcLAXa39SPWli5bs7wOYgJ17ueFNH4yc14zrvbrYyQKU5JKAQrJS10mY
         rBSOWtyjPZym2vc0z+BGDI8yDZgwrMgesgZjzmK2WPnJEALGCvaQgmhFRlSbxQwEgY6C
         p6uYlfFKW569uYZo9rhXlD++x+hH4WEqrt6/5wA7T6f1BQZHpQMtiuhej0aDD8bL3g5s
         8N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M5pLMAaw/NhUBZQOOoKqfbkfYTSk+h3K5UqvT2yaGdI=;
        fh=j1cpdASjU1CvYww0/85wjK9QvyeHfunu2FCJZhp+s4Q=;
        b=DVqu999b476Xi8Bl53W+cNmLp/QrZqoTcwiKoop2fPzqOMOUERob4Hx5KEvG+gNW5A
         q/7H3/abWK4mpbNSUlEX7SFYDEIMKU2gu8AHBW6YLji9ChReoestV9dEk6jgbpWfKePc
         5OS+EoJowL+3TWN4C2sbTxySO0pXePn2Tgt8XNYyGnM+9TWexvQMV/zI6GBLLwBlgtfF
         YFHCMzKmrySVLXcBICKQKu5fvKT44mw6euwd51X1e/GuGkIJvFK+/IxleSdRhAUZOPje
         m59D4szP1wQQmEY2plL3geJ9qBhha6WtZD6FYAmWIpxyTh/P5k1XQLLic7CnEvju6ozS
         zDRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792087516; x=1792692316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M5pLMAaw/NhUBZQOOoKqfbkfYTSk+h3K5UqvT2yaGdI=;
        b=N9486xIifrrI86RsrrjAYSYTfy1eFv7P93rJouLRDAe9u74QuQsxGhIG1oxXsRwy0u
         Y3s5D5RanuCAYGKsu2fyEeEd6HQoxAzpVlLReWeAZ4mF9pQ4KHuvuIUbLceI7Pj4j1lV
         ydHQmPgRZRBC4s/Q0rVOart6Rwp3LrD07w/+2CtIObbmXFQf+IyAjIfUCF/E+EIuEjq8
         5hWwUx3hZpmbUEAffJ210qJwmTJA85mW97rs2Y/O8owRMTEsfbTjEgvoDRzVPRwo/o3s
         WfQnkljZfs1aVDVZmOwzsQy3jIxCBQ4udgFAOFN+ZqP6JrXdkjTfxyrF5pK2jPvXVZ8S
         vqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792087516; x=1792692316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5pLMAaw/NhUBZQOOoKqfbkfYTSk+h3K5UqvT2yaGdI=;
        b=jmhXzEqU1PQVXFZkFUuNPauS6hHhLW7UTq8sNA6d7r34W585NaXBY8/jnErKb3EYYQ
         B6r4nAmiVKH0YmGOcH34s3asIJkHvNXERmaIgh37HGwCzLFflVVQQEIY6neEFdADdTRR
         JPwZkS7UIn7tGpnIDcJ5N5DlOV1WOKTamMLfRBw2GBNemlgU4fH7SnhrF3MTD4veHPJu
         7YfF+zYkRq7eRXX7dK0wgd7g/i1nmTCDOYdsKYq+KbB7ISTCDZmIwMuZsMAlpMEbgAjJ
         5QstxAdiCMAf//GraiQXlBfdABjhDZqTZ2Q4k0XqT9ds81x5hE2YvycCNL7y50t+SUA1
         tqCg==
X-Forwarded-Encrypted: i=1; AKwUvBzL8IH/IEyRYOvyj4lNqLqxVRiFAwWisnN4fHATFYqnBQL4NbT9TRHoKNlebVetUZ/AbbSl1zuFlDZopgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeBgrmjghB4Uo8Ehh+boMUNjI7BFrC3KObswsTmXe+QUg48OWq
	K7w5ng+Rs4sCXOLhhwEPjuaU0fM9G23M8wQo3cg3UoyE/q+VLBRMXa5uAcAsPGnMRM9TdWN8jnM
	c2GS+ya8+iL5WwGrNulEduxUFv8u5SMVtqVU4zsY=
X-Gm-Gg: AYBFou3H1jmVQRg5YKAWnO6UVKNVymuR/wQHMglYnNjbvO0UMfPYOrgJrRwKkZsj4VL
	VoQ0EO6Z2G/UIAh5GvgkW4XE1AlpwTGee1Rc012m0l1ekM76Eu5Ikv9Ny5HSktIIyrrqDaTKNY6
	UIPcWlPUNfsdbEXtWWvB1BidzzBetcr6Tef0h5zqH1lY8B8RajUhYNwaW19ZS8I29SquGihMjcI
	A8MJ4QEBNgshNHIVSWD0sXjqQULfkxwxaTkk5IdC/41NgpAyxF+/uH/HnVCS/moFMhWDgRWamtg
	20t32bquMmllLftPFu4btYijwqQZYxPh5tp1EgsKDFUHlDwuQ9ctsiJIs7ROMLXjtLQQeIjIijo
	Ew3pauLoYqyX7cCQVfVBpmD14mjpcqMC1FOiSco/ZcYSTgGYAJtCo
X-Received: by 2002:a05:6102:258a:20b0:7cb:be5a:c62b with SMTP id
 ada2fe7eead31-7cc182ac610mr231069137.43.1792087515155; Thu, 15 Oct 2026
 11:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012205919.4012405-1-morbo@google.com> <20261013203146.387344-1-morbo@google.com>
 <20261014133805.47afdb0b@pumpkin> <CAGG=3QUZna+bi-_nmJh-1aWBBtuURbexQczXCNt0R+jDSb1NMQ@mail.gmail.com>
 <20261015110004.6f77ea67@pumpkin>
In-Reply-To: <20261015110004.6f77ea67@pumpkin>
From: Bill Wendling <morbo@google.com>
Date: Thu, 15 Oct 2026 11:04:59 -0700
X-Gm-Features: AclHuK83OVpzmxSg0Z9qbNHGxanTGTt-eP7LKmMT42qkw4H_LA4iLcps9DKtQbA
Message-ID: <CAGG=3QXiykQb+BWtegfe=NDy8e+VsgbY0uRf=Hc=LMuwFxi_-A@mail.gmail.com>
Subject: Re: [PATCH v2] overflow: Match arithmetic in both parts of __builtin_choose_expr
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:00=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
> On Wed, 14 Oct 2026 13:39:03 -0700
> Bill Wendling <morbo@google.com> wrote:
>
> > On Wed, Oct 14, 2026 at 5:38=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > > On Tue, 13 Oct 2026 20:31:46 +0000
> > > Bill Wendling <morbo@google.com> wrote:
> > >
> > > > The two parts of '__builtin_choose_expr()' had different arithmetic
> > > > expressions. This patch corrects it so that both parts calculate:
> > > >
> > > >   COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)
> > > >
> > > > In practice, '__must_be_array' is meant to assert if 'MEMBER' isn't=
 an
> > > > array and return '0' otherwise. However, symmetry is less prone to
> > > > subtle errors (and far more satisfying).
> > > >
> > > > Signed-off-by: Bill Wendling <morbo@google.com>
> > > > ---
> > > > v2: Don't use 'size_add', which just adds more complicated macro cr=
uft to the
> > > >     expression. Instead, just adjust the parentheses.
> > > > ---
> > > >  include/linux/overflow.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> > > > index a8cb6319b4fb..d0f04436343e 100644
> > > > --- a/include/linux/overflow.h
> > > > +++ b/include/linux/overflow.h
> > > > @@ -418,7 +418,7 @@ static __always_inline size_t __must_check size=
_sub(size_t minuend, size_t subtr
> > > >  #define flex_array_size(p, member, count)                         =
   \
> > > >       __builtin_choose_expr(__is_constexpr(count),                 =
   \
> > > >               (count) * sizeof(*(p)->member) + __must_be_array((p)-=
>member),  \
> > > > -             size_mul(count, sizeof(*(p)->member) + __must_be_arra=
y((p)->member)))
> > > > +             size_mul(count, sizeof(*(p)->member)) + __must_be_arr=
ay((p)->member))
> > >
> > > Why does this use __builtin_choose_expr().
> > > The types of the two expressions are the same so it might as well use=
 ?:
> > >
> > It's to emit only one of the expressions rather than both. If the
> > 'count' is a constant expression, then it's possible for the compiler
> > to perform the calculation without having to hold onto the "false"
> > path of the ternary operator. So much more efficient in the long-run.
>
> I doubt it.
> Even with __builtin_choose_expr() the compile has to do most of the work
> for compiling the 'false' path.
> If you use ?: then you can also use the much simpler __builtin_constant_p=
()
> and possibly pick up cases where it is only known to be constant later.

In both scenarios the compiler is meant to do the majority of the
work, so I don't care about the compiler doing more work, only that
the work it does results in better code. First,
__builtin_constant_p(n) won't catch as many uses as __is_constexpr(n).
With the ternary operator, the compiler will generate code for both
sides and the predicate, which adds a needless if-then branch to the
CFG. Yes, that will get simplified, but again it's not a benefit over
__builtin_choose_expr(). In the simplest cases, the compilers (both
GCC and Clang) can decide which branch to take in the front-end.
That's possible with the ternary operator, but care needs to be taken
due to possible side-effects. Also, Clang performs far fewer of these
kinds of code transformations in the front-end. For instance, GCC will
perform some inlining in the front-end, making it easier for it to
catch __builtin_constant_p() uses that Clang has to delay.

All of this to say, there is no benefit to using the ternary operator,
even if you want to claim that the compiler is doing more work (which
we don't care about), and potentially worse code being generated, due
to processing that has to occur later on.

> > > Also doesn't this optimisation apply to all uses of size_mul() (aka s=
aturating_mul()).
> > > Presumably relying on the compiler to report the compilation time num=
eric overflow.
> >
> > I'm not familiar with saturating_mul(). I'm sure others on here can tal=
k to it.
>
> That is me giving is a better name.
> The same is true for size_add().
> IMHO saturation size_t calculations is really broken because it allows
> through 'bigger than sensible' sizes that still might cause problems
> (eg kmalloc() of sizes just below the limit.)
>
Patches welcome. :-)

-bw
