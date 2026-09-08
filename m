Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7C4772A6;
	Tue,  8 Sep 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856458; cv=none; b=Ct5oS/s3dDVBiRK/Tf0mwWfxWBQR4b2CEII+PgIVPJDMrtsDHAfTLmzS20ailw+DcnNsk8PuF4mXT6yItFQWVt1VqQcCvyrMkY/qC6i2skN2GE6JJ7U+4id9fz7PFYXhXwVx3vg7cXzQMsc5nLLnIwGDoR/WYz4VNr768YGgCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856458; c=relaxed/simple;
	bh=MTYRwzIeFMh3bWmr0nxzz6nSDg+FFp1duWAuZGhrrsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEH85dHbrNnKvCXUNOjUZrGy0ry4Yrgl1/1mIGgz6TdpvlAuKIIQ3jtD/gluUWBsFC28exDSDqkHTqAoEcfmG2jKzOQ1sdlUFTTmwVEMbSYr26hJjY3eS9QtRBQTJ16X+9IMjPWtjLEOmGhYl1L/0ZIGDacPd5uxeFr5WaBeqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ETVY4yhq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t99o+0I8; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ETVY4yhq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t99o+0I8"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1E1F01400091;
	Tue,  8 Sep 2026 04:34:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 04:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1788856454; x=1788942854; bh=s9qYyu4B8z
	L2inOcDy7y8XxRjYDGVeJX+azMjQN6uUI=; b=ETVY4yhqljIBPbzgoyBBMggOaq
	P12nc6iLAJqaIwDS6UF5jh0fXDoStLVlSSKUl5iN2oIX+SeLN6ZpapSsHmm5d84D
	iwskfVXD8GY4zCwryx+LFZ/Exo3HSIkJgISs2vX0TnLZSpNS5pYeDMZhrL7onkwn
	Cqzt2PrSiO0Q+3JjdCsbKXRC+IsgGtc/m0zlC2ZlZ9Rj0sz47KhWODavY+JGJgEd
	4rLHNwGe5acGGuZtVTb020LFK/b7vcjXrRnkiZCFzjfauA4i9qvWutPkcmuTsJU4
	pwM/RODhA1pQN9m6dLelaLf9559tGfoklGXMN8zMSM48l6gDmxIEwvJyzmLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788856454; x=1788942854; bh=s9qYyu4B8zL2inOcDy7y8XxRjYDGVeJX+az
	MjQN6uUI=; b=t99o+0I8BALTeY1NtVnrsUd66xqYd0xcoLU5RMMWRIeh1vWeD8Z
	O7Q6nLbH+dlxTkW2bds8rqpNK3oZg9+IhHg5R/DJ7wBg9mSuu9+lPNhX2u2hRVQm
	UGysg4uEMzug/6svFrLgyTuH3V+RxzwA29bxCgo3ZAGMK3QQunVrJ2DNAnWAO5UJ
	4AFE14SjiWfrEWFy5nglFP7AZx+Isef9RC4h3qO2BloNkmBUD2ASNctwfPRJHJRs
	Orknp0AnhfsmT+lt0OrfXgPgFiVEQZQC6kPPvn8pO6H8BOZKikKuJm2GYiektQKq
	0PdYC0lnvpz/auO6mFJQfdNhmCo2e8yRB6A==
X-ME-Sender: <xms:hcifahmxS4aG3CgVokBF3hh51G_3XQA1IYfX9JgD-9zHZNBKr1aW8A>
    <xme:hcifam7oTLmLeVg5qNfBhVkf0k94aY70cmwZ6JfN-TjHateYN6Wx0vdDpLYbmxMLh
    _cSNTToQ1XFyvg1kfFbV1q_1aKT1dLIu5R0V-KHoMzAN4_K7N4EqyQ>
X-ME-Received: <xmr:hcifaskWpLUN7JXE97QWUr1WBsmWT3mPO_fJZd2f4DInHmZOsWUZJYK5FrbBGD0MmuHY0OWv31eE7OOkk5UrOwwEO31qGj_Jhsc>
X-ME-Proxy-Cause: dmFkZTEJWvfoSZaWVEoP5Nwu0msHDNbn6E/kt5/jlAK/rOXQkSLDlD4Ac9c0422oqf/8iV
    vY/VITN743tUEXL8pvjOlSA5WTdi1AQYkNc0jvyjNkXeS4QJHlgAHDLY8bHyccrzYyMpmo
    RMAS1/5JJfc7xYrXJLTe6h6lrP/G+dbNs2ClY7VuT0LbFXa/1DMlM+Zb51JH/yoEo1mqp4
    hHUnSB9Ydz8TQTrCNH+20KgcuEVdl6FvPd/H/Tvtn3RT4ofWuOZfvGA3e10sZG3qcuDMNA
    +AMR2AoyLvUhUUBmeD2UaoJGBGiXPSlkGEJZlVudsxXLQ56fdY3qFf9ShY4hLHfYp48aQC
    5yHmta1jRJk7ZH1rUKYpyaltaq2RUsIpdnxXPoRcwx0Q2uRmJz5sUu8dOEhpb/VBpw4MNb
    /s2Q9kZpyUBR0Wd+7/AIr6h90qMNoNHRSXOqY8IlZk8L127ajcbW/dZDuDvlu4yhVfNGXG
    8Tr4xE+9QmFO6vce7V2XUb+M4EA5NxLc5XxDn+paCFoYjVRg0ocVO21rhUOF/s1FeUQMbd
    j6MfJrcJbPDMSgYiaBTY+zdwJuMb5QxBjGECg22ywFFoCc/ZU8s2aH7Ay/JcEODhtTepwF
    cF86hVyeHHapVpBGhigEtLo04K9s2cO8Zf0GnS97Qmle2TVogWj1jl/Do/JA
X-ME-Proxy: <xmx:hcifapUskIwT-yVC2xqpuU3htqVzI9VYvBtROOpTo8AIc3XdazktXg>
    <xmx:hcifatTMkk7bYGtqJ0hzM1hjTSkPp2YdZjqK9ZtpsxHJWog4u-wgMg>
    <xmx:hcifauD7bsscK6mKiVcyxXvO4PGdnTs7O6I7W-qLT0JaYgryACYb1g>
    <xmx:hcifatvFjPfCbNBNZha1zuS5685_PYc6D__GQzmwVxZavbzt1Ez5Kg>
    <xmx:hsifarI-mZ8j6MFU8NKtZAokfw44JdITGWwje-JckDsgsW_hOp7e_5Qu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 04:34:13 -0400 (EDT)
Date: Tue, 8 Sep 2026 10:34:11 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Message-ID: <20260908083411.GC2760037@robin.jannau.net>
References: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>

On Fri, Aug 21, 2026 at 05:44:53PM +0200, Sven Peter wrote:
> Hi,
> 
> The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
> reset inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 and t8112 each port comes with a
> dedicated register page while t600x and t602x use a single register
> with one request bit per port shared by all ports of a die in the
> middle of the PMGR MMIO region.
> 
> The first patch adds the dt-binding, the second one the driver and the
> last one the device tree nodes for all SoCs. This will be used by the
> upcoming USB4/Thunderbolt series to start the host routers before
> booting their co-processors.
> 
> Best,
> 
> Sven
> 
> ---
> Changes in v2:
> - dt-bindings: move the t600x example with the PMGR sub-node over to the
>   PMGR binding itself where it can use the correct number of address
>   cells such that the unit address matches reg again (Conor)
> - bail out of probe when no match data is available (Joshua, sashiko)
> - explain why neither a read-modify-write nor a delay before polling
>   is required for the shared t600x register (sashiko)
> - fix a copy/paste error for the M2 MMIO region in the dts change
> - Link to v1: https://patch.msgid.link/20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org
> 
> To: Sven Peter <sven@kernel.org>
> To: Janne Grunau <j@jannau.net>
> To: Neal Gompa <neal@gompa.dev>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Joshua Peisach <jpeisach@ubuntu.com>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Sven Peter (3):
>       dt-bindings: reset: Add Apple SoC CIO reset
>       reset: Add Apple SoC CIO reset driver
>       arm64: dts: apple: Add CIO reset controllers
> 
>  .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |  12 ++
>  .../bindings/reset/apple,t8103-cio-reset.yaml      |  61 +++++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
>  drivers/reset/Kconfig                              |  10 ++
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-apple-cio.c                    | 200 +++++++++++++++++++++
>  10 files changed, 312 insertions(+), 2 deletions(-)

whole series

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
