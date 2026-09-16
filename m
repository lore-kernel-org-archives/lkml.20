Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC345C6FC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551966; cv=none; b=H0jQxlTftwnAOjHbv/IOgKMli1FgxJvXpbyuvVZsKkZ2Oicg4VPxg5WYYuOEI5EyWBForj7QmvwELCWrzUN8WxZ+rNi9E/ejsejJsFkzs7KoIGfBJDI9A/U73TXtg8tBdKLfNX6Da7g4AFMjAAYXmuILJDK2NOZD5NeAcdRbU3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551966; c=relaxed/simple;
	bh=zgugq9bF5a+yimXJQ9CJ49FLry0pnjlitUad9lusJRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5cG06iuQahisvlrlMMliXM0/wUBQcYhWz8PDW/x0Bjxp/PoAgpj3QvXdWP2a1rbrmsOaNxjn1MzO9Ro0fvYANHnccoddTUEGWx6QQ9bNiJDupL325H7PbLRvW4d5BZPLgyiynVhy1gNoXIXpa92/PB4DgptMnU844qAuGjSpdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3c7G7mz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3c7G7mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3211F00899
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551948;
	bh=zgugq9bF5a+yimXJQ9CJ49FLry0pnjlitUad9lusJRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W3c7G7mzlSw9gbqfMBSWaPV/kzLBT7B5U7UEJ4ydjnGtU/D2GPOvPAtZVs875p5B8
	 rrx0ojuBgZlWS50XR+UBOYUYUEDZaHx4k5Koak9QrGfijB+RyV/wh4qGlBQnoNYpjq
	 5B4jcmwOkbmBD2fZN3piHLSiJKSXX/VAQj41+bkPPamA3zglJogfiu5rS+mCnsi+9Z
	 81EFqnOLmGqNE4FrvTp/d5xVU9+3sdO4D7wC88cBnCoLTUFx9WWOX3UnkZPdYJCBjc
	 QDG1O5Eei6d7s5UGEjXBJzpp+JuvNOtXgsCtHoVyNpsa1PIa4vswIDODYV7Vjs+mlL
	 cwwBIfNlKnvCA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso656341e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYhDHJYqdRmJlRP3vM3hVNywiz/wrEQbsVBqpha2UJ4YUaRiuscA1FvZaGlKUQnVm4+w6D1wbLkx7XjuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mBHEFjJg/7G8YxbMuZOm2UwLocgE54gN04DNWgs2LclWuxC4/3
	dmQ8Owx7gwGbmI3eGjxq2Lf2JKw9gQt++yfmjYdDKX1pigIgzEa+YOmTR0dy9mzNelJLOhskTgh
	NQ1Fk+OBqq8i0NFksY8Gxx6CMV9VWg+M=
X-Received: by 2002:a05:6512:1290:b0:5b0:c95:cdb9 with SMTP id
 2adb3069b0e04-5b8b661e54dmr561873e87.23.1789551946817; Wed, 16 Sep 2026
 02:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916082623.3972767-1-arnd@kernel.org>
In-Reply-To: <20260916082623.3972767-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 11:45:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
X-Gm-Features: AcwNN1VLg9mt0BIjlYKxJHsgzgkG3OqyDxyCoNNUv41KC2ewOWQB23tO-mD8VnM
Message-ID: <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix link error for CONFIG_USB=n
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:26=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Calling usb_hcd_platform_shutdown() is not possible if CONFIG_USB
> is disabled:
>
> arm-linux-gnueabi-ld: drivers/usb/fotg210/fotg210-core.o: in function `fo=
tg210_shutdown':
> fotg210-core.c:(.text+0x40): undefined reference to `usb_hcd_platform_shu=
tdown'
>
> Move this call into the hcd file to ensure this is only used
> when USB host mode is actually available.
>
> Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Good catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
