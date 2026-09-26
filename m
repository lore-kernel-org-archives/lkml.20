Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458C254B03;
	Sat, 26 Sep 2026 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409114; cv=none; b=LFL9kZ8EoG0jJ0A1qZTazopwvL0uyLyjX4PVWKKnufHbznB6n/GvNwwnwW3UDeMKjhJ0BML/3MG8z+u35T6VOd/f2ZO9Aa1Cgu13BBpzYYxQy8o//kkaCX7avQ/M0qxPz08OLumffts7EM5P0sPRBEsCin/hQPdj0FlRI0bezus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409114; c=relaxed/simple;
	bh=8DRxHSPFRZBqJacBgoyZX7LA7wjfehxCP3aElo65pwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZQdhj+qv9H2SA8adeq1LwG0x7GjJg7YCP2q2KEDalV7R6YQUgWx9sWfr5bjA9sHmCDO3UfEoO9Ie3AGpSQF2dcCMwABGt3a1yCBHr1rRNI5DnnuYSOzf//ImZGWNyiAO6g7t4lg38HT0wmYVMETWUzdJ5EblDQda1tAWHXbFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROLQiP8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROLQiP8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560021F000FF;
	Sat, 26 Sep 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409112;
	bh=2ZjpK0JF2cbHk95sp5z75srSxbkoRMjDiFL2rI+O++w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROLQiP8aWqQQ69Hn/WkAeq1snYbT8drZS+6o19Ia14LkQiCjM1vr1ZvQfzKYQTXKK
	 EqUIJHbdRUlY4NSV8Z1FeoNE23zwF0QzFXFH9VFg51Ca/WyPCQ2PD6XHE9UxBEbRoc
	 IVi5PG/Wy9e8NixqFQi/nBnLIh3b7LEo3EkzntQrAWnNeMoHhndkR1kOmsAEqEzWql
	 xEeKz0leX6MpQYE+IiPN28mfQpOy2jep2cTrTjQ9qSLtclI6cbtASZMercHGtL8eJ2
	 tgN6SUC2+OO2qB7f0fQU9N5Yt7I81BSJ7C36SMn4DEbyOjJyjA1U3EtOPglZpDgibS
	 vAfMT+VeamWAQ==
Date: Sat, 26 Sep 2026 09:51:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 4/6] usb: dwc3: rockchip: support PHY reset
 notifications
Message-ID: <totpimqouuaa4lysn57ga36y5u7htss5kju26s3yi3ey4d2vmr@4vpymy6enqhi>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>

On Thu, Sep 24, 2026 at 07:25:40PM +0200, Sebastian Reichel wrote:
> On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
> with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
> the mode changes, which may happen when plugging in different USB-C
> devices.
> 
> If the USBDP PHY resets with the DWC3 IP running, its internal state
> corrupts resulting in the USBDP PHY not being able to lock some PLL
> clocks, which effectively renders USB3 unusable.
> 
> To fix the issue this adds handling for the new PHY framework reset
> notifications, which will assert PHYSOFTRST before the actual PHY
> is disabled and will deassert it once the PHY returns.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>  # PHY

- Mani

-- 
மணிவண்ணன் சதாசிவம்
