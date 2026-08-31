Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55E23ACA7C;
	Mon, 31 Aug 2026 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158794; cv=none; b=GaU4AGgKYMwUA6t9FfLcdI+g1bMmkRdHRRQzHpXeq6ZAMRxetdD884E++A2c4/j30RtJnfLEPQqU0HJEAny4fsl6Vw8xNyysuaCKtaptYPa/jEWpTPjplHvk/skAqEIjj6/pm3cyRMAWxrPC8OIUnKlDpFvqL5ArzGFpG20aKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158794; c=relaxed/simple;
	bh=8j2UPxHbsbQKUt31JjMUVLrrajGaX1n7vJtbyO5pNrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkqEycyIxBFbNB5U8Vr4eZY3PJ1/9C0J+f5q3CMjoxpu/IhBJVFJSkrigyHpnOQ1FPVjpnXgdz7u1hL5fuQEb/xeIMcNoO7SXT7sglyDt9wlLqwefJvp8iV/KQRGGJuSdbnPh/7/OeQNrEhj2zrhnFRU1ga0FgMtEklC6tOon1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFWKOF5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFWKOF5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC501F000E9;
	Mon, 31 Aug 2026 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788158793;
	bh=yiCZQi/KsfPhos3m9UPBMLZ/6VRkatgenlxPmXeCU1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dFWKOF5JBsWRW0Ut0BH3FOS33DP30hPeVz+jynqpgAwHvHvEdyprLdM30wiiUPo/y
	 Wxr6BIyBzbL3bO31f86ZFFPq6rwAUN1Fx5gaGE84JwtpTtRbIztEm8r33Jgx1V7Ixa
	 ifulcECamQVwaC62/36RIFF0Q2OCmmyZzGCnM5SuExtFaDITDipDtGnWITU7urPabU
	 ip2IoqgjnAlnUmyoR1gPNKLWEkWCyLZbgSqNfp+Cpqr/zzwFdrbVSMBsQtZuoiuR8B
	 uYXNr2TbOr5JvUPrs6SW+IBoYbH7aFIuD2MKEiu2V5M5qxmtP/Y0FImDIX5K8oyNHs
	 aDiezMykhuueQ==
Date: Mon, 31 Aug 2026 08:46:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <20260831-visionary-capable-termite-3dae2a@quoll>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-1-ae2601cfa80c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-1-ae2601cfa80c@oss.qualcomm.com>

On Wed, Aug 26, 2026 at 10:32:51PM +0530, Krishna Kurapati wrote:
> eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
> signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
> low-voltage differential signaling (~0.4V) and requires a repeater to
> interface with external USB2 ports. Because of these differences, eUSB2
> PHY initialization sequences, voltage tuning, and register configuration
> are distinct from USB2.
> 
> Additionally, eUSB2 targets handle wakeup interrupts differently
> depending on device speed when operating in host mode. According to the
> eUSB2 specification, remote wakeup signaling in host mode is detected
> via different data-line assertions based on the connected device speed:
> 
> - Low-speed devices: the host repeater drives eD+ to logic '1' upon
>   detecting a K-state on the USB lines during remote wakeup (eUSB2
>   spec, Section 5.5.14).
> - Full-speed/high-speed devices: the host repeater drives eD- to
>   logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
>    Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's DP and DM lines need to be configured differently
> from USB2 PHYs, controllers should be able to query the PHY type and
> configure wakeup interrupts accordingly.
> 
> Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

