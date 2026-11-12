Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515053;
	b=aYCF6dIqc46cEPjHLY+/F88KHPvH9k3RFDk8gHb1pPHgUegnxEFjNBIQjNb5I6n7I+HC
	 KvgPRrMdnIF3Sy/ae5d3949OpKvf137yMsJ37heGO5HzWxcoEQH+sWHCRYUL0nhxWeMn9
	 49KgfErY3vnMCXae6mA0yhCPLRIoIYdDyYE6j4BGm0kItfisLhjoyNqudqxFK/D9xMTfX
	 i/1rBYI0SPg8u9v4haj6exJd8mz9rOCpvnAFQeU/v3IYDqPNgdA6w8gGQMfa+6ytXgCHs
	 pJ71eLGwserDSujETv905GPNdGmKpF4O7yzCG9Q9+OUK1IPDZeWKd12VSf758oOrKbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515053;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wy7wcuO+o4qwVfwmHEs2L+LxiScTi/wwTKAT+OvItWc=;
	b=a+1z7pr0J16DQt2cwh82n0kcJVlIfnrglYTSMB5Xj8HPgAlD6xviLgoxbKeZHcC1no49
	 GjpeXEF8skGzp94880qfvFEH5kjFsOlfXXWOVjSWygUvQNEBIt+25VDIrPbwhnVwI1E/W
	 k/7xlyxzw9XYsSLXj4/uxSXultVYe9SsdCmwwqg4CyGA6CjVAboyHtDooekZSz2QeXMSj
	 ZGm/aQ44rRr+NSVcTWAcctyxzRkKEwgcDSmgE4Nn7zJKcjbuGnRk+Fj0GLS+qrrmjFeIg
	 rHNu2NPYCRry8MQGJkyV4ndHhAVnny3LTPE3omQSkRIHo2mxDkp8eYbh001lR+8vm9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZtouUD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33EB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZtouUD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F641F000CE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515053;
	bh=Wy7wcuO+o4qwVfwmHEs2L+LxiScTi/wwTKAT+OvItWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YZtouUD3y2UQQY63gblnWy1X/af46ScLWp0ywPu9OO4f7eBqe4vfvf6OaVpmr37pA
	 A46ZVXBe+MLuqjG3jWAkFDKRZRB7pgcBD+hp9M/QZxwLJ6FSu76IO/4dqzYhgu4ZRx
	 uo2TJCDdnSc8Vmd+XD9AgoK8LyCvfb4/dRUgZtv2G+ijMciXMlRSE1CoP6Yhtpw1VH
	 Yi/FpAQJ+TYPoVi26C4fKVO8Ek63i1DKjT9WjobA06txr3WKh2Z94VQniue32XvT+E
	 jDjinJOR4njnqFbwWtvZum2zZ6LRah6nG454Y3actQZ+U7nHSF+JFU0D0wSIG8vSZg
	 ezOp06kKKuUyA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so242090e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:24:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFirC1SQqFchPN1mpu55TD/rg7fwJ6yMwmYvKgjvF4Dqpq1f2iTrkE/dOwUmT9aKeezQEOtDp/TJ63b648=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PKQoE6n6PaiMxMQLPEU2JzSD3oLScjOTPVWymWiAO4+9ZzdbB
	LZu2HQR+rfo36xmy909RXZ1pIcWuQINQZO8eemB7zW1lNGlRCauBVgfjiUX++g+m7B9W5ItfAiT
	dO3WewWvqbbMerVoXVyiZDYzV/6Vs8OQ=
X-Received: by 2002:a05:6512:b95:b0:5c1:4c0a:49e3 with SMTP id
 2adb3069b0e04-5c170b1c2f1mr210546e87.13.1794515051740; Thu, 12 Nov 2026
 12:24:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d9da17af-f49e-4878-a8dd-59a8919e6930@yahoo.com> <b86b9176-3ece-40ac-8fc2-75a3d079829f@yahoo.com>
In-Reply-To: <b86b9176-3ece-40ac-8fc2-75a3d079829f@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLmtQerZ6frMe4gw5a9BKgqGeaCQHZSgSMu4N3x0f_iVOQ@mail.gmail.com>
X-Gm-Features: AclHuK9hSel9qovXywvPSFCFEUdNdSWtaQhroOf_WWjAb0X2PxslIg6pR4jx57c
Message-ID: <CAD++jLmtQerZ6frMe4gw5a9BKgqGeaCQHZSgSMu4N3x0f_iVOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/12] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:33=E2=80=AFPM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> Move the external interface force-mode configuration behind struct
> rtl8365mb_family_info, so that family D can provide its own versions
> without is_d() checks in the shared code. The existing code becomes
> the family C implementation and is otherwise unchanged. The
> mac_link_up() and mac_link_down() callbacks call it through the family
> info.
>
> No functional change.
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
