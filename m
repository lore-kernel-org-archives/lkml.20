Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129F436BEA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805362; cv=pass; b=dnn3Fjn7iDB65BCplsU4W/QqPZk/KPz9kJwouuMDAM3bKtnP0HtbsD6JW9OmasdvGHjcPwuDGJIS6D1EZutwspzEtWqtd54ZUhIi6XwcG/0U+xyxtpb8NkGjsUYpoyQo+0VV1Zr/4IRYY4Jetlkqs1/Sozc0xwPOkr08MlTrkHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805362; c=relaxed/simple;
	bh=MUnFX2Kd1u1rl9k97vXohjbbROAqvzbf7iGpscvJBSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzpvljiCl7ugvrEQkpmDuxqoH/MkfkWw9FtfMo639EkmCXjvBvu83ME769WMs8FIfUn67+Vsr0XnuEK0GrCeP9/pYSkSg0bWyMJDrAyPn0DkUFRNfl7bqXsAt934MLRf2GSMJoRyA5vp4z6PPDfFUjkBk9EVFHto32Uww9uweQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5QJJULr; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5QJJULr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8aea7b7ca0cso10155167b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791805359; cv=none;
        d=google.com; s=arc-20260327;
        b=JyXv5ed5NZTgXnuLZMqhvpTkJh95UdocrCFbYCIBqtIID+wYsw2FT/jM0Gas1Ml3ZO
         ZxNqg7gHVUsHuhfpsCrKSA1kl86U+1MM0izN35aDP6TcNBeU0j7S70nQrAc91dNPjs/u
         miQ+9R1WW8gtJz7chFUh7EHGnIR+hgReoh4hjv649C2YdSG+qGbu1mKreEqetPMacyo7
         zGTQDSfv3OEYVUsy5ktTwrLwUMfhIxSr4G5ZDHL4kylkxIun55Cv8wa1ryUnr0HGD6+5
         2YHKjDCpx+gLJLnCnh2c7t7bM2HxVUyMNRYLO2ZmIEIXz+jseqShtquKtNc5Ezkt5FrA
         tLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        fh=qjmRrnEnYcpHdufdKtAtpztGd9U/K2wJibJNCk8i+Ss=;
        b=jXXJ5S+Kl7wimNlNxiSXDTrI0r4h+yEb+EHxv4wxtTDs+qIgdSRQ3fCk4JwhZRIKY5
         nrQp595yFKwTcX5OaIRTqMTnb4/FbuAAuBJFYej67nudh6JIm+JM/h7HWo6ipcHVBLND
         xHuBY5Si2Ia792VQfas1IaEl6RsD2czdqhAEh4OnIwoumh7lNGdYYXjsraBfWZs8qwmN
         3g6dzN0lOGFDBMonYwStQcQHg/sGWkGhUzowTXPt+PSwciaFEbt3FI1JW9saa6w6vrgp
         iYfYd2s6j9gFnLOUm0wwbc3aCrCjsGTGAm+bC2kVrhZRZGaHpUUGvLmQS9gQK/jrzXy5
         VHTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805359; x=1792410159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        b=X5QJJULrjazAsdMtm7cJzxxp8E6B+WP7WulwX1InHnxqZQyY/tYjOrrHMiHw6dxkqC
         rAiL8pKCHaUJJE+9E9QRHFGMhC2ya0EMLV/ZoC8StPTW6W/rlq/4dV+lq1catT6ihhxG
         UhaRIAH0KeGlsINu209bsPYdaBjp4yOMK0Ov3AZ5E5P2yotl3t1nGtmjlIrAL3fn2Qb5
         c9+vKgoVDCLDiPU4tz8GWR2Qh/vRmMphLkyKhHDnRE8vIFgsOvV+gOivqfHoX710K/dy
         5VeidBwuugVR+8oi6BLDQaq+664Grqntei13z4UWTC0P4Sa45nuB/a0uMeKfKK93gozS
         1r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805359; x=1792410159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        b=e8mfIoBTbexk52u5LvgDBYbLGszgUnQnPOlcIxYT4qqutIMPbBwKI9+o7y5IVj+iKm
         KaX17y3iGvCwX37TMn4+vqk/GCtuoTFOLXYAg0qdxpdattOkaveQUxCMedBY2dHJZFTg
         DHBghTB81Ne+nBK/JOVWjlB9ALZlqR8xzLnXngtz8XtS9YwFozZtJnrKluN75uHNrPYZ
         zEely+POQ54/i75gPS8u+wTaczsAXKUQOzEJM50DTzXamIhW1jUGZ5cSPN5TTMdYVPAO
         lXm6cK/bLlWF2Ff0dthLQNsJBkN8og65uijW0gpque+NUxZSal6szOguHbCEAW4lNXRN
         x0Qw==
X-Forwarded-Encrypted: i=1; AKwUvByYIRx2Mtn9CudDPALI01W99Ejq4lF5I7h6u+88LEZggATu2upMN1j11EJP8tU7vqtUOMfZa/8fat4IZ/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm2jSka2bZbx5dgj3ImuMyxEWUV4qx7WUnhmkNJCFfBIlPhxUZ
	Z2bXhv9N4d6dyv74YlqIjeadAiObQIWx8vASHHM+ZjH1HmnHuh1gf6INxQmHR/r2MMzHXWPvhL9
	T7fXo5bk35xNoFQdO/Vg5ehwe0okkDng=
X-Gm-Gg: AYBFou1MAxtpYs1OxlXT5E2Llhh8RcOWTy9ti0MS7fSW6p3AHtVuLdFtbpTL2k3TOM3
	G0905hNDXTBnQOHaMjXm3ZgW5GN5FOrUwkYNyy44hjQV/DV9J+YAUQXohVQRJUrk1/khS7clb0+
	0SrGwgM10nvEofDQbrNRhNVDjgB/27eBe8GVpSVKCJ4+ZmatY3jP4jQUalJFjoSt6qBdxUvOHS/
	3ec6sen3yA2RuYTBXMV5G7e4A6S0nnD8CsAWPD2EcLT7sHxR0jB1lLay2XPI1Tu/oC8W9ZG3Geq
	4SxkyX+kInX1UQ9Fi3wTekawznNKP2dXlt0VG+iZfAMZ7JbGnSpgtyv3eTDWB50EQMhL1XqnIrb
	+Pgf3FWvJtVfaU1UsY8xp
X-Received: by 2002:a05:690c:1d:b0:8b0:8a9c:fac1 with SMTP id
 00721157ae682-8b08a9d034bmr20413527b3.21.1791805358689; Mon, 12 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010180711.1548333-1-ju.orth@gmail.com> <20261010180711.1548333-3-ju.orth@gmail.com>
 <f70c39c0-3754-4a18-8ad9-eaaf8a307b8f@amd.com>
In-Reply-To: <f70c39c0-3754-4a18-8ad9-eaaf8a307b8f@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 12 Oct 2026 13:42:27 +0200
X-Gm-Features: AclHuK9UY_9BF00vKMnCcUp0DHYkFhZbh5NYROup1fNDrn0hsAfYgZ-u9GoRjDM
Message-ID: <CAHijbEV=510kPTYit=EbXtsYosQ+WOJ58Ey1AqK1Ca7Wb77bCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/syncobj: flatten chains when importing sync_file
 into timeline point
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:51=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 10/10/26 20:07, Julian Orth wrote:
> > A sync_file exported from a timeline point can contain a dma_fence_chai=
n.
>
> No it can't, IIRC sync files are only supposed to contain raw fences or d=
ma_fence_array containers.
>
> I think we never documented that and that's why this issue here leaked in=
.

When I reviewed this patch before sending it in, I asked the AI if it
would not be better to do the merging at export time. It was adamant
that it had to be at import time because of commit 519f490d by
yourself:

    dma-buf/sync-file: fix warning about fence containers

    The dma_fence_chain containers can show up in sync_files as well

>
> I'm not sure if that doesn't break anywhere else as well, so I think we s=
hould fix the exporting side instead.
>
> Alternatively we need to audit everywhere where fences from syncfiles can=
 be imported somewhere else.
>
> Regards,
> Christian.
>
> > Importing such a sync_file into a timeline point with
> > DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE |
> > DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE passes the chain directly to
> > dma_fence_chain_init() and triggers
> >
> >   WARNING: drivers/dma-buf/dma-fence-chain.c:286 at dma_fence_chain_ini=
t
> >
> > because chain fences must not be wrapped in other chain fences.
> >
> > Flatten the fence with dma_fence_unwrap_merge() before adding it to the
> > timeline, as drm_syncobj_transfer_to_timeline() already does.
> >
> > Reproducer:
> >
> > 1. Export a sync_file from a point > 0 of a timeline syncobj with
> >    DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD.
> > 2. Import it into a point > 0 of another timeline syncobj with
> >    DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE.
> >
> > Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline=
 syncobjs")
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 5ca5163d0..c545af77e 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -742,8 +742,18 @@ static int drm_syncobj_import_sync_file_fence(stru=
ct drm_file *file_private,
> >       }
> >
> >       if (point) {
> > -             struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> > +             struct dma_fence_chain *chain;
> > +             struct dma_fence *tmp;
> > +
> > +             tmp =3D dma_fence_unwrap_merge(fence);
> > +             dma_fence_put(fence);
> > +             fence =3D tmp;
> > +             if (!fence) {
> > +                     drm_syncobj_put(syncobj);
> > +                     return -ENOMEM;
> > +             }
> >
> > +             chain =3D dma_fence_chain_alloc();
> >               if (!chain) {
> >                       ret =3D -ENOMEM;
> >                       goto out;
>
