Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474625;
	b=doQx1Zp4bBktdbrYXHW4rX8FHdIO18NnopScAdld1pmxUDAXaJUbSeqaPDToQLHCm8eI
	 hyLhwK/CQBNSRCFmsyQpZqflPRgOLJoJFCTjBwff7xoFaVUzonyMGV84agoU+X+d3Zu+U
	 phIh0kQEzQhVZiGgMwkmYfL0WXXHYHWjP0paMiPtbk4gPvFjnQXYxrFxhMDoQhswmEZgi
	 xES9adMOqaPraVjAcRPnxs29pn11qzplW6MQ1DDAWxBVuqcOGus4hfHGhwFkUetbtMY0p
	 sp59mhT9WKvg6Z+Jdry5cSWZypC7RNheqlYWmgu6YBBBZcQglwlRP5qLqXi1uh4/LHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474625;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sCfFECzLvvhAY2i1tiIg9TOrVml0nU8W3C8bN7oLyvo=;
	b=sc6rRlgrPnkuBNGuRtO1zPCXNCAu3Q8STuyFTZ275fikuJa87kOi0wGGiYVT1x/MKg2r
	 B2sssAGSqOJP/M7OCPTaemecwHvVR3BT8upSmK22pzG27tuXpo7VrBk9f1E+AMxxEVxC5
	 EF9uTGly5REMMZcA0vUxKnPueoqyXOG4STHlKtHSObCTWRKflJADrcAV9Jv5vWM0n5ax8
	 QyhGVlk01bfKZ4Tf0xq2ERsuK3d2QvnpCI9VBVgyzM6S7RiFm7S3w7tbxensGzuYRCgyU
	 eLy6hMMmtr68T4iZQ6ZNhEAC0cJL9/vD6VxLGJoE4KRXhd4vrysQqVPdMz2944vBJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akAs5Zu4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F32606A323;
	Thu, 12 Nov 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akAs5Zu4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A859E1F00A05;
	Thu, 12 Nov 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474625;
	bh=sCfFECzLvvhAY2i1tiIg9TOrVml0nU8W3C8bN7oLyvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=akAs5Zu4x20BXS4RT3l5BXU1agjU/tq5TzFPKHtsK0n+0zbMiTvSM1QRLRrsj1zOV
	 HDQ9lhsg6OXUHNMBSr0X39fh5Cf3owuY0Va2t25OY1WWsJxx4j3vSssDfTLl2M4Ht+
	 XEDIM7N9cxcn9fKpmJ5nl2Cgyn7658VIumnYB60gaMNCFDPftErVR+2dosPXvAKESR
	 l4oJYLZmOQVrAzeQf/HUr0OviyvZ4PaqCsS+rqjqdyGMB/R2YV3Q0S8VRSrKkY4anE
	 P1ak0XK9xqGJ7Nx0WHoL3AiUvg81m8//+lyjdZi3+jOy8xOQedxH2MKeqr1oZpndCN
	 Du+U/X1eacr/A==
Date: Thu, 12 Nov 2026 10:10:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cylee12@realtek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v16 1/3] dt-bindings: reset: Add Realtek RTD1625 reset IDs
Message-ID: <20261112-flat-unbeatable-snake-171ad4@quoll>
References: <20261112053128.561149-1-eleanor.lin@realtek.com>
 <20261112053128.561149-2-eleanor.lin@realtek.com>
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
In-Reply-To: <20261112053128.561149-2-eleanor.lin@realtek.com>

On Thu, Nov 12, 2026 at 01:31:26PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add the device tree bindings header containing reset indices for the
> Realtek RTD1625 SoC.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  MAINTAINERS                                 |   6 +
>  include/dt-bindings/reset/realtek,rtd1625.h | 171 ++++++++++++++++++++
>  2 files changed, 177 insertions(+)
>  create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h
> 

I need to go to the driver to see there are no bindings there... Make it
easy and obvious for the reviewers next time.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

