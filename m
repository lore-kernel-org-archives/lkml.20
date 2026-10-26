Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039129;
	b=ELvyRK+Xg9NbeV5fpdzOXsy7UZBYTLyvaB9zJGJb5/aNANWX/nR6wRitYBXiegCVeB8J
	 hEzm92MoXyrbXgZBErs8VaXnrW9pC5WhRUFbMzYJFYw4FioD34Y5FFUgsGUDLGPljTwKG
	 24+H6xM4YRuDLemnUp6FKjVxxNjYH5kAhRqKem7vnmQ9WC8m8jBHinNbLasaAu32Hxp7e
	 5G2oexqoPmm4ZzosoNlVBaihcW/ftGNlsmLLjNXrGofilO3QvMwYwTx2rt/1n5hJ9G99n
	 ps6uGhB48MNGJIUe5IU6yUobySNLv/J5ykO0V4dxarMMRlvKTlbN9+HvxMHcNCVtJ2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
	b=LjmcbwPSRX5j7QiSEe6ATQ5meu2EUKiF7ge6at/coyy+HYTkE0WjUkufqiw5DvX5NPRj
	 hzdJ8FVcLyjDdFeWWcVlnfF2/DUST/DRASnISlXTE8SDsnR/Wd64v9CPub68nst/knGrB
	 8SawIlYt76VIlSv+tDylVFnMs99KOBAmQYguH1st7zqhdLaS5hPbn7Bp++pEZko4yMsnZ
	 KCNfGuZZJl8EC1dPljm0e/Tomr8GZRcFb8LMz7UFKGgBWKYLCq9RvpK2ZLbJH5GwhxdiU
	 /KOX77oMujjQ1/tLk+I/OxEqpmJfJeJkQCz43g+/sxCz65unfjG27YVPhWPVyPkemGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psje4x7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95C606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E95C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psje4x7z
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35159e0092aso495332eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039127; cv=none;
        d=google.com; s=arc-20260327;
        b=P6wJLaL8hRZftED0Ok/hVDZtnOd3roBeqMVkmVNitSHMcZQ7NV7nGuWZT+lNOlArwg
         B2GCMdU5dIzrVdo/EOCDxpmwh33Fk4m5p8xPesnbBQ1zLLlrwmB4DHC0eLimNVf4H5CC
         Jz+rfIqD82dFfdaPxCyPlb8tHIqyVpVgTVeDqZmaCrSSdbkfxTaeNsEVlhHNV8IiRaXB
         V83UbSYn4S15XngaONuZe6/yCicf8pX7eoBBF/EWH8v/fqULBvyAsozEKR1GKtXZ5JtX
         iYyD+Uklrz9IieyFBHIEPJTUYdKM/FJ97Q3QaSGB8EDvWOiONR5K+64CynbFFPkRKwv1
         XmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        fh=XXBQ+9hU1KH66mh+wYcUkYoUFnxsbIZz4GMnouxtCuU=;
        b=FSfEf5NGfTL0Z9q6VkRd2UKC+ArubHTHPhEtBdU92PX2nWeFe5n+4tE1RTXzuGrJAc
         zgfTPgWk/+KHzW898bwjELEufRXU5+ync15qUPkPB0kjAEl3Nfl16v88vIbDqTLB+DBn
         ugx9YoIvHu0/g4wyugAMjhRal9S+1hgpTAq+n//Wqxt1pjtFoFh3V/UngslOYJBgE+Ia
         blvoSBA2K2235eruGTshw9ygeSqrMiH5RpdvWwCUeXlwVG7h/FPKdtC5DsaNSN3ZmlDc
         2JCOT1qAffhzRSvPG50Fps3kXEja7m+v+dR2OQiSf5D8XoLAuITt9w2m/kXfTvnHjBMX
         H1Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039127; x=1793643927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        b=psje4x7z1e4XGk6iRkqCgnwuVkNqyA5hL1Vp7pOb17/wITHwbAh0iYhBFF6mbhBM24
         xvmdiZrEk7sxlbtJGRrL1dDwskbybjtm5434K6pwAuao7iFW0fn7EYfBaW2jZrbWpbR6
         Kia39LOXBzpqlFZPdzAjJqwGYH0ePgO4sp83wQLX2dfMVkVgOoFzN4dRoLSC3BqTi2hG
         6Tpq8SbAjt+m4i2nllfijPXNXSM/UKkWJPZ3h+MsofLN8OHoYscFnm1bPA3vhxPndd4m
         9r4JKrstZNe2KzxJzptH//U3GfUJ4Hzpr3kyNTkkp4w8iMvy8jHjJ4zTlNpymwAGWsdb
         sUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039127; x=1793643927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        b=JKfz/g8lp4bp9W8Zmenj29hjsB5qK/5BE/B4AxxK/oYd4bI8JcOKRjeoLzWQHCSfpF
         bwsZpYEM2Ly5KIyxXbECQCjOY1/o8D+0u0nt/V1pp93baoguQqnY5Gu5X/I2RUmGEPx3
         BSY3HaDez/xTpIqYF05xf/fIdM4poFM4hpe90wIQYl6zjUle2SbvgTgA3h1m2GydUDJZ
         20wVLhdJ4tbaf/fmvBpyjvDS5WDFoOscrefAVkdQ6LimY/mces2Z2LUDHh7NpKI++Ifr
         VYX5mAaSdiyZ0/svMm8C7u85UteazID+wwaqs6VOZh6b+k71oqpuXiwDjCpakUAhXSH+
         /Ebg==
X-Forwarded-Encrypted: i=1; AKwUvBwoZplk3s7YyBZtxIweGQX9ZKjwszq92xCKnsCq/iQfvz07AnYzdboBrQ8XTYGqjEJ3l5XXF69oLPcRNKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcHHl7fFiAQceFQXebdp049iEAfVPF+ZduENYl4oIxq8HX2tq0
	giRbCOUBub0rw69u+1CCc8KukwgHEg5sr7WMH2gXGzsM1vycSnPeCYV0+3EWc0Q9aDV/VS1In76
	eopCICV5q1VYJxWoaP1YDJK0uZmtMjlE=
X-Gm-Gg: AYBFou1mhzMDau0KwE95RKYG8G0XrKsrW3v9In/3TJiq6uP1DKr+sKulqQVJaoZd8jr
	zvypvHpvnIeA5h64lTI1TTYQZr/4jbwYVRbn2jfqHjr7flh8lHnGCqh9I6CRHAurMvtmMHIpaG5
	cIO88/OcWY+SS2KoNF9plXz4Lbv4X+oe+tbg/1h3joM3JcjN/4NIO/rCpZpv+cZWXp+880fhw2I
	gst3b6LVxHfXQRRkqkIBzRNFNpMl3zWxhcwFNp/LVYLAHJiOH4Oiak9BZ4Pb+1nJaqmHx5lfDhe
	LjcqtzoeKDIBqj93dzN5etrS0vyr8zUhBlchG3eGclVWweRKnac8Tp4m6CqzmTc90ggvW6xR4QJ
	XulrBP2xKMtSieM+8pGZwCSO7nIqIxf00gIKSZYOjOpVd+3tZcZQS7Lg+x0OB8nr27++wRGPFTN
	sR5m2kcHQ7LTrJuxOhpXg58Bk=
X-Received: by 2002:a05:7022:7f05:b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-199345c5ecamr17915804c88.1.1793039127302; Mon, 26 Oct 2026
 11:25:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-11-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-11-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:25:15 -0400
X-Gm-Features: AclHuK-iVje5ZZPGXAxueHXGbehXRgBbIH4abpn4VFZrQQC5igwZxtMQm-2wnbg
Message-ID: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps
 the GPU off
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:26=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> From: Andre Eikmeyer <dev@deq.rocks>
>
> As mentioned previous any access to the GPU when the GMUX has
> shut off the rails results in a CPU CATTER, skip and report
> any register access after the GPU was runtime suspended for GMUX power-of=
f.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  5 ++++
>  .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    | 24 +++++++++++++++++++
>  4 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 6fd607587..ac8dfc3ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -881,6 +881,8 @@ struct amdgpu_device {
>         /* enable runtime pm on the device */
>         bool                            in_runpm;
>         bool                            has_pr3;
> +       /* GMUX has cut power, any register access would hang the PEG lin=
k */
> +       bool                            gmux_off;

You can drop this.  Nothing about this is GMUX specific.

>
>         bool                            ucode_sysfs_en;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index c1f196242..8185934b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -946,6 +946,11 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_devi=
ce *adev)
>         if (adev->no_hw_access)
>                 return true;
>
> +       if (unlikely(READ_ONCE(adev->gmux_off))) {
> +               WARN_RATELIMIT(1, "%s: register access while powered off =
by GMUX\n",
> +                                       dev_name(adev->dev));
> +               return true;
> +       }
>  #ifdef CONFIG_LOCKDEP
>         /*
>          * This is a bit complicated to understand, so worth a comment. W=
hat we assert
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 5ad7b6dd8..135798c76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2932,6 +2932,9 @@ static int amdgpu_pmops_runtime_suspend(struct devi=
ce *dev)
>                 amdgpu_device_baco_enter(adev);
>         }
>
> +       if (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_GMUX)
> +               WRITE_ONCE(adev->gmux_off, true);
> +
>         dev_dbg(&pdev->dev, "asic/device is runtime suspended\n");
>
>         return 0;
> @@ -2960,6 +2963,8 @@ static int amdgpu_pmops_runtime_resume(struct devic=
e *dev)
>         if (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_NONE)
>                 return -EINVAL;
>
> +       WRITE_ONCE(adev->gmux_off, false);
> +
>         /* Avoids registers access if device is physically gone */
>         if (!pci_device_is_present(adev->pdev))
>                 adev->no_hw_access =3D true;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_reg_access.c
> index 7468855c1..bb5dbeb7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
> @@ -594,6 +594,9 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device =
*adev, u32 reg_addr)
>         void __iomem *pcie_data_offset;
>         u32 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -677,6 +680,12 @@ u64 amdgpu_device_indirect_rreg64(struct amdgpu_devi=
ce *adev, u32 reg_addr)
>         void __iomem *pcie_data_offset;
>         u64 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;

Duplicate check here.

Alex

> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -706,6 +715,9 @@ u64 amdgpu_device_indirect_rreg64_ext(struct amdgpu_d=
evice *adev, u64 reg_addr)
>         void __iomem *pcie_data_offset;
>         u64 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> @@ -762,6 +774,9 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device=
 *adev, u32 reg_addr,
>         void __iomem *pcie_index_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -784,6 +799,9 @@ void amdgpu_device_indirect_wreg_ext(struct amdgpu_de=
vice *adev, u64 reg_addr,
>         void __iomem *pcie_index_hi_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> @@ -832,6 +850,9 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_devi=
ce *adev, u32 reg_addr,
>         void __iomem *pcie_index_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -861,6 +882,9 @@ void amdgpu_device_indirect_wreg64_ext(struct amdgpu_=
device *adev, u64 reg_addr,
>         void __iomem *pcie_index_hi_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> --
> 2.55.0
>
