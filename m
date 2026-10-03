Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FF939F16B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017663; cv=pass; b=VbOQ46VGbbCZEdE8+f0xYlBswIp4RY4IMIfNhBz0mlmvxOQ9ReLsaU3IuTf6otrHr5Y39kIgYL1WNlVRW7JkU/AMsiBOkouOoKThsc5GTVd7YDzqRw/e2ZnOhzMEmsTuUDQf9LSQhHioHvxM8fJoWy0ULZ2OfirM5hYucXvMqBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017663; c=relaxed/simple;
	bh=fJ8bD1DRJmOsBKwWEV0uZduUW3WlOEis5ExJ6BMTBb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGe7d8c7wdhP8pNNMqb+IEUNCZ10+CE9bf3vtHcwmvDN5Ty1Iy/WjDecZGXDTmiCO34JGPLIWIQUX3WOb4NUl+YHY9GYvxT9rP9m9XVUEH5Shha7VzyNp22hwTQ9ewtvZ42jiIsWomtNd9ejU1R0YPuFndFk6l8aeOal7DQxq08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u7wEYDWX; arc=pass smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u7wEYDWX"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bad9d27d58so120022137.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791017660; cv=none;
        d=google.com; s=arc-20260327;
        b=i9QLPu/FRKtt+v0rBOYrs4C+3gtaucKA57DxS6IOjRW8qglIyOIVRx3F7t6pYvn9Ey
         080Ee16NxIewW1qvvyUye63ppICWnE94nCDXHjPH9Ds2bE4KRvTVXOSHh4pUqv9bsou4
         PCoRXQXvvo9OVRNO2+1gO04ERJvyTrImrLO6EZgsXVWV9qnYSQdNDz52dJvCxrlPZsot
         kQTOe1/4bIZe5scRtDZmbJduHz714hfJJnIjH3iiUpS7OnCBPQwZc5FRg9XxeXE+CJ5B
         6C8PHiWRZqRJF3CX9gPugKUXOQSgdymLHDhxhQjHNfVN1stV6upcGkNfjlUIvb9CWjCW
         1Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        fh=NMwvsM2iBDFVLobp5e/mNFdNf/pWzi7L8XTVyN0hTn0=;
        b=QDiw3yppJlWzDHqPdwHgVY5/T9EyDOXz16bxNruYvo4RsBESrKE5R9Y7QOryRPJQMH
         OFjDv3m7nPp8e7/RXHjfPyBZleAnXpMqAAxrrB8yI24Rs1Ri9kPebuq7+8koFBaBagt4
         /qMqiWZFG0PVEIUFnS4e5X1qU0rRt9bsOl7xqZXUgr3f+pH99N3UJe9fbCUCF6t7rY8h
         SbzjLFgMcbsWRa6BTyTUitrTzSNjGs/5ivPI30HmOsViBuK4zIN4H0xj+ksDD4XhMLKS
         vS9F247OKQBLBGPeE8fQ1lg3cQCBPGk1r/P5lrc3kNGTQi0NScVq+ggzs4nkRamTxGtF
         n3ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791017660; x=1791622460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        b=u7wEYDWXR2mk5XvXD3w8fsmI2ubRN9XSna8ttRs80zKTu+sHm/KKEzGR2LNQz/gVNg
         AUHbuQ18xrzyi75PhFVq31Q2lxguHRZLhxilenO22kKD3Ac73cv9J4DzGkNNJxBXhYKZ
         WWJxWCFfDJ9UgtrSOgykHrvqEtBobLtdb5cgEylbkO27YMfv73/EHBvxon1YASF+2Ctr
         vansZcwmQerP6Xt4mHKxUZpSzK1KIL1VgCoTsU/0iS9sQiDDwduFdswwbBIwrPbbAWHm
         MHLHK98t7mgglxeleKaFjVBE/Fiv5gQxT0ngCrEefIN5ZBeZD0Cg3GbulJymb9vKrWJd
         uz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017660; x=1791622460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        b=yQSnT/crQHCBUk1LiYrXvg3IT+IGo0VkcpXLJcO4HDVoC5ab8ZEAklPG+r6f+EBOi1
         KcKxGYkHPRSx2a2eL140Sx9O/R9rNIMaU1hNyEw2YZR6HZ4E2XYqE6zzCOn2E0hdkNne
         SdFCovn7uh52wqjGFnbxBgE+vbL+0N62LBL63swBsnfJ85zHvEYhwHWI/pufXxOohjg6
         0Bbb+ysOgkEi6bAZmBSqtomooop523/Eb4CFHiD6VF3MIAoRv7r67mzzJ/e3U7nhcF3a
         RNWUTMZNR4fdCrdcGsTiJb/44foq+Vetsr4N2uXjEZ3l22YkGrRIWA9F3jKB2qv9Jmqg
         mrSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwbuIso4n/gOgq+RsXj1n0Gvs30WLLDqEpMTZDKT2NeLQOp17ZRKRe6CRnHb0aYPvk/3vc3eA3Q23mcGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSLixaWM9giuQzyoIA9vUPAn9kyuVz/JrRCpw1r+W5zRem5xJ4
	hjEqYxwOUNX5d5y9GFvwwZbSYCH3Kmevxc5ziaou+C4W7dUvJQ1xJ7LwkjDgLygQg+AkCxAhqpq
	2LENr0Xtsa0FVfyal6LLFOsJ5aUX/ilWff6X/RBw=
X-Gm-Gg: AYBFou0wbkjF2unbjs9id1+MLwctosMmOXzJCsoOONrFmGEOY8AAWws1uQ/cHQkZAwD
	Wb3CzhffjT0nSmdkfzyVLVSZ2yuUQVHjzFF4acVCsPQTwYmJmm08M+NDXoHCZhkFfvVrMOeTRE2
	IHotrdkccF55N2GCL1LLZTNVYeLnGgdzwuMF0Rg5g+S00uM9m4+5ud4CxKx+5PdL6cKzmWp6not
	p3QQQhlVjuyFwzyIHDQWUCydc8O+OB4zxVOpoWLdC+hM2GMMmIbwyOOIjoeQi7xYfWvqkm7NSS+
	6seGFDk87S94N88aePJoeRIkUBwRobF8Ili7I4wFzwNYtvPq4WChaDTW+BCnMpsVDlpJIMftw5g
	sspcXHAdtmiRFqEqEjpO9
X-Received: by 2002:a05:6102:f13:b0:7c3:2168:d603 with SMTP id
 ada2fe7eead31-7c32168d76fmr21040137.0.1791017659776; Sat, 03 Oct 2026
 01:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <CAD++jLnOm3ua7hom_L4YQwN5z81M17WmL_VGqx+-ugrAJ-6_Dg@mail.gmail.com>
 <7e847715-6bd5-4f69-a9a6-339788810fec@app.fastmail.com> <CAGG=3QWKEgeggp+OcVsS4QLOX1zxN23HHZp1SfHX0rQVA_7nDQ@mail.gmail.com>
 <4c92ca0e-c502-4a63-a2a2-bbf53db5e40f@app.fastmail.com>
In-Reply-To: <4c92ca0e-c502-4a63-a2a2-bbf53db5e40f@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Sat, 3 Oct 2026 01:54:03 -0700
X-Gm-Features: AclHuK8oU2zlAvciQOyAfjuVxZhfxwAdBPPLNgg_nd50DywxRhOhME8xg_IwvQM
Message-ID: <CAGG=3QXtYajLg-W21R=52FB151wbnAYr7a7rJMJL9krq0-fTyw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 6:52=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Fri, 2 Oct 2026, at 14:44, Bill Wendling wrote:
> > On Fri, Oct 2, 2026 at 12:38=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >> On Thu, 1 Oct 2026, at 23:24, Linus Walleij wrote:
> >> > On Thu, Oct 1, 2026 at 10:05=E2=80=AFPM Bill Wendling <morbo@google.=
com> wrote:
> >> >> On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kerne=
l.org> wrote:
> >> >> > On Mon, Sep 28, 2026 at 9:22=E2=80=AFAM Bill Wendling <morbo@goog=
le.com> wrote:
> >> >> > > On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@g=
oogle.com> wrote:
> >> >> > > >
> >> >> > > > The 'data' pointer field in 'struct acpi_gpio_mapping' is ass=
ociated
> >> >> > > > with the 'size' field, which represents the number of element=
s of
> >> >> > > > type 'struct acpi_gpio_params' allocated for 'data'.
> >> >> > > >
> >> >> > > > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> >> >> > > > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_=
ptr
> >> >> > > > attribute.
> >> >> > > >
> >> >> > > > Analysis of allocation, assignment, and access points shows t=
hat the
> >> >> > > > pointer is never accessed before the count is set, which guar=
antees that
> >> >> > > > this annotation is safe and will not cause runtime panics or
> >> >> > > > false-positive bounds checks.
> >> >> > > >
> >> >> > > > Cc: codemender-patching+linux@google.com
> >> >> > > > Assisted-by: LLM
> >> >> > > > Signed-off-by: Bill Wendling <morbo@google.com>
> >> >> > > > ---
> >> >> > > >  include/linux/gpio/consumer.h | 2 +-
> >> >> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> > > >
> >> >> > > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gp=
io/consumer.h
> >> >> > > > index fceeefd5f893..2b80cf7aa7e7 100644
> >> >> > > > --- a/include/linux/gpio/consumer.h
> >> >> > > > +++ b/include/linux/gpio/consumer.h
> >> >> > > > @@ -667,7 +667,7 @@ struct acpi_gpio_params {
> >> >> > > >
> >> >> > > >  struct acpi_gpio_mapping {
> >> >> > > >         const char *name;
> >> >> > > > -       const struct acpi_gpio_params *data;
> >> >> > > > +       const struct acpi_gpio_params *data __counted_by_ptr(=
size);
> >> >> > > >         unsigned int size;
> >> >> > > >
> >> >> > > >  /* Ignore IoRestriction field */
> >> >> > >
> >> >> > > There's a problem with 'drivers/firmware/efi/libstub/Makefile'.=
 Clang
> >> >> > > needs a compiler flag to support the "__counted_by_ptr" attribu=
te
> >> >> > > referencing a field *after* the pointer, like in this patch. Ho=
wever,
> >> >> > > the Makefile blasts the flag away for x86 platforms. Below is a=
 hack
> >> >> > > that copies the part of the top-level Makefile that adds the fl=
ag. I
> >> >> > > don't think that's a good solution. The comment in the driver's
> >> >> > > Makefile says that the stub code executes before the kernel doe=
s,
> >> >> > > which I assume is why a lot of the flags are blown away... In a=
ny
> >> >> > > event, I'm not sure how best to address this.
> >> >> >
> >> >> > But is this a problem with the current patch?
> >> >> >
> >> >> > Does libefistub use <linux/gpio/consumer.h> in any way, shape
> >> >> > or form?
> >> >> >
> >> >> It's being #included transitively:
> >> >>
> >> >> In file included from drivers/firmware/efi/libstub/efi-stub-helper.=
c:12:
> >> >> In file included from ./include/linux/efi.h:20:
> >> >> In file included from ./include/linux/rtc.h:18:
> >> >> In file included from ./include/linux/nvmem-provider.h:16:
> >> >> ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> >> >> identifier 'size'; did you
> >> >>       mean 'ksize'?
> >> >>   670 |         const struct acpi_gpio_params *data __counted_by_pt=
r(size);
> >> >>       |                                                            =
  ^~~~
> >> >>       |                                                            =
  ksize
> >> >> ././include/linux/compiler_types.h:392:64: note: expanded from macr=
o
> >> >> '__counted_by_ptr'
> >> >>   392 | #define __counted_by_ptr(member)
> >> >> __attribute__((__counted_by__(member)))
> >> >>       |
> >> >>        ^~~~~~
> >> >> ./include/linux/slab.h:602:8: note: 'ksize' declared here
> >> >>   602 | size_t ksize(const void *objp);
> >> >>       |        ^
> >> >
> >> > Hm I see.
> >> >
> >> > Certainly Jeremy or Ard will have an idea about how to solve this,
> >> > so paging them in.
> >> >
> >>
> >> libstub code never executes in the context of the kernel, but only in
> >> the context of the boot firmware. Generally, we disable instrumentatio=
n
> >> there that has a significant runtime component, basically because we
> >> cannot crash or panic the kernel before we have even booted it.
> >>
> >> Can we just #define __counted_by_ptr(...) to nothing when building
> >> from that Makefile?
> >>
> > Doing it in the Makefile is tricky, because of how the "c_flags"
> > variable is defined and used. I couldn't find a good way to do it.
> > Instead, I inserted "#undef __counted_by{_ptr}" at the top of the
> > affected files. It's gross. If there's a way I'm missing, please let
> > me know.
> >
>
> Does that even build?

It did for me...

Let me look into Sashiko's comments.

-bw
