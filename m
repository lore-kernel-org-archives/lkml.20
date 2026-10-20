Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495520;
	b=oBnnDeC4c08KzlQCYKepxxE4bjNb1HzNXXxdaC9K0j51h8jPlZgDfPgGkb2oDHKWN0eK
	 fgn8jVhc1f0o2yeEQIZbUv0WW/pdwK098fovZj14c/pVPXGxq89LGzRexuGN+jeKbCJq6
	 RWMf3LEncUShkzdJffhNDfeDlngSmAURNF6qx6wwu6jEXmp5Zq7oq7Yh0l3Chif2CF6J5
	 K+XCAyuep9OJvB9eTTxJmyOOi+dqKiPmCpRK8/70gPO9C9ekEQRtBaXtrcv7131hqw9TO
	 y5OYKhXFs7sMFby6/VxbHwEfZmWqMD2NysdUPh9+slbyL9wXz5SmNRP0+eU/rGvwRiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
	b=v+Vwn6Wfq7yWjXnkCFOBlsJN5kO34s9F1vEGRcvZZwdJe+wmOr96o5hjbJhLPpMBAZYC
	 4u0sduiVwCUJisebX2YHEszzuzyqdT3ZpXJFUCa9qArMXtqdxC+CdafijWWAtslialPZi
	 PeAtuDhcO2Mf4ubLZASUifzcPYW3vUnOBJ3Z74oqA90nYpeCaI672jQYgz3GrWBoh3x6C
	 ptXxfEK5lD0Uor/2AhZnkQK6KZpQxixMxieKIgGMnkphxL1y7Q9rD2iZfrahuzP0yzRa3
	 55fJ+mfJsiS16ilU8Gsk60z4fm+XaGXwFBT5rKinxmzUShWZUc2j45Q1+t1odgJ2S+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enHXkjBc;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE42B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enHXkjBc
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35d0be18c71so671170eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792495519; x=1793100319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=enHXkjBcHTyhgc1SL5i8dRPGsB93K/VrvKDjapBUcFwLwrbpuMOaXluMo8q7vuQ+vd
         iM4r4Nx8HSy5/lFPpIfgvVh6z5VHeye7/emLjo5Ne5KtzHJa+pWZOXCXLYTLRJtI1xwT
         jS4umVg2AGbzDWKbgO0jaUKLuZVxTEvCzg2kH1jrKWKmPj8h1pSd32WRxTCX9VTARIvw
         w/zHFxr1bL1AkyXULrcgsFXwxb1hNRb953yIofFiGCwEZly65eUraCaTwshSF/GS5osT
         di8opzhPYAVvITJfxdr+rPGtrN/4fArgkLNZGVdPFZ7/GY02odkpBJVxK2jMDDwcd7o9
         L+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495519; x=1793100319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=fHkRTgRYqbLYY4mnH6k3suLMHSxWe2VBEDXw6GQ6YBxm18SYooVGT8AQFudj/oeMjX
         CkALUxGHSFkWpt+QVf55iZdFxcj9eQWdL4A/o+34fD8JrshE8bvDi40QPxlwFGz5igvz
         XBtV7fUGqHjt0qE6lkBi9UHYzuHmJbn+dhcj4WtEB3CNymFjJM37M5LlZYQroHHVvmYu
         wKn7fsSXVyzLPhRypqKeGXF14VV8z4CiAFxpO+560Uq5ga5Owpkzy+dVoPeBulCAShXu
         HSg+UIcrQSLCTQ3RKoFODD5Y538ZnYGS6b4LEYeY+J54XjeyQMv589xKkP/JWsaLxdqk
         53pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbpMxNnpVUMeSHUeWnlD+pX1pIGaKjY1wr8wsYR/nS/BbvDK2ptG36bR4S7Vs8DH+emWz5u0DQgIYl9nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4YcGXQBHyowQP9K2xRhMy3Oalb65gE1MZN9S++XGgASniIaqJ
	vMaSmHfIpjU/o9Xx4fRTSRhcALDWKX2rKWYshrwznuqkw2KwPfxx9GdQ
X-Gm-Gg: AYBFou0NDwPi3kouXOYs4FyF8jkeh+WGPhlh2Y1zNa0/wzkDwV9tid210Gu6OzDsgxH
	2K9QzC/LNNR+V8BlmKw1bfgv5Az15N+9ES1KXJLNj3YLpXly++fI27qEt8tSI7BFEdC6amNJrL0
	cUc6DBf/gfC6S+TVwNV/XxphSBB0kLrDME62fe2RwifQHUpT7rS7gKOGXGi5Dt0oeUDoTpvl3Sz
	k7WmLVodqTm5GEp0ijzXQv1sqsaC+lihjDyyf3qPaM3m3u5YR+JDU+0urw4IYr602xCIvnjoTfd
	BIYl17bwmHjNgfRQ65PG1N8zZyJ43cvNC92KnIuGFVEeU15hHmZCh3LMQWR5/o+ykBE3J5rBnlt
	zpPohKMnUnM2Bx+ISc7Z3BHTPq83JMpLrlNzTfk09E8AcH22qGfYKpRbcVTjgNLRpB7GqUna6kV
	bXIV6g2hv5nQHgi7D14mpIG59Y0LUDUaLPPdMJDqY9D6Dtwz/9SZgGNR4KvQ60muX3eJRKFHbAJ
	OVf
X-Received: by 2002:a05:701b:4553:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-18db9f2cfbbmr2343488c88.12.1792495518528;
        Tue, 20 Oct 2026 04:25:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm48988354c88.16.2026.10.20.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:25:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:25:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <svnjkyubpps5ocerr3pdaylmhsvlo44olqax7fcco2hahahocd@xnvocnkddfu6>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <sashiko-outbox-176995@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-176995@kernel.org>

On Mon, Oct 19, 2026 at 10:34:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/bridge: simple-bridge: missing atomic_check() to propagate DE bus flags
> - [Medium] drm/bridge: simple-bridge: timings devm_kzalloc() lifetime mismatch
> --
> 
> commit 17d03fa8dcd99e5bb3af7da622344c856ca2c887
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> drm/bridge: simple-bridge: Support data-enable-active endpoint property
> 
> This commit reads the data-enable-active property from the input endpoint in
> simple_bridge_probe() and allocates a drm_bridge_timings structure to set
> DRM_BUS_FLAG_DE_HIGH or DRM_BUS_FLAG_DE_LOW in input_bus_flags when the bridge
> does not already define its own timings.
> 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 3fba7002322e9..393228bed6e28 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -171,6 +171,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  {
> >  	struct simple_bridge *sbridge;
> >  	struct device_node *remote;
> > +	struct device_node *ep;
> > +	bool de_present;
> > +	u32 de;
> >  
> >  	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
> >  					bridge, &simple_bridge_bridge_funcs);
> > @@ -208,10 +211,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
> >  				     "Unable to retrieve enable GPIO\n");
> >  
> > -	/* Register the bridge. */
> >  	sbridge->bridge.of_node = pdev->dev.of_node;
> >  	sbridge->bridge.timings = sbridge->info->timings;
> >  
> > +	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
> > +	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
> > +	of_node_put(ep);
> > +
> > +	if (de_present && !sbridge->bridge.timings) {
> > +		struct drm_bridge_timings *timings;
> > +
> > +		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> > +		if (!timings)
> > +			return -ENOMEM;
> 
> [Severity: Medium]
> Can allocating timings with devm_kzalloc() in simple_bridge_probe() cause a
> lifetime mismatch with sbridge->bridge?
> 
> sbridge is allocated via devm_drm_bridge_alloc(), which manages the container's
> lifetime through sbridge->bridge.refcount and only frees it in
> __drm_bridge_free() after all drm_bridge references are dropped:
> 
> drivers/gpu/drm/drm_bridge.c:__drm_bridge_free()
> 	if (bridge->funcs->destroy)
> 		bridge->funcs->destroy(bridge);
> 
> 	drm_bridge_put(bridge->next_bridge);
> 
> 	kfree(bridge->container);
> 
> If pdev is unbound while an upstream bridge or encoder still holds a reference
> to sbridge->bridge, devres_release_all() will free timings immediately, leaving
> sbridge->bridge.timings as a dangling pointer that can be dereferenced by
> upstream drivers (for example, in imx8mp_hdmi_pvi_bridge_enable()).
> 
> Would embedding struct drm_bridge_timings inside struct simple_bridge (as done
> in lvds-codec.c and ti-tfp410.c), or pointing to static const
> drm_bridge_timings instances for DRM_BUS_FLAG_DE_HIGH and DRM_BUS_FLAG_DE_LOW,
> avoid this lifetime mismatch?

This seemed to make sense to me, but I'm having trouble implementing either of
Sashiko's suggestions in a proper way, as both seemed problematic to me when
actually trying to make the changes. 

Adding static const drm_bridge_timings instances for each of the flags goes
against the current pattern of using these to list configurations of actual
pieces of hardware.

On the other hand, embedding struct drm_bridge_timings inside
struct simple_bridge leads to duplicating information in the driver. It would
look something like in the diff below. In this case, when the bridge provides
a timings struct, the embedded drm_bridge_timings needs to receive a copy of it,
despite serving no purpose in this situation, it seems to me to add too much
complexity.

Laurent, do you think this is still better than adding a compatible for the
Apalis iMX6 VGA bridge, as was done in V1? Let me know if you think any of
these concerns are not actual issues, or if you think there is a pattern that
better fits this driver.

Best regards,
Leonardo

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..9787eb7f7b82 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -28,6 +28,7 @@ struct simple_bridge_info {
 struct simple_bridge {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
+	struct drm_bridge_timings timings;
 
 	const struct simple_bridge_info *info;
 
@@ -183,6 +184,8 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,24 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (sbridge->info->timings)
+		sbridge->timings = *sbridge->info->timings;
+
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+
+	if (!of_property_read_u32(ep, "data-enable-active", &de) &&
+	    !sbridge->bridge.timings) {
+		sbridge->timings.input_bus_flags |= de ? DRM_BUS_FLAG_DE_HIGH :
+							 DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = &sbridge->timings;
+	}
+
+	of_node_put(ep);
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }

> > +
> > +		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> > +						DRM_BUS_FLAG_DE_LOW;
> > +		sbridge->bridge.timings = timings;
> > +	}
> 
> [Severity: High]
> Will setting only sbridge->bridge.timings->input_bus_flags actually propagate
> the DE polarity to upstream atomic encoders and bridges?
> 
> simple_bridge_bridge_funcs registers atomic state callbacks without an
> .atomic_check callback:
> 
> drivers/gpu/drm/bridge/simple-bridge.c:
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During an atomic modeset, drm_atomic_bridge_chain_check() calls
> drm_atomic_bridge_propagate_bus_flags(), which overwrites
> bridge_state->input_bus_cfg.flags with output_flags from the downstream bridge
> or connector (0 for a VGA connector) and never checks
> bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/drm_bridge.c:drm_atomic_bridge_propagate_bus_flags()
> 	bridge_state->output_bus_cfg.flags = output_flags;
> 	...
> 	bridge_state->input_bus_cfg.flags = output_flags;
> 
> Because simple-bridge has a valid drm_bridge_state, upstream bridges and atomic
> encoders such as imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c read
> next_bridge_state->input_bus_cfg.flags instead of
> next_bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:imx_pd_bridge_atomic_check()
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> As a result, bus_flags remains 0 instead of DRM_BUS_FLAG_DE_LOW or
> DRM_BUS_FLAG_DE_HIGH.
> 
> Should simple_bridge_bridge_funcs implement an .atomic_check callback that
> copies sbridge->bridge.timings->input_bus_flags into
> bridge_state->input_bus_cfg.flags (similar to tfp410_atomic_check() in
> drivers/gpu/drm/bridge/ti-tfp410.c)?
> 
> > +
> > +	/* Register the bridge. */
> >  	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=2

This second finding was a false positive, as per my response in the 3/3
patch.
