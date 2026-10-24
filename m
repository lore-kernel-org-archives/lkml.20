Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847030;
	b=a/XilW0Fck1gm51lwjA0GTdNyaE3pA/jWDHU2Wbu8H90cmIrqqVFXVjERSZoPLF6cLOI
	 SGRefXXt0GwGdSNCBP+hPHVZ8mODAmPirZcFodglMOyThc9ZqDHC5WK6JytYqB/Z6iuY5
	 VpqoY6Nc44w1+xc0M25zPRkG8lRizZKrnSRSx2AMTK36MTVUi+hwiaTTHelGjA/b0m3tG
	 R71MhvElw0AdOiHGez203ZYbpbgWDcfTBhXM9tgW+6/bVLbAty92DNLp6lMChZgVPnibk
	 uBJeau6oM3zvgIqGnyMr/bUrmUmWEKWWa2yQ/haOH1ZKwdwOUlLC3sZWJkK9goh4u6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847030;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ayzc6AUF0Ny/PBxFeJGZX94lictOJUIVWgf9XlatXYo=;
	b=rBPvLU0nRTUKCiqDVqqS7xwG18CNYIczVI8pCuyhHinxkkZRhfDWipL23vMk8eNs0iPx
	 tir34y1iyUC35bfmq7KOAvyEULS9S1MFh+AfWZnXticSS7vtpR4kpKNvlOU+TtXGbhUXT
	 HL7RT27sMTPSkcBRDbRSKP7VBhPy+MXrwAL65ruw42ey8e3DVMWHuPJUZQ2BgZwoXyWUP
	 k+ufv4bf3erLBEyHYc7LHqgCfYqQY2ZcLJxxXafB12jPMI/KFrCIwSGJC+d3Adz3qH+dz
	 B94K5wyYyL7snGwQbSc34HLG5znH/ggEh1eyJmg8uSMIFrqEJPj4+hOE3OcUtyRa5kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="hj9k/ppH";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5185606A323
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5185606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=hj9k/ppH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=Ayzc6AUF0Ny/PBxFeJGZX94lictOJUIVWgf9XlatXYo=; b=hj9k/ppHWyk/18xrL6GGsM86ec
	EOErfO/Fb7+YuHbFoexifhjPBAXCcVrdCyzzpSDxv7BxweOJsCbNAFJCxz61GxibukM/pFQXofEdj
	eXAJy/8KmK2KXJ82/g4E3/RrBkJU9+YThEyeg2U41RGKCRktgcBjKCHHCq+7wd2sbLvaS4OJWjMrQ
	NGwjgYF4a7zbJUrnCy7QIVZ7S/Wo/tSuI8R4+Y7eKwjIw+M3hWnPYup+d+bFSch/GpIKXtDoWrRXO
	/+Jr8r+hlSNmcNVm4nkQ7ILxpeoZ0BJHPaZUwM0w5uiW1PVhLuuN39E1U8kjePRYTh824WuCEJ/o+
	YenSEYsQ==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKbPL-008saA-Or; Sat, 24 Oct 2026 15:03:36 +0200
Message-ID: <1202bdc6-afde-45e1-8a32-c64f9424a65d@igalia.com>
Date: Sat, 24 Oct 2026 10:03:31 -0300
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
Subject: Re: [PATCH v3 3/3] drm/vc4: dpi: inline vc4_dpi_init_bridge() into
 vc4_dpi_bind()
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
 <20261013-drm-fix-of_get_bridge-build-regression-v3-3-0b4c0b65be82@bootlin.com>
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
In-Reply-To: <20261013-drm-fix-of_get_bridge-build-regression-v3-3-0b4c0b65be82@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

If you go ahead with this patch, could you merge it with [1/3]
Personally, I prefer to keep it as a separate function. vc4_dpi_bind()
is already a big function, with several initializations. I have the
impression that vc4_dpi_init_bridge() makes the error handling more
clear.

But that's bikeshed territory...

Best regards,
- Maíra

On 13/10/26 12:23, Luca Ceresoli wrote:
> There isn't much benefit in this small static function. Inline it in the
> caller.
> 
> Link: https://lore.kernel.org/lkml/accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com/
> Suggested-by: Paul Cercueil <paul.cercueil@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> New patch in v3
> ---
>   drivers/gpu/drm/vc4/vc4_dpi.c | 37 ++++++++++++++-----------------------
>   1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index feefefcf3ad7..5439e73da0d4 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -278,26 +278,6 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
>   	{}
>   };
>   
> -/* Sets up the next link in the display chain */
> -static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
> -{
> -	struct device *dev = &dpi->pdev->dev;
> -
> -	struct drm_bridge *bridge __free(drm_bridge_put) =
> -		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> -	if (IS_ERR(bridge)) {
> -		/* If nothing was connected in the DT, that's not an
> -		 * error.
> -		 */
> -		if (PTR_ERR(bridge) == -ENODEV)
> -			return 0;
> -		else
> -			return PTR_ERR(bridge);
> -	}
> -
> -	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
> -}
> -
>   static void vc4_dpi_disable_clock(void *ptr)
>   {
>   	struct vc4_dpi *dpi = ptr;
> @@ -366,9 +346,20 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>   
>   	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
>   
> -	ret = vc4_dpi_init_bridge(dpi);
> -	if (ret)
> -		return ret;
> +	/* Set up the next link in the display chain */
> +	struct drm_bridge *bridge __free(drm_bridge_put) =
> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> +	if (IS_ERR(bridge)) {
> +		/* If nothing was connected in the DT (-ENODEV), that's not
> +		 * an error.
> +		 */
> +		if (PTR_ERR(bridge) != -ENODEV)
> +			return PTR_ERR(bridge);
> +	} else {
> +		ret = drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	dev_set_drvdata(dev, dpi);
>   
> 

