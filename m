Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226574;
	b=qyAvEYDc2b5JQJeXhwrh0e+ddEhmkxda88xTBECIqnz6Ue3k4arP4DwKEWbDCbln2Ivd
	 vWGhsyLuxs5sSHmgAdJ7uaMI7ebQy0uohYMQVfNl1HRlgTMd9CncGRgMoHN/99k85Zyzp
	 C8KpGSeajOh64K2C750GU//+zJq8LIawHHk1f5O99+8/fIGSgE/W9nFOvS7we4riGIWZl
	 zUUNs1SpNQdsOKfDLqNLdOaU8GxuszCmq/EN5mk25hoGRS3JCqMAWagxqkbSfEcEHyj4s
	 2P4Rhqx2QE8VpDw1YN6D0t8il5mjTkVvL3yRd0LAhW7fWRkqk0TK9hzkMNE8HKa8zBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226574;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8TAq2QyHAbaRrxjpEblbq+kj+i/LwgTgkLNLPqW3GRY=;
	b=19lHSd9dZVdCsTNke8PFipiQWd8lRN2aee5ATEkj9nut1yZ2eNA5Uy8uEvn6g6mfBFz2
	 zH+y7jxhzRdvDLKnJ5ryESFmBcJqop7iXtsZll8OlyVX8Wl1Aa+FW3eioJ1uwQ5D+u82l
	 i/2mRcZt6MRu4IvdiibiFn5jlh4x2R3pQvjuXq9Z+mbnVY3+Mh1Bq9LXhfdsg9V8l3PHN
	 FBIFahZ+WiAIBOgna+By3HX5yfEFHW1MIzojOUaFUV1BUwyOV7sFx4WfgbAKqWDNpxI19
	 AWC/mC7y7RnFSDnE9cU5i3FSqnnhYmwSrk9yB5RtA73zMb+/Y9hfuP1I2hstbijHIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kZrENWNY;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0026606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0026606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kZrENWNY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=8TAq2QyHAbaRrxjpEblbq+kj+i/LwgTgkLNLPqW3GRY=; t=1794226572; x=2109586572; 
	b=kZrENWNYIWLo5IuCG0cqp9Ws9kLiRs4m+JYk7HmM/7Snb/9RxiCGZmicGnIwlYpGHn90OQ+ESkZ
	+Dwm9IPVEvRjSS6McWekSKmbmceuDdPgbxHm++KFqRQ0wv4ir9FXIGaNDRE7SW1HgN5/1oqBN7tiE
	yKYRwBkl6ZBiOpIDC2jjyKLTiFJEs7lisVMQffvdiBeqAT5IrAgpfMq29VgkHzRaWHUmhMCoC+Ll0
	UQU4CJ8iQFYxD9Tpg9wMqOMmkT6QFtDHKGdJWkFz4NXCYieHSXjVxh8wjPWVVfcxpKTFWRiLFRLjg
	uwGNt5sDPgufSc2NcRPQN2ue23avOxa2UroA==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQOI3-007Fj2-0Z; Mon, 09 Nov 2026 13:15:59 +0100
Message-ID: <0d32ee68-9f2b-472a-80ef-f4a69705b115@igalia.com>
Date: Mon, 9 Nov 2026 09:15:54 -0300
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
Subject: Re: [PATCH 3/3] drm/display: hdmi: Reset sink scrambling on
 non-scrambled modesets
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
 <20261104-hdmi-scdc-scramb-fixes-v1-3-16a9bb3d64a6@collabora.com>
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
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-3-16a9bb3d64a6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/26 10:26, Cristian Ciocaltea wrote:
> drm_connector_hdmi_disable_scrambling() only clears the sink SCDC status
> when the connector is known to be connected.  That is never true when a
> source driver disables scrambling at boot to clean up after the
> firmware, as vc4 does from vc4_crtc_disable_at_boot(), where
> connector->status is still unknown and no EDID has been read.
> 
> A sink left scrambling by the firmware thus keeps both Scrambling_Enable
> and the 1/40 TMDS bit clock ratio set.  If the first modeset picks a
> mode below 340 MHz, no disable happens in between, since the CRTC was
> never active in atomic state, and drm_connector_hdmi_enable_scrambling()
> returns early, leaving the sink trying to descramble an unscrambled
> stream.
> 
> Instead of blind SCDC writes at boot towards a possibly absent sink,
> reset the sink status from drm_connector_hdmi_enable_scrambling() when
> no scrambling is required.  By then the sink has been probed, and HDMI
> 2.0 expects a scrambling capable sink to have Scrambling_Enable cleared
> below 340 MHz anyway.  The reset runs regardless of source scrambler
> support, since the firmware may have left the sink scrambling.
> 
> Factor the reset out into a helper also used by the disable and error
> paths, gated only on drm_scdc_sink_supports_scrambling(), which suffices
> because drm_display_info is zeroed until the first EDID read and reset
> on disconnect, making the connector->status check redundant.  As the
> helper now runs on every non-scrambled modeset, read SCDC_TMDS_CONFIG
> first and only clear the bits actually set, so the common case costs a
> single DDC read.
> 
> Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra

> ---
>   drivers/gpu/drm/display/drm_hdmi_helper.c | 45 ++++++++++++++++++++++++-------
>   1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> index 974d5de6d380..278cfda38e18 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -470,6 +470,28 @@ static bool drm_scdc_sink_supports_scrambling(struct drm_connector *connector)
>   	       info->hdmi.scdc.scrambling.supported;
>   }
>   
> +static void drm_connector_hdmi_reset_sink_scrambling(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	u8 config;
> +	int ret;
> +
> +	if (!connector->ddc || !drm_scdc_sink_supports_scrambling(connector))
> +		return;
> +
> +	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
> +	if (ret) {
> +		drm_dbg_kms(dev, "Failed to read TMDS config: %d\n", ret);
> +		return;
> +	}
> +
> +	if (config & SCDC_SCRAMBLING_ENABLE)
> +		drm_scdc_set_scrambling(connector, false);
> +
> +	if (config & SCDC_TMDS_BIT_CLOCK_RATIO_BY_40)
> +		drm_scdc_set_high_tmds_clock_ratio(connector, false);
> +}
> +
>   static int drm_connector_hdmi_try_scrambling_setup(struct drm_connector *connector)
>   {
>   	bool done;
> @@ -522,6 +544,11 @@ static void drm_connector_hdmi_scdc_work(struct work_struct *work)
>    * the sink side and retry the operation, as some displays refuse to set the
>    * scrambling bit right away.
>    *
> + * When @conn_state doesn't require scrambling, the sink-side SCDC status is
> + * reset instead, so that a sink left scrambling by a state the driver did not
> + * control, e.g. set up by the firmware before boot, doesn't end up out of sync
> + * with the source.
> + *
>    * The work item is cancelled by drm_connector_hdmi_disable_scrambling(), hence
>    * source drivers must ensure the display pipeline is shut down on unbind, e.g.
>    * via drm_atomic_helper_shutdown(). Otherwise the work may outlive the driver's
> @@ -541,8 +568,14 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
>   	if (!conn_state)
>   		return -EINVAL;
>   
> -	if (!conn_state->hdmi.scrambler_needed)
> +	if (!conn_state->hdmi.scrambler_needed) {
> +		/*
> +		 * Resync the sink here, where it is known to be connected
> +		 * and its capabilities have been parsed.
> +		 */
> +		drm_connector_hdmi_reset_sink_scrambling(connector);
>   		return 0;
> +	}
>   
>   	if (!drm_connector_hdmi_scrambler_supported(connector)) {
>   		drm_dbg_kms(dev, "Source doesn't support scrambling.\n");
> @@ -581,8 +614,7 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
>   		WRITE_ONCE(hdmi->scrambler_enabled, false);
>   		cancel_delayed_work_sync(&hdmi->scdc_work);
>   
> -		drm_scdc_set_scrambling(connector, false);
> -		drm_scdc_set_high_tmds_clock_ratio(connector, false);
> +		drm_connector_hdmi_reset_sink_scrambling(connector);
>   	}
>   
>   	return ret;
> @@ -619,12 +651,7 @@ int drm_connector_hdmi_disable_scrambling(struct drm_connector *connector)
>   	if (hdmi->scdc_work_initialized)
>   		cancel_delayed_work_sync(&hdmi->scdc_work);
>   
> -	if (connector->ddc &&
> -	    connector->status == connector_status_connected &&
> -	    drm_scdc_sink_supports_scrambling(connector)) {
> -		drm_scdc_set_scrambling(connector, false);
> -		drm_scdc_set_high_tmds_clock_ratio(connector, false);
> -	}
> +	drm_connector_hdmi_reset_sink_scrambling(connector);
>   
>   	return hdmi->funcs->scrambler_disable(connector);
>   }
> 

