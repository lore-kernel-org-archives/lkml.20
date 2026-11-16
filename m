Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837272;
	b=AdUNGqLYDuuUvmCCy8cFLJJN6dPJ2mU6u7gJv2sxbGMOc/OQAuHgwZSdunnFRLRR0J06
	 2TX6SFQM/XYtvrEjkpR0q1rxVMhXU2oymR5ZYQ+i62jFxhMJJFPjLjVjIT+IlBpIkcF2l
	 /ULyPo/vKkwcv/13pA4dtRGYaXNoAzzUTFKaLH0MAqMagw1WcTV1R7jf+SjyX4pl8xTlh
	 LkiSRVF19rEiGTedx/tJz6bFqPt5f3I28bEvr8iFcYHtk9LA18d0QgcITFBsOwidvL+G6
	 GAMGCwABO1MZt1wt3c3Anl7BEdd4OL2A6oFoXSP0KWaw8++v9+CUeGAnvWwi0xnZ5MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837272;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=f2Q5INHps8CgWYe8Z/tRA0v/mRlLliNxSIPqAqP1nD4=;
	b=14yWhX0ZUc9CrZ9wwR8Lti9bCogj702fVzi3d8ZECsfFgrN2TiEXqqTYeAVD6VZboZMZ
	 PTrL6VbhPgufaNHoNa+pHouc3ezFn2XcV61s8tWiy5FiZ5LHohsvGyA1bbY1UCiHxIuij
	 yiMz6LqZaYbXMwaBhqGfQx8zx6IOZwsJLE710HvxtOLlvO/iHHaqqXOgSocyeZE10dcOv
	 lvem1tF5yc9rPQcH84DJFJF8Yo1SQdsGWEa5B2pJRlrxAL23y/bMQqCHbhx8kAYC4cEe/
	 uzwkv6Da8gCu3Kas0g364pFbS5r1vi6k1ul3m8JWRbzFRyCr5j+9VGRPlhZiaxE0qRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsmekRUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EA60A2636;
	Mon, 16 Nov 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsmekRUP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D921F000CB;
	Mon, 16 Nov 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837272;
	bh=f2Q5INHps8CgWYe8Z/tRA0v/mRlLliNxSIPqAqP1nD4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YsmekRUPgihP5LeFNecvW6m74jLjk5PIhw5udNGkh2Oaf2qildpkCuaSODBjLpFLC
	 oHAz1Mq/nbbTIRtqC13OkJxpOrFca93eq45v7wx+nZtqYciNxBt529deGV5aQQyEN6
	 0+XiV2gKb5cdcwxmWL30xRgPJB4qVF+6QoSOHHwW2RostqSquJQrEIqoXqS+kCjoVS
	 j5dm//w5UWgrlMcMty7pBlUNXjklhV0+EPl6xsGQ6jluEPhp38VCjRdG4uCnQbjZnk
	 J9E6SmAHjvXK+btwqO6wtFMAMv6I+qkFLw8toSE/FQ+sbnf2949H00L7ljCzyAQOSG
	 TGVLRiQfStibQ==
Subject: Re: [PATCH net-next v6 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
From: netdev-bot+sashiko@kernel.org
To: vishnu.santhosh@oss.qualcomm.com
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, deepak.singh@oss.qualcomm.com
Date: Mon, 16 Nov 2026 13:54:30 +0000
Message-ID: <179483727050.3136.1539014411037771065@kernel.org>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The series confines only the BAM-DMUX client's own DMA mappings
  to the restricted-dma-pool.
- [Low] The patch adds the Shikra-specific compatible `qcom,shikra-bam-
  dmux`, but the only placement the driver supports cannot pass schema…

--

dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties

This patch adds optional memory-region and qcom,vmid properties to the
BAM-DMUX binding. With them, DMA mappings can be confined to a restricted
DMA pool that is shared with the modem through SCM. It also adds the
qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback, and
requires both new properties for it.

> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> index 33746c238513d..f7388d24c8612 100644
> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> @@ -22,7 +22,11 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,bam-dmux
> +    oneOf:
> +      - const: qcom,bam-dmux
> +      - items:
> +          - const: qcom,shikra-bam-dmux
> +          - const: qcom,bam-dmux

[Severity: Low]
Will a Shikra DT that uses this compatible pass dtbs_check?

The bam-dmux device is only created from a child of the PAS remoteproc
node:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_probe() {
    ...
	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
    ...
}

So on Shikra the node has to sit under the qcom,shikra-mpss-pas node.

Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml does not
define a bam-dmux child and ends with unevaluatedProperties: false. The
qcom,pas-common.yaml schema it references does not define one either.

Should the series also update the Shikra PAS binding to allow the
bam-dmux child node?

[ ... ]

> @@ -72,6 +76,22 @@ properties:
>        - const: tx
>        - const: rx
>  
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
> +      The BAM-DMUX device uses the pool for DMA mappings.
> +
> +  qcom,vmid:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1
> +    items:
> +      minimum: 1
> +      maximum: 63
> +    description:
> +      VMID of the remote execution environment that is granted access to the
> +      restricted DMA pool through SCM.
> +

[Severity: High]
Does this also cover the BAM descriptor FIFOs, or only the bam-dmux
buffers?

Only the bam-dmux node gets the restricted pool. qcom_bam_dmux.c maps the
skb buffers with dmux->dev, so only the payload buffers go through the
pool. The descriptor FIFO is allocated on the BAM DMA controller device
instead:

drivers/dma/qcom/bam_dma.c:bam_alloc_chan() {
    ...
	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
					&bchan->fifo_phys, GFP_KERNEL);
    ...
}

That address is then programmed into the hardware:

drivers/dma/qcom/bam_dma.c:bam_chan_init_hw() {
    ...
	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
    ...
}

The follow-up commit "net: wwan: qcom_bam_dmux: Assign restricted DMA pool
to remote processor" says "BAM-DMUX DMA mappings and BAM descriptor FIFOs
must therefore be constrained to a designated memory region", and that
accesses outside the region can trigger an XPU violation. It relies on
"When the BAM DMA controller references the same pool, its descriptor
FIFOs are covered by the assignment as well."

However, Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml does not
define memory-region and has additionalProperties: false. The
dma-controller.yaml and dma-common.yaml schemas it references do not
define it either.

With a schema-valid Shikra DT, wouldn't bam_alloc_chan() allocate the
FIFO from ordinary memory outside the SCM-assigned region? The BAM
descriptor fetches would then land outside the shared region.

Should the series also extend qcom,bam-dma.yaml to accept memory-region?
It may also need to check how iommus interacts with
of_dma_set_restricted_buffer(). Failing that, could one of the bindings
document where the descriptor FIFO has to live?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18%40oss.qualcomm.com
