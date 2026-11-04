Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786772;
	b=XYRjrMruRMGVGy+SevPz128r3ps7yKhVPN7JWVNeI+YfJ9tzN2Rsqas99fCFaDdZQPfE
	 EN03jwm9vMPxlJ7mqKoM35jPmbpgL4juh0eb1NZV/l6vwRfNAU+Hizwn0+Ugo5LCtH34/
	 u2expksBupANOiCmwD60BtOCTYFzupyhx8IN3W+A3ef5IwEXdm7JMb2RlFIWi2B8Y54Fs
	 ywFinTJuAr1EwPbSBWyKfWR31psymbSEYu3M636gMtSklpiBDn4Az41/vWLpTdz343hH+
	 JxUernSSG6laDTWENUsROqqthHdoq6hQtcl2BojoCaatUGlG+wPG6wGOfv9qH5tiH0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OZ/Lc2atzdlS6PHoKjibJKd8Fm/mT6zblt3N30zwe2A=;
	b=CJOOQiFUNybc5XgdeCoa0F3lgUGPZ/JZbobamVPVZlAyB4YjqCXcJZ9RdLThnC4ASw62
	 cg9MPYPxX9YQ1cdO2Iw8u0uLXR05T90AY2HVDjlleHTpe3fK1YQoXr0Pv2RHR56RYkiCc
	 W17bCJqHF7s/zWJ6AH1Eh2tIc7d3EEBVCzo8VzI8wYnhe3Y391GYeOTGs9Miir9h1lQKf
	 zM2Ahg+/WoiKvwy3dQsCjQll623PsiKNGjtiWwWgCgth5WIfSa72reeEDfKrX4iuYI/6d
	 70Yo3DqfrkBxJ6JzX+2plVlcxS6zYU7f4UlV5Pw9MHRlLjcQH5ugbPTULE7bz9uR2Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k0B4Gqlt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B74606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B74606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k0B4Gqlt
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843b6f8e2c7so651819a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786771; cv=none;
        d=google.com; s=arc-20260327;
        b=Wgpulkcv+lNnZj4AIp/qLmoDQpzGWpNEOivlURrNLWkVFZD+IFi7POGH7zwChbIKSw
         +HZg5QaZj2mTFXq4EglUBxJlJSOowkxgGnVWay49HHSSMNb+wV3saogBBNIJ8zL4BtWO
         Ulpcy2cqHUTHlR9aq70LjDFuDF6mQ8Lvjnx3abJxDIIfejvu9ZW8IXoT2cLfraQ5vmSd
         nSSuRYej36oW72xJ4lxd3XcgpL9v/M3vsvz++pyhlVMkLq/qXnhWqL10wNiwMtdPPSVo
         YAe2TSPpSW5pOvw6WViCD7O4FILLb3OmMDRQJNPDw0hfUR+Gz+HZwpA+jpizE22Vf4UH
         rWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZ/Lc2atzdlS6PHoKjibJKd8Fm/mT6zblt3N30zwe2A=;
        fh=oP+5qwFOxDasHhb1ogm6c/74qnKK1/2Bkk3BgqwEJ5g=;
        b=E7PWkNDevWNsHLb4ltT4jEQLsMcAhO2k6XJeK+h6a53pZPhfA3eNQbacGGmTu4IzG0
         85qwF6UudYcPRYn9+bKljOf5PHyJEgtKDhQFcAeNyTQBnnWlQVfDMxG9fNrO0m5QZt0H
         LnVDSyK8i8tbgzZEpewL524FFIe3fBn1i9TbkuIqwoCXyOjNCxZDibSt+b2poD+NNzfd
         ri1e80K4d6Tjxopi/FKYacSRp5u9xzri6LrMSPIy8IVj/1ZXbZq1THmG51nPZoruwNA1
         2oYJRzQnY1a4Rya33tnUoKtFHi0465ERD9bUj6g60OBbnuQHvJGxJLocNwsq76+IIies
         GVrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786771; x=1794391571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZ/Lc2atzdlS6PHoKjibJKd8Fm/mT6zblt3N30zwe2A=;
        b=k0B4Gqlt36xOeJNCh6Er/BJuNdWlBdrrfaaeLNnyTxfMkHiJ3LRXBTLYqTW6VnIhWt
         PsFtCAdU9P53J6z7kqMW0sXopm76nPzNU31CoyVfC+Abm4iy5bHp7tkre72ce7bbeBtl
         G+e/PuSzBE/Wrs0uWo+0aplpq21rnDWXZsU6oLzchkOPTdruDGMdJf8PrYem0nxKQeWQ
         oVHhYTzzppP0D9UAOYJj2/o1N7CP8MACdEer+uj+2UcVCondcBbokiDrmSlVJJe0Bzx3
         wmoeUcdWa7euVBeTgSQ8dZAgMPtaWiSnfBfv0homUE5iAsIQMUP8tHlR5DYDSPUBJgLk
         pt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786771; x=1794391571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZ/Lc2atzdlS6PHoKjibJKd8Fm/mT6zblt3N30zwe2A=;
        b=fTJgt4dg7dTsg3IP6iSX9+cDAiBITCP+mjKJCb1GoR5OHNvUAwio1NkGIacbv1YPoT
         P360ACgCF6moqQxxqtKZi+JqNpt37KTy1CTYOMR3PPUHaFnpQ6zTpsPjqHH6+tfkfbHi
         Mg4ISP/DagYG450g/QGsPg1KCnz1bWhnt1XR1DIBbWsFBeu3+iLdWbrrTx7IWllV3Q/w
         sqBDlmy9/ozyzsY0/mSOToZ5c7ApeaN9IDFv6Z90BRierIiTiTxSBhSEL8n5VbZ1npDd
         dxVvsM9dmDFPMtqKfGDtNb94/r4J/a5iH3N+diZO625UNHlOHXbw+liIC0GgaR6mLo5Y
         m1Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzcKLJE6gTJF2ufVOldpaJ6exhZBNFpckUe1Wc92Dq09Q7kBGBhnJahb4W1428rEKxj9lrrbWaXKIi58ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/NkLWIlLUIo2CZJQyDtt5Fs8WWENKcfvmLcmYvWt3tP6KYEbG
	ToLppmSCNUDFYLOi4FoHi9+hoICsa0XTbld/5+FSkCaNAZK/DwehZp1/kYH4rPHmPRsWJsS+Sre
	6SQ83Y+TGl01S2oeQrmqMgsQ0nCS+9LE=
X-Gm-Gg: AYBFou31I34j5dpu/WwTNqQkFcnWF1Rf4ggLSeSSHqt+Rig8NYf4pWAE3Ea8E2x7TEo
	xOyP6QtHvjkuqlHxX7KSV2P8dMnlUxuaew0D+mV5fkdNUM8yeBby+4X5qUgEQZFNxiJ8FPIvyje
	rWiLSx6JS3wg22vygYb8uw7wlx3/U6AUXFuOC/exXUhBKlnee0bbv6XjZto/Ta7yiBl0+15Ntv8
	3H24D2NLrGB2baSyfgxn2fHxjXBgfaiEnd2VtwRcTZ0SEEnO2U1z5SAoG19VLkIq+H6sf5Zer4s
	cTbU2m8Y4IKIBJhVzhuCMRJMwWuOj1z3K0bvfB1uLiNh9CgtFEMjhnKnpGeuMiFS8Tf57FSJNIq
	+qjYckNCugNaixLaiYydaWge9a0FxIbfYPKo/WKUz/DwXjlpKPJ3osOXYh2DRvIdipp5x1lc=
X-Received: by 2002:a05:6808:3a0d:b0:4b9:e6ab:d085 with SMTP id
 5614622812f47-5640dd277b1mr10897713b6e.37.1793786770706; Wed, 04 Nov 2026
 02:06:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102155641.3682626-1-mmyangfl@gmail.com> <20261102155641.3682626-3-mmyangfl@gmail.com>
 <84089fcc-0150-4464-970a-09400f3ec5ca@lunn.ch>
In-Reply-To: <84089fcc-0150-4464-970a-09400f3ec5ca@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 4 Nov 2026 18:05:32 +0800
X-Gm-Features: AclHuK_lPVKhdBS5T7TT7NXGuhN1GFF0oSF2CW2k7kB40YvYn0ddad8zYQxOMNE
Message-ID: <CAAXyoMN4ySBtnLjqKcfAa4XwUR14-fjaJh-hcCyumERagmcHvg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/6] net: dsa: motorcomm: Rely on port isolation
 for CPU port
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 11:59=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > -     ctrl =3D ~priv->cpu_ports_mask;
> > -     res =3D yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl=
);
> > -     if (res)
> > -             return res;
> > +     if (!(BIT(port) & priv->cpu_ports_mask)) {
>
>         if (!dsa_is_cpu_port(ds, port) ?
>

The next line is ctrl =3D ~priv->cpu_ports_mask, but could change both
if you prefer.
