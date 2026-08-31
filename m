Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88B316190
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181719; cv=pass; b=Gs8lNkudVSo63gyt23Y0WIGOJjdNxYYlvSLQ7SA+OAtvaE3EMXSW90veDZqzpE/9Y/3tHsGGUUhUyaiduA4zp4g0z235b9luvZwa5H3BKb9XCtWpRonZ8MGUphBpZCtX0Hj6DpyUVr4o+t+l5DLOE0mBjrDrwTIZ95mnqI8ZyZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181719; c=relaxed/simple;
	bh=vHpnMft6Dz9Dvk15TYbbOwoNGe/1LHJBHSjjNHYgaZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEEpO/3nSn5R6KZ5HXc2NrW4tsvUaJyoIBVmqHDEwxzpN4q7NpLEwynztl3Ilsrg+5Rw5acBdq48JhCL+13q18CRcqqpZl0l6ikQcJaLfhU8eBVWRxFgTd/WW6vtBe8YR26Lu4le9v9qC2H1I14xBtSE+5yb5W4WIi+FUoV2gNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQ3AlIQf; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQ3AlIQf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so354298866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181713; cv=none;
        d=google.com; s=arc-20260327;
        b=QBMaCWT8hJpePoxykZg2CznczPOf2xNKYP0HJYLdPqLqBJ9nqVTcKkbJwD2njQQQ6t
         uLazWAyDD7EVUQD3KQ0hdW0MOXRMuFipBL0ilKrh38A0XaU+ehwpuMbXasNKqc63lntl
         BxEN4vc7cyLKESyMoL7G6eesKbqAYhzZC5MB2hVbHXRzz4BaxVKlD45EIcgqCCYtHxHx
         zm1SN74pq3r+kN4dJMaH+k4Wygn2Wao+QCGZ2NYMfReGbolP+txkRf624LtDyIyEV9+e
         vv7Eq4QWLpYwnzQHDXD44hDNtqUzl4JbzIM/Co5q6IxPSp9n4P+PibwYQjz0r+ZNsyj+
         JOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        fh=SCV3yRngqdSCIe4u8nFRuRyxC2lCqvEMJgI9flFzhAg=;
        b=lt3X0x2IdvXW66fIcFh5TlwHBKJ2tkgdpeMAkMw/1LCy5Y5hfGZrnNpZYOGhjStb+K
         WJIP4DiZrc1Op+TdruPgBsqotnf7Bz5HSCJLt4v/itMosEf4r9MYdLJ/uHrv3Ef5DAgq
         qJVl/EaQBWT42K2fF9glpipci8kfwrE/Nm/oIAQoKf6fCWiOszZgzh9y5G3HFWjZygX+
         U9/XbpMi52o625CzFzEUdTvd/aMnnECQYeetlTtBkCpyd8dAsEAtakWioSDmKunZzN3A
         3RJ1PCEl0kGSEqIARS17dsg0ZQkTi+Da0Q+mosg6Bu7sjBFakjI0MQhZ+mBrbxbPhwMy
         ZXyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181713; x=1788786513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        b=oQ3AlIQfC8x0EjfGtvp9uhvG5EmEGocd2c/Sm4BSXw7tiTH4PeCTa9Qu1oeGkpG9Qy
         vdNhihjc+FezJkRcUh75RW+RzVMDp3Nr4HzSNqOHpSO93mbKvu9dfSmqpW5k9AUlXaS+
         BdoTmFrk4ODft5KuWxlLhhrmk1j/Wd8CuBtp5+IGl1sYXRPK3FkuEaeyi1gXXmkiFWxe
         +UblfgMMd6Nufq59vbLLpifa6BI+w12LGOTEw0YNEApcEpnUoqf/IHEGDeyMI2g2D1jC
         SWlPCLHLVoqhetqADRj+grobV9lI2e7vjOyOtWR5vIsXQ/7o4e7wWBlqwH1qzIml/Hme
         gTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181713; x=1788786513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        b=aSOHpTt93rGDFkCHG+TmoG2/Uc3+41gzbnPNKtLYqaJozqCM7ejqNj6CHYiUfVcNKQ
         PtfETy1RBVeGoSvwhGEhikD1v6nFUYkYW17pqNDiQdwENHTKFo29lujCXBBLbg51JOz5
         xdDQoQP2HGYI/ZXLWIa0n6VVrBlj0qXZQJOY/CY9wH9d6EayoC8Qmy9OjLEkkaLeZbjT
         86TDGQacq3DIY/STrMt9aWbdhvkyU5hgPwHV8cx1yVHuyF8U2M4BKiQnp2k4vRzAzxzQ
         kxU6MJx1TWpCAjV9bP20FFDGKbvqxAizoQ5seEy/G6BJ75R636G4NSsmRtujHasBdAh4
         CKQw==
X-Forwarded-Encrypted: i=1; AHgh+RokzkYpP5WoQ6pyUyEl3kiM3SGDWDE+FC5ZfHtJUhhMsUapd76/7F/Gl/LgBveLTOB5cYip0QpccZHm868=@vger.kernel.org
X-Gm-Message-State: AFuF++lm02UkbX4B7eYSB8mZPIBHzaa3Ttsvj2b+k6THEDcguuVCLren
	bqtJBnrGQH+Z0vSWvrZ+IkbIne87PNVYYSDX5xapSm+s1qubEKgZeK/tFZ1fVSxAU+PgahJZYPj
	7qV9CPupopiGjBzFzHe/04tG6Z1xjBtM=
X-Gm-Gg: AR+sD12haMP8kg1Giwmn031yHJop/f3/QhO8WaYvKrmxo6zslICsf6oUseOqwg5+in8
	yYcwa7frw7A3uVfkTVZh7rJl40pPE3s5ITMOmJz1yagVIVViqmK4FZQazMExzGXOVktCUs1C5tW
	PXTmObsbC7rJrvSrlRVR6/enlsZgdzcz+uKpUEU8BBBX0rk2K0edjCI20kouauCjOxZs6Y67ug4
	/vJ7ARm69Y+TVZEB+ZkACv6gClothhjReXBdP+uZeV4nFOCluii7xKAgaylPKMYAPPFpBIu7eL5
	5+JO5Le8Uj2DkV2qhWSiI/QVAcL5/jVmMzVYovsiS3bymQsEe+ABSHCcCInA5UYQ7yQ6XiHFofO
	1
X-Received: by 2002:a17:907:e009:20b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c25afb62f6dmr113371266b.2.1788181712963; Mon, 31 Aug 2026
 06:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831123637.666457-1-o.rempel@pengutronix.de> <20260831123637.666457-4-o.rempel@pengutronix.de>
In-Reply-To: <20260831123637.666457-4-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 31 Aug 2026 10:08:20 -0300
X-Gm-Features: AcwNN1Xw8wz2-r_4F8JCbwqtdJfxO4kY2Houpf0hjogBOIBslH4fHsaBt66kRng
Message-ID: <CAJq09z4ay-c51-GA6tFrV9QvqyRvvWODJ+G1FcQLYnmKsO_+dA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: dsa: realtek: rtl83xx: use
 dev_err_cast_probe() for reset GPIO
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Replace the open-coded dev_err() + ERR_CAST() on the reset GPIO error
> path with dev_err_cast_probe(), matching the reset controller above and
> staying quiet on -EPROBE_DEFER.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Changes since v2:
> - Added this patch
> ---
>  drivers/net/dsa/realtek/rtl83xx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/rtl83xx.c
> index d6d243131fd2..8121ec12fd8b 100644
> --- a/drivers/net/dsa/realtek/rtl83xx.c
> +++ b/drivers/net/dsa/realtek/rtl83xx.c
> @@ -212,10 +212,8 @@ rtl83xx_probe(struct device *dev,
>                                           "failed to get reset control\n");
>
>         priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -       if (IS_ERR(priv->reset)) {
> -               dev_err(dev, "failed to get RESET GPIO\n");
> -               return ERR_CAST(priv->reset);
> -       }
> +       if (IS_ERR(priv->reset))
> +               return dev_err_cast_probe(dev, priv->reset, "failed to get RESET GPIO\n");
>
>         dev_set_drvdata(dev, priv);
>
> --
> 2.47.3
>

Nice!

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
