Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674090;
	b=kC9dApiMGzIFAgFsvtvxXyNXH07RGNaoLOUfH7hrR+H+gqdPi+i/dlEVcQ06Z6bsQxSi
	 CxOcSxqwepaCL+EKBaYmEG60euyqdYbZ0FvdvTPBPuPUrzBdSZ+n1yJ5/bNG5DpVgrfKI
	 H1Pls+qgzCJVvIeYYo3SEelXrmZ3wb1DJuHZ9dkOyVNxfb7SlAUbRi2jiypDJ6cw1cGXa
	 UdeNzi6hlEcVHJMAfBEK1HDjgpe00QYqrFEKj3sLlCE8/kAV1eqqxLMlOah19vOV+9OdT
	 UiUIFdDkiT0czdS5ODZ9x06wQirqEetr5vT+vTfVtdj2ZrzNXMfBltFxMzcY7Yhp3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
	b=XuX5jED9mAggLJO7ltYLBW2BuDOs19Xflfg5U+3e/Cvnf9a4yjSHZmX4phRwnSY5bZKi
	 KI7Tah6lLFMChT9YRaMhZg8FRZ6PhhfflxBMpEgEl+tzHjnq5viaqflzvrWAuZdlxLMEc
	 9742/A18QjOIhlWLeFeauu/cDgc44K8y3pPkIxvnyvv2pVFOiWPEhQBSr6HIBhF/7BiJT
	 CBGYHdwIXGizAT48Jb5nZoebqdHqgeFwGfxmMTI2b0poiB6Zn+tS8MDQOR6bjqQb4nIa6
	 4r1F+FlxfXrOsxa/rmPZKBKKJbsyWTpSE6cjP4mAlHo2l+HgpsGNUPM0xC4gTflMBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxcSf6CI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D39606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxcSf6CI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12494775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674088; x=1793278888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=VxcSf6CIKAoagWCSIk4OdejyY4PIlSMFBre+qTk0yUCEjbr8jPstuWf4c3hOiSaohB
         7f6xKeqOMebzGnhOQQ9ePVAx1VBCJX6b7uE4867QQJClJnCDDfiL/i9WXXqRjEIRLYiT
         px6c5t+fcMzSygiMFvy6cb9Ob5QIX5cQgnLalF7EuhTsp5RRvI6bkWfSMplSO5zozwbP
         BqkFAWGFYItDrPJTXFx/mwdCzIxKtdAQ9AR6hnI8OWzUuKQOqeuRjLhQSekeTpJRfz4g
         ARtYn+UrMYcfS7Bq1znNG8eGJZogXbKlf2W+AkAw0ChUd2n2sdcb7eM1BFQ4IoKhQvOy
         0w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674088; x=1793278888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=v8REyPDyJ/uRx6Dn7bjfF2j3JWmxi3lh50SRPsEjfnFVxioa15/ebaW3Qmv/GEhV1G
         INzs42xf5YPEXJzmVNsUlNgwRnJW4leH/5+5zvBItWvCyCUMW4yOI1h12n/UtbUjaQlP
         Pk3pwhPUQeZAPtwsuif0o5FX8Bc0Et+ta2cvZvr1BnAYqc6Ihzi4MMv6nRo/9mlk0gX/
         5FOYeaE6vFuHgYAJl8JlpFdZi2Ihq4f6N1C/huD2PIhPYe07qIlY5Fvku8fVozSKx4+z
         fwBu+jQxSbzfOuVf+iGA9J25D3roPREJwKa7De9uGrOeQDZ26Y5YK2dLumk7ypuh5Jh9
         as0g==
X-Forwarded-Encrypted: i=1; AKwUvBzYZdtfv2Q0vHKxXDXjoLS79xJFSEBWdk/yEygGIW57PIQ4HEMxPLtXbmBAGusn90iin2MiCR0zJ29EYHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrzJJbb+6aams6KUZV73tB8I6MXs1tW0ESAzDLSXZbjChxXBSI
	bYeJZ13DYV8n+724dlwP0ddjsLxt/AygR29mob1H6BCME6+adOP+Izda
X-Gm-Gg: AYBFou3ry5lRpF2mivQfvvHEtPhU3kuUSEoCZu2h6+MpYmBKltYQhJ8tUXKL4F1Ad+0
	IvReb/AnnzkCGvJL6Qz7nS+6HR7W29ONC0FcdV2kjAifB8OklRDJnM1qr4wDtJAhvHY8XdXV7JB
	qtPNX3yyh5ptpBSh7S0Hp+moHzZShTeXv/ef59KMcOSVIWK7Gws6v6YBOYUW4PATOkTkrU5I+eN
	ZU90SuDu54hLpe+oEJ7XBrR3lcc0EbVmcAcIwGKlGy8pP9BqyBdPAmkBuFoKFoVMXf7HqAgcUab
	qIseRLq/IZgmji1cNLjhXE0VNs9BuEGd9k3ZYBBdhTHbh9sKVyzufRn4vemKIJEGIN1DldSNSZ7
	4EFsO8EOYTTYRhnvU1GE/g6ABheq/as/Zk8yFR6GF+DyoFfLoAtYgdPmCjRhK2bMzSHMJyJ5cG0
	bGGYZhbTKx7qxmk08UopW4v3v0aMaZfF5kUAtoxnKU34xApci/N+GFGIFh3s1XMnjXXEykK+7Ax
	H7EZAOfd0FxKFHbn6AcOi64DcXZFUmD7Ytjm7+3gDtbOMh2K9uzfZ0CPdqKOTv7NmqhApHBKEiE
	L2nmP1ft1TAaq9vYKymKT9HCH69vAC3XkNiHwseITgpWqFOHSUu89UE=
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr104588835e9.30.1792674085847;
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm116512435e9.1.2026.10.22.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:23 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
Message-ID: <3hd6y6f2lb73mrz2xi5pgsgzvahzmsmktfbyx7n7uewmobk22i@encqv6tasfzo>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
 <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>

On Thu, Oct 01, 2026 at 10:43:10AM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
> loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
> select this mode when using the board with the Apalis iMX8.
> 
> The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
> Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
> routing are already described by the carrier device tree.
> 
> The overlay supports both Apalis iMX8QP and iMX8QM modules.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
>  .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9971b34f7301..2732b223eb3d 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
> +
> +imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
> +	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> new file mode 100644
> index 000000000000..b2f9c43d29cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
> + * Board V1.2, combining the two loudspeaker outputs for higher output
> + * power.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&nau8822_1a {
> +	nuvoton,spk-btl;
> +};
> 
> -- 
> 2.43.0
> 

Hi Frank,

Patch 1/3 (imx8-apalis: Add NAU8822 Bridge Tied Load) is superseded by
the shared NAU8822 BTL overlay series:
https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com/

Patches 2/3 and 3/3 are unchanged and still apply to imx/dt64 without
patch 1.

Best regards,
Ernest

