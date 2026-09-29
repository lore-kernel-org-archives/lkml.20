Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432D32C937
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643595; cv=pass; b=ZPXx+GqXzuG1nnU4MtQ5RaTnFFKjXUjVbL+DKt+/03D9Co2shePHQZTNyZI3/vhrz0Q48XL6oQuDNHb1NvdxtsOexAUye67cdir9vD9G6JxRMAVzZRcJlo2cUMqH/GKCc3Pv5kOHc7sxl1DM1em555eH4KDn56tex42wmucCwls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643595; c=relaxed/simple;
	bh=kdstfPQgPrtTgN4gUdooa+ekBKEl2NJeeJ4iI2g35zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXVkZkKozn9ACrDqNHBrFBPFEGn2T1/ZfKH0bNKoJAqNYydJ+rpgSUb7lK+TU4QwDnMfDVCzpCAajJ6UZMR8Ae37DVZi2mkT4INblPFPDyIwBUqFjIgrz2Vtj1MPaYMLhUjxxKYIvnjnY3kRMAXnPijX9agHg3xS9xeDG0yLARg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sRAWytO9; arc=pass smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sRAWytO9"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7b2d5062bcaso1533862137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790643593; cv=none;
        d=google.com; s=arc-20260327;
        b=SFd2N3RIVSBwj0UuCnmfsVCzSzPYjVfFir/6/U1jLI5Ql//Odi1wvlF385knGYGb1g
         74pBex5xjOk6kL9/WmkpqBLBKsl/rJM+TUAgT5FapMEGg70Sl8keR++d3ww/g+RZbHKa
         CaIDKxHlQRNoL8HnWD5Xcvf5mJPhDuyGtwPZnTCAp/VGRzKLUEMUvS1F50E6z0bAx3j9
         4f8Ng9IdOj1OqBaQNpUbcvokFt4VdzKWJyBH2AgUHVxwpLZzrBlFMXvdZ1IcDCalTum6
         i7HBvnlvlw31GgCoxFDIbWF/0tJyJnsr0GinaWvlXj6Dtk82FtFswJrXHV80ohw80kit
         Z5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0ADxDwdLkQq+vcZGCf4NIyg5yF4IrOepz6gtzfzxe0=;
        fh=R3OTbH0dG4QwIAXIrDodyvyZ8nNWVd0AStjnvH4CSoc=;
        b=bXkDI1s5LcUH2L2g8mXgPymgk1oxkux9VLu3IVhwoxyDw6bABUlgVXZKZPCFGjxJPd
         XZfWhdGIyQr+AlLSbKNcKtUnC+qdlwHLUhr7IUGFlwk0vWLxZySPxFkeSY1xLbivGfHm
         lLnz54FdeyrsRkvrOBIF5tnhUbfwze0uWe1EmKfM1tCrArn4qXOymRp2A65MHHE0unT2
         z3R+X4RjbnrLHzvn5Z6/dCbNsIL6WDYtESNbBzsZbJo3LHWO2jUTasXTj8A5QbAHmztl
         6etqbQ/J4YZkPxVcttxvPQYH+hcY5C83516bokt3/OnaPdFfgYcrC8jl1esed+vKTgJ6
         G14w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790643593; x=1791248393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0ADxDwdLkQq+vcZGCf4NIyg5yF4IrOepz6gtzfzxe0=;
        b=sRAWytO9hW7eRbW6bWWAnf1jOwlXuKHzL7lzqJ0x2Pwcaal0BH44JNDqOGeJRx8WNi
         RLmERVQHi2fbsA8p5VaAm2ajFK/aFFIGjG1m3lYzajH8PtCS1UoccZmotYlNFqugCiDU
         SOQzyRlF8cJmbxweUH2Gz1xqkUl6O7oTbYKxue5o6vjBa5MS8QiVUODJw8SbGo/BB1zl
         Bb0E69uDMm5Ni/w0fMlsc5HvNix+q1H+Pg8RI9B/HqIGgO4ZxBmVv3C5GIHjGvcPC/HA
         DN8AtXkke6TOnO76wpPYeN8QqR43yN+mVfERbRvuPiMsdVChcCsSr2+fXFfGkBCO3Rwd
         JB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643593; x=1791248393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0ADxDwdLkQq+vcZGCf4NIyg5yF4IrOepz6gtzfzxe0=;
        b=yfvyfwlZAnPd3OYW26qoVPY1PGAWEMQnnw9CS1OpKS+tiVNIZzcnTwuMx086vbUpUn
         6nEQ3yPUHt+OuZTNQQERCDN+J1womWYn5LE01dB2JDdh7fZkes8keVDKbPsZZwBGjj1O
         1HZSqpm/NLCqR9u9TmqRAXLQ/2lccpxd0KbBDReGvX6zwrZF3pYR8yuiFhlpuaPsxKTI
         cfiFtQfvbEGDGn5WGy5ueZB4BnbhK8h2jc82fvQeJvbBqX+hOSjsnrh0AXsc0AURXWbU
         s8Wo+QB9w23gyrdLUIKcHsRT8TJnStg6EhrnMxDuT1xQ5N2kl71YdLuGHuoi8ETghlkB
         mS4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3jPtz28+jiBRh6tHcnJrA6l75p+tEssBHrewpCb3hgQ3UosP+gpTAAZ5LGUDqZ79a/LGR1D7iOrjjNr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvePnWOC/HTcuWR2Qu4nmyKfpk8pA6+xnaYHZoae4XRP97b2uB
	IwPQ4hJVvf3Mal83exW4uZiYywiAhh34Za6R9kZc0jK2qy8EQwFynm1FKGDbngxLuoZ4N8os+9I
	OL8fUWVFb24+O04jW2SJQCQvyqeIS5b2D2h4xkzs=
X-Gm-Gg: AYBFou3Vc/Kjsdi995LALQ5kl9PEpLDBbSe++B8dUMoW+ipCGdAxWk+YBkMxz7gDyri
	i6V3Q4ehhKW9+Bhv8z1glEJyq9261c+kKWqE4oks9eAmTWq1wvBiiTFRr8AClq1lo53RZv/OZDR
	4xeJE2l1fgk8idDkYTDpIj0eHphGIDdfdUpo8Rh4jW93ZgoPDZ68X3WhVpjbqQus5+j7oMgUDDm
	SZUUgQXrAoArVUwinBjiI1HCTgPCXmXx39nZyc9eSYzXP28JA5Y73WwJi4QwhqICh166x4h08yU
	36hJOq/D19jrtu2O+Vl0XRDD17CgCkSHWG0aY5It4NXD+TnGQj6EVI5Bzw4oT/4k34sFPkdq8SQ
	wrcIsp8JtXpI7oVX+v8/s
X-Received: by 2002:a05:6102:8645:10b0:7b2:3925:9587 with SMTP id
 ada2fe7eead31-7b23925a3b7mr2618011137.17.1790643592416; Mon, 28 Sep 2026
 17:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928231737.2092716-1-morbo@google.com> <20260928164235.041803152d3f340d4c59e59e@linux-foundation.org>
In-Reply-To: <20260928164235.041803152d3f340d4c59e59e@linux-foundation.org>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 17:59:35 -0700
X-Gm-Features: AclHuK80UuTfMLELvaE_jdAE5HpgJUaUpVSxG6Fx0aY5YOmC9Nc8zrqkCvUINPE
Message-ID: <CAGG=3QXLkQKiwb0VfpfWKYwSEaBLp38FAo-P0Nja0Sq8CvBbNA@mail.gmail.com>
Subject: Re: [PATCH] kasan: add KUnit tests for __counted_by and __counted_by_ptr
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:42=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 28 Sep 2026 23:17:37 +0000 Bill Wendling <morbo@google.com> wrote=
:
>
> > The '__counted_by' and '__counted_by_ptr' attributes associate a
> > flexible array member or pointer member with a struct field that holds
> > its element count. Supporting compilers use these annotations to
> > compute dynamic object sizes via '__builtin_dynamic_object_size()' and
> > perform runtime bounds checking with KASAN.
> >
> > Add KUnit tests ('counted_by_flex_oob_access' and
> > 'counted_by_ptr_oob_access', guarded by CONFIG_CC_HAS_COUNTED_BY and
> > CONFIG_CC_HAS_COUNTED_BY_PTR respectively) to verify that:
> >
> >  - '__builtin_dynamic_object_size()' returns the expected byte size for
> >    annotated flexible array and pointer members.
> >  - KASAN detects out-of-bounds read and write accesses beyond the
> >    annotated count.
> >
> > Allocate the test structures in 'noinline' helpers and hide the
> > returned pointers with OPTIMIZER_HIDE_VAR() so allocation-size
> > attributes and compiler optimizations do not mask the '__counted_by'
> > and '__counted_by_ptr' checks.
>
> Thanks.  Are any of Sashiko's comments pertinent?
>         https://sashiko.dev/#/patchset/20260928231737.2092716-1-morbo@goo=
gle.com

Yes. I found a better place to put these tests. I'll send a v2.

-bw
