Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D02EEE93
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727230; cv=pass; b=mWMtxvujKHDExMTkbQWEl9OMpn17D+s3MeRX/0bfVYHo/w1jMmzoNxBqUDvHRjKPPpvC1J+qxea/7l+AKwNHyeAkgja7YuYERQWZGEjQIlkaURtXgB2vjf3i8e1MJ3ia73+YEAeoObCrZeRKkYCP/jR16Dxsab+zSrr6DFOu8ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727230; c=relaxed/simple;
	bh=NlMfuw40ORFWcSamCr7ePf+fXASb8e7WnzfqYP8h6f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNBMeRZDJBdRBU+p9HoR4KXOPytyc3p+XivTg2SgxIKT8eiG0RFvCK4rXcZCKh6g+HVntvlAVaDoAY9MCJt3AUK+rTveyYFytsEZv/BA7EXwKhyzbAwtXiyqQrSlD4YBGAEwl2wcr5dO4jb2JkSnHwwNUI7nZyPalVWMRb3e3VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=tN6sm+LY; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="tN6sm+LY"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b55859245so22657406d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791727227; cv=none;
        d=google.com; s=arc-20260327;
        b=COhOtakfLdPgEcdNF6XbYjQKcYC8Kk0P2cCEvPMmtJFmLz+imsQraQalpePmfXNVqZ
         p6ZxIV/hcYOiWKqmrmuoqf3vueHrGmVrxCcLcefnVx87nthwINCUNGRDZmgjQSt31j00
         oOTEzLgeR2fmDDuyaYlxYV/Kd/NfSCBQDGcDw7hQHrNO0M2tW1WbqaVFwqBMm0al8nDw
         +7Dw5Yp9x3LnWZBcbWREFPP5SvH4ryjk0l7t3a4+5AsRcA6qivew+9IXm4ZD6E3GP+l3
         Dkw7r5DN26shV7a3kPq5ft36B5UOZkF1W+kNrInekhAS07gBLV5zNIh43/ec8xW51FAU
         H75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NlMfuw40ORFWcSamCr7ePf+fXASb8e7WnzfqYP8h6f8=;
        fh=JIXHff/1GEV23Fuj8CltStaZyfTg4cvf3e9DvnDAWqU=;
        b=Lj0O775wqnNz/w0kJMp2dFKBhF0xfCA6rr64KHMwoqvqqGZL7Us7W8eKwNQHGyYXMB
         ABVdBj5U+TCnRRD2fbHGnURrbqvOIq5KbIC6Y8i8Ebc/+Me3WSY592PMw9LAixh+Fnco
         GQ4tMSbliU11qmyoluciHGEGiRrp4MM8i0DyCXrQsqcuIE4Jx9f0lTcsBF46RWtMsku3
         FVAIugllOp6tbtakAlVTSedKtQtLuXvbEJDRkLnLJJpPAYkEIffePInV4ed4YWyLnd88
         WVwrgTKjxXaB0fdYyQVxsH7BMcvtCx59cpRLaRqdktxBCj/eEsWcORLCGYV+t5I3qsZD
         N8Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791727227; x=1792332027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlMfuw40ORFWcSamCr7ePf+fXASb8e7WnzfqYP8h6f8=;
        b=tN6sm+LY6HaXhzKY+gqPIZ01DFqw8JvzPhGVWz3bUFQdk4qLqiSTM6dynIKlftfmc0
         2uUsjGx9nlnoDyo16RCncSRnmuk0dtVl/gPp7PcxGiA6VTAiT9FVb41S+fJ21CtOExbT
         uBoA7HqquqbGLK2xRg1LvE6+f/JS3FACcHUQbNc2ixlpqPdHMGC9M5njVRLJYGx/0IUi
         6X3i8GHVPmCifir6xlhOZfjgyWPZP2dwqfbr/PjKKi5JCkno9StG/5HsLL5+vSwt+8E5
         FtPVOGwJmCvb2Ix6oMcz3us3PA0sLQ7dKL34yi88NYkfY1odphpS8KNjhaQK3CgxWWJW
         6zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727227; x=1792332027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlMfuw40ORFWcSamCr7ePf+fXASb8e7WnzfqYP8h6f8=;
        b=QjauCUABSSo01/o4rveqtyTSyxH+BmJ/oPj5CwejLEx84QXSBEDD6EE0Zhi2LWdfJ6
         RmKp2hqibs4OoGkper5zR96cOcH95UKpJwEZ1d/geSOnBiMR9s5AGdRh7ZR91gaAYb7V
         Ia1f8UtiJXxnqwIjzKBvHOOzXJysYKkO7khyKGCip9TXw22K6G0XQCW0+ZtVFiLza57a
         2TKya60VkKgVwviiQfno0EQRdr+gB/5jVgLIre/SZ8WStnC8570Ga/K9Y+VQr7nC3u3D
         kT1VO3cFGJ//6iEI5SLQa1lDfMbi21TWnLAQNHhfFOtZSLwQZU4m2yTAf21yJS2QduX7
         ybmw==
X-Forwarded-Encrypted: i=1; AKwUvBwjwls4ooX3SpM04mJiUzAP2NWpfLqD/dY4AyZhrCdkev45l6TNMR1H7XR0tUOyYKumlTkvuR4BKmTNmv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYdBiAnxg9JlKIlV0pkMRXKcFTSNZ35Ih43CMua6Gvj8LtbGbv
	qXMGwBq7T3V68p8uflLiX2AyQ8Evfzm5g9vJGchX+8gS21n6EBZmNUoFGi4zZF2819U6jtl3Aa6
	sqZ0PUNihjrB7u5tJG0e5rLvOTkDRtdZQiy75qFHJ
X-Gm-Gg: AYBFou3eIqrxIo2/f7ph9zsEQAvrWwUZl7xB62FHjy1NRiNWVztZO7pU2wukWMinOeZ
	yHI7lOIq4p/HNhiPvhdM5F8OlrK0ELAZOs008BTQc7F/vpqMuMsxgJ4bFH7v2ZRK8lWXVmA0jXR
	rQ/tpnIyz9Fsaz8YTGl0nDdrVEv/mRmosKQ4pIsf9Cow1d+Eb9bicthhnMYWcL9vADxiYE4oszv
	Y5ERG4B7vUZj/V3FV3xwlTXKkCcor2fks07b55f6v+4+0CA3ZR2/dT36CTlRBQeT3x/sUbZ4RC8
	oIHq478vukx1WlPzBWbmpZOcrtuUfwJ8R+reslKvGNMOi+3TIt2fvC4YdkAbr74jMA==
X-Received: by 2002:a05:6214:4017:b0:917:a1d1:3b91 with SMTP id
 6a1803df08f44-91b554fe8b2mr124028256d6.21.1791727226035; Sun, 11 Oct 2026
 07:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com> <804e7c63-e762-4040-9d60-35d21df75531@lunn.ch>
In-Reply-To: <804e7c63-e762-4040-9d60-35d21df75531@lunn.ch>
From: James Clark <jjc@jclark.com>
Date: Sun, 11 Oct 2026 21:00:15 +0700
X-Gm-Features: AclHuK-esRNB8W7zs2qgx_OudsZ2V4R3VAw5wkSWWvbXvEsBPzNqouiauJwAFE0
Message-ID: <CANz3_Eacfj18qJdZc-WEdZVCFYA=4KgeMK3U=e99gfnSyz7=Vw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] net: mdio: add timestamped MDIO writes for
 PHY gettimex64
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Nicolai Buchwitz <nb@tipi-net.de>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:51=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> > For example, using PTP_SYS_OFFSET_EXTENDED on the Raspberry Pi CM5 to
> > synchronize the system clock from the BCM54210PE PHY PHC leads to the
> > system clock being 32 =E7=9B=9C ahead of the PHC. On the CM4, it is abo=
ut 7 =E7=9B=9C.
> > (The difference is because the MDIO clock frequency is higher on the
> > CM4: 10 MHz as opposed to 2.08 MHz on the CM5.)
>
> IEEE 802.3 says the clock should be 2.5Mhz. Does the CM4 use a
> clock-frequency DT property to enable this faster clock?

No. The CM4 DT doesn't set clock-frequency on the mdio node, so
unimac_mdio_clk_set() leaves MDIO_CFG as it finds it. On the CM4 that
is 0x91, which has 9 in the divider field. The driver's formula is MDC
=3D ref / (2 * (div + 1)), so with the 200 MHz GISB clock that gives 10
MHz.

James
