Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793105883;
	b=nZI5XAEVaW+JNY0rZar3RpxMlb6X+UXvH9fc7aVDPqpoDj2wxK/4IJCDQF7eXVd7m4eg
	 7ZyBSlZ36gnZGIL8fVoCleR3AkbGKxENZCzJcPo52OGlvRc5Bsftbhj6A6aE7lCyhCA5U
	 9bSXQQM8G6dP1X4HQgUEAa5iNdlinslwZzmakXbCf3E7n9Xeyey5kqfhMFC5/vzm2jJk6
	 6V92DVuT+JzJ/VlMx78hqmgMcQqdO7IhBFgNFHZmZapWaxZZh0+iuM9nSImJY/18FlEZ6
	 s9v2pLYkGiIRZSWkJpITvfenuZ6OkWjfAoL89MRP47yTb1rtl6gvLlm7rqaFtzoKecw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5cFHz19Fl8DmCi1uIfI6RDZnDxd7w5JrqZ9wd9VXgCk=;
	b=438+eUT7kSGleyEyttF+VI2x+ypZLwC4diAq4Vb13T7H4uPvERE2jJHj7+ugvKlC+0YC
	 sxVm6OdaHBZlpuGW8vvhbn8Ngu7gIM6S8uFnIa2E7/bYqOgtc5emmQy2FfZcqoMVzacKE
	 EvImLBtXXzmQUPsR1wZhV2AN+6eUgOkQ3KanaWVDhLtzTea2doOo/8B3rVJEv3RyTUs2O
	 52YiduoBT/jy1C8K6XEvdrVpyeiQwPoyswncV1B+YrBcpm9W0fvmwHH7gudIFAWfbXr2o
	 7G3PzsSBHoAJIzSZZ1crffif4Aj3WE2tSV2GquINGGAk4HiaYbkLeeVPku+piBX+f5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHJ4tbem;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E53E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHJ4tbem
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01548ac96so6213225ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793105882; cv=none;
        d=google.com; s=arc-20260327;
        b=lfWWzbJijxV+iEmiequPDg8ZUsqBEIJebKYc8DyFC6RXSDhMdJGmYGej0so5YdgwlR
         XT47RsQbzEkHdt81BwrorEMHYxmRVb/sJjTG765Ys1Mdbtd73fiq9VQFf4agKTJhpKi1
         s7oWxXXTiDrXihG70It+bnQooKVQBh9+4KKpAQ7vOQXpYqhMxwFchpc8KXAXPJYH+ChM
         9/09+hONtGwqMmsqxH9rNBZONEwdA6lSbyKjBZUu/4eO9QsSnLCzBDXg9eNUAgbnOdIM
         VCtaTXFv1F55q2b1zdC3Cb92c8bRbt4mjTlX8hclHzxdGm7oVNdeBWqTaKMnEDNOMcPH
         1XZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5cFHz19Fl8DmCi1uIfI6RDZnDxd7w5JrqZ9wd9VXgCk=;
        fh=kx9VUvqLWoDr5bvNDR2w97V/dqklRp1c/NyOQjWGa94=;
        b=q9RrZ7X9O0j6wASEHTtNLFYw3XLZwg1qHcNRGu57kDXvdk3G4ncp3LzW7enPO2Jgf1
         qdegzMtBZDw4ZcE00aKxTzhSZIXP8H+6j5M1k1yFsP8bi12A2uwv8vezy4alD7FA/fS6
         pXnLs0agl4nk6gQFA5/+yJJU4hZBWuoNAPybesHOzzzTZQ+K5PJ7TNe9QXwt10WRoEns
         h+Mo5KbSsUBTURIwzhH8IgVbuBl24XHphsDSF8d4ziadhxsL9CLcbIO7O/S4mYxld9wL
         BbqCwX/QMQ8KtzoynPaAKKvEJEyMGlfziBy0wnAH60sP0zCnkc6ybm4mOHbUK2f74dPW
         8iQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105882; x=1793710682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cFHz19Fl8DmCi1uIfI6RDZnDxd7w5JrqZ9wd9VXgCk=;
        b=aHJ4tbemtXgRO/LILEXKK5MhMnBXmgt5kiSyMyb1tHetusY0jOvBx5UO0LGELlICNP
         DKANOQx0B7uOUv21WENwTl+0HzugrCb8DdqOggPXDIxdKcdcR4c0VWMHP+waUW3RqJpW
         PgbtjJPfXyv2RVyRFxl/dt6AG0MXgM8ZWcMAzbwPQZ2RC9RJ/9r3qpg2l8T8XqGqZ7Yk
         gijk8+BTGqq0wdaNKGBqzj1yidEIcLxAcBJfoo16JvlUChDtYRRFjVNdnFMjLusDtN96
         3t5Rm/HFYlFpZmDKfHK7DbQa3BAU6RLInY0m+TVJNdGy1H7qqBLkzofefDrNRVNILLG8
         xj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105882; x=1793710682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cFHz19Fl8DmCi1uIfI6RDZnDxd7w5JrqZ9wd9VXgCk=;
        b=1vY/AY8gcW4S42SbGkT1RZTPqWG8XBWimrlat8sm0mpBjZ7uzoB1zKEdXPtcsB5UZ0
         uH6PhMxTyUG7TuLb1QqtUqXn2hJWxfEWUOewUxp1uBuG0kFjljlKT02dRZSNgjxVmNez
         aKkd0DytDLzjtiFlNBOlBQDD9Vxq4WeU05kszy4GH/LehkfpQP64NvbVCRm5ieEpRKhY
         pE/YRfm099HROVlkqYWbqfdMHpHGgN9wH/j310rSy6FwiVs8noJ4wEQM9NUsJGsHc1aS
         aueFSQXnH/0LuZkrXPpJ8eRaB5WGjVOoV3fzl5K7eZU3KzHEMLaxZVrI4ak4pBaG9uYC
         SgGA==
X-Forwarded-Encrypted: i=1; AKwUvBzePwVfzUAQS8cdgyMQRPusmZQ5Sa0Y01K700vriM3doC2QTM9N2gItnT0OTJzTkZJ6jrPVslIBlwivj98=@vger.kernel.org
X-Gm-Message-State: AFq9FYK25qVuTxJiwzZPLu+18HZ8yT49ZmmR20SyPducXI0XJNn07QYi
	7OJ75CLOMTkyoZfUnkT9iJfqii9GGzesQi5OZjRrfuBbo72y6Iu4SJDle8tbAkOYfl4OrVePEo+
	77MV7A6AJ9pZqwEGH2u/tA6Od4AiubeI=
X-Gm-Gg: AYBFou1g+WPJl0gEZr/W+yPZ84D+QDwThByRORBW9FsQptcK+7XpXva9V7n1yiNl/1k
	b5F5jRj5rZ+HayCIG/x6Sitkh576lrFcnUs185IdPGZ+/fbVRmwXDNVVCmMZe2n8w889ZxM6Y1X
	99KywcamTkeufvMS5OpejvQ4mHzhcfoU/EC7Z5jMHy9UhPPDIbRrRVL4VF8EqWCkfkHEUy6lNPr
	j5wodpvU1w69E+z0AwZI3xATWyG+xXTH+RbFhet0jPyJW7m6gVm+EkqCsb+aG/SfCsQaBXxv5Y7
	083Exv0AvZrKurDprrYUb0PXcrHw6r1QoL5HHyM7ixcVcZYqlRV2+DtIZZA5XJSQy/pgc7edLkr
	R2jEDJ5R8fb/CFjlpnvqbRy+YhQOH/Otk09xICwTem9mmdfOENRGCxgepIjkUvMNUK9nIgnZWvN
	Y7A4RiiIZCgUP/nRm3EAb+K0M=
X-Received: by 2002:a17:903:1246:b0:2e9:53b1:a3c8 with SMTP id
 d9443c01a7336-2ea9b8cedd9mr139799795ad.0.1793105882570; Tue, 27 Oct 2026
 05:58:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com> <e0573e72-dcc1-4ff2-8cf2-53aefde912cb@amd.com>
In-Reply-To: <e0573e72-dcc1-4ff2-8cf2-53aefde912cb@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 08:57:51 -0400
X-Gm-Features: AclHuK92ggwXiFq1nRRsvD9VvQPc9NQzHHjBp1wqrlbElWtCAuab7SLZN1uuWeE
Message-ID: <CADnq5_M8f2Hgs06n9EXUaihGsr6YEm6G4YFVQmPfQbGU08XkBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K iMac
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Richard Lane <richardlanedev@gmail.com>, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:21=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 10/26/26 23:46, Richard Lane wrote:
> > Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
> > VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated EFI
> > framebuffer.
> >
> > Override the stolen VGA memory allocation size to 64 MiB when matching
> > PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
> > framebuffer corruption during boot handover.
>
> Hacks like those are usually a big no-go.
>
> Why is that framebuffer handling not working with DC out of the box?

The GMC IP code reserves the memory used by the display hardware from
the pre-OS console.  The gmc get_vbios_fb_size() callback looks to see
what display viewport was set by the pre-OS environment.  If the Macs
need a workaround, that's where it should go.  Since these displays
require multiple display pipes, my guess is you need to double the
allocation in that case since the current code just checks the first
pipe.

Alex

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gmc.c
> > index 4204c3c750a8..8b196fbfa724 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > @@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struct amd=
gpu_device *adev)
> >         } else {
> >                 size =3D amdgpu_gmc_get_vbios_fb_size(adev);
> >
> > -               if (adev->mman.keep_stolen_vga_memory)
> > +               /*
> > +                * Apple 5K iMacs report one 2560x2880 tile in VIEWPORT=
_SIZE
> > +                * while scanning out up to 64M across the relocated EF=
I
> > +                * framebuffer.
> > +                */
> > +               if (adev->pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID_A=
PPLE &&
> > +                   size =3D=3D (2560 * 2880 * 4))
> > +                       size =3D 64U * 1024 * 1024;
> > +               else if (adev->mman.keep_stolen_vga_memory)
> >                         size =3D max(size, (unsigned)AMDGPU_VBIOS_VGA_A=
LLOCATION);
> >         }
> >
> > --
> > 2.55.0
>
