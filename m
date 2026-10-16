Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D1471268
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142027; cv=none; b=H7IKtYATKtcAurQ5lCSTqxauJMCr6bXOM4mYXr6+hmpuhVcOgmoF5hFD+gcJcOtjoiIdq+48Eazw57djEN/4wd6rK4SzxzdzsbhKpa9Rin4G17cf7ohuhBoz4/IRTtTWllLaTCUQ7rWiLXCqK0mWbbwNoX2oOnDO7lNOqyiwQw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142027; c=relaxed/simple;
	bh=jnFEmGSygWYGhG5T2Ju2KliwYaheLg8Z/WkaH0FAMYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8CIuHVMxhfPC/5Zfh/yxIKz5IPZEDvbh+iu/J/OGEE2T7GnkpMZEn2rrw2qR2nGPweICAhhRH43sSwd1n7quawq+ovOvM0hexHBysLTmdtGpbFFqGO0ElVGlog/qIzE9uEniy0JgZU/MuCfdmqCq9czQ72f54cj3LNFRKVYNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlsb6Lkg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlsb6Lkg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e011d370dso219923f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792142024; x=1792746824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yIHWFqFvTEQhLbqkq1xydFjXcFxrGagw9+5Eh0/eio=;
        b=jlsb6LkgAbzqqThm4dlhM4Zm2ktocAXWRcOkkXOXFkd9Cy8hya8rk3Cd+HMTSynYMU
         1z049QVtsPBJ35s/BakG3hRLCKgnoMHDd4tkq7ICMRwLb3AflumpKi+ZMkD461NHGWV0
         9p0ilEOAd/kXFGLudYBHosw1Ayqg7cvVOQUV+ZiZjwTj8we6v88oP9HDyBxj6mu2+WB2
         fr6WyaBNwLym/kjZr1VgM7q+OyMl39ORzJnXe2zfHQQaz/RFt8eclHyd87MkRKaWvBY7
         IivTqhYdvQuL3QuhKHM0xkLiBZqe2GQwFyK0atJzloD2g3ZlyC2E+hYO/GcGxWMfQ9oi
         VA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142024; x=1792746824;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yIHWFqFvTEQhLbqkq1xydFjXcFxrGagw9+5Eh0/eio=;
        b=QjiDhV8rcIX/S+8hI/UCjYE8VC9xc6apwmDWvU2puRkYR4OEnpTh19NMmz+mSfIAUx
         b5A8GNP7HHBa2AcDGtUszazYyKRYsQGUeoYIzyb8A1EvLbGiO75gVMcKiCjLUs8mhvpU
         NgKy+3S4KwZT7fvVHTzzsmCl5JrSqYRnpDhRCH7ApW4sOcBf/7TPRu/gUXGeXCGnLVS4
         VWK6DS9IkqPFthpJV0MGFqVRUS0JBYsoCZRD0HF2ioeKiBgvIgFwPaa6rzh+2Pi7rB5X
         8s6XSDqymJwz7H6ElBIQ9HpF0i49706d9TLI0rTKOkrXrqcj2muJ2J1+7jrhnWtD2B/2
         iPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLuzoATG7y+uawCSRMFWEpp8KAkSXUf3yjy9Ex+RSaIjUyNB+1s2jpeCwxCayUu+XPk2pCKlxd1Iv8EaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXuKmKOyVezMe/hKRATxQ52h7NvUB8VmNvYvD2b4f0afSSIjBU
	MFAip8sgCQbMy6L7kLhhc/W6MPPycPLQq7M/c1klMRXhDinxg7yyd65vrlaaRml5vOU=
X-Gm-Gg: AYBFou1EQsSIguwTQlv8gCWpcUyk2XZsnXKGZTiWP1lfFK8MWIC2E1rlPfBz/OERwwx
	lijnDeSLrVC94sK1WZhiA5tcT92ZsaxNBHmljKEL0DXyBqzhT2Jf9ry9Xu6ec0XtblQkqENFa50
	N2WnxFRk5BYp1wlAfEHT5L1x7AReK4TiNJwm1uBGnfTL22Nb2KjGc4P5a2VFF5vxR97ZT8sKAFR
	SK3gwo8GKMhlNhdnMck82x3NEuaeW0nHsXU4/nFhPn+5HBT+eKOOzAGZUJSjOwDW4jmlETfm+DE
	JdIS+pc44AZHYdwjcL8l1vo/RKzgjQdzF5WpHLcVwPPOxwcJB/jFpcRb3WwxiHnCtWSTShVff7X
	f0GAbOJPYNX2Z3D/XIzbP3v3u2KzyAn5ClK0qoPs0+7dZVFln4bY5j7Pv/XMbvcJVme83ULf65G
	RvF665sFlWvpdDEqbFgZAdRPRhWExzZzjWANGL7IbCm4jRwCdLtx25jwsPSOeiVUdpRT35pVNjG
	ntcNvp8PAU=
X-Received: by 2002:a05:6000:60b:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48dbace40damr43712737f8f.47.1792142024343;
        Fri, 16 Oct 2026 02:13:44 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm3626767f8f.30.2026.10.16.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:13:43 -0700 (PDT)
Message-ID: <7e5d951a-6e50-4dc7-b9fa-79146ad7c773@linaro.org>
Date: Fri, 16 Oct 2026 10:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration
 options
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <PoiQ1yKIrL603-Vkg8cV-j80USThOheuNuXcG_ZhEPuSRP-KLZBYJoj9ormog-3yCjbGRt0kKRXOGrahJOpNMQ==@protonmail.internalid>
 <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 23:20, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The generic PHY framework has a mode and configuration options for MIPI
> D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
> that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
> phy_configure_opts_mipi_cphy. The options are the two values a receiver
> knows: the symbol rate on each trio and the number of trios.
> 
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>   include/linux/phy/phy.h           |  5 +++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
> new file mode 100644
> index 000000000..e3f0a8257
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy.
> + */
> +struct phy_configure_opts_mipi_cphy {
> +	/**
> +	 * @symbol_rate:
> +	 *
> +	 * Symbol rate on each trio, in symbols per second.
> +	 */
> +	unsigned long		symbol_rate;
> +
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active trios.
> +	 */
> +	unsigned char		lanes;
> +};
> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb4..f12337834 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>   #include <linux/phy/phy-dp.h>
>   #include <linux/phy/phy-hdmi.h>
>   #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>   #include <linux/phy/phy-mipi-dphy.h>
>   #include <linux/phy/phy-thunderbolt.h>
> 
> @@ -42,6 +43,7 @@ enum phy_mode {
>   	PHY_MODE_PCIE,
>   	PHY_MODE_ETHERNET,
>   	PHY_MODE_MIPI_DPHY,
> +	PHY_MODE_MIPI_CPHY,
>   	PHY_MODE_SATA,
>   	PHY_MODE_LVDS,
>   	PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>    *
>    * @mipi_dphy:	Configuration set applicable for phys supporting
>    *		the MIPI_DPHY phy mode.
> + * @mipi_cphy:	Configuration set applicable for phys supporting
> + *		the MIPI_CPHY phy mode.
>    * @dp:		Configuration set applicable for phys supporting
>    *		the DisplayPort protocol.
>    * @lvds:	Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>    */
>   union phy_configure_opts {
>   	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> +	struct phy_configure_opts_mipi_cphy	mipi_cphy;
>   	struct phy_configure_opts_dp		dp;
>   	struct phy_configure_opts_lvds		lvds;
>   	struct phy_configure_opts_hdmi		hdmi;
> 
> --
> 2.53.0

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
