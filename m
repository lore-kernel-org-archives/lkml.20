Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832444;
	b=przZsI1P77xNBPviXZFicOOD/LBdQxywAHv3zSw4zafvM70yBw6amQB6wdCAo/VSKM0J
	 K/HcYacR2ZMxKejcUFyFIib0yAmpCp8Os4DM8hj1CroHFXD54nj9VkSY0iUNL+Nj9j8tV
	 PQ2t7KZBm0DZKFrf9Vg5W9iOnYvIlmteieWkc08XhtF6Fhhf7o89USBYEGeT95f5bWanF
	 l9G6OBgA1Akgb+U614e9crfT0RRfJ1LfYtsKXzGX0TOulhXZYb65BqVweM7KMaOUIeMVV
	 jxYaFXT7Ui6CJw4r044zMZxmF7tdF9cZW854kMSLuCFtt2FtJc2lL+UNgYUptjgLqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832444;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9U0WlMShIYKKlzPKQhi2qdhsqtxGv+hAPAPG9hLfSaw=;
	b=1+aAYv0EEsvvqXU2fKBQ5RMX0lqX8aQFiqL8yc6HI+E43JemVs5Kb7dKR9BlEPJA38gQ
	 y4XN2jPkU5dB86JwyCQOd9NmBXt2iY97UtJe+h8xRTXCykyFiOwGf+YdfSGxhxLEuxoTn
	 VdjV9sXMt5PE6x2EzQkazZ8MuUCgq4IYeuRsZ9TC57pzk1E6u5Pg05L1BAkcyoj5FIhbG
	 cK0K7qtWFYWEWj7FE5r8zZNYyN4YPQZVfKczuswuJAxJ1zzv50kY6k3JmJoJhnNiWXBMq
	 6h04kNhh70KlzH46b5epC9DjQpoHk8KgzcjLELUhVjGczav1HSaL1ilpc9htouh+3cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ByP1oebK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAD8606A31C;
	Mon, 16 Nov 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ByP1oebK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DDC1F000C4;
	Mon, 16 Nov 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832444;
	bh=9U0WlMShIYKKlzPKQhi2qdhsqtxGv+hAPAPG9hLfSaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ByP1oebKP4sWQdGyIjrHAhZZnFHfL+yKqoygPmUrSTYpZgJvdvduPy/BH5G3Ya3TG
	 ggqcbGP0mrgQicg5x2MdWKqfWiVJs0g3i95+Jf8/y6qBR7cQs/x2R3vSpaYneFf/JQ
	 bmsbswWQz73unP+B6OR4mbAH1EAS5YFQMZTW43tzKXllUYQ5UYKuCtoIoOGVP6zCQK
	 VITvKaK91xHDsyPQKoPWk7A9ymLP85sVaGvOj0ZbeiJAWmipyT2ILu9aVhVFw29KR1
	 8WWwS8IrOqqxKtQi2417WrEkpY2lVFZ0g/7pHCAirP8A/I3eofRdSuh7YmkiZQ1Y0v
	 bgsHmVeKDTQfg==
Date: Mon, 16 Nov 2026 13:33:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
Message-ID: <20261116-resilient-eagle-of-brotherhood-6be3df@quoll>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-1-3d8798cd9a55@gmail.com>
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
In-Reply-To: <20261115-iep2-v2-1-3d8798cd9a55@gmail.com>

On Sun, Nov 15, 2026 at 08:47:42AM +0000, Arun Iyengar wrote:
> Add a binding for the IEP2 deinterlacer of the RK3568 and RK3588 SoCs.
> It is a different block from the IEP of RK3228/RK3288/RK3328/RK3399,
> hence "iep2". The RK3588 block falls back to the RK3568 compatible:
> the vendor kernel drives both with one compatible ("rockchip,iep-v2")
> and one driver.

Honestly, last sentence is redundant. Vendor kernels do all sorts of
odd things. Qualcomm vendor kernel has 100 properties per device nodes,
each defining single piece of hardware or driver. Shall we ever mention
it?  No, it's downstream choice, not relevant to here. If Rockchip
vendor kernel managed 100 devices with single compatible would that ever
mean anything to us? No.

> 
> Clock and reset names follow the RGA binding. The resets are optional:
> the block has its own soft reset.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../bindings/media/rockchip,rk3568-iep2.yaml       | 95 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
> new file mode 100644
> index 000000000000..0c7666de19f8
> --- /dev/null
 
...

> +      deinterlace@fdbb0000 {
> +        compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
> +        reg = <0x0 0xfdbb0000 0x0 0x500>;
> +        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
> +                 <&cru CLK_IEP2P0_CORE>;
> +        clock-names = "aclk", "hclk", "sclk";
> +        resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>,
> +                 <&cru SRST_IEP2P0_CORE>;
> +        reset-names = "axi", "ahb", "core";
> +        power-domains = <&power RK3588_PD_VDPU>;
> +        iommus = <&iep_mmu>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f4456f4589a1..b32b7eeb0a9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24285,6 +24285,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
>  F:	sound/soc/rockchip/rockchip_i2s_tdm.*
>  
> +ROCKCHIP IEP2 DEINTERLACER DRIVER
> +M:	Arun Iyengar <aiyengar1990@gmail.com>
> +L:	linux-media@vger.kernel.org

You can drop the media, subsystem defines it. No need to grow more than
necessary.

> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

