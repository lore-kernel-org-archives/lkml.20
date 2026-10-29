Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294687;
	b=iCLmdWEFwJItzer9innKjtPVv2dGF+oJzG/rNpltji9CU9CBWVmU0j9i1OWfCr+qUXAb
	 DVeHl4J5fCscqAOKYEr0BDm4YlLv48FWrBnJvoZANgOYT2Voddg0CkwzDeRqJsgi8730F
	 gw1i2K59hIY65AOGK3d2LlxBnjTwdjfmlFsnMuu2cL3ampAoKaWkYj2ZInpqR4ahP3iMH
	 K9PNime+9WjbPt1mkbxRI7Y32qM+6KrG+SJUVybWilan5WRVh6vRE/FM5ushrSHSwojXD
	 kX5ZdJUoKG9MCzNHHzc553h+sEAxtRQ70GlVfVLqXtvVS+a7kz7sj+JRmsN0ecsXgiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4A4AcHiztzOnu/TxoJMI7gFBVfETl6VApiXh5L1B9JQ=;
	b=NNTMbv4D5R2N8f6/LxDIwg/gGOieVJSx4Ry+YKlFQl34Surf2d3sCGD+bw7FpQhck6lL
	 o3c7iCWyXCCGo7m156pIFLxrTekDbtkAPYFwpmSbCdjBWyRwIA9r7vwilrFiy20nbDrhr
	 laKpPq3uKyDe7QIOmjlhiIkHgm++JXfUi7GgAM/gEwAnIi5UJWVtg3MOLBpTv7AcmX0U3
	 yemXvsSRRv0LbJYw6Rhu1t6G1wQ7CvdevxPugVpCLUmh/IL8s7ktBXbRV6/mVFCq1vgvD
	 M4AFsSUdUrLQX/jMdG9zZLqKc6VV+gT+fF+l2S2as9K0ERri2vk0UKOVD+KwAHTsmhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMOmvwYp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB33606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMOmvwYp
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so7371105ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294686; cv=none;
        d=google.com; s=arc-20260327;
        b=B74yNs8G/PKz1kQ4J4ZzQP4wmisbmMZcULafS2f2q9SnUj/mNIqC40S1RzmVbbjY/4
         dbdjO6J686LSJHBieDxkm4nL6z+DFPaF1cse5aBtp4PwS9dMEeaDUaRA0Nx3bbilY0m7
         0obcI9hnCGxbL5zmKPk3GpbiHhaLX4m8LGFdipHuruqXDQY3APNyRgdG29gRZTJ96Kh0
         YqgRTdjDvk+xE5z2mWiNZe2NCW68XVkuEQScekTCN4suSHCh8q/vxBbBPAHQw/W93t1l
         8jLD385g/Vlu9fp4YMyVtHcw9rXPTSlEAtpX3GhH3qgsz9GrI6aa7+QDGigqw8q4SbxW
         D/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4A4AcHiztzOnu/TxoJMI7gFBVfETl6VApiXh5L1B9JQ=;
        fh=ecOiUUBNUxgGfOsMAFdrgWC27aBoa5PDHIRPgS31cWE=;
        b=ioPSXiPsQrSrG5bwpN3uHjRlv+9T7f+XUYNpwOq+Pdwm0Jro0ciCTIFrr9+AFZuXb0
         I2FUtMzrStEjzc2+UIetjJqUDHGLhSBRK/7hvY9AUyxSwXtb5yraGoRbYax4GUzjttiN
         Jh/m/vos1Y1i2XVA02Q5o8OKaKbFNB4ohZnwHuKhNz0d9SY7MMHVIoZCR94IpWKIBJu3
         1IAEFjyS7A+GmiRbFut/Zdfp4Su5YgYjve6dVuWFCS0Lpp7VaQcwP2NFaI83d8coXrrr
         sTgQPfnHHI3Fe/DcsQlsf7VIMnZsA4OQdunp80Wpay5FqV95CUNkHHk9lyY1nnUWokup
         7FvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294686; x=1793899486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4A4AcHiztzOnu/TxoJMI7gFBVfETl6VApiXh5L1B9JQ=;
        b=jMOmvwYpZ60bI/5mOD+tQI6Xyi+h1KNA9Pa6JITZkoNnqgvtIsQCHoaKNTiCm5f0l0
         YucdFW91KK1hgtTi5rQpHKKhQDYXlp1tJlhAluGK6A0jzwLFGU1mdoUiTko4Skw730wq
         P5itoplvb2CD6polNxf0bvj5Al5z3xuCQr1Tq+GoP9dl2aW9f+pdW5Wkju5Q3bi+e+W+
         DxDoLyx7TpCWNvVA8UsRJ9Bm2ZYMPwrlu9ULB2+13u0EN5JPrElZUZnDhZnqFYC/DddG
         gV5dhec0TR1SgWQyflDl+Vddqyr8V2SXK7Lvwf6d6JtZJ8fdEWg6oLhyymA3lVDWwx0g
         n+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294686; x=1793899486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A4AcHiztzOnu/TxoJMI7gFBVfETl6VApiXh5L1B9JQ=;
        b=hEoOrkwyD54DMOP5bHNZPTZcZbLNb+YUpAZ+oiWMlK121DTx/xa6fJ+ekmf0WjhEEo
         /l8qzF6QATj7Nk5fH1NcIAqBQoGng30mx7SUPrRKWdYZJDweWCSUocXJMMbULIcNbgO7
         kpb9vpk4AMG4x14FP9yuAguLBdcfdIcPrKrOHr+OtCPTBJ+kFdVXteqMxBEoKmnGimuk
         8oewNeuyDKw3ZGhyq2Wj1FWpng56+Kmr5KX4db0rKtoM/aet/5Sxh93YhKXHjlDqyDAg
         4Jbg8PqkZeNbLHml0GVjB1d/L4knsIpsWEbXL+UZeNpr/iHmGr3LR53Orp07a48T0eyG
         MbVw==
X-Forwarded-Encrypted: i=1; AKwUvBzU08leENaw4c1qgMo7P0j//2Ny0vJVkyiGIlAJaKJ/gxeFcmWaVlX3iNsxR/fTuEpeL136A2KlUHRvtSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg+3qhZ1RcqSWAG/8iWnMy5mJz8swGHWQ7qDHAgu+HdNatEU6R
	vRvAuNIoKq8B+XzUf7ZKs07InSePsuQRrGBpX71pfLpLy10uHVCuZZtDJrTiL5BkrM1YWWvyZKY
	xoj7GjQhVT5V6BtJTv12U20yK5VH6mnKNS9a+
X-Gm-Gg: AYBFou1BlK5JnCpgm1t7iS90lz3nJhEFR6gZaiE7s319DBo/XWme22enz5W73XJLTqc
	ADCPZCx/YQGjClO35RyXYvrfANZTAniuFmhwgGhMeszqCqcwG/3tEy8MPupaHiOzpQgmBTe35gu
	gFuE6eQdF/XJhJsCKmEqedrHxiCxQfXOe41drTVF7vRa2RlCIx9XSXjYQXUdWGlbCPfassnE1AV
	L5VVvmcICfUFQsV7ewpob/xdiiRXWTIu4GWXeDjMcpqu/Sc1HJSWs73KoAxQyvlLe2FJ03QROWF
	oETziqhlw/dB+m+isFx5q78mz3mlf0WGK+kiEwmnBBTStvN9KUrHLQ6IFZnadcJPkU4IT+eleiQ
	gK433NTkO+Qj1BFNZvug82UyZVXKlVP1bfLvtcXXppucVPY1IoU6+h4YM0vmC/SaAi7lfgukKGj
	QD3u/fgW0a99kcWaJB35V74sg=
X-Received: by 2002:a17:903:2341:b0:2e9:53b1:a3c8 with SMTP id
 d9443c01a7336-2eb36335149mr1770895ad.0.1793294686611; Thu, 29 Oct 2026
 10:24:46 -0700 (PDT)
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
 <CADnq5_Nn7+baU=Rdaa8QzOCo64H=ch9HeDaEwtmbQwW0kP00nQ@mail.gmail.com> <86cccaa4-62ac-4834-bc74-1755436b5be2@gmail.com>
In-Reply-To: <86cccaa4-62ac-4834-bc74-1755436b5be2@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 13:24:34 -0400
X-Gm-Features: AclHuK-h1jtYia2NalGK12IWVn5sZl6dkp3ZXAqLy9ybsB7-D4ACQecyB4R4q90
Message-ID: <CADnq5_PxC-a3+SWmvnRTDmJ8_-=ayCr-G6Yhi7ryKhV1TEKUxg@mail.gmail.com>
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

On Wed, Oct 28, 2026 at 7:38=E2=80=AFPM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> On 27/10/2026 18:26, Alex Deucher wrote:
> > On Tue, Oct 27, 2026 at 5:41=E2=80=AFAM Richard Lane <richardlanedev@gm=
ail.com> wrote:
> >>
> >> When driving both 2560x2880 tiles of an Apple 5K iMac panel, Display
> >> Core's program_timing_sync() already aligns both CRTCs in hardware
> >> during dc_commit_streams() because the two streams share identical
> >> timings.
> >>
> >> However, on DCE < 12 (iMac15,1 through Polaris-based iMac19,1), Displa=
y
> >> Core leaves pp_display_cfg.all_displays_in_sync unset. Because PowerPl=
ay
> >> is not informed that the two streams have synchronized vertical blanki=
ng
> >> intervals, SMU7 prevents MCLK switching at idle or causes modeset
> >> underflows.
> >>
> >> Report all_displays_in_sync =3D true to PowerPlay after committing bot=
h
> >> tiled streams so SMU7 knows the tiles blank simultaneously and can
> >> safely downclock MCLK at idle.
> >>
> >> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >> ---
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 548f975c7324..384a81371f80 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -4788,6 +4788,19 @@ static void amdgpu_dm_commit_streams(struct drm=
_atomic_commit *state,
> >>         mutex_lock(&dm->dc_lock);
> >>         dc_exit_ips_for_hw_access(dm->dc);
> >>         WARN_ON(!dc_commit_streams(dm->dc, &params));
> >> +       /*
> >> +        * DCE < 12 leaves all_displays_in_sync unset; report synchron=
ized
> >> +        * Apple 5K tiles to PowerPlay after commit so SMU7 can downcl=
ock MCLK
> >> +        * at idle without modeset underflows.
> >> +        */
> >> +       if (params.stream_count =3D=3D 2 &&
> >> +           params.streams[0]->link->tiled_peer =3D=3D params.streams[=
1]->link) {
> >
> > This should be made generic for any combination of displays with
> > identical timings.
> >
> > Alex
> >
>
> I have changed it to the following to make it generic:
>
>         if (params.stream_count > 1 &&
>             dm->dc->current_state->stream_status[0].timing_sync_info.grou=
p_size =3D=3D
>             params.stream_count) {

Looks reasonable.  Thanks!

Alex

>
> Richard
>
> >> +               struct dm_pp_display_configuration *pp_cfg =3D
> >> +                       &dm->dc->current_state->pp_display_cfg;
> >> +
> >> +               pp_cfg->all_displays_in_sync =3D true;
> >> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
> >> +       }
> >>
> >>         bool frl_stream_found =3D false;
> >>
> >> --
> >> 2.55.0
>
