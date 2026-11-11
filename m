Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393311;
	b=3vRA/nDK+uEkjiY8oWhzE7PsFG4CABRIs3V8EIwMPAuIAO2ttHEflMJaF7CC9C7HvN7o
	 KTBbQvTdpNEyxHTQ9lxKfORjn0XsU3OU9yXxmvXeYdK8UmYJrPkiYcYnbG0TiDx5/wh8s
	 OdicMZnAONlFinuIrGXBMdb1tdyWLoKLD/V2qXE9cOnLpZKwWjm0iDD/CBwWxRY05eGB0
	 6y0MbGLwoaP36mfL6RqqfOGiq1wY70PSJ0O8LbwccU2l+D0vyMc0LkeXkqpms+QOeLLMq
	 7Y7Cy89IPgt+ALNemh9vRtJhx58zpw6kC22mJM8D+SE9qm6lk03LoniNVYMsv+ZLepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393311;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rqgkq6oQbIsqnROn601ye4kioGRpwwGl2bIvAccYj10=;
	b=iRlyNXZfiBcKX9bn/rPGi2F+a6LUlVO1JBFcmWxJxIwAvtpVfIGcDfshK5TjcVqlgNPd
	 bBHp1uhk7w+6qW2yG5tQmax44776s//XtH/1LTmH7VcJA98KuAiLA513x3ckoKKQGSBUh
	 +7zJBno5aSRZCsAV9yc2vcJHD7eptk5RF+s6EMWdiQ9AwoPcBaZYQDEwuz367JwKD3d6t
	 zaa5vvcGL8itNbvEBSMxISiCpuU99dBO+GR6e0yoiXzaGdcHTDcJz+ueuLl3u6RkunY3g
	 B0a26iEqGRrwZNF8NsCrYUF8TGcDz0FrUKvAhxQVtg7iDcaDwTPWXtQt9ze8AMlkn8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=2OdJcHNX;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C52606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C52606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=2OdJcHNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=rqgkq6oQbIsqnROn601ye4kioGRpwwGl2bIvAccYj10=; t=1794393310; x=1795602910; 
	b=2OdJcHNX2hFLa55hHKvo0wHaGVA5LaGuCyjRPa7XGQi5SaZY9NngYOt/clIRIKCLd3/VWE1eAwD
	vnldFUelrrEG0bvtB28HxhpLR4zXqkRe9WA1jusEE7sQkNxiiR3GpF+CA9lF4FmHljBOQWm8KJ1pG
	ZPqU6NKHpll5eonoKJ5Mz2Zyz4Zbb+7IorH/8h1mbAukn17PtpaWWx+ZPXkWxt8queQaQsLakj8sX
	LNuNRlY5LRKO5AabpRIuisd2PKr9IWlyaackt82ibL4L5xFbwn0rEzEF2CLXK6pYjJ2kDHLtDkr+s
	029nw7ZbUl77gGWN6TD7vB8jFX7kcMErim/Q==;
Date: Wed, 11 Nov 2026 11:30:26 +0100
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
Subject: Re: [PATCH v5 01/13] drm/bridge: tc358762: Clean up register
 defines
Message-ID: <20261111113026.2ab1e6c1@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-1-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-1-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:15:52 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Move the defines around and rename for clarity and consistency. No
> functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Seems to match. So

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 76564d5e4f69..097d2f331a16 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -28,17 +28,22 @@
>  
>  /* PPI layer registers */
>  #define PPI_STARTPPI		0x0104 /* START control bit */
> +#define PPI_STARTPPI_STARTPPI	BIT(0)
> +
>  #define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
>  #define PPI_D0S_ATMR		0x0144
>  #define PPI_D1S_ATMR		0x0148
>  #define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
>  #define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
> -#define PPI_START_FUNCTION	1
>  
>  /* DSI layer registers */
>  #define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
> +#define DSI_STARTDSI_STARTDSI	BIT(0)
> +
>  #define DSI_LANEENABLE		0x0210 /* Enables each lane */
> -#define DSI_RX_START		1
> +#define DSI_LANEENABLE_CLEN	BIT(0)
> +#define DSI_LANEENABLE_L0EN	BIT(1)
> +#define DSI_LANEENABLE_L1EN	BIT(2)
>  
>  /* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
>  #define LCDCTRL			0x0420 /* Video Path Control */
> @@ -59,14 +64,8 @@
>  /* System Controller Registers */
>  #define SYSCTRL			0x0464
>  
> -/* System registers */
>  #define LPX_PERIOD		3
>  
> -/* Lane enable PPI and DSI register bits */
> -#define LANEENABLE_CLEN		BIT(0)
> -#define LANEENABLE_L0EN		BIT(1)
> -#define LANEENABLE_L1EN		BIT(2)
> -
>  struct tc358762 {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> @@ -117,7 +116,7 @@ static int tc358762_init(struct tc358762 *ctx)
>  	u32 lcdctrl;
>  
>  	tc358762_write(ctx, DSI_LANEENABLE,
> -		       LANEENABLE_L0EN | LANEENABLE_CLEN);
> +		       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
>  	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
>  	tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
>  	tc358762_write(ctx, PPI_D0S_ATMR, 0);
> @@ -140,8 +139,8 @@ static int tc358762_init(struct tc358762 *ctx)
>  	tc358762_write(ctx, SYSCTRL, 0x040f);
>  	msleep(100);
>  
> -	tc358762_write(ctx, PPI_STARTPPI, PPI_START_FUNCTION);
> -	tc358762_write(ctx, DSI_STARTDSI, DSI_RX_START);
> +	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
> +	tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
>  
>  	msleep(100);
>  
> 

