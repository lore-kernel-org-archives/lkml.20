Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794180014;
	b=ueKe5ijDtv1VFUAQreUxSMJuU7I2bFaIY9Afa5eNjtcgUyaXeYMHHVc+FTVFAs21WAYW
	 VFuLhmn+TBF7tF5nTe19wzq4StiJ1zDMhW4pHy8rMvvvmOdEyyxZme4O7xrMX7xV4tC2p
	 mAt7DNbXXpMbRajUEIbbiPkKhUJy0eaIWwatYcR9Xdrr+HoC7e+A/AbUrB1FCN2DnzPv0
	 GioSdrfvQki2xjpe00EC0jjTnc+41Md/Y1LHGs9G3B1DLwCoh5gF5uGuab+vu3Lcyp4cJ
	 l/CPoDYcGtJCBW/CL7AdHfwQcBoxrUt4vlg+oN6LluPnSDzjaoMf1Pm8QMeZlOtCgWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
	b=Hom4OUvQRLWjrIqnMxlLKHBuj/fKaH6yexegBPxca3IvTvGvRoQbIBWjVeRPebsYSBTY
	 CnFDY3r3XGZyraalcsASIloWaNi1fwVDSBuiIpzPwYESLI7DMROcQjyDnTv7bbw8UY0aX
	 pf/q4p02b4P/UdP/Y0Z61GEK/ab8gTiIVuO7xMwySFA/y9hcysNBSJyxeIIyVXK+Z7XYn
	 ksafSuFktqKXmXindZBz8RHPYSK3ox76OEdVx2JQ14woJrmYbLUUho0834Z8tzhr7tVUC
	 AHVsLwqZC3M2tp66lJF0MwX3VKKCmY8UgUDNt4JEZT2TBKtpy0Rs16AzbbSuLJMr3KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAhlCpXE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED24606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAhlCpXE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2041875e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794180010; cv=none;
        d=google.com; s=arc-20260327;
        b=ZReU/0wj/WdGaJnmS6hpWr67wHn8kWB7YOBfdv3plmbhsApB9dS56oxp6dDmw6XPDI
         Hs4PyLB9J70mHNBX56Z8gNwimmMBkJ8j7cxQ8JUydYMxi2/vZ4AGYg44Q3Smb/Gf/ReR
         v7MbCjeuL6aWxM9j9GbW6sxDDVerajBNiEFcUCR13dd7lQJNOHc9xZ7LveOREwcjGUM1
         kkRkbLln8CViLLlrrYuHIhDDTUqeza7BrZbWwiwY1dVlrs5DDYOsEBXjbqubW7I7N7HP
         yYjX1QTlqJRoR1zqzg2tyMBUqdGeK3kj8+DmQbk7CdiS+Tc6VecxOz/ul2Q7RyCWaAyl
         f17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        fh=AJMyfcLWg5yGR8ebWVd7etabQul7NWeNIOmQ+OPsnkM=;
        b=kzjbL9QLG0MVnRWHrhuZshKP0Y7aPQMCOKSu0qAs8wYCRzxnphHOKJLFRjo83RBkEN
         fDlvnIvJLac4O2B7XPAGHELf/g7dR3t863SeJBemN+tGzkcVgSxae64qX5Ieq/+EdJkI
         bHJr3jNYW1ZE2F1atVc8ClP9OytQ1Gw63PJgysubYW1DXR/PMh7QirGuhRGF1bSXzfhU
         wlg995YpTIzP8T8lc9Te5caAe5iJV6ppyasqXXvpTlK29Ti3yaCrs0eFKaDhR6TrRVzl
         8w86lwJLJbvrJa05wehfmhW+9QNfxE0/ksW2KM8oH0gdLxbEqbTxF54yHQptEljHJyfZ
         T02Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180010; x=1794784810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=lAhlCpXEiXASYRloUapxnVgOZqNx15wmVSKgWZ8akGJ4kUaEn6DAOTuCHm5eKqmTHF
         QRcGAs8vmuFNj9JkYROTOtIjaxokwOKs/XPW8qXsHG4Tiyt6MFBBTdrXjQQDlaN9CMVY
         /Wz0TqoSYViTG6BEMvfH3K1+0jAkiDz/HXBbm67O47l0iJ59r02hZ+i2Ckzaj7ZLdmk2
         0n1jMYhE73+arXCQiPEW0wXObD96m7S5w8QeVLRcMQMnyDUD7ZgzmwqUVvIBWSK2+3ZF
         j6KZPZp71iSiMmR1BWDmAoD8LpCH5CNRxBhgRbZjt5jG1l/affRoPGLcBmWP1C/FJimg
         5x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180010; x=1794784810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=NWl6rxspA1nQUvBAbL9kdjf8OP89uj3wSOeItZv05hHmLNyuCvg4shFgv16NxOJYId
         yxem0mZBO/wlZvohzGzQKc/IidScy03bOyHjDUtdoK/4Rj9bj9TEgXUMrwRFYj0tp6TJ
         wRYgCo55cSKxTycuQW7uhib8fWROMhMBfzy5ZKW79ygLo3r4SMtKeljWfs9rq63wR3rI
         2rFpvd2WquhKKT/qfdR2BD5jJKENcNZ7zdB2XgyaE7RSV9eIGbqNzRiB7UHdA20r0AEN
         4ZJGN8FNwslJfvAU8VVFJLc7nuFaCzB4tsKCUlSOb3EL7n3J3qiAzQ8wnfNSkhTL7MnV
         jCOw==
X-Forwarded-Encrypted: i=1; AL+hErHdsfNea6cB5Paw23lUpDP8Cfan/TLIq60SYTzELnZ57zoIyJXUGAKUfMdzYa1irgjv7vcuTA6dMV6RJZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dwS4HHSu0fssjCAmlh1BvFIcAkxSckr2TefttJpy2m7x9XAB+
	HX/St3g3VyAqXk7U58BWTFP/9kH5wVMQsyp6IjRKsV/WNMjExXpWq0AbWHXZ4qJVZo0ZnGr7u+A
	5S2xuOuWyvOqpJi23iqH0IwA88EuDhrA=
X-Gm-Gg: AYBFou37gxK+Emorqp5zintSuPyCzfB5m3bDj0QzBpGKj7AfCGq7I9UBOP2eAv2Ckdw
	brIg+vn+dJO8sWG+TbDeoACUL8PSXfxn+PGwUQbJrTSwT2r1ocFjCNlMS7kQ2uAfSkc8YLp15g7
	qvODdjC6bsOPtKLSUVMnRu6A3bjfhh8+lOosSKdgDjj1hxyfKcOc5YpmhPIzjmaOJv2fGHQuisP
	yTQOF+vfdX582qvNO7+LIcIWvT8UXkzDWXWmCQ5qxhM1FLlINGtn/uxNYkp1yM0u8IZEWcw3Ph5
	JFyRt52B3eCi6c+aQbG3SUiRGQWtk6vl2F6LZU6O4RKfVUsxFF63Akx0CKceYrZ0G3TCpMTLORI
	nXh5X8U5YIo7VDa74TM7oaJjCiiX+p1Wka+pZjw6pJ8JG6Vb8qsjcYVnPionLptXjNRu1jpqNk1
	3YK197GsptSVEWGSjCmmoF60rtv29lbHGMKhggKxEYNyP19YQz/b17ePlxBAw=
X-Received: by 2002:a05:600c:6095:b0:4a1:fbf8:55c9 with SMTP id
 5b1f17b1804b1-4b963c89227mr39662885e9.33.1794180010333; Sun, 08 Nov 2026
 15:20:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 8 Nov 2026 23:19:44 +0000
X-Gm-Features: AclHuK-aeVO63ZKWXARmCrmFPccfQkZVnuibMmil6eYfKAtCJR8zv2owsIJ8nxI
Message-ID: <CA+V-a8tDskFKhsJJiV1OUXEzcTN6nKEz4DJCPjJC2tEdrCUTgg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:52=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> index d96042e28cd5..e644092cc2f7 100644
> --- a/drivers/reset/reset-rzv2h-usb2phy.c
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -68,11 +68,9 @@ static int rzv2h_usbphy_reset_status(struct reset_cont=
roller_dev *rcdev,
>                                      unsigned long id)
>  {
>         struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_p=
riv(rcdev);
> -       u32 reg;
>
> -       regmap_read(priv->regmap, priv->data->reset_reg, &reg);
> -
> -       return (reg & priv->data->reset_status_bits) =3D=3D priv->data->r=
eset_status_bits;
> +       return regmap_test_bits(priv->regmap, priv->data->reset_reg,
> +                               priv->data->reset_status_bits);
>  }
>
>  static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
>
> --
> 2.47.3
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
