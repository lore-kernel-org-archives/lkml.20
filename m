Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB426980F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789937935; cv=pass; b=sfh5YAEPLNmwFqdsdoDm2IkSRoz+lWlEx6nPcCEjb6C6ssx7BIxnTzoAlXi49Y6hdcQwh6p7etAbUYIExsUY6O7cwvCPTAC3MKsgraANlqfbIUeQtv9Cs93lb2q0+1esLiWtSyPr42NgWaCYosmw3VEeMPCn20b1gUYth3U6Ksw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789937935; c=relaxed/simple;
	bh=Zxi7xlkDCo6GTtTUUP4ICLSQEG0dNKp2i5/MzUy/KOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POvHWlUwNZWSpVGOC+e559t+E9ZEyjusqEc/0DuvVlcpr2ij7Cbgh35AhWT0P8ShHv5VVr8AlwJ62Y936lNKpiOuoYbmRsBQVcXP/VSjn2Jiy4iyaJosDtJUez3BqrZWUTCI1+FptACRLMCnAtvGjslyLBv/k2ftLPsxmQXOY4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm+wKdO+; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm+wKdO+"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so23732811cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789937932; cv=none;
        d=google.com; s=arc-20260327;
        b=D7gJ6M61YV2pA+l0XKE+Z8dvFBa85e1pwtttQI6oNh9ZJ+T40REkkbH2ZkIMQ5rSdp
         Yp/6RKCmIC6OAWMmfOULhsHpIgWEwu3yLBwSczq/8o6Rt33MNwGZ/wY/OvvtqPhhUesY
         fuB4DCy/Xo3c6nNy4VTFTvvC+GWPAB+DH4qVtAaBlkh47tbINC8O7P22SJej1zkkLtzh
         gB7yen4gMkabWMtC8cW50D2AtXVHndU+tOf27qOqaaiGb+PSdrcoZ68ws9/Qggnv5uRr
         eEPcRVehMwm3FovHnVxwaNDKu3GVdtroIV3QYgfT4akS76LbAruOgwbQP7VmVpfoJnVb
         ou1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pgbYq9WZp1wLB/tLd6hSmJb2hGfdZ+kAb6DF4bI/cVw=;
        fh=SQwcl7TWVrahdJJJxzq82hh0e3FPGbQ8xPxE6RfaFNs=;
        b=aS+OvtH7ClufvfR/ZyAOXkR3qIW5ssFEP+3+H1BPCttEi4d8kGFWH+ApW/vu01zKQ4
         8sgsSXY1IE1KAp5tL2fhQ0QqzCKWje6kr2xqmjCLkEkoTFm4M48BnOMyXCHe3LNrUUl3
         ObAZmpmqL5ISF3e6jHQp60AxayzUNeUyW9db0VcTUcvVJdpmXfmb8+l/XeMiqAYwlRrO
         a7bVBCeoj5wwPO3Xfvidj7o5QU4bN9VHEkfFR6ooQXzIsdBjsh2inT4jy5aiaz+DrbjB
         m1Mzq/tIyhEDYVRgfWP7to2AZDWEuf31FETN4v9cPdK8+V5lfOzJAb35fxP4PJY8NdzN
         xzGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789937932; x=1790542732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgbYq9WZp1wLB/tLd6hSmJb2hGfdZ+kAb6DF4bI/cVw=;
        b=jm+wKdO+r0y06y+mZJQEIvtHPOXYgGFyyAKcNqHqQ3megpg89QMVwEaUi8kf/Rsbp0
         v5FGnN7sjMuBBHaSkAJyoQqjC8/5KhHFuIoZGMPS31FgcmlQrCfYsb9yTeS5ByD/AXYa
         Ru4B8nAzzlNJaOVvKpHvkaTXczV9Af3yhzCiJPsC93BhtpXHS7xG8U7gXP1P9bf2JB0O
         ulc2UbeawJ2iJAX3YMRveNxdtRRHxUVM7Lkz/D5cmIgFUd72bhOdHJamMASXRrSEELrA
         clgkpx2PPPJ/hAkMi4D5m+SNewFhtFf51bdkV7SSf850jBZGwrGm8omiQAcZK7e8dC36
         s6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789937932; x=1790542732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgbYq9WZp1wLB/tLd6hSmJb2hGfdZ+kAb6DF4bI/cVw=;
        b=rDXEFJyvB0Ju3loXpXGBJ7B7on6/mcXuYR3Pv8b6QG64qJV4o+rolVOnNsm+xq0PAe
         ovlnQiRIaSGF9tDU1JdaN8QTDVP7UUHcGrRDKst1UZXyyTtKMHESNWBp9dm6JBP2IKkF
         sJADbezvlm3VCIyMo04ILbEXYS9J+JUMpQToMrYvfk+YjJnGCUp3pfMmetWMFxxRpjB9
         7VxWGWcpxjFlIHELFTBPFzRmDgpMja1hD1vYEN11t8ixYmjjj9onr/hPpt55G2UeJLti
         cKera33Xk0AzJpXQ1yAnnlKB7r3y6x3xCjtFG75hCgltxNtLnLKpCEDCQMFY3IOuRNaB
         12jg==
X-Forwarded-Encrypted: i=1; AKwUvBxFs+/SkLoWWZAy71p+gVuY0Hj3+6YPqab6VAM1UunI/85gYkXgteI6VG60DU5o5qpd9DYj0LuHzcNQ5VY=@vger.kernel.org
X-Gm-Message-State: AFuF++n2vf1jycXUiUzrhBHKP7DKR/mui1urq9/N/4KBwwTTuc2XDCCv
	6B5a8C6qySOU4ycMGLl16adfc85Nclh2ft/iSQNAPivcD5ebJz4luat5XI7aCKqblbZAV8RmW74
	9qyTFg7IzsF0Rvn+GZSMKKnibIjPSn/kW7zXyDB3duw==
X-Gm-Gg: AYBFou2QgdmOtONGb53OxtaHIHboUCfo6SH76eI6EsfKEGKdHW1Yd5PyYvgrKOCWqgp
	mzRrUp8UZfawymZROf39o7bJ1pVvaM9GztuhnyN08FtrgzBZzklJ2YcoyL/lkvLaZ0gDuZUih9K
	oWqyVA0o8jcGc4Xx1xrAjjRq49Xj1xp/AfuBev2TvOw90dDsEQcxJfSq8cvRIHiZGSKQXAyJbmO
	8HWJGMGmTZf8gXq2d8I0kqYT2uJnMrVw0kT0Cd6NshFsXK2q3gfXeVrPQ33lUK3U3kCBbMKfNFB
	n6S+7M8VAhq1CPNw4tDsOprzmeROYv5bak/UdPj52g4CI3Ok/XPi0HrL3w==
X-Received: by 2002:a05:622a:1650:b0:532:9adc:63a1 with SMTP id
 d75a77b69052e-532b7405127mr73553621cf.69.1789937932639; Sun, 20 Sep 2026
 13:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918235351.398269-1-cyrozap@gmail.com>
In-Reply-To: <20260918235351.398269-1-cyrozap@gmail.com>
From: Forest Crossman <cyrozap@gmail.com>
Date: Sun, 20 Sep 2026 15:58:40 -0500
X-Gm-Features: AcwNN1Uwqpqv9Dxa8GL84fQ3gyPZRWEAowqxxoidYtNKJmtJS66HC0S395w6bVw
Message-ID: <CAO3ALPxvFghs8UOckRVDp=Y6taWE-gWVhwbck9AN_pZPS1oqdA@mail.gmail.com>
Subject: Re: [PATCH] drm/gm12u320: fix system freeze on surprise unplug
To: hansg@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:54=E2=80=AFPM Forest Crossman <cyrozap@gmail.com>=
 wrote:
>
> Unplugging (or deauthorizing) a GM12U320 device while it is driving an
> output causes the system to freeze. When this happens, other screens
> stop updating and USB input (keyboard and mouse) stops working, but
> non-USB storage, audio, network and ACPI events are unaffected. Because
> the unplug never completes, the only way out is a reboot.
>
> The kernel log shows a NULL pointer dereference on every such unplug:
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000030
>   RIP: 0010:drm_mode_object_put+0x9/0x20
>   Call Trace:
>    drm_atomic_helper_commit_crtc_disable
>    drm_atomic_helper_commit_tail
>    commit_tail
>    drm_atomic_helper_commit
>    drm_atomic_commit
>    drm_atomic_helper_disable_all
>    drm_atomic_helper_shutdown
>    gm12u320_usb_disconnect
>    usb_unbind_interface
>    ...
>    usb_set_configuration
>    usb_deauthorize_device
>    authorized_store
>
> The call trace above was caused by triggering a deauthorization, but a
> physical unplug reaches the same gm12u320_usb_disconnect() path through
> hub_event/usb_disconnect().
>
> The task faults while holding the USB device mutex
> (usb_set_configuration()) and the DRM modeset locks taken by
> drm_atomic_helper_shutdown(). Mutexes are not released when a task dies
> in an oops, so they stay locked forever, with the USB hub workqueue
> (hub_event) and the DRM framebuffer-removal worker both blocking on
> them. This is what freezes the system when the driver crashes.
>
> gm12u320_stop_fb_update() drops the cached upload framebuffer
> unconditionally:
>
>   old_fb =3D gm12u320->fb_update.fb;
>   gm12u320->fb_update.fb =3D NULL;
>   ...
>   drm_framebuffer_put(old_fb);
>
> gm12u320->fb_update.fb is legitimately NULL when no update is queued,
> for example when the update was already stopped, and
> drm_framebuffer_put() does not accept NULL. On unplug,
> gm12u320_usb_disconnect() calls drm_atomic_helper_shutdown(), which
> commits a CRTC disable and reaches gm12u320_stop_fb_update() with a NULL
> fb.
>
> The NULL check was lost in commit 8f2cb9379fb4 ("drm/gm12u320: Simplify
> upload work"). That commit moved the reference release out of
> fb_update.lock (so the framebuffer destructor does not run under the
> lock), but the previous form guarded the call with "if
> (gm12u320->fb_update.fb)" and that check was dropped in the rewrite.
> gm12u320_fb_mark_dirty() still has the same guard.
>
> To fix the crash, restore the NULL check before calling
> drm_framebuffer_put(). With this, the CRTC disable completes, no locks
> are leaked, and unplugging the GM12U320 device while it is in use no
> longer freezes the system. Tested by surprise-unplugging the device as
> the active output--before the change the kernel oopsed and wedged on
> every attempt, after it there is no oops and no stuck task.
>
> Fixes: 8f2cb9379fb4 ("drm/gm12u320: Simplify upload work")
> Cc: stable@vger.kernel.org

Apologies, all, I've just learned I should have added an "Assisted-by:
LLM" tag here.

I used an LLM to debug the issue, identify the root cause, write the
fix, and to write the first draft of the commit message (which I then
edited significantly before submission).

If you need me to re-send the patch with the tag added, please let me know.

Thanks,
Forest

> Signed-off-by: Forest Crossman <cyrozap@gmail.com>
> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index 4ad074337af0..5bb6488556de 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -446,7 +446,8 @@ static void gm12u320_stop_fb_update(struct gm12u320_d=
evice *gm12u320)
>         iosys_map_clear(&gm12u320->fb_update.src_map);
>         mutex_unlock(&gm12u320->fb_update.lock);
>
> -       drm_framebuffer_put(old_fb);
> +       if (old_fb)
> +               drm_framebuffer_put(old_fb);
>  }
>
>  static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)
>
> base-commit: 1717fcc5be575d4768279148ae9465a8b13d4339
> --
> 2.55.0
>
