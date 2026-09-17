Received: from mail-wr2-f24.google.com (mail-wr2-f24.google.com [74.125.225.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9744161B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633844; cv=pass; b=epZbCRCK12i4VNbpE3JhSCQySC/0zhdQAhMiyghSIUBGsMtNC1JrHGyqD1fN3JeKu8Gf25UsjPru0FMfWfHXMGdLBK4uIV971GLLKCXrDYFxrKmM8DBO0h6kHmcbu5oypPT0lN/q/JlByaXhzlf5vt45DmC5u3JaTQeiIZhBQ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633844; c=relaxed/simple;
	bh=G5FOvTerYV+i+bh5EByuYps3MCibaVHg+MJbwyAppPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOYenFh36iRonaQD9UIQ1YRr8qZ/vJlyV8lWsT/HWmS9xEGaz6LOsBmCALxs39Jr9vTeBPheeZKTWgCCgOIfltIsqP3YkfvdmkanVPgtmduI7tJEh/Rv0XHzLvsDh/z1k4MQ3mloIGJN45YsSe2mHqEKF79/eXg5si459wzHgY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmQ2MvM5; arc=pass smtp.client-ip=74.125.225.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmQ2MvM5"
Received: by mail-wr2-f24.google.com with SMTP id ffacd0b85a97d-482f63546c3so451728f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633834; cv=none;
        d=google.com; s=arc-20260327;
        b=ffQbq3LkBchcSAI0wJmDUUHkWxKhGUDWNfY5MB5Z6NZSlu38/xdxOzhgOV6Z2EYXjC
         pjj0YeIdG3jgCx2PS4HKbl1WPwr7I+yqYSuxiwekk0/9DEbYUUNJjhSpod+IWwuUerBa
         ysk0ph7K8apUWaO7iRdfWQLwCwkDwHEHQkUN77Tj9CUZ25MaFgZX4OmrWQPXRY/y+uAV
         fsykpJAP+kijFD9FCwjo7i3C8BY0U49KpDS5oX9H/tGYJ5CkCK67ecqgpzwt/7qWlR0O
         ExdDuMw+agUTAXC20fXgvE+kyNsyiQKDDLcRZTPiq6n8AyhFsBg9i1OQm3wa6OL5+5W4
         78zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        fh=Yy4N0baFL0I3QbbNrrGXOKEMjxPkTzg95lVOA/2VSJs=;
        b=o9r0hhh51D3QVZqH2Y9e5gYyw+Kr+eViglHox4/K88joEVflhwCxdy+3v+8eS8lKrv
         2lSU1RYa0dhFd8WOxHNtWH+HqCStANZydbQ3nxBwHQW5Mdw12U1hN0145Vmkb47sfDoB
         GjyQ+dzy9aVkOHwJMtK8bZWWb+uGbeBzwW8TX0fg0MMkeTx9jl0aRa6E8RXLVQhBrMrH
         UdmR0LYepI4+y7VK6vx/+UwMnPHk+UUERcZZiZscDtUa4a/d5t1KdLGVlryVt7atMsx1
         NF69NEtR7Sn2puQgVvZ2bQBQdyIlMGSYcHpQX6sHRJQE69uNNLhLiiAtpZ+uexVAeUt1
         zatQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633834; x=1790238634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=KmQ2MvM5bbBAGigzXw/dD/EiH0Mu1NCZwNaW7R5G+nrN12e7KBsJrSgBJe8spSu1tI
         Y9hzg9wvPbydmuNFYtUj121MIqBdaATOR8dv2TtbN/GUZZxi/2I/QRDVRozd2uCjGkeY
         0AW2/4USIlZfsNIqRJm1SZJyvSjt5ah4t9SpGMAyK6R8/l/CGPOTbtOFQOWX8IO4avu/
         yGc6wzbmGiGtb/4UR1o0LZuxe46XSjXfy8OyHYmInzP7tFQ55ZewTmYQ/WXd2XPbSYZp
         vyYWXmZTJaQOwl99jriSF1w0blnppsCja5ccDmzJ1xKdMgOCXeR4x7Hidd0Ci9X4Hca8
         bIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633834; x=1790238634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=sASGMgsdQjQYW1mNCCJvxosjhxH6FHCx63nOX9dFZuQcekFIQJ1a0ml0WZyboXVcXk
         WyYlsQWi826c5o1lwq71VkHnGMnXqWtJIuwZdVvI4RTfslQQO1PAkHkRZEbUCbPEzcgv
         mVellnbU+4sYCeWv5JrEF6N66p4nsHQr0TVA4WZ9eUph3rUkv/cdsPyJp5VEkzFZFePD
         i9xWGT9WekE9qI1uwTm1a5RbveQNaDDURALYT3jDhCgXSdI226bvgj43TBZsu8v5gzSY
         3b95mQYUa9B8TzmzaWngWwUGDrtUE/PtHyxqTgUZCGkmu8Xf5DHEY+C3MRm+bTuRG10i
         JZfw==
X-Forwarded-Encrypted: i=1; AKwUvBwZkEqeqYsGDZ0CkaWSNHLpkw2pxkFGUQhlFvXT4cV4XrmRN14OvifG5U5df+mr8Yzh9pB4AtmVz1I3L5c=@vger.kernel.org
X-Gm-Message-State: AFuF++n36p7nXoss9vYEmSB+k0hdJtDw9aG4Jyqq4Cp26PQwxEgX8akW
	uZMi6rj73mLOZXty5MycAzh+LboWmSexK/Ky4SVrB6v6ZF1Cy1OGfrjEOhbB4zQ1NQseifOSkJK
	0xNcKjQIrNSQJpbA89+CPqD7FIUbcnU8=
X-Gm-Gg: AYBFou3ZNdQP46e0dzuC4QwQAWPp0H1PY/XUgg3mV2g3/37u7E1SP+zmZLvh9o9OE/R
	wBmyzkR5+V4gcSjT4XARWEeUq6teyvu1v7OSczlSXBbYwFKa7zzYROJhnxuYfLdfhKmvB5GmE0o
	8wT2Ru2e+m27wHLIJ3DuzN8Fuu6SPF6wGITBIHhAZ1COVqqGCA1V1YSUY688GOOUpwQQQGt0+36
	oVWksztf/Z8Xkr0V2RR9TBEQnXyQyqFz4xCRqFDFqnHKic/NYqficbMmREhJ5u5indWo/NTnpy9
	euhFdXvGJ90iB4mkdJi5zsp3LxNDs9wFDPHgLYR0+QAI9O82LVHv73NAsRLZri9Pe7d53kHsuI2
	FG34KAHs6yJY6LBc8HLyyBt4NXA==
X-Received: by 2002:a05:6000:2c02:b0:487:7fd:734 with SMTP id
 ffacd0b85a97d-4870cf2bab0mr7400506f8f.18.1789633833682; Thu, 17 Sep 2026
 01:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB748139F059DF2459B9813416A4B92@TYCPR01MB7481.jpnprd01.prod.outlook.com>
 <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Sep 2026 09:30:07 +0100
X-Gm-Features: AcwNN1U8vjkIrSzMqHnYBmAsTNjSFszApsXoNAyb_ZFCyUrlOZkMUDMj9NBc6DY
Message-ID: <CA+V-a8vZZB0vwdgOxWm30_Jzv2FCrtNTna7PWMGeyEKcNK8otw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: rzn1-miic: Reset PRCMD state before
 unprotect sequence
To: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoshihisa-san,

Thank you for the patch.

On Thu, Sep 17, 2026 at 3:55=E2=80=AFAM Yoshihisa Yamamoto
<yoshihisa.yamamoto.xn@renesas.com> wrote:
>
> On RZ/T2H MIIC, writing 0x0000 to PRCMD resets the command state
> machine to the IDLE state.
>
> Reset PRCMD before issuing the unprotect sequence so that it always
> starts from a known state, regardless of any previous PRCMD activity.
>
Please add the Fixes tag; the rest looks good to me.

Cheers,
Prabhakar

> Signed-off-by: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
> ---
>
> v2:
> - Fix indentation
>
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98d..818756bb8 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -270,6 +270,9 @@ static struct miic_port *phylink_pcs_to_miic_port(str=
uct phylink_pcs *pcs)
>
>  static void miic_unlock_regs(struct miic *miic)
>  {
> +       /* Reset PRCMD state before unprotect sequence */
> +       writel(0x0000, miic->base + MIIC_PRCMD);
> +
>         /* Unprotect register writes */
>         writel(0x00A5, miic->base + MIIC_PRCMD);
>         writel(0x0001, miic->base + MIIC_PRCMD);
> --
> 2.34.1
