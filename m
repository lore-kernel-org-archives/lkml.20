Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794795576;
	b=E7ZShZgkCXN7H/rj6u7q6geh8bFKQYu2piH4k2RU791DsstLmTCitFmYtO6YNt0Xv/Da
	 9GDTERdK/o74rLzVyKo+xkSUTs+GZt9kYzdJV8uSvEiCGZGof4PMYv1YuovjgdpffQ1sO
	 iM/c8faQog4imJAcu48fTLZGwDhGA57572CeLC6tnA5h/CHjJrN2pNRj4VhFYlBZ9R7IN
	 CPumjHe+6T3jv19GYrb1vKcqyVY7AQAvTH8q1mhFuT86p48Uxv321Ltx+Q8dpzcx2h/dF
	 AOWc6frlWrLOsM8PxtO+7GltVeZOPz+Fu5ZmjqKJhW0RuqwAgd/uiONcJuOZUywjocQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
	b=czoCT8KiNnlJGqKi94Y2eowmF3ML6Qs0MKuDZekUwNokog/Of9W0Z+/023O8Cxr4GDFU
	 VZm2UtvAJvQx9u1zgkvJglEL6cxvrgeCNW4ass7Vi+c9BmpBqGMyHbIgFALqT6pDBRTD8
	 L1o8/yIjp5bgmL4uoy2tAhQgFXUtWebw2DqSF0zbZyoCR5PNBfzRrS7SY+r8gsP4kGNrB
	 x0whewbdmtf2PIK+ovCs7mi8XPBiSmRyFzrePG4lzo8lUYSzuqT0MTJC3bjA/Tai10HCN
	 WrRonakg4Lb6zrkyKz4W6OUKNGWS1nroR6ryAQeRaa0O5KLdgxPVosOnckH/UHJNu4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+aKieXX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6892D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6892D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+aKieXX
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99071945aa7so2488972241.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795575; cv=none;
        d=google.com; s=arc-20260327;
        b=WKPNs73I7HVpKKeE+q5MYtlZaCNUu+MdIGtEqkV2rSfddfvjMGFhrHWlp5B5C52yzh
         lRqN03mMlsvi2nZ7ROJbwsyEy+z1GM5371npzKWnLIUUhfwo1HxbLDFLW4reo4wPTRQ8
         ZY8znSk4Sz0QiafwgfYXNEQzjiN2Aju/djdxMKC61Obs7XxoEvitavj+ZAPCgES4BkUp
         l35BZH6/4tkvJLISe2nshTgNPAllAYkZQOyVFilEvFzgBnvY+MxTlqobmGybzhG5jByj
         jWvD6Wx6ZEwy4tmivtYRdOhdAh7fLHaC3kAP7kQSIqxdQLPX+HcVsLs3+OuQQYIIQTbP
         1BIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        fh=+ZlG7sW1CkiTQ+4E/T2N+ZuKNsClr4Sn1h5t5vSsaaU=;
        b=eQJjuAtB1Bj1iV6POwg+HWA7s6Afg4gupvzVQQQs/XgH2f42YyZpBumPb4726a8eNr
         o5nMMGm5QZTaubTgC5A+PCNgxzR/HP/ySKjGrs4Qsct4dmrQQN8uuRjBXEM2aeJUAnAL
         Na/J6OTGvYysTlREUTCWjz8hHLFeGiMqQ7WkYjP7TxWzG7KBVpYxHVVsRfHXV7GzWxI4
         yhi2O0nJT2U9G80eRObvY68U/c/WPHPxb7Ug9YgKVlVlgNO2gtOoYSV1nmHiijBY2CiW
         rZ4usPJxt3cTNlgaz7MDotBv1/TEGJQkfPHWEIqdBwBe55B3q2x5EJvcXBKWpPwErXPf
         UKRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795575; x=1795400375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=e+aKieXX28wy1z90SvvDUEfXG40bdUCilhlsbWWtTSVtxr5Y5PS9tcVYFQ1wFiAp+0
         YzM8FEk1gj97v3jGqqDApXL8b/Iim6PxB0Yipbwvu04BHckRRlrzuGO13wodnsQ8sA4s
         Lwcw1wQMlYWTUDYnLqDd3UWwuBlYjjl+cyTrUmGCO/ycrtG06sh3/3ZQFsmvXR4uGRuO
         iFL2eykTbnoKHLNzlD0ByvodwSIGaQ3f9VoEKuP1Rt/Au1gX6LTQBgRdsM0PA4K14lXy
         PwBifVLntfO5qVwJ0pi78vyqqmrxP7ZuOfs40bXQEdinRoDCVJN26M908SDujOm6edYy
         Ayvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795575; x=1795400375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=IT+VF6b1xQBjquhE9+uOYfyGylqkAtje0hzvI8/5UErkwdgmnDBUcAjLxO0QrohdGf
         4qu3YIMtCtQu7K+qYY3R1BmSzfr0ZwYUmC+lxnmjXWNqD1/FK1z8ie0Ku3ABc/FepTsb
         n82qCt8OOIqzwqLuoYV4q/viiUJDVWVioEN89x06e+L4lsVA4HCesuMhPEfqjTH5aj+3
         zNeSt07sgaJl490d+ChlVjH/VqkGYX2Jk8+pV8lWFXHyqN1li/Z4/XVGGXNqWpoy0pTh
         phu47ufWrIR6+nnago4IA8ouWS1rbWoWl7Hc+8haqkblOyqrM6I2CS4HDAt640/ERd+I
         O6rQ==
X-Forwarded-Encrypted: i=1; AL+hErFI6bTave0KKDmnXZM9OUOvXINrXd80OFpVl6/uVmBrZT6n8F3AskzAX2iCAFarNywylXgd6mZIcZ3CgCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p2h+nFjkTr+gPhB+H5BGiaJH02hhBKuzhAsFnfIdJY+mFFmwP
	olyIfWmZjK89I10erKWdez9D4i3GQryXRG9cVO8udgpv4p1d04klaRWL+wnAf2Vwd4bFbPu0rqG
	uGBZYej0JCeF5yC1RZ3qqOWjcNCyKom8=
X-Gm-Gg: AYBFou3tIsOMi48kGPFit0yTKcr1PdLWdTaHRlB8Ayi6lYvV3HxWOkWj6RrxthSpiB/
	7tjM20pPToflHZFBDw2SVYLiKRgjeXw4IldBuQVBxfs7GE1fdjzssycXBbohdrRVDcPOyCJlL6T
	xoSglzpaITRY4YL0AH1T0ZTYAqeKs4Qhh0BWxvpGwNdIFpTca+LfpaaJ0O9ifUV4wl24lN17+xt
	gO4RwIg3VZs6r2Dpbd0h1oWvzjLJaVzY81qyitOfE/HqN1vck6/9FKq2pm5HNAZXvlgmGrvgPrG
	VWcoFoA5Qg4418r1r4AhAaK51bDUXpjyTuXZCvOhfk6ucBv+fSJ3osmtBtU+oHG/alAFjezwz3J
	0zZkQwmYye4NDQLakBy4AOOezd/lkXoSRBtWUepkONDXzm4Kt5XNK7RYwMxNht0e6iTb+GjmyfO
	RKnDbAmhTOupanwrzvBYh+U0qhRiGl7SbkEzr1/ELI8NNUavLPc0JfUyRNSrLIbqB1rdcJj7Cpn
	t+3KxLtgQV7la9U0tgREk71MueEcw==
X-Received: by 2002:a05:6102:2c8d:b0:7cc:828b:421b with SMTP id
 ada2fe7eead31-7d64d6ca4dbmr3337958137.6.1794795575374; Sun, 15 Nov 2026
 18:19:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org>
In-Reply-To: <179479100276.3291.7162632058743254408@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:19:24 -0700
X-Gm-Features: Aa3M54oUIJGqhOxY6fZncLdECG4spZRJMb8V-mVzn2dq9iEZ8uyZ_G6ksg29zgg
Message-ID: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
