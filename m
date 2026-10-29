Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298644;
	b=ev1Xfd3EyaW8ANycO8vd4Yz/TPEjyxrs+SIZ0VtdEqfLb8/NtNh7NO97KHDvQsV+1wir
	 0/PD0+fkc6xlN8cX3ASMLdMXRENMCT6XWNYh9KR4vJaKKu2YNpXWhlG2XbluW3MKZR3bt
	 qPdGXp49Dr5EAH9B3Ys4gMfVx2yvqDUoGSeKmr6CknUamxnjbani96OCKL/aiM7JAClu5
	 Km0nUlwd0tTi6ii+OozuW8Slms+5V8UAij7buIaGxPzkW3XTdsfXz2Tae64whids1dtQx
	 rySoEmCjyWp2kBeoZ6zjcifoMw1syXJYDg4lwVYwHOPeYbgtelAjZRViQetS80WI8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298644;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T1jQPPOnIUPn54gOQVLPacFnP84O2C/bl7ta1IvDEVw=;
	b=Y+J7lAAIDZcI6NcAlCRU/RpoaJA6bryYIJIaDnpQyUBAMYl9sU1ryFJcHPWZRY0M0ZFw
	 dT+2dyY0r8rxh2nW7YuHf0pbS6KT2kXVmwwtBpyS+DeYCI5KHkgCe2iBGXU7iuvAWt8K1
	 rz9NcEdjUR1bGtcCYzVbMn7CPKQ4KjvSxl1AcN7vWvCAvhCNPJN/8/UIudkfPUgWzL0GU
	 mtTE5cNW7Th0NP7WuIGU4Fwo4+YZ1QD65GB755PolzAxsaQW0CgT9cT5PRG4djjtVXvhr
	 U/3suScYJ+Qdlv7wosd6qBMl0GrtClHC1NDDDADrBOqIzdG1D95qQ75nPP3lB4kW5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6K+wAf7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EF606A31D;
	Thu, 29 Oct 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6K+wAf7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35111F01816;
	Thu, 29 Oct 2026 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793298644;
	bh=T1jQPPOnIUPn54gOQVLPacFnP84O2C/bl7ta1IvDEVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6K+wAf7ZjRh9Ao4TJpsqRQcwVrqwhHiapAH8DC7rep5dgOpHzoaqe9/tUVvPObO+
	 KB8hjr2tiqbKGwQp6c39C1X5ojGJSsqyC+nPzE9J3w2ZdzBxhUN2ya3PJBXbJ/scJy
	 HBSFMGLcximqJcBzunCT/gKnuCVBC6p3eA0/nNbtleub1Guk1EYVHf2MXNcknjoRTo
	 4etDeDvNDKHKZTscTGw0obKhKEZtewUh9TskRl2yHfh4uCt/ZMh+RYV/OgSR1QtUJ9
	 igrnsMD4lUq25iyxd8eLP5xJMuEgKKYVhcJxicByYCySguIPHj51kHLmJaTFZNYVFn
	 Gq+InIT0Tq13Q==
Date: Thu, 29 Oct 2026 13:30:41 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-rockchip@lists.infradead.org, Simona Vetter <simona@ffwll.ch>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	devicetree@vger.kernel.org, Andy Yan <andyshrk@163.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dominique Belhachemi <db@domibel.de>,
	Maud Spierings <maud_spierings@murena.io>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	David Airlie <airlied@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robert Foss <rfoss@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
	Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Yakir Yang <kuankuan.y@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	dri-devel@lists.freedesktop.org,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Karlman <jonas@kwiboo.se>,
	Graham Markall <hello@big-grey.co.uk>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20261029183041.GA4029917-robh@kernel.org>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
 <179329528881.3539981.14637229355908751610.robh@kernel.org>
 <777c7a8c-de7c-4f0c-9c9c-d5b78a5595d8@samsung.com>
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
In-Reply-To: <777c7a8c-de7c-4f0c-9c9c-d5b78a5595d8@samsung.com>

On Thu, Oct 29, 2026 at 06:53:25PM +0100, Michal Wilczynski wrote:
> 
> 
> On 10/29/26 18:38, Rob Herring (Arm) wrote:
> > 
> > On Thu, 29 Oct 2026 08:53:38 +0100, Michal Wilczynski wrote:
> >> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> >>
> >> The JH7110 HDMI IP is a monolithic block containing both the digital
> >> controller and analog PHY in a single register space. This binding
> >> defines the parent device, which holds the shared register map, and its
> >> two children: the PHY and the controller.
> >>
> >> The two have separate resources. The PHY takes the 24 MHz reference
> >> clock and provides both the pixel clock, which the VOUT clock generator
> >> routes on to the display controller, and the phy the controller uses.
> >> The controller takes its clocks from the VOUT clock generator. What
> >> they share is the register space, which the parent maps.
> >>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
> >>  1 file changed, 95 insertions(+)
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml: Unresolvable reference: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> > Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: hdmi@29590000 (starfive,jh7110-hdmi-subsystem): phy: False schema does not allow {'compatible': ['starfive,jh7110-inno-hdmi-phy'], '#clock-cells': 0, 'clocks': [[4294967295]], '#phy-cells': 0, 'phandle': 2}
> > 	from schema $id: https://protect2.fireeye.com/v1/url?k=e93a78e1-88b16dd1-e93bf3ae-000babffaa23-e7f80dd3ed8ff65f&q=1&e=27d4095f-5012-49f1-94e3-a63fd9693348&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsoc%2Fstarfive%2Fstarfive%2Cjh7110-hdmi-subsystem.yaml
> > Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: /example-0/soc/hdmi@29590000/phy: failed to match any schema with compatible: ['starfive,jh7110-inno-hdmi-phy']
> > 
> 
> This patch depends on the JH7110 HDMI PHY series which adds
> starfive,jh7110-inno-hdmi-phy.yaml [1].

I'm aware. I just want whomever applies this to know they need to wait 
for that series.

> With that series applied dt_binding_check is clean.

Humm, this is applied with b4 and you added the dependencies for 
it (thanks!), so it should have run with that series applied too. I'll 
have to investigate.

Rob
