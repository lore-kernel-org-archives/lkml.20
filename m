Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254111;
	b=sM2QFoC2uAETeuNeLzvlKfoQlpSloahEzfT2eSnL50YNA0U+/1rUvDcCfNCiFCRDCDN6
	 tJf7dZ6HUu2zMa8FlCHLhaVtf9CBBfPDoHDWMZRLcTW5S/Bw8G5FoN6biteCa6QnN2UbB
	 ogcy7gL0WivBRIke1wmebq0xicQCbn5Cn1mmGn0RhjKe2vsrGBUNdhZ6XXNixGZA6AuTj
	 jueAegJSrEuAgqSEo1k5qKUK8RNiG81L66Mgfrrxro+Ph+aOGYsXbso75pq7al0yBF2YD
	 4mXDU50B/ZqlVXusDBa8jajKQz6/ex6d2Gic43Rqqcof6P1gIxfDAnkJOd4gPi2PHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254111;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BYHIJBcBzX4woTKDxJ+AvoVlmuTug2Ro1Y2L1Yciwrw=;
	b=PIzu9fsw0sHM9zVmV3MBPlru0W9X5C2+kwLCJ+O94NGHPIvvY6NZvE4VAgHFdafdMuTN
	 j8aZvelP0zbOo3MeFiekYyFlnImwTRf5dirlaRwAdOkLhhwdtxKrkJhGZmekF6vN2HCYy
	 Gp0wVI0K8NRpujQrVz9QY/+OmmnRSV0YbfiVWgCuFJZvRzvgkEloVYUHu4AtLC7Y3JrRZ
	 +Z7Hb6YhA3cZlhzFUaUSGkYEEEuWNerEGfuN1JVFwX35faAk/Og2l9LLkbuPGbHoW6q91
	 9rdrDw0Rxzl8v0rVn2medY2WYQ4f/5bv/ItUtEe5EhiKecF8bk+NxI2EH+bqzBKM2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=B4raoCQN;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B3606A33E;
	Mon,  9 Nov 2026 19:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65B3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=B4raoCQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BYHIJBcBzX4woTKDxJ+AvoVlmuTug2Ro1Y2L1Yciwrw=; b=B4raoCQN8gsvUex+Q8OePWBW7u
	r5YhYneu+ii6Y+mO/SOP08HMZ2rhwY11TMJVcztNP32aNQf9Nwd8MbDynYHGNyUQkvDzmynieRU1M
	JzrwsgEQt8iH5AsXqOXiWuVW/imtOxouUCyS74/XKA3JHH9T6nY/3otCIto+Ebw8R0g8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQVSN-00FKho-06; Mon, 09 Nov 2026 20:55:07 +0100
Date: Mon, 9 Nov 2026 20:55:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Message-ID: <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
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
In-Reply-To: <20261109191515.252449-1-cyan2254650260@gmail.com>

On Tue, Nov 10, 2026 at 03:15:15AM +0800, Pufan Jin wrote:
> The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
> that alone is not sufficient for reliable RGMII operation.  With
> phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
> drops ~90% of the packets; the PHY's internal TX/RX delay is required.

Sorry, but this does not make sense. 4ns of delay is 2ns too many.

You need a proper explanation of what is going on here.

    Andrew
