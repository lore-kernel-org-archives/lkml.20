Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837264;
	b=DXVyW39oPS5+DifFp01t1XcyW8IiRkPQ5hUcNYbEArzq/ZCrev0IofvgpBxiMwFqjqAe
	 uQ8cem4g4Ozo2orklWQ/8QYxtd1ALZt9UwMw8HlfzSItwkzqW1SzCAkDJkBBWbB0S1UFF
	 rd/iFyE7IXYFHwrxv129ZBWDnPYuEhLJKVCQ+rdTO+bvjlqf88DOz2mdAfihvLHf/MDBM
	 0Ge1tW545Zpr+NKRCdVAPVRl5FRZ4fPqAplc2N4G+TlWvCrjCRNTgf1DAySYzdSe4auuF
	 EjDqSsoAO5QjIWq/+mZeRhchQCTPRiryzfik5I7lSA5jXTp6blbqvZvIOTnbBC7K0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837264;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=k4jv5NdXLu0P7F88Sc8qj9yaEW3bOEGqP7oXpHPJc/g=;
	b=l/YK30XbrcFExsGJosiPPUd0+IPba+Ty9Fd53Bce0EGbeliayU8ROcvgik/7ZSSzFPpt
	 7phKUL0E6eD6t1XwieLckSZzU4narPF+NAwNNtSksI88kIm4WPHG7i18jTBa3a70jixYc
	 aKVLzDuSqS2QWciXOi9sTx06H86dELlM5ftO1lZi4X9sNFjyNdc4HhCoGlm21g9BFlVEt
	 Het2LJkZteVczZmCgMxafLrLJXuDW1qZR5/nzBWmMCZsxU34A4YbTeavB/zrsN0o7OMyk
	 Ydp77+aUj/PgpFK7mSOYQC4IEEIdEMRHJjYABrQwJHBL2818UqZwfckQga6zFUCU8Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIAkH6oC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8FB606A8B3;
	Mon, 16 Nov 2026 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIAkH6oC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55B01F000CD;
	Mon, 16 Nov 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837264;
	bh=k4jv5NdXLu0P7F88Sc8qj9yaEW3bOEGqP7oXpHPJc/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FIAkH6oCSL8DS1A/rXBXqFBTRyPxbJb05dfnhSdkZJYJKCiah6fSPUPjaUDkNERux
	 STY3g9tkWp58vqA700LSI1JkQy0IPlZhKrmudwdMEdDeJbX/v9E7mk3ooFOSi9eouz
	 Xld3bF67DFQxLMqyVcAe5y857wr/Sr9/wiyLa1hkSqa8IvkYCCUcLzmKWRJd192HQl
	 Ef6zN7bYCF7P0TiRzf9ENaItubav3YqaX1XD80HDgfZ/qFxy7zVik31VUmHXpdksY2
	 yIiQiLkIoAajU6kX90eyCW5QetNMsBv5nrc3qd5Ju1XgbnAa9VZZMSYSXaXtuYhCIf
	 8Xe9D92ISHC1w==
Subject: Re: [PATCH net-next v6 7/7] net: ftgmac100: Allow building on ARM64
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:23 +0000
Message-ID: <179483726335.3136.9821414113172154468@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-7-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-7-238020bf46cf@aspeedtech.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On AST2700 (FTGMAC100_QUIRK_DMA_35BIT) the driver keeps no
  software copy of buffer DMA addresses.
- [Low] The commit message gives the wrong reason for dropping `depends
  on !64BIT || BROKEN` from FTGMAC100…
- [Low] The new MDIO_ASPEED help text in drivers/net/mdio/Kconfig (lines
  58-62) reads like a changelog, not like help text that stays in the…

--

net: ftgmac100: Allow building on ARM64

This commit lets the Faraday vendor menu and the FTGMAC100 driver be
selected on ARM64 for AST2700, and drops the !64BIT || BROKEN restriction.
It also changes the MDIO_ASPEED select condition from MACH_ASPEED_G6 to
ARCH_ASPEED and updates the MDIO_ASPEED help text.

> diff --git a/drivers/net/ethernet/faraday/Kconfig b/drivers/net/ethernet/faraday/Kconfig
> index 474073c7f94d7..9acc2d260c1f9 100644
> --- a/drivers/net/ethernet/faraday/Kconfig
> +++ b/drivers/net/ethernet/faraday/Kconfig

[ ... ]

> @@ -28,11 +28,10 @@ config FTMAC100
>  
>  config FTGMAC100
>  	tristate "Faraday FTGMAC100 Gigabit Ethernet support"
> -	depends on ARM || COMPILE_TEST
> -	depends on !64BIT || BROKEN
> +	depends on ARM || ARM64 || COMPILE_TEST

[Severity: Low]

The commit message says:

  The driver now programs the upper DMA address fields, so it no longer
  needs to be marked BROKEN for 64-bit builds.

Is that why the restriction was there in the first place? The
!64BIT || BROKEN dependency arrived in eac8173e7b99 ("net: faraday add
nds32 support."), together with COMPILE_TEST, on both FTMAC100 and
FTGMAC100. It looks like a general "not 64-bit clean" marker and has
nothing to do with DMA address width.

The upper address programming is also only done under
FTGMAC100_QUIRK_DMA_35BIT, and only the AST2700 match data sets that
quirk. For example, ftgmac100_init_hw():

	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
		iowrite32(upper_32_bits(priv->rxdes_dma),
			  priv->base + FTGMAC100_OFFSET_RXR_BADDR_HIGH);

and ftgmac100_probe():

	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT) {
		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(35));

The other compatibles never program the high fields. They work on a
64-bit kernel only because they keep the default 32-bit DMA mask.

Also, with no 64BIT restriction left, this line lets the driver build on
every 64-bit architecture under COMPILE_TEST (x86_64, riscv64, and so on),
not only on ARM64 as the subject says.

Could the commit message describe both of these points?

[Severity: Medium]

This change makes the 35-bit DMA path reachable on real AST2700 hardware.
On that path the driver keeps no software copy of the buffer DMA
addresses. It stores the upper bits only in the device-owned descriptor,
in ftgmac100_alloc_rx_buf():

	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
		rxdes->rxdes2 = cpu_to_le32(FIELD_PREP(FTGMAC100_RXDES2_RXBUF_BADR_HI,
						       upper_32_bits(map)));
	rxdes->rxdes3 = cpu_to_le32(lower_32_bits(map));

After the MAC completes the descriptor, ftgmac100_rx_packet() rebuilds
the handle from rxdes2 and passes it to dma_unmap_single():

	map = le32_to_cpu(rxdes->rxdes3);
	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
		map |= (u64)FIELD_GET(FTGMAC100_RXDES2_RXBUF_BADR_HI,
				     le32_to_cpu(rxdes->rxdes2)) << 32;

ftgmac100_free_buffers() rebuilds it the same way. ftgmac100_free_tx_packet()
does the same with txdes2.

The header describes rxdes2 as a word the device writes:

	__le32	rxdes2; /* length/type on AST2500 */

Does the AST2700 MAC leave bits 18:16 of rxdes2 (and txdes2) untouched
when it writes the descriptor back?

If it rewrites the whole word, every buffer mapped above 4 GiB would be
unmapped with the wrong DMA address. With dma-direct on arm64 that means
cache maintenance on the wrong physical range. With swiotlb or an IOMMU it
means the wrong bounce buffer or IOVA.

Neither the code nor the commit message says whether these bits are
preserved. If that is not guaranteed, would it be safer to keep the DMA
handles in a software array next to rx_skbs and tx_skbs?

>  	select PHYLIB
>  	select FIXED_PHY
> -	select MDIO_ASPEED if MACH_ASPEED_G6
> +	select MDIO_ASPEED if ARCH_ASPEED
>  	select CRC32
>  	help
>  	  This driver supports the FTGMAC100 Gigabit Ethernet controller
> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index 6f272fae4bb55..ec1794cc64b09 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -50,12 +50,16 @@ config MDIO_ASPEED
>  	depends on OF_MDIO && HAS_IOMEM
>  	help
>  	  This module provides a driver for the independent MDIO bus
> -	  controllers found in the ASPEED AST2600 SoC. This is a driver for the
> -	  third revision of the ASPEED MDIO register interface - the first two
> -	  revisions are the "old" and "new" interfaces found in the AST2400 and
> -	  AST2500, embedded in the MAC. For legacy reasons, FTGMAC100 driver
> -	  continues to drive the embedded MDIO controller for the AST2400 and
> -	  AST2500 SoCs, so say N if AST2600 support is not required.
> +	  controllers found in the ASPEED AST2600 and AST2700 SoCs. This is a
> +	  driver for the third revision of the ASPEED MDIO register interface -
> +	  the first two revisions are the "old" and "new" interfaces found in
> +	  the AST2400 and AST2500, embedded in the MAC. For legacy reasons,
> +	  FTGMAC100 driver continues to drive the embedded MDIO controller for
> +	  the AST2400 and AST2500 SoCs. AST2700 has no dedicated MACH_ASPEED_G7
> +	  symbol and is only gated by ARCH_ASPEED, so FTGMAC100 now
> +	  unconditionally selects this driver on every ARCH_ASPEED platform,
> +	  including the older AST2400/AST2500 SoCs where it has no MDIO node to
> +	  bind to.

[Severity: Low]

This isn't a bug, but this help text reads like a changelog. The word
"now" only makes sense relative to this patch, and the sentence is about
Kconfig internals rather than what the option does.

"unconditionally" is also not quite accurate. The select is:

	select MDIO_ASPEED if ARCH_ASPEED

inside config FTGMAC100, so it only applies when FTGMAC100 is enabled on
an ARCH_ASPEED kernel.

The old advice ("say N if AST2600 support is not required") is removed and
nothing replaces it, even though the prompt is still visible to users.
Could the text say instead that saying N has no effect when FTGMAC100 is
enabled on ARCH_ASPEED, and when N is a sensible answer?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
