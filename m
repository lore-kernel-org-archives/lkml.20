Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FC1F938
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899610; cv=pass; b=pAueHCq3RVfeUoUkxiQ/jxIG4YJDIfcClhmnnyHHe220wcBqGUCok1yEHQ21+eqVfk1dBeLtvEH+yNL5ea/Z9W4MaHo+JJS90xeGzwnKrR4rSHVg2B0oW0AXhEGVg6bh2BSDvZ9YDhjSc4dFUnWll334+4zzlEli5U4ngFiImUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899610; c=relaxed/simple;
	bh=BqtUlk8J1kz4Zk63VvtHnggJTSj80SlcKH/tkA5RpSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sb2fXkWiTj/KlObDRtze2VB3aAEZRiLVhq/ZxsiyyfUx0Cn31j/KLrs0KPU8B9SAoInR+HPNEoUpo7n7mQJqsqTdl9Vv9ydSHHml61dQgXv40fIiFziMDiKDsWzCbvK/ILXj+38JmgeLh/T9rD8KKt4wYfrtazslbbSCwjn8JNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSh18eHt; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSh18eHt"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso5562789c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790899608; cv=none;
        d=google.com; s=arc-20260327;
        b=IX8QoamIM4gkDguhvVIxOBc/iGxhd2ihyEGxG3AGQBpa5tODPeHrsm0G4RLreXEkOK
         4s92ZWrJaC6Hx5///TNY7Mv/D89m+6j8nrlEOmIaHL/0ZwHtXd5+jYSzWQOWqpcRDn9O
         UZCt2+2d0luj6rttFlvJiJDfcwxgJRiIy0DRAai3BKzHKwSWE8oF9+z72IVR0F7UNcw4
         +LGSR2oRhEPzRPXQG5jwkGUHbFXNIjz0bGnX9Ep649a4A+V0WmCP11J3aD3CAKez7QKO
         yhRYPsLywbSzBSPihf9pg+poa8SekQGYPXTpxW6ZFTQxehGOUcmHYICRIExBYQ2tUhP5
         WNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zGCTIMLzR0g5rrSlyGyDUUCtcO6sG738acE2Sfbugu4=;
        fh=KVUEUsd5JxrD2sVQ3j1SJM2wkvjrJ01c/eji1+li960=;
        b=agfJcy8GJPyG/TPIzgS5LRxLvnPcRUgbODLrKbWlJzCOTg9zrZVSyX8H/18ebFd9DT
         8Mwe/EXNrjLGmxL4PK766ohk5IhpQcD/XONcix5q0n736SuIMm1jD8w07gb8XC/bVpiB
         jq24KGqUp2qPE5JLpsiKpYdBBLGm2iztzR23ea2cUPFXaDbvlrVAzxqKc/qAsIafdnGw
         MvipGYzG6I7Vqu90y4XOjRIt1/BbD9SyAxFtdG1shca4F0CER5RcEyl6PkHutSRgdvbR
         inZQy07Zw6826l/xjLHEy83bL/qg35b7IbgvaDcuBINCWgEMCHttjDqadTZUiIcCbLm0
         ch/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790899608; x=1791504408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGCTIMLzR0g5rrSlyGyDUUCtcO6sG738acE2Sfbugu4=;
        b=BSh18eHthaNFNrSytQcwTv5hoLiV/T5j3IShzXdp5ojtCXdgqP/usdQ7tKZxzoEZHy
         pLQixhj6JfYpjy+FAkrqSsxWgxPXxtE0i9yRrREvfoIAKIwc3odJUWzfLPzrwnvPGdKK
         33MJ7QRN4biq4T1DtFmgpNTfGM275/WffQUG/G9/c0XDhGY3eKp5s2mI7ZZrKRo0zjyp
         z42vDlQpeUoWV8FvtapgcRApSs4ThjKbjcqLcEr1zO/uDsywZ8QO9UG6XVb1coRFBMnN
         l+Ii1zEDXqmn27sjaLHpFPUhqFrrWIij2DmP5z8oNZTTbyXCmJbMOr4UmnVpkhEhi3V+
         Ba5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899608; x=1791504408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGCTIMLzR0g5rrSlyGyDUUCtcO6sG738acE2Sfbugu4=;
        b=dICfmJmH0kRm6dCXJDarbrqQa4GdJAnpfuXagC8Lsyet4qQb91VPQc/Q1zW8K9scXb
         6vdOYIx6Z+AFuUjsvKrSngtsl9SpwUoKk8t6WTSXmyjVLbV9ssCI26f2q7gD0uyoT41T
         J4Izs0b4ZdwoyxbiExxuBYCxn8iGJPQZuCihEpu4t0drCUStyTebMYEzHQMmtHC1vIGP
         G+GxZlW+txTf0Aw5Q+IdF1Z9bENnU0hUv3/JLV+CjFEHBuKnhGfI65qcQ6mK89Osxe1u
         hVAVT3nO84zt4Jdf7AunO7vdlBYK4LJ9atl19uZs3GSk8KB5+aiDFkcz8NLLaKWM9+nL
         bFCw==
X-Forwarded-Encrypted: i=1; AKwUvBwDGZuFg1bDZPqnGb630Tyf1IftgEA90yJKF3zn986TbKph61eB0os1HNFz8H9dvdo/wTaT3xLot7VCtpY=@vger.kernel.org
X-Gm-Message-State: AFuF++nPQW3jNNTGb5EXhTKc31neqHucKt3XJC/GJJCzD0Vwxm7uROAn
	zOsa8K/boIY3Eb/XSaHN3xUSbBxS09Ej/bVq2SG9Fx0u3gM9oCKzicw5BorKO73FOqarCHSXMn7
	dogzUv0gx3S4DuOcHmk8KFLM0pZlSD/UQxnTm6xM=
X-Gm-Gg: AYBFou2vw9Lpa3Pdu6g3NvtHMCddCXN+vNB0yV6SACw74a+//8+obzz6YWafS1Sxwrj
	V1vp1o9As7qlXEENFVWY8ttX5IoJ/eetdEKc3bOosGSp1Ymm7icx0GM1TWLx+CbXCtzAZQLeWwN
	qBS8j670mWdkp9a2ht9TWLHdvoN/+WYPRzeEGyx1BuTvXE5xEgl+89oEB0tJhfrf39i0h+Jj8B+
	z//Q3XX/jHv9pVmPQEyoenmR+qcLXalUKaSo5qXKYxj58OIDeZaREslk5kMvUKplIcxbMyZ3JR3
	U/StOqllYlmOyw2RJP1zfuUUEHdw0TLIGVUa59yB8iPtu9WCEoKPiEjoZIKOn1OUF4PhhYhxmY4
	haZJebk62agQPZK7zSeeff8XKaw==
X-Received: by 2002:a05:701b:4306:10b0:147:cd15:3eb with SMTP id
 a92af1059eb24-14f58de57admr838109c88.6.1790899608169; Thu, 01 Oct 2026
 17:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-amd-mst-teardown-v1-1-16a39ebdd4de@gmail.com> <96bababa-cf6d-472b-85a1-bafeef5fc474@amd.com>
In-Reply-To: <96bababa-cf6d-472b-85a1-bafeef5fc474@amd.com>
From: David Medina <b2amedina@gmail.com>
Date: Thu, 1 Oct 2026 20:06:21 -0400
X-Gm-Features: AclHuK-IQKG-NwL8I-2Z8nKQLu2bpmDAnbsNCVPk6aX1ly4aCkJjWaj0KijyvMc
Message-ID: <CAGTy6n_XJ=-MucZko7JrEUCg9oQZBVKVvtPunb4i6RFKV4QhnA@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/amd/display: Disable CRTC on MST connector unregister
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harry,

Thanks for the feedback =E2=80=94 that's a fair point. Userspace does contr=
ol
enablement, and the driver force-disabling a CRTC from
early_unregister() is the wrong layer.

The symptom I'm chasing: with a Thunderbolt 3 dock driving an LG
Ultrawide, unplugging the dock unregisters the MST connector, but the
CRTC that was driving it keeps its MST encoder assignment. On re-plug a
new connector is created and the re-commit fails in
drm_atomic_helper_check_modeset() with an encoder conflict
(handle_conflicting_encoders), so the display stays dark until a full
modeset (e.g. a session restart) tears everything down.

So my real question is where this is supposed to be handled: is there
something the driver should do during connector unregister to release
the stale CRTC/encoder assignment, or is this expected to be resolved
by userspace on the hotplug uevent? If the latter, is the compositor at
fault for leaving the CRTC active?

I only proposed the early_unregister() approach because it was the
minimal thing that fixed the failure in testing =E2=80=94 not because I'm
confident it's correct. Happy to dig in whichever direction you point
me.

Thanks,
David

On Thu, Oct 1, 2026 at 9:54=E2=80=AFAM Harry Wentland <harry.wentland@amd.c=
om> wrote:
>
>
>
> On 2026-09-30 22:13, David Medina via B4 Relay wrote:
> > From: David Medina <b2amedina@gmail.com>
> >
> > amdgpu_dm_mst_connector_early_unregister() releases the connector's
> > sink but leaves the CRTC it was driving active and its MST encoder
> > assigned. Because the connector is unregistered in the same step,
> > userspace has no chance to disable the CRTC before it is gone. When the
>
> Why does userspace have no chance to disable the CRTC? It's the connector
> that goes away, not the CRTC.
>
> Userspace controls enablement. The kernel driver shouldn't disable someth=
ing
> proactively based on a hotplug.
>
> Harry
>
> > same display is re-plugged a new MST connector is created, and the
> > re-commit fails in drm_atomic_helper_check_modeset() because the stale
> > connector still owns the encoder (handle_conflicting_encoders), leaving
> > the display dark until a full modeset (e.g. a session restart) tears
> > everything down.
> >
> > Disable the CRTC from the driver when the connector is torn down, so th=
e
> > MST encoder is released and the DC stream dropped. Reuse the
> > drm_atomic_helper_disable_all() pattern: deactivate the CRTC, clear the
> > mode, and disconnect the connector.
> >
> > Reproduced 100% of the time by unplugging and re-plugging the Thunderbo=
lt
> > dock driving the LG ULTRAWIDE: on re-plug the display stays dark and
> > dmesg shows drm_atomic_helper_check_modeset() failing with an encoder
> > conflict (handle_conflicting_encoders). Verified over four unplug/replu=
g
> > cycles with this patch applied.
> >
> > I am not certain that forcing a modeset from early_unregister() is the
> > right approach, and the disable here is intentionally minimal: it
> > deactivates the CRTC and disconnects the connector but does not
> > add/detach the CRTC's affected planes the way
> > drm_atomic_helper_disable_all() does. The minimal version resolves the
> > failure in testing; I would welcome guidance on whether the full
> > affected-planes teardown (or a different location) is required.
> >
> > Fixes: a1b27e99229a ("drm/amd/display: Implement MST Aux device registr=
ation")
> > Signed-off-by: David Medina <b2amedina@gmail.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 53 ++++++++++++++=
++++++++
> >  1 file changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 045a7f88b754..24b146068739 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -29,6 +29,7 @@
> >  #include <drm/display/drm_dp_mst_helper.h>
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_atomic_uapi.h>
> >  #include <drm/drm_fixed.h>
> >  #include <drm/drm_edid.h>
> >  #include "dm_services.h"
> > @@ -227,6 +228,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm=
_connector *connector)
> >       struct amdgpu_dm_connector *root =3D aconnector->mst_root;
> >       struct dc_link *dc_link =3D aconnector->dc_link;
> >       struct dc_sink *dc_sink =3D aconnector->dc_sink;
> > +     struct drm_crtc *crtc =3D connector->state ? connector->state->cr=
tc : NULL;
> >
> >       drm_dp_mst_connector_early_unregister(connector, port);
> >
> > @@ -250,6 +252,57 @@ amdgpu_dm_mst_connector_early_unregister(struct dr=
m_connector *connector)
> >
> >       aconnector->mst_status =3D MST_STATUS_DEFAULT;
> >       drm_modeset_unlock(&root->mst_mgr.base.lock);
> > +
> > +     /*
> > +      * The connector is being removed from the MST topology. If a CRT=
C is
> > +      * still driving it, force a modeset that disables the CRTC so th=
at the
> > +      * MST encoder is released and the DC stream dropped. Otherwise, =
on a
> > +      * subsequent re-plug the stale CRTC/encoder assignment triggers =
an
> > +      * encoder conflict in drm_atomic_helper_check_modeset() and the =
display
> > +      * stays dark.
> > +      */
> > +     if (crtc) {
> > +             struct drm_atomic_commit *state;
> > +             struct drm_connector_state *conn_state;
> > +             struct drm_crtc_state *crtc_state;
> > +             struct drm_modeset_acquire_ctx ctx;
> > +             int ret;
> > +
> > +             drm_modeset_acquire_init(&ctx, 0);
> > +retry:
> > +             state =3D drm_atomic_commit_alloc(connector->dev);
> > +             if (!state)
> > +                     goto out;
> > +             state->acquire_ctx =3D &ctx;
> > +
> > +             crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > +             ret =3D PTR_ERR_OR_ZERO(crtc_state);
> > +             if (!ret)
> > +                     crtc_state->active =3D false;
> > +             if (!ret)
> > +                     ret =3D drm_atomic_set_mode_prop_for_crtc(crtc_st=
ate, NULL);
> > +             if (!ret) {
> > +                     conn_state =3D drm_atomic_get_connector_state(sta=
te, connector);
> > +                     ret =3D PTR_ERR_OR_ZERO(conn_state);
> > +             }
> > +             if (!ret)
> > +                     ret =3D drm_atomic_set_crtc_for_connector(conn_st=
ate, NULL);
> > +             if (!ret)
> > +                     ret =3D drm_atomic_commit(state);
> > +
> > +             drm_atomic_commit_put(state);
> > +             if (ret =3D=3D -EDEADLK) {
> > +                     drm_modeset_backoff(&ctx);
> > +                     goto retry;
> > +             }
> > +             if (ret)
> > +                     drm_err(connector->dev,
> > +                             "DM_MST: failed to disable CRTC for remov=
ed connector %s (%d)\n",
> > +                             connector->name, ret);
> > +out:
> > +             drm_modeset_drop_locks(&ctx);
> > +             drm_modeset_acquire_fini(&ctx);
> > +     }
> >  }
> >
> >  static const struct drm_connector_funcs dm_dp_mst_connector_funcs =3D =
{
> >
> > ---
> > base-commit: 551c722f40809618230001baccf219193e22fc5a
> > change-id: 20260930-amd-mst-teardown-cab8a3731596
> >
> > Best regards,
> > --
> > David Medina <b2amedina@gmail.com>
>


--=20
David Medina
14901 SW 87th Ave
Palmetto Bay, FL 33176
786-280-0880
