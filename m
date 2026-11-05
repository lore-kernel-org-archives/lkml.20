Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870680;
	b=jy8OG/dYKBbS+4B11SBDLWb5isguN/85Nsc/V/0oGPCmEWS0Z4rWAw6iEASbj0c+vTNy
	 nLUapuGkCZcEhon+5HAgdpO7Rqww9usuZ36fO5rtCm/G8YU8Z68aNpJTiRuHKU1NHRhv1
	 KDkUqx+AGLnR4ZcVqBxwVPrdCb7Z9nfa4S5+RIMcWL/alcNkayseFouvnZ9B/7t0wwXO+
	 QBgdmv8XSNMADrZOJQEuDgxUbArk1qUyBKbRwJvvJEBsHelHLB8jaz7HKqU7DnEO0xvKK
	 XHkPKvdov+9+6eHJiahgnknFn9IJc2gj9GIeGw8bYxjCzt9aEQ/73n3zYXpdsBWaE+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870680;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=;
	b=UrVM8z0XISoAQH5Wr1UuaT0ufgKEsO5l7EVJY8UZosk5e/Jw89cerIrlZxPztDVKiBzE
	 QBSbf90EKShIxjQtS/bpOCmQU3yKiT4j9VxhdylvvkWvu/5/09kkNgx8BznQZW9u5DKJ3
	 jBXe9dKiFLOu1fIAj/n1dAF8Ruxs50i615/8TssYI+wssQxZw9+U2iyFjoTeMM+y3itLw
	 5ClJlIktM7MmgLrbNnrxRPwyFCnMIsisSGgmQL//BUQT/uMpBsje+GQyw1WvaowfuIayj
	 kUA8Cpfxo1Xt5BnF5AUuPNOEx5c/4dhNIElBA6CoujS2I7LDK2E7wajcbAln7dAdUOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkakNWVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C530606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkakNWVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EAB1F00A1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870678;
	bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NkakNWVrpeJsHpQJZkDxNGNiBhdjE5CTeu0BAedaN9KKhqePQp6RTOZf4Bek5pCVN
	 bVJwEl6wMnv6pqrJVQ4so2nmQ+AnR2RQnxHTv92qHB+7P/ijwgoJyNXhi+YMHvtPVF
	 H/IPvS22QXuSFDaizD8YzQCYn3REuSABlBf6sklJqw4ZbDNLbkzKhkjHG/2iaoZ5wd
	 LWRdvXjuk24Zl30+q8nxvnaty1AX5vsSfYRlAXL3bG5h71c9Jvcb6k3aMcV5nqYuL/
	 q2iZfTm+9naaoTCsOhcA08yYYVPZJ4sqyp9qqb1aEdubjBKDlGqdPBNRRoWPJMmhBw
	 ZV5HMsbtriN6w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1309677e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwYDS23R0iaPfg/bQsWXVw/KbDpAiUuBKfNyv3sgB0O3xyQWyjKadhh3JcZt5044We6mB2WQss2UHVNy5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eBYRAyJ3pO+cXSu03R46qRcvJ0xMqNWmEElX+1XUL7MYSG/+T
	gP3fSFAw2eZIRl3JMQdFc88wcfxi81bzEsqXcgPExUebhbigdXVEvB4FpRk4guwdoGJjthac+6s
	baF0KGuC0/bNO+eTsgC+CoLpjaBkHTB0=
X-Received: by 2002:a05:6512:3f17:b0:5bf:d1c4:a01d with SMTP id
 2adb3069b0e04-5bfd95206b9mr6296528e87.2.1793870677493; Thu, 05 Nov 2026
 01:24:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-7-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:24:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
X-Gm-Features: AclHuK8yYE1rSjLkW5nBivqJEc5ZKlRnSUlmLXkEBc7bHuzlAPbz8NNmplKC7xw
Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
Subject: Re: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:30=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> In rtd_pconf_parse_conf(), the RTD_HIGH_VIL case prepares mask as
> BIT(hvil_off) for regmap_update_bits(), but sets val =3D 1 without
> shifting it to hvil_off.  Whenever hvil_off is non-zero,
> regmap_update_bits() masks val with BIT(hvil_off) and clears the high
> VIL bit instead of setting it.
>
> Set val to BIT(hvil_off) so that the target bit is set as intended.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Closes: https://sashiko.dev/#/bug/linux-e7077311-3f30-4b77-844b-1447519d0=
c84
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 6/10 applied for fixes!

Yours,
Linus Walleij
