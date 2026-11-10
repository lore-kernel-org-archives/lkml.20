Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794340765;
	b=3wacTidUKEB2oAjYRwgyMVYMDIZVWCyXatHocQkWeu6HtWMN8uEULfLwg4wmVRfb+O6B
	 IqfaEl1G1LZbqQ9/+4xBp0HpzOg+chT6LAwUvM0fyDxDtV2/RbnFPJfMWFxXCU31zBJ/N
	 /v/B76+OnJrOiCmsZ/LBp93LKm7XlghlW35ag9lb35j0ABP4OAvPt1GvBtkZraBcEoJPF
	 6I2yf4nU+otORgUIsQbhvG8Q6hkltKhas7CgS1vBCTCHuijYdUDP3ndi7p21NkJhBU30c
	 gDkluyZRm6EbO1bKsshKlhX0UOeMM5bMqVGZPshcrt6Nnb1hgvwPRjuw7wLu6e8o7Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Nlz5a5EqJZ1B0jGIvjBXTPfp8CkOF6iXGCRont2Aco=;
	b=n5rERMnj222urresicIUazm0QF6imOBgnMYJVuSKXk5oX3Nu7YdQbKi4eE6BsyWVes0m
	 t/zfV3Xr/yDaYXeFfI9stWVu0pMSnPJju5Pf5Vf6CoGIjQbDbdVwOU6Z/6e/y4E9CvBs6
	 nJYVJHooBaj2bKbLzkh75hx+5K1UBJID9GV6/Fs/DWMDAorqqCHXGgdun2PmAp8H/YMUr
	 DQECPHXu7qHTNvAxkoW6VbA9yiJr/Z1XksHVx3m66105N/DNiq1EWfRcdJrVn+HcWXWX9
	 jbBX5RQIibeQAQn2XlM4n0gj6YFzYWHMfbAso7rwRnpO9cmAU9HXkzbl+3r0ft9zyKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snblZNh1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snblZNh1
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acb1224533so257702a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794340764; cv=none;
        d=google.com; s=arc-20260327;
        b=d397EuyMkHVXKMHRBqEfHmEf1otQ8cm7dchaSpC3v/WIiGMVT4JxQl22p9L4+6DbHc
         UW3F5w6FvoxdD2Q7hqkeu+rk0FAl3BQZO8V1W6dsAW65iVEOPFNKz/0gxuhArqekrQJ4
         FH1U/pvpMZaGMJIsrBOiLEjLK+ygIts14LAJJiTzJM1u2zKTJ1h69WzOtfU1GemhST6d
         l8+0CS7YVSbNaJqsS+LB+Un99DIHkaOqV2ZskXlqDmDkI8nhcB6+ZODsnm3GLPLH+WCP
         RJ2kBeNdA3mVyY8cyfKN7Sdq33HTFvAB8HeKjLN7d6rB5Ac7PWpE8q+JRfZsLBv6+wwx
         kSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Nlz5a5EqJZ1B0jGIvjBXTPfp8CkOF6iXGCRont2Aco=;
        fh=D5fbEbeM7ey80XKhOjsfiuBiZ9QTabI4LmH0BFTO7Vg=;
        b=Pn8Ul4vCCbfnlRt1fYCbgal3p4aKlbJFd116j4/76imoklKPL3IpohBl9K7m6Vw/zT
         zL0jDMtlAlNF5+Ba9sG+xiYtcQ4v+YYo98IpKDNYeFTKmtQpK9rXXxTVPNr0xj9v65Q6
         YNEBKQZywT3VnF6uQjtuGGcyMA7+wmzMVXAbd5D/GKRXTulJ0S8PwbPnbM5TAUf0UnlD
         achC/veD4lYYsqNgaVg1z6MDhjlYA8B8XN5G+J9SjQcr1z2cAE1r8IdLYJcNJ71cL4Hn
         G9coq9MY0yrR5FfDagnGEvrfHgy2c6639sEsAnB/L/NPfTcaosATOn+VY7HLOHsplOEq
         z24w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340764; x=1794945564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Nlz5a5EqJZ1B0jGIvjBXTPfp8CkOF6iXGCRont2Aco=;
        b=snblZNh1trybP5Bn4yP/x5p2BwZDiJHRmL/kRYSD99g/9p8cOfLxnZhekrTQ++ErdU
         X8vk+9vNKE3Phz7EG6m2qNy5bIPbmjSwAlGqINUGDZ1pNNkQGQQ909BZS/0jOTj3D1TH
         fuY9QnoJtFjA8AfZ53kuyng9QYdNunxXKtUBVD8/S9qjnF8gWYxTBGvn7+EADnhtnbUn
         5EhOWkOro8xTE0lh9ZI+OVHTKqjERvKwWI1dJ524o1OdXoXBPFc6DRM/Blp2tJWvFo2Y
         OLXDf2yhbQRIba2zJ2DmEQShMBfWrRaKJoRaSROdEiDIcDjDNTCjh/ujr67yPoW4Yv+J
         Ty6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340764; x=1794945564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Nlz5a5EqJZ1B0jGIvjBXTPfp8CkOF6iXGCRont2Aco=;
        b=xtO4tM5x3DdNxqMl7CfhLhZ0TGxuOLt3gYRFmtPw9celD07IJ/Qdu+z3CBDtmgK1Kn
         GK+1pSwTOUbu8PohR7o1GS/7VOjE4jykGKTdXhH0Vt6oV9etPot2zvuCF+9Rl829GKtU
         jxUZFDx/TuUmL8hgYn52zGelgck20BT8l/YycFKEhIos8TUgFsg/vFK8MACthesAG/C1
         DceAKCd1l+4udpLEJsgxjwmB8qFZAsLD+zYfp96kM2/JGxHhU2e89SuzYG89c8DM8+fL
         YJ0K+RhEkqTx0hAsCDSQWv0zMM+jQ8GLU6Lxhe4jooI2kuiBZTgM/L7yO3JmItl/J83w
         bEMg==
X-Forwarded-Encrypted: i=1; AL+hErEJOM1tI2NiGB6ViCnCRIkjME9LEn+IykeH6nG3m4JJUyMCJcl1MHKJaRu8Lay6L7q14F6fIrWosduMUIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z80s56LjJRpS14vaknu/1w974Sc1/Ul0+i8c1HV8kUa6LwdpO/Z
	zj1RCaDQD85sz9tyRfK/Nmlovwmchhn9uLmBRQvS4VaUBh+1e9GbrrGxZmiaR0ESbDzsQiSxQEt
	WFuPUJkcIXeXBHugFNg1QaTFInxDima0=
X-Gm-Gg: AYBFou3XGV+a+UCft5AzJT8+1To+Se706gokMlP4tQc29t3vR5bGLzOLTsraGGNG30j
	TKVdpqYg6WFQKCW7KV/170wV1cPeA4CD8GfTo+K4sYWim1oUWE7g4G3VUlWPv4/WbX1erSuPuIQ
	najIZz4cOHSq9zaufmkFM7eoMIZTaAat63pAemmG5PVb1408L7+p9qFqR+SgImNtFb0GGPTiPgT
	Atev9E8MpoM4FqNv9kSyFrNNkE+SvAjllNRs48nTAaAU6ArY0kBn2nH+sWG0i95335Gr25gOn1G
	LCsBsAc8qixFwBAFyRRv75h9vHOmuJgJXwae/Axl5ICZftAe4J+eytVByzH5Gw39MyxQtei2jFv
	eEPys0AL7+LBd54HtMJUdU+CTmE41JD4ytRGTFBUh6jnmSn4bqczScBaUpQqmhZEnsvPn/cnrKq
	ZCvkds9FfQfFnKlhRxFdrLowHR6YXWjnNshb/TyNEL90i8W4iagfzT2PJA/HE=
X-Received: by 2002:a17:90b:4b84:b0:3b0:9984:18c6 with SMTP id
 98e67ed59e1d1-3b182f14e41mr40487a91.3.1794340764427; Tue, 10 Nov 2026
 11:59:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8eb61179-c5b8-41df-a466-8b5c388b6b41@gmail.com>
 <CADnq5_OrGuMJT4Tvt+wktPzTYEopdkCjyqq8sSdvJou40-HoKw@mail.gmail.com> <a6093dab-c38d-4dad-af3b-7173a6eaa78c@gmail.com>
In-Reply-To: <a6093dab-c38d-4dad-af3b-7173a6eaa78c@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2026 14:59:13 -0500
X-Gm-Features: AclHuK9OzrGAjIUTVR5CQZwX7f-zGWFe7vL5DtJpWEOYzcy9aOUsEMrpOSQAIqo
Message-ID: <CADnq5_MRA2bQG5x9xiGAT5ddh0jHMqg=u2OhCPvJxPr3ddTurA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/amd/display: report synced displays to
 PowerPlay for MCLK switch
To: Richard Lane <richardlanedev@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:49=E2=80=AFPM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> On 09/11/2026 20:34, Alex Deucher wrote:
> > On Mon, Nov 2, 2026 at 3:31=E2=80=AFAM Richard Lane <richardlanedev@gma=
il.com> wrote:
> >>
> >> When driving multiple displays or tiled panels with identical timings
> >> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
> >> Core's program_timing_sync() aligns the CRTCs into a timing sync group
> >> in hardware during dc_commit_streams().
> >>
> >> However, on DCE < 12, Display Core leaves
> >> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
> >> informed that the streams have synchronized vertical blanking interval=
s,
> >> SMU7 prevents MCLK switching at idle or causes modeset underflows.
> >>
> >> If all active streams belong to the same timing sync group
> >> (timing_sync_info.group_size =3D=3D params.stream_count), report
> >> all_displays_in_sync =3D true to PowerPlay after committing the stream=
s so
> >> SMU7 can safely downclock MCLK at idle.
> >>
> >
> > Looking at this a little deeper, the function bw_calcs() in
> > dce_calcs.c already calculates all_displays_in_sync using the helper
> > all_displays_in_sync().  Can you look into this and figure out why
> > that is not working as expected?  My concern with this patch is that
> > DCE and DCN have different logic for handling mclk switching so I'm
> > not sure it's safe to call dm_pp_apply_display_requirements() directly
> > from common code.
> >
> > Thanks,
> >
> > Alex
>
> Moving it to dce_clk_mgr.c and using resource_are_streams_timing_synchron=
izable() also works. Is that a solution?

I think that would be preferred, but in general, why doesn't the
current flow I described work?  The function bw_calcs() dce_calcs.c
already calculates the all_displays_in_sync flag using the helper
all_displays_in_sync().  Is all_displays_in_sync() not checking
something properly or is the overall call timing wrong such that
all_displays_in_sync() can't properly calculate whether all of the
displays are synced at the point that it gets called?

Alex

>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c =
b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> @@ -31,6 +31,7 @@
>  #include "dmcu.h"
>  #include "core_types.h"
>  #include "dal_asic_id.h"
> +#include "resource.h"
>
>  /*
>   * Currently the register shifts and masks in this file are used for dce=
100 and dce80
> @@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirements(
>         struct dc_state *context)
>  {
>         struct dm_pp_display_configuration *pp_display_cfg =3D &context->=
pp_display_cfg;
> +       int j;
>
>         dce110_fill_display_configs(context, pp_display_cfg);
> +       pp_display_cfg->all_displays_in_sync =3D pp_display_cfg->display_=
count > 1;
> +       for (j =3D 1; j < context->stream_count; j++) {
> +               if (!resource_are_streams_timing_synchronizable(
> +                           context->streams[0], context->streams[j])) {
> +                       pp_display_cfg->all_displays_in_sync =3D false;
> +                       break;
> +               }
> +       }
>
>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, si=
zeof(*pp_display_cfg)) !=3D  0)
>                 dm_pp_apply_display_requirements(dc->ctx, pp_display_cfg)=
;
>
> Richard
>
> >
> >> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >> ---
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 74cd88d8d580..b4531383437e 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm=
_atomic_commit *state,
> >>         dc_exit_ips_for_hw_access(dm->dc);
> >>         WARN_ON(!dc_commit_streams(dm->dc, &params));
> >>
> >> +       if (params.stream_count > 1 &&
> >> +           dm->dc->current_state->stream_status[0].timing_sync_info.g=
roup_size =3D=3D
> >> +           params.stream_count) {
> >> +               struct dm_pp_display_configuration *pp_cfg =3D
> >> +                       &dm->dc->current_state->pp_display_cfg;
> >> +
> >> +               pp_cfg->all_displays_in_sync =3D true;
> >> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
> >> +       }
> >> +
> >>         bool frl_stream_found =3D false;
> >>
> >>         for (i =3D 0; i < params.stream_count; i++) {
> >> --
> >> 2.55.0
>
