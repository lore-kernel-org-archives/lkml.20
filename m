Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97795378824
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531017; cv=pass; b=ND48OzIWEs7gMKT8nBFc2jz8bEZYeV66FALx/S9DPPV6vA78vHgOQfOMjMVPCK3WBcnsQ+Z/393BPsRZGDlVl3T3T/yzIiqUeIDk/nNsE22vtbd8+27/BHoBpBui4bQb04t4q4bXH+tq7+SxpWNMbdFDTWhuZpv9UPE/DL1zXao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531017; c=relaxed/simple;
	bh=Sk5CI8+d1P84GeDudvBytEEtU3fNsdyvUlGMJig0vNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Evti6nkCIo2i2EM9y/fxTd9b054tb4w0MtEkv4P5CkxDmaX9V123iX3BbYivMZW9+3ubXRXJCld67PtLiwdilpEsmycaQ1bWN6j/5AUUc0WEtP1F4Rfypij+d/BjOWbOcJxAIptmGGwpr9NvS/2FwWLhdII81m2rVqRcSe/8rd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4PLldLa; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4PLldLa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso171112066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788531014; cv=none;
        d=google.com; s=arc-20260327;
        b=pGHen/dYdd6zh5MhwoBJcH17UFNnqECJTOPYKQVcmqfxShelc4aBkL0UwK0lsfxcIJ
         q+zO7E6nZN/IZ2Ip26dMgW7wqi5BiXNHAhuA+O849XcTP3J1PtNFKfypWoMqd/QjkRqz
         1xqENFgX3FDkqRUYXInmLF6WNvlp2PI49bG8bO8/gESz3HPhHBsE0OZWq1JgB0ITQbpu
         mI2eBk5z4hm1luFQ4zi578/+wx6eE/1hudDbuqdmPSlvNgPS0n/nM7Zb1kcUFJtUrvR+
         91Jd+tqFFIAJvrHPuBCk+z5HKZiMkLf4lRT6hRoJvwU1dDG3joax9UreFKLzenwRrD2x
         yIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOW1YwXhJmmmF7CYE3YJyTz5uHyreBLj2FaSBMO28s4=;
        fh=b7BrItklml8CV2fFOmxEtOhJOrWdHjwqRDnketE2zrs=;
        b=h3xtYjYreF1OzkQkZkLROCwHCKO+nbvtLCuwS2Ll60GUHxFUZz3iZMQpSoD4na85wt
         OTL1b8R3uxyFfRGTLs385o/Qblr0qX/v/wF8flqOlVYd4GF/+mfVwCH6s1VxHvwgjgLO
         4FOrThmI71uRmSV78NiUogN9t0WQr07vfvn0TuMu0f2ThnSXyj3auOGjh0iBuYGE6/m8
         hMWOQl53DbR+3ohpRTUvIlepU17DNc4yL+grLUSC16YOfdqkbZwAX8hrT2vEM+Of92aL
         4B9esli3wqIc4SvVdQ1RK7TERDOvqzn4e4sXqp8PfhvBI5mB9Fck0OjiHbx7bkF6ZNY9
         sb2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788531014; x=1789135814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOW1YwXhJmmmF7CYE3YJyTz5uHyreBLj2FaSBMO28s4=;
        b=T4PLldLajntj5k7+1K1fR5gif/E0etoDrz4g65iiRVMIlXun7Joo79h/YerYcXV3HG
         hw24GDelAR72E1V2GkbQ52LPbGwdcB/1zsU9zQi0bSLyh702LJFAg9JvUHiC/QR+SLGa
         h84yijgzjM3B6gfiJnYNpIsOXyHxNz0Quxw1Yz2Sx8eASwEXCt1reLLs+fsUhHDeKNZx
         b6yQsNtzKtZ47UArFCF0LMGjBHg6cWyp7dyQULhZV6zzoH19Qa+075gE/9I56GlRyt+6
         MqcktOOwgTXoJ9ZgPkArq1fqIJ7dBUfByXUnKs8G3Odex4VpKbnXDrAwlsvy5vOPrgrG
         nScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531014; x=1789135814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOW1YwXhJmmmF7CYE3YJyTz5uHyreBLj2FaSBMO28s4=;
        b=KgCPsXYtLCTp3arIXJbDnEfsjgGgaCJdOD/DqvrjBC0hokw3OdoWUvSa/X1spvF87f
         hwWVN4jHPr7tZ/gz5EjFdS8QraMMhiUj5kq+A969gw30pJDnpHzmftkUREahy2gk5hQF
         vR4GidceB5QKPYHG9HSZ8xGe0mB2xXj6cEzjfAUDFpIkEzBj+DLkKwfy8Ksz0Xv04Osf
         x9KHP38ByD9qeMaxeXZfUYiLJ81oeRURP27qfuDEJw/bSf6+nMYbHy5z5Hu82ghpZWQo
         kUDYNPdOS3eUxdvpmY1bv/6xAX3LOEnF3I1E3s1qStcLzKfi7mC5H/5LtfjSxGjhLkBu
         OiOg==
X-Forwarded-Encrypted: i=1; AKwUvByEhMZcO4j8DLF9CdS6TETNECR5aMqVMqVj9LoHkULhpHDbPRIfMm4+Nidle+7NKZ/3bU593R0pG2zFaQY=@vger.kernel.org
X-Gm-Message-State: AFuF++n4WAC9714QelxJBgkH1X77h4rHq/7oBUB/09OjLnBwa3EkHqbr
	VanMrP9eLOBapb1F2EhQ6uuCu1h13ghNLIw7Yv6EPfolozm4Ce475Ph0cSht03fV5oV77F8WxM0
	xJnFRwIbo/fvIIkm4QenvLcTtriuqRqE=
X-Gm-Gg: AYBFou2CCKZAzDPL6k1lHYbAHSjZQtTrgerjqIqQEhK3GC4owagXfpU4D+TYsWdYjbB
	L8F9ZqzUnLtU2mfhIb3sOHgJexsdX4ak1x40fHGwngxq+olUUoXvIZKbBAtNao5qmWYsBvmBCJH
	nwp/8szK/MLWXgDVf7KV5JlicfOxlWHiIa6ceKJLIlfT6/ybDZBnuZqeTtEikNszxe4x+9d0uzQ
	iJzdCTvPCu87iOGKG19+T/NnvmMNnrnF95J6Zk+HY1U2/lXVVZ39gfRgpKSGAHISEAwuJFkRNSl
	9Q65bd0/AjSVxkDeYbIdYZE3fswvoyFFC1vWdNxdJWho4pY=
X-Received: by 2002:a17:907:c00b:b0:c25:5fa5:dea4 with SMTP id
 a640c23a62f3a-c260c9717e0mr505862966b.4.1788531013449; Fri, 04 Sep 2026
 07:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092211.2922058-1-o.rempel@pengutronix.de>
 <20260903092211.2922058-3-o.rempel@pengutronix.de> <1f2253f9-3368-4033-a091-ce424c08af89@lunn.ch>
In-Reply-To: <1f2253f9-3368-4033-a091-ce424c08af89@lunn.ch>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 11:10:00 -0300
X-Gm-Features: AcwNN1UFpp3H70vLn3Pfq3KcnE0dOYRHTCJ7i67tugilF0HGiYwxPi797DQz730
Message-ID: <CAJq09z51Xajtca=D+ptwBsQTEod+jYrM_UkKMsuFBqCWoEvkNg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: realtek: rtl8365mb: add EEE support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com

Em qui., 3 de set. de 2026 =C3=A0s 09:24, Andrew Lunn <andrew@lunn.ch> escr=
eveu:
>
> On Thu, Sep 03, 2026 at 11:22:11AM +0200, Oleksij Rempel wrote:
> > Add EEE support on the integrated-PHY ports, controllable per port via
> > ethtool.
> >
> > The integrated PHYs have no MMD registers; their EEE registers live in =
the
> > switch's OCP space. phylib accesses EEE as MMD registers, so add
> > phy_{read,write}_c45 realtek_ops that map those MMD accesses onto their=
 OCP
> > addresses, wired as the user MII bus C45 handlers when the chip provide=
s
> > them (rtl8366rb etc. unaffected).
> >
> > The hardware manages LPI on its own, so advertise EEE to phylink with
> > no-op mac_{en,dis}able_tx_lpi callbacks. The LPI timer is a single glob=
al
> > per-speed register, so .set_mac_eee rejects the per-port TX LPI knobs
> > rather than silently ignoring them.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

It looks great. Thanks.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
