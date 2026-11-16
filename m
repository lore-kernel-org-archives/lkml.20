Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837263;
	b=3xf996+0EVq+3qVytD6SdmRIIPrQz9YO22noi+J7lMOBMvuQeo+WUd0dwxe7ckpuPxDl
	 c/yRx8qfjQGJCUM9okpmr/JJ1MbfskHZ4d1JlbMcCGkOiTMKWxLZ5snwWPYT1IBPmgJ+v
	 J3AyWxMwLn+CJYJaSym5ZU3hONEk0rPg2G7SVqqBV+4HDG7SLLcL/PwnB0h+mH8/JKs5f
	 ddo7fYgt1oPdt7XDK19sX5dV4S0kul/A5JeuIkgqAV3vw5Gfue0hC13Y+H2w7RZ6AESh+
	 vmuOOrgL/jt/JN2+m+5wfgcivPeZeHpVzUsDtAe1+IACs3NAayCb0JR6jgEnMqDl4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837263;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8Qmd3zTWqxKS9EXQprMTTNgzTyEpTck3iz7Im4ijSnc=;
	b=uSbTy2GnObbgKBZGRAQ1F8CnKBMYDu+gmk5dvD5fCyr2MSTj+9Fw+R0F7XdzBUpFkHQC
	 crEebxlsNvgHVULWZbOvqSSi0E8Xm+glO1Ijmx2mx31vz3EW6REE9qGP2R4fiA7thMnnf
	 gthFYF/q9/IKUVypIyVSgpoBbN9Gz0r4B7/HiqQo6S51wn/xGdDmo9P8UZsPBJCbiD/nd
	 eWOVujTWik7a0rtp7hv2w9VFIoF9HnBixKxM1/biH0d8hJbrBi1Zz7/KwgR8iq9QvjARI
	 67KTktaLmvaRJ0VXKWhgcmToaNy7SBcPQpvAYFyO0F+MXbqQTu8Q8VO6kvrXaqq1Xog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXXZ3Wb2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590DB606A88A;
	Mon, 16 Nov 2026 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXXZ3Wb2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4943E1F00926;
	Mon, 16 Nov 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837263;
	bh=8Qmd3zTWqxKS9EXQprMTTNgzTyEpTck3iz7Im4ijSnc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aXXZ3Wb2PNRSc9/G8cAutp7a+2N0wKqh39UAGy2QW/aSh5iOIonPvxTASxV7ZoEzv
	 XXt8CNX7o9ay65yjAitxSzvaD3hAaG5rIix7KLI1vI+GPYgo9BFppZLfuGO1Z1jOve
	 mVB5P0OfN6QyNbEE8YjVMQTt7VMUnVnqQFxlDIESS1qkGuSb7nhctPrzSDLFXteNE8
	 R1z0WG9EbM6BgH1QN1ckH2XZNfUrnfAr2H/7Eyy3Mh1j4PR76Ef7Thr3Ul8mgrywF5
	 CgSM4s9AW4Ppg6ab8eAj1WZMiseLUFMfV/laQYz26njL7zCLS8vhN2mCaAgPV6kFlq
	 FID81WU+efegg==
Subject: Re: [PATCH net-next v6 6/7] net: ftgmac100: Add AST2700 upper DMA
 address support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:21 +0000
Message-ID: <179483726184.3136.10135612629435756137@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-6-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-6-238020bf46cf@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On AST2700 (FTGMAC100_QUIRK_DMA_35BIT), the driver stores DMA
  address bits 34:32 only in RXDES2[18:16]/TXDES2[18:16].
- [Low] The new register-map comment in ftgmac100.h says '/* reserved
  0xcc - 0x178 */', and the patch defines only…

--

net: ftgmac100: Add AST2700 upper DMA address support

On AST2700, this patch programs the high halves of the RX and TX
descriptor ring bases. It also stores DMA address bits 34:32 in bits
18:16 of rxdes2/txdes2, and rebuilds the full address from the
descriptors before unmapping. A 35-bit DMA mask is set, and all of this
is gated behind a new FTGMAC100_QUIRK_DMA_35BIT match-data quirk.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 5a578a62df673..263594de0e072 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -601,6 +612,9 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *priv, int *processed)
>  
>  	/* Tear down DMA mapping, do necessary cache management */
>  	map = le32_to_cpu(rxdes->rxdes3);
> +	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
> +		map |= (u64)FIELD_GET(FTGMAC100_RXDES2_RXBUF_BADR_HI,
> +				     le32_to_cpu(rxdes->rxdes2)) << 32;

[Severity: Medium]
Is it safe to rebuild the unmap address from rxdes2 after the MAC has
completed the descriptor?

The driver keeps no CPU-side copy of the mapped dma_addr_t. Bits 34:32
are stored only in RXDES2[18:16], and in TXDES2[18:16] on the TX side.

In ftgmac100.h, struct ftgmac100_rxdes still describes rxdes2 as a field
the hardware writes:

	__le32	rxdes2; /* length/type on AST2500 */

and struct ftgmac100_txdes still calls txdes2 reserved:

	__le32	txdes2; /* Reserved */

Neither comment is updated. Nothing in the patch or the commit message
says whether AST2700 leaves bits 18:16 alone when it writes the
descriptor back.

If the MAC writes any of those bits on completion, dma_unmap_single()
gets the wrong 35-bit handle, both here and in ftgmac100_free_buffers().
The real mapping or swiotlb slot would leak, and the call could sync or
unmap a different mapping. ftgmac100_free_tx_packet() relies on txdes2 in
the same way.

The drop label in ftgmac100_rx_packet() also rewrites only rxdes0 before
it gives the descriptor back to the MAC:

drop:
	/* Clean rxdes0 (which resets own bit) */
	rxdes->rxdes0 = cpu_to_le32(status & priv->rxdes0_edorr_mask);

In that case, would the next frame be DMA'd to the same low 32 bits but
in a different 4 GiB window? A remote sender can reach this path with
runt, CRC error, oversize or fragmented frames.

Can the AST2700 writeback behaviour for RXDES2/TXDES2 bits 18:16 be
confirmed? Alternatively, would it be safer to keep the full dma_addr_t
on the CPU side and update the descriptor comments to match? Any later
controller that opts into FTGMAC100_QUIRK_DMA_35BIT would inherit the
same assumption.

[ ... ]

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
> index 8c35c895b1465..0c244b1c0a351 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -57,6 +57,9 @@
>  #define FTGMAC100_OFFSET_RX_RUNT	0xc0
>  #define FTGMAC100_OFFSET_RX_CRCER_FTL	0xc4
>  #define FTGMAC100_OFFSET_RX_COL_LOST	0xc8
> +/* reserved 0xcc - 0x178 */
> +#define FTGMAC100_OFFSET_TXR_BADDR_HIGH	0x17c
> +#define FTGMAC100_OFFSET_RXR_BADDR_HIGH	0x18c

[Severity: Low]
Is 0x178 really reserved?

Both HIGH registers sit at +4 within a 16-byte aligned block. That looks
like per-ring {LOW, HIGH} pairs: TX at 0x178/0x17c, possibly high
priority TX at 0x180/0x184, and RX at 0x188/0x18c. The comment also
doesn't cover the 0x180 - 0x188 range.

Related to this, ftgmac100_init_hw() writes the low half to the legacy
register and the high half to the new one:

	iowrite32(lower_32_bits(priv->rxdes_dma), priv->base + FTGMAC100_OFFSET_RXR_BADR);
	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
		iowrite32(upper_32_bits(priv->rxdes_dma),
			  priv->base + FTGMAC100_OFFSET_RXR_BADDR_HIGH);

The TX ring is set up the same way, using FTGMAC100_OFFSET_NPTXR_BADR
and FTGMAC100_OFFSET_TXR_BADDR_HIGH.

Does AST2700 combine the legacy 0x24/0x20 registers with 0x18c/0x17c,
rather than using separate LOW registers at 0x188/0x178?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
