Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362414;
	b=um8XkIoGEg7/J6BOA6Ki4dXq4idLmGzQSraQBhca71nt3vyoJyNhjyIJrrMeDnTb4ijt
	 Vx5wecUMtPGAFzVNyQjn+X5JCMyCV1qbyzqxUO0RrHtNeRO5wJsrFtBU7oXqd+UrcvQdC
	 ebuM8UJ3isSsRUJd1/KBy6A+HT7WMplFN/2Abkea0colGkMGVRStqbLDK6z1COfTdIcvW
	 +bGgVGEiuzPsBRgmYqw29k+nehEsSABc4r+/BRC/incX3Y4Z2Qey4moEMAN211MAAmdfz
	 GLnloK0syFzO4HiDwnCZfTNlsI/hMXbH3JYu22JN4WUSIO4f8ef2jCkMc+m+hC7YWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362414;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W7iS3Fx6HV5ScNF/DvW83v1rNy7myS3fOAFqhJkCPu0=;
	b=VWhPUkgaKjhgXo0tNr3B5c4GGIaK7D9jCfn2vgrFiGgDqPLph/noWp3F6UJz3zC1ki5x
	 rQG7gLHIg2FeHuUdUab1nEfFZhrzTKjHOQqV9z1dOFvhbs1O9eEWqM34JorDB8didL8Ix
	 pINI5Gn6r0BXysAWvZvbjDmlTOO1AT50NnJQHQn261BGNk73P3a5QG1w9t8B68BfHQ6iE
	 XmTsH1qwVfSYCXA6xRW7XVdXa/6b0we0s9Rql5Vax2yhkwxLyGExPlRKjmBEIRsaLJJT9
	 XImOeOE+H7BOaTV1Z7IOiHqGIF6j92mgo5LcA6LXjsaz9d7H/REzwQgAfltxgC5/N3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSGgWb0E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC94C606A31C;
	Fri, 30 Oct 2026 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSGgWb0E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8BC1F00A02;
	Fri, 30 Oct 2026 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793362413;
	bh=W7iS3Fx6HV5ScNF/DvW83v1rNy7myS3fOAFqhJkCPu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSGgWb0E6AmiP/tcFEtpjVO60QzF8LSXfigUs5Tg+3gQ73tVxAEcHeDIOxvDY3CPy
	 vDuoJf5n0vop7GqdYjtCn/OFY/EAiIviQAEFNouIWp6clFimOSewk464KYx5JgMC45
	 tX9K326gCKDyJSqBbx+aKuPMyDKdHWZHdumL+wYIg+w2eTgWIWjM0zZ7ic9iNkuwP0
	 ALuFiHyZd7peiA1kB9BXyuWaszl0he+Ka32BkloZHcApkYCYFlzWy3QuvD/1/godz2
	 hID0WwoyTGAN+KHtoDqC0hDlagNGndQ8b/pPXGHpqrI4HMBVoiGzzqYAQ9U/6Qa9uV
	 HGN4BKvk0lSCA==
Date: Fri, 30 Oct 2026 07:13:30 -0500
From: Rob Herring <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <20261030121330.GC1232511-robh@kernel.org>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-3-damon.ding@rock-chips.com>
 <20261021133418.GA3889663-robh@kernel.org>
 <5892f99c-68cd-4ff9-91f1-af5ee024e025@rock-chips.com>
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
In-Reply-To: <5892f99c-68cd-4ff9-91f1-af5ee024e025@rock-chips.com>

On Fri, Oct 23, 2026 at 11:56:10AM +0800, Damon Ding wrote:
> Hi Rob,
> 
> On 10/21/2026 9:34 PM, Rob Herring wrote:
> > On Tue, Oct 20, 2026 at 11:09:12AM +0800, Damon Ding wrote:
> > > Document the eDP transmitter PHY with NaNeng IP block found on the
> > > RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
> > > so its node is modeled as a child of the eDP PHY GRF syscon.  Also
> > > add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
> > > child node reference to the Rockchip GRF schema.
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > ---
> > >   .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
> > >   .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
> > >   2 files changed, 74 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> > > new file mode 100644
> > > index 000000000000..afe7bc3d839e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip eDP Transmitter PHY with NaNeng IP block
> > > +
> > > +maintainers:
> > > +  - Damon Ding <damon.ding@rock-chips.com>
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +
> > > +description:
> > > +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
> > > +  registers, therefore the PHY node is expected to be a child of the
> > > +  eDP PHY GRF syscon node.
> > 
> >  From the driver, looks like there is a specific register range for the
> > phy regs in the GRF, so please add a 'reg' entry (and 'ranges' in the
> > parent).
> > 
> 
> I see. For v4, I will add the reg entry for the PHY node and ranges in the
> parent syscon node, as done in rk3399-emmc-phy.
> 
> The proposed eDP PHY DT layout looks like:
> 
> edp_phy_grf: syscon@fdcb0000 {
>   compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
>   reg = <0x0 0xfdcb0000 0x0 0x100>;
>   clocks = <&cru PCLK_EDPPHY_GRF>;
>   #address-cells = <1>;
>   #size-cells = <1>;
>   ranges;
> 
>   edp_phy: phy@0 {
> 	compatible = "rockchip,rk3568-edp-phy";
> 	reg = <0x0 0x100>;

The 0 address is not correct with empty 'ranges'.

Rob
