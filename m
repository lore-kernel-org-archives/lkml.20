Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B641BA75
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825957; cv=pass; b=G+NyDY8XbUC87l74dMlowjIxbl7ycBpiK+kx0iCkGiwjv6hyIVugOjGB2y5vp5/nAmtDIcn/N1qSkOnY7L1X00WSfTtaOLGbKXEaMhQUxyV8q/+SyyDQqo5ezH5/WSOR7qEkGJhsdojXQBvh+Ro62C2GUyUx1ZtXRHnwJVxtp3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825957; c=relaxed/simple;
	bh=6qj/65Z+1ZPPWofxXA6mm5Qgq8bVGBO/ohXFA0XzNeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teEFldBodlVgTHaCRmQXULjNZXsrA6WIAC3/3GndyyOUOlgytzdXsTEh8Ukyr5Y/0Usbq01yiSTesPhy7lV0xv/oVCoJw/25WZWQdgwkLdPLSQmDip58ZBLeYGD7k5NO7cCt5vyFzE5mMa1IrVo8SPiQH0dVc6EKKCLZRezNCLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejXxQP0I; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejXxQP0I"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2105881a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787825947; cv=none;
        d=google.com; s=arc-20260327;
        b=ask2iia+v9sfc0+wP1Zc6Mt2+I7ipO+zOEbGTGw759JRBK5IOMqNkv4UuWSBO2QZP1
         hLmOSrc8N/NNrCs7cxhoYytx08C139uWQddK12FSVM+dmWvPdq0Z9l0FAsoCKuTogUJy
         FbbFkve9qpgD4G+5yUqiDlsUmAyiNeEXfkxZcu7Q9nJD7kdSKjWy7WbSebT82KBNQJns
         ouN/5Z0KtWY/ZRJZJDgX79X/s4KW2cbOeP2ZNRS/4H1JKdbfeAD+zxt0kxxFAw9076ps
         Pw5V2W3jKc2nUqTdph/ex7cFT+CSHW8gHECxcoZItoQUor1cKBqMvtMSoW+klzKmrHNB
         FbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qj/65Z+1ZPPWofxXA6mm5Qgq8bVGBO/ohXFA0XzNeg=;
        fh=nnTooggAwfbz693DroYztQCbfOkikqhxYtLk6JMDZVM=;
        b=P79XRx9w74NniTzPCYewQVWZyXvphN/BlKbtt1FpykUc8G5Y1NB5qa+ln3mDabLB7Z
         uQd+hz6kMqVOHT+e5aK7lObBJbe1YJVQCdUe4WEdyTsqMsPLlWuppYRZ/VlwcGFSFiLM
         e9zu8HTCgYVP/7iqWRbfQLyPhFP/jFHwVQDhPOXz7O5HGJTz+4SX6C+293icohhoCXd7
         zhIrhi/KMIdAuo4V1/8ODkVKW3asxMCzbWYQDKhJhbQ1fnULMJryoI4XAtfvprm4fWqw
         bfJYxF76Leeih0brL+/lSRhz5/GbaeQZv2wP9QBRaZmjhv3KBFTl7DGi6HsPbE2QiKK9
         w/DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787825947; x=1788430747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qj/65Z+1ZPPWofxXA6mm5Qgq8bVGBO/ohXFA0XzNeg=;
        b=ejXxQP0I7CCaWAmjObCJflM6Fr4/acFXFEyKPohnicj0nXHAAL0RIGBwNddaON1hLI
         HamQOTUgBAaW6qObdpLgIBAQPrlJY7G5dxseAuHebz6YBZ4p0rMktb2VL6GTi6IEGTlM
         IOmr0XdC0GPodkMYhU0TE59viVifs9IH3x2mEdtaCO7tsC2iE5Grf9WWwWn7MoJ41jwo
         2NzJOFl7ywkmJY+gK05sYvrPZX8vARGf9bYDbBcxkMDo8bxyg8emArxLAEebWycRE16N
         ph3VPW8B2FFCLgPKMTJW+CGrFtmLQKAHZMgYVQNbx4OKJkb8Tk7ujQmiEXHOBLDkVODc
         npEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825947; x=1788430747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qj/65Z+1ZPPWofxXA6mm5Qgq8bVGBO/ohXFA0XzNeg=;
        b=SXrU9r/mqCaQsj0wvpnlVZg0d1oqAXh2fRTGrG8SHh2PL6QOmZowkVGBBr3lqJOl2F
         4NNweOpYhQTMB0K8DLt1/oyOVMHL6U7FdTjAOUpynNE9LbfxHGkAXXX6Pls1vDDtPbWJ
         bjVnmV68DS1kC1FhqiQX0x3K1HHw/n1uHvHty7pFrhFaPFPIeNjsu1RoCx8lVeg3Pklb
         clfDVX41ssE6Y0NORtKcajPHWtbHnH5pOd40zWu+dBXtffD54uWekap1zB7qp0lHInb2
         Ima8ngMrwNJD15h40FtyNrA8ru5/rrKVI9n5CSqTn2SQHrLsz9BESHVYUSIzSZNg6uVT
         rZrg==
X-Forwarded-Encrypted: i=1; AHgh+Rom2I6Tpih2iz85n7mJk2kythsZDyzi/sOX9ASh67IXyvIdz00u9HWja9M1weTLDKXtRoeIwgeyrwxSit4=@vger.kernel.org
X-Gm-Message-State: AFuF++m7NDfDM6jTIvxHicxVly8OCPbMCDProfnUaTfhqfy3e/pLeW+j
	xiafadyX16KO7ni1bTXJPPY+0XK9W1H667OveSdhWO62PoALkxEfiG4XOBqXuC9M19x12pF4HxU
	T52siNFHKpbpj9kDqdcPd63Ogoxtj5pHoHQyGJiM=
X-Gm-Gg: AR+sD11eKsblwneIVqs0gxn4JMrULnoHwOlK5MPqzcaoKAL8ppZD5l3T1Ua1N3+vUi/
	gYtTSv6ipgUbCsYC+X2TdCyF80iVbAOrHPlv1o+AZvZnlAaxJuW/1lJd7xTP4NuCY+AGI0PcB3u
	PaXe8/hktTfjH3Bep8s451LW6YAQJ3aE2xK5vxMVZTTk8fmQ94B1pQHVNYY7n2+Z9ZcupX/T+EU
	CAQSUE2zturKbexMqNFzHIt/cebhHNzcl/QOHK+es/rGJ/OFYvWJhlLuQs/npnP5zFd4Qb93An+
	y1Bt2e4Bczo6HpY0zAm2u4myApIpe5l7AlBsInylTdoVzSnyTyDxG30yJxbTmrxUVQK4k1LjxUY
	Ybk+jczO8KQgLsarnpqQ1Rx+UMhIDmfZwrIHtvgnybEdUBHt0Y0cutn4iwDcgqGOi01C2C+c=
X-Received: by 2002:a17:90b:3a05:b0:37f:fd1f:d30f with SMTP id
 98e67ed59e1d1-3966d44312fmr29209094a91.12.1787825947210; Thu, 27 Aug 2026
 03:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-b4-fix-pcs-lynx-an-v2-1-9bb1dec96f0b@gmail.com>
 <20260827085533.2a3ocp6llvhzczps@skbuf> <CA+DkFDboHq+fw1bYdQR_2M9hM+Vp6W=jR0VYCO8u7KXWVq9F4A@mail.gmail.com>
 <20260827094812.52skjha73d3fddod@skbuf>
In-Reply-To: <20260827094812.52skjha73d3fddod@skbuf>
From: Patryk Biel <pbiel7@gmail.com>
Date: Thu, 27 Aug 2026 12:18:55 +0200
X-Gm-Features: AcwNN1WeOsZsxNO08-yfxpLxcwO7f39Zgvv2ZGhmdsOEBGKWZNaNyPRgbqIvBds
Message-ID: <CA+DkFDYx2ATtdvzKKJ5kNrhb+qJN2opcxi63ujFGauXR9mBa7A@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: enable autonegotiation for 10g-usxgmii
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:48=E2=80=AFAM Vladimir Oltean
<vladimir.oltean@nxp.com> wrote:
> > Looking at the lynx_pcs_link_up_sgmii, once the neg_mode
> > differs from PHYLINK_PCS_NEG_INBAND_ENABLED, the IF_MODE register is
> > explicitly programmed with speed and duplex values. I browsed through
> > the manual but did not find any similar register for 10g-qxgmii. This
> > may just be due to my limited understanding of this area, but is this
> > intentional? There is no need to epicly program speed and mode for 10g
> > qxmgii with in-band autoneg off?
>
> Yes, I suppose there should be.
>
> I also don't see a register in the MDIO address space.
>
> I do see QXGMIIaCR2 field USX_FORCE_SPD, but that's in the SerDes
> protocol converter wrapper space (which is handled by
> drivers/phy/freescale/phy-fsl-lynx-10g.c), so that's a bit unfortunate.
>
> Looking at this register, it's not clear to me how individual 10G-QXGMII
> ports could have their speeds forced individually to different values.
> The single register handles the entire multi-port protocol converter,
> it's not like QXGMIIaCR4-QXGMIIaCR7 which are per port.
> This is something else I'll have to ask internally.

This is exactly where I ended up with my research as well, and I had
similar thoughts. I would be grateful if you could let me know if you
find out anything more about this.

> > Given all of the above, I just wanted to add that I'll be on vacation
> > for three weeks starting at the beginning of September.
> > So if you'd prefer to send these changes yourself before then, please
> > don't let me be a blocker.
>
> That's fine, I'll also have some vacation time during the same interval,
> you can submit the work to net-next when you return.

Okay, great. I'll prepare v3 then and submit it once net-next reopens
after the merge window.

Best regards
Patryk
