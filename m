Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921869;
	b=VG7rOcPpSdrTDlwbBQvMjf/X1JMw7HExC8JV33VwdUdnQcawOcJrFlgbgI25hf6+azJg
	 lI1FwW/Z2qUQmaxH8jqGch2H1D84UtxNbarwfUwuz0rzG7LXNRwUkC2LXq8q0eN9AFLRJ
	 Pfq1htiCO7feHQNFpalTX37/18CoKlWrOED1GSV1urQ9zdH6F1aVRhdGWcRsDdaR8fqih
	 k3tbwiFMuY3SNpeDIN4DSMX8uDotVopiKF6+up4mhCxOW2KM6YrwsVsrqH3mCOHQ6stUw
	 DJ+eL2cX+VjYLdxmx/hYSutrKcB73aJpkTVL4QskuqjDruhmVDjPhkZVkinJqSRMYMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921869;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8VzTZhhpuj7dCBfLSfLDkkRJWWhBg0bTERm45L+Zsa0=;
	b=jD0XY+ymD91Exnr/Ea5Q5zUBnmRz8mbWLNfbqtbfoUsMSwgAMPEQSNSaFBfH7asxUtgx
	 OBcypBrAyTQ3W/yDBITw0RUVWAcgFZgedNfwB1SOL6FXpc76kPxh5bLe9HCxzXAW7H//W
	 OSI72DlzQClZxre36gRIeEU/T6iyXFd4uJif5eMF988ZOQEAZ3H5YU1sIYlGyYPFr2MqZ
	 dSs5ZQ05WchNoupkNXQmePui7x0KfJvyZ202bujLyypWrFvPs19yJogdokCscB0qWUejV
	 sl1DWrLYldKUB7SBJhtadtft1NtB0fCaUGGXZwjC59UcG4r/2cAZkO+hOSMKSH+H8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0YPkGJbx;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C83606A31C;
	Tue, 17 Nov 2026 13:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0YPkGJbx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8VzTZhhpuj7dCBfLSfLDkkRJWWhBg0bTERm45L+Zsa0=; b=0YPkGJbxP7pVYdOvqSdmkAfrGr
	5vgCglO7ERT0ltXGaz4AzJzb2KZb8hOhnugvFjv5+4q957CzP1rYz2/y4hZ+pJz3KTgMhROEcTjzO
	EeaSjMh31G1YcEh+jeriKWEJFyldTNSc0xisP908w+UfKoAcfPc0GIctN9RuuC5cE+V0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJAW-00H9pL-IK; Tue, 17 Nov 2026 14:24:16 +0100
Date: Tue, 17 Nov 2026 14:24:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: net: Add MDIO demultiplexer
Message-ID: <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
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
In-Reply-To: <avvgy_bmRSVApCHA@xhacker>

On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > Assume we have the following implementation:
> > >           ----------
> > >           |mmio reg|
> > > 	  ----------
> > >              |
> > >  --------    |      -------
> > >  | MAC0 |--MDIO-----| PHY |
> > >  -------- |     |   -------
> > >           |     |
> > >  -------- |     |   -------
> > >  | MAC1 |--     ----| PHY |
> > >  --------           -------
> > > 
> > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > a single set of clock and data lines, which go to some PHYs. While
> > > there's a mmio reg to control which MAC mdio master can operate
> > > the single mdio clock and data lines, so only one MAC can operate
> > > the mdio clock and data lines.
> > 
> > How does this differ from pinmux?
> > 
> 
> in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> pins.

That does not answer my question. How is this different to pinmux?

    Andrew

---
pw-bot: cr
