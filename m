Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691895;
	b=G8YPliWG2uiTroD91nKOyn4/3skZUwCCUMsRHUdclD3HEKoQYzwRsoSyMWpkiLCy/3sv
	 aljDmhB2wjy4RhzQ2/4z3E0tMOtQA2kDAD71WW73J8z951IWsqU19eIQxumToQkWTPcj2
	 ENxwoBMfNCoBlj0eBdVlc5jeKWJKDNWWfXsL9KbbfwFvX0Tlmt1XsnZ2yGzloB7gZe6aU
	 HIWSkCH+6L6foLKu/2vIox6wvXUWe/AuE1Rv8AlRcgCZjNisDyrR2bTAuc2aIPDskDwY2
	 +9VXepjwNVTNrMLGblRS75AfnWxuNGNhK+a26LrQJIR2+mUfI/vNmP1oYZOHWqdRQPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gOxyJqweGrhnvnodtSAXe9yahnUU1PnlCf3PPg5Ekys=;
	b=oMjrsPUVjSJUtoObejU5oEirwFjETVYuB9L+m8mMQBPHb7PTei/S3dYXXxAYHlDz6mKd
	 igOqQyQJnf/TyyYdvmsob/R/rRi0JZy3db9mD0UxaeAS6sJU5HKMqm90ZBXdXjMkZkC+W
	 5T03ER+Y2Gz+i8d1w1/pF2nBIb/KOdj7vB7tAY/Re9V1cNMXrHbaTjsnA9cPfVPPhnhCg
	 nWxx7MC3UciJlNRVxNoxBGmkNL5UHjRr08+TZJTXYNyv2PSm/jSc6EOrcLcvLDiA8Kczw
	 TIM0OOVHU8W03tWZeQeE0xAVz1r3ZWTPwMYLxqycjayqHoVZZFxBMMcJ3gfXfvd+Niw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cYnL1MX+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F059D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cYnL1MX+
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-151de818519so567c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691894; cv=none;
        d=google.com; s=arc-20260327;
        b=duRTZB9kxseU+J0vIr3sbcvKvmcWlw7YXWpX37bmQYwK4ZKh2H4zvGHdmw/v1RRhgW
         iFNuuBy3jENX2E0imEFRXvvGPbkji2EPjYIFbTVAqkKXs0zn0yP/WFjyqIh3VsDQt7ob
         EYBg4ymEeAroMkRzkXURlXibXVMCgtfBQKu37CZUoulTC6kkxs/BSeXfzdVD+eOqTbOS
         zr0vceN9IO8vYxWkHol56ZzoJCBx2jCLR1HJd4xr2PDtYG58IyIhebkifDwu8Wj+A1ia
         0LU74cGjvGXkLNrWX9RCoOBxq0LpYdQ9v5ykvB5eou+ZSjjApO6Dest/PWtl7/bKh8dz
         lRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOxyJqweGrhnvnodtSAXe9yahnUU1PnlCf3PPg5Ekys=;
        fh=rYmsbvehnwNsIqjutQ8KoUBfM5hUub39TcOKYmknptw=;
        b=V5M5Nw6G6YDqOwd+erUO7FumNSU4Bjo6WYyP1FH5RnuEwEyGl1lSFj/S2CGcSgQZqv
         PvUv5cpyGZIHQ5HD0mcbOeHfbOzn7iqmWqAjQ0/nPpC4yHSkcSzOLfRblA85Z+n3MJ+F
         cYJJPTIZ0zdcXkT+dA9qweFv432ln8KZiogJzSuACi+TO2mKpPY8SWXCt673i3GDUiW9
         dDtNqwe9jwvHYFgHDb1MQiiZQsmwGn9C8u6LeRMhstsHYWobIQ4Dd5E60/9jdKzsI6b6
         yr4H+IoNYqX7d5hMESGnpAP7heXsH0f4/LIipSAiznXzvBRIeAJUx8Vaz4fS4hetU239
         M5VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691894; x=1793296694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOxyJqweGrhnvnodtSAXe9yahnUU1PnlCf3PPg5Ekys=;
        b=cYnL1MX+U1a40hz+XE/VF5umImeX/rli59J7Gx9Ugd2tRq6Cv7JYHI/WhoJiVIXh8w
         H08IbXhIqQh85qSFS5ZBcGPo2xPRGVyYF1gEprNrKRw6ubElgagEo2WctLlDKoLb0fof
         W7fm9kVDKi5gvDhWuYEgnRH87wG3cimYyuIx8r54ZZbxVXF+HQHelFceGPTpiR1DxlBa
         sJFp6cFayuZgG4Yd6XHGI5VIM3FpM3h1/ZEfEQscYLKtHfaoqhuzWzd3OJSVVzOHvYuL
         Bm0DwkDFtarUd1ojJ1KRAx5W4hyQRvNmNPT2hxd1Sk7RtEGL3eSjGVw3OhjRBPAYP9xu
         t+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691894; x=1793296694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOxyJqweGrhnvnodtSAXe9yahnUU1PnlCf3PPg5Ekys=;
        b=UVOLNcDlkQNrxiP0Y4SEiS/G+PY8rF2dpyt5ikxvB6KRPzT7MOx0i/yD/PDoBWgZa/
         CT5MUHRJY3W44B8YEJwK7jpEl1XG2wnNz9nIpTQBXxsVFFuCxpLhfQXb0kYsVLgo8rTL
         q333JJ1G0YQCMWLgGEOC2u0vXAxq3Vpv4h1Cgdm40yjJmFRMcaLH8S7sKusoDvrMkRYO
         N7cqfpV5WR5ZoTaut4FyMW5UwcjS5TkzwbEM0xgq1cmgOFX3Iw26GIfFcanNXQEEPuZ7
         /neeL3WPi14T5mSj5MTBMGqFNv8JabGBZXF1dJhA3fw0EZ/LUo5RV4z5C7Q5uJKVEtyf
         SU/g==
X-Forwarded-Encrypted: i=1; AKwUvBzbTNfj2UBqpZ6QphBDFfx511l2Fm/5EI5S0rebjEFJ3BO81EbKul0b87CTVSk84E3VmtwO8fJbSMipKeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0rToro64aB9i4N9WZa2SN3pbt2ID/G3fcYaEhOsQYImLe6DKX
	g41vH4ilvufoLaqMdNUBh0cxbPgqqE2uI5zXvl+5I5CU1rgyAarB6q9pZzyvXMZ5gWgqkaAPiSy
	NfmnPpVvRZYWztVs46L4c2SAxlTiOdSIDaXGNTgo=
X-Gm-Gg: AYBFou3VDQYb/Pe0K45Uho3o+7iCKj3BkTHrsv8h3qq5yTCAt5MOVj6e3u4dFmPjw20
	d+67M+2fp4uq0znDPolR9KaYE1cDCOddod0cuJlky6nu+ZiJSks90R22pJcUhuvmeIWjyO4qY6I
	VYgSITwjwDaIWRPloL5Ph3I9GI9p0KZdvr/OwSa1LYjh7rBI6oPPY9PtEH3Wf+lOORR2BjA4F9Y
	Fm2qXHhUdkbly6R3+g+hxqzI84GV+Wl4XQ1znBwoOclXMXy/Dr/r3KeGnFb2gDY9gtJjgYPMKNC
	0vNroxm0xdpv0AtEXr3jT5RZArU28X9ImPLFyOIWX0Z4XASFezl9OCh14ljPT5dausiXhwDavgb
	+C+IzD1ZcC8Bs7M1Z5meeNxDGKr97YrYcncuwXbPL5LaFD/vvx1or6c2ib7NuziOsU0yhUbWA6O
	hPek9GiYjCvHS4Jfq001M85veCB0j2paHtgPfcMv6r9PjOIOGIn450
X-Received: by 2002:a05:701b:2085:10b0:192:ce56:4982 with SMTP id
 a92af1059eb24-195b384f21cmr17350c88.1.1792691893149; Thu, 22 Oct 2026
 10:58:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006154913.2689067-2-val@invisiblethingslab.com>
 <8b0fbe1a-1410-42d7-8031-611795ae39d9@collabora.com> <4d86ec37-ce27-4556-966e-4b4e80ec0718@invisiblethingslab.com>
 <f717bc84-57f4-4001-a15b-fcdca67bb9b4@collabora.com> <6c0f26af-e363-46b8-b3b9-8d3910297dc0@collabora.com>
In-Reply-To: <6c0f26af-e363-46b8-b3b9-8d3910297dc0@collabora.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Thu, 22 Oct 2026 10:58:01 -0700
X-Gm-Features: AclHuK8zrBSyPW0ecQ4Wi5vbzBHjWnhi_xIgMiJLjDz9C3zXcHZS3t6jUqqUQ44
Message-ID: <CAKT=dDmEf3McX50KYxmLDb-oeuYWMBSnkcGGSEfi_PO4pD6qjA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: do not enforce blob_alignment in
 cross-domain contexts
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Val Packett <val@invisiblethingslab.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Sergio Lopez <slp@redhat.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:02=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 10/10/26 22:40, Dmitry Osipenko wrote:
> > On 10/8/26 23:59, Val Packett wrote:
> >>
> >> On 10/8/26 4:33 AM, Dmitry Osipenko wrote:
> >>> On 10/6/26 18:42, Val Packett wrote:
> >>>> VIRTIO_GPU_F_BLOB_ALIGNMENT is designed for GPU rendering context ty=
pes,
> >>>> however VIRTIO_GPU_CAPSET_CROSS_DOMAIN is not one of those. Resource=
s
> >>>> created under cross-domain contexts are arbitrary shared system memo=
ry
> >>>> files, which includes unusual things like Wayland keymaps received
> >>>> from the host compositor. Do not enforce alignment requirements ther=
e.
> >>>>
> >>>> Fixes: 47248e0d8264 ("drm/virtio: honor blob_alignment requirements"=
)
> >>>> Signed-off-by: Val Packett <val@invisiblethingslab.com>
> >>>> ---
> >>>>
> >>>> v2: also check has_virgl_3d to prevent dereferencing NULL vfpriv
> >>>> v1: https://lore.kernel.org/all/20261006004044.2242154-1-
> >>>> val@invisiblethingslab.com/
> >>>>
> >>>> ~val
> >>>>
> >>>> ---
> >>>>   drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 +++-
> >>>>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/
> >>>> drm/virtio/virtgpu_ioctl.c
> >>>> index 3ddd5481d6bc..4d5ae062834d 100644
> >>>> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >>>> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >>>> @@ -551,7 +551,9 @@ static int verify_blob(struct virtio_gpu_device
> >>>> *vgdev,
> >>>>       params->blob_flags =3D rc_blob->blob_flags;
> >>>>       params->blob_hints =3D rc_blob->blob_hints;
> >>>>   -    if (vgdev->has_blob_alignment &&
> >>>> +    if (vgdev->has_blob_alignment && vgdev->has_virgl_3d &&
> >>>> +        (vfpriv->context_init &
> >>>> VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK) !=3D
> >>>> +        VIRTIO_GPU_CAPSET_CROSS_DOMAIN &&
> >>>>           !IS_ALIGNED(params->size, vgdev->blob_alignment))
> >>>>           return -EINVAL;
> >>>>
> >>> What userspace has this problem and why it re-purposes virtio-gpu to =
act
> >>> as udmabuf for arbitrary data that never reaches host?
> >>
> >> Sorry, what do you mean by that?
> >>
> >> This is not related to data that "never reaches host" at all! The erro=
r
> >> I referred to in the patch message literally says "received *from* the
> >> host"=E2=80=A6??
> >>
> >> Guest userspace is any of the cross-domain proxies:
> >>
> >> * https://codeberg.org/drakulix/wl-cross-domain-proxy
> >> * https://github.com/talex5/wayland-proxy-virtwl
> >> * https://github.com/google/sommelier-rs (or old C++ version)
> >>
> >> VIRTIO_GPU_CAPSET_CROSS_DOMAIN "repurposes virtio-gpu" to act as a
> >> cross-VM UNIX socket transport that supports fd passing. By referring =
to
> >> virtio-gpu resources in the send command the guest can make the device
> >> send the resources' corresponding host fds to the host Wayland
> >> compositor. It can refer to resources from other contexts, in order to
> >> present drm/venus/etc rendered buffers on Wayland surfaces. (i.e. the
> >> host would send the actual dma-buf from virglrenderer) But the resourc=
es
> >> created on the cross-domain context itself are system memory buffers,
> >> generally used for software rendering and miscellaneous Wayland "stuff=
"
> >> like keymaps which are sent *from* the host, and exposed to Wayland
> >> clients in the guest. Socket receive handling in rutabaga-gfx stores
> >> incoming fds and returns their IDs to the guest, then the guest does a
> >> CREATE_BLOB with matching blob_id, which creates a virtio-gpu resource
> >> from the incoming buffer, so the guest can just MAP_BLOB it. These are
> >> the blobs that are not aligned to anything because they're just
> >> arbitrary memfds on the host.
> >
> > RE "These are the blobs that are not aligned to anything because they'r=
e
> > just arbitrary memfds on the host." I'll appreciate confirmation from
> > people more familiar with Sommelier internals like Gurchetan, Yiwei or =
Ryan.

Technically there's no need to enforce alignment on keymaps backed by
memfds, meanwhile those consumed by GPU have the proper alignment told
by CROSS_DOMAIN_CMD_GET_IMAGE_REQUIREMENTS (unless it fails to do the
right thing).

> >
> > In a case it is a correct claim, might be better to remove the
> > blob_alignment check entirely and let blob sharing fail naturally if
> > alignment is wrong.
> >
>
> Reproduced the bug with Sommelier.
>
> Driver always implicitly rounds up BO size up to PAGE_SIZE for both
> guest and host blobs [1][2], hence need to retain this old behavior to
> fix the problem properly.
>
> Please send v2
>
> [1]
> https://elixir.bootlin.com/linux/v7.2.10/source/drivers/gpu/drm/virtio/vi=
rtgpu_object.c#L217
> [2]
> https://elixir.bootlin.com/linux/v7.2.10/source/drivers/gpu/drm/virtio/vi=
rtgpu_vram.c#L210
>
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -539,9 +539,15 @@ static int verify_blob(struct virtio_gpu_device *vgd=
ev,
>         params->blob_flags =3D rc_blob->blob_flags;
>         params->blob_hints =3D rc_blob->blob_hints;
>
> -       if (vgdev->has_blob_alignment &&
> -           !IS_ALIGNED(params->size, vgdev->blob_alignment))
> -               return -EINVAL;
> +       /*
> +        * Blob sizes always implicitly rounded up to PAGE_SIZE by the
> +        * driver, userspace may be unaware of the host's alignment.
> +        * Round up to the larger of the host and guest page sizes.
> +        */
> +       if (vgdev->has_blob_alignment)
> +               params->size =3D ALIGN(params->size,
> +                                    max_t(u32, vgdev->blob_alignment,
> PAGE_SIZE));
>
>         return 0;
>  }
>
>
>
> --
> Best regards,
> Dmitry

I like Dmitry's latest proposal much better. Keeping the alignment
agnostic to the guest userspace is more seamless, which also covers
the implicit 4k alignment case without forcing userspace to adapt.

Best,
Yiwei
