Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794684645;
	b=Fo7wfNeCfxkTrRnNNH3+2F6yW2jaV2MG058lrnihTHt9siG9xfJuuIR35BMefRpyVWB/
	 c4rVJOPwXgzl3JMnt9591qxm+GEh8vzHlfKw19oRL3KXka/aSR1Oy4O1OlaHPfG+iz3GG
	 +JpSYtRKsMigSQox3Rf6KKRk4CNdxCQA2B6iQ1hFyxaQ5z4R96X6Albcw2yDp1npxSg0o
	 GYdWYNhtkk189hgcWTl5TNExMTKDmWGFWGtoq9w5fRePgnb8r8dZJsIOs06IbNp4dHla1
	 mUFhfqCq031hpsW7kh421dOvxpTIBWgse0IcAPwBj+H8SHkTyIyreW8wyIa0fLrZ52A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ozUGgq3FlDQBKsPKBBbxJSLE1LvNcxvIXuIqXKlgpTk=;
	b=sayL+BjzHLgUK1ADoGfTcBJneEZ4LwVTEfUXwmFxz29HCBsEzzCwnDMHjCenv3P9yjuD
	 ePXEnXqMZsbNhbPQaqhnOG6RKjvTZLM8ngOunbsf30NEtfsuG0hur5SKjTyAVM5EWHR99
	 qnMkrHac7ymJ1sZ3ouex+VOkSbYyCesGVsMBN8K9iEC64YplHwvjIGxUsNQnvGz4AZ9Dj
	 2e6xATlbCsurCSMvazN/XoRMiAjOymALqeAbE9NsSyg7PNySv/QygTwCEcoCoBWHHbJ6K
	 7bfb3AQETR9jK2m2T0PoV2epNpaInzZicIqMv605VcNoKrGgEE4v2tFAecmZ9lq1h4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKEQuOm7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FAA606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKEQuOm7
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b273ed58so45279a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794684644; cv=none;
        d=google.com; s=arc-20260327;
        b=ESaDOTMIVdgvV8JqiAcfQUjk2aWWfV3VoObAG751+goVuP7lDdbH9iSXnsxQLw34at
         1R1hAJsv9td9U53CpZUoTRS0bhRqcbftUVkvCNahNkJUSOHK3M542R6KCvHlid0Fz+Z3
         6xtHRHrHgWN6QXxthoIJ+FAnfmAd+Osl4ksaHkQeLeUMrCxvhKH6KacFC5RLJwr8RooR
         wGyXPf3yuSYtx8GP0KFjBfF4rSAtTGMPrcjQqBl9Ix66fE5Oe586gcUytWsegZWmNJrJ
         +sEF33M/qQ2jICcNNNBj0t0j6KBV9jtZ0UxU444P7x/fOe0D3Izv7gLly1z9YQXVpMci
         G9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ozUGgq3FlDQBKsPKBBbxJSLE1LvNcxvIXuIqXKlgpTk=;
        fh=vK9XqAEYq7fAmpLTbRCQWBIsNlipr/X3FDswRnCHIag=;
        b=nIfXCJvZOPAJxRWfulWX8yh7AV8DGUncH1c5FOvcn0KKMyA1DOmGB/rukED3O4HCqW
         F5JIfNtomodx7n+x02dtQiZnxIVZITfBB95ATjqhFRvpVyvP/QYZfhNsetEaSeZeuDom
         SSNZh+rU3Lb8QXN+5wlCS6pVqsCfFYtl3kBIpOL8ApgYTfZlBl8zaQ3GifiXNRyxAVfK
         5afNvp+IQX4hY2ZBwIsvyAmXtQMgCtozZwSL7yyFwil0xIqs83m88Z581ftDI1R1R+ul
         bKn6ITOB3fWPp4oiv/HohvUMyfdBOiYhaJrdQJAweB+aoo/ruPk96CDl+DqQ+jHsqy7P
         OQtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684644; x=1795289444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozUGgq3FlDQBKsPKBBbxJSLE1LvNcxvIXuIqXKlgpTk=;
        b=IKEQuOm7CvVi+8RoAGbVP3jnrSJ8t2dR0Wu17c5WNraRao3RAXIC4K7J32agBWnKG2
         WH23tsKt2Bki2xcJi8cjEz9N0NnNOcrJ36CwKd0y2TisXv98sjX+OwcHR6wG9UNOp+lC
         5YjvKxcA3frstK6FQpTK0IG2unKoJMn2wOvqQZ/gBwlj3pwYvf6RQRsGbOz8cWgrFYwZ
         irAJhf25B78pX4NzqQ80VElmJ8nXkJHyM2eBdcVapAX+jClFGgWRx35PHSuugRC07Ak2
         ROpr/qSmqaFYD+LYBot0iHgyuIvRuY0GfMwBPMO1mQJ1SdFcG5kXDwBU0OJ46voW8NZO
         Zkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684644; x=1795289444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozUGgq3FlDQBKsPKBBbxJSLE1LvNcxvIXuIqXKlgpTk=;
        b=ee6y/7bEtfkozNfIndPpFQE3MNwHciVT1nEDNHXbid00s/gl5uD6iDChMpMZj5vshz
         mVjsoYaxr8nG8JGRgaDRYZ68HSlo4KRyyaHELtz2DYjScHtqc+zuoiKjrpCt46COCOSu
         dEgrJ9xcaVlXpKGtYG9gu5tuxbuNjKvewCVzfCgXTap/0RjKFk7uxEtt63QddodIdpWd
         ZcWEuwti+1jm/vR13PH0xYDW1RRTK9pifZhh9mqI00U5XDjSvnlRNne6/VSXoJawyExS
         1cVB88wodp0kBHK8Zub8lFlxlPZXE1oPlQDS3uh6GKT/zeAQdeeutjxHDxLWXJQWObVs
         sTxw==
X-Forwarded-Encrypted: i=1; AL+hErFzY+6/8KSu+8SaklXVQ0ZavA72RK8mcff8eBzfIH+cP9cxV6eFloZMCErglN44Jcp6DrdfnKzJ8wqmVY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gBscplwKqaoAQ4nKQkuhw3ieDVNqEBBa4WXkocMk19y+vxVR1
	+TIfuTYyKw0MvjrnrFKKJd9eveL3cLr/QtbGccLWeZvx6ex1KZpdakmAQAdiLXLeGpQ2/Do/vID
	nGPutARLVsyLL5wm1d0YiiEPbMNSNvp4=
X-Gm-Gg: AYBFou2DthbL5rDgaz6KCIBzDkZ8hOn9H47Bmd5SAl8uAEUhedOJKzKkeQHMNuGn9Oi
	7ZLCLKlcTaOGMqHOZaaJXQ56UPzvQNKfS7ep7xUpDXBYLlDZZ2dLWbLpUOF099T6nc+YOkdOOCJ
	KFzt9sztFnMV2/I7UO3hH9qMNPCzv5w8C6/aOsLWMESHF8NjmiGWQIs+xEvGY0OqSHZHrt63kBM
	PY4277yUPBGLbU4CNppZRhtEYfm/9FRDjGdmLVLVaSJDEyyxoyaK1JlaGg1vRU4r3lqRMkZS71q
	WSaHOtWYOTYVoRmNs4mh1cSghVFwNOtfGDoR2+UaHOJAKpVwrnsWQHniT2/wU/pdxJPmI3EZzk8
	jlHQaozA0IZ5wzaZknotfLE9I49WOfxsUwmXYYzmytcr0RNRo5x1rPGGcBY3tOytoehS66FkA/I
	XLn8wtSvsgM2A3KG4gaAZX2MQu89Et8gMyNsN296IoQE8HeeueJB4f6TEhFY/1
X-Received: by 2002:a05:6808:3509:b0:55c:836:5992 with SMTP id
 5614622812f47-56e64df328emr7649759b6e.4.1794684643579; Sat, 14 Nov 2026
 11:30:43 -0800 (PST)
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
 <CADnq5_OrGuMJT4Tvt+wktPzTYEopdkCjyqq8sSdvJou40-HoKw@mail.gmail.com>
 <a6093dab-c38d-4dad-af3b-7173a6eaa78c@gmail.com> <CADnq5_MRA2bQG5x9xiGAT5ddh0jHMqg=u2OhCPvJxPr3ddTurA@mail.gmail.com>
 <b9f69d90-73ef-4a22-a347-0d70f014a7de@gmail.com> <CADnq5_PZ3B863S238TkrGSubWa_VExySu9pkh5xDfrST11y5GQ@mail.gmail.com>
 <5c3aeee1-1436-4b77-b742-ba916376b479@gmail.com>
In-Reply-To: <5c3aeee1-1436-4b77-b742-ba916376b479@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 14 Nov 2026 14:30:31 -0500
X-Gm-Features: AclHuK9Lt1BNNOh5THRY3gz36jwhtbUayWeg1u0J9Xol-AhZnO5UPrOXyZlFtp0
Message-ID: <CADnq5_NfuE_ck3VN7c6b0xgcKrYPonjPV9zdq50aMnVddm7Rxw@mail.gmail.com>
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

On Sat, Nov 14, 2026 at 9:18=E2=80=AFAM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> On 13/11/2026 14:05, Alex Deucher wrote:
> > On Thu, Nov 12, 2026 at 7:15=E2=80=AFPM Richard Lane <richardlanedev@gm=
ail.com> wrote:
> >>
> >> On 10/11/2026 19:59, Alex Deucher wrote:
> >>> On Tue, Nov 10, 2026 at 1:49=E2=80=AFPM Richard Lane <richardlanedev@=
gmail.com> wrote:
> >>>>
> >>>> On 09/11/2026 20:34, Alex Deucher wrote:
> >>>>> On Mon, Nov 2, 2026 at 3:31=E2=80=AFAM Richard Lane <richardlanedev=
@gmail.com> wrote:
> >>>>>>
> >>>>>> When driving multiple displays or tiled panels with identical timi=
ngs
> >>>>>> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Displ=
ay
> >>>>>> Core's program_timing_sync() aligns the CRTCs into a timing sync g=
roup
> >>>>>> in hardware during dc_commit_streams().
> >>>>>>
> >>>>>> However, on DCE < 12, Display Core leaves
> >>>>>> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is no=
t
> >>>>>> informed that the streams have synchronized vertical blanking inte=
rvals,
> >>>>>> SMU7 prevents MCLK switching at idle or causes modeset underflows.
> >>>>>>
> >>>>>> If all active streams belong to the same timing sync group
> >>>>>> (timing_sync_info.group_size =3D=3D params.stream_count), report
> >>>>>> all_displays_in_sync =3D true to PowerPlay after committing the st=
reams so
> >>>>>> SMU7 can safely downclock MCLK at idle.
> >>>>>>
> >>>>>
> >>>>> Looking at this a little deeper, the function bw_calcs() in
> >>>>> dce_calcs.c already calculates all_displays_in_sync using the helpe=
r
> >>>>> all_displays_in_sync().  Can you look into this and figure out why
> >>>>> that is not working as expected?  My concern with this patch is tha=
t
> >>>>> DCE and DCN have different logic for handling mclk switching so I'm
> >>>>> not sure it's safe to call dm_pp_apply_display_requirements() direc=
tly
> >>>>> from common code.
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Alex
> >>>>
> >>>> Moving it to dce_clk_mgr.c and using resource_are_streams_timing_syn=
chronizable() also works. Is that a solution?
> >>>
> >>> I think that would be preferred, but in general, why doesn't the
> >>> current flow I described work?  The function bw_calcs() dce_calcs.c
> >>> already calculates the all_displays_in_sync flag using the helper
> >>> all_displays_in_sync().  Is all_displays_in_sync() not checking
> >>> something properly or is the overall call timing wrong such that
> >>> all_displays_in_sync() can't properly calculate whether all of the
> >>> displays are synced at the point that it gets called?
> >>>
> >>> Alex
> >>>
> >>
> >> I think this could be limited to DCE 6,8,10 rather than DCE < 12 as in=
 these
> >> cases DC uses dce100_validate_bandwdith() which doesn't call bw_calcs(=
) and
> >> dce_pplib_apply_display_requirements() in dce_clk_mgr.c so
> >> pp_display_cfg->all_displays_in_sync is unset.
> >
> > How about adding bw_calcs() to dce100_validate_bandwdith()?  Or if
> > there are issues there, just add the all_displays_in_sync() checks to
> > dce100_validate_bandwdith().
> >
> > Alex
> >
>
> bw_calcs() itself cannot be called in dce100_validate_bandwidth() because
> bw_calcs_init() only initializes dc->bw_dceip and dc->bw_vbios on DCE
> 11.0, 11.2, and 12.0.
>
> However, adding the all_displays_in_sync check directly to
> dce100_validate_bandwidth() (which is shared by DCE 6, 8, and 10) and
> copying context->bw_ctx.bw.dce.all_displays_in_sync to
> pp_display_cfg->all_displays_in_sync in
> dce_pplib_apply_display_requirements() works. Is this solution preferable=
?

Yes, this looks great.  Thanks for reworking it.

Alex

>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c =
b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> @@ -320,6 +320,9 @@ static void dce_pplib_apply_display_requirements(
>  {
>         struct dm_pp_display_configuration *pp_display_cfg =3D &context->=
pp_display_cfg;
>
> +       pp_display_cfg->all_displays_in_sync =3D
> +               context->bw_ctx.bw.dce.all_displays_in_sync;
> +
>         dce110_fill_display_configs(context, pp_display_cfg);
>
>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, si=
zeof(*pp_display_cfg)) !=3D  0)
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
> --- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
> @@ -692,6 +692,14 @@ enum dc_status dce100_validate_bandwidth(
>                 /* TODO implement when needed but for now hardcode max va=
lue*/
>                 context->bw_ctx.bw.dce.dispclk_khz =3D 681000;
>                 context->bw_ctx.bw.dce.yclk_khz =3D 250000 * MEMORY_TYPE_=
MULTIPLIER_CZ;
> +               context->bw_ctx.bw.dce.all_displays_in_sync =3D context->=
stream_count > 1;
> +               for (i =3D 1; i < context->stream_count; i++) {
> +                       if (!resource_are_streams_timing_synchronizable(
> +                                   context->streams[0], context->streams=
[i])) {
> +                               context->bw_ctx.bw.dce.all_displays_in_sy=
nc =3D false;
> +                               break;
> +                       }
> +               }
>         } else {
>                 /* On DCE 6.0 and 6.4 the PLL0 is both the display engine=
 clock and
>                  * the DP clock, and shouldn't be turned off. Just select=
 the display
> @@ -703,6 +711,7 @@ enum dc_status dce100_validate_bandwidth(
>                         context->bw_ctx.bw.dce.dispclk_khz =3D 0;
>
>                 context->bw_ctx.bw.dce.yclk_khz =3D 0;
> +               context->bw_ctx.bw.dce.all_displays_in_sync =3D false;
>         }
>
>         return DC_OK;
>
> Richard
>
> >>
> >> Richard
> >>
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_m=
gr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >>>> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >>>> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >>>> @@ -31,6 +31,7 @@
> >>>>  #include "dmcu.h"
> >>>>  #include "core_types.h"
> >>>>  #include "dal_asic_id.h"
> >>>> +#include "resource.h"
> >>>>
> >>>>  /*
> >>>>   * Currently the register shifts and masks in this file are used fo=
r dce100 and dce80
> >>>> @@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirement=
s(
> >>>>         struct dc_state *context)
> >>>>  {
> >>>>         struct dm_pp_display_configuration *pp_display_cfg =3D &cont=
ext->pp_display_cfg;
> >>>> +       int j;
> >>>>
> >>>>         dce110_fill_display_configs(context, pp_display_cfg);
> >>>> +       pp_display_cfg->all_displays_in_sync =3D pp_display_cfg->dis=
play_count > 1;
> >>>> +       for (j =3D 1; j < context->stream_count; j++) {
> >>>> +               if (!resource_are_streams_timing_synchronizable(
> >>>> +                           context->streams[0], context->streams[j]=
)) {
> >>>> +                       pp_display_cfg->all_displays_in_sync =3D fal=
se;
> >>>> +                       break;
> >>>> +               }
> >>>> +       }
> >>>>
> >>>>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cf=
g, sizeof(*pp_display_cfg)) !=3D  0)
> >>>>                 dm_pp_apply_display_requirements(dc->ctx, pp_display=
_cfg);
> >>>>
> >>>> Richard
> >>>>
> >>>>>
> >>>>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
> >>>>>>  1 file changed, 10 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> index 74cd88d8d580..b4531383437e 100644
> >>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct=
 drm_atomic_commit *state,
> >>>>>>         dc_exit_ips_for_hw_access(dm->dc);
> >>>>>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
> >>>>>>
> >>>>>> +       if (params.stream_count > 1 &&
> >>>>>> +           dm->dc->current_state->stream_status[0].timing_sync_in=
fo.group_size =3D=3D
> >>>>>> +           params.stream_count) {
> >>>>>> +               struct dm_pp_display_configuration *pp_cfg =3D
> >>>>>> +                       &dm->dc->current_state->pp_display_cfg;
> >>>>>> +
> >>>>>> +               pp_cfg->all_displays_in_sync =3D true;
> >>>>>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_c=
fg);
> >>>>>> +       }
> >>>>>> +
> >>>>>>         bool frl_stream_found =3D false;
> >>>>>>
> >>>>>>         for (i =3D 0; i < params.stream_count; i++) {
> >>>>>> --
> >>>>>> 2.55.0
> >>>>
> >>
>
