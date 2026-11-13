Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577564;
	b=GOSrFgRGjC8yLBIlukeC1+IyYgy+jVJCDrETOAZEvMAGa1i4yi+GIH6zNlzNZGxzhGs1
	 8U3ZSFPCVlOI8G7NgfEfwA/0zeXvaYyQgzWh+5xyin7sBlQRL6QFJfVnMr7BcDXNGsZll
	 /J6TvDzexXvpze/UaIIT9EkLgEYVS6CS/egSf66MWDMjYVXA2g82+1HD+Iz2qK4QBlojk
	 tuq7JqPA5+su2U6tc3PT+Xcm4Z3euz2nUyyLAJwjl5IorAQWG8bBIRdAoQfBHvu31lZlO
	 xs2T4TClPqkLwy9aFvhhSP0FM9ajvo+/Yq9Wu4f35oSy+1DkZkeOdu98/mStXh00wgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577564;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=bab0N+yEved2w0W90lFP2++NtYujTN45CVXQAOjD8eA=;
	b=jnUDkwvHyM1sXlULzsDCnHb5Ft6s+/rHvn9GF8Go8/UyTdAKEnluGGpqgz5bq3yh+z3I
	 SgeAehEe09Kg2g9AMN+fAEyKBBQyV/fSRGd3O98TWzV1oVF8mRruoZIfW5GzVhO/dM9ux
	 rWlAoq6OHvCOny/GInqyvmOe254Q1CQH5+5vY7ZHKaPURClJutFAJYliU1rImx6+Xe2x3
	 vzRaai+qwRSRuU7w+x9PjzDuG0jcVZZF51dU2jOB6x5PtgibbYgH7jxAz9GpCYSaf69ih
	 O6blVwJq2OYdbUKJsNh4ep096quy6Nnlbcl/0M3+N/h/QJAlf49A4BVjRC5keKbKEpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXbI+uNX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACF606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXbI+uNX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB601F000C4;
	Fri, 13 Nov 2026 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577564;
	bh=bab0N+yEved2w0W90lFP2++NtYujTN45CVXQAOjD8eA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VXbI+uNXGx27gfeM+j4qz1ZfFhbZLGD2M+vrBM3A2E6Qkit1YFLWkx1674RT+elpL
	 5k8LkNMqWxMa49+OTsQYQcItDCDieVU0elo7UK3G9GNsgm6XtQs5x+Xw5AyBdT9K9Y
	 pCWUDFKDCtXYbZ1iVOv7aZC97m55txbRRuGwBPM9yy5hajWUq9j3oSPXJxost9gFP4
	 vXAkCEuNPdZ5sBpEbTvFoIyem12e12qaO5MVOhYmVX6TBuOztW7dlGuBqeqLwLycuG
	 9J0iY1Uqw+I/0Z1ca6NIOlmwskUZvFRuhv+NsDEFhjqpx2bEKw9NAoqRmVWlWFiDXA
	 6pk0rpwjpW3kg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
Subject: Re: [PATCH v5 0/6] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Message-Id: <179457756031.652128.8747150770670489287.b4-ty@kernel.org>
Date: Fri, 13 Nov 2026 19:16:00 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 10 Nov 2026 18:19:13 +0100, Sebastian Reichel wrote:
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.
> 
> Changes in v5:
> - Link to v4: https://patch.msgid.link/20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com
> - Add new patch converting 480MHz clock registration to device maanged
>   clk_hw helpers instead of using legacy clock framework functions with
>   open coded device managed release handlers. This is a cleanup, which
>   also allows easy implementation of the next point.
> - Restore clock registration back to the original place, so that internal
>   users can access it early. The clock provider registration is kept at
>   the new place (after initializing the ports) to ensure the clock can
>   only be requested when either more than two ports are available or the
>   port already being initialized. (Sashiko)
> 
> [...]

Applied, thanks!

[1/6] phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      commit: dd341fe270a274f3cc9ed4218dee0e9aa25ad954
[2/6] phy: rockchip: inno-usb2: ignore regmap_write return codes
      commit: d5162b71dc6ebf997a9f64dab89ffd3bf9ebcb9b
[3/6] phy: rockchip: inno-usb2: ignore reset_control return codes
      commit: c855ac52ffe0df3e71943874ff28086e73e00084
[4/6] phy: rockchip: inno-usb2: use devm for 480m clock registration
      commit: 02d20d92bfa81d0198b318fcfc3527fa13401dcc
[5/6] phy: rockchip: inno-usb2: move suspend handling into new function
      commit: 13f67965a6a335811bcb9cac34042d4fde591d2e
[6/6] phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576
      commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f

Best regards,
-- 
~Vinod


