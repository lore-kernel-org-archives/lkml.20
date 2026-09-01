Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13A42BEAA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284898; cv=pass; b=BWgPCuG/FDto0P+Nz0kkI1MQKV5zT1Wzh6MTi9wTebKPupdpjoDwJXqx1W/h3u9a+fWRtIthW8Oz3Z6MYLymu48mXrU9J91yiep6nSK6oGGddGfPTDCChGghFuroKhFrksX0Z2T+uXxhF124R7KovG/byQC3Iz56vraN+koDaYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284898; c=relaxed/simple;
	bh=XwJ0M96dJ3T6G4FYID3EPabi4UFprq48tSBZESvJUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/b0QnLNE2f5A8Xpg/KrVjwbbW7QaChjgjuqoADvx41Pz2KnamnxEDugTRPzHT9mbqzmgimNmAEhdR6OePeK+ZMZABGwT9qa+HTTUtf3DO9iKDQR2Sfbq2Rr1eRGoWF/WcCtu6LAQUlH/p1U3zCGg+h/JaXzFbgNMB/Rd48dkz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3tItT5m; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3tItT5m"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-396afefb35bso11905a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788284896; cv=none;
        d=google.com; s=arc-20260327;
        b=gaiJ70EJpnf//ubhCZo3eYo8UmtqkCYQ7/S7kkwWIElfH9xBUrxKrhoGqA+eRbCq1T
         eh0gL0laKPaYSPPgsChQZL2bggNqgIzF3aoq4nT54h4bOKnPY9jZSO7Gx7fcuuQ53Mdh
         jSNDCRKCBWtTTFQbCeimTtweFLuIrbGc5eSejwQoCBL7ahDezgpWENDdsWrFtRWyOpKC
         DrR2TaeWaYL9/AzpOR8b3vukGXgZNWO3kGllOn3Lzf+w6Sj9EVGFca0OFLtg0YOTZD/1
         VUfss8YtcBQXqL/b2nHs/1m7eyIQdzp7+k1EGh4JVlzRa457HKRBM82VPc5NhzAMvSxm
         Z/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcj2MbPf+/703LfWlGvVkcF5hM4WvaFgdE71pfXNPtQ=;
        fh=4tCGpEPLYlkfqkYCXzK0vHFETufFPIjCwLQBgJD9nTo=;
        b=UbdmNgeqt6ON7zzqetSeNtoOeKYQ5kF+eKUOZbpHrpaXNaWT9SE84Uy/Z+pA79W4Sa
         ablKZ2lsYsYSL0tsirFhijy6GitpZuadRpx3IZ9G7Qhi/mD1ltEjFDURjogRyp4ul68g
         zss4eQVVZfYyPhxHyAQvRESg50CDY0g3jtQLdQpB0E/fXH40z3zh0e/egPOGUofvsi6/
         NzFgJEs6RHlIhCsSeoBp0QEOPVe/9tY3/z6wDDukQ3ZSdr35lBymv0KEKURq5yHvZwzZ
         9eSZ1AwD9u0jNE2xMFkJobU9gmk/Np08HZrqGCECz+08KeQwMtniWc2kD/8bO3C5d0FE
         RcVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788284896; x=1788889696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcj2MbPf+/703LfWlGvVkcF5hM4WvaFgdE71pfXNPtQ=;
        b=D3tItT5m+07nrwmbnWceWvNQiBXfJGvq8MyyVf1XWj/piS7CRjDTFVaMjfQIRnjIfb
         H/ujHTbsbpODnatZH4+2Hh8UES7O7EbIYeOeRBFtoajU+5W1bLNkD5SCa7LA0ljML69R
         bcIm2OCAZA7VnFp3D+X7z5kOp6u90u38EaMx85prF49LMkQDA2kyB0KKWF9jb9Zr+7Kf
         HMwPcTW5Mz1lTC5gG+O+2Xi4GW4SHgmRcmVyxocBLDL1lxTbk8RqEtXBFORbNe8DaQ0N
         1B9YutjZo6vgcwc1G9cc85V+CczXh+10VK6K2GzmJzMhRozVqVSpU7Bc278CzNmSkO8L
         2hRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284896; x=1788889696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcj2MbPf+/703LfWlGvVkcF5hM4WvaFgdE71pfXNPtQ=;
        b=pvOLCA47vCB0OoIxgirUnCoCrToOiDSepypbXAVu++ooGjAdY/0LoCw5Zm4w1n2rpQ
         MiH5NoP3mZyIN7vE045BO2R1X/6IQn6Gr5Hn43OTZctzlRxOXHvazuN/afDQzP/1PChL
         owS/UzR2T3S/YAUzjfM3ROmyhRH30SLfhAcf+m7LITYSOaXtj+DbiSPbOZIoFlL6kfeX
         ANs8zKxPcIrcUbruhldxV/FNb0QSThUXWEGDYBQZN747uW0ZYN3Jxt3SOUgruVLY+LiP
         pLfFY+vOPbc/2poHxhJPRPH7cGu4O4LYh/pT/E3JY50/mxi491IX9cOW4Ku+aDs2bjLA
         oFkg==
X-Forwarded-Encrypted: i=1; AKwUvBwq7/TFi4vGRHH7SuIPNqeYRKWou9R6dKPSwztbBc0SPTSKL9Gd2355HJNsrFOl8ll4yT4h09YSAOfBUjk=@vger.kernel.org
X-Gm-Message-State: AFuF++mC/WUGiy5Nq0H4U28jxF06p/RrQKmVT/9kvD7loNs5pIZ9Zyqp
	/9bKN/89GDoGrs+un7Jbi+IbB/0gQWbsAN+MzEs1PID8E/6mZEbG+Zq8KcdzZ+TdLjguzP76jAU
	fY5vutXuo29UxhKoMvMz9AVy0puZyc9M=
X-Gm-Gg: AYBFou3f/otbUguCglNPOd2OgWEeM1kU+8lVBaz0DBd9KRPQXaUuxF8vkM4quBpqzN8
	v+prlGVZqjIDgeD6UhNTOzNcY3Vfp37aSxfpGS5ejb3FPmFOP1eyls2M0HnFR15F6RXZNfRDzGc
	nt6+uoXMx9Ai7nmmiFoNyrDCM0FLjSrWg40Ysvm6Ssi7Z4MBsVEow/HD9CmPA1TpADUX9+rff6g
	4vJaSArOwXuYWTw2mFXR2ZJjzYjwI9WieGO9UuX82i537c618umsSziii8+oVepnbMso5hgZdev
	YtwJadDDWL2TsTTd8nnrzNUHl/k7ULquvo36Jhplb6TzD3NwZSq8oi26FJnFZUxhnhLqhwmuplh
	7aV9JCKo3hbrU9t8PTkfKe15/paOrGDa+
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id
 98e67ed59e1d1-398bad20e7bmr20530963a91.5.1788284895589; Tue, 01 Sep 2026
 10:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901072615.522925-1-hrushirajg23@gmail.com>
In-Reply-To: <20260901072615.522925-1-hrushirajg23@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Sep 2026 13:48:04 -0400
X-Gm-Features: AcwNN1WcS_X7Oe_rNMCrlpJl5NTeoyfqRDXOQdKoSI1aY_8E3V62TAx7S1S3eZM
Message-ID: <CADnq5_MM-_7FAWo9PLyZzJOHfck_Ya2_vWEGFm4uGTQp446SUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: use kzalloc_objs() instead of kzalloc() with multiply
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
	christian.koenig@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 3:59=E2=80=AFAM Hrushiraj Gandhi <hrushirajg23@gmail=
.com> wrote:
>
> dqm->detect_hang_info, dqm->hung_db_array and dqm->hqd_info are all
> allocated with a hand-computed count * sizeof(TYPE) size. If count
> were ever attacker- or firmware-influenced and large enough, the
> multiply could wrap size_t and produce a too-small allocation that
> the code then writes count-many elements into.
>
> kzalloc_objs() computes the same size via size_mul(), which saturates
> to SIZE_MAX on overflow instead of wrapping, so the allocation itself
> fails cleanly (already handled here via the existing NULL checks)
> rather than silently succeeding undersized.
>
> dqm->detect_hang_info_size is left as-is since it is also used later
> for a memset() call; only the allocation itself is converted.
>
> No functional change in the non-overflowing case.
>
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 67137679a901..5aa42fd5bb49 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2013,17 +2013,15 @@ static int start_cpsch(struct device_queue_manage=
r *dqm)
>                               NUM_XCC(dqm->dev->xcc_mask);
>
>         dqm->detect_hang_info_size =3D num_hw_queue_slots * sizeof(struct=
 dqm_detect_hang_info);

Can you fix this calculation to check for an overflow while you are at it?

Alex

> -       dqm->detect_hang_info =3D kzalloc(dqm->detect_hang_info_size, GFP=
_KERNEL);
> +       dqm->detect_hang_info =3D kzalloc_objs(*dqm->detect_hang_info, nu=
m_hw_queue_slots);
>
>         if (!dqm->detect_hang_info) {
>                 retval =3D -ENOMEM;
>                 goto fail_detect_hang_buffer;
>         }
>
> -       dqm->hung_db_array =3D kzalloc(hung_array_size * sizeof(u32), GFP=
_KERNEL);
> -       dqm->hqd_info =3D kzalloc(
> -               hqd_info_size * sizeof(struct amdgpu_mes_hung_queue_hqd_i=
nfo),
> -               GFP_KERNEL);
> +       dqm->hung_db_array =3D kzalloc_objs(*dqm->hung_db_array, hung_arr=
ay_size);
> +       dqm->hqd_info =3D kzalloc_objs(*dqm->hqd_info, hqd_info_size);
>
>         dqm_unlock(dqm);
>
