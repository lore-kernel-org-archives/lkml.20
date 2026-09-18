Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507551EDFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758937; cv=pass; b=IACt4wZ8sBa2MEmxqGemTPKGXfay8qdYiBsnj0jWOeMfDnBqeHWVyqU4dC3C0TUtqikOG1jasQpP6+l9m/AeLFfghOFuEy1pJAOdqvsstCGKr/2WFaDOf1HclccewRlDwTOWDUUwYJ5+BkO9YuHm5FhyunhkySkakU+RsiDDzX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758937; c=relaxed/simple;
	bh=3e3RY3lbBhkf/mAukhlB3Tbv7231HfcTwgEBDr4SmPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIZcT27+7dtpdM1r+etyOS+CMcUxc1fYsNnWlp+d4RkOfiL4KX6Ao/68N59f5IdKpmxNNEH/u6P4NEFptIUScmNMlIOD55qagCSGi43uPZbf9Y1HPv43Iq5+0oOb/Dduq/O9RACxVIdJQJDytjPLQkuq5PRp9h2VHpBqjI5GLR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGxLst3y; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGxLst3y"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso883740fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789758931; cv=none;
        d=google.com; s=arc-20260327;
        b=E54YJKnyLy3+qqPtQCy9OYJ4PuIv37N3K/VJbHRv0HJsxluGbFjEbigjlqOmBt2Iao
         a1VCfOXTRyb48tHdNO6udMk1F7NuXM20GIX6EQh+GISqydIGWw1eA0s5OalAIBmcWYhQ
         VTjGSPedlLHir28bRlx4jwxJW2k6OT14AaEWvAtprzWdsjklEsGwfJqmKcYSr2K6MFBS
         QTStxyJEbZ/Kb6E2CXCs3I6gXNJLTXrPiNpjddUlC27wFqAVbRHf26SNlw+seR+N9+kU
         ueaRjBwEp+JBX0/qV6nuvKuxPeaGK81FJRwqAEa2u+TGnz7ywRA2XHLYNDzlNfcWCqH4
         Yf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        fh=jQO6jYoWu01RU63uewN1tSQrwvAu73CBu/g8Wr01HQI=;
        b=moTZ3tRJIUakezyPibiAd88WAf49v8380kHb//ChLbt9whGh/7El2W1S+f8ty4X68G
         i+GJHoC05BdzMRFcqLrlJph7By9xn+3RmajFEZQR9w3/TyPQLbD3pGyC8s8X4IVoNgmv
         Y50gFNlzDLIH7qCE2FnHkrQbsQdOferHIMxGFo5NQueruKt9roPNshoQUR5Bux+lgXfq
         xyozV37oJkV3v9MrvkC+GWDfwTdKevSM9qVfmQiPRj8cZ6mK0MsFnz+eCXfTGqXJCVmF
         DAKJRy6NkrlSYQXJMdVO5YXzZwcyhjEjBOLLwhPJdlhO4YDnuk6kLTlEEZOFtZNeiSj1
         fFIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789758931; x=1790363731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        b=aGxLst3ygGZYJ59Q686MtfHfybZU9XyyLVCQbGT0R7vB50245qwqSxEvEg0plRcJQH
         X+SR8fB+WUXLsooUEBHEskFca5ukYw7vUqUfIqPgEqgmma3IOTajpGFbNUSOmElgIc3E
         p+0iTqr3ZvR7r1v8/v9qpNc8jpkzDbsYt2C2xmxvF2YXyjlTlV0/R2akIRA9+bJs6vd0
         a3sizYmzs+zr4kNaT1u6qOGkgAGv4NVN09Kk45NTGonfiAf0ys7fbz5xzHQQsU9W7xt0
         DIT6OGQwI0+sz1zdA73r/H3er0nU2vWJBjB39PmxtlcySGg8WBvIsI4v/HsoITesX4hk
         IoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758931; x=1790363731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        b=ZVqX5bNSOyDgTxA/I9HnxpZY19XrQlF3lrYzuibqmhwisXuL8RObF532TeQRG99Yh5
         0koKp3BZbSrZ5VHaCdvLXlczd5nanho0FKOoulM9RPfjiJOY166HrQkz7XL36kp22Nmo
         OJHwJx0E1odVeMEJUAmJ7beoUkjUei58jvkfIwglHKtE5pCmfN20QpzSewUGhQzHH6ww
         7Pxwd4A7Rm3P3+vZqIzWBpqIBQEXIVoO8HG8oMn+ivi1v+7MfUnP1JWj1m+X5b3LFD7g
         H8Jn2l8yuuAYODtUBdZFxBYKL8tK49mxuDZ22MaqhuIF/FN5OeNudQ3tvMA8y6qgmAZQ
         G8wA==
X-Forwarded-Encrypted: i=1; AKwUvBy4sxO593YTuPNPW18T34dbyZmc9tFqzKX4Zm5rXlmf68h6KMunebTezJm+lh78jpEM/fiuwemv4oGhriI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8givH5ulYPyGdlIbUnqiqYM9BBObvEf1uzl4WNyFYeRazjBaB
	woR8OEpxvLHRCsPgpnMHp9vJabSdm03BeB805le6isQZ8bwvbCXC+yVDuMCuNJMbZMe+Fws+C/Q
	MhT6QKno5A127dkelPCqOtvx+Wc+9NgI=
X-Gm-Gg: AYBFou1t4QAgRV0V0/UTAs/sx1iMAx49ILcDlyaoWM6wcWp9+r2SaQTVX+BoacDMEas
	2TuAhDNEl2zNIiOuRZQ4Gh+94Aygks8+p9XlXAO4iOJxaeXCp1+VG7BqustZYdF3nn3l+BUXKAz
	O6EE62D5OzYu1IH8Y4MRW4CqizQ3NRkf+++g4tZ00J7WzOYHsgEVT66/4RG/4AVA09qyp92p/mB
	ljywVgYCYmoHM3x2McvsMlMiOz78GxDECs7+3Gg/sg65Iv5Fmiix2ZBr472qzUcyG2VQK30qRnw
	soljS6tvAUrjA8Ivc0JJP6qRsJ1OMcfQJJXinpTU4+l+3LGJID0zk1szGrDIuVtSMSgNe+mT8O/
	/y/F3b9vdJB7jRz5PKk60iWhgzCOY3sGNiIPELix6JdSZi/w=
X-Received: by 2002:a05:6871:cfc6:10b0:487:958f:e35b with SMTP id
 586e51a60fabf-48795900e6amr1424971fac.34.1789758931211; Fri, 18 Sep 2026
 12:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
 <20260917215114.1136715-1-tano.dzhinski@gmail.com> <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
In-Reply-To: <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
From: tanodzh <tano.dzhinski@gmail.com>
Date: Fri, 18 Sep 2026 22:15:13 +0300
X-Gm-Features: AcwNN1WoeEiIJqasT-7K-vP0zJa-u7OJgPUeY7USwoX3XqPRXTuUa60V6-sDLws
Message-ID: <CAJhzm--KvAUbTxpMMmy_ye4mYfJOViHJ21SNONqdy_Ab55oXPA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
To: lyude@redhat.com
Cc: Danilo Krummrich <dakr@kernel.org>, Giuseppe Ranieri <giuseppe@ranieri.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds great! Thanks for the update.

=D0=9D=D0=B0 =D0=BF=D1=82, 18.09.2026=E2=80=AF=D0=B3. =D0=B2 21:21 <lyude@r=
edhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-fixes in just a moment, thank you!
>
> On Thu, 2026-09-17 at 21:51 +0000, Tano Dzhinski wrote:
> > From: Giuseppe Ranieri <giuseppe@ranieri.dev>
> >
> > nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> > straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> > no
> > hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> > configuration with -EINVAL, and nv50_hdmi_enable() returns before
> > hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
> >
> > The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> > that
> > HDMI audio silently stops working. Video is unaffected, and nothing
> > is
> > logged, which makes the failure hard to attribute.
> >
> > SCDC is optional, and the hdmi->scdc() call further down is already
> > guarded against a missing callback. Requesting it on a card that
> > cannot
> > do it need not invalidate the rest of the HDMI configuration, so drop
> > that term from the condition and let the existing guard skip SCDC
> > alone.
> >
> > Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> > method")
> > Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> > Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > ---
> > v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
> >     (he posted this fix to the nouveau list on 2026-01-17,
> >     https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
> >     review of v1. Added Co-authored-by and Tested-by.
> >     Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.
> >
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index 377d0e0cef84..9887b3898505 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> > *argv, u32 argc)
> >
> >       if (!ior->func->hdmi ||
> >           args->v0.max_ac_packet > 0x1f ||
> > -         args->v0.rekey > 0x7f ||
> > -         (args->v0.scdc && !ior->func->hdmi->scdc))
> > +         args->v0.rekey > 0x7f)
> >               return -EINVAL;
> >
> >       if (!args->v0.enable) {
>
