Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932126;
	b=mEcXb42wp4etWyZFwAXkrPkCtKuuGyTAs+JCI8kLeQOaTUy6K8kisPeybX7/sVeAbMLA
	 JD1nJgoDLGknQMoZmPZmVExYSegnx0Iul/fkmHFc+8oMCNAM08U9LLDVDJeZEQHhay3UO
	 KoYC3kMlyWIxYP5626TL4NiQQzCFAtTRXfyGxcCWHkAztKp9pt9froEcLMR4tqgLugM9c
	 qylU0aH6E1jGVgM/sAR+unZo1c/Nj+KRZooV40i+XUg3FMDuxvveYMI4rIodL8daHyBbl
	 hyMVIpqTD34U0aRMwy/V6eAvHBazkzTSuvItDz5B084ALOSTJ8z3wH9NCqchSZIxxwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932126;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zo7HDSI3Q+SlzaOYF7jYPSp+q4JGpMuWyCyvC0h9xhE=;
	b=hc2apAFQ/IZrDDneIhRF8vLdeEnzYYceizu7/EF3NMk5Y1AW+VT7UkWQEoNoKdRKA59H
	 CEI790psB7a8+T3qwyJMr2bhmJHFJZPZVH/uDwBfTQb6GhmudJp3fMyZKob2wB3/YaPok
	 CgPo87RDlVq2gyT8NDGLuOGUxiOTPKtftEF7XKUveIqy8CoDAv+VKfXBFf3m89udyV5iL
	 iXgIapkuJ0+d4wHOjRk2hBj8Qz2h0yXjMaTr3PaJwKGWdL97BlSFk4JNz7yNvDUsz8LfY
	 IuAqfwd7E4lpTmR/GM/mS9cswA9hddpPhvPQ7EopMm4jn35XaWdKE9jw2DM0C8x3iwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4mSmiZL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA27606A31C;
	Tue, 17 Nov 2026 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4mSmiZL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124F21F000C6;
	Tue, 17 Nov 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932126;
	bh=Zo7HDSI3Q+SlzaOYF7jYPSp+q4JGpMuWyCyvC0h9xhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4mSmiZLVcOjNEBeCs+lz5x2YwtcGlK6TJK5oN/4tktNqoiKNti4QvDxiwhXF9ZHr
	 46JQ5u8vZM1Cp2WpanWo4O/o3JKBfgaNPO35w8KCyZmSCwXmGkZbbrhJmmJ/YpOZi7
	 ZgOo5WrDSLrXgopDCxIRaBzdJV0D38hVApWhCWKEleVUpXenD1rhTd7Bof9SEIKeNZ
	 /IsegJHOkD6tdtNBQ6jun3EIAJs9sr1q+AzQKtb7r6lXbezyOONoZxBG80J5XZAi+B
	 CWAwdy8MW+IYiEL5lNcL37P3AcFnWShp8NN4I5bgIrvTcNZK2YQ/RkuoyeHul/bfEy
	 tu7fbPo0SKAyQ==
Date: Tue, 17 Nov 2026 23:55:08 +0800
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
Message-ID: <avx43Nv-DJCX5_Rr@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
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
In-Reply-To: <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>

On Tue, Nov 17, 2026 at 03:59:30PM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 10:13:58PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> > > On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > > > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > > > Assume we have the following implementation:
> > > > > >           ----------
> > > > > >           |mmio reg|
> > > > > > 	  ----------
> > > > > >              |
> > > > > >  --------    |      -------
> > > > > >  | MAC0 |--MDIO-----| PHY |
> > > > > >  -------- |     |   -------
> > > > > >           |     |
> > > > > >  -------- |     |   -------
> > > > > >  | MAC1 |--     ----| PHY |
> > > > > >  --------           -------
> > > > > > 
> > > > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > > > a single set of clock and data lines, which go to some PHYs. While
> > > > > > there's a mmio reg to control which MAC mdio master can operate
> > > > > > the single mdio clock and data lines, so only one MAC can operate
> > > > > > the mdio clock and data lines.
> > > > > 
> > > > > How does this differ from pinmux?
> > > > > 
> > > > 
> > > > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > > > pins.
> > > 
> > > That does not answer my question. How is this different to pinmux?
> > 
> > Let me explain the HW in details:
> > The pad have their own pinmux configuation, which selects the MDC/MDIO
> > fucntion instead of GPIO or another perif function. That pad
> > configuration stays MDC/MDIO, I.E unchanged.
> > 
> > The register discussed here is a separate selector between the two
> > MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
> > it choose whether MAC0 or MAC1 drives the MDC and MDIO.
> > 
> > So the proposed demux controls this internal selector and serializes
> > selection plus the complete MDIO transaction across both MDIO
> > controllers.
> > 
> > Would you prefer model the selector as pinctrl states, with an MDIO
> > demux selecting the appropriate state under a shared lock before each
> > transaction?
> 
> Each transaction?
> 
> Are you proposing to use both MDIO bus master? Why? To the outside
> world, it is one MDIO bus, so you only need one active MDIO bus

Yep, both MDIO bus masters. I wanted to let each MAC uses its own
MDIO rather than disturbe another MAC for dual MACs case.
But now it looks like a over-designed solution.

> master. All the PHYs are then on that one bus.
> 
> I would let the DT pinctrl node connect one MDIO bus master to the
> outside world, and that is all you need.

What about coping with the selector in sl2610 stmmac glue layer? I.E
use the presence of the mdio child node to identify the provider.

For dual MACs case:

&ethernet0 {
	phy-phandle = <&phy0>;
};

&ethernet1 {
	phy-phandle = <&phy1>;

	mdio {
		...
		phy0: ethernet-phy@1 {
			reg = <1>;
			...
		};

		phy1: ethernet-phy@2 {
			reg = <2>;
			...
		};
	};
};

For single MAC case, it should be as simple as coding the selector
to let itself act as the provider.

This way looks simpler than modeling it as pinctrl. what do you think?
