Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=8.221.36.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470276;
	b=wkQi8+ikCPM4iIbCO0N/Lyc6TkB0oUpPcutz5+kMguBORtDQjcscIGHPSdjkjO2OAeqU
	 U3pehfPxV3NrxXvR4pNTlRrIb7uFMiGAei7kILXQnC0I+DUOkRm5n19KkZC9RDKKqspBD
	 NkCj+QC9O4WUaDGKQU05o0wvbPJYAzovlW2pDpnLbaidz9hKRdtjTbDfynm0ShJOM8Hh5
	 aQBNDP3fme5gg3gepfcupMhPwU73FCCBQcYkYjnykNoPHVhi57Vl2ZE0d2Tw4jskEPK7u
	 RbnZvhe/6RzN67Bhc2uMl44s8GWJXTz46b3zfT7YGCeKLm/KjsDbiVY7GRkU97Sp7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470276;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=NEKjIJAa/BSs/0v1WVFEUUAthlW5GEQY1FS7GPyIJQ4=;
	b=VTaLDP0bbf90LpaeKZYsAexvpajDwSSz/rCNQX7PNG3G5rj7XTP1kvKmFhFMhxoLl7Bj
	 oE7c9ktQCpk6e1WXQ1iYmtT/budZ57iUGjujmeCwT67wvAi9zMKlb3aYlS7rZaXbTdjQK
	 N2JXjgIE/Eo7peKUcNLYusR1vF/z1jmLoH2vwiv8Qt78iIFJtM1lWxNCyZM2YpkOaP9rM
	 xjndOnws0ACyRcx2jqbcsYWnX5CX7Fset3lM7LxV6MPS0B4nGK1Go4a8WSjEoEwkMQgWg
	 YyaGUTVS5kuzXujiYhPtoBlG+waW90b5YZOYSdjD5teqQhr/HOGyS0Y9XqbOlG6YRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MOcq+jSD;
	arc=none smtp.remote-ip=8.221.36.233
Received: from mail-m822136233.xmail.ntesmail.com (mail-m822136233.xmail.ntesmail.com [8.221.36.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F79606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MOcq+jSD
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 546cef110;
	Thu, 12 Nov 2026 15:57:40 +0800 (GMT+08:00)
Message-ID: <2807a167-0dab-4732-82e0-a3b5ebcabb15@rock-chips.com>
Date: Thu, 12 Nov 2026 15:57:39 +0800
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
Subject: Re: [PATCH RESEND] drm/bridge: analogix_dp: Use
 str_supported_unsupported() helper
To: Thorsten Blum <blum@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111164243.77775-2-blum@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261111164243.77775-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1cec32ebc03a8kunm267e7e3944dc00
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTR5CVkxJGkJPQk1JQkJOGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MOcq+jSDGGNBYVT+/mW4+Q3Aa/pYQ+X2jK/EoP5YAL1/WKPP8vTzHomzLDTanMzevw+vCPow3y1ugMqOT9nytLk53BmHmtTxViHcvMZWyFJnG79KwUgiDJzepDg5iWCovHd4nbdLv0glrXp3+PZNwDmlNb98nUuNmsBmjBDUohc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=NEKjIJAa/BSs/0v1WVFEUUAthlW5GEQY1FS7GPyIJQ4=;
	h=date:mime-version:subject:message-id:from;

Hi Thorsten,

On 11/12/2026 12:42 AM, Thorsten Blum wrote:
> Replace hard-coded strings with the str_supported_unsupported() helper.
> This unifies the output and helps the linker with deduplication, which
> can result in a smaller binary.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6df6963740d2..59d3ff9bcde4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -19,6 +19,7 @@
>   #include <linux/of.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>   
>   #include <drm/bridge/analogix_dp.h>
>   #include <drm/display/drm_dp_aux_bus.h>
> @@ -745,7 +746,7 @@ static int analogix_dp_fast_link_train_detection(struct analogix_dp_device *dp)
>   	}
>   	dp->fast_train_enable = !!(spread & DP_NO_AUX_HANDSHAKE_LINK_TRAINING);
>   	dev_dbg(dp->dev, "fast link training %s\n",
> -		dp->fast_train_enable ? "supported" : "unsupported");
> +		str_supported_unsupported(dp->fast_train_enable));
>   	return 0;
>   }
>   
> 
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

