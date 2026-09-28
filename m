Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F564DE72D;
	Mon, 28 Sep 2026 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605927; cv=none; b=OLsDqN8eCiQ4+ZC1ofIQgqKgiOLJPxpoSqvLbnvO8wZ6wEUoCRRy22ULpAIB0Zps7ZRhhivHDggHHm7QQ48pyOUYbJfk37FfX8MQqrM7LGL/DfWDKBGi8E/EXSlXO4eZzreMP+1EE6EaQHWPxWFf1CRDCjbwMQltf5mHQGcHZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605927; c=relaxed/simple;
	bh=wGyEMMlGjQZNCJCqcAF5KPjSov7zTUYY3KO2X3ZgJVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQbX9Uk99QiVcM2Z6k/4wkZiNzUnCD8xNdiCwFsbXxBXTRE3kfUOoIeRSI+A33iswb1mndE49fswrltmR+bLlCe4BPjZreLFQ9AVZLHR4DxQYPL4JlV3eHPyJ7qiOua+F958+VyXC8vwKxdcJPkQ0H7E3n6nZ6UazzDTC/YLQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXDEkNs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXDEkNs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB3A1F000FF;
	Mon, 28 Sep 2026 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790605918;
	bh=4blZf6xxzmEC5OMJoSN+p5mrJDQy+r+9wEMcEu0rzZ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EXDEkNs7PELNrHo0lbN35E7u3L9gaY/Mzo76teZnK77RAWZH1sXuiOuk+IgDSmMu2
	 XXRLmU7LefizGLgVANCLxQsoXUUar6/OGZ+eAuyZHpbtR6/32HvMyvS+21gyv4yywS
	 Yvr+BHSutXqVgsqalwPTTN20kiZi1tyB/CNyRjLQ7/7cgQulQyDuJkiLo40pjco6A+
	 tnMgrqojJwH6PHOn7DEqGyK3fUegPZPuNGgeNnm0nZliM/R5RUzVx4PXJ6XpbefA7+
	 xchr1GcPMgbpYbT4Nv6m4sRpLO8IMrsi8UbC7U9hDW1xwLIOD1enA+scy77FyMWnSB
	 jri4uO8+lzvmg==
Message-ID: <ba275cd1-2d86-4ab1-a6e7-6758ddbc31c9@kernel.org>
Date: Mon, 28 Sep 2026 09:31:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
 <20260924183855.1393302-3-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260924183855.1393302-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Petko,

On 9/24/26 13:38, Petko Manolov wrote:
> M48 is a heterogeneous board made by Draeger that is based on two
> independent cpus, that are monitoring each other.  One of them is
> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> independently off qspi.
> 
> This one adds the DT for the two variants of M48 that are based on
> imx6q and imx6dl.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>   arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
>   .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
>   .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
>   .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
>   .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
>   5 files changed, 495 insertions(+)
>   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
>   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
>   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
>   create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 1a2539fa19b4..44b393256235 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>   	imx6q-dmo-edmqmx6.dtb \
>   	imx6q-dms-ba16.dtb \
>   	imx6q-ds.dtb \
> +	imx6q-draeger-m48.dtb \
> +	imx6dl-draeger-m48.dtb \
>   	imx6q-emcon-avari.dtb \
Please remember to run get_maintainer on the file that you're 
submitting. For this case, for the arch/arm/boot/dts/nxp, you need to 
also Cc'd :

Frank Li <Frank.Li@nxp.com> (maintainer:ARM/FREESCALE IMX / MXC / 
LAYERSCAPE ARM ARCHIT...)
Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE IMX / 
MXC / LAYERSCAPE ARM ARCHIT...)
Pengutronix Kernel Team <kernel@pengutronix.de> (reviewer:ARM/FREESCALE 
IMX / MXC / LAYERSCAPE ARM ARCHIT...)
Fabio Estevam <festevam@gmail.com> (reviewer:ARM/FREESCALE IMX / MXC / 
LAYERSCAPE ARM ARCHIT...)

Dinh

