Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630779;
	b=VnCMu+JuoK/hv5ITbZKjajZInrRuha3M0i+ooQJ4KOgp4M+Hr1Mp/7KTEsnBqlEo2ee3
	 XVO3fYE8rVq7Y2nw1b+7olgbqiqlWSnI7xI2sze17XikXZqvj6gBvEmVg+eFA+8CHI1H6
	 sVVmMQGm+P4eNB10lIIVFztFc19cJIbWHT26klnPFzB+EpffNaeEs5Zz2KkeV7n7F2S2c
	 cx3kmmRVTceVWXXVxne7ZopI9muf6wkF1W9xwL57EjJkB6xh2wNSh7yD8H9okG7+MnX8t
	 k76REODZO33kMzd61w8ZzBnXZLTskGKMsaoD9grLs/Tsxz91lEcDGNyty6xxrW86g0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630779;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1ed4ABVb5WuZx7ievrj1cvm+vrmzhLmj5yV4zTMhJQg=;
	b=H7anFyJhF1AfUIB7kK3FEYrboJ6ZaXDrBoukqHlBIzUg0EacplifF5Az6C++EbWf4uN8
	 pr84sSiFR8icjzNrWiRQrLpeTVOllK48t0TIdvhBYRy4cEobT5xdGrL+PbTI3JlOci72J
	 t53m4CNVWKNb1+32aaj120/D2wrRCMzdacxd2kS6vhjLm7Ffl+KtA+VPwlO4daDQEIXf1
	 18Af+W1s31h6pYn0r3Yq620lKA/QJhFuNai41mBkhNoeLqKh2bEhZXTNRqYX7iioSSlui
	 c2Nr1sztLxSNhNxUU8fLrJLyMSMUaDU2FDL2aSeWKlLNPd0KOrn2WAW7a/8/o9vAh7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTIJkYx9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A283E606A901;
	Mon,  2 Nov 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTIJkYx9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E231F00A17;
	Mon,  2 Nov 2026 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630779;
	bh=1ed4ABVb5WuZx7ievrj1cvm+vrmzhLmj5yV4zTMhJQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kTIJkYx932KW0rEFWbZ55+lbTtsZKF+4aG6/wsWGYG04/dedotlgN7zujoh8O2jQf
	 z+v8UjodVuo6CFRkW679nsHC4p/DPLC4jCFE523SoM4wk8cUzXSXbnZVaUMoCJZXuW
	 H7iYQvsi75Ucn/GauIsg7HpX1mHcJ3IuY+tXkV7YDSJu67E7yGUYsr0Ucvq2KDygtH
	 1ZYEkQ7mdXkmN3HmICVak/FMRLN+Vy77pVLZFXMKyUiGTLR2X60Yuk+8uWN/N3swsi
	 c+MBOCgIpfmjr3DeQn+wDTIRHm+vegoCu+ll1N4Ajue1ZEef9SKd6+TFT5wGzqqYYc
	 +SCxPpRiNg7XA==
Date: Mon, 2 Nov 2026 08:46:16 -0600
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261102144616.GE1232511-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
 <20261030182151.GA1206797-robh@kernel.org>
 <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>
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
In-Reply-To: <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>

On Fri, Oct 30, 2026 at 12:14:52PM -0700, Florian Fainelli wrote:
> On 10/30/26 11:21, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> > > Northstar Plus uses the Northstar Bx PHY register sequence but also
> > > requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> > > clock enable.
> > > 
> > > Add an NSP compatible with a required USB2 DMP phandle. Describe the
> > > shared PHY relationship with EHCI, OHCI and xHCI so initialization
> > > finishes before any host starts operating.
> > > 
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > ---
> > >   .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > index 7fd419db45d0..00d69b86cbff 100644
> > > --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > @@ -14,6 +14,9 @@ description: |
> > >     Known B1: BCM4707 rev 6
> > >     Known C0: BCM47094 rev 0
> > > +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
> > > +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
> > > +
> > >   maintainers:
> > >     - Rafał Miłecki <rafal@milecki.pl>
> > > @@ -22,6 +25,7 @@ properties:
> > >       enum:
> > >         - brcm,ns-ax-usb3-phy
> > >         - brcm,ns-bx-usb3-phy
> > > +      - brcm,nsp-usb3-phy
> > >     reg:
> > >       description: address of MDIO bus device
> > > @@ -32,6 +36,13 @@ properties:
> > >       description:
> > >         Phandle to the DMP (Device Management Plugin) syscon
> > > +  usb2-dmp-syscon:
> > 
> > brcm,usb2-dmp
> 
> That would be inconsistent with the usb3-dmp-syscon property that is
> pre-existing, hence the name chosen here.

I'm not sure consistency is really better here, but okay.

Rob
