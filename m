Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933516;
	b=lYZCQeMoioD3ZLpReNGn1c2pLKrsRNq8nWPkkxJi1uceCTSPaZKiMlbZpcL61GvaHWVc
	 SSHih/IlfqH8AgnACCwB1sZMlHF3hfwM9qFVKVMBuL4mBJ3vNp7d1NDJcyQhRoPn2IPQA
	 ARc80cYwkdaTCJe8fBbE1Qk1G+AdO5m52GS2VIAc9vLnPf8lcJwdJswSAd78mnHBAslY2
	 EoASURbCdNUQNYe0jv5XwhaEmP4j5m2S0JeWuH97mjQN9Lk8I09erNYGjhkVND+iz3U7E
	 y532vQ7Nq5/HEyDu6AqjciGCfMOCrcy0pl2J9OQDRPkElXi6cWo9dO8yHMVxUsU5LdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933516;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=46X1A36lRITxJaTPLlxxVzXDY079oCIGjNdvfhIAUtU=;
	b=zHhw8H3XGnXUJOGEw0RjffuugUeOP7czhNdgbb8Dc3ScJ/pMZwWkh2Gs3NK+kX31gJtv
	 t7mxzc16P9jdn4DIviXTQ5C41V17zHbxFk75S4IZKEHatkvYDikRtcmAAFIX68qD8Q6R3
	 QQthgL9DFAMRq2eNCI5We83YXLGiOkT27ypANqvMtwcoA71q6E3O+qG9j/vQueXvcNHHd
	 skbuk9LxivS45swNjuLqY/CXf6ZnY/YkMMKEa+45DpWiALbgBV24Unlwhl34IMoTVFXKG
	 /Z52MVULy5d/JsnSnG476hbfVBdXWaVUQtUXRvUJ3zMMqOzqILLL0hkwl1bRjAudFNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzXGWm54;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB38606A333;
	Tue, 17 Nov 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzXGWm54
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3221F000CA;
	Tue, 17 Nov 2026 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933516;
	bh=46X1A36lRITxJaTPLlxxVzXDY079oCIGjNdvfhIAUtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CzXGWm54quJek4+WeGA5ThtKKio+wFJfPAJxfJsnaZdl5MOI9Vg0TJSV3hRZXUdPX
	 sUcKZIOD0i2a9/5fWnivG9SLP5tKVLhvlQjgyz+u80wAPNx68KFoQQzMlPOYm9loQd
	 sdezHyNDyWbiE8jkrTjtnTxitoye9PZaiwX5dizfOYhbBkhvgAIAi8/lrd2aqHlMQC
	 +05ngZU3roLo4v6otfUoN+5I4PEeVFGs9QV8omgnYOwK0FwCUU1Zxpdm20Eu0lStOc
	 oOVNCSE4CsrxNQCptGKN2U+he3l+cUPjZ5ZEPDzWXC0FXdDda4PoLhyx937L5Q+yfe
	 Z6LwPS4U3BkHw==
Date: Wed, 18 Nov 2026 00:18:12 +0800
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
Message-ID: <avx-RO_K5h12HWx2@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
 <avx43Nv-DJCX5_Rr@xhacker>
 <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
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
In-Reply-To: <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>

On Tue, Nov 17, 2026 at 05:20:39PM +0100, Andrew Lunn wrote:
> > > Each transaction?
> > > 
> > > Are you proposing to use both MDIO bus master? Why? To the outside
> > > world, it is one MDIO bus, so you only need one active MDIO bus
> > 
> > Yep, both MDIO bus masters. I wanted to let each MAC uses its own
> > MDIO rather than disturbe another MAC for dual MACs case.
> 
> How does this actually work? Each bus master sees each PHY. So one

This could work since the demux serializes two masters' access + only
point to one phy phandle in one mac's DT node.

> hardware device is represented twice in Linux. Bad things are then
> going to happen.
> 
> As i said, the outside world has one bus. So you need one MDIO bus

Yep, I will switch to one MDIO bus solution by coping with the selector
in the sl2610 stmmac glue driver. A sample dts for dual MACs case has
been shown in last email.
