Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DF40B115
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356007; cv=none; b=Js0MvBF75OvRyVFJ/21gzqL/+8MhBn/krO6TzocvvFiuU5jrF7TteRRv5i8l9bJxlzsV4p/TxB611Q3R89LNcJbUNlj8LjzqfpbgM8c0Rwer80e15evBEcq68o7no1Q4ZhGdT3WzL3JOSZDCgKxw98M0jewmFVQEE/BPSQBrE8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356007; c=relaxed/simple;
	bh=vW6bAd37fQHgNUV0uozxLXyqrKfrAasVIu3vLbcXfs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGD7ckAVYdIHypjxxA/09mhf73yZUMSw1yZTH9tXDDMfamtKOPtoNu4Q6gTrxuAcGUUWAZyHlvMbQ2GBtsB6+n5c3yaW0pFqFbmWwObZ6HKMV3V6IGov8fOuBMqKOVRJKlRSBVjflVqYshLciODZvxddBRbhwon6azTgkHJ7Nf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QFnJtB8p; arc=none smtp.client-ip=91.218.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QFnJtB8p"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vW6bAd37fQHgNUV0uozxLXyqrKfrAasVIu3vLbcXfs0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791356002; v=1; x=1791960802;
 b=QFnJtB8pFQf/xenwcwMxcuDMnEBtZkoalaFF6OqQpBY9B0PDCcwbXcyRooqw0cmnpaZqJXK5
 C2CGjXCQoa60zt4gzA6RQNk0MtOd33jTTRhWT5F3b0yY14+XeWFplQTeULlu2c+M+o0tHHHhWWS
 i2ZPlaS8D3WpNIez7ooI42StzZr1p859klA2I2DHCoKd2GwtNA9fX2Hvp8DHbW7d3B4tzCRJVxV
 61k7LixEdeO46Des6EXEY7ny9cETTHswdwc/bPeKxY1TADAGsG0rZ7LjD4bPoZEWFeWDLCMIE6u
 nPhZm3ON7MTKepGZDswBSHkcJkMjt3VlixQzLP26KY6wg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e645479399092405;
	Wed, 07 Oct 2026 04:39:12 +0000
X-Mizu-Trace-ID: e645479399092405
X-Migadu-Flow: FLOW_OUT
Message-ID: <018c6fae-49d3-4f89-8212-8c6b64a2829c@packett.cool>
Date: Wed, 7 Oct 2026 01:39:00 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm/dp: hold one runtime PM reference per plugged state
To: Joonhoe Kim <26rote@gmail.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yongxing.mou@oss.qualcomm.com, Xilin Wu <sophon@radxa.com>
References: <20260929130627.959-1-26rote@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20260929130627.959-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/26 10:06 AM, Joonhoe Kim wrote:
> The plug handler takes a runtime PM reference every time it runs and
> sets dp->plugged; the unplug handler drops a single reference when
> dp->plugged is set. msm_dp_bridge_detect() also takes a reference and
> marks the sink plugged, and keeps that reference as well -- on every
> detect while the sink stays connected. On top of that, in the current
> tree the plug handler runs more than once per plug:
> drm_bridge_connector_detect() calls .detect() and then .hpd_notify(),
> and pmic_glink altmode reports an IRQ_HPD as "connected" too. Every
> extra reference is leaked on unplug.
>
> On a Lenovo TB323FU (SM8850, DP over the USB-C port via pmic_glink
> altmode) the DP controller's usage count reached 28-34 after a few
> plugs (rpm_usage tracepoint), so the controller never runtime-suspended
> after the display was unplugged. It in turn kept the MDSS core GDSC on
> while all displays were off.
>
> Make the plugged state own exactly one reference: the plug handler
> only takes it when the sink was not plugged yet, and detect() returns
> its own reference when the plugged state already holds one, or drops
> both when it finds the sink gone.
>
> With this the count stays at 1-3 while a display is connected, the
> controller suspends 3-4 s after unplug, MDSS suspends and its GDSC
> powers off on DPMS off, and replugging (quickly or after 20 s) still
> brings the picture back. Only tested on this device.
>
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Related pending work: "drm: handle IRQ_HPD events correctly" v5
> (https://lore.kernel.org/all/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com/)
> removes the IRQ_HPD-as-plug path, and MST v7 26/35
> (https://lore.kernel.org/all/20260929-msm-dp-mst-v7-26-4b81473185e7@oss.qualcomm.com/)
> the detect-based hpd_notify for DP; the reference that
> msm_dp_bridge_detect() keeps is leaked either way. MST v7 27/35 touches
> the same lines as the first hunk; happy to rebase on top of it.

Also kinda related / touching the same places, tho not yet sent to the 
lists AFAIK:

"drm/msm/dp: Mark the link bad when an active sink is replugged"
https://github.com/radxa/kernel/commit/eb3247f6f9a39dcb15cf4b1df6d4732b1489b410

>   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
>
>
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6abe30bdff12..4e47b659c71d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,10 +412,17 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret) {
> -		DRM_ERROR("failed to pm_runtime_resume\n");
> -		return ret;
> +	/*
> +	 * The plugged state holds one runtime PM reference, dropped by the
> +	 * unplug handler. The Type-C side repeats "connected" notifications,
> +	 * and detect() may have seen the sink first: take it only once.
> +	 */
> +	if (!dp->plugged) {
> +		ret = pm_runtime_resume_and_get(&pdev->dev);
> +		if (ret) {
> +			DRM_ERROR("failed to pm_runtime_resume\n");
> +			return ret;
> +		}
>   	}
>   
>   	msm_dp_aux_enable_xfers(dp->aux, true);
> @@ -897,6 +904,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   	struct drm_dp_desc desc;
>   	bool phy_deinit;
> +	bool was_plugged;
>   	int ret;
>   
>   	dp = to_dp_bridge(bridge)->msm_dp_display;
> @@ -910,6 +918,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>   		return status;
>   	}
>   
> +	was_plugged = priv->plugged;
>   	phy_deinit = msm_dp_display_host_phy_init(priv);
>   
>   	msm_dp_aux_enable_xfers(priv->aux, true);
> @@ -960,6 +969,12 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>   		}
>   
>   		pm_runtime_put_sync(&dp->pdev->dev);
> +		/* the sink is gone: drop the plugged state's reference too */
> +		if (was_plugged)
> +			pm_runtime_put_sync(&dp->pdev->dev);
> +	} else if (was_plugged) {
> +		/* the plugged state already holds its reference */
> +		pm_runtime_put_sync(&dp->pdev->dev);
>   	}
>   
>   	return status;
This last chunk looks odd, is that not equivalent to just doing

if (was_plugged) pm_runtime_put_sync(&dp->pdev->dev);

on the outer level, outside of the outer if/else?


~val

