Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490863;
	b=Pns4VtNrhwTv/gUcrROCympl3n7Y5urcaVN4N2ftQi2M7iSDQwD5Lf+yZfXSITew3HVT
	 YA+54vDkdxyXD20itW664JauxqM5vSSeNXTRaT/K3eSZ+FKkdBLiaUrBAhhmPmCEzcUpp
	 Ba+nb2l+hDpKdVft3d0MH5qhFBPR53jTmSIJTTBL2So8c0PIbCa+gs9PAxNUrjn1vhoUl
	 9/Z/icHZ3E02VdYliov+ae1D1tywV9B9pRZSRRoqAPyXoiUwTIUProSz4AHxekLMV63eI
	 SA2p3wMOoBW52u3P4Kl2R//JjChHwUJaiIPhMjXl/dL5a9eXQVUY1fcot1TY/WiIyjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490863;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zcZOYtsVTv31lVYaNP6RLbKLvR8+yhhBm9mhbhr/iKE=;
	b=B7+IsURkPOG903rPP3UOcFc5Lo7c5p6cwmQSsaY1c79XHQvkFFCRKHK6xxVieHPOIq2X
	 CGDrFtYFsEjpfFXBigiz0quOemFeKGZkw8rv93GGWqUxadqe0QLkc7JRyzG0nxF3Li1Uk
	 jgOc9r7b13lXXP6kt7rTKRIIZAxPWGnHKOkDnh9SYq48HlMhAuyzs+KJEm5Ge4K515HTv
	 FHEUcbmR87klXleHdUn2zXHQI30U6Ns+AiW9gc13ERu1vcCi8cPcmAjkT8z06Wz48FBuN
	 xTKKvtha26mbtswhy0VsAAGjCF5BseQtsrRzvsh9y1i37D4aLk7WM5SeBDAcNgr9G8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yonu3wmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C995606A327;
	Thu, 12 Nov 2026 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yonu3wmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB38C1F00A05;
	Thu, 12 Nov 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490862;
	bh=zcZOYtsVTv31lVYaNP6RLbKLvR8+yhhBm9mhbhr/iKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yonu3wmrYZO8QH3w1HXbsKpwGYVcENzULirtc+rC4xIhTzxXLe8imyh9Wsy+ItVwd
	 hBl+SPQuH39iG8rpqFyAQ74d4UzPaV07pGSCOB28vRxa1+zx2HbmHl2HwkXEZiC5FV
	 2Ju2NdqmaRS6aAzWIyDH1qU5TAlYWns+gGL0Kf5AbK43+c3NDoXVayjIFKOSQsK+od
	 FEc3DT4RbjS8MqKXnAy9xJppBHvp+WF28kcptd3ykeZ017qen8Nftwz21ZwL18j0CP
	 cK6nlnzRa5dODjVazj/M9h4B7NCVTp9EzoOX3bm0Kh8h8j01eubv/h+kWEFXnXkjHA
	 r9D+pUlHgkl9Q==
Date: Thu, 12 Nov 2026 19:10:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <avXB6ga-QVfks8RF@parshuram>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <179353091270.2955.16595397888583885694.b4-reply@b4>
 <aufM3PCuU9CM8zFo@venus>
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
In-Reply-To: <aufM3PCuU9CM8zFo@venus>

On 02-11-26, 00:46, Sebastian Reichel wrote:
> Hi,
> 
> On Sun, Nov 01, 2026 at 04:31:52PM +0530, Manivannan Sadhasivam wrote:
> > On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> > > The recent Rockchip platform have a combined PHY, which does USB3 and
> > > DisplayPort as well as muxing the lines in arbitrary order. Changing its
> > > enabled functionality requires a PHY reset and as the PHY provides a
> > > clock to the DWC3 controller, this can result in an SError. Apart from
> > > that the PHY might not start up correctly when the DWC3 PIPE interface
> > > is running. This series prepares a Rockchip specific DWC3 glue driver to
> > > help out with these problems. To become useful more patches are needed
> > > on the Rockchip USBDP PHY side, which are send separately.
> > > 
> > > This was split from the USBDP cleanup series. v17 has a dependency on
> > > the patches that have been merged to phy's for-next branch. There are
> > > some additional Rockchip USBDP phy fixes, which depend on this series
> > > (which is effectively also a fix).
> > 
> > What is the merge strategy for this series?
> 
> I see these options (ordered by my preference):
> 
> 1: Vinod merges everything; the USB side is mostly a new driver
>    and thus there is not much conflict potential

I need ack from Greg for that
> 
> 2: Vinod provides an immutable branch with the first two patches,
>    USB tree merges the immutable branch and the remaining series.

I can do that

> 
> 3: Everything is merged through USB; this would block the final
>    cleanup for USBDP from being applied for yet another cycle.
> 
> 4: Vinod merges patches 1+2, USB patches are merged one cycle
>    later and final USBDP patches are merged two cycles later.
> 
> P.S.: I will have to send another version for the correct Sashiko
> feedback on the DWC3 side.

Ok

> 
> Greetings,
> 
> -- Sebastian



-- 
~Vinod
