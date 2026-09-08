Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2A3B19BB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903129; cv=pass; b=YXE4BixzDVDLclWJARNoqmNnM+fUI4E+qiXxiEEKhqKFBz5leXjqYb+hhBsC8mJALuBiXxjXE7FCDmfEfCTTfmMviDx/TJElTUuMtXGkFp6XSHAdzke3aXJ9ClXSwvmGjfB59HjO5n4dqvXxyy9Sb/eI50khAHIGM5dM/uEsqsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903129; c=relaxed/simple;
	bh=sonfCy+IOKCTMS6riNdFn169WHxC9JIJJqw+0ayYAMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqIDarDgtWwS1eT/g3YEOUvCOpiZgMSqAkcfgrPdIgoA/DyKYFtxT3Avdtw9J6MVqMRfkVEQ0dD7rlAws/4hxQdPklh/fXvh79W0ucwziFWNMNMCc5LDq2A5WS6cdWLwlNMJRmivoiYUYVN/jODOWq4H2/khvWKKbeTSSpMadzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b=X/WExNVc; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b="X/WExNVc"
ARC-Seal: i=1; a=rsa-sha256; t=1788903110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NziKeWl8kgQ6SF2M3WyXtmkRxAeoaNDzcQrKuXycIWx3lUpkOsQkxtHLPXqSFCX0FjfDq0sWZV+7C24PrFWszRRFKLLe9w5735MA2j0otUZtFTldc/9B/KzR2C6eotSNXgO5dKA4owIQZQ0Yd3QsNqQsD8OpgyARzDHT+yw6m8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788903110; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2QXAQIio73iU0NLTckEfw4ZRVouQugyIwuj++db5nPk=; 
	b=f71wMvrbWyrFsT0op7Td/62LDMTH2A1AsnB57bRgiNAJfPW0jv8iCddN3uvEuu77+4Rb4xMpxDLX4uSY4btFHb2fRRe9zrSYig4VxKqOF5kgte5auxbWiV3BS7orF99R2+0XMKx0FVpR70aj/cQVkRx0OvAa8fCV+H0Vd3j5Uls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=leandro.ribeiro@collabora.com;
	dmarc=pass header.from=<leandro.ribeiro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788903110;
	s=zohomail; d=collabora.com; i=leandro.ribeiro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2QXAQIio73iU0NLTckEfw4ZRVouQugyIwuj++db5nPk=;
	b=X/WExNVcWcr6qVUs6RFMe0qwXmqt3b3mFhvpKrqUWHB+b8DVdVHyh2CMuR9tvN4A
	XtOG+wPp1BGER0fCRtdhM+N8LVlEZkyEp322/+w7jgzvbnXH5XozniALMe2ZrD/vXES
	gQmfqEmTbd5m1/YHWBQwNmXssaF3ZnwRXTOu7bjk=
Received: by mx.zohomail.com with SMTPS id 1788903108562380.78051531135134;
	Tue, 8 Sep 2026 14:31:48 -0700 (PDT)
Message-ID: <d252a015-f8c3-43ab-87b7-e078032054d6@collabora.com>
Date: Tue, 8 Sep 2026 18:31:43 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
To: Roshan Kumar <roshaen09@gmail.com>, linusw@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, pimyn@google.com,
 linux-kernel@vger.kernel.org
References: <20260825105427.686619-1-roshaen09@gmail.com>
Content-Language: en-US
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 8/25/26 7:54 AM, Roshan Kumar wrote:
> Commit 860e748bddcc ("drm: ensure blend mode supported if
> pixel format with alpha exposed") added validation that warns when a
> plane exposes an alpha format without a pixel blend mode property. PL111
> exposes several such formats but does not attach the property.
> 
> The PL110/PL111 controller scans out a single framebuffer and does not
> blend its alpha channel with a background. Advertise
> DRM_MODE_BLEND_PIXEL_NONE to match the existing hardware behavior.
> 
> With panic_on_warn enabled, this warning prevents the syzkaller
> vexpress-a15 manager from booting. The change was tested on current
> master with QEMU 10 and the existing production DTB; the guest reached
> sshd and returned an SSH banner.
> 
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
> Link: https://github.com/google/syzkaller/issues/7805
> Signed-off-by: Roshan Kumar <roshaen09@gmail.com>
> ---
>  drivers/gpu/drm/pl111/pl111_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 5d10bc5..758b297 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -15,6 +15,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of_graph.h>
>  
> +#include <drm/drm_blend.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
> @@ -596,5 +597,10 @@ int pl111_display_init(struct drm_device *drm)
>  	if (ret)
>  		return ret;
>  
> +	ret = drm_plane_create_blend_mode_property(&priv->pipe.plane,
> +						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
> +	if (ret)
> +		return ret;
> +

Hello,

Thank you! Looks good to me from the blend-mode requirements
perspective. But I'm not familiar with this driver. So, with this caveat:

Reviewed-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

>  	return 0;
>  }

-- 
Leandro Ribeiro

