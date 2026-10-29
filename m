Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269385;
	b=3DTRMUJ22r0c/PJkSIyh89pqIymz4Ue5smCN5Qg31ndE9AdL9EP+YMAyxglggPeNY+kY
	 KX7Cj/CrxhDVQMMqQOydGyv2u5ig7H1SPVxRXHQ26UZJ7Nqags6ogWisIVL7HTcc+d5mF
	 i/Wn8ChFja09nZWAfDVp1rjv2eyTyXTqU+e7umya9eP9tZO1/XxuWVeaIFv9ba8ZQgk3c
	 sxyG6OKj4vElrOgrPAeslGQKM3SEiYIGmYX1FZvumFkryPKW0KWmVTssltlQUBVMAEUmK
	 27DJuWIu/k31vbsipLbI8oQapbpCeWM01bQwavDg1ebkwX9lzgcKpLaJkOx5+6liY6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269385;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	b=oiTeTsfnKkBWAuhSD1T3WLkxE87vBnVwKSfzJm0fUbhQAXpNPj5wlTqUH0fDKGedtjRG
	 I5RrTx30AiwyOQKO1eaqLSRutK6ErSn2jaIRlqjCjZ+wUtBLtT0LuHUXvf9zdyMRZLRjj
	 blQnhAuewYKAxRXw/QxWz6IgIuVxnrJctp3xVyKm8S15lSgimnHxBpEb3o6XwgXsQbG9y
	 cLBnM5uLZVjtd5xoLHGqmMX67Mpd5Kibw4lCN9TCSCV7bImSODMd/W2s5PZpiMFCKJLf3
	 0crMxhLcVZE+89/E17HV80P9FeNJDxkstGuf3XQdZlGT+JkIrvikyDovDF2Q9jaRpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kv/z32sT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC59606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kv/z32sT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7F21F031E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269385;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kv/z32sTIuRqbDuFRY5H3/gUkbCHg5jcWqiz8ua+9UWdLO2gKpKI5eYNDiKVzDnBH
	 ZExWIGDrtF0J3w2Cr/3Hgh9ERZkziyUsoCnSyG4R25dGZ6ulKYCgd+uof/qCzzKbOr
	 9LtBWCjQ/zMEyjNHf2pj2SNostdFCF2nI6DPcrOxhIaBwpsatOZx/TCV2T0NdRK+MH
	 Rrw2Jot9G/ycktHUQxgUi/zXj8/bn1f5HWA6D4FmjciMu2GNZNBebOP6Ul9GnBx7Li
	 NdOeaxVlaRSFEjIK1Ih3aLpGEzSUYhbGSMfF6v0yaeZIIe0JO4LXSqMkpHWpLm/TCi
	 W08vCoO1bHcRg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f74f6b46abso1086605eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSRl8nnHuPMdgHg1KgMQ89E9TECR84tdstnEmZWPRX7RCCjw9DJEDnGVDFBeEYGfuv8Ewpv/nNw8dj09g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKprqLUhWNh8NUdkwB8UT1XV0StG9fUdJtEMm6FoqvS3Frey1Z1
	ROCJOMSCTYFirkVMQjWObESv3e/a5QgrfBw1XhjlYcVypT2v9i2ed1qBeLPwjJmeX9YmR3cMIgY
	0pLEjJ5ab8tN/pxEF+x1Vtk8+u5pUZF4=
X-Received: by 2002:a05:6820:1501:b0:6dd:3534:478f with SMTP id
 006d021491bc7-713f1f4f57dmr2819317eaf.73.1793269384310; Thu, 29 Oct 2026
 03:23:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 11:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
X-Gm-Features: AclHuK_F2FYCXxfvG5vSK3S2hpbujv-j-QBd2VPacOk9bLxQe1BEL834ojBgIss
Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
