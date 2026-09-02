Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8830F3876B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381867; cv=none; b=dCDIgqtv8IUfYedSnLTADvm5YMEe2pAomSc3sc6tvyhrtsziH8cuDwm5/MEeIaHvgiiJfLbl/bd3XESUolhtAvxW+obLkXk1JHaf74mNx0m/GMf6GngsJ6pp04zSV/fG3c033ZNdfmFg180JnJQBMrAI88I9ScbBBk/YODLaUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381867; c=relaxed/simple;
	bh=t4ZEzWp1y1W9VaBiAdoym+vJF/RLWhP7llUrcF76EdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIvOftZ36Mp8tEBNnbiNvot9QMAW2D6Aqe5aY7nZPjnGmLSFt8LCPWLYH5s+F8QVLUPdCBhJMzWbfw6yRSMf8PTAaZLcH3SIQpmJPq8M1ZlQtp+e6CyzjhjeKFj+MgNmR5p+zxiApq4eQYxoh3MrDs/ZmV7/XAGHa3QbtoP9XQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XVQzb6Tn; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XVQzb6Tn"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc147d86bebso351398a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381865; x=1788986665;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PD094jSE9LfhMHsvJNe0MdQ7eQ98KtiXjUQDqdbLmUE=;
        b=oekTypehvSmMzMfw6DDjsMwNSBknz1Fmd116PecnCLgMJLOUmuHzFib184z9ixWsV2
         dHEqCOmQ1ZlFKw2Bq0ivE53f+KeUawjY56HZMEdvJ3G83RzrKHfzwjarWdtqE8CVyELq
         uL09/uB9mn93BnF1n/eNMY/nLNDcdkBxBsteQzuLz/gHnZ8lXoGbJNo3lq4L0sFlus5F
         2VrfjoL1qAp2OyVLmk8uYo6vONlgnq1QelviEcHJXcnR4LydBpa9O/RhmuSIqzmDuScq
         NI1iL4Zxroc+5A759Y8O1dLba5c4pqs1eyDNB1WldGvqbH77Fk0P96t94Pr+qwVHvoee
         Dqag==
X-Forwarded-Encrypted: i=1; AKwUvBzI8iHk8qr45MU6cCcJuPmh/Tg8TwI9I4DApRUbpDw5d7Wob1l4W+pBrMQqnAdj7v8HTWBszwtEzNCIzl0=@vger.kernel.org
X-Gm-Message-State: AFuF++lCGIN/8LTSczWOPgTsu5aDJrnI4HkKQR2QZAcdUgLEFaiUjm/m
	nSD2PJr/9TxXrX7keLi8MnifiTSQBFhauYPZOMDZWSO08J8ovdWihnjT1UxlrUS0o3nNgUapiXp
	hw9aT/Fm7m/US293o+qDF1Ij24lZjjyhXydW0HRifoPN9LcbPvMHZKZFvQNtVoyimD0ONNyva/2
	nV+ZcFakpOpahJauXjFzLGDHTKAp6jyu3O5l5ipyNVVzpa3ng8JCjqHopCHy0HeD+Yb4FnLjn2K
	d2RcbbdzyA5R3XDjc0LmdQr
X-Gm-Gg: AYBFou0bKUfGQnLSKuMPUCSi13q0EiRhNyIPhSQfB1MThbwexscjjlUpD5rb76CYboe
	9lCGsiu6XBsgGxF8THbRe4iZCambhtOwMcwbVZrQihN2LnB6hq9wVDgGZGIxGGti34KK9FmQbyT
	L1EbcZ6R9KYINcW28URXenm+rCz0nYXU9CODkx3fCu3S1S3ADzQPpvNaRmQWL324EkjrfXSO3Fx
	X6tVALPmmXZJnJf0rsKZNFywd6rt/QNhbh9UmzjcKDjs7NeaPyOVzF8WKQBP3Qq0qUw177OEK+r
	zCiybb2Fn0BCUs9lh517IQjVIKaViVXl2hTCQcYyZxlbbh/IjtEibuAgc1epPASqVhLLBX7RxRP
	TDRDScgcfp3SHG9ULF1nZHJTXYBhDXCBzGO4Ray4oCoUQT7WJdxvvfntWCBSaQjlBkTx22MBEHO
	wn4Dlt4kmryrYjlDfGkAYjOmcvs+lcXeDor7ifl5A8
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr1802302a91.19.1788381864595;
        Wed, 02 Sep 2026 13:44:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-33258cbda19sm11275eec.11.2026.09.02.13.44.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Sep 2026 13:44:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so281521a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788381862; x=1788986662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PD094jSE9LfhMHsvJNe0MdQ7eQ98KtiXjUQDqdbLmUE=;
        b=XVQzb6TnVQN9NYDcHInTlkNuvhdPZyaPRUdK8js1PqYN9IMvrJrIXNSJm9USjKmdJG
         GbmsVNN7+h4QMc66SiLah71IWrd+QIkGzrccAFoET+cZUJQB+kxazM3ygA7WRh7jJWME
         G1UatDltCCG6xwA2BjL9p2ZvGbFne/0X6hodE=
X-Forwarded-Encrypted: i=1; AKwUvBwbmtqH6WkA1ccsknFeQpXsM8oeCKUfR8NSLBDMnsMirt7atyJPs2ArPHiM9ap+8/MQJPcOEkePw8OHaKs=@vger.kernel.org
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1792410a91.7.1788381862372;
        Wed, 02 Sep 2026 13:44:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1792375a91.7.1788381861863;
        Wed, 02 Sep 2026 13:44:21 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534cd65sm635205eec.6.2026.09.02.13.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 13:44:21 -0700 (PDT)
Message-ID: <e84774ae-b49d-4df5-923d-ae2cde480aaf@broadcom.com>
Date: Wed, 2 Sep 2026 13:44:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION
 as unset
To: fausten <yunfeng.li.nb@gmail.com>, dri-devel@lists.freedesktop.org,
 zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org
References: <ef11cc4a-fbaa-415a-bda1-2ac491f3b5e2@broadcom.com>
 <20260830151619.2452307-1-yunfeng.li.nb@gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260830151619.2452307-1-yunfeng.li.nb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/30/26 8:16 AM, fausten wrote:
> The cursor plane code validates cursor dimensions against
> SVGA_REG_CURSOR_MAX_DIMENSION before every cursor update, and
> rejects the update with -EINVAL if the cursor is larger than the
> reported maximum.
> 
> However, this register is only available on hardware versions 18
> and above, which introduced cursor MOBs. Older hardware (e.g. a
> VMware Fusion guest with SVGA version 2) returns 0 for it.
> In that case every cursor update is rejected,
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
> Signed-off-by: Yunfeng Li <yunfeng.li.nb@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> ---
> Changes in v3:
> - Use an explicit cursor_max_dim > 0 comparison (Maaz).
> - Fix the comments: the register requires cursor MOBs which exist
>   only on hw version 18 and above; it is not Fusion-specific
>   (Maaz).
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> index d1e7df500..3d4660684 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> @@ -237,8 +237,10 @@ static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
>  	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
>  	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
>  
> -	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
> -	    vps->base.crtc_h > cursor_max_dim)
> +	/* Cursor MOBs, and thus this register, exist only on hw version 18+. */
> +	if (cursor_max_dim > 0 &&
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
> +		/* Cursor MOBs, and thus this register, exist only on hw version 18+. */
> +		if (cursor_max_dim > 0 &&
> +		    (new_state->crtc_w > cursor_max_dim ||
> +		     new_state->crtc_h > cursor_max_dim)) {
>  			drm_warn(&vmw->drm,
>  				 "Cursor dimensions (%d, %d) exceed device max %u\n",
>  				 new_state->crtc_w, new_state->crtc_h,

This patch bricked my testing VM, investigating..


-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
