Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487075;
	b=s6Oqv7xlS0OmN3AHG9CveWKVJJ48XNoAe/QUxEQumzKtNAlA+/mmHzHLvCnBP8Xxv+2L
	 gAktjbNU88BUA3/0bTZU1mqu6PAQEUvRpULCD9Z3XoILM+qvwHND63vpv/UYoMnKsodxA
	 fkAB+lgX/jCOGxCLNCBisB3Hs/gHG+g8Gfes+wur5YBMgGshWlEbYno95N8DDIRFO4ymh
	 1H99a3IBHO1nO0GcDqMQ2LzPmclL036OP4WTiQP0kKvYcUFhmuBYGKdGxblTwHhtOCQIV
	 bZMz+zEsF94pJlSwhy6CpQm2QYtHCNUEkbh7OLyRgsbN6ZgcmxezZ7fnKs8DwSzOVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XmlvlKzyuz+nX32TqdKKok7edyq/OZqgIr3dadDT77Q=;
	b=f9v1BBy8GSBv0acmqvf5Xze+BVZQuRx1GOTMVS+uuGZ2Gcst1QoiEwv1g87vFF+YWeON
	 1ZQjQU29TgSHzNtZFa9oGv6V2VOGDyyjBX7jREgABvT+LdjpYPat/VGsA+Od2EFOeNmCe
	 Fdzr2UWNe+heZqv0xf07/QOZggmxKU9rNZ/UDFQyleL7FVSjdd2rnp3U1NE+nBN1QaSMW
	 TN4QzIjwH5AUWIf5nec6nHk58GZEE8q4h/Fhhyx+daZKRpxYEO+BUDq41C1kZEpaURFOm
	 BDXlzBdK5w+Wavd5sHRGQZH0K5H4YyYBMbezvi8JBen5D+VNm1zavzy8BLoJLkjqLFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Z6erjAjM;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF40606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF40606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Z6erjAjM
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2287488f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792487071; x=1793091871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XmlvlKzyuz+nX32TqdKKok7edyq/OZqgIr3dadDT77Q=;
        b=Z6erjAjM7sr5bu7Soxe/kLzTAztHvepqvKoRW4VcEAJVwNHubceJIoI+1FyNVRElAv
         19SkyoTvhriHvJ2QOGqbotwRjRMmnLtJS9mCY7CT9S4tLGuhO5HghvVXIpIt9LcE1F5j
         fNXJKmytHcr/3rYluDQA8Z+ySsS/cQTZ1iv9tP8SnbgapM7lM69ulxwbfZsJ/mgyNp/7
         DibwqF0Pwv753NIah+oQzd/W68ghJkEO9nc07LNOVudWz2L3ubjgYjnA6NUJ6O4O6him
         9MSdVT5l6+bmI4+HF13aZiP+tSmGVazeADwDxzadI+QYTZ7G+jrwxqMAMy3mk7SHVT0t
         58OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487071; x=1793091871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmlvlKzyuz+nX32TqdKKok7edyq/OZqgIr3dadDT77Q=;
        b=Man6pn/YDnswRshv63oU3YU785O3Ptmw1o9ecSqqwBLYh6yfWkvjHK8Voy1fWf+n/w
         DPgTENHZ3nfoPsfGtnoryMGkmCkSuVt8YLhPedOMGyEo3t8LOH38gQtE5RzPX8bzHX2J
         9whQ6bfQGA+iHA1G0szkF3dT/WVtEZq3YxWhspYpEWK1/pPxAwAPKIxAZbJhzc7qbiLi
         NzaRXcsGrLFDVrAmTxZLSbjJBGBisoaquAMFYnSZOwknUHVUWQ5lTJYjxS5q34ibB5P6
         HlopmL802zQ2H674nw+QJ8DyOTgz+d4ITHEcisCFeidgmUkXhg34vPXz4MSJ8xHgp2Pf
         HQYw==
X-Forwarded-Encrypted: i=1; AKwUvByKms7yUWUTwkMnpGqXqDJFmjwpZYTLR+bcvyEwdHlXGQN1YycrNt1uoiNeRi0rczC8f7WnlV3u+Sg9sFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIInCbiyME2fH7mLwU32y2UFbjH8c001VelN5CjK0BizmSRabVY
	35AW4NnUnEZtzj50KkXlYhifnkXTE10IdsFWNFBRUCKVWp5Qd85Lg2TTPIW7E9kU/EY=
X-Gm-Gg: AYBFou0nCwBODhQa7dkIYbvrVdwztezG7b8TTPGUGwxvN9xi3MGxMi+nXtETB6KUkdW
	vnZhXtP4FPanqQXVaRyrwDNASF9oIO3Wt4ey76MbJTDsKpW34NLcYFuwWKygzvKcs74Kox9Q/Ek
	hWTlgw+lEZ2p0yqnD9xGdHxztXGrBqz1dYfP8kz5VtmEbmS4j1773ttDKw5uszOP6r1jH0NqxJu
	IItvaV1DAju/LSH+bNeXev89pv3KeO8aEGPEKjDyyB2fEvY/HqBnCbnr8IMbIS6174zNYgdz/rW
	mmysQGNNYZGQD29wgTaA6Nyqz9III3LBvQGP2vWjP6DMs65waRlx3SNYCFSAAOYDsFbc2jifKyl
	bZOGwMj+cayoo12BCaz6SBP1pVCLpnMyLsQ+arL1CTK6Tz7YUyPPN1Hv4E071mx61ibv3+UePjL
	b3dsz4vjU+kY5BK96Z7JpRqf/0gOGzGTGMtpOwJ0TrUwVjDA3Ua0LWLhi9bRQIHCEwggF8C7r/4
	FC9hqf02+hW4beyVAjquNt6yvMZHQpp94dX/V3AXQtterU8y7o7+TnLVOQJ6XiInuMLgYK1Z1K6
	vZND37XBcUetxF0S8Np1gpD+j95IfSylZLODxKnpLeSydI3l2oSrC/Ro31g=
X-Received: by 2002:a05:6000:298e:10b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48e07988ae1mr14257954f8f.1.1792487070519;
        Tue, 20 Oct 2026 02:04:30 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82ff70sm4689162f8f.52.2026.10.20.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:04:27 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	tglx@kernel.org, radu@rendec.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
Message-ID: <atcum0O14QFfwtwB@aspen.lan>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
 <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
 <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>
 <20261014-getting-bronze-d8ab7598d9ee@spud>
 <af5ce6ac-244c-4fc4-bbc1-8875eec8508a@riscstar.com>
 <20261019-darkroom-endowment-43ef047fc24e@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-darkroom-endowment-43ef047fc24e@spud>

On Mon, Oct 19, 2026 at 08:49:40PM +0100, Conor Dooley wrote:
> On Wed, Oct 14, 2026 at 11:57:08AM -0500, Alex Elder wrote:
> > On 10/14/26 11:41 AM, Conor Dooley wrote:
> > > On Wed, Oct 14, 2026 at 09:55:03AM -0500, Alex Elder wrote:
> > > > On 10/14/26 5:22 AM, Krzysztof Kozlowski wrote:
> > > > > > I still do not understand why do we need to describe the inner wirings
> > > > > > of the tc9564 device. So far I found no posting of DTS showing proper
> > > > > > usage of it on the host. Without proper usage, what is the point exactly
> > > > > > to describe the inner specifics of tc9564?
> > > > > And as shown here:
> > > > > https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar.com/
> > > > >
> > > > > there is no single user of any of this (this=reset, clock, irqchip
> > > > > probably and more) in upstreamed patches.
> > > > >
> > > > > I am getting tired to keep discussing it, so next time instead of words,
> > > > > please post CODE which is the argument - who uses any of these devices
> > > > > you keep adding.
> > > >
> > > > I'll take a break from my in-order responses to messages, and will
> > > > respond to this first.
> > >
> > > Not really replying to any of this, but figured it was worth
> > > mentioning that I am reviewing with the assumption that it's similar
> > > to the microchip lan9xxx devices that can either be a standalone SoC
> > > or connected as PCI endpoint.
> >
> > Yes, that was one of two things that this was modeled upon.
> >
> > The other is the Raspberry Pi RP1, which is probably a more
> > similar example.
> >
> > > You keep calling it an SoC, which I took to mean that this had
> > > linux-capable CPU cores on it. Is that not actually the case?
> >
> > Well it is an SoC, in that it has numerous interacting
> > components that are aggregated into a single chip.
>
> If that's it, I wouldn't really call this an SoC, you're just going to
> confuse people (like me!) into thinking that this device can work
> standalone...
>
> > It does, in fact, have an embedded CPU that uses SRAM, but
> > it's just an Arm Cortex M3 and is not Linux capable.
>
> ...but maybe it can, depending on whether the devices being discussed
> appear in the address space of the M3 or if the M3 is just some sort of
> monitor CPU running firmware and bringing the device out of reset.

FWIW I'm believe you *could* build a standalone system using the
Cortex-M3. It has direct access to all the peripherals that we are
describing using devicetree. However the C-M3 has very little RAM
so the list of plausible fully-standalone systems is very short!

More likely would be a system design that gives the microcontroller
ownership of just a few of the peripherals and is partially
independent of the host. If that firmware was running a DT-centric OS
such as Zephyr there might be binding reuse in that case.

I should be clear that this is entirely speculative at this point. We
don't have such a firmware (we currently don't use any firmware at all).


Daniel.
