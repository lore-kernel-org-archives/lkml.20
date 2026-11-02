Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628145;
	b=Y+EAHdn3MZ7zPrbitTz/VxagHQsEJTEL1R6LUDZNsiyTiBI7lxSyieCUGSG6MOmPemSt
	 P6x0ALT+wcCgMpQtFYltMZp/tcGBriyaHbvucARJ1SqF4PAnHgsMbWqgAlPeU2CzFX8PI
	 9vrMSHLJ9PmD1petkol9q/zheLLc1k9ENeOUDMg3L5A9HjAKrY865i0tHqnwttsgRvZQ2
	 osXa+aSFw9gfznB1aLLrFACKIqIJKdG1ljTYbJ8fRoSlGKNcRcse10Z1xV7JmvuyYpN/X
	 7CW6xQLCca9log9VXILWV3YQ3J1NPfPaYusTG4HebMvQXnh4qMr19xXopPvS/+uD5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628145;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rrDt8/qG+jvKZq+V2MNsQBcgRe5gnhLdJ83DrJanIU0=;
	b=l2ZBP/01SlznuVInzxwDi0F3ugZp+rUk6XAS+FuP9WYffSCSzERr9MP1kYo4NCiIBOmb
	 H/An4zdslwlhZqpGf9hHOc4p5r5ETOxvtF+WpS+nCm6fZx62Kfy5sYbvw8IyDPbb4ia+B
	 JrgiTwMtDzE010TErAA2cRL/36s4yFCwBADfn/jvPubCG3/K+JlAAz2B3Wn7NRkR/SZoT
	 HdUaCz1/XnKKBzfM3I0zg8sgtBywhcW836qM0tVNlutriClHJbqnItsyEydROVKJsoJm0
	 3Q8aqlTnNygi289CAAq9pgBWBXxj47b/R4uWxCDrIscw0sIfZNgpUKHtb4/ksHrjIgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=diI04PxX;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DFC606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DFC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=diI04PxX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+GKTSizLrrZQBsZt056y5c/KPEn+gWcclfGVamWBXAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793628142; v=1; x=1794232942;
 b=diI04PxXwN1bLWx1nMktOW2LeCn+YIgEwUt2DkT3/JN4sWWuaGYkfWWEWYuAAZsvFENMJcmA
 B9qO3Yf5OlGidKY+VkftWe7g0rZWcqXw4OiZTME6aDAfAaut2SOH8zaQt6bvw8EPil8xbkaGAYx
 Kbr4JZUPTAF8cR26/HzXTLg0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 308c65e25e6731cd;
	Mon, 02 Nov 2026 14:02:14 +0000
X-Mizu-Trace-ID: 308c65e25e6731cd
X-Migadu-Flow: FLOW_OUT
Message-ID: <5782a7a2-3fb4-4d74-aae9-e1ff0d0d4393@linux.dev>
Date: Mon, 2 Nov 2026 14:02:13 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] drm/tidss: Add support for AM62P display
 subsystem
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tomi,

On 29/10/26 10:18, Tomi Valkeinen wrote:
> From: Swamil Jain <s-jain1@ti.com>
> 
> The DSS controller on TI's AM62P SoC features two instances of the TI
> DSS. Each DSS instance supports two video ports, similar to the DSS
> controller found on the TI AM62X SoC. This allows three independent
> video streams to be supported: OLDI, DPI, and DSI.
> 
> Since the DSS instances on AM62P are architecturally similar to those
> on the AM62X DSS controller, the existing dispc_am625_feats
> configuration can be reused for the AM62P DSS support.
> 
> This commit adds the necessary device tree compatibility entry for
> "ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
> thereby enabling DSS support on AM62P devices.
> 
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 44b0b009c29a..8e3cbfb5ef87 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
>  	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
>  	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },

On a separate note,

Now that `vp_bus_type` support has been dropped, the only thing
different `dispc_am62a7_feats` has from `dispc_am625_feats` is the
subrev macro.

The DSS in AM62A7 SoC is functionally same with that in AM625 SoC; the
only difference being the absence of both the OLDI TXes in AM62A7.

The dt-bindings enforce that rule.

The only place subrev DISPC_AM625 is used, and subrev DISPC_AM62A7 is
not, is for an OLDI reset done log print.

if (dispc->feat->subrev == DISPC_AM625 ||
    dispc->feat->subrev == DISPC_AM65X)
	dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(5, 5)),
		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(6, 6)),
		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(7, 7)));

Should we consider some workaround for this print, so that we can
entirely drop `dispc_am62a7_feats`?


--
Regards
Aradhya

