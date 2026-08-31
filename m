Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531E3F39C8;
	Mon, 31 Aug 2026 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178394; cv=none; b=YdC9UduUpqcRLf/+qhczS5y2Z077Smp/KGaCrhyKzJbaInefMuMLyhs/ZICswtvhRn228jDB8ZjNHVbo+tYEIJOHaUj5OE4+pm18kCX0NGfZPFeDZQ8PHt72xuiaFQTsFnRtJHHZ10yCQtH8AvKqCS0O2VHfljVUsFvSepdVO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178394; c=relaxed/simple;
	bh=vqOjC3fWsVy+2Ro/BMSCffsVqfasg0sxqjTTsjgOm54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXNtg9vcJcymivf+8rALqt3L+DLpagQdnBQtQdZnHFWQJOY+rTUWpCUysioS6w/jkqu4t5wMbB7ixrkOkmvxf1/m0WxliXqj0pdkrSl4Uwfl3tGgjIfgxzW+8GuS2W51fI1sUsMxLeLTr5Aab7bfV3rXHmcoPmsc+Zzz3hbYN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZRFide8o; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZRFide8o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F5FZuqvEUAT2/PGcwzm4Qov9gm3yBMDweP9yb9iR+HU=; b=ZRFide8oJiPpu9hZmbIkYaN0+4
	4XtdFgm/EkgzNhTbt5eEEiWaD3+OifNF8lBC/8J/GpnGa+xucYWpnCdPUjyXBZdq4NwjIqUWIeNH5
	GW6b4s7GJcXVohYd4clgmE47LMQPpdA70XUiyjLed1CKfrRDOU5HcaAQHutx8i5wxhng=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x10se-002Acg-Kj; Mon, 31 Aug 2026 14:12:52 +0200
Date: Mon, 31 Aug 2026 14:12:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
 <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>

On Mon, Aug 31, 2026 at 06:43:46AM +0530, Prasanth wrote:
> Hi Andrew,
> 
> I do not currently have the PCB layout or trace-length information, so I cannot
> prove that the board provides the TX delay externally.
> 
> What I have validated on hardware is:
> 
> rgmii: fails, with RX CRC errors and no valid RX traffic
> rgmii-rxid: passes, 5000/5000 packets, 0% loss, no RX CRC errors
> rgmii-id: also passes with the same traffic test
> 
> This shows that the RTL8211F RX internal delay is required, but it does not
> establish where the TX delay is provided.
> 
> Given that I cannot provide PCB-level evidence for the TX delay, would you
> prefer that I use rgmii-id for the next revision?

There has been a number of threads about the Aspeed SoC. It typically
has delays enabled in its MAC, by the bootloader. The Linux MAC driver
does not disable this, nor does it mask the value passed to the
PHY. So you see many Aspeed .dts files incorrectly using 'rgmii'. Over
the last couple of years i have been pointing out this problem, but
nobody has stepped up to fix the issue. Most DT developers just leave
the Ethernet node out, in order to get something merged.

You case is interesting, because you are not suggesting 'rgmii'. So it
could be there is more going on.

If you look in the email archives you should find the information
about where to configure the delay in the hardware. You might want to
read it out to understand how the bootloader has configured the
hardware.

    Andrew
