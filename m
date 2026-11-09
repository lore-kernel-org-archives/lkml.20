Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225650;
	b=V4A8sKivGSLuJ2Sc2BBubsrzV1xMiNDj48aBsYJbGFr6uomxnHJ9uYIZYfync4IGEimo
	 vw2kiD1uNyZaGzTwnqFK8GikL90hXW9Ew3u1LOSDv/CZsjYcO0d5NhnGv3HlFwW1bkUiq
	 29nNtHIliCYav61kNcLSFSbHeGqBYrlf2S+qgKA5BlX2DEF5xxE+agw8lHGLm4Tl0yM+R
	 tI1hF9qESbrAHoevRLJSq5KxVlpigYNJqAZbuuQv2/uAcGs7cZ+XA6NkXAWdVfZgWpLhv
	 U37NBV4DgrK/l+ykG57hFLPfhjFfkhRo3bQ5AVyk/c2+ah6+5XqZWU+6y62cpVaU2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225650;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dq28cqfmtysNsVpkbSf7JyApBlljxc11I1gvc1Urhy4=;
	b=ibyVAB9uBsScasZdrl+t6sAUnHojRN/FgtLUDObELyMjgGtqRPIQ7TTs8A++4+GFegkk
	 b53N7exymU9iKkHjwr0p4+qKAKk5vA/ttd1t19E1z8PPEkjKX+lOKU05NlkRhdgubbA1+
	 HF+D8HGrbCgU/YYVrabRqwKAy3sWtKz90Ivr2rUnoJPvibkRp+J83+elFQSq6HawCec4r
	 EX/BwhkQxuSIsa0+0glmKNWYth0F0KgIAxenSrpa1+Xuqs6QE82CgDHJ+lg0qWx34baZK
	 FKcH6e+T0IevFXwffI9yNZW86MtfloAqMC5acbEjY1fwXdefbe+Pr59u6Oh4cakg8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=AQcvRz3v;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DB7606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90DB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=AQcvRz3v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=dq28cqfmtysNsVpkbSf7JyApBlljxc11I1gvc1Urhy4=; t=1794225648; x=2109585648; 
	b=AQcvRz3vjCiPyBjxXnTomoXSpT8yHN/FaurZIwXV1kFfna90knmAp5StiSXdnbDHJZMaOArXhkb
	vMtR/8J0zq8nBgy0mA+KEyJqIxZYDDGyybvJGU80kSQ0+YbLWb1hSAavQIG9iRtlg8uI4yLza6THn
	e2zEZY9MmnhKfwTT/3Ohl3sOVtW+rHAO8zrEsdjb/ka1MQ3nOJVr6Jq8ez5Fq2bXfixvRcHyLHYP1
	NAmxtBgxE16+gFSNt+VD8aGjCGttFjinU97GXYyIIvJizsl/rsRCJl1EKMdfpgSEbFbmkgmM/S5R5
	f5nXnF9yTZly/ogru/fRW8iXMMaDyk0Vy5Lg==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQO39-007F2d-Gu; Mon, 09 Nov 2026 13:00:35 +0100
Message-ID: <712f4d29-f69c-4130-9cc6-3efccacba3aa@igalia.com>
Date: Mon, 9 Nov 2026 09:00:31 -0300
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
Subject: Re: [PATCH 1/3] drm/display: hdmi: Prevent NULL pointer dereference
 in sync_scdc()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
 <20261104-hdmi-scdc-scramb-fixes-v1-1-16a9bb3d64a6@collabora.com>
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
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-1-16a9bb3d64a6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 04/11/26 10:26, Cristian Ciocaltea wrote:
> The connector pointer is used to initialize the local variables hdmi and
> dev before the NULL check takes place, leading to the following Smatch
> complaint:
> 
>    drivers/gpu/drm/display/drm_hdmi_helper.c:663 drm_connector_hdmi_sync_scdc()
>    warn: variable dereferenced before check 'connector' (see line 657)
> 
> Move those initializations after the sanity check to avoid a potential
> NULL pointer dereference.
> 
> Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/arJo7A7L5hud3tyc@stanley.mountain/
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/gpu/drm/display/drm_hdmi_helper.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> index f85cce3d6254..872f7e32e8d2 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -653,9 +653,9 @@ EXPORT_SYMBOL(drm_connector_hdmi_disable_scrambling);
>   int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
>   				 struct drm_modeset_acquire_ctx *ctx)
>   {
> -	struct drm_connector_hdmi *hdmi = &connector->hdmi;
> -	struct drm_device *dev = connector->dev;
> +	struct drm_connector_hdmi *hdmi;
>   	struct drm_connector_state *conn_state;
> +	struct drm_device *dev;
>   	struct drm_crtc *crtc;
>   	u8 config;
>   	int ret;
> @@ -663,6 +663,9 @@ int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
>   	if (!connector || !plugged || !ctx)
>   		return 0;
>   
> +	hdmi = &connector->hdmi;

hdmi is only used once (and you are going to delete it in the next
commit), so personally, I would prefer to delete this variable in this
commit and use connector->hdmi directly when needed.

> +	dev = connector->dev;
> +
>   	/*
>   	 * This is normally part of .detect_ctx() call path, which already holds
>   	 * connection_mutex through @ctx.  However, re-acquiring it with the
> 

drm_modeset_lock() here could use the variable dev instead of
&connector->dev.

Anyway, these are just a few nits.

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra

