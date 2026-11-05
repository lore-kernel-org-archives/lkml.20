Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867196;
	b=NO0pXBunyv7sy98CyPr84Zt0Z21MuEEBHonyk/ykzuFW/yvvsxHVkYwxgfZS+QarrABt
	 xKgu3v9IAxGWFKoIzdSU/jU+rYL1vwYIek0UrC0LqP4KjX9kFampz8u8nu1WikouU1xR6
	 YcXUolTyQpURgtjrUUIHuT4F3r38p8Ya8WBpg91pAQB/SgAEiCaC06rkA3+LfBLFIKjac
	 vzSDs5/PIs7dW9WWyJkKL4bQXmSPwwX6DWLrZk7nuHxRBm2rCNYrNjRk6gGB1mt4y1woO
	 EvxyEYCbMOOqnFNyx7URJqf/DC0YrxzhxOPXJBUOiC1IhWDPhebc9BH35Osovn5qNdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867196;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OlC0a2ul9HWhcXICka+GJASx10l3FgSlBIOMYENgx4Q=;
	b=BgssqCm03RdSaYWx4o0F0LSb4BlfEMg1XXeiAaHjkj2pTIGCbYnZayy/PmNNudoIbkCt
	 rE0+FhUwWeefRoGhnuYQXHfxtCpgl2QQGAdaiMXrQPOc3vC9sluGAY9bDrdmRj1VFHWCJ
	 h1JvoRZWM3VlxVl8wtkkHAkpsdf6y2Xuhc7J3YPYlZyBiezul7y0e3z6eQFi+e3GOgJVb
	 a0KO6EgYsMbCo9CKSS9JYxcpQp7pldj9Oc3xjCHyD4+4EXxVtfe9kYUaFvpud4PVgMunU
	 vARiy1xqDl9MO+dCJ/WN019VIM1D/YPhkrgCIQ9v1vamQ+3JzNv6dA0vJyxb9Qlci1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8+l8TWO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB02606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8+l8TWO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291811F00A15
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867195;
	bh=OlC0a2ul9HWhcXICka+GJASx10l3FgSlBIOMYENgx4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8+l8TWO0fESaT3f5tljg+jTos3ZA5GZhNEHGi+NbA5lcArNWDI4w8eUxzwvherSW
	 6lLHyggvnBYoDCHxtag2FWGJEOmAh89hZnAk0vqfeG9p/wc6UPz/Ee9etbjb0R5bvY
	 riyRA4zCuKgYR/7gTcdmZ70uEItCNuFqEnrJQg1zXSn7c80V8mzbIIHkw82MkI9PH7
	 YyyGH2g+i6K82Vp8UKLjtgvVCK3bh8jLMgSi7W+wj9KNe5cAOhaliFLOD6DT5WDNhP
	 Lw4Vf9cReOs4AJmFLg+CBMwoPQdc1OVo3ICQUjjJl6Zj5PuKKByVRq9VXGfjdL0i7/
	 HGe+3jEbW8aSQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1291846e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:26:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzeGEBQQouGrKtnOsfbVZD9El8Gn0tWs/gdmOpQkac1zkZ2U6eNWqAagIsZw8qV8d7soaxMnfMCE3WB06Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X9fQsMMyYsnPXZ3zRNlGdCjpcBqIT3l94nmgOO2GBUAViaHI7
	r1O8g6AWeMo/3JmH9nQqdP481M1RIp1ZJi+bLSOzrC0frgz6MYlwrbd+RZp5COChdPDycI+Klxi
	Jr4MMObrpyUCNLS+WQtdnTor3sf59mLI=
X-Received: by 2002:a05:6512:3d93:b0:5bf:f39f:cfc1 with SMTP id
 2adb3069b0e04-5bff39fd13amr2013894e87.31.1793867193962; Thu, 05 Nov 2026
 00:26:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com> <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:26:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSLHtCHoUc8z85_YKVdpUBYZ9p+NkzGz0EDooPKCKMLQ@mail.gmail.com>
X-Gm-Features: AclHuK_fEMFEgEPUDEtLQLuYwPxMgxrsUccIzkDFy39W3E-690CJclgTO-eP9T0
Message-ID: <CAD++jLmSLHtCHoUc8z85_YKVdpUBYZ9p+NkzGz0EDooPKCKMLQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/23] gpio: Unify style of pci_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Michael Buesch <m@bues.ch>, Andy Shevchenko <andy@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Robert Richter <rric@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:50=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:

> Update the various of_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>  - at most one entry per line;
>
> Adapt the few offenders accordingly.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
