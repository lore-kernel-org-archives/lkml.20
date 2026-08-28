Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030C250BF2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787879846; cv=none; b=cWhARvRlJMQqyAQX/8nm2KlRrloRrgjUgUo69EPttl2n1EHMlea7Y8jPB7OyrPg+OuHYe2B18ExGmAllyUtF8EpF1xnObyr8vleFdemS5g5FVxzc41ZIIKlZU/sntyu3pQbf//ERaG6bHZatXW5J3FOtwjw2zBLXM2hgMwDSA/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787879846; c=relaxed/simple;
	bh=MKo80rpFFcKLxbzWd+47HJ9UwVNtIHJmWU58Xa4Bwco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDmiDPyPTp4fRf3/i8GKEnDW6WfO2M1wz6E/tuk/3yB7XYljl1X4jc55W+liQ5I0U+mV9d8fMAxuHucE4ewja8F1KwEs94SZGDWgLmLY1DPiRv4h/S+PHYmcL/Uo6Z2kBqKKmKQ5R8hd+1tEDdSboaqe2hSxAP8lsg/VGFELaXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Mu86hMct; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Mu86hMct"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7f4f824de5dso97200a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787879844; x=1788484644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HKFBwDyQOTBtP3LF8rbCVIQqdBEXNYZb1kTqyGwOWOk=;
        b=LzchwbmKgw3DjV+dG2pYYx3XfJ/jvdu82+UsF1bStG6qA1GSafERvipFt+ZGnrmHRn
         vmHNzYXOZJAZdOqlPzFBIpf5Lqi6RX4JvAQNTrdpBM50VOHsVJIomW/GsNDvC9nUbLn5
         /sHS/z8Rw5nHQGP7sCWORhOqxmn3TFhH6mXo7GCbiMCChjT6wGeeatN6anYp0PhcVCOt
         kNcUMEoyn9fBLnb85jui/Zrxg8+ojmDqOU60xMIbTrY140f4TI/CTM9akPs8HKGxjp2x
         ennymGwelaLJpxA4F1qJcaP6DKDwBGdOpnzn7SJ3Uk9UUbI0t29KbOO5KmRhKkiJAX9E
         0qbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKaPDJxylK0p4uGk/lBX/MeFhmlPT/CvzlHWT0Bt6j9IeeaPVbUYlOQ1UvgytVOorq8gkwC3E4lNf2YhY=@vger.kernel.org
X-Gm-Message-State: AFuF++kli4uTOU2FLdjtUeJywVgHvFin8IU94Fo4Lhbn7aOtcjCFg4Ps
	LcTZXzFCj+BAYkcmUAn3Ge3y79QKmuOAwT/Tv5CXsq/5AioYLPi+yc4aAwG4nn5r86uMfOcOw+R
	gtX8VhChYFaPYb2dySWvFYHfZVP7JZCTsTQ7LvWSj0iXOtzM76VWtXDN7p69RojM871n5y4qAaE
	l8MiEn0TexUbbG3nhr2Du+OWFr+nbjs0GvIw++uqoULKdFHGV+VzRJQk7L5wemOy2PeTt/Ze1vC
	9DLp5mpRCSMcEgs2r6/E9qg
X-Gm-Gg: AR+sD10kgXrDesMyhgZW4B/HXsUPmKyys6O3MGo5ixpmfRVpY9ZfNTnxlAliCzQaRgm
	i3U/mjiW8YF8tT7KQQCp5RprYipT/EHxm5fRXUEJBFkLr48F3w0wqxDtXvUZ9LCGTfMV0u0b3ve
	d8Bf8htWZ74eke0QQon9Z/US3QvAUI6418MZX/wh/cWc3c6kTx2biYxit7cYSqYVA79j+HO3YP5
	VF5o33fbiXOCZF5XOPE22UbcSe8l5ZtXGRStVkGfDEzpfW8c74oCoWNwOuNVlX9YPU574jRjw2Z
	pngMdBJpgZg/QcAwFmmLG247QtDgOlb3jI76ADVxfudQ2tGYMEhi/uWE9O6OcjYEjYUgMGy0Ugh
	NwxA9+DPj8f7+BFb9w0f7O+mH/5pfSGq7tff/wxjHilMG37FrssOXH/KBuGY9RrLo4792l5Pb2A
	DnSCeGICAKehDtXktw75U73dxpBWv0oGbD9oaSh0Rt74w=
X-Received: by 2002:a05:6820:55ca:10b0:6b1:b91f:e26e with SMTP id 006d021491bc7-6b1c66928aemr2266419eaf.16.1787879843665;
        Thu, 27 Aug 2026 18:17:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6b1ce085f85sm1979eaf.5.2026.08.27.18.17.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 18:17:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so444303a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787879842; x=1788484642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKFBwDyQOTBtP3LF8rbCVIQqdBEXNYZb1kTqyGwOWOk=;
        b=Mu86hMctlTyVwTQzsLw1Wfe94vyEG0ntwdhviSKpNZuUcco/o5K7Jwh8OGo9yq2CV2
         cYAgmyI0HpCtCsDzqCGx1mhEVjnzfTb7jb6sdWk1pNAGaCCs6Xqv4PtdvynHaF/3nKv6
         uQKQ/kA07ueyTsQtActDif5ddJiRhZ8Ug4JeA=
X-Forwarded-Encrypted: i=1; AHgh+RoS6Nzyp3Y+Rnh7HrOFHisTSIImUae4EYwW1i9NSurRUqekF9Kuqq5Z1meNUe1NOBorhS1DFxoR62oebIs=@vger.kernel.org
X-Received: by 2002:a05:6a21:6b87:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3d266582c55mr6446019637.8.1787879842199;
        Thu, 27 Aug 2026 18:17:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b87:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3d266582c55mr6445905637.8.1787879841719;
        Thu, 27 Aug 2026 18:17:21 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm1055689c88.8.2026.08.27.18.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 18:17:21 -0700 (PDT)
Message-ID: <ef11cc4a-fbaa-415a-bda1-2ac491f3b5e2@broadcom.com>
Date: Thu, 27 Aug 2026 18:17:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION
 as unset
To: fausten <yunfeng.li.nb@gmail.com>, dri-devel@lists.freedesktop.org,
 zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org
References: <20260823083211.2654733-1-yunfeng.li.nb@email.com>
 <20260823085916.2707488-1-yunfeng.li.nb@gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260823085916.2707488-1-yunfeng.li.nb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/23/26 1:59 AM, fausten wrote:
> The cursor plane code validates cursor dimensions against
> SVGA_REG_CURSOR_MAX_DIMENSION before every cursor update, and
> rejects the update with -EINVAL if the cursor is larger than the
> reported maximum.
> 
> However, some SVGA implementations do not implement this register
> and return 0 for it. In that case every cursor update is rejected,
> and the log is spammed with:
> 
>   [drm] Cursor dimensions (64, 64) exceed device max 0
> 
> The visible symptom is that the hardware cursor never appears at
> all on VMware Fusion guests (SVGA version 2), making the mouse
> pointer invisible even though the input devices work fine.
> 
> Treat a reported maximum of 0 as "not implemented" and skip the
> dimension check in that case, restoring the pre-existing behaviour
> of accepting the cursor.
> 
> Tested on VMware Fusion with an SVGA version 2 device where the
> cursor previously did not show up.
> 
> Fixes: d5ed8749168a ("drm/vmwgfx: enforce cursor size limits for MOB cursors")
> Signed-off-by: fausten <yunfeng.li.nb@gmail.com>
> ---
> Changes in v2:
> - Fix author name and email address (v1 was sent with a wrong From).
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> index d1e7df500..fbdd23ecb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> @@ -237,8 +237,10 @@ static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
>  	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
>  	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
>  
> -	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
> -	    vps->base.crtc_h > cursor_max_dim)
> +	/* Some SVGA implementations (e.g. VMware Fusion) report 0 here. */

The issue here is not with vmware fusion but the hw version, SVGA_REG_CURSOR_MAX_DIMENSION requires cursor mobs,
which are available only on hw versions 18 and above. Please correct the comment here and below to reflect that.

> +	if (cursor_max_dim &&

Could you instead do cursor_max_dim > 0 here and below.

> +	    (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
> +	     vps->base.crtc_h > cursor_max_dim))
>  		return -EINVAL;
>  
>  	if (vps->cursor.mob) {
> @@ -748,8 +750,10 @@ int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
>  		u32 cursor_max_dim =
>  			vmw_read(vmw, SVGA_REG_CURSOR_MAX_DIMENSION);
>  
> -		if (new_state->crtc_w > cursor_max_dim ||
> -		    new_state->crtc_h > cursor_max_dim) {
> +		/* Some SVGA implementations (e.g. VMware Fusion) report 0 here. */
> +		if (cursor_max_dim &&
> +		    (new_state->crtc_w > cursor_max_dim ||
> +		    new_state->crtc_h > cursor_max_dim)) {
>  			drm_warn(&vmw->drm,
>  				 "Cursor dimensions (%d, %d) exceed device max %u\n",
>  				 new_state->crtc_w, new_state->crtc_h,


-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
