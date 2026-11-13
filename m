Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794538509;
	b=Moy2DE50cIqzjcUpb3bIqJ0gJ+sqoixFpJfh0OSlSKslDgLFpKIclzra3YQoTfTjHKXP
	 nCumKfeauy2muMwM7/lHyF7Y+xQ2lyz2ehlwiVSNMpiloae401hMyXxTVDAosOGcttLGn
	 rp8nVn8ZGFfFIVuACtPjopjM0ZRIUi3N1Pbev6c3Xo25DfB2hUgF6EEdJddEVU2Ijb6KT
	 oMkrQy82k6bqkBg1Gg3qhRddTcoQ4nM/dzzB9Yn8TGJj2KutAHOtbE4kBIbcMgyDfEwd7
	 WZ3IHm3Yc1FVz257gf7JHLkhlKja9X0aJUdg2sjgE22SESvG6pISc2lO+0rvApCyZuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
	b=ebDMz7fWZMPeV3Syr/+rDG57bo8YctPBu6xP9ou+5hgOGh3IJV8I4TdnA3LwAYSULhDj
	 iYnmPK8v+GaRO6fIOD8EeKvCMGXZwm8OAggMyxEq5+B/vuB7HuhKtT+1JygegYTeXMuB/
	 ie3NRRRXP8M+3XrZDtPoYkiB6rbWuRXnOEq4avplLuU5hTuvIuzU+ZUlmMe5bR9EuAEWL
	 OeM9jHkxoSNAOj6UUJEciWEfGlIvpPEVp/IsEFaxuUI26b5oYau5cZkbgjvfqVA2/XGU0
	 0t6B8tKzq2UD75mVo8t0chSRTud2AQPDqThF4vb/oCw5+Wb5NWKkdh+aVmSAgVY8fXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8A606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE8A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a7so454272d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794538508; cv=none;
        d=google.com; s=arc-20260327;
        b=SNviY3VD7LIEvIPuPCjQDhjgUea8JDg9C524uuvJe0mtu/gAHlNqk3aeb+hxUbMaNK
         g6Of+a2CebbzT207raE0oMHJ31OI+DmV9RtRFqrKK8CGiM0K/MCdTVm5byNNAkvbHBNK
         H970ZDnSLod6DgRUuQ+ubN8jtj0D/n+GRQQq6eDCnK4yvwD7Qt3GE6j0/sSiA37We8lD
         h85/BjFz2QXIctx4yUT4uftq29IO1FdCiwrY21T079sdiV0tS1afDlDGLox0fhwlVA3Z
         qXzStakKhZXEgFsM/O4EIimaGKny9ctBMliXYo9v1kjSpEnvsZyaMduD2xCxDBsgPCH8
         xtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        fh=Sy9c4EoYdaBg+OxtHZmbk89NbgL0n7nwrhPFlU1IgXQ=;
        b=BNdQ0an07/NCY+jYk1gKr/f/Hgi8iG/VejFq4TfPY+83N0oNRNEri8CEMkAYJKspbS
         bjTiFUGIgSrcVY5hZjLYWRckZCSiSjquNf4E0aEWogwCl1TarZTl5vLBYW3MG+TwoJwY
         pTafOXbCgY0uShrD3EmiWMuK8rnHa2r5hvO1H+Zf2fP3Q3ygPzxlwQSTHT4sv/EMqqmL
         6karF63YAlYmVvWQtZh0gM/UbSc6/2AQQHYhEmUXZCP8t5d9M8t8wZaH+Ksx6tDkOMq8
         gE9OnstqKh7Frbo3jzBTV18qDX2jOz+dWdQltVk1BY3cNNcbLhz0T0zelhl8sHMcCoMt
         vtmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794538508; x=1795143308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=cfMDacLG8z5L1KijJ6WpfqoVtMnSg7D8XZ5tsiDdz2CqKktuXLlbD7h94kpjdl1/7b
         C9aE2Mt+Vmjn0zOJ228wsa6m/1EYkj4AUAvK4/n1l2fZDAxmemJ4JmrlN72c7nlHGDua
         tkc/zZ81gRVblWv/lVLluemgBz6hCHNVaSc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538508; x=1795143308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=U0jh+4gaGhbVVgHm3StYCjPW/sHreNywQ7sL985VG+8WIFj2yqT8spLvsGCXxWZ4dn
         Yc/W7xu6t2y7lCqZVhn2uJzm2rOKtOwRX76XL6OWv3UUWLijWAdEMyN7DV74HB/SAUKi
         fM2BykzG+DQE3Be+rkE7ohRMDiPxOf92YLsDtZ+iIM/xxvQ1DwZQ0zacEzyXr21rHmvt
         FXRINXtw/CZD8dX2yurPc2p6ZC4ViTyG/J6q1omAEdwkiahdG/gfLkN4OIdWX8RzcSGQ
         KXe4/neKAPLhrSFCgPOFKpUqM9JU6R3euvI0yKrR7o0vh2XKZGSEj91i/Myy8DotFrHw
         3rrg==
X-Forwarded-Encrypted: i=1; AL+hErFG3LNb3N85hm1cNID4GIkUm1UzD7pQ5aNRYlJkFZDuFhb0SczkKEE259yCSgnx/RMefjvI7f3aPjvGLQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z830yFyNNjOGdEjzM/lBosZsWlQQFDHx9P/DzH0DSlf5KRpsZdv
	i8I7AQT4poZ4Dl7+YMHYauzuN0946JpJlV/ibFal9aCG14idMQoiFRKv7GLTwMSYQyKqH/o/Cdp
	oxfYqGXApLz6nN/cUsbdbICa+xIRQZ+d8M1ms7of8
X-Gm-Gg: AYBFou1ZeEUamPd08s1kLmG2HV1+vncpgekeqKzyZGxgY7UhZm40pIhGncGOM0LQSE2
	sipJywefl/qFiRLwILGNa+derhABdm5tiDwwMxsjdcsVPc2iWMuraiPc+b4c8QhS8K2hOUhvPWS
	TU7OYWpn4L4WezketJRowAsfKthTcmSoceNv1c/9R0FGAVu+3tMueU1vIt0uow8Zbei6p7TDwKa
	xlMKYjjpZEGpeUPVMxMD0kshnoQBt7Zqrv0klDB6SI8ICXLZOC5/9/TekrhrhEFVoLoRnH1+In/
	8ixNR/d8dKcw/LVKqKGhHnzbfbsZbqQzjVz4AIXU5WTvf9esyorwO6/l8Bkp6RBvvEwKasfLtjd
	DVHwnkuoR0IZ4psUmkqjQGqEfkjS6cVdFI2tdZw==
X-Received: by 2002:a53:d5c2:0:b0:67c:7317:de93 with SMTP id
 956f58d0204a3-67d8976bb2cmr676238d50.91.1794538508154; Thu, 12 Nov 2026
 18:55:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll> <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org> <avZkfg6WMlMzOxpn@google.com>
In-Reply-To: <avZkfg6WMlMzOxpn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Nov 2026 11:54:56 +0900
X-Gm-Features: AclHuK-84j9IBFkhrVUuvk8buFltZEjB8ro1aPwuBHaC_xvB0gZrSc9m2OIxmfE
Message-ID: <CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM binding
To: Brian Norris <briannorris@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:48=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:

[...]

> If I do keep these as literal firmware IDs: does that mean you'd prefer
> these not be in dt-bindings/? Many of them (especially the IRQ IDs
> you're pointing at) are not needed at all in the kernel side; they serve
> more as naming documentation than anything else. I can just inline them
> into the DTS. But I'd prefer having macro names for LPCM IDs and
> similar, as it vastly helps DTS readability.

I think Krzysztof said as much when we added macros for MediaTek pinctrl
numbers. They are just symbolic names for easier reference. OTOH a binding
is a contract between the device tree and the software implementation.
And if it's not a binding, then it doesn't belong in the bindings directory=
.

What MediaTek did was put the header files together with the .dts files.

Hope that helps.


ChenYu
