Received: from mail-m3282.qiye.163.com (mail-m3282.qiye.163.com [220.197.32.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE4339B3D;
	Sat, 10 Oct 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616535; cv=none; b=huOh+vjPYheF2jaqAY9I39DGI8c++BKr03SEWF0f+KlbDxq0km6w8HOaHC7vWRm4mfCbWSpo89Zkwp3YtESqgt2Getkb94K5ygJVW6gdIoSrSjDdijkhxd7Yge5n6Yzim2vtdDW05loTD2okkv1zCh5MmA8YaTWR0oHqwYO49Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616535; c=relaxed/simple;
	bh=8UhtiJiYJ6IUOaCkzx9Qo/Ikis6bCPd3jFzR45eQanM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OU+V9qxM2TFiTzrkarQY4aTS7J2SmwiGX1KiM+Bu4552MTj8CJZ+/jvToobSbiHbQ345GrLF3Km0vPx3/8aM49SdV9ZdLqQZg6BnYQ1NMLrrvfPX/yZho33Btiw7VQGWQmEbejMRcuyVR85Fhpqhly/iy5kQkVLSHKm/zpBF1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=i94VClHp; arc=none smtp.client-ip=220.197.32.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="i94VClHp"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50844c1f1;
	Sat, 10 Oct 2026 10:39:17 +0800 (GMT+08:00)
Message-ID: <82df3bec-7734-4d84-9e20-a563e6231aa9@rock-chips.com>
Date: Sat, 10 Oct 2026 10:39:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for
 non-HDMI bridges
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Igor Paunovic <royalnet026@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dragon@radxa.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa123add66203a7kunm2ab09db81359c42
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0pOVhhNSkpDTE5LGUxLTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=i94VClHpmYbPXhra1VFNUWbroJUdigk/oWp50gX7ervPys3K2s89uJ6im7uYzB+K9Mxa0lfSSxWf283hIRmL3nwSXVFQmawBo3cLD/gvMowHXWjivohlyoUWXk+3x5MmP+uXkfggUtHMpXew44L7yTW2oTI2X/HnWu3BM3ghnJg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5z0sWq1xdiTzWPgicaSELr86K89CYKpEepP4VhiG/1g=;
	h=date:mime-version:subject:message-id:from;

Hi Xilin,

On 10/9/2026 11:15 AM, Xilin Wu wrote:
> Allow non-HDMI bridges to advertise their output bit-depth limit through
> max_bpc. Attach the max bpc property when the lowest reported limit in the
> chain exceeds 8, ignoring bridges that do not report a limit. This lets
> DP drivers expose deep-color support without attaching the property in
> their connector initialization code.
> 
> Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
> 8 for other connector types. Keep the existing HDMI registration path.
> The property can be attached before connector state allocation; the
> atomic state helper initializes its default when state is created.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
>  include/drm/drm_bridge.h                       | 11 ++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8b54069fa53a..be2e08a3694a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
>  	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
> +	unsigned int chain_max_bpc = 0;
>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> @@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			panel_bridge = drm_bridge_get(bridge);
>  		}
>  
> +		if (bridge->max_bpc)
> +			chain_max_bpc = chain_max_bpc ?
> +				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
> +

The check on chain_max_bpc here doesn't seem to make any sense.


>  		if (bridge->support_hdcp)
>  			support_hdcp = true;
>  	}
> @@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					  connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		if (chain_max_bpc > 8) {
> +			unsigned int min_bpc = 8;
> +
> +			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			    connector_type == DRM_MODE_CONNECTOR_eDP)
> +				min_bpc = 6;
> +
> +			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
> +								    chain_max_bpc);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}
>  	}
>  
>  	if (bridge_connector->bridge_hdmi_audio ||
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 58fff047f43b..01ad1878149e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1089,9 +1089,14 @@ struct drm_bridge {
>  	unsigned int supported_formats;
>  
>  	/**
> -	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
> -	 * values are 8, 10 and 12. This is only relevant if
> -	 * @DRM_BRIDGE_OP_HDMI is set.
> +	 * @max_bpc: Maximum bits per color component the bridge supports.
> +	 * Zero means that the bridge does not report a limit. For HDMI bridges
> +	 * with @DRM_BRIDGE_OP_HDMI set, allowed values are 8, 10 and 12.
> +	 *
> +	 * For non-HDMI connectors, drm_bridge_connector_init() attaches the
> +	 * max bpc property when the lowest nonzero limit in the bridge chain
> +	 * exceeds 8. Bridges remain responsible for validating configurations
> +	 * against any limits not reported here.
>  	 */
>  	unsigned int max_bpc;
>  
> 

-- 
Best, 
Chaoyi
