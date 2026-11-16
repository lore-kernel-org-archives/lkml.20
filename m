Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826409;
	b=P4UxX3UiPqnhj9BZrHAx/zBzAoGjRTvnThJAMohsMS+zN0/uLbTxF6iu8bHDGU1RRxw4
	 AvwbMNJcpPT7nsLpnYXMW1yuiM+8ahC6iQTQ+i7nUCt/llQRZwOJK9/Sbmt6+IswWIidf
	 nOIb/6arPCpXpvw8FOd/TwHkRqi3JkUj0YiTVuejTTIfXrfiua7QIGNL0biEoA1eOYpNn
	 2qstLAXbkGnvAkhTj6SIVqKETfIgtDcpjW6iYrw/DxvQ1Ua+RoSlNnZ+nMwwihPrpoavq
	 3/MHvAz8GP3DDaMVGqd/4npkvZe6YhJqdnQsHAp/Dw7FUnE22vmefWH57I3M7GMFV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PAvLjaQHm95bpI85WuhjYZDGCvdWFtQOLeuhomlJrGw=;
	b=YbOJ7Zbb5uOj3jmh5Lhna+jDBrQt+R4g/bGaagSMKxjKsUqC8KEvEAQY7rrkoshHaUaF
	 FbT9o04Mfm2U6J70HGpDaSNlsMOwIOpTx5h05DySDSt5qu6pljzVR95/PiRZviD7FsGpI
	 U++v0as17rMw+jhxCtDKaOb2p1JMJJOeMvvP1q1I9XDL/ZAWcOgsu337LxhsRe6mJSWl4
	 yVP1vR2O8mp1KxR9B/oT0YyWlhoz1Vf39x3MAsHAR95tH0n5xYJ2Dz3Srx87Rljx/qzxE
	 DQAkbPQTQnk+PnFkXRycMcrK92Lflya/w8JVs+gTXrwQw5TIoNYZU+neaQDDVS0Sc6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3Ea0nlK;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91E606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D91E606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3Ea0nlK
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so3775248b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826408; x=1795431208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAvLjaQHm95bpI85WuhjYZDGCvdWFtQOLeuhomlJrGw=;
        b=z3Ea0nlKzoHzWrHQ00kEDJl5rfOB2Dg7M+zjuDwFFVeBB1B41crdVBP2TX0y6p8Xop
         2gxeoqI0JOQJaigUbRP1y7Z01mOIqd0eXV3Rn2TSyHontQL5gyoGWDO6hBlrnqyXQ0sl
         S8RaDDEvazFivPJ2N4Zy7MqbAq/+85l0ppFvkPD1purZvKrq4PGmdkA5qtHqOzKlK8Ta
         /z4lAL45RJ7TbpKpDqOKOOUGj+D45dgmYTBejinZQFcwmxBKT+tSjGGH6JoafZRH0cBm
         0jM1fZgwW95QXXGkqnP0H2BBG8AVF0trDAL9o/SWv6PSeJJ7MPajgtp2yqtGRHmUPzmk
         lOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826408; x=1795431208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAvLjaQHm95bpI85WuhjYZDGCvdWFtQOLeuhomlJrGw=;
        b=Nbs0L9gz4fbYE9H1s7zKVRLyS+WaRr9IR+l+cu0NuPk/vUawEwx4XzTVznWyx0rMPJ
         fK9b1ULxwrNvFi+F/BCPddU+paw7vZ0LCcvR7mDd3/4bgoYomh75Yk+zJUwnuy90+XWk
         oypnpDMyaB+s5lPws4F0vI/y3KFInZk2dJU2ptiS4DVpieT3Cjd9hjevBFQMZ7RgU9GP
         Tv4GQgZLCy3sIiz1rzdTWazAslUMqttfeNUZ5IOuocKWbfWXwrDqzAXXvrquT6Rsug45
         0XwSB2/Elvx6965ybRYTJEYLKHWnZP2gbRZe0EzmMOocWhQAg4FMmQPv5HONYdxUhpjn
         Ue9g==
X-Forwarded-Encrypted: i=1; AL+hErFDnzXfE05KOQbD+Ab2PvSPoP2gqApeizwre1ozFtZp3f95/FGmx145yfzSPjD9R8UUGJu8Z/ShmshKw1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ESqJ9yz8Jn1kWF52hY1Hb+I2r+SvY/O2vidSeIo8u5Zg4IP6R
	RXlKeaB1/8+yHoW6YOIJrKWl6rm1CvTjyNClB38XXQmUiKm0E5KmMhiV
X-Gm-Gg: AYBFou0wBIUsNs93/3qWWx//ZsFCx14f3k+taOUwqJIFnGwmBbJNSo/CK8iTD1VIZHQ
	WwhqJ5MJ2N/fWA+BZHCrr/Jb0G0HPDs7MeK89+Bjc1irPxUWy4k1dDRUvCLdQ23vpopCRyD2hE2
	/UItw4knxMu1hrYCRSGO8v/Qt5WU5b9FpIR71d5KH95b7E5x7jQVZYZ494wGcE8v4GCx0TxfqZm
	eX18cUn4ua1vmwU0AZZvf1453hXcAKjuemSII955It1MgS2ev8+AXFoMUdXcEULM0f7lBAE/uHs
	G5AxoBIw+DycuZlhtYgpupmviDASsncscY7BOCYkzpsf/TKG+hTAWWJiax0ph4at+zZlo8BXrfh
	0l1RjRca3HIlo6R768TLoSKtbDq92adsRBgXa3mWMkp5gWC8lZApkfNP65uQghc6V3+Iq+q8Tfz
	1uO4SqGxbgyHapn7oZ0DqJa/gQ22GdNvZTuA8Q6HbVrMgdYLNWINJJ8y7o8NbGbZm1uAOng1SEa
	WD8Yyb+5tUzQvdMNc0Hpo00Adb6Y3lXcSm0OpirwxlzVz4v664DZ5H2JQ2EOVOYXiazgD9mB2pJ
	qr59O6M0NoM23xE7cm49WnKeC0ttK9A6cu8=
X-Received: by 2002:a05:6a00:94c4:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8beb65953fdmr9351345b3a.32.1794826408064;
        Mon, 16 Nov 2026 02:53:28 -0800 (PST)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3407230b3a.47.2026.11.16.02.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:27 -0800 (PST)
Date: Mon, 16 Nov 2026 07:53:20 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: simple-bridge: Enforce input bus flags via
 atomic_check
Message-ID: <mvwowftpwgn6vypc25fkqgajpizsnnmkceoaclot4ms2b43y56@q2oiqnpwrled>
References: <20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com>

Hi all,

On Fri, Oct 02, 2026 at 04:15:23AM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> The input bus flags set at each bridge's timings are never actually
> added to the bridge state and are not considered during modeset.
> 
> Implement the atomic_check function, to allow simple bridges to declare
> their required input bus flags.
> 
> Existing bridges that configure specific flags (currently the ADV7123
> and THS813* bridges, which set DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE) now
> write them to their bridge state, and have them propagated to the
> previous bridge in the pipeline.
> 
> Fixes: 0a01de65a741 ("drm/bridge: simple-bridge: Switch to atomic bridge callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 3fba7002322e9..848c2df2a276a 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -158,11 +158,23 @@ static void simple_bridge_disable(struct drm_bridge *bridge,
>  		regulator_disable(sbridge->vdd);
>  }
>  
> +static int simple_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	if (bridge->timings)
> +		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> +
> +	return 0;
> +}
> +
>  static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
>  	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.attach		= simple_bridge_attach,
> +	.atomic_check = simple_bridge_atomic_check,
>  	.atomic_enable = simple_bridge_enable,
>  	.atomic_disable = simple_bridge_disable,
>  };
> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20261001-v1-simple-bridge-atomic-check-e7b7eb8381e9
> 
> Best regards,
> -- 
> Leonardo Costa <leonardo.costa@toradex.com>
> 

Just gentle ping, could we get this fix merged?

Best regards,
Leonardo
