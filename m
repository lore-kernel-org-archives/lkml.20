Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147650;
	b=qCho/Ub65T8aNjTyqjAFfb4aWmtsJ7YaofdQn81Q3Mn3ljKUHzfNVfEk4xRuiQ4e8LGK
	 01QYgg7dbAvcOCfPH6geKEgYxO52WnTrmsRhGDV7cA0iv/BrFSIeq6Os9PKXLK7N5nX5P
	 9Wk9AqCO3OULvFAO+I8/D6RlKyLoCGevvfzaQAdUKDmdUgL9w7E90mROo5Axjog03LSpr
	 Fhntv8OTy7/3mN+ffpgYg5gb5R5aIrOeFhdYHhY+OjbA8KyJEnzjg0v2tTxx4fAsLU2zC
	 YPoxqUiVhzTE8FLU4zee63oFEOBiTCUJSIuMNQKD+vUkqCXJlkqXLneIazxeIrX75gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147650;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=En5T3Q1CBZFMdMfVfUK6/74xR4rxJK4EOOMSyfT1adA=;
	b=UURWHfGIcupiSoPbC+OHc7O6ZjYCIfNxOTs7jtrCXFt5bp6SjMocxR5HmTYON1AXsGzV
	 H1PpoH10Id14hqKImZ36HlTvtEEHxZpSFO9J8+4zRnpt8nkrVgwRZkgPOUvmhAhIlV7f7
	 q6WqdF9gjOKcP1U1a5i3YY37KtU46/bx/BzjZS4XyjL+B8+ZcDy4mcpu1W2+ZzvKNDvDW
	 JAR5eRrfo5amiVTRR41EFAsA1/Tix6hNM4ZtoK7uDTL4YNXGF9u69bVI1lcBj2U8CGFg0
	 Z7t0bkxGzHJfny3SjCAieM2NijjC3hlMO7jZeuY5TW46FMZtL8oFsua1L1cDbtptAyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghw2KxPH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E0606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghw2KxPH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1D61F008BC
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794147649;
	bh=En5T3Q1CBZFMdMfVfUK6/74xR4rxJK4EOOMSyfT1adA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ghw2KxPHXggNIVjF9Lxp+kEoHT9S9hu0Sw5P9/7rhPL1uLyFWYUgHTfb9wd4JOB/S
	 BS72oAo1ZprkAtgDSv2GfLstGbvEo0PDts4uO3UHNocq1XC6PnupOKp7VQCSqAHmFq
	 XQfnng/aa8GCDj7mK+VJSFLP/VlC7GsaRWNozDechC6tW/fZ0wiLGHW9P19wbAvSPR
	 iSXXewbqOZ9vXdea3KOU7/HnWvybgoJZ0akLbgZatfJfU+4seNUTfOKgTfoNz/iBiO
	 ml+VrT8MNhGIAEhMWikcURQKCQZhNSd2tgiu/naIZtpNMssX3sA1bNKVpm32OOGhXR
	 T4qv7qV1cOSnw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be416e603cso42244e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:20:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFF2rR2Ahlrp8KB61gZmax3TVHnlYx1Hu9xOn1IhcwTjcBDMUxVcv2o/THCkcggOMNto1CKvVJX1nLvzyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R0CqfP0nAAWoUb2v74DX2y0QRcChFRA8hozUCAhK7YKzk+5Jy
	0iBv6cfRBK9uf+XLGxJg81d+DjuV83QcyG2lUvCbq/9fdXJBSOkCJjPettEaV7PcnNtFc+FkfBg
	WlMmN4KMP4fYgso+P7jc00711hyQ8GKk=
X-Received: by 2002:a05:6512:12c7:b0:5bf:c700:3c3a with SMTP id
 2adb3069b0e04-5c14c022ce4mr403666e87.32.1794147648467; Sun, 08 Nov 2026
 06:20:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9b73858d-fc09-4988-8bab-fd7b88db9412@yahoo.com> <310bca10-e082-4d0a-a645-42fd4e58d2a6@yahoo.com>
In-Reply-To: <310bca10-e082-4d0a-a645-42fd4e58d2a6@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 15:20:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsyZkxkmhnU_a5pXCwZg8=7N+Ui2YhQ61aLx3hdW39AQ@mail.gmail.com>
X-Gm-Features: AclHuK9cjF2StbZgIZnAHn9GNvPkXApcSfZXvvHMgKx0AC7y2IkMPjxniHEACpE
Message-ID: <CAD++jLnsyZkxkmhnU_a5pXCwZg8=7N+Ui2YhQ61aLx3hdW39AQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 02/11] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 9:07=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo.co=
m> wrote:

> Add enum rtl8365mb_family and struct rtl8365mb_family_info, which holds
> the data shared by all chips of one family: the family id, the port
> count and the init jam table. struct rtl8365mb_chip_info now points to
> it through a family_info member, and all existing chips use the
> RTL8365MB_FAMILY_C instance. rtl8365mb_get_family_info() and
> rtl8365mb_is_d() are declared in a new rtl8365mb.h so that the VLAN
> code can use them too.
>
> Use num_ports from the family info in rtl8365mb_detect() instead of a
> fixed constant, so that a family with a different port count can be
> described by its own entry.
>
> RTL8365MB_FAMILY_D is defined here but no chip uses it yet; it is
> needed by the following patches, which add family D handling for chips
> whose register layout differs from the existing ones.
>
> No functional change.
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

OK that is prettier than the prior solution for sure.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
