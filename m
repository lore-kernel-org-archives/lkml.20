Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642911;
	b=Y9sPB+55r5TLU43oaD2YcrpVVA+IBZOO3eoAMDfbq+RYb4wEdHIHrABdet3pwQH23vuU
	 snmazu9DlKS/tE/uzXY5uX16g2B3e/iGSp1TL9DnLpHew4PxsRrsBFJcnyQrwnBP34f+E
	 Z/iVps+tc/yWKoFzDFkTlPdK8qpGz4ejE6WGp5xhOreqvZDcp9UbYl4Ek//LGBTnXLyp0
	 ep4vP8sMerVPSyAygmROjAIfTqaDLr8Y77464MA5gf3KS4I9omge6NqwwZl4HTY0KUYbG
	 HE23q8QqLpN4E4P+7xoLWOEvJjPg+puKHuZ/zLLIuMCFuC7yxkng8KvJyWIo+tNpLOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642911;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/X07HvNvN9a0K7HnKUe3Hh8QkXFl/G+Ctimt4KzzNgc=;
	b=WqDBYUa6ok3aAAIArJUqtLUxXnBY8WvHCcTLn0X3QuQb6Rvjcwnu9/fK/SpFh/RNe3ln
	 u0SWOjc3yhp4dRM1H/+hw7zvNpLrcn2Sv3jsds3rCYvp5JDqV6Pl7b9F9LtSk0n+i8y+K
	 oCteuJ45/QVNm7NEZYmkCHJ2ZPf5FvMXI1k85odjCUBopJIjtvgtyec82LZ7zomE/MT0Z
	 gDKo0bSyj8KQGzetzRmgUsUkqCmWx0PFCWiOVQ6ZYZ/U+Hyz+OUJE2QYbvuwR67b8Nv2+
	 bMH7Z2NH34G+9UDyhVnxeM7FsxPIxQ+JCX6RGkntGI1U15Cs10aGjT5Hz90zOPwXm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7pEuLPO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F7606A330;
	Sat, 14 Nov 2026 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7pEuLPO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3880D1F000C4;
	Sat, 14 Nov 2026 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794642910;
	bh=/X07HvNvN9a0K7HnKUe3Hh8QkXFl/G+Ctimt4KzzNgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7pEuLPOWQlHnxzyLzOgjIKCgJIReSb0pfN7H1yI2wsTFQtAIf6uOoeotRo9+Cjjz
	 xKCYhyDBq3KrF3DcN+Vv1DH04iqWMdO3LAPAgsHStKvElhmve9JQnlON8/hKr96oS6
	 e3CGelKDeSE90Idzk4HSV37u6z+vAMBi9tjZXBLWDq8E3gMewa8cHOiM7Ie8I5xiC6
	 ++pKjpMxb1tuJsLkiZgIIxP4ruPwFNJHp2EfzrwziphWgXXfxAfb+h8OYTgW8cn08D
	 F9NYBjRY0taVD2sp0loe3r4A7hb3tid4LSWnzBOuP5XqNopA2AkpXy9U+XfuGJwcwz
	 E/w9/DUWA+u7w==
Date: Sat, 14 Nov 2026 07:55:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261114075506-GKB100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
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
In-Reply-To: <20261109033348.361452-1-sandie.cao@deepcomputing.io>

Hi Sandie,

On 11:33 Mon 09 Nov     , Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index bcd533484a73..051046fe90b2 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -177,6 +177,28 @@ &combophy {
>  	status = "okay";
>  };
>  
..
> +/*
> + * Onboard SD card slot:
> + * Please insert or remove the SD card while the device is powered off.
> + * It works as a boot media. so set it to non-removable.
> + */
Is there any public schematic available for FML13V05? I guess there is
no CD pin (Card Detect pin)? as no "cd-gpios" property seen here

The above comment isn't really useful or even correct, I'd suggest
drop it.

> +&sdhci0 {
> +	pinctrl-names = "default","uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
..
> +	non-removable;
"no-removable" property usually used for emmc chip soldered on board,
 so there is no way it can be physically removed.. check 
Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml

For cases that no CD pin (or no GPIO CD pin) designed for SD card from
hardware schematic perspective, using "broken-cd" is a more proper way,
it will fallback to use poll mechanism to detect the card, please check

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)
