Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918EE31E858
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982251; cv=pass; b=XGslc9XQLo60tBbWcGpW70XpdaZKuqjvOzvppTRuST/POa4DRpV8ieDVTLEoReZ2hUoRUwk1EhjaWi5TslsaRceiOjF8ER04FdTXBOWoCvRGOzjeeuz9b9DnAEv5tggENjCXpIZC4j7l8+naAdlXU9m10ts1df62LC7gJGi/pW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982251; c=relaxed/simple;
	bh=gH5Xnr/Ldj23/a+28+Bm9mfPfQ5hD1V9V3qDcxbl8/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXv2eQwVIgc5Mhu2yBfQL9TyAGaSTpYHbuKDnhXqic8//iFD6C8MO4tU3/nesKkHoZ8pKoTCgE3g0oyFHO4qCiiPKYSanAD1AX52TpjGe0q2mbTdYgw7JVF35uy+XOAvaLdbiLx4yGGGwk5FaCWr6fhkOztXQf6l1tvMUpKktUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im; spf=pass smtp.mailfrom=nahida.im; dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b=cdNoC7hK; arc=pass smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nahida.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b="cdNoC7hK"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9178b9ca7e8so3871026d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790982248; cv=none;
        d=google.com; s=arc-20260327;
        b=U85EJOUX3856iLEXkQWsD9sM/wndBN8NqolJNz8rPTbEZFGxjE80RhN/GLHke23o2H
         MRrxZs7VO4QgdW46W41PeQPx4lEWa8f2ARQtBG9zMI2EZQvy+f7qouNwNsv4v3Uy8Mad
         YGD9ftPrTU+h/TTln7cM+k74mGKD4m2YV19V4hpcBKQoBJ0svdHIa969U0MEuUQe3FLt
         h70mYWPaDXe2iPLPW+A9XR8O+kaXzpsjdp9smicLfyAUrhsGC2FbsWYLaIuviOve4Bna
         AI4Oz+Wo8tXGZv+J/UHnnp4xnMeqaWPDkkeI43HEGVlwgLlUxOqFRhoFnSdL/a3xLN//
         VTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQtubQ2NhGnt/Pb37kg635DUUt17Ujk2Lk2dRGVHaKs=;
        fh=nHvqLztzj7dXZnMbXKCNgezLg8j6AR1mMmOetZoseTg=;
        b=LwKhSQJmUtUdz1gZRWD8GEbZ9ul2EpfGX/XXa5jYF1AKAAu7NsEQyvNVdLhnHxG22L
         RWoIhTUkO+eLQf0yGD9BlVLG8yI7pun/M9s3ibGYzc//fSbXZnKgep4RscWUtZVYcPq7
         ttH9fTw/pLcmzoX8gndqbCkuWvR/iG5ywxpPD6yVy2nz4VzohUGLSdN3gbw5cyPC6wtR
         DqjOemH9LcA7ipjBwIAW3IO0xevcfhga+wimyyh5v4VYgK6iJ4YAdDvYZiR0vpdVxqko
         PdZDOsKKU3LWhcO0a/TqGzzKIinZskmWzIhrDYdH5GdrEVfJ4aXL4iANs6Srp+pdm8Sn
         KQOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nahida.im; s=nahida; t=1790982248; x=1791587048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQtubQ2NhGnt/Pb37kg635DUUt17Ujk2Lk2dRGVHaKs=;
        b=cdNoC7hKTaUCK55xpzUS5HC7Tiullud9akrLXxfPuELnVAylMpl5fcoMH4I6VVQ/JZ
         GVqdSGiIGHEG7GZw4tESz9TRbFmH0n+LxUuQuJdxj281MMQr438I/EbaaEVtj7/CycyD
         2h5PeDmiLnczz/1OeqVnwG4pz+aiy34ou7GAIhNL9GaLNDCtHuprwmE+MA0Fl1C6/k+f
         s+bxrk4zoGe5CCG5MuI/ZDFCC6DXegVr7xFG7G2T5fXvu2OxwiAIWmezamTOKvGavj6/
         pYEGoX7nS4V9LpJ1tzo8HDY2x4qxDkx5t1wraiecHz7qfHi/zPGZzNyhDmEHdCy78iO4
         /YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982248; x=1791587048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQtubQ2NhGnt/Pb37kg635DUUt17Ujk2Lk2dRGVHaKs=;
        b=PMB8HuU0rF3IA1a8tQr00/9EpwiGeqNJaFIL8PEYTWKoLZ8Ic9lrT5nfdDj03hODE7
         Yjk1aAANqNx73j/efXaJfP9/HwTVUMTdmBJdq3nmr3VkeR4FngtzyarZ1gclsTs5ZRA2
         1HdZZKLKuV5HzgXtxgl9EdFAzrx04HKIzPt49OSBja4B3dmH+3uhwUchT7XGmrxscw6p
         K+rjzMHQflF7a+ZdTA69thREgk6n/VPxkeG82Cdps+pK59plOj3E+H5Ehhi52PcIhKNK
         R9nJvG8B7GJFivm8ujbRuOmsfJfq5lVD0CQbI9JGXK//U5ciHivDJM0BlxbniBTm7Wxo
         TTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK0K1J/1N2HB2t+D2YEaN7zOMr8cCO5y2OontYkUnDRS0n3HUM+IckNdefPr6i9RMT+T7eSSqIjKnjfts=@vger.kernel.org
X-Gm-Message-State: AFq9FYITQfFACM4BcHCty6/kCpdj3wJYDW80aVbAt9m4gEoJp6TEiFZD
	oxKVr5L44A/1LJOxT/f7PteeAWilrdfLuWQDZ+St/TvEP0Zxo1qQ4uUmZP5HKRD88LiE6rdK81p
	ltUFKMYLzKvBMrwjBBd0NDXdHArIV4vAsFPNi/gepz8I=
X-Gm-Gg: AYBFou1YoBxb8LbBstPlxt7gMdmT+xaCbeGERn5FgvN0/KJ+PodGJxsa8+dzppTB+4+
	1uW42UBx0Y1hcjNHrUG/kPuJGo6M70UsKiygg8Mb4a48HwJ7Sg4rkQAodmiZ9g8G4IcCzEvmZjI
	/vA2TIqxbV0j+I7r0Ky3hqt+1YilFr8MrUcUYHVTUk8phnHpa/YMSp5pHiWLqMoKdvacW5qYW5L
	BIhV8eFyjcPPHmrn3yWprIsc6T9OUuuLhhVQ2sNSjVuzUchsX/37LQawyJ7s7jBEmClHiAD4T2A
	e6xJX/lfpMTm/ZMGKYegt/cYXwz0SeH4gkjVBBiZzoPLgMZfiwpAdEX2cnK0YoIZsUA0ANjAvnN
	G83mnza4sAChy
X-Received: by 2002:a05:6214:20c7:b0:914:1807:dc70 with SMTP id
 6a1803df08f44-917c009e0b0mr95558236d6.13.1790982248209; Fri, 02 Oct 2026
 16:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002203140.121165-1-me@nahida.im> <20261002222021.149450-1-me@nahida.im>
 <c4da60aa-bbbb-4afa-bd86-6516d14f5809@redhat.com>
In-Reply-To: <c4da60aa-bbbb-4afa-bd86-6516d14f5809@redhat.com>
From: Nahida Buer <me@nahida.im>
Date: Sat, 3 Oct 2026 07:03:52 +0800
X-Gm-Features: AclHuK97182Dn1BYPQmtN3m8pINXQ6fE69KuYDiIokH1t0mLziTTHvfwDPWjgyc
Message-ID: <CAEEzyciisJgZgx4PZQbEEkUUKRMpiAsmmsW9JfQzwCCDx4xZKA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panic: allow overriding panic QR code URL
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

My motivation was slightly different from disabling the URL when the
configured endpoint is untrusted or unavailable. I wanted to keep the
URL QR mode while allowing the same kernel image to use a different
reporting endpoint depending on the deployment.

It also allows enabling the compressed URL mode without rebuilding the
kernel. With an empty CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL, the QR code
contains the raw kmsg. Supplying drm.panic_qr_url=3D at boot instead
switches it to the URL format, where the kmsg is compressed with zlib.

This could be useful for a distribution or a locally built kernel image
used on multiple systems: the image can keep a neutral/default
configuration, while individual systems can opt into a specific panic
report collector and compressed QR payload at boot time.

panic_screen=3Duser or panic_screen=3Dkmsg only disables the URL QR mode;
it does not provide a way to keep that mode while changing or enabling
the reporting endpoint.

The parameter is read-only after initialization, so it only selects the
endpoint at boot/module load time.

If keeping the URL fixed at build time is intentional policy for DRM
panic, though, I'm fine with dropping the patch.

Jocelyn Falempe <jfalempe@redhat.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=883=E6=
=97=A5=E5=91=A8=E5=85=AD 06:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/3/26 00:20, =E7=BA=B3=E8=A5=BF=E5=A6=B2 =C2=B7 Nahida wrote:
> > The base URL used for the panic QR code is currently fixed at build tim=
e
> > by CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL. Changing the panic report
> > endpoint therefore requires rebuilding the kernel.
> >
> > Add a drm.panic_qr_url module parameter to allow overriding the URL at
> > boot or module load time, while keeping the Kconfig value as the
> > default.
> >
> > Keep the parameter read-only after initialization so the panic path can
> > access it without additional synchronization.
> >
> > Expose the configured URL to the DRM panic helper through an internal
> > getter so the helper can use the runtime value when generating the QR
> > code.
>
> The code looks good, but I think it shouldn't be allowed to change this
> setting at boot time.
> You can already set the drm_panic screen to "user" or "kmsg" in the
> kernel command line if you don't trust the default URL, or if the URL is
> no more reachable.
> It introduces some complexity, and I don't really see the benefit.
>
> Best regards,
>
> --
>
> Jocelyn>
> > Assisted-by: LLM
> > Signed-off-by: =E7=BA=B3=E8=A5=BF=E5=A6=B2 =C2=B7 Nahida <me@nahida.im>
> > ---
> > v2:
> > - Grow the formatted URL buffer to accommodate the maximum 255-byte
> >    runtime base URL.
> > - Reject unexpectedly truncated formatted URLs.
> > - Test the maximum-length runtime URL.
> >
> > v1: https://lore.kernel.org/r/20261002203140.121165-1-me@nahida.im
> >
> > Tested on x86_64:
> > - Full modular build with DRM=3Dm and DRM_KMS_HELPER=3Dm.
> > - QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL=
.
> > - QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
> > - QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
> > - QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.
> > - QEMU/virtio-gpu runtime override with a 255-byte base URL.
> >
> >   drivers/gpu/drm/Kconfig              |  9 +++++----
> >   drivers/gpu/drm/drm_panic.c          |  9 +++++++++
> >   drivers/gpu/drm/drm_panic_helper.c   | 17 +++++++++++------
> >   drivers/gpu/drm/drm_panic_internal.h |  4 ++++
> >   4 files changed, 29 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 61111d50b..3d9d421f0 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -111,10 +111,11 @@ config DRM_PANIC_SCREEN_QR_CODE_URL
> >       string "Base URL of the QR code in the panic screen"
> >       depends on DRM_PANIC_SCREEN_QR_CODE
> >       help
> > -       This option sets the base URL to report the kernel panic. If it=
's set
> > -       the QR code will contain the URL and the kmsg compressed with z=
lib as
> > -       a URL parameter. If it's empty, the QR code will contain the km=
sg as
> > -       uncompressed text only.
> > +       This option sets the default base URL to report the kernel pani=
c. If
> > +       it's set the QR code will contain the URL and the kmsg compress=
ed with
> > +       zlib as a URL parameter. If it's empty, the QR code will contai=
n the
> > +       kmsg as uncompressed text only. It can be overridden with the
> > +       drm.panic_qr_url=3D<url> kernel parameter.
> >         There is a demo code in javascript, to decode and uncompress th=
e kmsg
> >         data from the URL parameter at https://github.com/kdj0c/panic_r=
eport
> >
> > diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> > index 9fe97c4ed..463544f71 100644
> > --- a/drivers/gpu/drm/drm_panic.c
> > +++ b/drivers/gpu/drm/drm_panic.c
> > @@ -49,6 +49,15 @@ MODULE_LICENSE("GPL");
> >   static uint panic_qr_version =3D CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
> >   module_param(panic_qr_version, uint, 0644);
> >   MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR =
code");
> > +static char panic_qr_url[256] =3D CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
> > +module_param_string(panic_qr_url, panic_qr_url, sizeof(panic_qr_url), =
0444);
> > +MODULE_PARM_DESC(panic_qr_url, "base URL of the QR code in the panic s=
creen");
> > +
> > +const char *drm_panic_get_qr_url(void)
> > +{
> > +     return panic_qr_url;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_panic_get_qr_url);
> >   #endif
> >
> >   static enum drm_panic_type drm_panic_type =3D -1;
> > diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_p=
anic_helper.c
> > index 8913c3d22..b0ea0b4e8 100644
> > --- a/drivers/gpu/drm/drm_panic_helper.c
> > +++ b/drivers/gpu/drm/drm_panic_helper.c
> > @@ -609,17 +609,20 @@ static void drm_panic_helper_qr_exit(void)
> >       stream.workspace =3D NULL;
> >   }
> >
> > -static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned in=
t qr_version)
> > +static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned in=
t qr_version,
> > +                                         const char *qr_url)
> >   {
> >       struct kmsg_dump_iter iter;
> > -     char url[256];
> > +     char url[512];
> >       size_t kmsg_len, max_kmsg_size;
> >       char *kmsg;
> >       int max_qr_data_size, url_len;
> >
> >       url_len =3D snprintf(url, sizeof(url), "%s?a=3D%s&v=3D%s&z=3D",
> > -                        CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
> > -                        utsname()->machine, utsname()->release);
> > +                        qr_url, utsname()->machine, utsname()->release=
);
> > +
> > +     if (url_len >=3D (int)sizeof(url))
> > +             return -E2BIG;
> >
> >       max_qr_data_size =3D drm_panic_helper_qr_max_data_size(qr_version=
, url_len);
> >       max_kmsg_size =3D min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFE=
R1_SIZE);
> > @@ -686,8 +689,10 @@ static int drm_panic_helper_get_qr_code_raw(u8 **q=
r_image, unsigned int qr_versi
> >
> >   static int drm_panic_helper_get_qr_code(u8 **qr_image, unsigned int q=
r_version)
> >   {
> > -     if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
> > -             return drm_panic_helper_get_qr_code_url(qr_image, qr_vers=
ion);
> > +     const char *qr_url =3D drm_panic_get_qr_url();
> > +
> > +     if (qr_url[0])
> > +             return drm_panic_helper_get_qr_code_url(qr_image, qr_vers=
ion, qr_url);
> >       else
> >               return drm_panic_helper_get_qr_code_raw(qr_image, qr_vers=
ion);
> >   }
> > diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm=
_panic_internal.h
> > index fe6d514a0..f33552265 100644
> > --- a/drivers/gpu/drm/drm_panic_internal.h
> > +++ b/drivers/gpu/drm/drm_panic_internal.h
> > @@ -14,6 +14,10 @@ struct drm_device;
> >
> >   #ifdef CONFIG_DRM_PANIC
> >
> > +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > +const char *drm_panic_get_qr_url(void);
> > +#endif
> > +
> >   /**
> >    * drm_panic_lock - protect panic printing relevant state
> >    * @dev: struct drm_device
> >
> > base-commit: 54e61ea6c492d69a1717018826d8340810c812eb
>
