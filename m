Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921272;
	b=qVmHT6OKvyIaLVorjZdyAWG4Vf0bfYTWbAxIN7j4/QPY+PGwys+pX8il6nIyoqlmqDIS
	 ry1w6X8TpQuj1Ja0PJTG0JuD8BDD+TCnZ6TP7Ug4v09fq+0vqLereXNtuNf2ClwPlLAXc
	 QAd6Szivr5uLXWEzunK+cmaPkhPjKRw8+XkrOryIe5lgjU2/dIWNj/ADWSE+gD9Y4Jxal
	 beDS2cZddabbd6+wPKI5JNrs/eNAWRCktpQ3mrgvs6nEFTraE1J4cG4x7QUy/RnSnx0UX
	 wYz4mE4TJp8v1162rmObMf1Qh19GhGUZ3E6JkcJ0Bab7iaSxVEDjGq+cEDEbSKCfI7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921272;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XE4PbUQHmToKKrzUb3/xsaaUTyBxgZGNbrcRAbhiDoE=;
	b=fklDo2HkeZZ8ZfuqYlK4no5jN7TkE3Veeiyi8FXfmjinOw+wjDwrCAiYx8c60BjsN0VZ
	 sgNBE8kw3miGrixHO4VgI7NWG4pEB7s10GibIQ5Rd40Z+NLiQtrnIgj4FgVJizuqQbyP+
	 8sSsy4tWez8YpOF4DtbiSlkgF6hIlZC+VghQkkYxpcjh5K+qSdQFBa0YjYnTv7W0GgBOY
	 X88JhjIMD5ke/Xemth4lYS3PN3j8Dh8epfGdNmclQJ6M1598MGzturDBBTNnWrwjIIzW5
	 m9dkoauG+IhIXT/lT9i9xEH+gpNR8zNwYZDIo4UWOjAhPj7RiXZYEArrkbdoh5yHUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=NjADxbId;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72224606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72224606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=NjADxbId
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=XE4PbUQHmToKKrzUb3/xsaaUTyBxgZGNbrcRAbhiDoE=; t=1793921270; x=2109281270; 
	b=NjADxbId5ZEfMqnNwg84vBwLTPX59dUAZC0vS1KyO7HS/IK36Xob5TxpBP6ezhNbghCid0OMCO9
	+V01+dpCsalZdFFx4IOiwgSBU1s0n1efsbdg+YanC+PdmtaSgLeyjCzqndSKOU0CCWa+JddHipud+
	lRIV5lv9cRub+R+ouIUBeUNHCLJdrMPpVIcJ682hoAJHRwukjTV39DzF+zBcW77/HmUNtZiDg8Edc
	Loapujf3Qa3al5tWD4EjcJTlm5cT0qowoSn/bXA6gARPYNg7ZHHfnOjr/ik1B5SvPxXp/G70bnspv
	M5km419AtFruEc3yJQJNhxulh/RduELRfe2g==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xP6rp-003qlz-Es; Fri, 06 Nov 2026 00:27:37 +0100
Message-ID: <05396e07-1c4a-4942-82dd-a0154fd6316d@igalia.com>
Date: Thu, 5 Nov 2026 20:27:32 -0300
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
Subject: Re: [PATCH v4 3/3] drm/vc4: dsi: remove unnecessary intermediate
 pointer computation
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
References: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
 <20261105-drm-fix-of_get_bridge-build-regression-v4-3-906ca343ac1b@bootlin.com>
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
In-Reply-To: <20261105-drm-fix-of_get_bridge-build-regression-v4-3-906ca343ac1b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 05/11/26 07:32, Luca Ceresoli wrote:
> This function computes the 'dsi' pointer from the passed 'bridge' pointer,
> but uses 'dsi' just to obtain the same 'bridge' pointer. Remove the
> unnecessary pointer dance, just use the passed 'bridge' pointer.
> 
> Suggested-by: Maíra Canal <mcanal@igalia.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> New patch in v4
> ---
>   drivers/gpu/drm/vc4/vc4_dsi.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 581b54e04ce4..ec008f766dd5 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1159,10 +1159,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
>   				 struct drm_encoder *encoder,
>   				 enum drm_bridge_attach_flags flags)
>   {
> -	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
> -
> -	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
> -				 &dsi->bridge, flags);
> +	return drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags);

I wonder if we should turn this into a DRM helper... I noticed that
other drivers follow this exact same pattern. The following files have
such pattern: vs_bridge.c, meson_encoder_hdmi.c, rzg2l_mipi_dsi.c, etc.

Anyway, just a suggestion. I already pushed the series to drm-misc-next.

Best regards,
- Maíra
