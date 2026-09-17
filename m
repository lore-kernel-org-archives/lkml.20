Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3063F88A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633279; cv=pass; b=hcAUk0OFDyocVYCHojW7rzX0ajXqBdY7CytbMaSVCQDbJMjm/+2H8OfYjRz3RAePArB9jpl48giCHDN+0Ugz5B7x73lO/hrFkwk/BDsJdYhWSRpGuTlMxLgNTb8qp9ASsLwpTMa9flXTOxzM3ngVsMltrJXuDxyuItWoyZJCrRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633279; c=relaxed/simple;
	bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adYk0vEwPHZ07dfkGD4rduKEY9P1la/qk8eqZZ9Mhm2Q4sBaTcf6nOCknJLbwyPS8KY3t3zPWNi0tzgj/NbkgO3ecZyqF1bc6qLzc7JRLiIpruA+3uQ/DgBpbIv28SECwSil2B7h01WWu5Mj5U7rzGZw74GyLHWNfaXPepDPJP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkNgSj6j; arc=pass smtp.client-ip=74.125.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkNgSj6j"
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6aa44774ee2so8386a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633275; cv=none;
        d=google.com; s=arc-20260327;
        b=Zr59Rxz/yU68VypveTgwVnRTy+EBBIMq2SyH5wyz2ekuQdaZdXVM6wDtGeVGDy9Hga
         5D8vJK5s6CWUp5Qp5a49GRDOg1ON/lQk9glmvLXXvvTVkF5yQEKOn9UoFSSuO+qafCJb
         HwfOy03bxxjpD4Rv7x1/bUIb+r6mCyc7PO3eJBmA2quskygpYGeaDteBYgzYTaxs0qmd
         43KVTeI40E3xHu7KvIU3GFxq5jGCuD6NX7T8v9+IksP8Q6jbq2F72cupWjKks0y1jqZm
         irJNDSuwbJ9cDV1p0HI6GgDOwDcBxUc/MARGS6N4RnANfYIgRaI7UiLgKUAVIroqkm8k
         H49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        fh=8HPmWwcHbZ51h269iNjGP2T1tUqthHYPc1BzX/H8C0w=;
        b=ftBuH8dDmln9fyog7z+8q/RfL6BAzfnAI1rmXVSLRazVZqqhD9XlcEHoejAs+5uhMa
         yBeLNG1Y14zqv5iCWaFIpxhapCTTJthrexiq2OZBAUpD7wTkwEBoaDDUbMb6uUOjXSfG
         A9w0SbBks6i6Ur3i8suaE+1JLL9jTDbc22iEJ4pqOV1lDohgFkuZysAksfwVgIk6Wd/f
         PsGG+ECZeFBRplGt9HROyxbUxY+qrb0Eap/HDLfKqSfg7dlgwwy2oGJBu2QVT49R2aIH
         /gVWH6LyGGkEO3NLKjG7+47Vr6Lqnl56IbYOHPm2uXlt0g7EdXQIDcVb1EW5dD5nMPg7
         SHgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633275; x=1790238075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        b=LkNgSj6j1mh+t4RwWFqK0oZGmHByGzWfcY/zg1MYPjx1xJGUsm3Levzmg417PBZ/GX
         lS4n4bDiQ7tLC+iV/ptYNIlTQKgCmtD1qqq8DZwX9nwKvUybD/WxwuNLq4XlqOFraN6J
         e2pkajBHBVhw76hnQuSRkrcUSmYLUl2cuqQsGypWILVEmLEgyVf7iCYEaFBHfJOGlAVO
         OkhaajhhQu9KyE5sB+km8AUYGVWRbxEDjZUgMUXB26aVb+rynQUFpvOtQ6Q6gekDOdPp
         PhRf1Uhn6Mpea/EwRT/oMizBfmS2ibRJGktxgpXutOxCGzD+nfIksnWachRymFwffUsd
         RH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633275; x=1790238075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt2nG22gQ2VlhRCDsFPAMB9fHywKLlkANeCXC+o2mY4=;
        b=SOTDLulCCOzQOYMaBI9mkAK1MTVXVuDKEHrakLbkmVgCPXkoiowQ/lIjgmuYl/BB0L
         dfWgJRbE4SDV1cBq/fhObmQsiYrl+OXeoRgIhFxEQGRgfnz75HFo3GVw/3aEZJWIUncC
         qOCu2c+0vH9GpKYT6XLhRp/Uk2JCg+hvfO7im1TCwIrVvK0K+fTEgp1RBAaowMOfbbiq
         0Mygju6LHk7VM8WL8A3Clns9PFrNTJXgkfkOmjbxBvugyQkv+qfDktmu2GJqldZq6IT5
         UHX2b4izFsE+ffOg/Ng2zrpDuWJvlS5Vb6U7CRikhRRatCJzbAwkv61nqFLhD3Lsn3t4
         rzaA==
X-Forwarded-Encrypted: i=1; AKwUvBy/o+qd64GAJUp5JntS1MI62Zn9/3zocB3fVC4ytzvgLVbTMejE+/32LkMnKMsrI3+4+ylI0TYu2TH1JuU=@vger.kernel.org
X-Gm-Message-State: AFuF++no9nTScECAqI6ZcQxBLjexs27q1r6wn/9+w1j0eKAkDDjPMP6M
	u4uDpgtWxvlm6PTSq96LPg5dE6hJqBFZDD9ykeDTR6hPLbNtktwiYBkV4BfHU+Xl3YzS3uOSeHx
	pV0TQ21FG1/H+Y/q4s7VirPQiM45YoPA=
X-Gm-Gg: AYBFou11F04ARFgKKkj+iB2jaTJuwJ3eBnofiXliGg3jn3QwdvADrXDY7xpzYOVr+lu
	3V3fMfrJsCvCjl3BBdfiB/wTvkMPeE1chPecEs83u/42U54BIjYCIc7dGDjPXPXfsaucFlhsXTs
	1lr3sWL2LQ4YA+AzNpPj3LAM209iziVZi5oMRYXkMqktsgrQpH45mtFwByfEQ4LRfxfXXCvoA+U
	oM00KkVsqEx0pWJwC+Y3e+uJfUpCfCPLjlSh/M0AbrqXHTkG/5TZfGKu8cRyFDlBpnMBsD2NCMs
	0v1W/Xe3IXWK+T4M2On2LMLLI7p4VhAG4xqJKjJW9Ot9InLtCIDIV+OmIzdFdOxZYoBy6A==
X-Received: by 2002:a17:907:3f11:b0:c25:35cd:fdb2 with SMTP id
 a640c23a62f3a-c29f526dd2dmr190379266b.7.1789633275095; Thu, 17 Sep 2026
 01:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <aqqI9wOnradk9d7K@oss.qualcomm.com> <97924d2f-45f9-44d5-b482-97fcbb70abdc@bootlin.com>
 <CH3PR11MB8413131D50175690DF9FDAB0E4B82@CH3PR11MB8413.namprd11.prod.outlook.com>
 <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
In-Reply-To: <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 17 Sep 2026 16:21:03 +0800
X-Gm-Features: AcwNN1XL07xRu5XXN3J_i5sQYnNCkDU2pPnYaE7rXj6dGCxz8rSrRM8IV9aR83Q
Message-ID: <CALj3r0gXP0+bwsPVtuw=9RRQ6gpmuHzGc5PzF_a3XXXTTZYcqQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Karpiniec <tom.karpiniec@outlook.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8817=E6=97=A5=E5=91=A8=E5=9B=9B 13:36=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Thomas,
>
> +Coia
>
> On 9/17/26 06:29, Thomas Karpiniec wrote:
>
> >> Can you test settung the STMMAC_FLAG_SERDES_SUPPORTS_2500M flag in
> >> dwmac-qcom-ethqos ?
> >
> > I can confirm that dma_cap.pcs =3D Y.
>
> Thanks for looking up :) This is a good start
>
> >
> > I tested setting STMMAC_FLAG_SERDES_SUPPORTS_2500M on hardware and unfo=
rtunately the flag alone doesn't solve the problem.
>
> Yeah, but it's still the right first move. Russell planned to do that as =
well :
>
> https://lore.kernel.org/netdev/E1vvDJi-0000000ArhH-3ipf@rmk-PC.armlinux.o=
rg.uk/#t
>
> >
> > I think there are a couple of things missing. stmmac_phylink_setup does=
n't use the integrated PCS bitmap to populate config->supported_interfaces,=
 so SGMII is still not advertised to phylink as a usable host interface. Al=
so stmmac_integrated_pcs_init is adding 1000BASE-X unconditionally, which w=
ouldn't be appropriate here.
>
> Ok so, the missing bit seems to be that priv->integrated_pcs isn't taken
> into account in stmmac_phylink_setup(). This needs to be added then :)
>
> Looks like there's also the inband support that needs addressing, that wa=
s
> part of his RFC here :
>
> https://lore.kernel.org/netdev/E1vvDJi-0000000ArhH-3ipf@rmk-PC.armlinux.o=
rg.uk/#t
>
> > I did a proof-of-concept fixing those things and the end result looks a=
 little messy: config->supported_interfaces could come from either get_inte=
rfaces _or_ the integrated PCS with unclear (to me) responsibility.
>
> There's only dwmac-intel, dwmac-spacemit and dwmac-rk that use the
> .get_interfaces() API. Let me add Coia in CC, as they're working
> on better PCS support specifically for Rockchip :
>
> https://lore.kernel.org/netdev/20260915123802.1561724-1-coiaprant@gmail.c=
om/
>
> For spacemit, looks like it's not really a problem as there's no PCS
> involved. For intel though, heh... Intel platforms with dwmac AND PCS
> are hard to come by, but I think at that point let's roll with the
> bitwise or'int of get_interfaces + pcs interfaces.
>
> > This POC did show that STMMAC_FLAG_SERDES_SUPPORTS_2500M enabled phylin=
k to configure the integrated PCS for 2500BASE-X and a 2.5 Gbps link came u=
p with no apparent issues.
>
> Maybe the blind spot is inband aneg. Mohd, you were quite involved in
> this, do you remember where we stand on that front ?
>
> Thanks,
>
> Maxime

Thanks for adding me.

For the Rockchip side, rk_get_interfaces() no longer needs to advertise
SGMII: stmmac_phylink_setup() already OR's the PCS's supported_interfaces
into config->supported_interfaces, and the XPCS driver provides SGMII
there. I'll drop the SGMII line from rk_get_interfaces() so RGMII ports
don't advertise SGMII unnecessarily.

On the qcom issue: the missing bit seems to be that
stmmac_phylink_setup() only looks at priv->hw->xpcs and
priv->hw->phylink_pcs, not priv->integrated_pcs. Extending the existing
OR to cover the integrated PCS would let qcom-ethqos work without a
new get_interfaces() callback.

Best,
Coia
