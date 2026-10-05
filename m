Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com [74.125.226.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300B477289
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196017; cv=pass; b=rhFe0pMoyh0ZwOFXRhgcWgQIfawLGNVfo7skfr/MXSpMFYQ1n2kYZ7LoWLjSxntczPZaVjBv9xULpJS5xQAW9E3Lg9t7ajFACgtTJ+JNZ4UwlHQxfNXmGefLgvrVgk1U2J7JTIbymbOPmSbOAfDakIdi+PK99Vaw3mkKdlIEjYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196017; c=relaxed/simple;
	bh=FoH71T1sttzcTK7jTd/MV4MMsSrOgn3/fa5zywp33Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C87yhq/MnOBZGlszaKxX0/aFkjH2/j9icOixbF185tq961OdMZ9QdjMqimJvMDdv6hSCBKkCjDbC8X9jxky+an/Xq1RRpBwFOOCH/a1pOs2xTr0O8fBBTjViehvaNudFW0VHY/Z08pFu/ln8RZhgc4LKXJv+wmI8kjmBWU5BWGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKIcyWF+; arc=pass smtp.client-ip=74.125.226.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKIcyWF+"
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98c759d93f1so98125241.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196015; cv=none;
        d=google.com; s=arc-20260327;
        b=KwT/FC1NJyA7azBZsiDBn0N89xjdMkwEVLgzWHRvlJ5bFoX5oMZt5HyYzjYadXcLzb
         NcD3WGxlchspM95s2eMH1UNI1Dd9TJizDQd5iJDxQ2v8HaGG/baI0KUkoDRdXuRV9122
         diMql7e2SidTihb4ampeJlsbmmJGpd6th7am/74N1rQmPn9Gg8aS+g2/oQNe3+yFXrMX
         LEQohhGiEhN652Se846y4hMfHj2/ZXmucdvjLKxSH9BJRcmoLumD2D/wQlL0Zmks7dbP
         2P6jLpgVoI974FyW/Xuz0RLiWTc+xan6oF9z8v1R2hSuWpcFScdFhmt0vwwoo6e5/GVx
         1p2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        fh=HlKILVyHpgTRmx301IeXn44faZa2JJHWbkE5IK1a6F0=;
        b=BllDs1SlM/rPswcvjUtYnYk4x5tLG5Y9k9rd8Jh4MKG0wT8etvhVvSS7Vmtrb43IsJ
         hYirNkz+sOgWX2FmEunprlpMicwnWQI38yOIr8pRMt1UrwMV5fLdIeT82y2AKyK3uQAy
         8Zur4z5a3AGJd8oRYRuEQdabJHPUjhvI7OrToRf059IGyJLZ/3rMunnPtjGcSFMnNQmt
         hOYqNjseO4XBPqr7Q1usqLo1kahzTKkXtd9ASoUubtaYCC0LUHx9yyXGfMLP2z20ee8g
         Q/YRwrLi/EoGrzURIUtp2NnZ2NE0j27tzwJ7hf5BI7CP0/SGgd4OWbig3oPqt0CmYVsv
         RWgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791196015; x=1791800815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        b=rKIcyWF+0tKspgAGKUAW0rACoFDD7SAn9urDOW5mRABwj5etQgrIOcGQSY0tPgDvFb
         cutlpZoUfDpouR+rRMDTLwJXc0T+1jx2T18BSrfIoztqTQhlYB88ghIkxAalLblekSYH
         b8NqKdCt77d+/ineoHHQdVJT6IywQwHuacoo1XlxZgSPoKeDFzGBppJef5JdI1nljsKU
         2vDXGyOo7UIoecDZmgOqj0byb9usUx8PIbJCzA4i7a5+A3nxkdun2gSWDM11/UXGolAo
         eGDO9FcMIS0rh6ZfMU1VztBEC0D91aCbAQ6FnR/zKhVlehp4vDQBY6LSxLy/Fk2QQYq4
         w69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196015; x=1791800815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        b=O7wtaZK4zaMLQwvcslT2OU5fdQBEMxtm091slUxqWAlfU9tmJ2qb6y+KYf0ij/do4N
         EabT6khmX27ooq1xrvH5NbCtUXcduhpOtVX8YDRnNmrhp/bWkN0XkUe4GnzP/vvmUeU+
         cuAIVTY+tUcMjMbfgNnBm69LgSrQL5XBK+h1ADX0ojZT7ivbmHsOwk9QaBFNuDlO2whF
         a9Dz8hiXgePYa4HDjq/sCRw39nk4S+FVTcJYWZ9s3lkzMnKMjXL27Mw/+woVt76K8Hor
         kVJ0n5JTfY3DeT3opeNeOvhid44XZautZGqCpgv+gHV4p+w6JDc9xjKTcyjIlZ3DAdIu
         uBTw==
X-Forwarded-Encrypted: i=1; AKwUvByyqz5nu1ltMqjQxfRsycsehvkjPZVy8gNSeMR/q8kydUSBleGS8o35VWGafvHHmcUipjuuUhvQv48Pslc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEBMUhMNs/PkGC98GpZaVlRozVYiFVzVrihFR5vpbTNPjHUSQE
	X0EsbBmA6S3kJX5893hResAUYk+sB3RtUkksl2ADyFdx6Yzd57PpDNiewEAtSoPlWaN4/S5+4FF
	uvhzz6w7d8dcUZdjff5Q9X/qeyFPfibsgEkoKeas=
X-Gm-Gg: AYBFou2KlOlDV0EsPCFQdagsdxYFPyyr57y970cYaz1tepESlcSgMW0NlccAruR4u0w
	e54xCeheji9GiMVhajCAtnZVFUQQHwI/V18OceezMVt8+8vc+KJ5EN0y/gjhdyedp64NWay8gpc
	sTO0kLz1rAaO2Sk0XGnmnsv/XKPk33WFzcDq0lXCAu7lGBr7GyAzznWeyhxQFljlyF8U4Tyg62z
	tfEPetp6lAu/QOP/opzhI0taKG7W1zIQrCx0O8T+Z/53k10luGshrJN4uBBtZ9xalWOet8OP9ti
	CIV/p15lTWW60dAwPEn9r0wLOrq9smX9ofMbU4Q6bkWC3FjAjayewCK1s0ElRS8TIj9Qz4tKyc6
	Xt4owBVGFDiZ/AK72kwRu+8UVppuT0wA=
X-Received: by 2002:a05:6102:291e:b0:7c0:c723:2053 with SMTP id
 ada2fe7eead31-7c0f4c96e41mr1732042137.17.1791196014389; Mon, 05 Oct 2026
 03:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com> <asNuMzqz3G-gmIiD@google.com>
In-Reply-To: <asNuMzqz3G-gmIiD@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 5 Oct 2026 03:26:37 -0700
X-Gm-Features: AclHuK9GJaR-vXymBVjABDCTEzvCLBikCIuMwz9R2xSRvkQQKV3rpJQ1IPlyOco
Message-ID: <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Justin Stitt <justinstitt@google.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 2:31=E2=80=AFAM Justin Stitt <justinstitt@google.com=
> wrote:
>
> Hi,
>
> On Thu, Oct 01, 2026 at 01:04:47PM -0700, Bill Wendling wrote:
> > On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.or=
g> wrote:
>
> <snip>
>
> > It's being #included transitively:
> >
> > In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:12=
:
> > In file included from ./include/linux/efi.h:20:
> > In file included from ./include/linux/rtc.h:18:
> > In file included from ./include/linux/nvmem-provider.h:16:
> > ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> > identifier 'size'; did you
> >       mean 'ksize'?
> >   670 |         const struct acpi_gpio_params *data __counted_by_ptr(si=
ze);
> >       |                                                              ^~=
~~
> >       |                                                              ks=
ize
> > ././include/linux/compiler_types.h:392:64: note: expanded from macro
> > '__counted_by_ptr'
> >   392 | #define __counted_by_ptr(member)
> > __attribute__((__counted_by__(member)))
> >       |
> >        ^~~~~~
> > ./include/linux/slab.h:602:8: note: 'ksize' declared here
> >   602 | size_t ksize(const void *objp);
> >       |        ^
> >
>
> I wonder if we could have a better warning here guiding you towards
> -fexperimental-late-parse-attributes?
>
I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
macros to prevent this. They're similar to `__NO_FORTIFY`.

https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com/

-bw
