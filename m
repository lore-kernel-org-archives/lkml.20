Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833974;
	b=YoMm/hPeTud0pMnBOfUcWsTA2OfiFg5pmJq2XfkZMwaBdOO7g4vI8QmNYMYF4NzUsQ0s
	 hSIXX0xRXK+gAgcHT7Iqlg4uQH6eXYiwEIPDhhivApgPyed8pzi7GEEX6cAXMVAEWmSLz
	 UQLtjuAJDlvbMH4c5ptvQ+oIeEsF6O5mLSqV/lEZxgisUacaRy+gXYJYh3G/WYMscjHuz
	 un4ah8Olm4QJ8FlSfbNlZq0e27TBN/iqDP1AFEV2qs+IVB6IZGXe6BXmbSGMU8RNH8d9Z
	 uFEbNKYqVO1Spaq5VIBM6F2E0gXHWN4ybM5OyJGmh4gvxJTvPc4o6gEHjn+DGHTy/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833974;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=H0ZkNNcZYDe7VlHkuwH0d8aoRRKZdBPLeqP/TuARMR4=;
	b=qjTS5CnEojYcOouBx2kf0tE8pcxE04xBEtX+TcIwV3J0+Y29FumDvANKZ+y0Joo5bxri
	 KO4LRJ5lrtay+E7+dX7cC8O8m2MHv27mtGFdO4YpsfQjpxg2l9EbjCR2gFAYE/vwIx7eH
	 8XfK/4bWxHl92DFlcl4AbybD0JiQtU/yWalxEpt8b52kbV7WcEnnq9/51cBcPIvg9Eww2
	 sHsWUg7ipwAF/26KxSQnVu8jkh+Ym4vQYJ8EPnJzbLfKtfpqHbSv0Sy6SoU6/0lhJap5A
	 wvtritIGPjjn5dlLv/n4IWrLmg8kvVYrKcDQE9nBN7sTcoMlxRDx+aiKRpsgqtSPJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z05EBtcw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C651606A31C;
	Mon, 16 Nov 2026 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z05EBtcw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FE31F000C4;
	Mon, 16 Nov 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833974;
	bh=H0ZkNNcZYDe7VlHkuwH0d8aoRRKZdBPLeqP/TuARMR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z05EBtcwSpXoYHkEF5iaYXC/SUkFKTYxy8n50qUine3tJTmnGMUtZqx2CyqmYlD3g
	 KpvOznUOSxNVSxLdQjaxPSolgVv9alnguD2E2zeltouNszcEDJkO7o72flqbHAmtDs
	 CNXEg5ChRbfBWT2utgtNqzUe9qVyoBkJRQEbaxP+cY0cCI9NWWRR6Hq2gHNJF+UegZ
	 0u4jJaaHpQtvGjwvdq2Y6Zhy4Cs/Qt9nib63N4OM/9Iv/SBYjPqgtn5VThiuy1CKW4
	 xnXV9FC5mQNBs/4fJY7DS3INYfRN5G17PaWVCoR3cggAivxXLCN9osWWpwDgVUmMcD
	 LLp5oAL9B1SNQ==
Date: Mon, 16 Nov 2026 12:59:31 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree <devicetree@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit <spacemit@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261116125931-GKC100890@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
 <20261114075506-GKB100523@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
 <20261116082350-GKB100890@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>

Hi Sandie,

On 17:52 Mon 16 Nov     , Sandie Cao wrote:
> Hi, Yixun:
> 
> > From: "Yixun Lan"<dlan@kernel.org>
> > Date:  Mon, Nov 16, 2026, 16:24
> 
> > > 
> > > In version 1 [1],  the patch is cd-gpios = <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;
> > > but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
> > So, there is gpio cd pin, but didn't work? it's hard to say without
> > the schematic, but can you check with hardware people, if it
> > can be fixed with SoC's internal GPIO BIAS pullup or pulldown?
> > So, gpio pin is able to reflect card insert status
> > 
> > 
> 
> I did check with our hardware team, and the answer is: 
> there is a CD net on the slot, routed to K3_GPIO(88), but it is hard-tied
>  to GND on the board. (v1 of this series used 
> cd-gpios = <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>, which of course
> always reports "card present".) It is a direct connection to GND, not a
> strap resistor, so the SoC's internal bias cannot pull it up.
> 
Ok, so there is CD pin, but with hardware design flaw, it's indeed broken,
that's "broken-cd" property for

> > > So In version2 [2], the patch changes to non-removable.
> > > And In version3 [3], add comment. 
> > > 
> > > The options: cd-gpio, non-removable, broken-cd  all work on this board.
> > > 
> > it works, but does not reflect the hardware status
> > 
> > > We just need to detect the SD card when bootup, don't need the driver 
> > > to detect hot-plug event , non-removable should be suitable and faster, 
> > > we recomment to use non-removable.
> > > 
> > No, this isn't a valid reason, it's use case should have nothing to do
> > with the property.
> > 
> > My point is: if the gpio cd pin still doesn't work, and the SD card is
> > actually physical plugable, then should use "broken-cd".
> 
> The SD card slot is onboard [1],  put the board into casing, there is no
> way to plugin/ plugout the card. So there is no card-detect event that can
> ever happen at runtime.
> 
No, if open the case, the card is still plugable.. 

> If you still prefer broken-cd,  I will follow in next version. 
> 
Yes, please update

> [1]: https://deepcomputing.io/dc-roma-risc-v-mainboard-iii-unveiled-at-fosdem-powered-by-spacemit-k3-for-framework-laptop-13/
> 
> Best regards
> Sandie

-- 
Yixun Lan (dlan)
