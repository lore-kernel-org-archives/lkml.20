Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311912;
	b=lTPyLFb6wiieum3Rb0igNtMzlTyshw5HXFh45mYJLQ69DILtos+7hCsdn3W87+ikiXM8
	 7WSkc7IlnZvaYUAr/Xaw0EW7xCFmDEI48bL2jZBLG+Nsk6YPEUliZxDMvo6YSfs83b//z
	 jtsFSxKxuSSs1jDPNauPQCj0LRezLiMXgm8jNqgp7LtSR665xSylUhH437kbJ7RjsE2LJ
	 0FitTzwXpeYl+F6btGGoChz6PTv+Vi/0UVyaUMLYNQqS+TQ0sR3MG4HODm0JUQ/aV0ill
	 XwCmQ7aF0oKceg57XtQLdFm5qRr2H8bHi79usz0qcDYc0/Vn/RykXbNF6USuo4yh6OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PBEIkypNFy3duETPul/tihmqsCZnLnP2we6NZrIEQZU=;
	b=4QOsyli5trgZSY3wq53B9TBLY23L0vJNKEs9Q+RwWPNQzqAiQmMVIaslrPX1AVNn5kzL
	 Sl1RoFu04i2PjLL705Ur7XPQ5y3Z9yU0q6G2oOii/O7I+At3iXeffkxYxC8vZhI5efJEM
	 xykdPpjEJp7yME7t1ytGMSuAV1aToD45c/WrLQJlvO7w5IabQ3wzkm4kw9biRSBaIuqd1
	 eI4vd+GsikyL0/sjHpyUt/v3z9feohcWyD52p8Z/BqsdjLGxiNUzTXmnu8QfN1po4MSXt
	 ZW6Ucr5TPvnjLxHnUiGInRGFd6Vdq12SYzaaIniUOSnWdyUa2CLC/0W0+DlH3HkEgRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWVOqp+n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6BD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWVOqp+n
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-363cd582f45so15563eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311911; cv=none;
        d=google.com; s=arc-20260327;
        b=m0MmSxsD54pG4sfYMqH7J/ic4Bb+46WJ7N4381/PYcQpVLFskRDn3dqAWmWwu0avYh
         MqO5oNrtjOMUINaUqUXcu7UHWTH7dCiDHxbrVMgxzPXJPTI/qxZclBuMANq9mW+QsAmY
         e0+fLKQXpgeOwPsup/VsZkop5Bpmmr85Z0MD103kGvdDS/HYS2mh5a2lbzZi9bKHI6W+
         xFqRaS3ZFLQPP7Z3NikltzmahNGMjDIW7hGEIUVEJwHOS+NkSoX61DWXPOViqZ8EH91S
         PRMZSenYJlroELqBvo2LgrF8v31k5lOKPeZuLnhFrpiTjSu1rw4WbVCLpc7X1DzqUNaD
         ewtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBEIkypNFy3duETPul/tihmqsCZnLnP2we6NZrIEQZU=;
        fh=JsTXZ6lfSjPd8GZ0UaZtg4JRT8FjrxviLSa+TvE+ez8=;
        b=TSdBGK+zS0SOp1MiLiOZffS+o2kpMum9i0GpRJDhrGVZBy0gJKNFLtygiwW+Dt6n3p
         ytCofkp7HibYd7cphOE8csItvvLBd5LxpdKED0nG6/f5KwWNotGgLbZB4g+JvdzD37Z0
         O54YEUXwtm39S4O23DeY7+izfto3zooaUP/t0VpN8Lz4hRMypJaFG0+ezSJBTafhEHOF
         jOcehGSd1ZMXq1MVihx7eG5uaHvKPV6SO/OcvwbnM+DqmPEt+dMc61mG29glZjWdzSbC
         ORU0U7lZtbD5KllCW9Thbw4pbrRaZYLM1e+PlrzPElBzfuYpdFi+xw1YdmY9fdJNO6Ym
         3Jqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311911; x=1793916711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBEIkypNFy3duETPul/tihmqsCZnLnP2we6NZrIEQZU=;
        b=lWVOqp+nrOjtwADvcecmYbdBOnch5TANTq3rLgKXbcpc7UaYbeDE7unSHDs2e1EbUY
         7uF6RXAFEE/N9cqvP5psVZo6lBrzGlYWp+xNbVtSC6V7DpkuG2KEOqdlS3zEHgm99ciM
         36jquz6LJEFvCEZxzjkkEYkXaKbTyoGibFNUP3Gt2Kju9K+yrsMW2PmhkW/q+vf1LR8o
         1iK/qAVkMMvG4PF29t0jbRyd7RjlHd/X+n6qGlGy095ddWucbWr621z/u7yfeJGd58dJ
         F3orHs1miCj+VNXocABcSr2dtetVYnweWqoGBkNv0GLyWfMMqUJ3DBJjmk6lglb7cqY6
         5Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311911; x=1793916711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBEIkypNFy3duETPul/tihmqsCZnLnP2we6NZrIEQZU=;
        b=dTAcL7lAKvlAQtqMw5YY/QmLYDtEX8c6eWtDqvCzDN+DC267ZsZrO39s6KdaUg22aX
         4C4fz4GIFKEQxwS0khEHhTRFnSEBK7ErUVnycvQvDBxBRjz9UzuU8psKjHobnZvUo5GI
         q30KJbGXTVVGiXBLiAXCdaGmkqboW97xujMyanwrq4Colp6AY97W0eFd5y+bznd2S0Tt
         CSZ0bpNKJsPgmjuJlz77sGDKUI6nL/TUks/8FepaRxJAcQ7MKHFSCwSRsGENRQrIbzju
         QFVcGFOGGdy6Ohn9tjv75uGnyDMUGaoUG3aOT7MLPCh3wffF14dUy+fWWhLSB/TnkX1L
         kOSQ==
X-Forwarded-Encrypted: i=1; AKwUvByojQtZpWsGAwLZ/Z+XNSZYvCyNDNPDyhjKAqzzAo86G0dV2YdHQOG/iNYr/XRLRtpI6VqP9Y7ZmDYw7ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMhpokMwC3KJeYz4WSuRhayr9jVl3qjtz3Aoa9r/rKmbJASvEY
	gTzKBSAHaqckinMaOW5mZtGq9huEa2ANWSOzzhxitz2tRD2aNEKhyAtmcmfZVsSQWqr23aJ2zWw
	coDQQuY0gpWt8/kGeyDX9h553D5EAVdc=
X-Gm-Gg: AYBFou2cnvm46QIAmCE33KQV3AyzhQn9zimdoYGC+ZKz+jEOUy1Hp8bN1GRD6fyaq3S
	OpIfNAZ/OMHoMJ/yxarHZBMpU0EUQljBsYi3wmOqcPoieoBWzIZ4vEMDARxtPQF4jSEB+YCS/O3
	aLr24sHahNxwowvNPKLxSYEcQM0MV4pZ/0ENJaMG/9FohSHOXNOaGFB/iXIDHGpFQB1dUJ0r9iT
	cKwbAsccI6f1NRa0AI/m8QQVtq3VgJr9X7Y8vcolkoNr1k+m7GYswA5YIO5TU1/Kpkda3UYvjz/
	Rt0wzfmq18D0x85WhA1DqfpMXzoLoGR+vWmLjiZtyAciW7z8e2/n/cDbc3VmlK/nS/7DtVubLIK
	LmYgyZ3fB2bOxQvbnVZBMDinZVXs1JTCWFYkCYiKhpmxhwXPomygWoQlusi4eUsAu57HyPG2GuY
	HJbQwrG/nPe1ZfZGx5YMyWdjs=
X-Received: by 2002:a05:701b:418d:10b0:190:e602:c769 with SMTP id
 a92af1059eb24-1ac59143aeamr818406c88.1.1793311911532; Thu, 29 Oct 2026
 15:11:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027193559.28474-1-amade@asmblr.net>
In-Reply-To: <20261027193559.28474-1-amade@asmblr.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 18:11:38 -0400
X-Gm-Features: AclHuK85g9fztoaVrlp_rJWPJHWRSqCOuLati5XqcOXZS0zoPwKNpaJFJhjLezI
Message-ID: <CADnq5_NOVHSLnxwmY5gsq4vMxbJP6QQPnPiAJt_uwkDtegpYkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Prevent debugfs nullptr dereference
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amade@asmblr.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied the series.

Thanks!

Alex

On Wed, Oct 28, 2026 at 9:06=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski <amade=
@asmblr.net> wrote:
>
> Running
> cat /sys/kernel/debug/dri/0/psp_spirom_dump
> with amdgpu card that doesn't support it leads to nullptr dereference.
> Add checks to prevent that.
>
> Signed-off-by: Amadeusz S=C5=82awi=C5=84ski <amade@asmblr.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 6 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 82a2684dbd2e..627c74f16914 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -5381,6 +5381,9 @@ static int psp_read_spirom_debugfs_open(struct inod=
e *inode, struct file *filp)
>         struct spirom_bo *bo_triplet;
>         int ret;
>
> +       if (!adev->psp.funcs || !adev->psp.funcs->dump_spirom)
> +               return -EOPNOTSUPP;
> +
>         /* serialize the open() file calling */
>         if (!mutex_trylock(&adev->psp.mutex))
>                 return -EBUSY;
> @@ -5473,6 +5476,9 @@ void amdgpu_psp_debugfs_init(struct amdgpu_device *=
adev)
>  #if defined(CONFIG_DEBUG_FS)
>         struct drm_minor *minor =3D adev_to_drm(adev)->primary;
>
> +       if (!adev->psp.funcs || !adev->psp.funcs->dump_spirom)
> +               return;
> +
>         debugfs_create_file_size("psp_spirom_dump", 0444, minor->debugfs_=
root,
>                                  adev, &psp_dump_spirom_debugfs_ops, AMD_=
VBIOS_FILE_MAX_SIZE_B * 2);
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.h
> index a4ec60f6c317..975d12359358 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> @@ -574,7 +574,7 @@ struct amdgpu_psp_funcs {
>         (psp)->funcs->update_spirom((psp), fw_pri_mc_addr) : -EINVAL)
>
>  #define psp_dump_spirom(psp, fw_pri_mc_addr) \
> -       ((psp)->funcs->dump_spirom ? \
> +       (((psp)->funcs && (psp)->funcs->dump_spirom) ? \
>         (psp)->funcs->dump_spirom((psp), fw_pri_mc_addr) : -EINVAL)
>
>  #define psp_vbflash_status(psp) \
>
> base-commit: 83f32c773255720a661aa45d83e36278135f23f5
> --
> 2.56.0
>
