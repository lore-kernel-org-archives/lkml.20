Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C673101A2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156940; cv=pass; b=ZH6tcVKbww7Q9hPx//n4jntcJMzbQLr1Obn03EBifb17w75NJ5EbpaB4/oPYsaUlOqa9Ai8K+OHol8IM7tDFa04dAD30AOpEHZ4d6SzFGC6N11IdOnVp5GSceHzVuq9fzKwgSttFT8PpayDSwk2ocED8BSU+yWuJxt0h9bskv+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156940; c=relaxed/simple;
	bh=Wx4px2zkiHR2c6nwPLGSYtdbbt3JxOWVvjGhgsEZ98w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQd8N2Rk+0PrQ97uCfIyxxombzHG0hcBnCvP85GbcdC3kK778m6lU5kTFeXc0yP57cOQxLbentJBacJ1qhsTHeg7gKzc3LEIXyK4D0BFaoWxTREhk+LjR9XWrqZri6FsVL7Ty1t6+adHvBRBkPsBdTjSWFVZkoLPGoyk0gqFP7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=LXsIZPQV; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="LXsIZPQV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so2952555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790156938; cv=none;
        d=google.com; s=arc-20260327;
        b=D+mppz3HdlnAfeSPZauy1V2sX4L3BgWyRoBUhf2YsgQLUnYPrenNepIFdURoi53q+z
         vLMKrNLveb8e3nTJ2zGKH4zv2H5F8jXhTAVp94ieQY99JLKZOz6mBHqq73Q2r9PPdjZs
         +cEhU/wlO9CqEkLfXrL3OsAnQ59Nx3yIgBsqLmW885pv15RkTJ2HAkfrMPhjQ7yK3e7o
         8GwKaNsJABf4uy4uV0qznHkEYr0iQZpbD22a94PQcRtUSfh+ClSeycX/AOhrjDcl8Qkl
         7T557EQlzfbvyYGo21uBtwoLs/V7EPGXm9xz0CWVSN4dlQWzPriS8R7JKdJGGuNvFY7w
         5vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wx4px2zkiHR2c6nwPLGSYtdbbt3JxOWVvjGhgsEZ98w=;
        fh=m74jLzypSvzekEPocxrCOF/4P7YXLzw/PPgsBYfbmRA=;
        b=m7R9NOuY9pXnnveovLlXN0MM8LyJ8TQ53A0ltrGxmLg4tR7T665f3Lm6jijT8wfJsj
         KeOHRwCzDVLeORadTiAOaHKh29O3jaO5RDs3VoFkwZ+R1ghnoXQCRY4JqZjo5MTDlozK
         Omr1apEGC/gEUO7hSbRrhbzB96n86ZbW/pcoMX906W1BJRN9e/aC6tYWIbLb7yFUr5KB
         83DvXnn0mPz4qaCK/irxr0p3bRnTajDwHEeuv6kIiJSgmcFdAf3h9cnzPmCFk7TSqIB9
         D9H+262fn+VQzj2Gv7XrnoWakIh0vu/WiybFqwzkFntFEPSJeU/PARUVc5rn3s3a68FD
         lzCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1790156938; x=1790761738; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wx4px2zkiHR2c6nwPLGSYtdbbt3JxOWVvjGhgsEZ98w=;
        b=LXsIZPQVoqoGTpdDUG15ancf1wvTFr1CR5sKo8wWRPunI6MnhFCA7isMdyvsbTtxqm
         w2rRMYmfrbWginQEiJ2tOn2oJWM5CYi1TwCluouDoyR0AxyFlIDeB1WyzHM3Jvn9ZaMI
         lJ1xjf6l1vm/sikdOh0As9h6Ms4cZ9InIUlXFK0hV25YpuE1omIFRGtSkTEurzRvtESo
         xrNcuFythnBxtQfIoPVPfZ0wul+jtg3lmlRlBCM/LVU0xyaYX7tFsPAq1mBSyZ2LqCM5
         kjCNagsdPLqtVqoA1hhYZ3CiJwUKfPoCJrbbDvEtv/N1V7+7wvAi0lXts9+elkbwF5g/
         4B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156938; x=1790761738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wx4px2zkiHR2c6nwPLGSYtdbbt3JxOWVvjGhgsEZ98w=;
        b=lA7/ZjT+xUcta6Ip0M9cN6X2u58lO7pcDjXP6/2wDo+ZF3HeMynIV8gm2y/uf8vxkT
         PNstiaayxRMTEJ3QDLuLsdbx43itAeHqjZ0GzR7ynDhLC96ywknqJqQ6Wa6gQzw6SmOA
         gysr9MLknuP4oDJ6pTfRMTzXMTF/XAr2Zd9pTEg1QmQrNFmfcv5OyyPyq03B6QJ9wVxn
         YoY9dHSwe5g+3t1v2gSCbdLdRZ0wwr64y0NnySCLNpgSvvPgvq01A1Lmi0cDT8MWVEb8
         h6cLHQpoTSaFL03kqO2nmcE6t28dwVQWo0rRncuNI/qhvuMFMJTcmvvVA81XXD7/+Ri4
         1nuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzknABaH0IDo+8WrJ3BMJgyDb9HpwAd/CDwLFti0wFnRk1xpJi27H5ICftQ/i1soSLOGLQ6cqUVR9+x0kU=@vger.kernel.org
X-Gm-Message-State: AFuF++m4KzV+uNVrh8u7FXzhG+EMT5ptzzUphjv7ble0LOAV9Xd1rOc/
	id0pmp+yPswgez8ktGVBPSVOMtwvbcNTAsBA947b27waN1fKOCWc/yfi2RPkeIuyjmtn4ibejn2
	emY7Er66BRwRNmndQ+7noZizsbSE0gD0mECm8h7rfCDBM3/7YD1dlZgjfgXu4
X-Gm-Gg: AYBFou2lXTf2EBOTYYGemgOUp8zXFEf4tzIOqBAUaTqcTdGo6ybkPrmWzUHyIAWj1ci
	7Qdcn5WTKenOjWy+guWnsVHsCR183TTMDYTY7hwTDw8RgPy7UIRP3nPqZBe2SS8j0bs6SStpnrf
	jMw8h9IDdtMwbEPWE4Cer/hRCDutItPuh1lMfBESOJO0TysBttdkwHD1lvzsefJi62woqYTSIOU
	EwGD+rwII+WM66paUc8r5uu2DVh1sW02qhIcuTFnE8NaOcLSUDBDtps5SQWOOMZphBKM9/HodpN
	R7tnxPulUcMZ3FIrg+HvK3WwW8t46bjJc7ylgXXZ9DdyGyOhYGRE
X-Received: by 2002:a17:902:fc4c:b0:2dd:c053:e0f7 with SMTP id
 d9443c01a7336-2df69ddf21cmr18272105ad.38.1790156937998; Wed, 23 Sep 2026
 02:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Sep 2026 10:48:45 +0100
X-Gm-Features: AcwNN1WttT0SOIaLJgPj7L96LwZzDPPyCZ9AdYI_ydBFNIIRW4TfTa-aNf4h73Y
Message-ID: <CAPj87rMChKiJw3YbKcmb=3UWnu1Ccs5Me3R1tisDGMEL3aMDYQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] drm: Add DRM_MODE_ATOMIC_RESET flag
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, 
	Melissa Wen <melissa.srw@gmail.com>, Daniel Stone <daniels@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	=?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Simon Ser <contact@emersion.fr>, Victoria Brekenfeld <victoria@system76.com>, 
	Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Fri, 18 Sept 2026 at 15:18, Maxime Ripard <mripard@kernel.org> wrote:
> Userspace currently has no atomic way to bring a display pipeline back
> to a pristine state. A compositor that wants to start from a known
> baseline must explicitly set every property on every KMS object to its
> default value, which requires tracking which properties exist and what
> their defaults are. This is fragile and must be updated every time a
> new property is added to the kernel.
>
> This series introduces a new DRM_MODE_ATOMIC_RESET flag for the
> atomic ioctl. When set, the kernel fills the commit with default
> states for all KMS objects before applying the properties supplied in
> the request. Properties not explicitly included remain at their
> defaults. This allows userspace to describe the desired end state
> declaratively, without caring about the current state or the full set
> of properties.

Thanks for bumping this - I had the original patch in my queue to look
at after the hackfest, but it got lost in an unfortunate tab
explosion.

I think it would be good to document more clearly that 'default
state', generally, means 'everything disabled'. Of course stuff like
colour properties and max_bpc and whatever will likely have different
values (where 'default state' means 'enough to get a basic 32bpp image
displayed if you don't care about the details'), but I think
explicitly calling out that planes + CRTCs + connectors will all be
disabled would be useful.

I can't find any holes in the implementation though, and I like the
uAPI. I'd do the same thing for Weston as for Mutter: in our
backend->state_invalid loop where we loop through setting all
planes/CRTCs/connectors as disabled when we aren't just issuing
incremental state updates, we'd ignore that and go straight to the
STATE_RESET path.

I wonder if we also want some kselftests along the lines of the VKMS
IGT test, i.e. for drm_atomic_helper_connector_hdmi_reset_tests[] to
make sure that the assumptions hold after init -> apply different
state -> reset state.

Regardless, series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

... with my reading-kernel-code and evaluating-uAPI hats both on.

Cheers,
Daniel
