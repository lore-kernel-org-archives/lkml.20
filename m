Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306843C5DC5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931295; cv=none; b=slj7viORXZ0LZkuhKq3GIx62gMPxmk/tZ5z1DuHjn7khikwSDubo+Zk1ssEiOAV/ykTGIiRt9T6TshTXrVRxQpW2qROMW0wd15tPmO7CxfAEMqW2k3H+cH8/rQhLfkIlIYX5LE+a5R94Ta3TyZeUsscqZOpymm3Qt/nOqzWCyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931295; c=relaxed/simple;
	bh=gsOsSA4UI4GOcU56iaOUOuu09hKPfwyNrwyn83XFEtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue5/oAzBB8mwIZc4emgLsGlma58XVbHGg6b2tX6ZaXQM1FHa0nY6CVooTmCY8FvTYv/1iymnIp3eoYh+x0wyOzfLQO6UcIbsGkNR3erh51Z2bBi4qGYWkyMPziyyQbOl8j2m43TDYW8vxlEt+BNEdrVJPtCUNQbXWiXR5we98io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CSDHHrFM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CSDHHrFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789931292;
	bh=gsOsSA4UI4GOcU56iaOUOuu09hKPfwyNrwyn83XFEtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CSDHHrFMzwQEU4W0p1FcuCw3H5S2PhLEJadJ0qNmMi3xyQLqyoPkAMTtI41T35PkP
	 isFraDLisPMi1gwUIGIefx+deUKNcHrsYAfrDhZWeaP+2TyOD0uAQ/yE4zNVOJhucn
	 NepoFmm+MeV59UV5XtTwdMUr8qhdOUXnuBhW3Fg85cut71Nq3EFQkF83bIA0WoJUPX
	 bDHMYBG+i5wTbaL0QyvihEP2OxJT0G/A4SvI3FSlIaZ/6lAZpCFbrDpLUn6MA2LCjE
	 2H0t3mY8ZHqsgoNb0m1W32N5+h0EHAIVqwRzFJ9NFTvBFpWRD/OXQlNQyAA9Rj/3gM
	 UfPRUH2Jes6nQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E08B417E03B6;
	Sun, 20 Sep 2026 21:08:11 +0200 (CEST)
Message-ID: <cd511a10-eac1-4531-a0f8-8fc495a63ddf@collabora.com>
Date: Sun, 20 Sep 2026 22:08:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
To: =?UTF-8?Q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <4d885f9e201df6f48a06f4ab3b27a7f1@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4d885f9e201df6f48a06f4ab3b27a7f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Robin,

On 9/10/26 3:08 PM, Robin R??ber wrote:
> Hi Cristian,
> 
> I tested this series on a Xunlong Orange Pi 5 (RK3588S) driving an
> AOC Q32G1WG4 monitor (2560x1440@144, TMDS char rate 592 MHz) and can
> report that scrambling works, with one interop issue described below.
> 
> A note on the test base: drm-misc-next at the series' base commit does
> not boot on this board for reasons unrelated to the series (the
> unpatched base commit hangs early as well; I can dig into that
> separately). I therefore backported the series onto v7.2.3, dropping
> the vc4/sun4i/tests patches and adjusting for minor context drift in
> drm_connector.c and the scdc/hdmi helpers. The dw-hdmi-qp, rockchip,
> bridge_connector and helper patches applied without functional
> changes.
> 
> With the backport applied, all four 2560x1440 modes (60/100/120/144)
> are exposed and 144 Hz works, but scrambling initially failed:
> 
>   rockchip-drm display-subsystem: [drm] Sink doesn't support scrambling.
>   dwhdmiqp-rockchip fde80000.hdmi: Failed to enable scrambling: -22
> 
> The cause is the monitor's EDID: its HF-VSDB declares a Maximum TMDS
> Character Rate of 600 MHz but leaves the SCDC Present flag unset, so
> drm_scdc_sink_supports_scrambling() rejects it. The SCDC interface of
> this display is nevertheless fully functional: reading SCDC via DDC
> returns sink version 1, writes are accepted, and after the change
> below TMDS_CONFIG reads back 0x03 (scrambling + 40-bit clock ratio)
> with a stable picture at 592 MHz.
> 
> Since HDMI 2.0 mandates SCDC support for character rates above
> 340 MHz, I worked around it by trusting the declared rate:
> 
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ static bool drm_scdc_sink_supports_scrambling(struct drm_connector *connector)
>  {
>  	const struct drm_display_info *info = &connector->display_info;
>  
> -	return info->is_hdmi &&
> -	       info->hdmi.scdc.supported &&
> -	       info->hdmi.scdc.scrambling.supported;
> +	if (!info->is_hdmi)
> +		return false;
> +
> +	/*
> +	 * Some displays (e.g. AOC Q32G1WG4) declare a Max TMDS Character
> +	 * Rate above 340 MHz in their HF-VSDB but leave the SCDC Present
> +	 * flag unset, even though SCDC is functional. The spec mandates
> +	 * SCDC support for rates above 340 MHz, so trust the declared rate.
> +	 */
> +	if (info->max_tmds_clock > 340000)
> +		return true;
> +
> +	return info->hdmi.scdc.supported &&
> +	       info->hdmi.scdc.scrambling.supported;
>  }
> 
> I'm happy to test further revisions on this hardware, and to submit
> the above as a proper patch if you think this is the right place to
> handle such non-conformant EDIDs.

I merged the infrastructure patches earlier today to prevent further delays, so
yes, I think the best way forward would be for you to submit this as a separate
patch on top of the latest drm-misc-next, and see what the maintainers have to
say.

> For the dw-hdmi-qp/rockchip/helper parts, on the backport described
> above:
> 
> Tested-by: Robin Räber <robin.raebi@gmail.com>

Thanks for checking this out!

Regards,
Cristian
