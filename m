Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793125630;
	b=EmZKhlj2CvjNpxe+eIblZcx+RBW8IVkf/zIiP36wUDQJEvpK/BP4M3Ppn4kKqbssJFFY
	 TCHyTMVywV+vWUHordDA5AMiN7HHoRfk5twHi8G0yV5YhFuySwPr/CjOXEzsN7BsktZUY
	 EJMph3/Mz1+ihMFQdnfcs8frAw82jGaoN+1iYBKh99m5Ojsc7MvMx5fND2ldNK3NrWyhg
	 YR19h1ce3pbJuA7cPt+CQA1NdxXISp6Ak6lR/JrxSX5fw9lAyYcRPZ+7ptXmr5BktsyT5
	 I1mtE0SxiDLLll754I/LP7d1SZf+C0+7DxTNftT5OC5SOt5fa+HtHkNhV3ThRXlmzsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Vw76Aew22t/uqoyjfMPtUUfN6vLBI7u4FwkWnSbrmwo=;
	b=KD8uJYCnXmonyXwUSombOLe/2AEmxSAuVaa4rcQ/ofsxTcgFXK1CYHlJTQWhgn1bb1xa
	 uH8U+mYWgSE1JyCxjHMLKKqBCgkDm5XWrPNRmGok/xtiMsWMHYnYSSaWZK+c7hBi46Uo6
	 VmBCU0nwE14MLTw6e+0vxmZ1tXzM5FO8M7MdTyVwDhdz11w1Qw3Dgz3Mh2JsdtgSTQhWH
	 OlG47zVS+sw4T3YVp36P1t+LtK1H9l6tnTQyShe0vqCIJXZAA4RrUaLQX3yZ6vWn91H5L
	 xeZWK8fZ0XPzEzDBVDq1R3WrMDWiuMBFvFrpaaPDh2IiMGI6MhRYt52Kz3nKQCdsZ/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqLwd0Ub;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7F1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqLwd0Ub
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc18f754f1so9879137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125629; cv=none;
        d=google.com; s=arc-20260327;
        b=UwnIoDhmhsbNp4z1mzNcWH/DvU50WlUXHzUmMrJEk5bHhirO8pRCdHwTG85M5EyRqw
         9vFgFuNGIoHAhcYY86A7ruQ0qVvUxeHIxV79hpyzmCaG+c26yW7NKna+G4UCO9u+jdKE
         Od3Nxe6u9GgjlaTImUtVk7NCqTKvxcFl4qPOP0eU3TYWlCEGrKHj07fM+rzoIx16BJux
         NlXeWcdMSiw0YJAd1/hTRtmxcNMXs9DawUx8IGDH5YwYD9MewHi5sMd+BX5vg0qlA+pK
         M5ZDznwnsO13shhAmbHUMqq4GhsFUZQ18MJI5dj/huHgBdD3Vt7guTko7t8O4oBvcAFU
         oxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vw76Aew22t/uqoyjfMPtUUfN6vLBI7u4FwkWnSbrmwo=;
        fh=+NNPrnH4R4jvV//69lKWZJQgrPwdpFgoK8j90qXC6gU=;
        b=PsAET3vPCf70HrVazCtlrPnLhKUKuLtTcnQCBeG5I3q6iMRUj8zIjISfaTkXPPAyG0
         ot7J5WumBN6LaXxi44Gk3+AVCmBg3p0dzzjghIULvMq2Uxi/1FGIdRUEU/sjvaXbO15E
         UcAOOi6rTfVfc2igNSoHweXzCc0rpnf3ZmfOfSV/BLajj+91wbRhLL+oBs2VdAtwQSg0
         q54QOm2ktgBkhaWTUopmFgT2Nqlsj/f38eQ/5ogcNMzf9EfMS4LEmwqOyaSZnYNOvMXd
         hYKbo+Elj3xPmyLmN8bEyLyK9B6dG4ZByPW1TjuLdQitsE2ob7qxs8SuR9lXzZHvA4cm
         5XXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793125629; x=1793730429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vw76Aew22t/uqoyjfMPtUUfN6vLBI7u4FwkWnSbrmwo=;
        b=OqLwd0Ub+2zMc3ZoAtk2bb/o7ReS7nwHS/79T/RlyfUFR2r3oY2lWHSLhiL0I/VZ48
         oyQf8Ll9K3pDJ5j+buQpKS0+O3uxaeNOW838t1fEaPZlZweKGaR+qnbSBTt8rn2RQkZ0
         eXtKMYrISQCwyi64BerKK2DHhGgj82bcBH1lCJnk4yNw/vO5QFK2Zy4SVAtLtBySXPae
         Pkl2ccMwxewbcD53dL/P1ruzvpSMwPe9O6A+ZXhWBxQoShwX1UrVqYurAxmum4tyO0PL
         zN3XB/AAn8oA5N42VfoIrJ9hYOWLytpAg8F60WuXl21F8HrATo7PxjX/e2cihcs60/+b
         Mxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125629; x=1793730429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vw76Aew22t/uqoyjfMPtUUfN6vLBI7u4FwkWnSbrmwo=;
        b=EPCcoedu+FOhwh5vRt7dOET1Lbiif+6qdujntArlkRIlyqhzK6cHBmPbfi6LW3yvQd
         Br1tbsOFWcSceDGN6CzwzJScxTQSeC/ZH4twyNzQ3s9NEm+0nPV9L4JEX4XvWdQ2HHyf
         UWdFR+9w7TiavuwuCAKis7N586Ly3yilbCWmYWG2W8tmz43sGwBuv8BAxFLafG1Ws5Ox
         YexMdyg1q4OuYATwUc49tXZTSLKIGrxHynhxLxtupGzf1Jd3OEJbkYj1PIo0LS+sz+6F
         jDKK/X+8fG58ZtKfZPq/OGM98jw6zXDZr1q7bygPH88uiZ0q2HKW3GCREbdMcmzFBCfQ
         eGFw==
X-Forwarded-Encrypted: i=1; AKwUvBw+Ub7mHI0B2I4Tm3UqN9ras/jDxxRHIPcIdP0yx1y5E3YelxPmWozwUcq6kutvFk5zDWtoWk5Qc9JlU30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGdioJL32syDq+uaRa8HxEUbt3KvrbNmSp+gaKjr92vW1spRf0
	FH1hPe5RxDeFt3zfgT/ShLyhRnj0LW0L6ogUMgOI00sBAIdxmRSpS/LF+5zS2ddSgjic/2CybKp
	4WlQZ4WRoSa+/6zRl1pvkIpFxJVE7HJ4=
X-Gm-Gg: AYBFou0YxVAFo2UFdSbMqfUntOYOy2QW+haJqeMrUsFzpV5rsPNh1xfQ4CKEWfI8yYx
	iK+teKecWLTIdrI84UyicfSsODEWOQYfWajy8/xnNyQZzsYyHmV/ROMmxwcIqy5GMzbQ5pAvPs3
	yRAYG4XbJ6AwyHzWyFyaDGR2iSiDMcFK85VcpbpBrKC6ot4ufidEtlCnHnHZrjLfB5lBHrebYDP
	lJLnQZSTfWCe0wF4bbOze/jzf7XEtQ5m3LPZPofiN/xPziBvJ0/qCeQ/oD35Uk87fo18RVJ1gtf
	OaHAISxsXRUC+hVF4a1Z4TmlueV6hDHLw2E9fF1wuZBN8iboctd2zXOmO4dgS0vIHVjP3dshJml
	HYHGsIAyrplF+BX2Dy7a+S/bX4Sso+OAjSIcnbe+ScUPrevc/SH7+gf7uxWwOSIq8hgHa9yqxtw
	bb3PawM5PPLxND6UiPX1xp2Dk=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id
 ada2fe7eead31-7d03a4e9c8emr64081137.2.1793125629415; Tue, 27 Oct 2026
 11:27:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <3ff4ef96-9c59-4e8d-a0da-92a1ac6f5ba1@gmail.com>
In-Reply-To: <3ff4ef96-9c59-4e8d-a0da-92a1ac6f5ba1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 14:26:56 -0400
X-Gm-Features: AclHuK_aiFzsLGIkoZq8NQtZC7JMp_ex6BpnMJZTO84Fyg8IpU6xOsXcoFUrrY4
Message-ID: <CADnq5_Nn7+baU=Rdaa8QzOCo64H=ch9HeDaEwtmbQwW0kP00nQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: report synced Apple 5K tiles to
 PowerPlay for MCLK switch
To: Richard Lane <richardlanedev@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:41=E2=80=AFAM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> When driving both 2560x2880 tiles of an Apple 5K iMac panel, Display
> Core's program_timing_sync() already aligns both CRTCs in hardware
> during dc_commit_streams() because the two streams share identical
> timings.
>
> However, on DCE < 12 (iMac15,1 through Polaris-based iMac19,1), Display
> Core leaves pp_display_cfg.all_displays_in_sync unset. Because PowerPlay
> is not informed that the two streams have synchronized vertical blanking
> intervals, SMU7 prevents MCLK switching at idle or causes modeset
> underflows.
>
> Report all_displays_in_sync =3D true to PowerPlay after committing both
> tiled streams so SMU7 knows the tiles blank simultaneously and can
> safely downclock MCLK at idle.
>
> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 548f975c7324..384a81371f80 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4788,6 +4788,19 @@ static void amdgpu_dm_commit_streams(struct drm_at=
omic_commit *state,
>         mutex_lock(&dm->dc_lock);
>         dc_exit_ips_for_hw_access(dm->dc);
>         WARN_ON(!dc_commit_streams(dm->dc, &params));
> +       /*
> +        * DCE < 12 leaves all_displays_in_sync unset; report synchronize=
d
> +        * Apple 5K tiles to PowerPlay after commit so SMU7 can downclock=
 MCLK
> +        * at idle without modeset underflows.
> +        */
> +       if (params.stream_count =3D=3D 2 &&
> +           params.streams[0]->link->tiled_peer =3D=3D params.streams[1]-=
>link) {

This should be made generic for any combination of displays with
identical timings.

Alex

> +               struct dm_pp_display_configuration *pp_cfg =3D
> +                       &dm->dc->current_state->pp_display_cfg;
> +
> +               pp_cfg->all_displays_in_sync =3D true;
> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
> +       }
>
>         bool frl_stream_found =3D false;
>
> --
> 2.55.0
