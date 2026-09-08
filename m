Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22B48F000;
	Tue,  8 Sep 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905227; cv=none; b=rN++RDQaMnj9uXIyeSGX8oYGU7Rt8kHTAeRIrQQDof3g5gmqud4+Gb3KSjgFISGVNaKj4pS6dNLb98yTchz7tRI2AOgwzLbj2Tiv+mkI3cVb0j/Uy3Us0BI2tLj9h8qU8R4Mk/VBpuJrIe6jFid/JwXQDFCs0nb0m574oHTDOls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905227; c=relaxed/simple;
	bh=WepsCeX0ALim39H0LbQaoGEyC562nyyVvoxEGggtHR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh1F9Yy4fneREeDb4so7bWsm7ZBIN5HUSTKn+CehxFL45BoRVaZVPsIHwCD91mTJkdMaBZEwHCgTRTm4FNKBQncR44HSf7pTdfdmQO2T06MhbpuO3NV6aQnrgFScgJzIserQrO3u9jR3lZ7FoFQfoNXTRaqekRvRHWIhGvNj92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ht1oyT2p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ht1oyT2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB041F00A3A;
	Tue,  8 Sep 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905225;
	bh=JoK2n9Z7urXwu7MomxxLbY36ml5lzGDpWoJEJWTo6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ht1oyT2pmfS8hYNjLMLZv8UUdLolw9bM0vdtZG4PTG8bQMpx9IU1W+LbDS4g9HbEY
	 qnbKlwUqqY+or2QCAlEyVAo1riElAbTP21bEZDYkxNHH5klnLBe6TmZF5TQupdeUyg
	 WQI+OzzrdXlS9dsds4R9kVBJl+JlOCDNyyiQx7bLfxdbYXumGT7xcfwA1QMv/P+gn3
	 CYID6n1aMc84oLxAOpBcyHmazgNi24qXeS9bF3Ip886d7DlV5Via6OEMcm8gs1bPF6
	 wYV0IxvuLLAXfqSWjcmdJZXf+ALB8ZTHsKf3ZZe04KAY9MT/VCntZJrUUAhGbXM3R5
	 RaDxaspaqSnMg==
Date: Tue, 8 Sep 2026 22:07:03 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
Message-ID: <20260908220703-GKD2346@kernel.org>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>

Hi Junzhong,

On 17:48 Tue 08 Sep     , Junzhong Pan wrote:
> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
> USB2.0 controllers on the SpacemiT K1 SoC.
> 
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..5b556488de66 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
>  CONFIG_USB_CDNS3_STARFIVE=m
>  CONFIG_USB_MUSB_HDRC=m
>  CONFIG_USB_MUSB_SUNXI=m
> +CONFIG_USB_CHIPIDEA=y
> +CONFIG_USB_CHIPIDEA_UDC=y
> +CONFIG_USB_CHIPIDEA_HOST=y
I know some prefer to enable as loadable module for non major drivers
so, can you check if it works as module? and alter the config

>  CONFIG_NOP_USB_XCEIV=m
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_CONFIGFS=m
> @@ -272,6 +275,7 @@ CONFIG_PWM=y
>  CONFIG_PWM_PXA=m
>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>  CONFIG_PHY_SUN4I_USB=m
> +CONFIG_PHY_SPACEMIT_K1_USB2=y
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>  CONFIG_PHY_STARFIVE_JH7110_USB=m
> 
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)
