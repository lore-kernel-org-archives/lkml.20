Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841602;
	b=jejx8QJ3Qx5Ybm8UDI0tyhwswvl5MWSqQokEOu1yus+JZ/V94LqtmHYY5t4wWlUmMCAI
	 21au9P1zMYoOHZSm/yKzETktl8cY4A7PH53UVFi2DHZzjXZDcDvfWGgaaiUvxFUBf40lW
	 3tSECsdf9D0WAWOiAsdch80mY1b+7wpmdHJTq+YAXlzF+XeAST92+331bRJp0n8ERwImE
	 +BrLZhommxjarddfAr2FkV6CkWq6QgaQQHIX1vTZLXShI0KJBiUHH6GxyJ+7M5IyD6hdO
	 NKRIIW5zRETHp2izk5464jxT9eQQnKjMbS5Y4hqUNvGHfYQgoKFyL0qBBAApADF0u5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841602;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PcrkZrIiBXHxrgXY/IdmAR4Eo2KV+jR7a2aL3fB5faE=;
	b=BVrHgMkQxFHy1L99dAto2UNwdwGpVKJHQGwlrMf8Ki8tZ1EdGSenbTUdFwUFRpbGGh4t
	 TiQ+paqfSMNskvFEUzAb/n4po1o0WOQoH9ex6YVGjc6ueYbWSF4pfBxwCjY+Rw3GULTpP
	 gSk57T8S8a5bPTxdVwowXoA+Hh9ESkSCYOBGewVRSW2Ki2yg7ooZnmgCAsl7l06okQnoM
	 5U+Dl73kU4n4JxOySHoW2eLN7Sd8qd6ziJqvpbzZRJrVJUtN9GbJkZ9rqKsZRzVzci4+t
	 TQK2gQrT+mBWR3HySs9m4dXtnu27Xj/b8HiaGN3aR1Au1DJUWFOTgkwGAqSEfrbE7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ZRvd1OQ2;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754DF606A31C;
	Mon, 16 Nov 2026 15:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ZRvd1OQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PcrkZrIiBXHxrgXY/IdmAR4Eo2KV+jR7a2aL3fB5faE=; b=ZRvd1OQ2dIKEtcE9W7VWS/zCgW
	WEbntPHrnnXHvvbSJHIRA0ymOuIloYJXtRh/JIVWhFT3uA68TKL3rInhRhN3ZfJRz3x9QVF52NsFO
	nTmu4+n67qv+Di4GFsOIHmBQ1XDONzzPHaYT2s6d6mkrCJ32+TLOM27KZnsrFLLkniNY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSyHp-00GwqG-RY; Mon, 16 Nov 2026 16:06:25 +0100
Date: Mon, 16 Nov 2026 16:06:25 +0100
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
Message-ID: <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
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
In-Reply-To: <20261116135442.4827-2-jszhang@kernel.org>

On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> Assume we have the following implementation:
>           ----------
>           |mmio reg|
> 	  ----------
>              |
>  --------    |      -------
>  | MAC0 |--MDIO-----| PHY |
>  -------- |     |   -------
>           |     |
>  -------- |     |   -------
>  | MAC1 |--     ----| PHY |
>  --------           -------
> 
> Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> a single set of clock and data lines, which go to some PHYs. While
> there's a mmio reg to control which MAC mdio master can operate
> the single mdio clock and data lines, so only one MAC can operate
> the mdio clock and data lines.

How does this differ from pinmux?

    Andrew
