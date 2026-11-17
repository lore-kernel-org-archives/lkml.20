Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926057;
	b=HJKfq36WRk2S/G1RBv2k6UBltfY9/lOo2wLhwmE1x5NaQbJyqoQNRg6uyyQYhXKgxgEX
	 qTuBXrTSvu1Vyf52B7q6QEU8mNZNESGupx+H71AJlRuaOlSbCiYb8PnEhofQCAcqvPW8r
	 eWCyxn3gAuFGKSiUZZFvsCClQnEXu+0q1mPFOiY3lfjXpue2EsPpk70ie27GT3IkiNe0z
	 OAQOfr4OQTSHcfnegdHS4vXJeWBx7TBreMUXRmAUs3KbY/5ySjB6pwBkS3OOMFnJ3ErlL
	 zaCs+IRSBKUV+4uURC270pZBcdKz702sl6tL0Tse7nuoRzQZyHMBwZtxzYroIAEDmfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926057;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ctl1tLaoM/IXjPWaua1GqsUJA8m8aPnpqJlW+uWtku4=;
	b=P6x75JjuQmheqSOBlbpLr6yeZ8+CazQts21emqMtE3vmCoXI5zrHc49uQRE5K1/NBS10
	 /dWldChGq2co+wRjHed7VKlOVELs/cpGkxvs6J3qqcl7ddMIPIYgKMioYOCLgcx+bGNt/
	 1hAoOCV+YUgpajM+tin2RecvXQJT14RZbgyUjpxbz2UdHGTnPCPwn0v2cbyopf3anQ+z0
	 pzontM8XnBHcrUJaCBwI7kxeZDhE9oj0Dsu+4dGnJfxvJd3fbVakYjNsWip+4BigTjys6
	 I39xE63Xep5rqTBnEM0PsGU2OgzorYAEPol2R8pBp9kKFQ7QLxnD7LGx0bvPXciImUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQROSnmc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB92606A888;
	Tue, 17 Nov 2026 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQROSnmc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440A81F000C6;
	Tue, 17 Nov 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926057;
	bh=ctl1tLaoM/IXjPWaua1GqsUJA8m8aPnpqJlW+uWtku4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AQROSnmc1Uipda2/MZtI5joUGrUdfqKIRPexALaTDcWEblXm8qQbC4ye291cfcQUO
	 Ypn1BSFBZn7yAEtwDJ4TCXlOht7RvrHt/zoBOsieQ5gQDhtKKzHBAQ8EwKCK+udkSu
	 2S3a0TKkzze3u6BHYZNmDqXiPOQgOXnJ67XFgSX/UWrIOXXw40F9GbSr0YjW7xBE5+
	 3BdZlSULorJ1aB0MAy1bFtQjyu5FIQrgO1hk2NnpIiRhZKCvfCMtD80suVifctJBtg
	 7r5lahPKDD/BopTPEX/QVDSyTuHMoEjSpuYxP2qS4fP2MSwsbfvZTN7EQPpGhh3GiP
	 mLJOyhcGfEACQ==
Date: Tue, 17 Nov 2026 22:13:58 +0800
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
Message-ID: <avxhJs-51vs2Icje@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
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
In-Reply-To: <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>

On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > Assume we have the following implementation:
> > > >           ----------
> > > >           |mmio reg|
> > > > 	  ----------
> > > >              |
> > > >  --------    |      -------
> > > >  | MAC0 |--MDIO-----| PHY |
> > > >  -------- |     |   -------
> > > >           |     |
> > > >  -------- |     |   -------
> > > >  | MAC1 |--     ----| PHY |
> > > >  --------           -------
> > > > 
> > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > a single set of clock and data lines, which go to some PHYs. While
> > > > there's a mmio reg to control which MAC mdio master can operate
> > > > the single mdio clock and data lines, so only one MAC can operate
> > > > the mdio clock and data lines.
> > > 
> > > How does this differ from pinmux?
> > > 
> > 
> > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > pins.
> 
> That does not answer my question. How is this different to pinmux?

Let me explain the HW in details:
The pad have their own pinmux configuation, which selects the MDC/MDIO
fucntion instead of GPIO or another perif function. That pad
configuration stays MDC/MDIO, I.E unchanged.

The register discussed here is a separate selector between the two
MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
it choose whether MAC0 or MAC1 drives the MDC and MDIO.

So the proposed demux controls this internal selector and serializes
selection plus the complete MDIO transaction across both MDIO
controllers.

Would you prefer model the selector as pinctrl states, with an MDIO
demux selecting the appropriate state under a shared lock before each
transaction?

Thanks
