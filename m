Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932454;
	b=GoTW6lRO3CcZCopr+YJA5yjkSoVSfCQ+uWMTugkCad6WvWepazjWrlnjq4U2kkW0lHMV
	 7hdcLcnVa8aAtC+cqcrWZSw1Sbp/X0BzjZpNVZzTT2AbueQevGJrfvc5yfu3XTfDeN2V+
	 sVngwhjPDROQC1snMQ/oyTGObOH4TiyT0TL1tbXVJEjdAUsHaKiHImwdMqNkfCnI4BZH+
	 il29t9cL8n0HvGgNh2XalZ6QmZLwQSM2fh9P9524lxLzyPOyqJa2D6CLuTBHSPjvHKc8m
	 UccwpwM4NFivJRWhhOu03jT/H5VJBDtG997018OPzY00TZxKeBzFzjKDJmyW2siupAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932454;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=R8YXxcd0YC0WTNF9Vrbn4gzJwhELMl+f2VxUC/rLuRo=;
	b=ayF7V82n+G4aou9dsyIeUcBuEB2OfKRsfUXvz1vIKwsF8kZOExZvBl81qKf3X3luKpNY
	 UW5YkHDsHeqzi/TwevLUPkQz7EkbOqacM9ikXm0wm6fq4DI/ZyNTJ68gkFF8BKibX/H82
	 8L6Hhz04p6Sk41rXwFUI8Ba6NvPEBaN6szUC1WtPQQI+YNBt0dcakmF3OYx0/F1szYi+0
	 oiCiMrpr5C4qql77CUfwFyS+eCXJefd4kGpvAVsR8lnmjX1FxahEW33f1nypMyzh/wlKt
	 CCL3POZCzf9t47ao9NAxEU1HexwSMKFaVYV5NzGbedx/d4k2u0r8s+Auuk0JjlES3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=svEAUt2k;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3733606A332;
	Tue, 17 Nov 2026 16:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3733606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=svEAUt2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R8YXxcd0YC0WTNF9Vrbn4gzJwhELMl+f2VxUC/rLuRo=; b=svEAUt2ki8b5CN9Mzp7R21FRHX
	h+1+/6oQtlSNo6UvB0Cxo3jG8j16W9AzngFomfI4mPSzIrbY7VNE5et6/nCjNZmYk/RmIxzJVXDjq
	F4+Ih38p11f0AHNk427t7VA8S7/moH07nw2rS5D2hIPNYz2KXlLPB/o/CB52S6w8Xoa8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTLvD-00HCIO-9E; Tue, 17 Nov 2026 17:20:39 +0100
Date: Tue, 17 Nov 2026 17:20:39 +0100
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
Message-ID: <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
 <avx43Nv-DJCX5_Rr@xhacker>
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
In-Reply-To: <avx43Nv-DJCX5_Rr@xhacker>

> > Each transaction?
> > 
> > Are you proposing to use both MDIO bus master? Why? To the outside
> > world, it is one MDIO bus, so you only need one active MDIO bus
> 
> Yep, both MDIO bus masters. I wanted to let each MAC uses its own
> MDIO rather than disturbe another MAC for dual MACs case.

How does this actually work? Each bus master sees each PHY. So one
hardware device is represented twice in Linux. Bad things are then
going to happen.

As i said, the outside world has one bus. So you need one MDIO bus
master. This is nothing new, the FEC has been doing this for a decade.

	Andrew
