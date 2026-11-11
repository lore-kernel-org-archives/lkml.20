Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393365;
	b=n2Q+AfhI6xllb0wg2XEoV2F/sogC8f85D/JXBq3HELfQinGZvsfGOBT+DtxDcJda+yKh
	 IyzqxgeYEUaW/6T+QQhEEEaFhccxWSA1tl6kICkWPIpZCu6xomVoqxIFHCRIZ0AIO+ept
	 GjvwK3jx1/iG/i1VwvuOGB7gRmaNbNC/04CwLfhMh+73gRwEn0rH2cR0n0UnqHQtTK0d8
	 RFArLgQ3uBqG6Sr3zojrEWu7QjFDdixGLLXiDS6QcPRSBodvnle1gsEvdJFui8DDbSwSc
	 DHtM0IVxc23NSlumBC+xsoFqA48Pe4okXr3BrYUmZUza6raSsYXtnf7iBO/dRTb6l1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393365;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7SLRdwqp7JrkAfrgDPNwa4NfY0i/OOO7aG8RePrn2rE=;
	b=Zb4xS9V+iR2Nfb+ZQoT9VJqjKlpqM3ZVnjOypGksN6nqMPPHsFY06bfjGpzFscG1vRfx
	 202LmvoM4KUJ8ZhxzkgedLMeraCXBvb/YHMk/GqGia83EaTMAEPIBRjdb1MdJe9PcggU2
	 5cmnSSwe8H2Zx9JvMdtpUHO6djMG0+i+zIb0IjQ2zkiXbBPH0bjVW0Yq8djIjhEptqYTp
	 12Ttoh0GfZ+fnPz3C9cN5M88ADsXUcurKRQLIRAb8kAUjnBxbpIp7wFOY8h+O1IvNnN+g
	 tNDN/B9icYTMqZs301Vt5gOvjVkeLs54/nWruV5AqxPzlkqmIU4b5UMc3rabkAC+vzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=v2BDm8iT;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969A606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7969A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=v2BDm8iT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=7SLRdwqp7JrkAfrgDPNwa4NfY0i/OOO7aG8RePrn2rE=; t=1794393365; x=1795602965; 
	b=v2BDm8iTB/KjNXMsK/gWz0McraLmcCmn4+B4dkdx9Y97NFSVpOae6ifEsgYMwgWPeK3IHT0yD2c
	7Sem2CsCiK2rpEErsFhG6N0NF+6TuYkEjiU+0RPqWzghz+UadGK6DknvEtrIk4StGBxFkinrFTZ3T
	Z6VwTkcKtJRAJfSB7Qew2LnivHjuWR5BWiucP0v1r5Q/kPvDj7EyOJ90fks7kXfsG0P5784n5o20z
	91tGTF86hqB14WAhTFNUOCxTBt6P1ecZ7AEEMw3OC4dp6NqEVFO/7svpJ5aDEaEwIpYKqxoii8M8s
	wSM47RI6T0mlbHruxpxtQyyRaf8G5c5wXGrA==;
Date: Wed, 11 Nov 2026 11:35:31 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 02/13] drm/bridge: tc358762: Improve SYSCTRL register
 defines
Message-ID: <20261111113531.0924c2a3@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-2-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-2-7cd721a6451b@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 14:15:53 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Define SYSCTRL fields. No functional changes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

seems to match the previous constant and looks sane, so

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/gpu/drm/bridge/tc358762.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 097d2f331a16..59c68432f8e1 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -10,6 +10,7 @@
>   *  Eric Anholt <eric@anholt.net>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -63,6 +64,19 @@
>  
>  /* System Controller Registers */
>  #define SYSCTRL			0x0464
> +#define SYSCTRL_DPIDATA_IO_MASK GENMASK_U32(1, 0)
> +#define SYSCTRL_DPIDATA_IO_1MA	0
> +#define SYSCTRL_DPIDATA_IO_2MA	1
> +#define SYSCTRL_DPIDATA_IO_3MA	2
> +#define SYSCTRL_DPIDATA_IO_4MA	3
> +#define SYSCTRL_DPISTB_IO_MASK	GENMASK_U32(3, 2)
> +#define SYSCTRL_DPISTB_IO_1MA	0
> +#define SYSCTRL_DPISTB_IO_2MA	1
> +#define SYSCTRL_DPISTB_IO_3MA	2
> +#define SYSCTRL_DPISTB_IO_4MA	3
> +#define SYSCTRL_PCLKDIV_MASK	GENMASK_U32(11, 8)
> +#define SYSCTRL_PCLKDIV_DIV_2	2
> +#define SYSCTRL_PCLKDIV_DIV_3	4
>  
>  #define LPX_PERIOD		3
>  
> @@ -136,7 +150,11 @@ static int tc358762_init(struct tc358762 *ctx)
>  
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
>  
> -	tc358762_write(ctx, SYSCTRL, 0x040f);
> +	tc358762_write(ctx, SYSCTRL,
> +		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
> +		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
> +		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
> +
>  	msleep(100);
>  
>  	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
> 

