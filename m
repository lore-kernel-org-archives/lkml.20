Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E40F3783C5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161065; cv=none; b=uTFh85gZjdER0DQJJhKPwndjeGGv27VeLA7CcrYN1HsLTaTE+AhtBImKHxSt0QiOVcDqgW/V3ni5fPhDFMSvGV/C/5TvZqf5DVcAUoJ9zqFtSxnbhGq/5xsjt4vwEcGVnaTJFj7gbjf4RCvGP93Df+3tRwoRGorAfREoirvMF5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161065; c=relaxed/simple;
	bh=VCOWo4u0sejFL5QXif8txOYk+8sJtM+dqK3lTGbBqGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8FtXWGXFmOCf5nBGXqiQqZSexhzNs3zCwv/+RZSBPYWBQFEnlooHI5VSgKGvQ55r5qNlO2qSAZwXyAT4BoRjnG1xVwoPmxy0MfdKiofhXv4YJVpkejhby65I/JogPCPDVh6Ud8GCtJomAesEYBBZAXydLovBmFeCpnnoVhh8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ii0f9Xob; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ii0f9Xob"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1af482519so301455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792161062; x=1792765862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9QGOZ83IKQe9etq3jkQaz9KzpqO4YHXXJ/jdZCauo8M=;
        b=ii0f9XobBVzIfif2nSx8NW/jFjbC0kXMtI5Q2VS9gpxkeQ9E8CBE82p3g9oJwXWLOH
         VCKtCucoEvlld7dWy+NOaKa9m05ik8fPh99d5r42n2n5vR3Hwb4xX4ioUnzkzA/O9ZWb
         Ueo13F+UJLWlGcTjhE1iBwmUWGSDqheD4ivXM/067aZ14xp6Nhx4AROUbxyOsNemM2lV
         mgkMs2+gPgrMAWgygSqwubm6xbkrB2Qv5ghjX8IWS4okx9FiyJ3SPIXEpZCpLOsizEpA
         5t901+mcjJ92TRGu2RZB3DNruo4zKJ4JG7S7B4rI3DkwpSiF5EpvBRxBkgkwBGd52OJS
         kmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161062; x=1792765862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QGOZ83IKQe9etq3jkQaz9KzpqO4YHXXJ/jdZCauo8M=;
        b=wciVQW/eUJf/202khJHhpbqnGvSBZSMBwj+ETeoS1FMne5XQgI+Uk9GGPs38lb2/Fp
         FQWpJne88HgxpFAlOEwoic8xOULzeh59noVA3SYy9gouhQjmc/VZau1r5A/7VXvWUE6W
         Fkzr9JhJAp1kCWNvBUawNv6ORpOVDR4z3Kl8BG0/mDzKDiFy+EmHBBs+dfCArThE+xmD
         LwCXbY/YQrFoQQ8Dwy/uQLXljq7PRnsCojtSyyw6nLcThM7lT9CwWfTCM/80uVTmv91s
         vaGM8qRpiYxPdFsE6MlRB5YdrKpV99VmE1uVwxbnmYL570+73Md8zLqp/4pW2SrTYF8n
         BSJw==
X-Forwarded-Encrypted: i=1; AKwUvBwB20nibdqZOXY9bKcCIs9oB2XSmYhXAVnFCgW0nZhijM/PgeBBkwr7Qw1BTcF0bz/5rsG7cYl9EMesBl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgMfdyJkTdFhC541IBHt2Nie7GO4T7psR6PUx+huQUYb9EF3jG
	yyrPgFiF9aeaNKdo6Y/1i7rTJJKBbiMR2/ELmdX0txH9APRBoRDxWLbs0B70a2VjYeE=
X-Gm-Gg: AYBFou3xnFfYIpQaiD2jexjf34lQt55X4vfuAMiKmq6ti3TbCVMaueWkTckhevwTB9/
	F+vbkRA4KNDWxeqOf3+1xsEQwrJecRY2V/7TxYUl8qGqLnT3RA1mYzIGz54vZZblOEeNmBiUCGH
	OIj7P8KHFV2NH12rXmCSpFhI4K+N4dRgQNaLoiMt0KS8rFuDI9aKkjlpcivT5D9TZb1A9FtIW3q
	XUNdpdM81xQ6VaOvqxkdXTQ/0jhH97z9E9rwI4kIMamGM1XwkLrY1AxRHhf2C/OGFdkQIrmhbxe
	5H/mIpo2H1D7qzJUdkawFbmqf6vm+ggYmJmB8OFnJuBPHeGgPCB9SaKQsVMdeFn5uvgEVPrKjSU
	bIpwwG+VJ4e6z5biXzZMDDpzEMT7dAjurznyO5CDKMT5kBHOvASZwqwH2I5mztNMeb/6Ip60B6R
	iDJp7ehe7VaV4I/IQFPE4i2b+wLrBn5tOhGPRCl+cL5v7M+tEL8Kg47n1rtttGum4QALLEr/MUq
	Z0FfNG/XIrKquxpfI1jGl+Sknm+8+zadKOxIFMuEl0DCi6/AyDjFliolFkKGMVgBrcvvMY4SW8x
	arZW2k8XlEgKtjWoeianDcVSKBDkwueSuaph1z+p6y8LUvHLvrrjEIbLE/s=
X-Received: by 2002:a05:600c:4f91:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1c664b3a4mr77865325e9.5.1792161062087;
        Fri, 16 Oct 2026 07:31:02 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm79138725e9.12.2026.10.16.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:31:00 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:30:56 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: pcs: xpcs: select operating mode for
 10G-baseR capable PCS
Message-ID: <atI1IK6blP-vumLQ@aspen.lan>
References: <20261014223100.304486-1-elder@riscstar.com>
 <20261014223100.304486-3-elder@riscstar.com>
 <f8c01002-da88-4f0f-a02a-7480591f4296@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8c01002-da88-4f0f-a02a-7480591f4296@lunn.ch>

On Thu, Oct 15, 2026 at 11:09:14PM +0200, Andrew Lunn wrote:
> I don't know this PCS driver, so maybe dumb questions....
>
> > Currently the XPCS found on Toshiba TC9564 is unable to operate at
> > 2500base-X and slower with a PHY connected using SGMII/2500base-X
> > (in our case a Qualcomm QCA8081).
>
> Is the PHY actually relevant here? What about SGMII/2500base-X for an
> SFP?

No, I don't think the phy is relevant here (the bit in brackets just
records the specific hardware combination that we observed the problem
on).


> Is this purely a PCS problem, or does what the PCS connect to make a
> difference?

AFAIK it is purely a PCS problem (but it's all soldered down so I have
no chance to prove I am right by testing it).


> > The problem arises because this XPCS supports 10Gbase-R. That means
> > that the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and
> > this suppresses the modal switching based on bit 13 of SR_PMA_CTRL1
> > or SR_XS_PCS_CTRL1.
>
> ~/linux/drivers/net/pcs$ grep SR_XS_PCS_CTRL1 *
> ~/linux/drivers/net/pcs$ grep SR_PMA_CTRL1 *
> ~/linux/drivers/net/pcs$
>
> This is not helping me understand what is going on here.

These names are exactly as they appear in the technical documentation
for the TC9564. I assumed these to be inherited from the Synopsis XPCS
docs and would make sense in the context of the XPCS driver.

However, now you mention it I can see that "Speed selection bit (13) of
PCS control 1" would be considerably clearer for reviewers who take a
wider view! Will fix this and will also be a bit clearer about how XPCS
treats PCS_TYPE_SEL.


> > +	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
> > +		switch (interface) {
> > +		case PHY_INTERFACE_MODE_SGMII:
> > +		case PHY_INTERFACE_MODE_1000BASEX:
> > +		case PHY_INTERFACE_MODE_2500BASEX:
> > +			/*
> > +			 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want
> > +			 * the modal behaviour that comes when we pick a
> > +			 * reserved value. XPCS allocates extra bits to this
> > +			 * field and allocates values from 15 down so
> > +			 * MDIO_PCS_CTRL2_TYPE + 1 is the value likely to be
> > +			 * allocated last (and hopefully never).
>
> MDIO_PCS_CTRL2_TYPE is 3. Looking at 802.3, the value 4 is
> 40GBASE-R. The 2022 version of the standard has values defined up to
> 10011b, for speeds up to 400G,
>
> Alex added support for 25G, 50G, 100G.
>
> Is this an issue?

It will probably be an issue when the kernel is first called up on to
support an XPCS that supports 40GBASE-R.

The XPCS (at least in TC956x) handles MDIO_PCS_CTRL2 in a slightly odd way.
It 4 bits wide and accepts 10GBASE-R, 10GBASE-X, 5GBASE-R and 2.5GBASE-X
is defined in the standards up to 2018. All other bit patterns are
reserved and instruct the XPCS to use Speed selection bit (13) of PCS
control 1 to choose between 10GBASE-X or 1000BASE-X.

That means we *must* write a reserved value to this register because the
default value after a reset prevents <=1G modes from working (I think
automatic switch over between 1G and 2.5G also liked this to a reserved
value but I don't fully recall right now).

On that basis the best bit pattern to use one that isn't implemented by
whatever XPCS we happen to be running on. One simple approach might be
keep using 40GBASE-R but to check PCS Status 2 to ensure we fail in a
non-silent manner on hypothesized future XPCS hardware:

	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
		if (mdio_stat2 & MDIO_PCS_STAT2_40GBR) {
			dev_err(dev, "40GBASE-R is *not* a reserved "
			              value on this XPCS");
			return -ENOTSUP;
		}


		switch (interface) {
		case PHY_INTERFACE_MODE_SGMII:
		case PHY_INTERFACE_MODE_1000BASEX:
		case PHY_INTERFACE_MODE_2500BASEX:
			/* better comment goes here */
			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
					 MDIO_PCS_CTRL2_40GBR);
			...
		}
		...
	}

Given this function would almost certainly need other changes to
support different speeds this shoudn't be too much of a hardship
for whoever ends up working on a 40GBASE-R-capable XPCS.

I assume it would be OK to define the two new values
(MDIO_PCS_STAT2_40GBR and MDIO_PCS_CTRL2_40GBR) in the uapi?


Daniel.
