Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A24FC8E5;
	Fri, 16 Oct 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166822; cv=none; b=k9geJfZD5IrhYp1eBdCZZb7YEjPHzZeqw85v0anOkH7OE1YKZIr0PJCCc4oLWr29fZ62WKciJ33f8w0rGuB0Ik2D2zKgcYekpraeXJU1bisx4tu2PQdl0eYXWZiKmhhqMik4jo79W4Pq9uTxJUJkEO0nEPwbJBhIZn9QEhEiEp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166822; c=relaxed/simple;
	bh=9sHF3JRaXcIWL09bXPLmsqW1Z21hCdeAHOj00DITeFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOR/ywIgKmTlDXit8wGMDarufmm8D4VrS/pULHc/JJILyELTif4pmNAmQFmptliV8T6ImZnNVIBWH9prSdbjZi/O4OloNzx4w0NkYSbkRtr+nbDUJOYkm+I+hagMx+cqNVV+CEFlg8qTFQDtWEVpGJUcAx6KfR3+1FAsVGoK8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkSL-0000000086k-1X6n;
	Fri, 16 Oct 2026 16:06:53 +0000
Date: Fri, 16 Oct 2026 17:06:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: add ISP nodes to rk3588
Message-ID: <atJLmq50uRVfeuyX@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>

On Thu, Aug 27, 2026 at 07:48:34PM +0900, Paul Elder wrote:
> From: Xu Hongfei <xuhf@rock-chips.com>
>
> Add device tree nodes for the ISP and their iommus on the RK3588.
[...]
> +	isp0: isp@fdcb0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";

Three interrupts with two names, while the binding in patch 4 has
maxItems: 2 and isp1 below lists two, so dtbs_check rejects isp0. If
134 is the MIPI line it needs a name and an entry in the binding (the
RV1126 has that third line and the driver can use it for the CSI-2
receiver errors); otherwise drop it.

Best regards,
Daniel
