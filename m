Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25F3ACF00
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805153; cv=pass; b=EpXMt6ymc9m0vy9mXeWpGoTxK66HF8y1VzX7jIsKxIs80YWzcN1W5KVv+/7JhbO7dQfG6fCvTGvgJVU75psi905xLL0esHV9CsszIWdn5EbfV3HOJTiJRF6vNA0m6+bdyvEPLvBIetwZT+qDxTX7P4V1257v5NkRV3Xq0eg50Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805153; c=relaxed/simple;
	bh=gxd33QN0xWhYVmPss2FNJZFt4BJYVI0+VcxXiG0EsG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Borjd74WxPXPLfEvLZ1IhZL1btCZDOxoLN6wx/noTSFNQoWsDzrSvoSrwxGc6ztULq87qoorT1vQkM0MqpoCQvsHEHi4/esbdFqnJo5r1HoAhYcfM87ar1zU09BLMLrrKp7Lq7i4VpRCmfyCeYgjJTkXBfZpbYSEkz/9YGYfkQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I37E5cZx; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I37E5cZx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8a83d2706fdso11188317b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791805151; cv=none;
        d=google.com; s=arc-20260327;
        b=HO4wUbOTVzhIc35iqNhuuVbomIfLT6oH2Wu0p2rkMZP6L41JbGPqfDE2ynEm2CBvoV
         Yr8bCBXwaPcwAVdwu7wx39nHuTBXNPR0D0uiBdVIFJ7f/ks6BdGvp9WmbvCAu2ZHp+Bf
         mW9grCLJQ72r0O4C0sQNW2wLgBjz9NKU552DcbAvWr0O2JRKEE6CB/Xgvulgp6Ek96Ti
         GiL34Vcp5I5Ut2yEGFl7vWsVOQARjBxnofGpze645KprqqCCafm2VxE0qkIm68N2WC9H
         eD7CmRTjK6j9C3fcGZccoP1eL6xY2tq7xc2LH+vfFuS8AkdKYGa8cLb37/9G0e++mCiE
         ShbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        fh=aSxUc0P/GMqs62y4/txYB7c536KE9Hu/jjZ3WZReR40=;
        b=C4NIkivYonNLaCNSPHU/2hvf1I8IaP9zOvGe9L7hLZJ/F/BDOGhHWPDQZmf+DVwi0w
         vs4kNfwYrsTdmGEZKLMDuuJX/WokvbSOQ1YH9TVgOr2MXsOpqvdwnH2NyJa75ftTJPmQ
         C8DW7uy45WLLELIZDaLJD7UqRfUMN2wJ4ZraE1LYA/4HVl8qUJiKgBEy6Y+gT4inTje4
         fgxYNpFdaxT2UC0KXvwkde2mt05lTCm2sywSKmVQxASUWnVbrMv/ZfZp2wpKErm6Je1y
         KFCJ3SA2B9z/4B9XQ93h3h+NipzHM5c2I7h74PXu4apNoUCs/Ae76if5Ndvnxyv0AgKp
         Np4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805151; x=1792409951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        b=I37E5cZxhmYnkhCij+FTNDOVAp2TA8c4vhi63pbKHtCubBdMu8gtDstzFeJOlH9/q+
         DuFGfIUFGJ0ImybN2bF8+5zQoWW0AW8ri/ceKZwhA1av3iSWAObWF7B4H9JguA8hHmaB
         VpM1ak7RoPvl3uO2oor8J7ee9xZdYUO9V9NoZ+YDiSzLVxu4+oRKhajNXmUKskihO97W
         0a8mKGaW1C+xtZPdt2QxBy/FAT6kB/8AneWRtWw5qMeuazwkQZf53GbB+8NM2NLsUQLz
         7uL9LxCeK9y7adZQ0Bj8y9lp1HScw/aie9/WQ4ZQHmuaoTtBKCVSTYTrjzReO2PR3wXr
         hZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805151; x=1792409951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        b=m+GFMHfyx2rPSpFjGFnIW85a/VWu5e2VUqSn+WgCpc6PNhum4DO2/AFzEVBi17JSdr
         u0ntDiNkNAoFgfa4Habnh1zL1Gfx4JJk5Os/nCP4W06SmAi2pGXOUQQ31ykRpuTEj4yj
         ng4saCfcFSDJVlLQtit7klUY7DPXRNSPhQddmcr3ATA7Br+RKcmaFJBLJEW6j51UB4TO
         x1u6L1DE2gbAdtDzgCthIVdIGy1iwY0rescNEYigEDoczAIgFPZMVF/bx9XQRIknGFRe
         h1DdzPSMH+gbjc+rJ/feuPQU5DC+MGOY4ilSflx5wwsKrb3ioFhBXoT2rDTY3t1eKKNo
         H5YA==
X-Forwarded-Encrypted: i=1; AKwUvByt5zBCeGDQOHwhdTgNPzEYaSZQFcDQuscVyVZG1rND0AASM2LjIotoIO85qmMDn1wGQEQMbXWYrd1xio4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEswEMTZGqjRqhnfwqQ+dsluMvIEadHL4WOA4ToVaW/ABl444P
	tdyzAGeH+jt5X/1+EnRqaQ9wlOEYbL8Te4cV1wBZITfnOImfsP+W8dQuOdTthdeqKTBDRHFpCJV
	fftkzAEfMIvxOi69Rpc7NHIjcbbu/u1E=
X-Gm-Gg: AYBFou1VtKPBQiVjeix8KK84TGO89KCEfYqZWczww3PxTes7XuuXiugd7r+D9LgRoeN
	Ez0kbKjjNLoePYP6Ap/Y47nY8rk/tw2bWG5kSkJCYIM+MMwEtK0a/o3+AlLwo+H1orQCjIGdGP3
	ZFRBPFcPXptsi5Jt4ZLw52K9WPFLjA4WcuoGQ/Y+cvlXJvzjaTc/xLOxUl1ub6L98V1PnkAIjjs
	ODya73UaD+japJcqGV3ml5B6/luQaowI1unKzCRa82Oshgh1w5Ymjr7vIz2/K7G5jOlGKHJM5tA
	6zEoCozzEv5C6rfAbMsGdtCqN8IIN+fUWmCgvx7Cz0VShQM+J0oQbYiuKErrEPK54SkMPORF9UZ
	yzwftlBIQ/TTpDBxYSnpe
X-Received: by 2002:a05:690c:f08:b0:8a8:e0c7:dc3f with SMTP id
 00721157ae682-8b07edb5995mr31001627b3.18.1791805151356; Mon, 12 Oct 2026
 04:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010180711.1548333-1-ju.orth@gmail.com> <20261010180711.1548333-2-ju.orth@gmail.com>
 <49d4f34d-6d27-4a70-88ad-a5e939eef084@amd.com>
In-Reply-To: <49d4f34d-6d27-4a70-88ad-a5e939eef084@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 12 Oct 2026 13:38:59 +0200
X-Gm-Features: AclHuK_TvDl5T3sJwAa-8Y_DCBwlQE-ZZAXe0QSdCleHISQ5S_vtpBNdiV3KYsA
Message-ID: <CAHijbEWpH+0M=mU3GiQWNL8b+6uTd=dK59UM=ejtviHmiRFq2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/syncobj: fix fence and syncobj leak in drm_syncobj_import_sync_file_fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:45=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 10/10/26 20:07, Julian Orth wrote:
> > If dma_fence_chain_alloc() fails, the function returns -ENOMEM without
> > dropping the references to the imported fence and the syncobj.
> >
> > Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline=
 syncobjs")
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index c23a5de27..5ca5163d0 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -730,6 +730,7 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
> >  {
> >       struct dma_fence *fence =3D sync_file_get_fence(fd);
> >       struct drm_syncobj *syncobj;
> > +     int ret =3D 0;
>
> Please don't initialize return values on declaration that is often consid=
ered bad coding style.
>
> >
> >       if (!fence)
> >               return -EINVAL;
> > @@ -743,17 +744,20 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> >       if (point) {
>
> >               struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> >
> > -             if (!chain)
> > -                     return -ENOMEM;
> > +             if (!chain) {
> > +                     ret =3D -ENOMEM;
> > +                     goto out;
> > +             }
> >
> >               drm_syncobj_add_point(syncobj, chain, fence, point);
>
> Allocation and adding the point is intentionally separated so that dma_fe=
nce_chain_alloc() can be called before looking up the syncobj or previous f=
ence.
>
> I suggest to make use of that.

This is the fourth time that someone has tried to fix this trivial bug
for over a year. The previous 3 cases were:

https://lore.kernel.org/all/c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mo=
untain/
https://lore.kernel.org/all/20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.=
com/
https://lore.kernel.org/all/20260525025455.3887523-1-vulab@iscas.ac.cn/

The last of which didn't even receive a reply. And there have been
more cases in the past where I encountered a dri-devel-adjacent issue,
googled it, and found that patches had already been sent in years ago
to fix it, but were ignored.

Which is all to explain why I had all of the work for this series done by A=
I.

I heard some chatter about dri-devel adopting a gitlab-based workflow,
and I hope that works out and I didn't misunderstand. Because the
current system is clearly broken. Nobody keeps track of which bugs
have been reported, nobody triages existing bugs, nobody keeps track
of attempts to fix bugs. Which is how 3 people ended up doing repeat
work of discovering, analyzing, and fixing the same bug.

The same pattern applies to my patch two. I clearly don't know enough
about the (probably) undocumented semantics of where and when which
structure of fences can be used. Which is why I sent in a bug report
about this issue in May instead of trying to fix it on my own:
https://lore.kernel.org/all/CAHijbEUKuXNeSnT82P-ojOhzU5siNHjxUW+qEDOqx07Ys9=
m=3Dxw@mail.gmail.com/

I would have hoped that a bug report amounting to "this new feature
causes the kernel to spam dmesg at 60 fps" would get some attention.
But no. The only way to get this issue fixed seems to be me acting as
a meat proxy to fix an issue that I know very little about.

Thanks for reading my blog post.


>
> Regards,
> Christian.
>
> >       } else {
> >               drm_syncobj_replace_fence(syncobj, fence);
> >       }
> >
> > +out:
> >       dma_fence_put(fence);
> >       drm_syncobj_put(syncobj);
> > -     return 0;
> > +     return ret;
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>
