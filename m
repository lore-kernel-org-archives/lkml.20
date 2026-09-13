Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7236B915
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323400; cv=none; b=AHo7n1+UumARl9ocmIf/81MhNHOuubvOgDSGi3BEbBtDPDWhzDR0H5Ve0yTkQ8lX/OuwikqUPLuNb4+TWMOXgNIgTaTYtXc0kvDctk3ukYLWleoJjjgW5zDSeLnYEVvUqYtWajzsUG39hRywFLgU7UAfBA20miTyX9fFZ/hh37E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323400; c=relaxed/simple;
	bh=1QzAB9p90Qh27J4J7gZjVOxRVC4biyKLymcKKMOew8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gF/KOEIf2qs/PAa0xrMrpVuHJWOU/xue5uZRB4/NdAvNhfA3K7jhGW6z6MwgiYBl2o7IRJnjlDRpElGLjLn47O3/I6K9XRr3/5D5zONcAkUIWH+1qJHcCqJsXGVIMbPol4DlWXOgZc4UTIDaMGa7rqc44zKkk38SbcK5gi607z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBqNvLj8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBqNvLj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638A51F0089A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323391;
	bh=B68nppT0QcAiLKpkM0HEbPdldxHI7O8D13NwaFCKN2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KBqNvLj8M30QvF8wNwTMLMAO7d7WHXsFbnJq+0hZtOnrQ2FTs2QmCu5vDGt9GatNy
	 DYFidwu6cV2RV1odUeUGg3Db/gCaKVMQ/tFlTl+/tqHOMHuUNovSoC0sojF2YTsYpp
	 Xh3+ibmfSVtrkNKiEpwm6bcnAqbkc+9oaPkd9ScLKfkkrysHkjpbm4+xGCoFp6zedi
	 8O8i7V+6uL/eyzjPsc097bVQXhk8Se00sd5OMAVlaJIJU7gDBs1/oCabQbhfK69AZ7
	 k7zXzNfOewM96VRBxLjkJvLtYJXoy1gH7plUc0qlPiVSNjSqAkypLTBaa54WYn8Xv0
	 2MFrzfRyiEUcg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1473127e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynouoCkHo+hLTAqLnh/3qG2hygrmkwufII2nK/s71xHqJ07178JNTxtMIEz+e1rUQKtD3vjnv6Wg3r5Js=@vger.kernel.org
X-Gm-Message-State: AFuF++mArDN+515dkC9OIT1VxjIiX7NAC+P7kLuE+r1EVN9UX58KqD9k
	malSHONHPW5+ssCWd+QEA+f6a77HW1I49/a6GOZ1U+94fhC2UC3LwRUfs7+cAAmIQg6TgzLfRs1
	JE6KtBvD5B9qGUQhgQbW0X8uW0WrLjCI=
X-Received: by 2002:a05:6512:32c8:b0:5b8:99b0:6565 with SMTP id
 2adb3069b0e04-5b8a02dcf81mr5093133e87.6.1789323390098; Sun, 13 Sep 2026
 11:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913120458.1608186-1-liuc63@xiaopeng.com>
In-Reply-To: <20260913120458.1608186-1-liuc63@xiaopeng.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 13 Sep 2026 20:16:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUz=GKfHd6j5svCNu9e6zL6jsK-xRMd21SrwaAR3yQZA@mail.gmail.com>
X-Gm-Features: AcwNN1XsHvl-bnev7PrSVwTkVmzQlXlyVTNsLE8toU-j9kSrl2CejoCFliw7gTE
Message-ID: <CAD++jLnUz=GKfHd6j5svCNu9e6zL6jsK-xRMd21SrwaAR3yQZA@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: validate endpoint index in ep0 handlers
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:05=E2=80=AFPM Liu Chao <liuc63@xiaopeng.com> wrot=
e:

> fotg210_set_feature(), fotg210_clear_feature() and fotg210_get_status()
> use wIndex from the USB setup packet to index the fotg210->ep[] array
> without verifying that the endpoint number falls below
> FOTG210_MAX_NUM_EP (5).  USB_ENDPOINT_NUMBER_MASK is 0x0f, so a
> malicious host can issue a setup packet with wIndex 5..15, resulting in
> an out-of-bounds array read.  The resulting wild pointer is then
> dereferenced in fotg210_set_epnstall() or fotg210_is_epnstall(), which
> compute an MMIO register offset from ep->epnum and perform iowrite32
> through it.
>
> fotg210_clear_feature() is especially problematic: the out-of-bounds
> access occurs at function entry (source-level) regardless of which
> USB_RECIP_* case is taken, because the ep pointer is computed before the
> switch statement.
>
> Add upper-bound checks on the endpoint number derived from wIndex in
> all three functions.  Invalid endpoint numbers in clear_feature now
> trigger fotg210_request_error() (STALL) instead of silently falling
> through to fotg210_set_cxdone().  Also add the missing le16_to_cpu()
> conversion for ctrl->wIndex in fotg210_get_status() to fix a sparse
> endianness warning.
>
> Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

That's a good catch.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
