Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20F3603D8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608125; cv=pass; b=Tp9yrAWJXbyAdOAc1c+cu39NU/Ya6b8QnEPizwfpaNDxI+aFV6SJ1CYuvSB/4IzDR91HdnDXDRAdpUCYssOnn1YUj1Z00Ld7v9IzQTHPzK/o+AztudZCe0l9s5OdX4iNxMyR9KEsAgAak80bao2eaYAQ4e9WS6i9Eb8XVozlVvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608125; c=relaxed/simple;
	bh=WREEaBO3wyuO0PkwVpYRwppAg95V9MsB8RMw+210RtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gh4tQDFpOuJ2ZRZG37os5gSrRK6wisMnql6zMaGVyGWLzZKGeanMfJI3bPi+itVaZR8f/4FrUzuQoCAit6LQn3P8UkwY3T1Y3o473VuJGurxXw5LRE2JVR+beTt6QXaMkeGFqImDC9HNyJNm8WDadBHDHyrblDuki3RT4K6vxKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=TIGcEqlY; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="TIGcEqlY"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9179dd18658so6462926d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791608122; cv=none;
        d=google.com; s=arc-20260327;
        b=mJs4SvtdxSVRiPEke1OsFDaRO2eMFzZBuoSkGHjUp1cdTYYzwGaqv4Ix6ik08ovxcW
         XafYQ+NHS6e/7xyAT+7PFx7h8ZlEXBqfyPIfijrLFI78BQN7wrWUzeeSlPRAhUXNlWkD
         33vOJavG+6QQJTQ4v0IUeM21eaeRzfcy9UBcTBnR5krVXXKlJ5DFMcIhjnKABv7ws42X
         mi3EvUTMQL2i2CZbTgjOuKzEGkqomN6HARdCchTfFD7KL8yCK/rHCTrchyA1hGi/cTtn
         Fam1wvrXkfVLC5/N2hjTukQHMfsHSj2JlYdKz1zDigkAB0ybpv/w9QBh8yRdCX16LRs4
         EWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDnyXEwh0IPh3IBNd6Tys59aT8lq3I7fvJJG+sKA6io=;
        fh=0v5KNfe10QOdoBnSkTuLP/DIeJuFXj6goRcfOZurvUw=;
        b=esX21Y6YnXjzc1UEB9s1c4Pa0z+JtPneK00BwNbzsaB0ltTPfMw2kM+yy3FR9nDobL
         t/U4HbUPsSgH4YHFyP3vYytO1XYFkA+USNgJ1QAC3Pk9EqUka0ml7EP4PuJ3brTZoEMU
         /ZWQYpcB68qSpwZNG6X20vriM0JQWYKedqYbdsif0lY/oPd9ehjjKK0ICDxOjRb7b6Ww
         hHq3eq24HZCOxZsUCjkVxrG0dBmO2xEaCF5BcJ1z0+UmBwyJGsZeIjtwHVCW0bGSiNQ5
         NXne+pWcAQlEYETZ54hGzjpmtfW71uNz6mk5ij0hS+9XCpYrR5aNGTyDVAwYOTD0cEKk
         q1WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791608122; x=1792212922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDnyXEwh0IPh3IBNd6Tys59aT8lq3I7fvJJG+sKA6io=;
        b=TIGcEqlYRBMz35qZyoQrAXMxTklE3YE8eLBrbYPqDjfV1qAPthG1XgXSq+zY1u3/wr
         VCVdVQRnfB87706UnWyaftxFGhNYvTqSFjGXpNi4bH+1ZuQlFOCs+i1F1+FD4b7zlrhw
         mzRC6kw86vhODAkWbfx9Stbtgb8ZhsYbDiV99gkY7eY6K7FghBTxuWtf/JulMF14BtWg
         x4JERqw2nJmDRSyuULDRNUg0p9s0dBOzRWkPrj0Fyzwp1fKP6vNlrIQs0VrScsu5H3xA
         DSbNtloxaLT0HaQoigk0RG9n7+EQ5MC/TxJ1fc4y+apuHR/hXyySaLWwjKf6GjUF33iH
         Lyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608122; x=1792212922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDnyXEwh0IPh3IBNd6Tys59aT8lq3I7fvJJG+sKA6io=;
        b=jCQtHQYj3h0yxnHsIcevVkdoVverWaj6OcSMUpqcC3+l+9q3WrxwPgm7ZERtguook9
         LP6LBSezXktKol1SQPPsfUomrITgCN0glTn5Imz/8uPjtMf4DHYhvRKRLx9BBW0AKwm1
         pApVLLeOJYXVMdQPz1WH8TOTQ/jGnmdvWGUWr9lNy4RM7PdEMRbIcrWGGIBKQGKbpFrc
         baOxUbx1Fvc5qjzOX4ylfJoTlgS9sRdpti9LNk/I0njXXw1pTSus/fVZL96N4dubH8uP
         wrjkgz//vYoxQ+cCR2TCRSwsUGjF8r1uLZ0EJWd9Wc+tLB9UTRWEGpP4sPwe9V1DKFlU
         LjQw==
X-Forwarded-Encrypted: i=1; AKwUvBww3X5Jv6TOEsLNyT3WD+KwSrrWraXxVa86Z+c9wz0lBTgpWukA/NT6TGFPonS15uSzLusO7kcQedfXy34=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmkqs9dx+PFrCPubOHc2CWuKGc9YUdlJ69f6VYoOZsU/ju5ADg
	rb0S4ZyF82JRyI9qIX5h0hWxv4U3mkmKI0+RDuCKw3OPxUj45kNt1xZkMM26Ob/nF5kVB3iLb9R
	ii9iH5gZRJ+Dsp+20NUiwpxvhKDgTJuQS9LOrA45o
X-Gm-Gg: AYBFou2E2fXcz/Pg40BktYWQh1qLi18lg3JyWzdrj4eZot0T1ik5tUlR3nzKxr3jsRl
	CvFXLF3dhG2/HGpDr/KRi7Up1MVEYlGPpq84D83MP1VJBnnCUEX55jODnP5gA9T9F8mktW/BfUv
	G9Y7koiPvr+jzMqVF7+Vk4v2dkxpycSMKBL4AWZSibWNeQtzy+1Y6PLo3YEOaKvbv7Libj25Hxi
	sQm3z/mqYVvyQkFz0W/GpIPpHCM/Degg+DTpHhKC9+LtQeFYFSvcxAhxljwh5+/jn2Z1bbnQzVm
	eCOPqiLHdUWu7lXVyGXJIr2djShiBWy/FBjJurKpDAxxIDS7xEmKACk=
X-Received: by 2002:a05:6214:4892:b0:91b:5d3a:4fc8 with SMTP id
 6a1803df08f44-91b5d3a54f6mr48923646d6.53.1791608122459; Fri, 09 Oct 2026
 21:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com>
In-Reply-To: <20261009143506.2507607-1-jjc@jclark.com>
From: James Clark <jjc@jclark.com>
Date: Sat, 10 Oct 2026 11:55:11 +0700
X-Gm-Features: AclHuK92W5KEhXwmOMjG-I1AS-dLGfSZLwWpXYD9HwLtHLi9Ykczkj9wj7-sDHw
Message-ID: <CANz3_EazbYUY8-RqSAcdESmriFgt-xJFQjj=bEnjW6iBp5DoRA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] net: mdio: add timestamped MDIO writes for
 PHY gettimex64
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Nicolai Buchwitz <nb@tipi-net.de>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, h.feurstein@gmail.com, olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:35=E2=80=AFPM James Clark <jjc@jclark.com> wrote:

>  Some PHYs have a PTP hardware clock (PHC) that is
> read over MDIO and sometimes multiple MDIO transfers are needed to read
> the clock.
...
> This series introduces a new MDIO operation that allows PHY drivers to
> ask MDIO bus drivers to compute a bracket for the completion of an MDIO
> write transfer.

I have just become aware of an earlier discussion of a similar
problem, in 2019, about the PHC of mv88e6xxx switches:

https://lore.kernel.org/all/20190805082642.12873-1-hubert.feurstein@vahle.a=
t/

In the relevant respects the situation is the same as with the BCM
PHY: the PHC is read over MDIO with several transfers, and one write
fixes the moment at which the clock is sampled. Richard and Andrew
suggested taking the system timestamps in the MDIO bus driver, around
that write, and Hubert Feurstein posted a series implementing this:

v1: https://lore.kernel.org/r/20190816163157.25314-1-h.feurstein@gmail.com
v2: https://lore.kernel.org/r/20190819172827.9550-1-hubert.feurstein@vahle.=
at
v3: https://lore.kernel.org/r/20190820084833.6019-1-hubert.feurstein@vahle.=
at

Like Hubert's v2 and v3, this series shifts the timestamps to allow
for the time the transfer takes. The discussion of that raised some
points, two of which this series already addresses. First, the meaning
of the timestamps returned by the MDIO core operation is clear: they
bound the end of the MDIO write transfer. Second, the bus driver uses
a lower and an upper bound on the transfer time, including the
preamble, which have been measured on hardware. The lower and upper
timestamps taken around the start of the transfer are shifted
separately, so that the returned bounds are guaranteed to contain the
end of the transfer.

The third point is the delay between the end of the transfer and the
device acting on the write, which I raised in the notes to patch 2. I
am making end-to-end measurements to establish a bound for this delay,
and I plan that in v2, in the absence of definitive data from
Broadcom, the PHY driver will shift post_ts by that bound.

This series also differs in having a write_sts operation, rather than
an sts pointer in struct mii_bus. This allows the bus driver to
compute the transfer time bounds at each call, from the same divider
and clock rate that it uses to set the MDC speed. Unlike Andrew's
suggestion, there is no fallback in the core, because a bus driver's
write may return before the transfer has completed.

The earlier discussion also raised interrupts arriving between the
timestamps and the write, and the latency of the posted write. In this
series, the bus drivers take the timestamps with local interrupts
disabled, and flush the posted write before taking the upper
timestamp.

James
