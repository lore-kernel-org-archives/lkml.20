Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012E3264E0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885109; cv=pass; b=T6T8HlhpgmnL1fidkPGCYBbWJyqmwHqCpQvXhqje1LloWKUMcdulf1vVGy8fq2RzRDmuglysDM9oj8h6kUW3wGKqe92pnecaqsJCUN13GH9qvRr8im/7GvRgm1NN7TVpG+q54FNwNH91AYpEM25C4Qxii7g/HljfDVU+vPQum0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885109; c=relaxed/simple;
	bh=D5b2njgM22Yn9YX8W7fqgN5Wxt0Lao05fQOXJfkjPyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isMTrZxGOfA0JktRYwWAozNnpLu2PXTh6P6gOviKGuhEy+P8PlHHL5kNSTkCAs8+vPcqyxMkwevg2u4amBWz6W2U5jDiN87jycRUbG/e1DWjfzVlGTlWIs6aOgv7WVHvWZbxeac5QDljOum40pO8nzSdUYezM1f1m9Flot1nfOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7S0rT/4; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7S0rT/4"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7bf18d0c220so701799137.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790885106; cv=none;
        d=google.com; s=arc-20260327;
        b=lzCdAaL+6bOXO6ccoS7I3elC7pXjKSAM/qhod/tAT7IavL/Q/1Gg1VWzP1VZkJSwtq
         6p2k3inSFPBuoDwWj8VOsZBDl73vt9QC7L2w0wt7SAL977IYJ57/Gj/DZrz8PGQeT/aF
         FfZB58hD2zMyDq5170TiGBjpN9R3OI2Uwd3P6rJ6RIBeIts90RPmmaZ2efTv05BiuDmx
         K83WFnjJxUZflkd8uZYUduk7PfLQLrzbIWSV8G5Tsz13N2uKd+LejQFbGMGfHNOXZKDR
         QuSa0XrGp8rLY19VwATKp3i8zaL4c14bzq5LCqB1BmxbE6x1jf0/CnkasVj+6ARipRe9
         senA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        fh=ILlYTktbpbt0qN9Y2naQqq+0YJBtPsVKdRwN1ncqKDo=;
        b=hcUN9vozJF1G2sZiC7j5gYNuOVl1gb4p2MkCmzi95U5p3ynGWYzMp+CUAEj6blL/Ll
         fgRufjBcg6Jzyj3lQ83l4l202rY2+lRf45Hxj88AvuOuJVR/vFVq85fnJgPF1L7nL0Q5
         AFWB0bQ2zFcq6MNHXz6ynjdQEFtsA8fy1hOxe/AqSoMv65XNNf2TgR6fZzHSJVshYS4U
         eTrm/6gfwIolj5aRz6jMLIMjqGKWwk6WcVqMz5f0fFnjH3gFJPzAawP2xfK3gp5TyPmG
         AJ+7/a4wsFblI8IeckCOZ2CnH9UXZeVt5MU89/GOZaD1aYkd1/yS4KanjkjX+WiRkVNT
         61PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790885106; x=1791489906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        b=o7S0rT/4dnEMH/8OGhYSyi2BKAi26YomRtp8jMtE8rNeWIP82oLZugcLL/mf+FVcKP
         B83QvB39qrM3f2vJYX4vmhW4JsTWV16eYihyxB2q4IC93EIW0PTUxHQA7H82ZQTQrNy8
         hQQljV/m9UpMFstnoqePlJcjbxSCXNum6K1nlGGy485PT+EsAisyXL7VFh1DAg2dkM6R
         oPZaihKttRJzpSKi4hoHV8VARzbnRqU2AMyK7FxJA0ess/xaa0CjcOvdoy/yipGAyley
         Tpyi4X8rkEsMdUrR5zk5uVvCGp1dBVXgM1VeovbF1SAfX9CULXal8NWYRdwKdgeibhhc
         dCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885106; x=1791489906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        b=De7KpeWx/8UQdof7hZr/+7DbObQOR2lOkeRtCTjFB/DC4CyvbQjgoHOkh+tw427WoF
         0rAfdZz5KDGAG/xo0Dm3r5C7o8AFzsQhrVk0BgAx9UMNh19SrRMrqnpMFE4m6rfPZvDH
         614pWqiEmUNpG/WqYpU2jZhG0EWfZN/XThhMSEk+Oq+PnhLDE5bbtAonArgcJdj0mco5
         qs9RczIy9bJmnQXHEgKEcbk6Bzh6K12JsO9Fn+Mc+tT66KnEA7VMsyqdHawpi+5k2q0x
         zx8/ZDiwIRtdEQgeWT29A7p4y/GidyHfgccXSBKemPHoXMduA1COJtTc8LdcFrRMX4wT
         e78Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXOLWjtJnP46YuM9g7FChZ/E0LZMCrYlrsnwGwuntd2n0t7f14od9z5QEi+//dfFoGGXKDZ5G2CsbXIyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIakdyKpacdLGLF4zvAzVuP6ycjI1NiS38U6sdWg4lkCUjMOq+2
	YynzGiD1k0ezWt6lBpMCYS0uhVpbk7m28Z45qTMwKQNnjnE4iefZ5U2yLkaagto/jmI921Ylbm4
	2+BUTE9Psg8ukRbCtt8VtbyV7/+akBOnm0a/SxOo=
X-Gm-Gg: AYBFou01AzZqrMGC7Dp3YzC/q3KM1SxDZxLSTJiPTbNatLel33ZS8r/4K51sxWqGgys
	Ti7C6rq7+mTRa586N/Ca+ywIDbdLFE4b9pU4ZPnjnd9BsDmx2OevjylVyCPPrwbkMufy/fmvo2R
	M3uONZw91506CsBhxj+Y8872VlNxHkyIIS3QdcQL1ZQEbPPBvWAl/Tmn1g81eOUeN6yuvKwaSlW
	iosqxQL+ODL33C8TT7AfHHwZPFqaCE3TKfpjnuYNkj71u+itGRDHfhQUpWtpwoWZJ5BE/osg8gE
	DA3M/9org2cn6PSbteDvbZVGYhSx2oL6y6IYIMHU1GWlPuQm5djCcnvUAuLQ2/HFz8vilDBKQD6
	K6EXdq0tlBSTqYuMbTilg
X-Received: by 2002:a05:6102:162c:b0:7a8:6ffc:1c25 with SMTP id
 ada2fe7eead31-7c0f48951dcmr137774137.18.1790885104867; Thu, 01 Oct 2026
 13:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
In-Reply-To: <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 1 Oct 2026 13:04:47 -0700
X-Gm-Features: AclHuK_OsmZsgIWlUXnGIOeGgxR5RkcvYLN5aGCG1e6Tds9_TT0UwWgbTocjZcw
Message-ID: <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Mon, Sep 28, 2026 at 9:22=E2=80=AFAM Bill Wendling <morbo@google.com> =
wrote:
> > On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@google.co=
m> wrote:
> > >
> > > The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> > > with the 'size' field, which represents the number of elements of
> > > type 'struct acpi_gpio_params' allocated for 'data'.
> > >
> > > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> > > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> > > attribute.
> > >
> > > Analysis of allocation, assignment, and access points shows that the
> > > pointer is never accessed before the count is set, which guarantees t=
hat
> > > this annotation is safe and will not cause runtime panics or
> > > false-positive bounds checks.
> > >
> > > Cc: codemender-patching+linux@google.com
> > > Assisted-by: LLM
> > > Signed-off-by: Bill Wendling <morbo@google.com>
> > > ---
> > >  include/linux/gpio/consumer.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consu=
mer.h
> > > index fceeefd5f893..2b80cf7aa7e7 100644
> > > --- a/include/linux/gpio/consumer.h
> > > +++ b/include/linux/gpio/consumer.h
> > > @@ -667,7 +667,7 @@ struct acpi_gpio_params {
> > >
> > >  struct acpi_gpio_mapping {
> > >         const char *name;
> > > -       const struct acpi_gpio_params *data;
> > > +       const struct acpi_gpio_params *data __counted_by_ptr(size);
> > >         unsigned int size;
> > >
> > >  /* Ignore IoRestriction field */
> >
> > There's a problem with 'drivers/firmware/efi/libstub/Makefile'. Clang
> > needs a compiler flag to support the "__counted_by_ptr" attribute
> > referencing a field *after* the pointer, like in this patch. However,
> > the Makefile blasts the flag away for x86 platforms. Below is a hack
> > that copies the part of the top-level Makefile that adds the flag. I
> > don't think that's a good solution. The comment in the driver's
> > Makefile says that the stub code executes before the kernel does,
> > which I assume is why a lot of the flags are blown away... In any
> > event, I'm not sure how best to address this.
>
> But is this a problem with the current patch?
>
> Does libefistub use <linux/gpio/consumer.h> in any way, shape
> or form?
>
It's being #included transitively:

In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:12:
In file included from ./include/linux/efi.h:20:
In file included from ./include/linux/rtc.h:18:
In file included from ./include/linux/nvmem-provider.h:16:
./include/linux/gpio/consumer.h:670:55: error: use of undeclared
identifier 'size'; did you
      mean 'ksize'?
  670 |         const struct acpi_gpio_params *data __counted_by_ptr(size);
      |                                                              ^~~~
      |                                                              ksize
././include/linux/compiler_types.h:392:64: note: expanded from macro
'__counted_by_ptr'
  392 | #define __counted_by_ptr(member)
__attribute__((__counted_by__(member)))
      |
       ^~~~~~
./include/linux/slab.h:602:8: note: 'ksize' declared here
  602 | size_t ksize(const void *objp);
      |        ^

> Yours,
> Linus Walleij
