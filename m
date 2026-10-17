Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67633E556B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216324; cv=pass; b=D91htLHnEHgodSrvoz04x6YSsonHUBNbp+LP1SxvK+ju1TnRR/2AdtunPZXl3MnXfqxGCf17v9icKS78MBJn4EO/bMMBxQXV7EM8NiEJA7LHYXXPZqy6f3zsoIP6ND1CEqWrCj0vkv8vvpkyOgCN5QxnHzZ1FvhdAosqmhWu/eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216324; c=relaxed/simple;
	bh=dAGUxU7S2OS9o0qphDYnHj84WBQWlXZXMIpBTNhn7O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrFbiTHfJ6hSeIzP6gMQh5fBoyhEH7VrQxs/u8ezNw/OTuvDwbKJcO/u/LzHpUnfkCH8nHWr15OoRKXns9nm+hshi1Q7+98AbfuS4gx9Ftk5eDBBAUr25SqT7SsAbpCCCDfZhtX5CwX2Ps3Dct+L4KEYnIrKEv0YxWBheD+SN98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTIcAt+/; arc=pass smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTIcAt+/"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e790c38caso22091566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792216321; cv=none;
        d=google.com; s=arc-20260327;
        b=l4+LHsctMJVT6fsURcQ/45Q+m1yIJkgRDZW8AVLkDkvasIQv5i1wdAofPzPowfU9NQ
         7awNSyn4czHT76sHSxiMmwPpAZRTqDyjC5gBYmFV0aMCzan7abzQ17qEvwN12GMwmiCq
         1jWM8oxnKJhL9Eqcr6Xrrj/LRa4+uc9SqzSVp7pTx2vThN3eYBLN0t63iZ9j3rw1z4DK
         cfn5diwcLlV82+l+Pvx/AtyY9fDA3kU2Pnlb+WjNm9zb5ksAidHSMUGax8J33LveQFsL
         YfAfYAgfZgWe82swHbR940DvgjCr/sQJtTtxHp42sxmZduegLaOpU9EyDVOFrzGkinEd
         2C/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        fh=va2dJT4QHt3U8NkqcLrQvRw/zYlFCU6+zp5zMpHGCPM=;
        b=Xx0eM2GG/G6PX4ZEhPgOdtPSTwBNM6hfMlA4gBAt0p8FTQZ6uh7HlkhbVQPqbw99XZ
         iDMq2jXqas6VjEyY1JPQ8cuycopiogGbcR62XfedZYQ6A2SJNbfD5JSCvfzjH9VYyexs
         6SEyyjDhQmwrDdXpVGhOtxnd+UWJyAjHUZF8L6Iyj+m5lqhqpXQKncKtmMKddbHxeIUD
         halVnk7jtwfEbmi/2FCUNDg4DktLky/9PZKlUDJUDWZRe56y2isstEXpOirG00txsJ6T
         D6rkca4b41ESeFRZcrpxQu1A1jGioD5uW5VBRTclDpv9H5TbgYvr0UwZ30CI0qav5Nmk
         +PnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216321; x=1792821121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=CTIcAt+/DjtvuOUNJ/C8+B9Ul4Pfgo9Hd50liLLvWB9X9EcIhi2mqhlrzQtpDUdFVr
         AOSotTOXeJZWdUufE3JhQM7vxV9lTtfY/9lav8VkX4jaVTtbp83eH6/enwqquVT/A79D
         uUL0G72MNM6IQqZWuWC5WRiYtUbIE3U41j9JMCd4OETLzkwO24p0deL5B0nEtG3bJWHn
         waLXY34d+3Gt0pJSmTSGdKa3p31xn+w71x11gJHqZOyysc9qsbTjFLYWJibflIdzHULU
         zCcmw057Fp3ty5bi/ldnjxYOGRwo/LFQOMEa0iCqiu/ugstznCZkuMXKAVJottIHq0eC
         1k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216321; x=1792821121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=n5WMnJ5jv2TM0G02PXzJBCWaUrZNEu6vZgB0kQ143zCWE+P53esDXjRUwmITwxDtdD
         jXKp4iqP1SKFbPrCKbQrDm4/rnxWi5oW8St+Kgc1tFghW+RD06kjZQrMoKrBXKmuNtOa
         Umdoxp252sCtGQTTvp6t119TCBGpc58iXSG0uZOQ352Dz5ddw4+hGR7vawkDUsznaXbz
         rkISOVuGQO398Q3juNPCeHsRKaIIHFHyxPOIHmmAap8X736xiqCCYGi0iSaPA292CT2x
         GXu4OiG0EP33WZob9A8P/uQxuM48CWIVRiyRHfhosai01WMw2pXECGAFFQkhNu7ZzVNE
         XHIA==
X-Forwarded-Encrypted: i=1; AKwUvBzHU0W1psaiX1EEeRoi9YnIGI8X39+4EUEx1LuMpw3bIc+GkopFhEjjqVUQyEMHJNBSxTOGwGRRqYCIlqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6kPZMtRG/eQsPt91gbmWZaqwkoq0fnPzEFtgJ/A/5kdEakC4d
	tMs/iG/8XN390A7Xuj1I1G6Qno9L46s441NTmKlXlc2tTziJMez+ZIRde5qvxtiieYsY81Rn59n
	c4omjRvnBOKhzCPAMfY0BU8CdXosHjDg=
X-Gm-Gg: AYBFou2YCZ3TraNQ82zXryDqCKoySwxaKKYs175stPxMLCjWBy2w/6o7EY7drPrhFrt
	Usx7m4N3lzb8MHuV8yDVG7fPLMidHQ14MMtWTQC8LCNup+4xMf2JqBR9+NCmwr0KVinhAnXvQsG
	6g4KHzJZ7K/tf8dd51CEdryK76A6YixHlwtzXgkvVj/giB+o4I6TciEyGxHameRTbj4abAHCqHu
	6utlpa5fa7g85xD/02l3aaWAOyRTKYQfo2tqCjELnOcvclRYPzBSYvhhZPh/CRtGEFdBnEhpCdz
	Wyk+a/d9hbBYdZGUOf0zoeHrrWMM4gs3cZsu/9mRZxG41eJeOfdSIcthJQ==
X-Received: by 2002:a17:907:930e:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c419df3d9e2mr123713166b.14.1792216320815; Fri, 16 Oct 2026
 22:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008175225.3375274-1-coiaprant@gmail.com> <20261008175225.3375274-4-coiaprant@gmail.com>
 <20261016163709.00cc7c12@kernel.org>
In-Reply-To: <20261016163709.00cc7c12@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sat, 17 Oct 2026 13:51:48 +0800
X-Gm-Features: AclHuK9gR2DkSi4xw_m2fA1Jz76Zlk0PlqVhdG4GFOV5ZHbiAG1eg9HG8sAydCI
Message-ID: <CALj3r0jc4GECe=Dp_gngTsVL03YmXhAt+BSQJei4QRrwLRrerA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	David Wu <david.wu@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=85=AD 07:37=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri,  9 Oct 2026 01:51:57 +0800 Coia Prant wrote:
> > +config PCS_XPCS_PLATFORM
> > +     tristate "Generic XPCS controller support"
> > +     default PCS_XPCS
>
> Why the default? Surely there are platforms with PCS_XPCS enabled
> which work today =3D=3D don't care about the new code?
>
> Linus is known to hate _any_ new symbols defaulting to enabled
> on olddefconfig.
>
> > +     help
> > +       Generic DWXPCS driver for platforms that don't require any
> > +       platform specific code to function or is using platform
> > +       data for setup.
> > +
> > +       If you have a controller with this interface, say Y or M here.
> > +
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
>
> Same here.
>

Thanks, both defaults are dropped in v12:

- PCS_XPCS_PLATFORM no longer defaults to PCS_XPCS. There is no
  in-tree user of the generic snps,dw-xpcs glue that needs it selected
  by default, so platforms that need it select it explicitly.

- PCS_XPCS_ROCKCHIP no longer defaults to ARCH_ROCKCHIP. DWMAC_ROCKCHIP
  already selects it.

Link: https://lore.kernel.org/all/20261017054406.1828061-1-coiaprant@gmail.=
com/T/#t

- Coia
