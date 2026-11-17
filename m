Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893197;
	b=sVj+Syem/Cdgzaw7swwmA2BUup29/zIYOPOvA+Xf4GZ+TSQYLyHOREP1v7lz+ZjeBcTk
	 TP+sQT9VQZYmAdL69B7mFDeRHwwrEtQY/7z+w30EbGntKqZHAKtdR5VBWvjXu6N3YkT6A
	 f4kj7xZbH9UzMu5up791wYIQqZVDYwtC5gQ3FO6uIisDsb4ebTxwezIZzn05zksgMeQxN
	 7uTzjkEckA66rCZi4ASJQTrUVZXK5asJLaE+Qg/yAJWiqti1lT0/NG0DdvashFvoaysws
	 vN9A7YODHWt7G9EksdM+KMI18GaJrLKBCSRp/7kWikGpJDQUKmJb3WdQiE5L6l+hPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893197;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AGnupoN5tt3PzMV+QW0kCIew7myaCy1fsrhngU5DCdA=;
	b=vLHmG2jS/FWmZVRsKwC90lsyh6t9dezkeLlWquzr9iTiof5+Z3mx/F30mnRg0Nf7EWkc
	 WKLYQ6gdnnG7ByxNxs9oDohSbVTirqmavejQDW7ChyudpTMynHsVmFMgpmIqGTEWCC+bw
	 hEVLj2Ood8TqoJd8uAz8PG4NQ6eb2nJ0yho/BNEzYzzywfcelQ7aYN3rp0jNEj/zTbL0i
	 +jnaetj3pdog83beve0YZZw7KPV81WFQlhe4LGjL/3ZoHn2F9S14u6LxSL+VrmmGDmBKV
	 9sw2w9dTl5eyOInGjGjj3Mie6iys+lwAReyUuKt04JzBGJGxXGiAGxCICElpxm1+9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cq1xm6YA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF0606A31C;
	Tue, 17 Nov 2026 05:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cq1xm6YA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B510F1F000C4;
	Tue, 17 Nov 2026 05:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893197;
	bh=AGnupoN5tt3PzMV+QW0kCIew7myaCy1fsrhngU5DCdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cq1xm6YAUOUtiyqhKYC+ZLXtHVVnmzsjNHcLFB5NW8Sgi52PAomCEs2QT8b1Vzrzy
	 ILp60onCIMxm6sBOjjtMhCqKvg4prALlyrfaUv9/D0r7Bf4mFlWGDqKE6WIhnoJu8G
	 owC78w1aCmenEr0ZY09IkzW7ILYvj+36sF3N8EDI/6rLEqPQd/jinIwzEq9IaY1hbi
	 VtlL739fiVVDdRaoSwaIWe3yqBHx70xgQUzCdo0i96YvJIKLf0M3GKsT7Z3i45fph6
	 FTLz3xfgCKuqjXD4VHvQ0THkuY28NrurDs2VDz5wTpk5eOLwtQvhYRZdwH14HINcUK
	 urL+5tovqV9vQ==
Date: Tue, 17 Nov 2026 13:06:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <avvgy_bmRSVApCHA@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>

On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > Assume we have the following implementation:
> >           ----------
> >           |mmio reg|
> > 	  ----------
> >              |
> >  --------    |      -------
> >  | MAC0 |--MDIO-----| PHY |
> >  -------- |     |   -------
> >           |     |
> >  -------- |     |   -------
> >  | MAC1 |--     ----| PHY |
> >  --------           -------
> > 
> > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > a single set of clock and data lines, which go to some PHYs. While
> > there's a mmio reg to control which MAC mdio master can operate
> > the single mdio clock and data lines, so only one MAC can operate
> > the mdio clock and data lines.
> 
> How does this differ from pinmux?
> 

in my case, the two MAC MDIO bus masters share the same MDC and MDIO
pins.
