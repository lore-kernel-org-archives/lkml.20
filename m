Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C1539793
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172268; cv=pass; b=VJdBYjTw4NBmuRdnMH9syQu42+w7+Y8LnAP+7DbzSuwHPJUFA9lGQN82zxVXSlm0ytreI1cMK09Tf9YMzwS5ad6sx5ulYq70pKrvWPRfXxEbp9TSjgfieeIeK7+ey8qVxaCN9snaUmMci10PjCcw1/vQw7LN403GZfuiuO3sMmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172268; c=relaxed/simple;
	bh=mc6ggexvMnt2aOuyzwqlMy2bKU0FblkWbAUTLCGHSAU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxWyjXgQ0QAu1cAmtZPoWm7Fy57xBnxyG1aEDTKu97JF0SW8ol0JEqGFEB+hYn5Mo6nUAMgCfFe5/j71tnJ6wswuvf8bCBfpuu8giH8ZpuQGGpqhV9riKaQnxs0WYDYa6NfZ3ttOkdbBh474cdVD1Pte2G1513Hz6PKjRo4zZrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlPEQnn8; arc=pass smtp.client-ip=74.125.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlPEQnn8"
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso108627a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792172266; cv=none;
        d=google.com; s=arc-20260327;
        b=SEpgMGr6O2DBUzkygcqnGaz1yie8I5m9FOOKTFpD59JFVX5gsPi8ST0AYtZfJigywA
         +2KWN4G8DkskGLmNsRTTLLek1VqXLe9g6wIfTH33x/Vq3ZPYtlEzkrijQahpZ/DWOsrW
         6MdXeePc1ULfqmc//NVEgoiQu9eb5Ca+v+bRmgLIELkm7deR3JaBxzbYAkTDwhzjkJDr
         7o6R1eRlP0xx800FC6gjaQ2tbdQbtIH6CjNSpGSfu/SP/B5x/Bgt7R8KpGyS7w3BnyaX
         3ROvYI/TpFgndz2sfDn6Y3biJnPhlmoYd7XCHYpls2on3TsI0JphQrmmNCoc4YG1FSJP
         Sgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=cSBeL18Hzr+0k6iOggYBFAtCAyebrXp5vaXSKHdHnjg=;
        fh=u1e9une1BlZZWeC4vW97eS9uEeeP8AWftZuyvAf36bs=;
        b=OmiElI2AJTESjGjUJaIo+yqfHYnjFqoU/b8N5akr/VziqZSWYz7rTsVtpMsyVBkBkh
         LT8FGu1Bwpvx20+nQV/r3aDwCusBJQ+SfDQp7vftGBkoZJTDs1FFXcu/J+I6XMxPzTVw
         mWo5/g7nlE2e0JwfXKkCa5sWPZJEn96ug2JCokf/E/SM5HjhTadN7tsk3/WVfdwzaUO7
         WeGPRtpiXc6oWOS3IrGotIgEWzuZNGE8TtyKprGDPE/8ZcO1P0F4zhHDGg0F18estKtn
         T5nGKdvNTJHgSVMGBybSYI+wZMhmvsL9ZABEneJPoDyY1GGHWao0vNPUjOwGI1WqJb49
         papA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172266; x=1792777066; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSBeL18Hzr+0k6iOggYBFAtCAyebrXp5vaXSKHdHnjg=;
        b=SlPEQnn8gsNIJNRFBQVi1N97rUQKz+ygh6TN5A95a/RiBxj3dDC5dUZPslxd0w56Ci
         YcIDNUTRFaZfgWMzJjoRKHZmPwvLwn5ox947YjCjucbtXbaOGTYEWBCb4rgjHEZTkq4x
         jsk4E9VKN/2ZdunZ5HNiCIm2k3pN8buqH51Lr47I03oxJ9TceR95WbUOBePuUjSNi2rb
         uEs5P+USGf3g9doCIXdOv98oJLLf5OBEBADtKur/tu3WblZ8a1DbUnrKr0avzbdvC+Ow
         uz9F4U8Ni6/C6j2kNIwTCIhzcgsNzAzFuZTicKTxbMyVBmuyZz+lGny+0E3t/4cQabG2
         TktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172266; x=1792777066;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cSBeL18Hzr+0k6iOggYBFAtCAyebrXp5vaXSKHdHnjg=;
        b=XfbOJMOTeI5DznrJ6ZuOY1yVF/6cXKwfZcT2RiNab7sNzkZtvHJnDM5sHMjWSzX0sm
         sDsLksxrdNlGed1WMjzkfJT13e/P9VJBjC8XtNCzdTJZGLtQk1ZicurEbAG0cawpw1eW
         0eIy0wzOUWH5fMJBCcAxf8Q8hiGrHsORluNj5n2E1vCdQmz1fskrJNEJiMg6hMs+2Y+6
         R1xKSg+qiCtElPCtPOfN+TH0+QNblpXBDjzPOKkTwpIdPOB13f+/CAY81nyvbcPv6sZk
         S+4CkoWpCxfovF7MGuE1VbafOKL4pIrsvapqkefuT83v+D7nSDkI83wMh8WZUqebftno
         S3Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxycWHTcKEpDq94qD3Ov+ZYYni06HbzUGYsz5GAOoOW3fRPr9hdpem/Qy0BusJhcNJM4UTKWyHSuiFMlO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcxztKQHqgh/FTR1z7He2s05XzYjIFQ3RKgXnNkiXvVOXhmEGo
	wqPaDa4RWD5et5ZTcsLix9usrniNbo3bx3RPQEA7dIQDTsPpX1lKYQ+uzIDOn6sHhNeWvIc0lMy
	3mDh8KkS78LyzwJi6UHLE/eNXKrHEdo0=
X-Gm-Gg: AYBFou0x1CZ0q0ObViQmXUQjfybIeTUupcJPiaFmvT+DRq7SUgXX3L2wn9z9bO70PC7
	aKdvlQsM2hjt7xm9o3dInmbMBorH35zVlg89gYJY0Ahf3tTuZ26fWl/2Y0uHFrZIlIcx+YtGabm
	9MedjFqUpR3R5MirqYyKbZUdgz0++ldTikTpwXjRVQitNsZtt77pK3Xfk5H+b9tOQdxVCnUoKZY
	UTSV7/gVoxqLjV5L4IaxTUtnpW5Hr+hlE30ZLtktSvJz0/X+NFQKDSjfYyW2ONRj5YOBF591jbs
	QEBrqvFXn/VmSza7Ysy4NAId8HM6A8jZ00l0SyH+45LjFWyuQxOw8A==
X-Received: by 2002:a05:6a00:3008:b0:89e:fc47:2c17 with SMTP id
 d2e1a72fcca58-8a04be6a27bmr262049b3a.19.1792172266196; Fri, 16 Oct 2026
 10:37:46 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 10:37:44 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 10:37:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yibiao Li <biaobiao2233@gmail.com>
In-Reply-To: <f4dcee55-8cc6-4287-a25a-1ace385f092b@amd.com>
References: <CAG1agfwtnjmb8RVLmZvY9W-zrR1onhK6urJA3Lqai82tAXn2Cg@mail.gmail.com>
 <f4dcee55-8cc6-4287-a25a-1ace385f092b@amd.com>
Date: Fri, 16 Oct 2026 10:37:44 -0700
X-Gm-Features: AclHuK_NcSTXBwBpql1smct-MaIzZ_7A3iNYOrIiqYl5afbkmOt6bPkRbY4aer8
Message-ID: <CAG1agfwZF0j71YofDWVqrxX5v-gtSYbM2OQiw+Kbd1zGPTaT3g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use separate iterator for preferred mode lookup
To: Alex Hung <alex.hung@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2026 at 09:50:44AM -0600, Alex Hung wrote:
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Thanks for the review, Alex!

Best regards,
Yibiao


On Fri, 16 Oct 2026 09:50:44 -0600, Alex Hung <alex.hung@amd.com> wrote:
> Reviewed-by: Alex Hung <alex.hung@amd.com>
>
> On 10/7/26 23:17, Yibiao Li wrote:
> > [Some people who received this message don't often get email from biaobiao2233@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Yibiao Li <biaobiao2233@gmail.com>
> >
> > create_stream_for_sink() uses preferred_mode both as the list iterator
> > and as the selected mode. This triggers a false positive from
> > scripts/coccinelle/iterators/use_after_iter.cocci: native_mode_found
> > already ensures that an exhausted iterator is replaced before use.
> >
> > Use a separate iterator and assign preferred_mode only when a preferred
> > entry is found. This keeps the selected mode separate from the iterator
> > state and makes native_mode_found unnecessary. Preserve the fallback to
> > the first entry, or NULL when the list is empty.
> >
> > No functional change intended.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202609190901.yKTzhsGz-lkp@intel.com/
> > Assisted-by: LLM coccinelle
> > Signed-off-by: Yibiao Li <biaobiao2233@gmail.com>
> > ---
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > index d386bb1475..ceea8fe481 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > @@ -1453,12 +1453,12 @@ create_stream_for_sink(struct drm_connector *connector,
> >          struct drm_device *dev = connector->dev;
> >          struct amdgpu_dm_connector *aconnector = NULL;
> >          struct drm_display_mode *preferred_mode = NULL;
> > +       struct drm_display_mode *connector_mode;
> >          const struct drm_connector_state *con_state = &dm_state->base;
> >          struct dc_stream_state *stream = NULL;
> >          struct drm_display_mode mode;
> >          struct drm_display_mode saved_mode;
> >          struct drm_display_mode *freesync_mode = NULL;
> > -       bool native_mode_found = false;
> >          bool recalculate_timing = false;
> >          bool scale = dm_state->scaling != RMX_OFF;
> >          int mode_refresh;
> > @@ -1509,14 +1509,14 @@ create_stream_for_sink(struct drm_connector *connector,
> >          stream->timing.flags.LTE_340MCSC_SCRAMBLE =
> >                  connector->display_info.hdmi.scdc.scrambling.low_rates;
> >
> > -       list_for_each_entry(preferred_mode, &connector->modes, head) {
> > +       list_for_each_entry(connector_mode, &connector->modes, head) {
> >                  /* Search for preferred mode */
> > -               if (preferred_mode->type & DRM_MODE_TYPE_PREFERRED) {
> > -                       native_mode_found = true;
> > +               if (connector_mode->type & DRM_MODE_TYPE_PREFERRED) {
> > +                       preferred_mode = connector_mode;
> >                          break;
> >                  }
> >          }
> > -       if (!native_mode_found)
> > +       if (!preferred_mode)
> >                  preferred_mode = list_first_entry_or_null(
> >                                  &connector->modes,
> >                                  struct drm_display_mode,
> > --
> > 2.43.0
