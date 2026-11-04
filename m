Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798920;
	b=UfdgnCYC5wGYzJO/8Rn9NTX4xu6vaAKBLhRAROBlQL/w3adn/KZYuEeqUXnnPU2cnrfI
	 +VTUneP2Iuqm8mIOd1Czu+ebY+UbAE51e8e9gONG/Bbm6+YUmcorzMI+GArdcL5+F/koP
	 wr4hnFx8hsvkMCSaGpr4FlkjfceTiTTuboEOTD5bm5TTtClIKV2ILDXDd/ShuGHMvv2EZ
	 91+GsuQxon8XybODIKkFJdHf23AaXdST8X1kqKxSJZNLbezYbd2G4/DruAtI3VhSfhiUB
	 5Iy3cdqNZ7NttcTRZaTK5TA472KkWwqxS1Ln4EhwdRtOKzOFHqi62Hg+TW658QFq9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798920;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=;
	b=HKXO3A2Ze0NrsNcc1pU2RRs0qOZLdmhILef/U4GEgB7K7stGn4X5B2wWmnKeZ2hnXeQx
	 DLdvDKhgg7VTYCDZu4xvqCVkHYs0RRBIXEz2UhgtiT4gDoSFSuz8HtdeljL4MbUEya+fu
	 gCZFNHgmJ58sTi7hRYTlLPaJgLN3OQcAOT6/rUhkOL0ehuuI+kR394uZcJeVTUn0HaVV8
	 lqAYvmES9qkHIiuD/0dUjr0CvoUjDpOkY2OIIEqL60SEAhVWZBv/+rJijSLiq4Cn7KElB
	 ih8xFYaH5L89cOg2wfhOdLNQAj3Z9NWgVvoqC52Ey4k7souGZVlkiLrIFl6vfH9pflg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2lXRFfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA840606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2lXRFfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4959A1F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798919;
	bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T2lXRFfXZaLRNZ/0XiTfwEfhqfbR/AxqmiJ/PC48id2dU+KepIz8CsgB/a4Xk67h2
	 7JAh6FXQ9U0YT/jtJK7cG4KAAhceexawpksqe7tvilSADeR9nKQ3V9J/Iq5li0qQcA
	 ii9LuccCIOogG5K7/sYje7YG/OIwCrqbXpUhtOauxI0PX5wJVkn02lUhN1Fse1pFKu
	 2bnCsKzc/NRVJfJzrrpTojvgbZClmYAPEgp7KXnmQS27x6F0FeIBY5fj42fvHJeIad
	 s3nZOmI5k4euB7uEzu6BX7BtwLHl6jNetFdv7vFeRkJYpFupdnXsUI9EVJ6XOgFWGx
	 xhCD2R/KEoZxg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso538293e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByM/aJRDUq2jIOh97lJeSGBTVHds7j0t5vbN/Jg/0cmk5YkEGfKp2JKmU83xJFGpUely0jAJ2e5CB1LkVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jVIHvjEEpjz/UkCvJr76nBI8QEyvtCobQCFFvo2FnlkxJrKm+
	SRRA3ccu1uPz8MgP8PvG063L4A+wDnLSIIGzOsRAT/96vmIUrELu8kJRx6ZKJjMoOdCZvURjL/N
	ezEkE8rXcPOc36AQLtQFqKwtWC1qgqm8=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr6161437e87.59.1793798917566; Wed, 04 Nov 2026
 05:28:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
In-Reply-To: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:28:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
X-Gm-Features: AclHuK_cAGzrhoW8feJiHqlVa1pPLSLWgUyyK-IC6FwMXxU_M-CdGLm6sZ7z9jw
Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Vikrant Yadav <vikrantyadav4802@gmail.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: lorenzo@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
<vikrantyadav4802@gmail.com> wrote:

> In airoha_pinconf_get(), the last branch of bias check
> "else if (pull_up || pull_down)", has no check on the requested
> parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> reaches this branch, which returns -EINVAL. Reading back a pull-up or
> pull-down therefore always fails.
>
> Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>

Maybe Christian can ACK this patch if it looks right?

Yours,
Linus Walleij
