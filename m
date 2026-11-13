Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794578723;
	b=uLFPnrltcOpahFAbo0yw283UWKXXeeOtVnOq1Nv3ET1gMNtlcKrk2eMhx9XnfgXPk1RD
	 SOk2DrUGMvD1rplbjHt8rE4MizW4o8YM+0wpOvkbv7lkgJ07h6Zj/SzMrw5nv97JeiRcF
	 CT6yLf191n3c5mRszWIwQL5fFRAy2QwhUWzjr1m5tczWSiXrRTl9JAH0wcLmSDgKSR7wV
	 nq84F4MjYSCbDBLXTlrERtNyKK3x1uhxKnix2yOC2+ILqoPqTB9xD0RU9khfSlXV5F1TX
	 5RdW0GeMtx2IsD+0XML6LYug8ngd0kbKjA/ODNMNGikVBl5Xp8InGp6YPFzJ799UQYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DNr5TSnyeXCioTMiWAjRgZq6UDA4HuekgOMRX+0ndmc=;
	b=FVKzJZTYtmfMQ3g667DiGF+KKptIxh0FdpfsCfpWE8PLmy9T3vTeXApTnFnrr2yymdsj
	 Jzj41lxPElOR7KbNnWyyRmDbgtBwcikf1k0oxCIGzNTM1Lvic/LqMTwkuXM/HGQ8CM2DG
	 V274wA2onDC6zrmi5DirHXD8uHKFljqx0aYKTBQ6arcCsQXDXHxI/4gJ1vLvILhrv7PMY
	 lh+dKNf7od8ezeriMHMY1uHnNX85SGaZM/TA8LJqSxqdjgxFjrj2noP9GqtB7Uv7uZlz0
	 hLCS3lPJmGRWISwxKkqABpojRd2lgAphoJ4kGKp6PMcwYYSrqteE81HjknWLjdr7UTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ow2ifrnm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88458606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88458606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ow2ifrnm
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cd28978b8so18791466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794578722; cv=none;
        d=google.com; s=arc-20260327;
        b=qjJ2N7sUEaa7r1SUcQj7RTuaakT5+GSaonzqE7lI2619ezgfszg83LLqbtmvjvftaT
         nw3DUkAVLldYJOTCsHmQBwlXJ3md71hb/NlO9qd62kerT1pwk1iB2EhvwuOORTcTd88a
         hi/EHknQVJazTP3+Nq542rul+SE0q0habhbBlmw/UqCpnBgzDODeH6ttnpYBOiksT0lP
         imtVtQPeOrgwbNNf3QyUF4PUAQja97oxOaszJvozkhkqtI5jKHPVpP5Z2rbjehQwiH/5
         07mhuNR5knuSQFdeaxG078SM8PUHq4M+M86Isy0sZcu63eghl/hur9gwD3hoMIksDj2V
         IH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DNr5TSnyeXCioTMiWAjRgZq6UDA4HuekgOMRX+0ndmc=;
        fh=gl+OLRR/i8GJb/9SRFHaJAhsxb1FiRymzij9vfEf7vI=;
        b=rV7dlw8Cir/v5XPT2DWdjLsNxQc/m9a/b5M8kZpWGYEnNbjXSNPnKxiZqB1YNjBJVQ
         wA54DNn9GafzwW+JEE3OZFmOnEoc3X8HYsH12BDxJMM4ZQ8Wuqetmu6i8XrVMR9/FpGG
         IJFo3WlO4Hl53p7owiT9IZ4zxIr6+oPvjpY3raFbNsig9OhkNd9FFliP0WBwXXdyUESJ
         g2MXREUG/dpcEWtR13HGxPDaLKv5uOEQayxCqf5N99tWy1vC/mTeaf4uxBRa0H5sfcAq
         ieZ02MpLZihgR1dFwO6OfyK/3Lw6HM/Tzcf3uy9gDhoSAqFK2VducIR1CvbKbwselkHT
         oZ7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794578722; x=1795183522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNr5TSnyeXCioTMiWAjRgZq6UDA4HuekgOMRX+0ndmc=;
        b=Ow2ifrnmR0QXxZPsdFnCW9MkLp03O4yDotjlrm0q/8LFMQ1D3qyR0P9KYOGj2M127O
         qXfQDUQq4bq8QuddTIQmnKfRP2fVs6aYNXUbile9TnssjXskUQpLTQLtZ4Eze2AVSgVj
         0tCub0H8n++kLqnVSiRbhYZwDimdp4zOXkox+40r8DC7U2tpiC4WXvUsqhxSaTFXyOnz
         WOuoflvEq5+VNFYaT/40Mhzxt4Tn0/VMs200/7g56W3kYv595FA/XqQdtp4+PmAJ/gZC
         mWOtX0u91pHOvTGI1n9JpHQ2vr1rfZoI3NikSP4y9Nb1l5Y0YKJRwgmRUyiblHYwS6bq
         6VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578722; x=1795183522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNr5TSnyeXCioTMiWAjRgZq6UDA4HuekgOMRX+0ndmc=;
        b=NWGJcejDUvXKhIGWlKrtXT/GBmIvo8XPeuupP1Wfe/xzMdeIQ9d+pOhOpdzmK3v8bu
         mkb4Zkd5IxJnLZbFevHqfk6GtncqPGItskGk78tRrnY143QH4CHkznF37a6XvC16uuhF
         4FkzYo3oAioOormaKqix+/c23a8y6lHcYhRaAio9MXeAJcaxfG5D3PUp3Nb5O7fxyGHr
         IjnHOAHqQc6fo7sY0K8txFgxx37fMBbJBnkc9YF8pjhZ/31gpLNpKf3+sNprlmJF38Xa
         cllR38vD82kTpVnvdlI2ncJlFjI1IB/TzjAhNhXfulpy8moH9C/Mm2RS17AFCiq+qaSs
         heTA==
X-Forwarded-Encrypted: i=1; AL+hErGu6ZcdPt+m+8iW9DWs9yll4fRBisiVsLvWuqUt9YdaVg3Mi4QrK3/QvrjkHxvjActeQD9WtqgLQWfi75g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lO3nCGwM5NK5dEv4IK7++I9KG+uX1LOw+JiNxgWTVFW7Ml9BQ
	8mGWghZmqRdgjW6p0PmEA3cFGA7xaw+hJBezw6iqV8GVB9AGHBd5PHWtCQ7Q7r2kZHgn3n/7Rle
	biQl6joCmr8nY4MkrZ+qrUoQpEHZvuEg=
X-Gm-Gg: AYBFou2vIIbhNsJt5TDYyuRQXi9T1/vjDxhyBOr7/cpvLFVscDPtuPAGDRueg/PYnVE
	O+V16ZQtHaEL/2i3t4wEXYlHveEokJSMV7QPUwSNGgN5PFKvnodCRq3glq2KugHJZXM2Bt7Wd3I
	i6xbfXNSDDhPQ7O53atJiL6k/N1dR/rtX8XWE2PAYZep1PbVDcW/dVAu3eqTEdgP8b4vyvDgUGY
	XjR0WrpsIDNY8Q/BuXEPrQkEBmbsttZNe6CuynQWmp/mQ4cu3vNsX2VGL/rWxJFwFOaBrkB2lVb
	BEoQHbPKCns3oeHi1wvm6p68uHK/WRLGAjpqBQtKcsANZUE0om6+Z0ZLvkb9yMGDfsX4cMoB5RR
	CQVq4lk/TrjWXmvu9fgL4LGMqdnjP5wOhfJGPiEDZEZM7o3AWYlzr3g4K15W6WV0GUrJUuMeKED
	/ZRgv7mWAfgplMy3c40ZTko3l0URIMR5l68wDVhnPDD4VI2JHm0KfNeRwDLjc=
X-Received: by 2002:a17:906:f183:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c509642ceeamr231259866b.4.1794578721566; Fri, 13 Nov 2026
 06:05:21 -0800 (PST)
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
 <b9f69d90-73ef-4a22-a347-0d70f014a7de@gmail.com>
In-Reply-To: <b9f69d90-73ef-4a22-a347-0d70f014a7de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2026 09:05:03 -0500
X-Gm-Features: AclHuK-JbGhOW0X8f8QmVd6MttZ4a5YiYIvDhIqm2gvUw0T3yQw5z9xjNDXU7XI
Message-ID: <CADnq5_PZ3B863S238TkrGSubWa_VExySu9pkh5xDfrST11y5GQ@mail.gmail.com>
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

On Thu, Nov 12, 2026 at 7:15=E2=80=AFPM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> On 10/11/2026 19:59, Alex Deucher wrote:
> > On Tue, Nov 10, 2026 at 1:49=E2=80=AFPM Richard Lane <richardlanedev@gm=
ail.com> wrote:
> >>
> >> On 09/11/2026 20:34, Alex Deucher wrote:
> >>> On Mon, Nov 2, 2026 at 3:31=E2=80=AFAM Richard Lane <richardlanedev@g=
mail.com> wrote:
> >>>>
> >>>> When driving multiple displays or tiled panels with identical timing=
s
> >>>> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
> >>>> Core's program_timing_sync() aligns the CRTCs into a timing sync gro=
up
> >>>> in hardware during dc_commit_streams().
> >>>>
> >>>> However, on DCE < 12, Display Core leaves
> >>>> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
> >>>> informed that the streams have synchronized vertical blanking interv=
als,
> >>>> SMU7 prevents MCLK switching at idle or causes modeset underflows.
> >>>>
> >>>> If all active streams belong to the same timing sync group
> >>>> (timing_sync_info.group_size =3D=3D params.stream_count), report
> >>>> all_displays_in_sync =3D true to PowerPlay after committing the stre=
ams so
> >>>> SMU7 can safely downclock MCLK at idle.
> >>>>
> >>>
> >>> Looking at this a little deeper, the function bw_calcs() in
> >>> dce_calcs.c already calculates all_displays_in_sync using the helper
> >>> all_displays_in_sync().  Can you look into this and figure out why
> >>> that is not working as expected?  My concern with this patch is that
> >>> DCE and DCN have different logic for handling mclk switching so I'm
> >>> not sure it's safe to call dm_pp_apply_display_requirements() directl=
y
> >>> from common code.
> >>>
> >>> Thanks,
> >>>
> >>> Alex
> >>
> >> Moving it to dce_clk_mgr.c and using resource_are_streams_timing_synch=
ronizable() also works. Is that a solution?
> >
> > I think that would be preferred, but in general, why doesn't the
> > current flow I described work?  The function bw_calcs() dce_calcs.c
> > already calculates the all_displays_in_sync flag using the helper
> > all_displays_in_sync().  Is all_displays_in_sync() not checking
> > something properly or is the overall call timing wrong such that
> > all_displays_in_sync() can't properly calculate whether all of the
> > displays are synced at the point that it gets called?
> >
> > Alex
> >
>
> I think this could be limited to DCE 6,8,10 rather than DCE < 12 as in th=
ese
> cases DC uses dce100_validate_bandwdith() which doesn't call bw_calcs() a=
nd
> dce_pplib_apply_display_requirements() in dce_clk_mgr.c so
> pp_display_cfg->all_displays_in_sync is unset.

How about adding bw_calcs() to dce100_validate_bandwdith()?  Or if
there are issues there, just add the all_displays_in_sync() checks to
dce100_validate_bandwdith().

Alex

>
> Richard
>
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr=
.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> >> @@ -31,6 +31,7 @@
> >>  #include "dmcu.h"
> >>  #include "core_types.h"
> >>  #include "dal_asic_id.h"
> >> +#include "resource.h"
> >>
> >>  /*
> >>   * Currently the register shifts and masks in this file are used for =
dce100 and dce80
> >> @@ -319,8 +320,17 @@ static void dce_pplib_apply_display_requirements(
> >>         struct dc_state *context)
> >>  {
> >>         struct dm_pp_display_configuration *pp_display_cfg =3D &contex=
t->pp_display_cfg;
> >> +       int j;
> >>
> >>         dce110_fill_display_configs(context, pp_display_cfg);
> >> +       pp_display_cfg->all_displays_in_sync =3D pp_display_cfg->displ=
ay_count > 1;
> >> +       for (j =3D 1; j < context->stream_count; j++) {
> >> +               if (!resource_are_streams_timing_synchronizable(
> >> +                           context->streams[0], context->streams[j]))=
 {
> >> +                       pp_display_cfg->all_displays_in_sync =3D false=
;
> >> +                       break;
> >> +               }
> >> +       }
> >>
> >>         if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg,=
 sizeof(*pp_display_cfg)) !=3D  0)
> >>                 dm_pp_apply_display_requirements(dc->ctx, pp_display_c=
fg);
> >>
> >> Richard
> >>
> >>>
> >>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >>>> ---
> >>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
> >>>>  1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> index 74cd88d8d580..b4531383437e 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct d=
rm_atomic_commit *state,
> >>>>         dc_exit_ips_for_hw_access(dm->dc);
> >>>>         WARN_ON(!dc_commit_streams(dm->dc, &params));
> >>>>
> >>>> +       if (params.stream_count > 1 &&
> >>>> +           dm->dc->current_state->stream_status[0].timing_sync_info=
.group_size =3D=3D
> >>>> +           params.stream_count) {
> >>>> +               struct dm_pp_display_configuration *pp_cfg =3D
> >>>> +                       &dm->dc->current_state->pp_display_cfg;
> >>>> +
> >>>> +               pp_cfg->all_displays_in_sync =3D true;
> >>>> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg=
);
> >>>> +       }
> >>>> +
> >>>>         bool frl_stream_found =3D false;
> >>>>
> >>>>         for (i =3D 0; i < params.stream_count; i++) {
> >>>> --
> >>>> 2.55.0
> >>
>
