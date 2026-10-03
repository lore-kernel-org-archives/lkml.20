Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338415AADA;
	Sat,  3 Oct 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018258; cv=none; b=bDn2tm0eTKijoWv7PBRbLObDz7UCzAVaJUbgJH6VU/OcJ0+idpN//5XwnStMWpXdvSG6pr8NnL8lsA9swR6s8yHvBvccJC2XQVse/+PnGTcWPGn/4etjYwsNTjpxjVDRK7x7FQgdVsITF9mXO5qkc1fzDJVNS6n9H89lbnzwYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018258; c=relaxed/simple;
	bh=ZyZJjnr5eRJN3iSIUjLND/Ee9PPKHJieA1H/6WPsSiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZWciurkDu4LOKQmQXURhDa1M+ky8j+nyHT161M2rflrYGaq7PgAZV5bU4ZEKj6gf7OzuKNs2a2/VEUDeYhOibwZaNpJ75XJ2NX7i5gOFwpUFd8+2w5JsZc/FsDhdc2Mzi9gOTuDP40AI9tlKSlJiAu6xR9Aph47MfgLIHFmGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifsv1HpT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifsv1HpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F81F0089C;
	Sat,  3 Oct 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791018257;
	bh=r7Cqps3I7ChVDkfGpYIwv5W5QyZBtV/wchFikLgUd30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifsv1HpTllRjuu7fRpQtXxhQXDdrFcHAzARMmhx+d0R+gZ6eAYie2pV4O1aXnLYOY
	 vcZGUlC2cwlJOCpajrRIorSilCW1DUSoHoNzVh4IjzXfttEYPC1lcrmHYlmHNCEfmN
	 sB4ziC3sjmt/onjTlQUba1XPFTYQpeX/65W3ivSDa9DWoNETMRLMf7ksu0Ii1TFhOr
	 YiBszfZok4J5UWgbDyHqJhYfpcw3dcPFjIzGSa2tPD6UNa1RG1T8ON4zenRDVfscgH
	 qXc44TtRs8L5/6mxVvELB0rVqEE2ltB5etHgXfPHBKvszaQU2GF7oPWaCe2hEFPvwX
	 5jQl56+Y07PTg==
Date: Sat, 3 Oct 2026 11:04:13 +0200
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
Message-ID: <asDFBIVf06-VaWdx@parshuram>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>


Hello Sebastian,

On 24-09-26, 19:25, Sebastian Reichel wrote:
> Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> if the configuration changes or cable orientation changes. This is a
> problem, as the consumer device will run into undefined behavior.
> 
> With the new PHY notifier API introduced in this patch, the consumer
> driver can hook into reset events coming from a PHY device to handle the
> PHY going down gracefully.
> 
> Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> the stub functions when GENERIC_PHY is disabled to stay consistent with
> the existing ones.

I dont think this series has the usage of this.

I think I am still not convinced why a phy should notify as I dont feel
we have any mechanism to notifying. Checking status and letting people
know if not really a notification mechanism... Maybe add a status call
instead?

-- 
~Vinod
