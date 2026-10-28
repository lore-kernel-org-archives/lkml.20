Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793157459;
	b=NzjR9Y3O9R5nuUJb6vtnh6G+DNUbbK1ko3Yx7pvc7PqzXmN6qYh43C3P1aANaGAM5dS7
	 mJEWfAmpeGii5f4l9nlX9vYkQ6ifuUN3uI4HQQDTG/MdW0fDx1IFGjlORemgTwM3/qbNm
	 vFKRrjM9FUilQFwZ4GKwd12Q+rXPZ8Tcf8ghj2i/6ektoqGmuYncF6B4/sV8HAsEraMVq
	 pE32kWBkBbBJrENKdcnxiVkSPYrUjeivWV5AD3iLMlSc6BE4m8poVGQC7VGGcdPC1Ktlq
	 2GkNzQMTCzNMkidwdqQWjfuNobxzWy21QEBOeZ9pWDNME/Avpwqb2+hviXbZ8stbvMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157459;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=EFrv6Pa4BPrddlHCmB54n5loYf7c/V8H/RjVJgli/4c=;
	b=pn8zyv9XrJoG9KNafF1vU9P3K1kT8bGW2CNscWA8af4jvbLMeslrHPHfLoUOnnkGvkXX
	 KfkYzEt12rI79sAvRe35/F+1imqBXklRo0DCXhCBInnPdujf6UqsQ8z8kvT9n8sCRi9Wt
	 ql45d5OQau4Vy8dHEj6U8zwc8iX+LQRbTe2PUbQYB2Y59VHs8JzzhMj58yhvqP65RvFBM
	 +XzjzzkLgfftFM66tj5CzMdbk2/Pz3VD1WhvF460oqYkOtaEeiQmJtqtROJlbkYdsi/Le
	 v47pRtbcP/6LCaSWRM+rq8d9k3GYYSeF7VSdDwNyWFgtNA1I1SfjQn1HG8t+pJtHi4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKZP3btS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A809606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKZP3btS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99171F01825;
	Wed, 28 Oct 2026 03:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793157459;
	bh=EFrv6Pa4BPrddlHCmB54n5loYf7c/V8H/RjVJgli/4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CKZP3btSr+dAeos9zr5C1SeVjjLGvtqoJ9xCWCEh/PkYvfd/cFqW5fIM6OP0HFYPY
	 n6ZabKYt2NxS+VM9Ryidhdz2wDCX3c2bwByE2g9v6+aywAcJkULq7Ezs7+lFWZgMcY
	 Aq7J/odJEGjU7KCSLmQTCnG88dECdcBGMmP/aJFq2poXBh7SXjZh3CxpcN2A97S/Sw
	 /S/+ioH38yoJgTjo6+V6Nv/c8TzVnEVQh84Qk9XGGwBlfygu+/ip4ynnr//r9t+oUH
	 ywkIcAfY/rQIqhQRJtgJYshWEIkXqQXuISCkmVUbKT44WMFD29C/hcVq/Run+xv909
	 BkV6Z2BpM+e6g==
Date: Wed, 28 Oct 2026 04:17:31 +0100
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable PCIe hotplug support
Message-ID: <yzqh2rx2wnawmjaznlv5znhefwe7zeuw4tsqv2dw2zt7ezzqop@nonbmd7dtjnp>
References: <20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com>
 <47cb0376-a4db-428c-9f61-341b134a8b97@oss.qualcomm.com>
 <45c1f8fd-1fba-44a1-8b4a-ff718f387927@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <45c1f8fd-1fba-44a1-8b4a-ff718f387927@oss.qualcomm.com>

On Wed, Jul 29, 2026 at 07:29:02PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/29/2026 11:32 AM, Krzysztof Kozlowski wrote:
> > On 28/07/2026 18:07, Krishna Chaitanya Chundru wrote:
> >> Enable CONFIG_HOTPLUG_PCI_PCIE to support native PCIe hotplug
> >> controllers on arm64 platforms.
> > Which ones benefit from this? Why do we want it in our development
> > defconfig?
> Sorry I should have  added all the details in the commit.
> Qualcomm platforms like Glymur and Hamoa have PCIe root ports/root complexes
> with native hotplug capability (including USB4
> PCIe tunneling ports), so CONFIG_HOTPLUG_PCI_PCIE is needed for hotplug to
> work on them. We'd like it on by default in our
> development defconfig so it works out of the box during bring-up/testing
> without every developer needing to enable it
> manually.

It doesn't just affect the developer environment, but end users also.

With the added justification in the commit message:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
