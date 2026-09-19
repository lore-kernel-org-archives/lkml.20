Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5738424C;
	Sat, 19 Sep 2026 22:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856607; cv=none; b=LxZxjUsqosdXw07+8bptvqVK1EnB9NaE7cTQtnESltqk0lKENPldd6xRWAMrPd7jl/urWy1e5zNxaOHOY9FKlxF+q9x3oWH1IwnRvW60N/AeUZRyU3g+pfPcimNVJwbrzNXfOP+96yGwF7ZreBiU10/1t8JSegOIAjFgtp8d/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856607; c=relaxed/simple;
	bh=CYm3bn/G5CpHxowBhxlW6qnGcwW3HcH/BkAvjjtC3KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUCsHqNC8YAsxv7fOA6AKu7vOg0oSqs3gJQQNwsUwvs1JcjP2tIOdhqspfWaVo5fL/42Y5YWSK0q4Cucfaq9mMuEXGbhVreHHjGYVrWoPcZCwFju14EuVV9Um/YX7Ehv21EsQHTUiS9bQ2JXb9oqztmXwrOJYcO1Mey9Roqg/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JO7uCzMx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JO7uCzMx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=arYgjoTvtYvhRB29W6paCuPe7hqmom9kFaLIHBHqv2A=; b=JO7uCzMxsydPkVLkbgcnKZFjMj
	XAJHq1dQXW2QiII1JYziYfM5VVRJ3GEkKavpHODazyctZrruCe47AeCAOSRkwArylp+dQIZYtN0nb
	lNLJKIDwSkUg4ysOjyV+IWhPJVBYosObU9eu7rwgiFQS4Avla6qugnhavyXloTI1WwJw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x83Sg-0064Ku-7H; Sun, 20 Sep 2026 00:23:10 +0200
Date: Sun, 20 Sep 2026 00:23:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>

> The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> seconds after a reset before it can be used, much longer than the driver
> waits, so the probe would time out.

The obvious question is, why is your 88E6193X special?

I've seen issues when there is an EEPROM attached and it has a lot of
content to setup the switch. But that goes against using DSA, where
you want Linux to control the switch, not a fixed configuration.

> +&cp0_i2c0 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	/* Drives the port speed LEDs, which are not described yet */
> +	gpio@20 {

Which port?

> +&cp0_i2c1 {
> +	/* SFP EEPROM (0x50/0x51) */

The addresses are not that simple. When a copper module is inserted,
other addresses are used. The SFP driver assumes it has access to all
addresses on the bus.


  Andrew
