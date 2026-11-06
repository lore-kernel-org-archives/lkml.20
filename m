Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966829;
	b=uL5IyGwx1/LiH5MZCaIAAYok5vgLs7qSNble13vorEa/B2HtNT/cSgC4UJ++eFHLI3M0
	 ZWa3/Izt3MfVdqJpUgLFXQmyWgkx0mfXftLCgg7seusFGq8JUu279E5AIAy6fsQ0A4/P8
	 lTj6VpeykJq4PU0ZHN/ZAypirIiGFX9TGi3V3UwoJViLSc4KLxigWPj9bBpSKtYsiUa1U
	 SWn9ifw3xTWcznVwVMSAn4Q69b43vx6AwoCA2xp2CxZGGjUmF2a5Rpk+qH6KK4arZYkCe
	 4jKgqNjWYlb057Z3cRtMiBBgASe0uMcdh6O1jgwwLaPo4etdpybtW8NzEbYmBK/vB+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966829;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hQArWZ2nJ4tUg9UwI0026s5MUwQ8Koaiyp0KnkcV9us=;
	b=GPtItLs+8U5+hfjRY6dQOcxtKnN2/7wmfEEygZ+W3ZfILxeReAifs2XvNXcQ8NYI9FPp
	 oc07lPCDiGvY0hLOOw6aoymgRRGAXVsg4vpg7Vw0E5MuPwpMxiG3N7TqnBBpJKQDgNwSU
	 I6g1aEYFyAdaWdtUDPsugMXUTR0di7DFRFwaXr5muYyW91femwY/yglHE/2hONOB+W4iS
	 SzDDijvvq9JeVFG1uFDSJTEdp+tMuD7RbPA/wPyNGHzxkfELp72UUZW1q39akCR2yAERc
	 f8oj4HFDS74lDuV2ZUeOvy/5W6pR/LoFnB5a9wK7xNOueGnn1J6dQdnFBJt4bYL3K3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTYH+pXW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4B606A32E;
	Fri,  6 Nov 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTYH+pXW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEC01F008A1;
	Fri,  6 Nov 2026 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966828;
	bh=hQArWZ2nJ4tUg9UwI0026s5MUwQ8Koaiyp0KnkcV9us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iTYH+pXW1fl4l75IlJ9re65fWhO2CmdTJjgnolNlbsgkBxAoLyqOvzwbYnFJE1er6
	 THq0En3x1ilSJNMYgQoiHktRFjrra2cUG7ZmZ+lV+H6vxlzTJFbATJkxQM6pUTLlqh
	 L3Hg/7zSrUfSBtXNOCB2N1gFtmx2sCMpo7b/4wyZV6ZsFAHDe5H6oZwxZ9GyDjkotU
	 CiufXBxvQFE7mQ4nRJDQI/C5j/aPUSH4UU0eoHQyxof2CS9BNACBE8fEQ1ItGGngVU
	 AiphiqiVS2uLwiQcH6piOlvKDAiuWJPrBSJeQsgT9XjHlViHQHh8r+8a1rM2GYVx+F
	 fHUKk2or9oFIw==
Date: Fri, 6 Nov 2026 13:07:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com, 
	hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, jigarkumar.zala@oss.qualcomm.com, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: qcom: Add common qcom,csi2-phy
Message-ID: <20261106-pompous-auburn-locust-e959bc@quoll>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
 <20261105235137.2635442-2-anusha.nandi@oss.qualcomm.com>
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
In-Reply-To: <20261105235137.2635442-2-anusha.nandi@oss.qualcomm.com>

On Thu, Nov 05, 2026 at 03:51:34PM -0800, Anusha Arun Nandi wrote:
> SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
> devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
> clocks, single "top" power-domain, vdda-hs/vdda-lp supplies).
> 
> Describe all three with a single qcom,csi2-phy.yaml and a compatible
> oneOf, rather than one standalone schema per SoC. QCS8300 is further
> required to be paired with a qcom,sa8775p-csi2-phy fallback
> compatible, the same way other Qualcomm bindings express full
> hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
> this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
> match entry rather than carrying a duplicate one.
> 
> qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
> (3 clocks, 3 power-domains, different supply names, DPHY split-mode
> support) and is left untouched, but port@0's DPHY split-mode
> definition (two endpoints, lane-count constraint) is cloned into this
> schema rather than dropped, since this PHY supports the same split
> mode.
> 
> The supply names are vdda-hs/vdda-lp rather than the hardware's own
> power-rail names, since those names aren't guaranteed to stay
> consistent across future platforms using this binding.
> 
> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

I do not see how you answered my questions.

Dropping from DT patchwork.

Best regards,
Krzysztof

