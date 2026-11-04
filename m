Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797813;
	b=zB/9uWePppAVswPV3Yz5VepBCSxCkmPJWCYMK44etGV6jDu6x/ugw02Vxdav9gn3hNJm
	 52Kl76Av+mp7xn+8DYRjGTky9AwcN4p2CKOVHmupX2K+6/BCaPlSZj4WLYF+aB+JFqy8o
	 t9bhaDnnfl3O+zq/4vab06ndJjVQcoOqFFEf6l4oRDqWgapAo13cGdwI/h/Bnj/Dpxtu8
	 xSpVtQZofljwzuewGNIFv130VXp4buHEsXbV9neX07XQUUhfbRIFNTTxecitpuH0Fkrfs
	 AJ/9SHViAgC2jl+8JsZohomG8NdQGVDIG8treZNY5+JiOlcx7Bcoy7teGsKldx83SwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797813;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EaXRoxZs9PRx2wo2tzSq0ef3gNUQ37to3HPL9EgpspY=;
	b=UzsuQOYE9wywmhLLhBK9jLwTVPPojBBh6HPUMi8E1MO98ob67n5hCacU6YrAGpuv9ilM
	 tt6zJz7q/dmQ7DvBom9dnRG1wRDHvpYO6eLlVtp1EoLts9w3QdFXXrE1B33XzpPo8454M
	 smra1ce8tU9LrRiMGS7ktjj7npWLTfn5UkrksntNZ4of7CdPMALY1wSPAtb4SR7pUsO4A
	 xwRIkt9oam3eaNZmyviRUmtsQCNTLvyBdmsnuTEAMDddwbXyDDXJplkE0fG/1/EyTtGzB
	 bK2JcccIYWan61Q0GLxblBsrggNJ4/qOuTNAJyGsKHTWZzdkCDY7OERAScMPg1DRxLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k+5OJid/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9125606A31B;
	Wed,  4 Nov 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+5OJid/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE8B1F00919;
	Wed,  4 Nov 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797812;
	bh=EaXRoxZs9PRx2wo2tzSq0ef3gNUQ37to3HPL9EgpspY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k+5OJid/VkQ3swVXuHLrFLBfnJA0PGG4Zhrv9HJAGwkQmMgt/6YaCL5KMQvwLXSTF
	 O9yMB5ZVpxaDNFY4Gz5VlJRtuFBs8Spl04eVXVRaHh4A/crCFbpkkZwaFg+TBJbMPY
	 vG3hd8gbd64DkQGvbZH/qqqZoliTbayqqN5ENZvW84oEUeDAiEibS//xfiPUMi/WgJ
	 bjjMPfdSoFojto5KvVbOrF/ct72w7DU7ipswheAm3qrSYvTB7QTCFe5XPOIFWv4RDg
	 CeUYyoRMyVEz+VmfdJaGKIhmqsxD8HhL+5loiTZuLac9VHAJTmxp9qev2Bn/My2oSb
	 juzgE1wLbSUZA==
Date: Wed, 4 Nov 2026 14:10:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: broonie@kernel.org, heiko@sntech.de, linux-sound@vger.kernel.org, 
	luca.ceresoli@bootlin.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, sugar.zhang@rock-chips.com, 
	lxt@rock-chips.com, xing.zheng@rock-chips.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
Message-ID: <20261104-russet-stingray-of-penetration-fef32e@quoll>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
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
In-Reply-To: <20261101044149.2018744-2-zhengxing@rock-chips.com>

On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
> Describe the optional detect-GRF phandle and named interrupt resources
> used by the B/C headphone detector. Retain the legacy interrupt order
> and index-based lookup when names are absent. Document the detector
> disable and reversed-jack properties and their resource dependencies.
> 
> Describe the ADC stereo-group routing consumed by the codec driver.
> Require four unique group IDs in the range 0-3, in I2S2 SDI order,
> matching the driver's validation. Leave GRF routing unchanged when
> the property is absent.
> 
> Extend the example with headphone-detection resources and ADC routing.
> Keep machine-driver amplifier GPIOs and debug interfaces outside this
> codec binding.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> Changes in v2:
> - Retain the original detection descriptions and legacy IRQ ordering.
> - Keep the binding change in its own patch before the codec change.
> 
>  .../bindings/sound/rockchip,rk3308-codec.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> index 2cf229a076f0..60c6140dc5df 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> @@ -36,6 +36,49 @@ properties:
>      description:
>        Phandle to the General Register Files (GRF)
>  
> +  rockchip,detect-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the detection GRF used for headphone insertion and
> +      removal interrupts on codec revisions B and C.
> +
> +  interrupts:
> +    description:
> +      Keep the legacy interrupt order. If interrupt-names is omitted,

What is legacy interrupt order? There are no interrupts here, so how
could there be anything legacy?

> +      the driver uses the second interrupt for B/C headphone detection.
> +    items:
> +      - description: Legacy codec headphone detection interrupt
> +      - description: Detection GRF headphone interrupt for revisions B and C
> +
> +  interrupt-names:
> +    items:
> +      - const: codec
> +      - const: hpdet

Why same device has both GRF to detect headphones and interrupts?

> +
> +  rockchip,no-hp-det:
> +    type: boolean
> +    description: Disable the internal headphone detector.
> +
> +  rockchip,hp-jack-reversed:
> +    type: boolean
> +    description: Reverse the headphone detection polarity.
> +
> +  rockchip,adc-grps-route:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      ADC stereo-group mapping to the four I2S2 SDI inputs. Each entry
> +      selects the ADC group connected to the corresponding SDI input,
> +      in SDI0 through SDI3 order. Group IDs 0 through 3 represent
> +      MIC1/MIC2, MIC3/MIC4, MIC5/MIC6 and MIC7/MIC8 respectively.
> +      All four groups must appear exactly once. For example, <1 2 3 0>
> +      connects groups 1, 2, 3 and 0 to SDI0, SDI1, SDI2 and SDI3.
> +      If omitted, the GRF routing is left unchanged.
> +    minItems: 4
> +    maxItems: 4
> +    uniqueItems: true
> +    items:
> +      enum: [ 0, 1, 2, 3 ]

Why are all the rockchip properties before clocks, not next to other
rockchip properties? What logic drives this placement?

> +
>    clocks:
>      items:
>        - description: clock for TX
> @@ -72,6 +115,12 @@ properties:
>  
>      enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]

Best regards,
Krzysztof

