Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D2560ADC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996286; cv=pass; b=b6YEMiFac0Chivk5gqkMR9K1/1fdaU3HJQCOZLoQxVE78BS/cz2Dxq6KKg4Fk2NgoI5HRrbCesYly1HZKQuSqA+zTto1AliSf0iWeRcGcfapv1NgO6IzBCcK8IkVxR8nd1pOkGxsSlxyA+I8xFRugQAvmnaKHpxiiEGzI4ho7Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996286; c=relaxed/simple;
	bh=aCsxctc/xcnHv1pMHQu5CMpv8HUZNsqkMA91yRiQJRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWR06swWaT2Nf9YeN/UIZ+tmroWT1foqy2wzA7RRmHfEB1YO5u2P206F35m4YSofCTP2zbDLud3XQ9XqPvWlNOqkD8XpJLcOI8Jg/Z3xDBiJuXQ6bBOLFPjcjku8Hhy62rse0gqjhxEao2QoMpiLUIqPr0QpETAtRLiPKqWDFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVy1VTdz; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVy1VTdz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so15719275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996283; cv=none;
        d=google.com; s=arc-20260327;
        b=bbm8p405IXdop00ptx4KsuYuTxvkCcG/DBJq0P2BTrLrf68P2OY15xeo5YPJ3d6PTa
         JHkDF0wcQ8vGx7d36/QVj4a3edwDrQNtFwm4wqeNv1wF6Qrk4k/4fhCuSVPn3LsrA3wo
         laQb+HGgHaJTvkHWTV9F3yAf0BRh/GYdiQ6jmVJp0C1BKSd87Dor2tUC+LP/3K+3/7sY
         gohXpKWx7oQ9ofGpFa4PyO8xEeUT6emq79sAcwPCjDuRWCq8ajEumn8/aDSEK9C27L5K
         XtllawEzbM7sz78dxh1SxPOX7QBkbX60yzsjtNOjo2fFGOvZesnvoxdP3kYS9Y5AwePR
         Ez2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=KpiWtzsW/BarVrJYKhMnr1Agf7BDMBSaA66ZMzkTbWA=;
        b=m1Fh9ZIocJtkaGaHrpqiuvgCnzUoJY0U0Y58VX/LJcy/cJj3LFzOhK1ZGDY1Rw8/VW
         8bFgn12w6kkJacd7FXehWxDUT7pmAR2DKjbRZgSogOMNmHJ3VEhltVOxllydP/LHWAXV
         WMKEWyNkc++AgFa1i/EjPgvmCC7nlwyMhd5IwX06ITXph6P44bYRdZAS2wqIdCA2iVNv
         JMJqE8zOQG+hrTS2XOEu9KMcCikdDC8S5HBT/NolzDcAKKq3IzztWOHXb664ObQ3PLtF
         tNt4F1R5NKTik1ue+1usQg9s6f6dyNjAFxt6sKwmN7PWxFKgDFnF/qP96DoBO/XC/PEG
         /FLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996283; x=1792601083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=XVy1VTdzq25mUFFqhWjSZoYY6RB8T8Sfq9yzmXB8hctLA1wT5xxF79ySOTctmXPkvg
         pxBZANS8TYnM1kcpylPDuknUwRsmTpt4bmVkw9CeY/0Am+QRFEuOtZhf1FKSu93lfedk
         dsPqeLZuW9lq4l2+YpXGZJ1nJCAy2cV/gzhdLu5Us9BpEn8c9wjPOtHz8+KelWtdoTpo
         gZczbRT5vgc2YCEp3uVt8zABLCW1XvsmAsticJ2r0HU3/61uCpy9w+78S3X9Tom8IOmd
         5AFjVudJTP5S6D8uV0qO07uty7hprnis9+zWgB9onASYfWAj6+bVQUD1KIH1xYz2o14c
         D/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996283; x=1792601083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=vdbvHlIW6REDgbmiTpVax0CExjvaCwJNc+R/TQ/M9afVGih1CwkgrRleDugjSBKROY
         VElizAiLMxhL24Hs46ek+EgfSh5S3ZWSq2P1siNKCzDcMIlqYf6schKxDYqb34qmpitr
         0AJhXRNI4Tv090WXZDDBsK/STfUrgux8LZQrol5v89TIGT8x7RAFuT50nJCpY3HfN4/Y
         i/aMJ/JuJ+3u6zAZm7TmCTzq2IS45tBx4iwyigvb/hlnKKS59kF3Vn/l9kSZT+dZS97A
         pOT4RjgTP21aCRndIonAB7VLLsDPxZdien59j86HKUyOKmBCH5oskabQa0OsOXPTg4gf
         c2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3welOs8EDw2yHABa4vvcDf9+h+iVvxKenRnh2lM9Cqswv8pTlc7gJpicIROifBAB3YcMln5jACik7P0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEUUvHAHa6+Uz6ROxkZIHXif5FqJ8hWm3PQd35DwKHZh8NEqFv
	WqX3sCoOAfjpqUoB18sRzhh8WO3exe119F9/3yIGdsww0psVcqopsZo4f6N7DkMRWH4GxeigPuZ
	H9OcvQAiVnGS3KHwHj509BwH6kFSRxHzs/MKz0fj0
X-Gm-Gg: AYBFou0jV/EMDubLCVg+xzwl68qBicOInLCmoPigtF93Hj3U4WFbT/QoL5ct8mtPh4i
	xu2wmo1P/Jb2PrO2nIExle2kJ5ZVLQ3MoNV/kcxP7oPXBQ6WkhqsNmx28dCJr3cjHUveskFaXY5
	62p1l8ZGiCpiz/OzHlejdvAs3XpUvjvrdy1oghf06sXU8Kh0lWgLJxBL6Ej2AhnBzcNeYZgpwpf
	kLg96uAUKtcjgB9QWm+HV5bxM8rYGX4tTYrwdOliSDNYGz3QAi+8YK19znlO8Brb5ZROJqTvVJt
	pjO3KqEqz1tCoxA+IX6uRNfLSvTXuWTiHCAn7xSM2XUsaV2LrRpqrkEieuXhoTkHINo02UnkxIo
	GlcR2Ka/vAMjO02oCOzt3RUHhS/c0vk8ncz2fnW2gLKLUGIPpZBgki9fGi85lukv7a/2HczjYVM
	9UZ1nM8UJz3uT8xoJzxBU1LHaIOw1TjqEd37bhcdFtOKLNb6LRf7Db
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 01:28:55PM +0200, Miguel Ojeda wrote:
> > On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > +/*
> > > + * Optional: not supported by gcc
> > > + *
> > > + * clang: https://clang.llvm.org/docs/AttributeReference.html#requir=
e-explicit-initialization
> > > + */
> > > +#if __has_attribute(__require_explicit_initialization__)
> > > +# define __require_explicit_initialization __attribute__((__require_=
explicit_initialization__))
> > > +#else
> > > +# define __require_explicit_initialization
> > > +#endif
> >
> > The LPC slides mention Clang 14+, but from a quick test in Compiler
> > Explorer and a `git log --grep` on the LLVM repository to confirm, it
> > seems the attribute was introduced in Clang 20+, no?
> >
> > If that is correct, then it is not available in all LLVM versions we
> > support (LLVM 17+), so we should add:
> >
> >      * Optional: only supported since clang >=3D 20.0
> >
> > With that:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Yup, I can confirm, I only see it with 20+ too.

Fix up the comment and have a coin, witcher.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
