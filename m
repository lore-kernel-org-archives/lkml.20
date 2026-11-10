Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794326257;
	b=Lfx9eGCqUbUKy3nAd4Akn3oRIwYfP2Kim8WPt6+7fv7oMqvWDftn8iROBDcucaXiRGb0
	 AVCtVMYhW3KGIu0pgKMDiLXh0k+MwNKNyTGskFrpiaUy0tZzNSA+6mWvRtD2z+Q3VBXbv
	 ELbvpDwRLGBrxdZ4PcHx1vOQCIcE0HRfJzyAwSFsI1HNCM71ryeXgGoDpM+wtuUeOWJS/
	 EZFQkp3I1MHNNFCySiuvRwQDbVAJbLYS0/wK2grIn41z3Ml7NiptUCC14cdIf9+S6IbOn
	 PvRMEIUl7QCX9gFO5Z9M5+ZWU1FBp6bsu8ir8G1DGrqD+HKB71yov3gFqpHaVvANLgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
	b=y0jfvIQlfEQrteNxAu9QAkP23z4CiWd0ocdOq8H/nd03JNcBs+KMx87XFXembupV9VoQ
	 B0xemjjrMADZV3/ohDEp5UjWKHshzWpEXy0Gl08Ak1JeceY54FH5WCL5DmP+MgsDyONor
	 4LEQPxCji+oBXWG4Axb4WQ6wr7J0bC8ALKVT+hMGSbULsuDfPEhHDorb1Yrre/yE7x4ra
	 8whKWjblqhi4HdStQWBt3gl9OPdBLEBMuOyy/7DtDxcEQIZMNb1T+87Uj02pfuDtzHHqQ
	 lmeT3lLGYPkv1nKw9RaFRXMW51DOz0m3QLVWr/mAJDIR5/cNT3H8YVh/bN9wdg3ytQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSOQpBSt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSOQpBSt
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c50515c3ba6so45817966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794326255; cv=none;
        d=google.com; s=arc-20260327;
        b=C7Gh1uf8TYB/pLPbj3OIEqOz0gSYxGAII0IueXPfNLuFo2BxJazzmp7QgBw3PIJwXd
         N6nRxpaO0GgoP+CqOPVfcKJBUwiu0V46hIujup6GdyHjJgPD1BXgf7iVQ/2tTCUAubk6
         DJk382UuE2Y0XoFu0h2VllfdbpS03Bki+Duefwks8/kc+w8LSXB6ayjbkUb1B+zulIOj
         6KpYABSrdHbRzBMY6ZuExCv20aWzhleixOEr1YQh/l0PhlCZAyUfZ6/i5swTPgtdDHAo
         KBq8z48l2qwQ9GJ74IPG/LurNGhfiM4EmUfIkEBGjnSpu6UQ5vG67gpwFQmlzjXyncix
         l2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        fh=YEMif1OPekMpljv3NXo3j2WZ84h3Q/zVVRmpLzNImsU=;
        b=eIfa0FiQYTLgHFVRtxZrzC826LRMtNb7gDRYvGQd7L0y6vwtL3jd1/riiCqANuMYxI
         IRUXc2I86oaW4ED4mGPioZySeHv6kY5V/oeSX17CgKSwNxwX1M7s/YxNSnwZBbl26AHA
         2BBQHdASSHf6Xjm4/Zh7MvSXrxwBtZOwBQ0LGryfoakeawrtwGclFFzPoxM2BaAIhBu6
         sJvveJ9PCsYJuUqaP9biu6G9tgoqjnDqpzl1SnXsVRX+1Fu8BlwCEFU5x4/dP+wUF9ZJ
         wG16W8x01VmCLZMffApYby4CM9QWBBgr8lcN3vqxi38s82z0q1CzUG1ef3upMcpXkaLQ
         sRnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326255; x=1794931055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        b=wSOQpBStCUApCy7WJpLLQG5A99C+sWei/oRKlu/GydyS1WNk+UJ86gb8atryq23src
         aPSg5bmOVbddSnXQfvymNjhtEpawuribD3vlA+xkOU42fFpoOjzJJITnvPGVS/wOqsY8
         KEBW5XjvpM8RobxWFMZUh0RypjQiKYZA5ZBbDhPyGqUER6i2uGcyg41bCI7smZVrOm3B
         DU1TmPtRCb2lOi+jPU1cvB/Bu2HOzfkLxWpLznt9h3UGY9PW/LqkK1PpXwKbUiMfIYoU
         3xj2jCwkvF34fGQLH4eQszfsaalN27A4XuqXMWnxscReXNDpJwJz7VVTtVeEMkQ0eSKl
         UFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326255; x=1794931055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        b=siNAU1FtBxz0Cm3nIuS9wBBKAKqD4S4MaNTu49Pc3GHcNT5cecVjnLMtgJh12npCGL
         ZkRkQelnneU/fS8HogD4SA2PpsX2ecRWCN+S8itRUJ4z+ptDQMJQ3RljWOV1wR9VU4IR
         u54gCPm4//tEhINvj20UgEJBmDQxCCv2JAf3PNZ5jF0cat5wkLbdbVVatmKxb+v25ZDK
         5xk6fGU5bUNDrBG+qtSxzFUFPx/+OqZ5NHnR/cauvva5uzV3dM52m1SXHVYTW+DVFCMR
         GnlmIG1p9juCXayfCTZrFOhbagKX0GUj1LaUF6uY2yNr7Rt5BSINWWTnpR70LAMnPHgA
         D7Vg==
X-Forwarded-Encrypted: i=1; AL+hErE5u+yoeXGnsx8FrB6NmryP7pFSGGwguIGy+ibu5evv7Hkkvp0btX8IFRrfnJlJdHjffexvxDSf/+8Wumg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I8tpr/h3IRTvayX+l/9OAfIbowySQ3VfGtFPcFyZrOSRWxCwh
	aM3gjXHFoGNmt9AFzTja39Odjiyc32yPKM6TFIHwFvYW0Lna+nyCO1WNs8al8NuHreh6l25zyrY
	Dh8p/exeG8HHHxCJ93z5SPUBxzKz7Hno=
X-Gm-Gg: AYBFou0fiWV5TiYI6/mRlAzuL2Q5VOKuqjgCMueSfQoX+OQJXkxXezMxh5L/Q8aQm3W
	xF1FZ7N5qhsuHScOWzrmlwT1mQXozs6N1UYDVlRoMpz6bOhL3Tg6QoC7CO8u0LyrUbhRtSJKdsA
	GbwWNWD/hyhaAKMNgt8T9Nm5ehlhzJSS00ei/Dgp8L0O15DgVtup4UTt3in1KnbDGf5ErUa/A+m
	fmo20muiUUPQ7gZv5T3bcX7AEFoF/DDwZeOGKlrV1YUpMldy1qRbXl+nXZHOFLCjUPAmK4vVq0r
	r7pgRBPcBk4e+KjRX3z6qjN7gD5QvkPd7ydYdkXO3a/Utw659qfVbAjfWCsLRa/SB4NyfkgiqZS
	JN3PoPRhc2W9DvfqWtpAykxntoqdfzOznkNGkODs7NLQDvQOaxUGdmyqKr///xT8imY3GA0LZ
X-Received: by 2002:a17:906:f58d:b0:c46:7ec3:fdfc with SMTP id
 a640c23a62f3a-c5049655093mr330817366b.34.1794326255020; Tue, 10 Nov 2026
 07:57:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102212506.3348537-1-coiaprant@gmail.com> <20261102212506.3348537-4-coiaprant@gmail.com>
 <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
In-Reply-To: <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 10 Nov 2026 23:57:21 +0800
X-Gm-Features: AclHuK8jzcDwnWHZT9BxNPqc1Y_PBqiAP6DVGP8roGJ07xtaPAuYBnsbVsZu0DY
Message-ID: <CALj3r0h5yTq41tQnGo4ECCmoAx5_2B7VFkYq62aA8e+qjKJ0tA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] net: pcs: xpcs: make supported_interfaces authoritative
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Heiko Stuebner <heiko@sntech.de>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paolo Abeni <pabeni@redhat.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=BA=8C 22:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On 11/2/26 22:25, Coia Prant wrote:
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > index 6f0a110e32d2..25fdc9c6b72c 100644
> > --- a/drivers/net/pcs/pcs-xpcs-rk.c
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> > @@ -483,6 +483,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, =
struct device_node *pcs, int
> >       struct platform_device *pdev;
> >       struct dw_xpcs_rk *pxpcs;
> >       struct dw_xpcs *xpcs;
> > +     DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);
>
> Please respect the reverse christmas tree order above.
>
> >
> >       if (!of_device_is_available(pcs))
> >               return ERR_PTR(-ENODEV);
> > @@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev,=
 struct device_node *pcs, int
> >               return xpcs;
> >       }
> >
> > +     /*
> > +      * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
> > +      */
> > +     __set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
> > +     __set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
> > +     __set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
>
> Sashiko thinks this last statement is a no op:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261102212506.334853=
7-1-coiaprant@gmail.com
>
> I don't think this is 'net' material, I suggest resubmitting for
> net-next.
>
> /P

Hi Paolo,

Thanks for the review.

1. Reverse Christmas tree: My bad, I will move the
   `DECLARE_PHY_INTERFACE_MASK_ZERO` declaration to the top of the
   function to comply with the variable ordering.

2. QSGMII no-op: Sashiko is right, it is currently a no-op. The core's
   compat table does not have an entry for QSGMII, so the intersection
   (phy_interface_and) filters it out. This actually demonstrates the
   intended behavior perfectly: the glue reports what the hardware can
   do, and the core filters it based on what it actually supports. If
   the core adds QSGMII support in the future, the glue will
   automatically pick it up. I'll add a brief note in the commit
   message to clarify this.

3. Tree selection: Understood. I will rebase and resubmit the series
   for net-next.

Coia
