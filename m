Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92447424F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010365; cv=pass; b=pofpGWJDSYsauIvNFyAl6pCX/p6ZMPqCqNbJqzO3Pam2GkPc7oqukBfE7LTHpQLZ6vSfVfohCSaIyBA1hDExmqdM5IcoE1swMhe7384cv7Oa34jKIgYetb4rzkAgbw6npZyxq8k6JHs1vsOdtMU/ccb3EdSpMWslK0kts4+JOhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010365; c=relaxed/simple;
	bh=OdczzjFOe89H4x/GfebUN+5WbU+DhmRpAufDeoSczO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+afKmYc788Oi2LwUvMXdDwcRyzHd0ly3uhC03CVRfV4Hlb1pSzTnAQggPIV3vitlPNM5UIBDrmTIVMxCPnq4xqiw7IhdFsC26ZPBwzYzzKrpJdfVeSp6u8UW0BCirCYOU3RdOtgn9N3/8EKxyp/mzv1SghtgZ2O6ZgQcIIQgRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h50qG51d; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h50qG51d"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5e91e422859so2291612e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792010361; cv=none;
        d=google.com; s=arc-20260327;
        b=CQkiBT9oyTqKeUs1Ua3BXLSsZxkSCZtkrYIb2tyuZe6ptvvQIjU2qhW6DlXkA8mUsB
         OyhV6fDy1Paz3yV4lYLa1jQOSweBBgBCRf9rNhDxaudk2KaYFa3xjuyRxovrOUc10EtV
         ByUn+mwtCCz9TvDZxnSHyOVu7M0nD+DTqagisMj4TOdShQCiKJ5d+9pJpy3O6jLQOVmL
         JuR4MKdme7agiQS9V1SWhlb3NV/Wlg0h0HTfpKnyhQXyCrNJ3N1JWx+K4R80koAf2rgK
         yDhj4jyRm3Y5G9+DpUaRXKepSOdrG1zeiHgS6XcOHtsU2cAKuYO8sa7kNN49IOU01jXm
         mMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3BK1k/iiQA4DbuDBW/0r/+HhOk81y4XWGTKDWVnqAs=;
        fh=XFVG4pFc7tyqapw+A64QBxHeX5bPepDNt2tMVLl9Rvo=;
        b=fwJZAcQOg5WzVMgqoLIMSp8KzkuJBV+0Krdcoy7dKvsaZJKQWMZ1Lp396TlXMgwTia
         XAwcg4gwMD5Og/TugQ4x2FJjjx9XcmP8seYR1hoUsZTLFW9SsnvtgD/llHzcGBg9/Vng
         qglZVuEz+5POYxzTaZSHzPcQaKYV93vXfjjeaAlge/Qjgc4biO+bCcWPcsI5CET88Mw7
         9Fy43PJyWdYU2djU3Le97U9VU6cuBefTtG/z2b9smqWEd13T4B3XNyy9e7J+UlGByXiP
         RnPhoosNtOmdPjusQK2wgNCOlBks5bz2ungSLX1E1hJR9Jm05m9+A4SrnaGdJCpxhBdF
         hcNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792010361; x=1792615161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3BK1k/iiQA4DbuDBW/0r/+HhOk81y4XWGTKDWVnqAs=;
        b=h50qG51dOshgVXqbWhB8nK8ekNyDXnYwAfHJILpcBI++QQ2DcstMYvfyOTlJthzrNV
         fq1frc9/0MiCTt6WJ3n3AlUVM75eOJipjiGBGy4j8l3qtYhZDLveQ+AJXWw8JhP2Q1fB
         xMfnkxu+VwruIqO3I/J6B6nWV8B1e7EA6a/0QgAvzQXNfhM7bdFJvwrrp4ctnmiaif5m
         EBfskzgjsPWRn4iAGYizGqikxBPiyRGKTi82yizJlLKbN1lKzmlbjjiowFDNqFwAyss7
         sI6irjp+th0Hcqo8T6BtgAMW7OBVdwYXcDvX5NmmWQjQXceyAxHdSNL5hkMgY/fVhVE/
         pxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010361; x=1792615161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BK1k/iiQA4DbuDBW/0r/+HhOk81y4XWGTKDWVnqAs=;
        b=zlbZqBeFaWgQHzlbFQikZmaipE309gla3VnG+c83H14B1dmAAaLAPA/Nnykt9iwYXp
         1lrLfd0i/zwCIspws6SwJN4yqEySClJ9crcToTWiZlFNjaRDoaLHkRiXGaU2qG3H6g0D
         wGteIIGuWVbWbHd0znbqkP4uOnNvHDmFQJji7GeFLC7ZS3flpKMSnBm/RDbFums8upOu
         KdrsCTnh71g1hGYfXDSueUoJ4FzrkxUQaRhXcskI0TGvEJ6qzRQ4+bzNniAlkAbUujjm
         C4gSqB+CAH+sw7qrMq7n89y/kssgs5Z5hmojI8UMIBb7phRqiSoO3aM3FevwgVeDKfgy
         wXgw==
X-Forwarded-Encrypted: i=1; AKwUvByl2bH2IvhVKcRnLlA5Sr3arYbbLWQWkDpIJCnfsWYWL0DAeMJgiAqm38hIGMQQ3JQWCaikrJa5caOMxbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRAlfsg7UsQMZep0uKdCIIOlqceNzDHJcWlpTSLXaQpRzuXEqW
	VttlAb5NazVP0t9NnwYIcOT5Hl8XLcoqJSVxib1n3afpYmjWruH6hpX59GcL/juDuw1B305Dvqz
	/EU7TzG0omCKTmx1ep6PnDEPg+N1vqUlaCeYLYHo=
X-Gm-Gg: AYBFou1GrvkZgdnQVT6sUK2GDiD6BTNBEBdEbIpSA/754+IL+fkNblNNS8fIdW2Ewyy
	CI2od550gaR1YTlcovXyn3chUPWfIRrediyK/JVhDzWLnO/s8LpgIH/JKVH0K2Z3PoTVV7lKZA+
	urt3YArNwBeL0BxmTSmCpuYP1zwsFk21K/8iwRKqEPRcctfozfRLSvT5X4pv3PRLGMIQ3sghu6Q
	v6O5LM7B/3Fm6OsaTX4snEJne/09C+6dLB2JNnXt16rugwAeU3zRcOJ1rgYqOZ6ixi8B8GkWQRx
	PQWQjZeqYX22V0eYvCbecUwYRqeFsS981pZJlw1ANUGqebDMZDKLxPh0caJP+2vz4BXgrTsUBq3
	lA3XHMhJwzXneaXuNTiq58ypQPyKIN1c=
X-Received: by 2002:a05:6102:3714:b0:7a7:ce1f:6b95 with SMTP id
 ada2fe7eead31-7cb36985e42mr4674417137.2.1792010360607; Wed, 14 Oct 2026
 13:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012205919.4012405-1-morbo@google.com> <20261013203146.387344-1-morbo@google.com>
 <20261014133805.47afdb0b@pumpkin>
In-Reply-To: <20261014133805.47afdb0b@pumpkin>
From: Bill Wendling <morbo@google.com>
Date: Wed, 14 Oct 2026 13:39:03 -0700
X-Gm-Features: AclHuK9khqKvMR9m63eVs2GpX7B7OIhzyYA7Leck7nyOJHPtO4-FU7QtoZGX_3s
Message-ID: <CAGG=3QUZna+bi-_nmJh-1aWBBtuURbexQczXCNt0R+jDSb1NMQ@mail.gmail.com>
Subject: Re: [PATCH v2] overflow: Match arithmetic in both parts of __builtin_choose_expr
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:38=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
> On Tue, 13 Oct 2026 20:31:46 +0000
> Bill Wendling <morbo@google.com> wrote:
>
> > The two parts of '__builtin_choose_expr()' had different arithmetic
> > expressions. This patch corrects it so that both parts calculate:
> >
> >   COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)
> >
> > In practice, '__must_be_array' is meant to assert if 'MEMBER' isn't an
> > array and return '0' otherwise. However, symmetry is less prone to
> > subtle errors (and far more satisfying).
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Don't use 'size_add', which just adds more complicated macro cruft =
to the
> >     expression. Instead, just adjust the parentheses.
> > ---
> >  include/linux/overflow.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> > index a8cb6319b4fb..d0f04436343e 100644
> > --- a/include/linux/overflow.h
> > +++ b/include/linux/overflow.h
> > @@ -418,7 +418,7 @@ static __always_inline size_t __must_check size_sub=
(size_t minuend, size_t subtr
> >  #define flex_array_size(p, member, count)                            \
> >       __builtin_choose_expr(__is_constexpr(count),                    \
> >               (count) * sizeof(*(p)->member) + __must_be_array((p)->mem=
ber),  \
> > -             size_mul(count, sizeof(*(p)->member) + __must_be_array((p=
)->member)))
> > +             size_mul(count, sizeof(*(p)->member)) + __must_be_array((=
p)->member))
>
> Why does this use __builtin_choose_expr().
> The types of the two expressions are the same so it might as well use ?:
>
It's to emit only one of the expressions rather than both. If the
'count' is a constant expression, then it's possible for the compiler
to perform the calculation without having to hold onto the "false"
path of the ternary operator. So much more efficient in the long-run.

> Also doesn't this optimisation apply to all uses of size_mul() (aka satur=
ating_mul()).
> Presumably relying on the compiler to report the compilation time numeric=
 overflow.

I'm not familiar with saturating_mul(). I'm sure others on here can talk to=
 it.

-bw

> David
>
> >
> >  /**
> >   * struct_size() - Calculate size of structure with trailing flexible =
array.
>
