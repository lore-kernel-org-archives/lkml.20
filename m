Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9A43E09D;
	Thu, 27 Aug 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831264; cv=none; b=Keklv5cMINKdVaq8bLcrXcnFNNTSbQygn+iwxOKHX2Dr8mTck2W4bHlo1H3vcb+eWI+AdVUKi1XcTz3KUYcRR6Yy0PAAy01V9nZf/BRt7taP66yWHPsRdT+3nKnmcKkuY/UBWcAikH7FKB0m3kmqxzKi18eAknVD+VHIFZ4o+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831264; c=relaxed/simple;
	bh=ZATBeNjSFpBat2ahNrwIKVHAs5jnuY6nAl90N0asjb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQa3bJ47fR/syuniMHK9j+8ULmLshlcnvQXEI/SHTCOi2cykCMon0REh1Ob/Dn0QZde0lUrE8pnBZkNMe0U2UO/CXcxLFxGDG60KvOAlyI1DmuuPNsmgCub2ViUldouxyj0qJWeqVn6HG4fHwfg1uu91hp4QPLBASxb7SvlK0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tf5iJCD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tf5iJCD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006AF1F000E9;
	Thu, 27 Aug 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787831263;
	bh=ZATBeNjSFpBat2ahNrwIKVHAs5jnuY6nAl90N0asjb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tf5iJCD46D/gazs6x/ZQbcYUvRy2zVknJWF+v7NnGezwiKRO4VX7Evt+r6bQA1UrL
	 FLk3otlEtEH4j2pSMhrac+FT0J35DonHWn7ThjKSo8tIvahHtvfRX3Lv858X19IWgn
	 nhQ2irTR9X2nSqhTC+GFNfLRQgvVLpgtKWuclpEiteR9QCgyAPWcCIr43NIflzP74R
	 NgTOth6icqIZ5kkADjD//bL5RP8tZRxXlJfdO19XnmCSeNOQ68ADwFhPK2aI2bzApL
	 hhyaW8kbZXL0rqWNM+Z1AVQxpBHMObVEVEC5DI9y2ScR3q5Tf4ei7P9dU6bUVMl9R0
	 zVRhNH6z6N+AA==
Date: Thu, 27 Aug 2026 13:47:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Allow DSI and CSI consumers
Message-ID: <20260827-bulky-fanatic-echidna-0f3ffe@quoll>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-2-f1797634233d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-dcphy-rx-v1-v4-2-f1797634233d@gmail.com>

On Fri, Aug 21, 2026 at 08:02:30PM +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> (DSI) and a receiver (CSI) on the same PHY, and two drivers can use them

Please link/show the upstream DTS using simultaneously transmitter and
receiver, where the consumer does not know with whom is it talking to.

Best regards,
Krzysztof

