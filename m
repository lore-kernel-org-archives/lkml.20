Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BFF3B813A;
	Mon,  5 Oct 2026 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189033; cv=none; b=CwMFWrFOhZrRUH8REPzi02gra/LfU3LLGBGxfqjU04KG3QCG12Cpr7Ut/dE6vdXt3u90rtc6lE6aaV2MII51L4AOmzcEaipKWkSllRvvJmRGL5Fj3x7wODsOiThCnElvSelKy15cToQcizjtk8BtMFH9U67WMNJeRvEVYxm4RQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189033; c=relaxed/simple;
	bh=orrVNI0g9YrjYqi0fVKkOyk8k083bqjvDz8s/gHrVOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1CRTURZKkgcVDD+wP+xRyM42aK6L97AsgI6ctX2wlYjLR6bnBats0x7bI9YttwsbcOzFnDgRtzSPjtejo9Kuw//3+hisviryCbVjl+B4fBq0y4fkxNLNL2wqEC6JvQmznCylxE/xeOoZhwriMSijj24GghgeGURRCeKLnzBhak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mc6BgPds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mc6BgPds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EFC1F000FF;
	Mon,  5 Oct 2026 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189027;
	bh=N1Tdp41tcttMIXzEsnKaz7v2lLzbgncTRrts6HtrK/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mc6BgPdstjE5mHOMP9Ya3gYfkxM1G9DPWSSKfzHGlwaMcKj+ezqoYdXv7kfxGT/GC
	 OJqs/GNzf80R3VURsLMxkqwM7dWfJK4T5iqD1j8k9Z5NJpIZc76GEfLlzK8mXFUEIN
	 mqc1FyvB1KMU+TFC+H827L6eA8DHmaQmsZa7xyxQRzeMtf68Z3yQ1jOB8goX8cs9aM
	 T6kJXIkHI4tR+E+OLG1Uu221MxzfZdS7wB572QKdMl+GsTRSYU/GAfAe6OOHNsfjAi
	 5tcLGHhA0q0hjePPSsKc/eI+ZxvDOaxTvzcmHVkkjcMFK2j3CT9zKYBz4wsZ+w2B+S
	 uDf7pmmzAT7CA==
Date: Mon, 5 Oct 2026 10:30:24 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <asNgINDic6A3Gvtq@parshuram>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
 <asDFBIVf06-VaWdx@parshuram>
 <asJGziv0N3qtXo6_@venus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asJGziv0N3qtXo6_@venus>

On 04-10-26, 14:44, Sebastian Reichel wrote:
> Hello Vinod,
> 
> On Sat, Oct 03, 2026 at 11:04:13AM +0200, Vinod Koul wrote:
> > On 24-09-26, 19:25, Sebastian Reichel wrote:
> > > Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> > > if the configuration changes or cable orientation changes. This is a
> > > problem, as the consumer device will run into undefined behavior.
> > > 
> > > With the new PHY notifier API introduced in this patch, the consumer
> > > driver can hook into reset events coming from a PHY device to handle the
> > > PHY going down gracefully.
> > > 
> > > Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> > > the stub functions when GENERIC_PHY is disabled to stay consistent with
> > > the existing ones.
> > 
> > I dont think this series has the usage of this.
> > 
> > I think I am still not convinced why a phy should notify as I dont feel
> > we have any mechanism to notifying. Checking status and letting people
> > know if not really a notification mechanism... Maybe add a status call
> > instead?
> 
> This series contains the infrastructure and the consumer of the PHY
> reset notification (dwc3 rockchip glue driver). The producer/sender
> of the PHY reset notification is the first patch in the USBDP part 3
> series. I grouped the patches like this, so that this series has PHY
> patches followed by USB patches instead of PHY - USB - PHY. Patches
> must be applied in the exact order (i.e. first the patches added the
> PHY reset notifier infrastructure, then the DWC3 notification
> consumer and then the USBDP notification producer).
> 
> The broader picture solved by this is (pre-existing race condition
> issue in USBDP):

Thanks, this is helpful to understand the context. Few questions on
below to help me understand more...

> 
> 1. USBDP PHY provides critical resources to DWC3 USB controller

what resources are these?

> 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
>    which means the resource is temporarily not available

Who invokes reset, I guess the controller (dwc3), so it ought to be
aware of the reset condition.

> 3. DWC3 accesses its registers during the reset -> SError, because PHY is off

I would assume that dwc3 should know about it as invoking entity..

> 
> This series combined with the first patch of USBDP part 3 changes
> things, so that it works like this:
> 
> 1. USBDP PHY provides critical resources to DWC3 USB controller
> 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
>    which means the resource is temporarily not available
> 3. USBDP PHY driver sends pre-reset notification
> 4. DWC3 goes into a safe mode after receiving the pre-reset notifiaction
> 5. USBDP PHY does the reset
> 6. USBDP PHY reset finishes, USBDP PHY driver sends post-reset nofication
> 7. DWC3 returns to normal mode after receiving the post-reset notification

> 
> This avoids running into the SError.
> 
> Greetings,
> 
> -- Sebastian



-- 
~Vinod
