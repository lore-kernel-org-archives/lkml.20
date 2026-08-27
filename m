Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302C407CCF;
	Thu, 27 Aug 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847179; cv=none; b=JB9u4JV3s/5TNVtiDygAP+jornfTPFTgkJFxlmM/kyAs8QRz/+SonNVkpsOIKN9jZMAL0mD00+P6IyLynqMprwO+WKkq7LtjmNGiYYZmr8jjfdbEClSmXAemPl+++tvcAB4RDwN1pggyFWiFDxMZgpzGStRqolv8d/irtfu0h1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847179; c=relaxed/simple;
	bh=ksGKCNUICZYCJp9IprUQndpe0BAig1MaLC4B2XmIBRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ln+gAvyk+Xh5//zqOTW7OMaH1lRGVigjaSznQLXnvTKGb1UvRiUvVBeWcTTvYtsLa2hxtJyAGEGDRr/h08gm58LK8bgDUZg1mDCxZRGyyaaNH1dh6Y6T3rcGEWYBzmHGwFiDKOAuC2jikezyDI94qddK9Q/N1QiifVbZjVarPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaHaCd9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaHaCd9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BBD1F000E9;
	Thu, 27 Aug 2026 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847177;
	bh=bW5p7sg37lG2e7fiC+a/D7ld9RprkWkK8hWMZ55d2KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WaHaCd9Nu9G4ArFwXjQgTuCAqV3k/KIa6ykHqQucoty/1nkrunZyB0pBKCdvzyJ/A
	 Ls2T/PweYhD5O5dc0IvmDhpc//CpGRjKLtQwXvnZNApHJ4+San/oHDey2lgt8tYYIQ
	 Wl/fwE5FKLGY6pU3hYawPK45QoE5PUIg3rk3/jnNZMhHyJV9ywEJ5AV1LRaCeZRnLS
	 JvoBdUyNriec390XSIhLPFBHvHh2vJDRF5on5TaUqE9NlaPNDlyiO3ESQku7P8DKS4
	 WL3MMZH6HwQ5IIyFw5XW4oKVAs8A0ItiLN3J3PrRrwL93PdmPUTbsJcgt3xEOX6yot
	 ycpe+kcOu0hag==
Date: Thu, 27 Aug 2026 21:42:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Igor Paunovic <royalnet026@gmail.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <apBiBTE-xxmsCdY1@vaman>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
 <aoTMQtpYYw8O-3cj@venus>
 <kwncmhsrq6sr56rsgf2ng4pc5fvyyqfryp3s2qfskoxunxx7jp@pdq4kedpw4gq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kwncmhsrq6sr56rsgf2ng4pc5fvyyqfryp3s2qfskoxunxx7jp@pdq4kedpw4gq>

On 19-08-26, 05:31, Manivannan Sadhasivam wrote:
> On Tue, Aug 18, 2026 at 11:42:50PM +0200, Sebastian Reichel wrote:
> > Hello Mani,
> > 
> > On Tue, Aug 18, 2026 at 11:27:07AM +0200, Manivannan Sadhasivam wrote:
> > > On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> > > > This series does a major overhaul of the Rockchip USBDP driver. The
> > > > initial main goal was to add USB-C DP AltMode support to the RK3576
> > > > and RK3588 and this series still prepares the PHY driver for exactly
> > > > that. But in addition to that I uncovered a huge amount of issues,
> > > > that are fixed along the way. Some of the more interesting ones are:
> > > > 
> > > >  * Currently the driver might trigger a fatal SError on USB-C hotplug,
> > > >    since re-initializing the PHY stops the clocks going to DWC3. If
> > > >    the DWC3 driver tries to access its registers at the same time the
> > > >    system will crash.
> > > >  * The DWC3 hardware can get into a buggy state when the PHY is
> > > >    disabled, which results in the PHY not coming up properly again.
> > > >  * Swithcing the USB-C connector orientation during hotplug breaks
> > > >    USB3 speed, as the PHY is not being re-initialized.
> > > >  * The code always enables DP mode when USB-C is involved.
> > > >  * The driver has some locking issues uncovered by Sashiko.
> > > > 
> > > > In addition to these bigger ones, Sashiko also found a bunch of
> > > > minor problems, which are mostly harmless, but were fixed while
> > > > going at it.
> > > 
> > > 38 patches for a single series is too much to review. Please
> > > consider splitting it up into multiple series not exceeding ~10
> > > patches per series. Thanks!
> > 
> > So let me summarize:
> > 
> >  - Vinod wants Sashiko feedback to be acted upon
> 
> This is fine.
> 
> >  - linux-phy does not want series with dependencies ( [0] )
> 
> This is not something I expected. I read the reply from Vladimir in [0], and
> he seems to be sharing the limitation of the build tool of linux-phy. But I
> don't think that's a big deal. Every subsystem allows sending dependent series
> as long as the dependency is clearly described in the cover letter and now with
> b4. So I don't see why linux-phy should be different. If you combine all patches
> in one series, it makes it impossible for a human reviewer to review it
> thoroughly.
> 
> @vinod: Can you share your view on splitting the series with dependency?

I build locally when I apply and if there is a dependency on fixes,
cover letter mentioning, I do merge fixes.
So not sure from a process pov where the gap might be.

Builders are helpful for review and checking sanity :-)

I would say it would be helpful, if it was split. I can pick fixes now
and get that in for rc. While the rest can go into next

-- 
~Vinod
