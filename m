Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792846641;
	b=k6YleZAdgAgXSCt4LjysGYBalUK/yxpKyhfoWPuvHVwmAPDtiPiKKBozCq8kTj7nb2mO
	 lEXdyTd80pon7vAx/g+/0PmkbnAPKPnMIeJazDV9XqMQdLUvr2lb/g15Ca5ReDP9PIdTm
	 J7a7Fb1RdSvEzO6DiOC5ewA8AcyZqRTbhaAXiLAuYQK4ukxyHSLwmND1tNpfxRFdsDsit
	 Siror+8OQKuS0MNJqRFtxzK5dWbyC/ozRcg7XxFI56ER7uONfGfGDC32u7xpsxaOboSf5
	 Qbyn4J6lM6IYabSfuyIXUWK3D7HGrJxoXk6Qj98ilIqfvJUkVCIIwYyIDAuYM7sTGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846641;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+Rc+oJJEotg5wOv9yVmfTsAo8uj8nIoLDX4v3EN96vI=;
	b=EwhdPEzcAwQ3mXyJDkDmbzCZTZakNY8bmCi+CLrk8SHslEC9FIic9iDrQ6CTWS81n02C
	 PRfF1BcCAb5iaPQG02nFKAU5amRNoICPq0wnSArf7iqiugdkY22eQkmWbprzSe716XYMO
	 ozUvI1fPDkhsJ63DSgNBJx+wyUl34EwFCcIzo2EJtF9ST8OCUMIW+dHQeXqmT0P5WBkyT
	 TJfeNNa0mpJU/18qiZfAvHK1R9ih2yY2L2mRfTmhOq0iMM1XRPWvpEIkgH4Qu5qalsDGq
	 0Z5yoxYejqo1zDDg9TIYdHEscS+34gy5SsvvKLpPQ9dCWbA/ChfYR+iJlwRVtFp/ENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pBnRFIcY;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772A3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pBnRFIcY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=+Rc+oJJEotg5wOv9yVmfTsAo8uj8nIoLDX4v3EN96vI=; b=pBnRFIcYZ8BrwAj8bBLGZOgXrw
	Jis5VO6TwRtOUJ5nBLMjpcvXEdFpM4FywUdJo2bR4oA0zuQvVoZonEoQ2QgyFY2NtAiLb9dkyU376
	DQFns+h41wKaVprW8ptfwofIqdY72bZUZIkW8tVM5AualcGWdRQAeWClDPKtmzww2h2gOhkspxakj
	89mCdbBvorzZc3JIN5fn10v8jueR+HXp8LRJbcQyJyXRc9FY2KoJZRvaMjgmjquCGUtuxyFVFHMqS
	+1Oo6DucKk2i/xoqUHUaxcFHDDtKvaXuTYrNl/RyldjtNhmXHdUG/8UENZFO907emja92zUH6vKN7
	NKBRA8Kg==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKbIy-008sKO-7H; Sat, 24 Oct 2026 14:57:00 +0200
Message-ID: <e8321403-43dd-4ca2-8b20-117b9c18dcc6@igalia.com>
Date: Sat, 24 Oct 2026 09:56:54 -0300
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
Subject: Re: [PATCH v3 2/3] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
 <20261013-drm-fix-of_get_bridge-build-regression-v3-2-0b4c0b65be82@bootlin.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261013-drm-fix-of_get_bridge-build-regression-v3-2-0b4c0b65be82@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 13/10/26 12:23, Luca Ceresoli wrote:
> drmm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
> 
> drm_panel.h becomes unused, drop the include.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v3:
> - fix bridge reference leak in error path
> ---
>   drivers/gpu/drm/vc4/vc4_dsi.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 0148f2befed1..675bd0fc1391 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -35,7 +35,6 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
> @@ -555,7 +554,6 @@ struct vc4_dsi {
>   
>   	struct platform_device *pdev;
>   
> -	struct drm_bridge *out_bridge;
>   	struct drm_bridge bridge;
>   
>   	void __iomem *regs;
> @@ -1165,7 +1163,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
>   	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);

I believe you can delete *dsi

>   
>   	/* Attach the panel or bridge to the dsi bridge */
> -	return drm_bridge_attach(encoder, dsi->out_bridge,
> +	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,

and use drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags).
Also, I believe the comment is now redundant as panels are just bridges.

Apart from these nits, could you also address Sashiko's feedback?

Best regards,
- Maíra

>   				 &dsi->bridge, flags);
>   }
>   
> @@ -1749,9 +1747,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
>   	}
>   
> -	dsi->out_bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> -	if (IS_ERR(dsi->out_bridge))
> -		return PTR_ERR(dsi->out_bridge);
> +	struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> +	if (IS_ERR(next_bridge))
> +		return PTR_ERR(next_bridge);
>   
>   	/* The esc clock rate is supposed to always be 100Mhz. */
>   	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);
> @@ -1775,9 +1774,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   	if (ret)
>   		return ret;
>   
> +	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
> +
>   	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> -	if (ret)
> +	if (ret) {
> +		drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
>   		return ret;
> +	}
>   
>   	return 0;
>   }
> 

