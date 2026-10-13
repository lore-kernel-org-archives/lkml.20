Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F702EA75E;
	Tue, 13 Oct 2026 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876676; cv=none; b=Pyerj6yNQA1KZXEMyR4CTqGP0Dvqy/zwCotjMi9u/o1Xd0vwNWxR5HWxqlDYWFNyGH4NdHcVVGri+sV9VTkM0KenhnxeMJINmDtPbRoeRlltQ38EoMFCwPRO7f2twKNGFHUgLphlOEj6GaJGQKkqFaY/cNvP4u3LkB7U/Fdef7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876676; c=relaxed/simple;
	bh=gYq3QgRZN0FZx5a1ZIbQ36KIjVkHLOP7pRvs5jX85ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDdPuHSKtaQ+ztDVTD9w5e2+ME+I18s99xb4tZjncOL8yZkUsAVhFGPjlvxAgEZqo4QqtKoIuC+e14QxQOi/pnn3mHqPxbfqmwcRlOi+VaRgxjU+JifKa3viFBWWGypvgEzqyGkOk4zvl85jX+f258rz0YICp4uEnsrCpO4atK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCIZD0As; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCIZD0As"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADF61F000FF;
	Tue, 13 Oct 2026 07:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876675;
	bh=Of3eIH1y5cnrj5oKVfWFlqah/0p6DlvnyaqH8l/+JwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PCIZD0As75SdqelLRwD6fhIHXb47DK5rPFCLveWPRjElPnCpsu9iBtrEIsxg7olee
	 0FnyBAhQEktwJaNLOL/kpA9JTMRg8KWEcfIAd0k3t85MpEXLXkJcJLXJFIHJoZaXgO
	 Bgl+6FTpDxEdUekMQKUZWsAp1+nky19nZKgwCMMPJaMpJADxN8uFJkjqF5+s4c99cX
	 yqlU9I2gWX5KWuT/As7ZhNtFiIDrE8Qlrhe8e+0KFx2g9cfBjcYQAiLMs8VHOzk2Zr
	 u3EmufqOi3zXwIg0tk13gfTTBu29DatsMlczdWuA8SS519wXjwiv6zOJbHQITqiK1C
	 ZIxPykUUzSepw==
Date: Tue, 13 Oct 2026 09:31:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <20261013-musical-brown-mamba-ff87a8@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>

On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
> 
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
>  5 files changed, 91 insertions(+), 99 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 475e1ad9116e1..7c1b61249778e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> +
> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-tian-g07017.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> new file mode 100644
> index 0000000000000..33ddd08a7adb5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso

I do not understand this. This is a board, so not an overlay.

> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> +	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";

Best regards,
Krzysztof

