Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA52C390239;
	Tue, 22 Sep 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078917; cv=none; b=o2vtGP9OPLLe+AzzfaQriWHRSFdEPki53jacuut/V+w2QlGGBNPeXdqDjQ/1RXr64Q96Ou9pybTCVPGsEiP6KAxBTZfob5cLgPNz9P62RH1hrJ6cAWHTpN4comjf7pgyoAu7qHeB5LRCcV2TBmpI65BjWQ6o1BMseUOne4WGNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078917; c=relaxed/simple;
	bh=lxikLCey8JFwQElpr414yvj1dGFi++FR/DoNHZNBXA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giGmUjMaq4t+HuGhpni9sdlPunkGX1IZZtsFGOUMagzqP3Zq9Hm8nCfHA/Kz6LSWo5R/zP1T1LlUv4IpvG0rvy6HdEbLQOXCBbLW930DnwDFnuH/mgYzcbSn47CnNJhmvGm26yItRid1JHxzpdM20OWLim2nA2ycDtpo7vPN5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=6Zfhzkjs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="6Zfhzkjs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MG8xy5bcEMmbhnQisVz4MbMW6OJVIA+/9ZxpoK8P3P8=; b=6ZfhzkjsxabnIW+nrDuY0S5ueI
	StpgDejclSYGHaStg5BULQ84rmATpfGlYA0SV8XgA5CETGWOWaokPSIPzrFb99esCgHAbgx5NcCsF
	IQU3ycYMzdj99hWvHB9StG3AMz4KfrHi5AmaVPL47ot98CL6ahXor+7aTIT6dzahZpcM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8zIS-006a3f-M6; Tue, 22 Sep 2026 14:08:28 +0200
Date: Tue, 22 Sep 2026 14:08:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <1817c56f-bc79-4e64-94c3-4eb8cdb1f107@lunn.ch>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
 <20260921-send-dt-v2-3-fb6b81002ad7@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-send-dt-v2-3-fb6b81002ad7@studio.unibo.it>

On Mon, Sep 21, 2026 at 02:26:43AM +0200, Nicolo Giuliani via B4 Relay wrote:
> From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> 
> Add a device tree for the network processing unit (NPU) of the Sophos
> XGS 87/107 desktop firewalls. The appliance pairs an AMD x86 host with the
> NPU, a Marvell Armada CN9130 SoC with its own eMMC and SPI NOR flash that
> runs independently of the host and serves the front panel ports.
> 
> The eight RJ45 ports and the SFP cage are connected through a Marvell
> 88E6193X switch on the MDIO bus of the SoC, at address 2. Switch port 0
> is the CPU port, a 10GBASE-R link to the first mvpp2 port. Ports 1 to 8
> are the RJ45 ports, which use the internal PHYs of the switch, and
> port 9 is the SFP cage, connected over 1000BASE-X.
> 
> Describe the UART console, the eMMC, the SPI NOR flash that holds the boot
> loader and its environment (read-only), the SFP cage and the switch with
> its ports. The port LEDs, the PCIe link to the x86 host and the USB ports
> are not described.
> 
> The switch is reset through CP GPIO2 pin 17.
> 
> Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
> access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
> its eight user ports, and 936 Mbit/s through a front port. The SFP cage is
> untested.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
