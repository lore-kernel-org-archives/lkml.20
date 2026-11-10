Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312538;
	b=ODrNj2EfVfyvpI6dEFFMDagxocQj6sEmiM8f8v+F/R2EQud+9itPA+2bjl6THuGnSNuC
	 4YvxBu0Dk9aNsn8is42p+nf6/3sSlmbCju8W2G3JQGFb+S7grul4DNdevq0pAMu7N3s9p
	 KPG1PXn/3WN+QScw32BOpwRI7Pu/zPQDo3BaAE/r3zQYv43SeaAbkdcHWa12S/el0ECQP
	 T/DWVqCQSBUNgGhn9o2C7vSL2lJZCXpNLY0rPyCFr2Avm8nMLFF2hQz119fI8EaH/Ubzz
	 jQJgrAHUNp2SliyKjDcg12vvwolTiAPyqyZufKZlNkRA83ApT6wXPuzPw+lMeeilA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312538;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=suRO7IXcHs/kdn6Tu9XVOti31enSt55p3HCSbFlmGg8=;
	b=G364qudNkM9A+6Lz990XiNc06smpQosecZYu+Xin5ToskKX+CiBNz/MJLia4yjhlDUDg
	 jc/Ku8rhkRQYjjeM2qheNf5UKuL113ejr2X/uMOMlw7QWr+eioGtiJlCtp4zSPUz8+ML2
	 pqifzFDW7qFBhhanVsQcPVqQw02IAN7FwkP2egQjcLqaZPh4H5puv5hj8KTLNgAOjXgYD
	 x1RTPNXNMhF6MZOy3JXYChmQWQVk60OpLq2mVnDfKZjBAvzQRO4DOLgxUqHLOhLthAuwZ
	 EmfudTaLRc1OQzMTHLARb/yixafwtLeTHzFWW1B3f1IrUJVyG3EwzZqC6hex8+uPHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fcQ1IYeP;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625EF60A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625EF60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fcQ1IYeP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=suRO7IXcHs/kdn6Tu9XVOti31enSt55p3HCSbFlmGg8=; t=1794312537; x=2109672537; 
	b=fcQ1IYePjNI22xXLyrEUQjoUL/a3mb+Ajj/Ihz23J7+o48YRcvtf/sO/dGZ0mJN9xHiu39Z/Kt0
	FpeotFk+c/XsLIFswqvaFtPZJ9WISIL33/gYILYmoGKpYzwtlzi9AwmXvAfeOa1dqhFoOKold4msi
	oS8yilC5SF1QHzknpfb1Wr1jW845i66WApfe3IurjGWf7vkaFX65U5Nmkp9tmbZDu1fBcyY/V5hRU
	IhQ+hQTXSk3XJmFyzQwJaRJW+RBdoc6laELo8ZCIAglokC9oYGYofYB5CiJ5cS8rfER+BJwbeoiyc
	GaoDp7E2PdUsR+Wmjf4zsIxGSaesPwZnJacw==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQkeV-00896x-9d; Tue, 10 Nov 2026 13:08:39 +0100
Message-ID: <e997d667-0070-4f65-a552-51bc41e2af97@igalia.com>
Date: Tue, 10 Nov 2026 09:08:31 -0300
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
Subject: Re: [PATCH v4 4/9] drm/vc4: hdmi: Propagate -EDEADLK to the top level
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
 <20261110-vc4-common-scramb-v4-4-eaa141a0da0f@collabora.com>
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
In-Reply-To: <20261110-vc4-common-scramb-v4-4-eaa141a0da0f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/11/26 21:13, Cristian Ciocaltea wrote:
> drm_connector_helper_funcs.detect_ctx() is expected to propagate
> -EDEADLK so that context owners, e.g. drm_helper_probe_detect_ctx(), can
> perform the required backoff and retry.
> 
> vc4_hdmi_handle_hotplug() instead runs its own retry loop and calls
> drm_modeset_backoff() on an acquire context it does not own.  This drops
> all locks in the context, including connection_mutex held by the core.
> 
> Drop the local retry logic and propagate -EDEADLK to the caller instead.
> This aligns VC4 with the expected detect_ctx() semantics.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0e6696644687..fc9d5fe07849 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -343,12 +343,11 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
>   	return drm_atomic_helper_reset_crtc(crtc, ctx);
>   }
>   
> -static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> -				    struct drm_modeset_acquire_ctx *ctx,
> -				    enum drm_connector_status status)
> +static int vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> +				   struct drm_modeset_acquire_ctx *ctx,
> +				   enum drm_connector_status status)
>   {
>   	struct drm_connector *connector = &vc4_hdmi->connector;
> -	int ret;
>   
>   	/*
>   	 * NOTE: This function should really be called with vc4_hdmi->mutex
> @@ -367,17 +366,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>   	drm_atomic_helper_connector_hdmi_hotplug(connector, ctx, status);
>   
>   	if (status != connector_status_connected)
> -		return;
> +		return 0;
>   
> -	for (;;) {
> -		ret = vc4_hdmi_reset_link(connector, ctx);
> -		if (ret == -EDEADLK) {
> -			drm_modeset_backoff(ctx);
> -			continue;
> -		}
> -
> -		break;
> -	}
> +	return vc4_hdmi_reset_link(connector, ctx);
>   }
>   
>   static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> @@ -415,10 +406,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
>   			status = connector_status_connected;
>   	}
>   
> -	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
> +	ret = vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
>   	pm_runtime_put(&vc4_hdmi->pdev->dev);
>   
> -	return status;
> +	return ret == -EDEADLK ? ret : status;
>   }
>   
>   static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> 

