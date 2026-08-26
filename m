Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739748BD47
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781957; cv=pass; b=HG8o51x8FT6H7M6b4Cewsenkb2BE9sZuz4Jl0C9o+kDGLFv8a19jZvjhWUaLkQnyzyIRi9lsdMPPi4prkyd26Zie0zArSblAuG6fyrDzHsag5eas6WB1u7vk0cmbyhVk7TBFsJVWyKaVL8yRdcO4q42kY4etIUOTnkxQjctUcC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781957; c=relaxed/simple;
	bh=91iL9f66E+wP8pylRCnex07f+0OG4EAgBRLF2xhH3XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv4ykIS6M/Wd4Ff17QO6qffSklsiSQPFGRu6SOOhSTLaC/4enGneOEqqd+++HCAmLAUn+B1T9qKSVuxr1gdZgKEdjQ9F1H5kyGepPpzK4X5EvRngDtorM7M7KpTGkn/zRYUCZ3ep+EfbBpaucs63B5yAgmoLYDP2L4oFJGMp5RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BZutVFYt; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BZutVFYt"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c66eefc868so285526e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787781952; cv=none;
        d=google.com; s=arc-20260327;
        b=O3izLkbiDAu3bcH6Ih0m1bg5QpCuHd6oCGNdsroUf1KcLX8QJfZUhvY6DIaZ4WKAuJ
         nypObWMZa2QD7NnNjvwUvKgSX103uJswmsFnLXb/SwmZmVDn4/SsH14HvSDwkrlnEwGY
         +bjXgiwdUu4yy2nayVKUwsPhzQQUbKuJ6X/SjFC0d96eS2zB3NOcoZumpEMoWdX3ogak
         gq2ESzBITwa0Dw3n+xk1kpfg6Hx0hRMSPU8pJKXGyS8Z36rqFGoFnaPB66Av4FikoyBg
         UbXs406Vd37tvUvgnFGmDV30Jmnz9NODdBjO6/ubr8QOtJvIUD0VZXLvaKco4rbdT3IB
         MsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjNbxpuIxc8u8B4OZa7lx8RIdcA7nogA195cjmoHW0I=;
        fh=N1sJEz2NrlmwT6qFfzh5HDJdPzBzIpoEmkCrMPv8mGI=;
        b=Zk6sTgjbCRAlf67Pwnw3PZElQwi/Cs1d5i59etzQz85g044YALZNJ2TUA77zimVyIM
         xTGMV+xHPQIcDP1WDxJXUA/nEPk0RB2Zy59Kd/ymX8KquSFnHyPGbooO28vPobCmGCtc
         3BGdhJHzWFOEaVcjyesuyGggmf6v0SuUlqy/5NNKrQzHrL23xqQoiRg39cjQhBTwbV+h
         5ySrIp4mV1qYs41e+cqjKMARA+ZLXVX3UO+d6PLUHNZzGnvjyEX6OcNBl06v4XKzTvK5
         EZvY1zXsgByKVofzByfpUuOH9DOWp4qwUP9p7WSGQkXTT9ubUgxhGVOIAXW97ju3vFLt
         avHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787781952; x=1788386752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjNbxpuIxc8u8B4OZa7lx8RIdcA7nogA195cjmoHW0I=;
        b=BZutVFYti3QgMatmn8loY8f1RKPvHX+jT3tgoi7KGiMPyshbgT06GgnLqi9uUJPmPh
         zi+kcj3L/crDHMUuu+//ugOG7mW8Glk9AV9lF4T5hpyrVUdAqkcZzEIFuvB9mWai4CqC
         8z8mGfYxj6Ft68I43L/PuNJNJ3UksrDy44Bb6/YRERUgUY2NnWNGRUbxNr8e2zGKMRqE
         v4trOG7xKU3f9JaD/SK3PrL+zDR2ywgnOEuQ52qCh8c/W87LxBjGFXIwXUR2gChKCUNN
         N+P0IoHn9SWtnUtJTw/Z0Iack+bR6seuoK+hxcFPKVy1HLtCP3LP0LXKx2H/hkj81czx
         ieCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781952; x=1788386752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjNbxpuIxc8u8B4OZa7lx8RIdcA7nogA195cjmoHW0I=;
        b=iE5TL41EoTrvfpy5mYRyVuLMzIRUy0r05Cuoov/FLKouQKXyD1MxuoI/Sf+R5qeczq
         KSSgbJA4wCyG2lhC7EOnhn5mUY6aNt4xsGnmnZgWhMAIr5uqWne2C6XFdxo6Z0Ka1y9W
         51h2Ryx6vqeSrXYaQMo5+yRWrT84zi2sCBwKCZbpp1+jcHtRm9wj5YOALeFUCTeAI2YV
         Tm7Xm3MwA36SZCuZ7TeorrlRCcElc97DmUBTcRkmLVVXu6b/g2XVTEAy0dgfhdy0hZjl
         jRY0ttKWt0gXLZ6HQwfc5clRmBjwYGaivFulR9QpaZ1jHQHxFXyT8nJHOzN4d0MEifbj
         K5Kg==
X-Gm-Message-State: AFuF++nlffs4HgYVRfYO9t0yIEjYJobIKFYrhVIak7T3hr/sz6Emupxv
	JlxQU4M6reFvk/nD7lQAILaTyt8YIQ7sWV+878qJhv6E7jJ9JsUbqr0bWxTue3ahqmf0+L8OZ5Z
	xRhdHiJJjBOL1Az5d/tzkYm5U43sIga+JwEEVzdCNRibd+gfBxXEHpw2cpA==
X-Gm-Gg: AR+sD11QzuOTTVkV6oTgr7glJkeOJpdkAYc9V1fyh/2IGPo/kx8/KE0VtXUTVfCDHAU
	668RlfJ174F9XopGwnS4Z+RdGG5rwUG+YYEywlWfWghjIQpTFuokZMgDtvabpC419h0I2CZ0Gsq
	E3Ekiy3rIyGFQPwuFU8gtie0ayt2ReA7S3WL88mKHDRktk3wFfvxWo1ltwNAKDFxpEoiWrPoUmk
	RNsvt6AJi1VgrHEyC2WOfJGK4jONzXgOo+Ja4BGNzjZ3FxwGZBBgxnTeMjWih53gfnzWd/rFJq1
	c5gnF64lF+mkVwNwCgv634OFwDpKleshiCc7yTm5TazUvofPMjt+muN3WJV+T0PFZ4DlBmkwmZn
	yz7v6h3npBmaJVCIhZ+Izgb9qMK3YoPewpmlQIxF8LQ==
X-Received: by 2002:a05:6122:4885:b0:5bd:a5e1:c7c7 with SMTP id
 71dfb90a1353d-5c65ba22909mr4924761e0c.1.1787781951366; Wed, 26 Aug 2026
 15:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com> <20260823125155.1136740-2-morbo@google.com>
 <aosJJXsQbUUcCDpx@redhat.com>
In-Reply-To: <aosJJXsQbUUcCDpx@redhat.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Aug 2026 15:05:34 -0700
X-Gm-Features: AcwNN1U-TxlG5zIoBUs2QqswLbS96u-jmZfkR3Z0OUMS7ZiUU8YcDxnDYuExDFQ
Message-ID: <CAGG=3QXo7bvOJn+T=fLYYZMdC-1SiSicThAHkj_hfyO5i6=pEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] userns: Add __counted_by_ptr attribute to struct uid_gid_map
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Alice Ryhl <aliceryhl@google.com>, Douglas Anderson <dianders@chromium.org>, 
	Anand Moon <linux.amoon@gmail.com>, codemender-patching+linux@google.com, 
	linux-hardening@vger.kernel.org, Alexey Gladkov <legion@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 7:52=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 08/23, Bill Wendling wrote:
> >
> > The compiler attribute __counted_by_ptr associates a pointer field of a
> > struct with a sibling field within the same struct that specifies the
> > element count of the allocated memory. This enables KASAN and fortified
> > bounds-checking to detect out-of-bounds accesses to the pointer field a=
t
> > runtime.
> >
> > We can add the __counted_by_ptr attribute to the 'forward' and 'reverse=
'
> > pointer fields of 'struct uid_gid_map', which are counted by
> > 'nr_extents'. Since 'nr_extents' is defined in a sibling anonymous
> > struct inside an anonymous union, the nearest common non-anonymous
> > struct level is 'struct uid_gid_map' itself, which is supported by the
> > compiler.
> >
> > However, doing so has runtime implications. In the original
> > implementation of insert_extent(), elements are written to
> > map->forward[map->nr_extents] before map->nr_extents is incremented:
> >
> >       if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
> >               dest =3D &map->extent[map->nr_extents];
> >       else
> >               dest =3D &map->forward[map->nr_extents];
> >
> >       *dest =3D *extent;
> >       map->nr_extents++;
> >
> > At the time of writing to 'map->forward[map->nr_extents]',
> > map->nr_extents is still 5, but we are accessing index 5 (which is the
> > 6th element). Under __counted_by_ptr(nr_extents), the compiler and
> > KASAN expect the accessed index to be strictly less than
> > map->nr_extents. Therefore, accessing index 5 when the count is 5
> > triggers an out-of-bounds panic/trap at runtime.
> >
> > To resolve this, insert_extent() is refactored to increment
> > map->nr_extents first, and then use map->nr_extents - 1 as the index:
> >
> >       map->nr_extents++;
> >       if (map->nr_extents <=3D UID_GID_MAP_MAX_BASE_EXTENTS)
> >               dest =3D &map->extent[map->nr_extents - 1];
> >       else
> >               dest =3D &map->forward[map->nr_extents - 1];
> >
> >       *dest =3D *extent;
>
> I leave this to you and other reviewers (add Alexey), you can safely
> ignore my nit.
>
> To me
>
>         if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
>                 dest =3D &map->extent;
>         else
>                 dest =3D &map->forward;
>
>         map->nr_extents++;
>         dest[map->nr_extents - 1] =3D *extent;
>
> looks a bit more clear, but this is minor/subjective.
>
> Either way, I think this needs a short comment to explain why do we
> need to increment ->nr_extents first, then subtract 1. IOW, to explain
> why (say)
>
>         dest[map->nr_extents++] =3D *extent;
>
> would be wrong.
>
Hi Oleg,

I added a comment before the code in question explaining why it's
organized that way. I certainly don't hate your version, but for
simplicity of reviews I just left the code as is.

-bw

> Oleg.
>
> > Assisted-by: Gemini Next
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Aleksa Sarai <cyphar@cyphar.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Nicolas Schier <nsc@kernel.org>
> > Cc: Gary Guo <gary@garyguo.net>
> > Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Anand Moon <linux.amoon@gmail.com>
> > Cc: Oleg Nesterov <oleg@redhat.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  include/linux/user_namespace.h | 4 ++--
> >  kernel/user_namespace.c        | 8 ++++----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/user_namespace.h b/include/linux/user_namesp=
ace.h
> > index e38d9e60569f..2962256eddf7 100644
> > --- a/include/linux/user_namespace.h
> > +++ b/include/linux/user_namespace.h
> > @@ -29,8 +29,8 @@ struct uid_gid_map { /* 64 bytes -- 1 cache line */
> >                       u32 nr_extents;
> >               };
> >               struct {
> > -                     struct uid_gid_extent *forward;
> > -                     struct uid_gid_extent *reverse;
> > +                     struct uid_gid_extent *forward __counted_by_ptr(n=
r_extents);
> > +                     struct uid_gid_extent *reverse __counted_by_ptr(n=
r_extents);
> >               };
> >       };
> >  };
> > diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> > index 0bed462e9b2a..7e5371d8f515 100644
> > --- a/kernel/user_namespace.c
> > +++ b/kernel/user_namespace.c
> > @@ -809,13 +809,13 @@ static int insert_extent(struct uid_gid_map *map,=
 struct uid_gid_extent *extent)
> >               map->reverse =3D NULL;
> >       }
> >
> > -     if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
> > -             dest =3D &map->extent[map->nr_extents];
> > +     map->nr_extents++;
> > +     if (map->nr_extents <=3D UID_GID_MAP_MAX_BASE_EXTENTS)
> > +             dest =3D &map->extent[map->nr_extents - 1];
> >       else
> > -             dest =3D &map->forward[map->nr_extents];
> > +             dest =3D &map->forward[map->nr_extents - 1];
> >
> >       *dest =3D *extent;
> > -     map->nr_extents++;
> >       return 0;
> >  }
> >
> > --
> > 2.55.0.860.g4b6b3295ed-goog
> >
>
