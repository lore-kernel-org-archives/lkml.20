Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE453FD2B;
	Wed,  9 Sep 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972583; cv=none; b=PebsL+CRFr2AMrtW+9bWi3F7NxJ/3rUIUdu4VQZk2nNGtbaxF3pNYzENKMChHIU4Hh64WeW/Ke3I9axgfvpoBZrSpdGUp7akWFj3nG+GGVL/Z4u1AHoLivVf566TTNXXibKt6JIb/NBLOeqJcqzaDXKl3F9j48JUqbsiDTpytAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972583; c=relaxed/simple;
	bh=bJW1tgJxo4gENcvU9KvW5CwFcvtaLi4Tvtj+Kg8yOTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYPQ8QLcUiGN3X2Ggqvh7NHvyL2oAhnbDzIgd25IVL0qH40CB8ntXDndWVhIqUq4JQfvhBGdpleO9INq6sbiBupaZ6NQ0mDb+5HPLtEcm2bFjOsEWMEsEhzDE5dS5iwBGhunztdaY2UhcmxRP5CiTeJSYT4r3y75w0kfeClDxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDdimfjC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDdimfjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5152E1F000FF;
	Wed,  9 Sep 2026 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972582;
	bh=CtmdG6WXQsfL+iqlX99cR+kUk06H7B+pqUNW8uqAW5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDdimfjC4kJnh2nelU1CQ87s2cKn5KwuSGaFlUT8TuCSMQzYokvf+LtOMEvQUEJWP
	 sJlkaFF2WM8ocTVMTycl/89Ej7MkFfAgRO3h1+jhPeAXMVy3E2kPACtmZsDulf8HrF
	 R6l+0vE+M3sfXKNSGZtXxMb97JoFsiqtknCNNxOWxYmsKI1rNK2W8UD869cAQ4N7Ds
	 jy9GvYpnUsqi0jKPlNrNqTN9/LOaEbFnmXKa8eoP5UY7jXCey7kyZrfa7vc5NLdnAJ
	 WH9dWyjEEaeNOQTmaF9JVMqCTPDVPtTncEbha3YfI4w2a/sZsdJoKXa/VCX9cgW304
	 IG1iAcKx5xwIQ==
Date: Wed, 9 Sep 2026 18:49:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Jonas Karlman <jonas@kwiboo.se>, Frank Wang <frank.wang@rock-chips.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] phy: rockchip: inno-usb2: fix USB gadget
 hot-plug on peripheral-only OTG ports
Message-ID: <6ly7ywoptz5ipixy65mh4bibf6cqj237nxa6ujuy23o3rvql3l@zxceopmephl3>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>

On Tue, Jul 07, 2026 at 12:36:25AM +0200, Andreas Zdziarstek wrote:
> Hi All,
> 
> I had an interesting time trying out the USB OTG micro-USB port on the
> Odroid-M1S (Rockchip RK3566) on the mainline Kernel. My intention was to
> set up a cdc_ncm+cdc_acm peripheral gadget as a hot-pluggable debug
> port.
> 
> For the most part that went swimmingly. Just not quite with the
> hot-plugging. The apparent first problem was that peripheral mode only
> works if the host is connected at boot time of the RK3566 Kernel,
> regardless if the dr_mode settings is "otg" or "peripheral". When no
> connection is present at boot, gadget setup fails with a
> "failed to enable ep0out" error and the port seems to end up in an
> unrecoverable state afterwards.
> 
> I investigated a little as to why. With my very limited understanding
> of the subsystems involved, I think I have identified some problems.
> All seem largely related to each other.
> 
> * The M1S references its 5V OTG VBUS switch as phy-supply of the OTG
>   port in its DT. The phy core unconditionally enables that on phy
>   power_on. From then on it powers its own VBUSDET input, making further
>   cable VBUS detection impossible. Also, apparently, after reading the
>   schematic, that means even with a cable connected at boot (and
>   peripheral mode therefore working), the board will try to back-power
>   the host. Seems my host port is pretty robust, luckily.
> * The inno-usb2 driver seems to generally lack DRP power supply VBUS
>   switching support? At least PHY and VBUS supply are semantically
>   treated the same.
> * The inno-usb2 driver's state machine powers off the Phy in several
>   places: on an initial no-VBUS sample, on DCP detection and on
>   disconnect. That seems to happen unrelated to controller-initiated
>   phy_power_on/off calls and looks like the main cause the gadget setup
>   fails and then borks the controller state.
> 
> My proposed fixes are in two places:
> 
> * set the micro-USB M1S port to "peripheral" in DTS and remove the
>   supply node. The board has two USB-A host ports, so device mode is the
>   most likely usage scenario for the microUSB and real compliant DRP
>   does not seem to be in the cards in the current state. Also, this
>   fixes the potentially harmful back-powering issue. (2nd patch)
> * keep the inno-usb2 phy driver from autonomously powering off when in
>   peripheral mode. This makes hot-plugging and gadget-setup without a
>   connected cable work. (1st patch)
> 

I'm not an USB expert, but your proposed fix does cause high power consumption
by keeping PHY always ON even when the cable is not connected.

To fix this issue properly, first I would investigate whether
rockchip_usb2phy_power_on() is called during cable connect or not and also at
the right time i.e., before the DWC3 gadget driver starts to drive the
interface. If there is a race here, it would still cause the interface to be not
up.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
