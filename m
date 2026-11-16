Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844715;
	b=A+20MXAYTKEx00Ea863ThiV+oddLs7PnbT22M4KRoE/VmNQPENHcm5zNVA9xsP3HZ1QB
	 lt6RNAbn8GG3anHXChwJHb6ALsdgDxHUsxZcBRZsghA+dWANTAgw0ih+JvaM8x56Gmh4/
	 Kd3ldl/amuxSj6cV3mR9j+I9aJGOi72W1ZC5QM7pbnuPXtP9rJ2hzXVl1nFBMPENZIGM0
	 0ocRA79eYWiMUrJ3dXm/ibuLIvsNTt/ZwZ0FoUHg9Z5PNYhweRCeIErIKHtMNUMi2tCBd
	 +AKjUWtQ/FbXxLLGMTFoMGu9LFZb90EfUNOMsglcomEjP8uwiQc8IrUn0pRYTHfjQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844715;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=zno5lGS0axCV2J7th/KKxA7LyCzjnlPiDTG2Ak1Q8bE=;
	b=TXk2XeLFX+mgBlf/mJFGcvBifG9lLhdvtjY3fDf05BNPnnzM4Z/eS5p/dmF2HI83I/F7
	 6qEfVeyEDGBGY2e2oYPTqfv4u6dKPZ9jS5NHTz0ia3IqQx4cZ63pt8RmaMRqyIarQxf8v
	 PZzj0KUSGLMa/ncYgkduk46gIqXnmyyt4FjBUysdCJP8qxc7tWkzkbrXkVwQH5QzoNEP3
	 MSk71JNbl2hhHNppKup9GKkeJ9RJzSKEor/0nj0a6PUXFEQnJsuupTBySxgBVTkuV8feI
	 jQ7AF1AMQAw5bJXbAIk566nuiLEKP0HUGHUBcShNwWBi5ck0tRPi6+UWJ32rN6oCApg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Vq+E7Xsk;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23255606A322;
	Mon, 16 Nov 2026 15:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23255606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Vq+E7Xsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zno5lGS0axCV2J7th/KKxA7LyCzjnlPiDTG2Ak1Q8bE=; b=Vq+E7XskQVTJi7Fjb9VsfEP7L2
	ui7ElJUX6yhXo6pAgC/vgt3OJFYJJ1Usi4r0ta9yTSblNO2OlyoT0lqdg3RxrYh08HbkqLmMSZWjg
	HEYgnwyZ4YtBeUr+HyOY4dDSPE/zmc/Y3S3sTj0aJFUudQwEFNuaXLAevYSQ4JvhFY2w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSz5w-00GxGL-44; Mon, 16 Nov 2026 16:58:12 +0100
Date: Mon, 16 Nov 2026 16:58:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cunhao Lu <1579567540@qq.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev <netdev@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
Message-ID: <ec29187b-e23b-484b-b642-b1d504627c28@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
 <f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
 <tencent_273206094323A701D688217E3A4D72341C08@qq.com>
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
In-Reply-To: <tencent_273206094323A701D688217E3A4D72341C08@qq.com>

On Mon, Nov 16, 2026 at 11:11:42PM +0800, Cunhao Lu wrote:
> Hi,
> 
> > [...]
> > > + .regs_valid = true,
> > > + .regs = { 0x29d20000, 0x2a040000, 0 },
> > > +};
> >
> > Just looking at this, it is not obvious that rx_delay and tx_delay are
> > actually not used.
> 
> My board currently uses rgmii-id, where both MAC TX and RX delays
> are disabled. I kept the delay handling to support rgmii-rxid,
> rgmii-txid and rgmii, using the default values for the MAC delays
> enabled in those modes. The legacy tx_delay and rx_delay properties
> are now disallowed for RK3572 in the binding.
> 
> I currently have only one oscilloscope, with a maximum bandwidth of
> 200 MHz. With this equipment, I cannot accurately determine how the
> TX and RX delay register values translate to picoseconds, so I am
> not planning to add support for tx-internal-delay-ps and
> rx-internal-delay-ps in this series for now.
> 
> Would it be acceptable to support only rgmii-id for RGMII in the next
> version, and reject rgmii, rgmii-rxid and rgmii-txid? This would let me
> stop using tx_delay and rx_delay in the RK3572 driver path as well.

No, rgmii, rgmii-rxid and rgmii-txid are valid, it depends on the PCB
design.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

What i would prefer is that the C code does not parse the rx_delay and
tx_delay properties. If somebody actually needs them, they need to
implement tx-internal-delay-ps and rx-internal-delay-ps. Since you
don't need them, you don't need to implement them.

      Andrew
