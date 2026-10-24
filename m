Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848907;
	b=bzqWJTJHCqMo9nSUvVYvQk0rU/k/EFwl5fX+2mmcPG3nsA/G0kXSMjYSk7sH5LZmSrU7
	 oFgC5hxfqcrKsXH274XpfqjLWKDLHe0IMMUi3usr1zKOzBbbaZxcy0mleImg60m6pS4RI
	 TpvjdPAfOJWjuofFKSAsvHP+snb6oA9Edsh044ASm/7FDskUep41GBcw7zeyG05UVkrYX
	 Pm/YS6H8zOzBiZqLjzCuW71hn6XsEH7Iw5fdrjCMKb0rhAhCH/GojwblmsJk0GOvW0e0k
	 utTogbEg/B7bok87x0xikFbIa55n//nO9/FjCSN66svk0ckWpJ7p97M41GA8gbK0S3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848907;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wQLzZWoI1wrW0n/bHQ9Pw3Qg+nIbkyv15M0zcWAruBQ=;
	b=2iL2g2XJGS4X+fC1KtvaJm4ifRTgNtJw/4x9n5sN1sn7iJV9+pkrr3Mt68ChUyh95BlL
	 GvQv0anwtSMpsYeksQ/1X1uuGKh+YT3NMIO3KIUb+cAXGYrawxmzitEdBfFLzAyEbG7Vp
	 GbH8663osWroGYZS5OkNqdCCQBC9iZqHIEveEFbFHUqwlmNug/v8T0UnCaxrhRZF+HWkC
	 bkmH0av9J5gbHwj0o85BKH6d9UXaGcR6iwz/jVbvo5ef5cCUNaxkqaY2h9y19yXLjoBpV
	 TJi5dp+yyObF0CKMcMknOyXjK1orcjw+cwmw6JT6GFrw0v7ygE0FGJSNbnzi9hj+myA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="Tb1Ylt7/";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC23606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Tb1Ylt7/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=wQLzZWoI1wrW0n/bHQ9Pw3Qg+nIbkyv15M0zcWAruBQ=; b=Tb1Ylt7/YIWVTOsFD9TONX+436
	bZYlDZaUcwnnKpCLLtjHM/zM8R8lPeZZT9jO55GKM3x5p/48FMnsatqnDwLOqVV7/T1YoxQnv9pvE
	8r03P6wRkcvOPk824GOH4BYdp5K7M2MASWjv7WfxhIir/GST4nsuPyeoU5ci/sIslizx40Rhsnt9M
	SpLV2JYmrTdQ+hiTE1tTjasiVxuCwQ5Lg+FZBTMhSGrfti6oCpOzYA0vmd6AkFmP0fwbmeA8sPmwk
	6j6Rx134eJllb9IXS8poLkD7Vu5DtSovsIzIbqR9t8F8BvMTTeEvoPBLY/C3sVlJEoldImWIB/SPu
	q6+bEKKw==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKbtc-008tkf-PB; Sat, 24 Oct 2026 15:34:53 +0200
Message-ID: <f0beb8f6-2048-42a2-87c8-fd6b2f1de42a@igalia.com>
Date: Sat, 24 Oct 2026 10:34:47 -0300
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
Subject: Re: [PATCH v2 3/3] drm/vc4: hdmi: enable scrambling before the TMDS
 clock starts
To: Lucas Tanure <lucas.tanure@neat.no>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261020151948.83459-1-lucas.tanure@neat.no>
 <20261020151948.83459-4-lucas.tanure@neat.no>
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
In-Reply-To: <20261020151948.83459-4-lucas.tanure@neat.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/26 12:19, Lucas Tanure wrote:
> HDMI 2.0 requires a source to suspend the TMDS clock, write the
> TMDS_Bit_Clock_Ratio bit in the sink's SCDC registers, wait at least
> 1 ms and only then resume the clock. vc4 does the opposite: the PHY
> starts at the new rate first, and the SCDC bits are written tens of
> milliseconds later, at the very end of the enable sequence, together
> with the source side scrambler. On disable the bits are cleared while
> the clock is still running.
> 
> Some sinks sample the bit only when the clock appears. One HDMI 2.0
> sink we tested then sets up its receiver for a 1/10 clock and never
> recovers: a Raspberry Pi 5 at 3840x2160@60 shows no picture, while
> 1080p60 and 4K30 work and other sources work at 4K60 on the same sink.
> Writing the bit by hand before enabling the output makes the same mode
> lock every time.
> 
> Enable scrambling, on the sink and in the controller, before the PHY is
> started, and disable it only after the PHY has been stopped. The SCDC
> helper already waits the required time after writing the ratio bit.
> 

Please add "Cc: stable@vger.kernel.org" to all your patches in the next
version.

> Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
> Link: https://github.com/raspberrypi/linux/issues/7693
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 4a386e053d3f..e57fc33af6b3 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -918,8 +918,6 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>   		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
>   	}
>   
> -	vc4_hdmi_disable_scrambling(encoder);
> -
>   	drm_dev_exit(idx);
>   
>   out:
> @@ -947,6 +945,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
>   	if (vc4_hdmi->variant->phy_disable)
>   		vc4_hdmi->variant->phy_disable(vc4_hdmi);
>   
> +	vc4_hdmi_disable_scrambling(encoder);
> +
>   	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>   	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>   
> @@ -1554,6 +1554,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>   		goto err_disable_pixel_clock;
>   	}
>   
> +	vc4_hdmi_enable_scrambling(encoder);
> +
>   	if (vc4_hdmi->variant->phy_init)
>   		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
>   
> @@ -1688,7 +1690,6 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
>   	}
>   
>   	vc4_hdmi_recenter_fifo(vc4_hdmi);
> -	vc4_hdmi_enable_scrambling(encoder);
>   
>   	drm_dev_exit(idx);
>   

