Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EC3A1A56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684293; cv=none; b=AayiaD/RpRK2Za/DLdqyRDQ0TmgIILTmoaEf32aYsW6cyqikANEWq/794OkCBThR2sJEV35bxvNcgSQBshhXHvf6xIeR9U7JjWDozYDuWXbNvLJITLsTPNsIYxQ6id9O0aphTxUJJVA2DN8/dqxWmt9bGluXSvUmX40iwH+sEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684293; c=relaxed/simple;
	bh=4krgD/TlwPFHs+5bXtllWBzZ1ujoLH6zodErYJ6+60U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEa605BwYd2TKm8bCQ4/ynymWBshtYLS4Z5ycP1A+XrMmllhSB+sfRR/neT4QVtkES6HufqkDYkVBZYYNB3mLO1TDmni0PXDpw4/8UJJVd7kEKUxPf/NDAnJXdL3zrlq4SNn3lh+viNtd0sCcqmIJ59vDCxRsZTR3vJX7HcCsys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGJMKFVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGJMKFVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FE41F00893
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684292;
	bh=sgzFISdebgyulnEYwPr3r7Dfr+yDo59RA9yogZZthtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FGJMKFVUkB9f4ceLcBhdlZWUbGYsNG7voSf7Xkw/ZKagmB9IotpZXjviNtCmLv4ry
	 WnjvZcTSIywFqGSEwuLV7fIzM67MNdptwXRQ7QUiUzxmWPEPXcMCCDRVtwIcamEu6G
	 K51ksKGYNXil7lvHuguELVihmri5DXTymzfGLZuYuBeVRTS2GXuuygsI77EevDsBoo
	 Gf/MrkHIWQkwlphH8S0Zu0+iVWJGD3oi8P3QSuXtkq7O6GnftIudf3hObiULlb7DJA
	 LsBPQyP21iXw5NdmpUvsvFLzt7dROMkb4agGDpnHT0IKn6QM07eT8dVNaeRHjyRmKp
	 riuEA5ebNgh3A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso94052e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:31:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxreKU8T6nN7tDsOrHLgLh9mS364UEbDEvVcPSbAf9x3hQRM6Zcjc+8sxboVExc9ZbeGMHP6ng2e8iweTg=@vger.kernel.org
X-Gm-Message-State: AFuF++lfuGTVkMO8ro3pDc6B0RiODASXCdC14cgA5Dh71ZdKMF9ibxtO
	rxdL02IrOq8zvvOudQd6vIxnMYpSdOTyTx0OaAjkKkpgo30vjP29o9OhrPjIsF72h59f4IuvuZY
	w4SC0AWUvYOUgZeAhutpx/A1YlIqxa7w=
X-Received: by 2002:a05:6512:33c6:b0:5b6:183c:5c9d with SMTP id
 2adb3069b0e04-5b8c1958e1fmr84452e87.59.1789684290738; Thu, 17 Sep 2026
 15:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917155657.2200191-1-arnd@kernel.org>
In-Reply-To: <20260917155657.2200191-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:31:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=D+xCtWx_MX1jbBvByqypabFkFW_xp=2XpUfBb7wyGnQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vq4xrB9hQc50m54nmaYX1xnKUe4T5kma-lOihlY4UA7NShBSz8Spmt7nk
Message-ID: <CAD++jL=D+xCtWx_MX1jbBvByqypabFkFW_xp=2XpUfBb7wyGnQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: pxa25x: prevent ixp4xx + pxa25x combination
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The USB gadget driver is one of the holdouts of Arm single-platform
> support that conflicts with a multiplatform kernel. Trying to
> build this for both Intel PXA and IXP fails with:
>
> drivers/usb/gadget/udc/pxa25x_udc.c:144:9: error: 'UDCCS_IO_ROF' redefine=
d [-Werror]
>   144 | #define UDCCS_IO_ROF    (1 << 2)        /* Receive overflow */
>       |         ^~~~~~~~~~~~
> drivers/usb/gadget/udc/pxa25x_udc.c:141:9: note: this is the location of =
the previous definition
>   141 | #define UDCCS_IO_ROF    (1 << 3)        /* Receive overflow */
>       |         ^~~~~~~~~~~~
> drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error "Can't configure=
 both IXP and PXA"
>   232 | #error "Can't configure both IXP and PXA"
>
> Until recently this was not a problem, as ixp4xx was only big-endian
> and pxa is only little-endian, so these could never be in the same
> kernel image.
>
> As this has changed recently, an allmodconfig kernel for ARMv5 runs
> into the above failure. I don't think this is an important scenario
> in practice, especially as pxa25x support is already rather broken,
> so prevent this configuration using a Kconfig dependency, and
> rework the driver to allow a combined ixp4xx/pxa3xx kernel that
> only uses this driver on ixp.
>
> Cc: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That's a reasonable fix. It's not like we would want an actual multi_*
kernel on these devices anyway.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
