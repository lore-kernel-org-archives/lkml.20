Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538838734D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049970; cv=pass; b=EGWrbvCmUwpQxCx5P3jGrqYlK4a6PtO0HGSNeBxzsMQg3L0ZdCQfllSv6TkC0uVN6cyI/YbQj9aiqDH9TlL4YR75ijD0dyuov/WG3jkDP0wkQPGJQ8HuDoTMuykaYWoWntE0lg07Ms3v6mpSuM4p3aTTqFbRjr+X2dC6Qj5EAYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049970; c=relaxed/simple;
	bh=vxWtWY3HzhdcLD80hVcaFM9T8LFY9yejGPC1lkqa+7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faCKrCM3lGNcqQP2iV6cRbGSgufwMEwRC6Zx0nqFZ1Tz0yS55/Iz9Q90lh4CDIL/0ny1Lch2yUkJ8YGsKrZcWMDzx7s6bOlwwSWkC7x4SgM2def6d2kpMCJo6tYMA1G8257GLv83oC7XNiw8fLRLLRpvHabW3Rh55BIBfh6wWw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzwTksZ+; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzwTksZ+"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e320322edso97131166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049967; cv=none;
        d=google.com; s=arc-20260327;
        b=Nke6XfMOgFd6RBMa7sMRhDoF1pSV9G4QXGcpD15qFuFLZh7tkca+yr8LQ8DVbcDeW3
         pSekaU6/d61g2lVBySEgyq3dpwVzcF5thSxFOaUpYNIKVxzoSgekXm+xeVpP7Re7+8mc
         1d9zhQ/x9A/kXiMym0Xc9P52NAVGM/o//xnqGw2Fo3g8jaqKmJskZCyr2zpbieosRVSp
         fKTi/+7jbG45OvTu/jwCx7Q6CYNNx8ZjsdKCq77tuLT72wzKcvGvMDIIJopbvvwNsGnO
         kN4rDCgo651XUKWhfjfRKR7y6PCBmLa0AkRSpyjObcCBIENzLVEBV+ru9MtIFAZ7qsE0
         ipVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        fh=HPu+LtCx01HncrfGQc/NsKp59lajhOLgZ4IcPPGrNMI=;
        b=ZodQVYgyxgN1g1vqG+GoruD7nIz4yZAm+lhOezwzcFXzB+81eBg/VXKeEc6asTxj45
         6tBGdlyMt+gaF4F4EgCGBXVby9jFbXEqOYNINeGW/LtWCw4bwz8iByf/u+FCR++n7iSf
         rZ/sdYQjm0EEyafQ1+KKe7jr4k8ELvy55CxrTJM5czGL7IkEInaozVzl3RsNQzZ4qXSq
         c0gmUsnL5nBVTHF9Hnwzdp+T2V7TGvYuiTQ//JE5G9REEuFKAenXq1ycku+3x4twg1fa
         UU4hV1pNd8AykL9cM7YuWIOzabtM2nI9t5QgRM9tG/qIY4z4NjZPMv5T9HGODO83Pc/Q
         W7mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049967; x=1791654767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=fzwTksZ+Dd6LsSoQwOkYoBKbqxJ98lyG6SZVlr4dLjyO1Uue7HPS9+hcANwv/TvhTk
         4snPwaENRURr5uL7TSrnTk3ZooEUGDP8qkAYLZub8owa/IMNPixDsUIWFZZwTFz5ZBfi
         BLN1mOkcn1dViHjbe1f9AHAlVofWhkq9Aj2/aoQ/ufIub7AMEXBRGmj31O8zT2ZwwEMi
         Du0cpATZ1xsluq6GM48eXJ0RO4ehwTEVMcCnRQq17DFVD3z263utakI8ApdqkqLj8bgP
         dsO+x+r+vY6KCUkRBZkuWgCxmJ/9IBG27YU5KqFUTZZBxD7he1Eg97GTL3xD7UaP5sDS
         V6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049967; x=1791654767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=aLMCg24cibJ2zvOpigUfYbhepKW7/F0UnWDLlwNPAV8s8aC0+cdG525tdKJ+bGfr1C
         gBBHEAaZ0UWpwQNtuKHpkp6dsaO85pH8KuDjZ6uAow26tXrk+p1upHmMIf5P+xR9ffK1
         UHCrMUpyR7fLLMsE4/oKg+oOLjHsKdVAhNNgYm+LvsdopFBMhcU3Az3ZQi/DFUt6ptvz
         mTr4bdnv50bjS26wtA+4lz3Mqfo3K3eS+D/+GNkFhEjwtTSYs1oRu3hWXagl4bGLR8+I
         nwJeodGZyFX3TPJisRkYU0xJQvuhohso+Y3hV0tQsRGHrbOTiyW9Mh6pN/BIzYTc7+Kr
         3F4w==
X-Forwarded-Encrypted: i=1; AKwUvBz6AJ3Hpx22VldmS5JCYYNf6f/kTpt7ANbuzbPNoIKVA6kuIcPTFvdaKLBmsPN2CxbfxukBQCgKfwSt8zU=@vger.kernel.org
X-Gm-Message-State: AFuF++m6MTErrV3vS8MLGwqkibY9lRUP2jLOu0y326J4hSYG4+GGGudD
	8Jmlzgo+PKiHHs8N6FPbB8vVN7/UwigvU1RyfsnkgJbFYIAXHiPpq3Rx4wxLnMi62/MQnfubavg
	6F/liNOW7o92F9GFivzvkmUTUnBaqpPM=
X-Gm-Gg: AYBFou2uYqbUqBuGjjRSPEjITw/tFdnIduVpMxgJnjGn1V250GCYsSsrJdaSnMs83EO
	EO84CXLNgSfZcGLUQDTTMFyQiCqygpQ5xiLEloaDqn3Rht/eYnMX2f1jmNMl7N83ZbFRpQ9GhxT
	jZA7gJr74ASGF076fzuJTSWARIJ5ax5Dw/sy5f/ZPCotKJflBN3kDVuFngLX+CZJhxVGNdBZvbv
	URAyLLs/QY6V0EtzElJApVljwKcXnHJnBkcqu7Fmfk+5ITVdkLKacBV7SIipwP4EMaXJm4jHPJq
	aL8kdMobcQsGx8AeIaoIadvsM16z99sD6IOTxovRHqoqTrT1NnaVgZWVEq6tLpyjDtHT08ULjmZ
	b0S9b274opORdljYTqe+R/GbcR7w5i7hy7ACeZ+2TGo74PCY9mPVoWAS/xsqqTFFY4YzlZwpdOX
	6i6ogcEESAxl/Jftpb1C3AWQhHMVp1q+njMa9emHiN
X-Received: by 2002:a17:906:ba8f:b0:c2a:f1e7:d1ff with SMTP id
 a640c23a62f3a-c2e4a8fd869mr493909266b.4.1791049967157; Sat, 03 Oct 2026
 10:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:52:10 +0300
X-Gm-Features: AclHuK-UG3tTAL01WV2ZDjC5tjM6igwBQLvqa3RPpfuP_ptSFYX_iuwDV1YsoBk
Message-ID: <CAHp75VdyMJUBv9Y-4vdAWp2f2JB0toX+y7hV_esXxtni0wXutw@mail.gmail.com>
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and dev_err_probe
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
> devm-managed variants so that pm_runtime_put_noidle() and
> pm_runtime_disable() are handled automatically by devres on both
> probe failure and device unbind.
>
> Remove the out_bgio goto label and replacing all error paths with

replace

> direct returns using dev_err_probe(), which provides better
> diagnostic output and handles -EPROBE_DEFER.

...

> -       pm_runtime_get_noresume(&pdev->dev);
> +       devm_pm_runtime_get_noresume(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> +       devm_pm_runtime_enable(&pdev->dev);

Definitely not.  There is little point to using devm_*() if you don't
check the return value.

...

>         err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to init gpi=
o chip\n");

>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port=
);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to add gpio=
chip data\n");

These (and more) don't belong to the change =E2=80=94 split it to the
logically isolated ones.
One patch for dev_err_probe() and another for PM calls.

--=20
With Best Regards,
Andy Shevchenko
