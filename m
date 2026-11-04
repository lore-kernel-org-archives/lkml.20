Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797173;
	b=0QZqEEcI/Vw8R5I734V+xGTnJBv6CQR0zyeh7UGKlPaAsRIAsNNeDW9ca94h+PSY1f8d
	 2yk3CBOdRqMplyTl/IkWB8vgPPUDzIrI8uBkLJNZ7qdIKHQuPxiJnsre+ol9Ec0g18l2S
	 kv1B0Qn0kXRFEs9F5KoD+eTaJGrEKTsCwEhbYUwuwDndUEU2jwV2OUJniqlrNn+PWKjBz
	 9jDWBxGeMvxN7oTasHYDyyb4y86a93GLyBYZGouUr3b/7A2QNNpB/tOgdF4ZIZzyb7X4r
	 9o0KDnT+TJrySRQ3tftNOfK6sH+GXCA4z9SIQ36jhbh8KFhq/iP9b4mW7W3hNsHQapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797173;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FXIxVU2ErnALAGekxCaTow6hX1frtF5kYcG5ZZqHi8U=;
	b=AJuiRrSB1RwHPqkVZwai8+FTkS8kKMlWH4BeQgNSOpQ1eEaLTVZbuPszm/7AaBA2oNze
	 udm3GEV7pNExVhXRva4k9M9OlL5w8FKYbJFyVxU9XEaX/V3g1voCk0SC0apKk9Eq4RNd3
	 Hj7S4GJ/XN1zSX65MO6G4EGnmhfWz7XbSjC7ZGnC6IIWA+KUZJAxsS1oToVpxvcDady5L
	 JMBxxWvuYDrulgTruRMegcq301xVu1HXq51Fxi10Cmvzmgb51ZC5ge2TI2t2JZb5XKe6b
	 SwpA0ec7hktG4hs3BDfbzu21GiX/ngM5P0g/V5WAgxJUql5gvBSKHak1rzoZ0A8uDYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDFAnskj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDFAnskj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3DB1F00A1E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797173;
	bh=FXIxVU2ErnALAGekxCaTow6hX1frtF5kYcG5ZZqHi8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aDFAnskjLaH9szPZ+eelP8i0JxzV/ADplIik6LrHEHu3VibxmCnue2v8685Le0+dK
	 cobUa9XuLqBS2tW+SnBCUvh8cQhdHgxXdtvxqY6d481KmL2ng4MFnFV/wR8o0C6o01
	 btC+5MRcc1xptAPJOMRCwpQXGVWkLgyO7aE/qFzQZmJnA/7uvOuTZ5cXFi4TtKRbdN
	 uQpNzORgEbX5APoBw/97Us7h3e9+6hbuS+tn9irYEqJKgjXIEhDnZGwPpRl8fw+BDJ
	 cMQ6mZyfqIT1yNPf27APP/9/R6NH1INYXZdj6jZY+QL5rJzmmIH1EVVn/QwwX7d8pI
	 Ffe0NU/NIRZ6Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso413956e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx9wTzXTf0eEY8B28WGe/wgVlGXCvu7HVgpYt3h8LoNwf78kabN2jRxgt/H3LpzDnNlK2zyYAGnOOb9VPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m6qwETWNs5NWHbMf7aniptcqkVQrSSQiCfcD5jMPaJMmUYv+2
	P1u4PToAsKeukt7rpgScvCaWqg2GA8FfhjEiaGID673HozGNeZIPCbuu545OxOJ2MJWnaX/SnIw
	HKhGbpSnF3veFDj83izH1b6DA+EnVFno=
X-Received: by 2002:a05:6512:104b:b0:5bf:e241:cd4e with SMTP id
 2adb3069b0e04-5bfe241ce90mr4030103e87.13.1793797171870; Wed, 04 Nov 2026
 04:59:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:59:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRkeftTeknrSVT9MGqA2Ep7rJ01eW+s2oFw2rj+h5HJg@mail.gmail.com>
X-Gm-Features: AclHuK9FrROF_lbQblFxEWPuulWTuq7jZ-GLjM6cpqXKsEAap45D_vvWiQC8Ya4
Message-ID: <CAD++jLkRkeftTeknrSVT9MGqA2Ep7rJ01eW+s2oFw2rj+h5HJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Input: soc_button_array - use resources to set up IRQ
 info for gpio-keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> In preparation for transitioning the driver to use static device
> properties instead of platform data to configure gpio-keys driver,
> switch to using IRQ resources attached to the gpio-keys platform device
> to communicate the IRQ selection.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
