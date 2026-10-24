Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848224;
	b=sDWyX8lrIWkWVKpcAheu7GQNCW3ZfiQaPe6KP8jDDmldAR2n+MqSuYcmd9PKwhD52STC
	 7ayRx1oM4VnNoStz4CiPb8VBDQBnGOsJuVW0iZtZXn4UDMpcrVAAPn14B+TiDxmNR9jci
	 BhwJ1nW1X4EqD1yKCamUOJEdN4qsvtdX2swf2R7Egc0h7eUAuxva/g91BA5iS52fhnLOD
	 z/Sfl6Y2E+u7aKFMTf74wRVKy/cUiNQV3DlXTcbOZqJa7W+qka+zf9X2xmar/A0kif5QT
	 DL7Xhs0+ZSmTLKfRcxqA1oFyYMlbpHFBX6pEJAyzmkpVHXDELXIs/0xEfI0Egnafv2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848224;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BmOPd8jjUzSJEjyHdUjg4yjuqOFQ3OWoekKkiSGNQ1Y=;
	b=ZWzeLgwu7QH3dVZFPxLXfw76hMAD/m79p4KRKkl8uyDLO6xfHHsWok4jzxJ27WHZvTJ9
	 PSOxkouR0bOH95UezN+IYHKrWk41FofvGhyB1gNSWb7mYEfXZA3kfHC3r7D0ybjHrZX6m
	 SFFeApnHxAjY5CEcbTv3BZvC3F27C6PbaGKv67HFqqNkc34VNXVz4BdBWP7Crx0veblIj
	 tXuRCvbrMf5udQhy2HQAjg/qBtGkOgWFqaF5O38NjEwYToqQyV8ew6R9PKrOYAJuBD5p7
	 uD+732qtiK4qwY0iKaQfLNAzThoyfuCt537USCMqCaBYP0ShqmthM51K4dfbZTVE/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=JR0xJzSz;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0E606A330
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E0E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=JR0xJzSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=BmOPd8jjUzSJEjyHdUjg4yjuqOFQ3OWoekKkiSGNQ1Y=; b=JR0xJzSzsEEnnphgYjl3qrYfdI
	ks1h/bk5TC+H/et0eNM/NyiS59l2FvL9HMNiaci2IZexwgXfixmrAJlx4ccHi7zQFIbX52j4LVEk/
	K+AtqADvqK7mzMpWx9L8UVS9xzkGtkShoTLada4fpyUA0MeHZ/LTM3AAHwSCsAGm60c1+wVFPTINL
	GHi5t7unjaNpgTU1Folg2DbHm/RYZJ/DYp4iwBuNq3qVtkBlP8kE2G3XknWCbcGy0LRs7zlwSYF9O
	qpywvUSeMl2ijAsVf7+T5Bdr7IDL42Vx0BGY/7rk0ipeDnt6xpQ52aWXGaDj2vRAWkG9aFf8GZu2v
	279T+r5g==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKbif-008tLD-1o; Sat, 24 Oct 2026 15:23:33 +0200
Message-ID: <dd94d07e-464c-43e8-bbea-c0b659077d41@igalia.com>
Date: Sat, 24 Oct 2026 10:23:29 -0300
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
Subject: Re: [PATCH v2 2/3] drm/vc4: hdmi: always cancel the scrambling work
 synchronously
To: Lucas Tanure <lucas.tanure@neat.no>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261020151948.83459-1-lucas.tanure@neat.no>
 <20261020151948.83459-3-lucas.tanure@neat.no>
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
In-Reply-To: <20261020151948.83459-3-lucas.tanure@neat.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/26 12:19, Lucas Tanure wrote:
> The scrambling work re-arms itself every second while a scrambled mode
> is active. When the output is disabled, the work may be executing at
> that moment rather than pending, and delayed_work_pending() is then
> false, so the cancel is skipped. The running instance finishes after
> the disable, sees the sink report scrambling off, writes the SCDC
> scrambling and clock ratio bits back on, and queues itself again. The
> sink is left configured for a scrambled 1/40 link that no longer exists
> and the work keeps running until the next enable.
> 
> cancel_delayed_work_sync() handles both states: it waits for a running
> instance and blocks it from queueing itself again.
> 
> Fixes: 257d36d493e9 ("drm/vc4: hdmi: Add a workqueue to set scrambling")
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 2cc46036f11d..4a386e053d3f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -843,8 +843,7 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>   
>   	vc4_hdmi->scdc_enabled = false;
>   
> -	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
> -		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
> +	cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
>   
>   	if (!drm_dev_enter(drm, &idx))
>   		return;

