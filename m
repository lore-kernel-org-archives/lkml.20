Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199216;
	b=o4ecTp3MxPuI9Xto/Mvwg+9aFl7FoWZk2wFg0snBzxw3Sa9hjRwASr2/MyOQbn00pboM
	 C0ScEyfAcY71FpHdgKStV6/CPOijMjtl2AmmN16NuxNo099YJfEuw3zsbbWFDU5LQDIFJ
	 pBRqbcogYGp8s13g3hWgpZ/UNCX2AVe9X1vmVBN8uXb1NsCxdrKS5v7zieZdNvw25K0z+
	 cJsrtTuKwsBojnm5F/4J9vhWf4nStuqpdTNdBfkwCRkKD8b22mCbZY90/xXGLNEPYJTVB
	 Sag37TGcxRgoK3Y3fp6Kfz/9tbnOtJQyxrnu6+rWSnOnu/Bktd5v33CgxRK02O/TxcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hHpZdOuRh3k05zToFRnsSy2dvYFiJ6TeIqmJJw0GgYg=;
	b=eJ0U/pXXpIbcbGG/R5MvDXPiQv7/lVzezUHzOCBELqTtZgcaVjawWitviNzq+KUniA+Z
	 c+WPvwHIvi/fYfTbnZxzPlw3KuyONkWgJywF+ZYiTSqfikRICbaJ2K0UHJZ+Uq4rpIpuc
	 0NmndCiqrn1fQXMEBQDfm9G3dlzEY1borAUO6Kt+AXtWJXJ74UQjpMGPKrxHJO5X4slop
	 9VYfSlMHVgBjieqwc5gvFuZQRQjuTmNhMUrhpMqperk1zIK5gq0qvOizpMLztHnlNa1+U
	 qL5q6nSm3rpvjGekOCmlfBPvnvuZC+xtBkpFC9sMwrMCnuJ/sRBmJdps93B/MET2TTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMMo5D5r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMMo5D5r
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a1467ca93so133024eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793199215; cv=none;
        d=google.com; s=arc-20260327;
        b=l0O+jMf4FELvpW3Mu+ZzvWPTi0plgN3/RJKV6gIg5wnCkks0xz0PLbxv64HmCBJlQk
         9KDiiXT+JfDsAc6bxcxvL6buxuwK64qJr5+2DUexrypJ1fUvqcl9wxpFxZeL11uJGY9v
         b05jEr/hQc4Sj69O0qC7inkJckLvsbB4xQZ91YAK8p0u+Si/2RH+F3+9WJZkjTc+jbY6
         Le7wAlFHC975d37PIszaKs0L0cYZa8yoAYKOkAAyq3is0/zAM35wIVRvQwP1ZaqYBfrd
         ibIJGfvvNlcC7vVRP1GNO5B4u9WtnRE5gVS89vtZ9G5ZHLAEDvRMNvo8+8d6kYYCWwQD
         5neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHpZdOuRh3k05zToFRnsSy2dvYFiJ6TeIqmJJw0GgYg=;
        fh=MLwA/DmCWllzs2KsGJYVVy0sIR8SRdzUZdvn/qD4Ijc=;
        b=RaUnC28rO/v5i39BFMtjbiA3uPzX23aU8JIW84PM/3Zub2RZcZwIHrgisoK3Ns7HrG
         1pLUj6vuLVwy67oFW4a68eqJdrPnOZY2P/1Didug1XggM9ni4ipSpj1FtdCsJ7i3n+m0
         YllDUvvQht3T/SsP/RhRfX8x8aP73CpS4w4opEY7vuu1yAr8W7wohJVHC7Z+qaSt6BJm
         ntCY+fhTHDjRV3nWcIJdtuz7UimWbkavEs/wJc30KE3G7sTgx6zsJVMdmoAq9D7PYKvw
         kwHPx01Mdlrt/iLJbMcA34jwLGOiCMdLEmr1KWHdLjdc09ghMSoa90KmmmHcuPllMFuz
         2NtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199215; x=1793804015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hHpZdOuRh3k05zToFRnsSy2dvYFiJ6TeIqmJJw0GgYg=;
        b=hMMo5D5rjgLmJtP7tG6KPpa71+jDflHNclle2YOUPtkgXw/ygeKATzmdmy13P7QW1Y
         89jIgqlHqVSsMcMHie8uA/ge9hstH/oSpq4tezZ+98MyJD0Jz08TJRz948BDD+u+rq0P
         pboOFglmfMJrDZtKaawVUEd/j1BaG/25TnJDr1tcTaQ9etlMfSrFarm3iLfXUGSJB93r
         Njte15D4tKgKSugfN/wMdLKWpMiuqoxwhWrVgb7yvBT96M/BavALT6AbOl4uBXlGXi29
         gB2Mb7G4W+iJZaUgx6IpE0BsI76c0lJnqEAqqxS6B2WTVl926IMB5viSHSt+eKZm7hBv
         3cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199215; x=1793804015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHpZdOuRh3k05zToFRnsSy2dvYFiJ6TeIqmJJw0GgYg=;
        b=fO41U6S/0+s5JnwL9uwMB83mC8cpoH5Tq6veLx6a75vyu2muDT6xMeklznz6i9v359
         gkI2z5JIaNE0uHNmlbJg1TXhlp1BBMZNGYrzns69aCuHOtG5dF+GYbKoq5MXsaarwOzl
         uwFpwhqstVDGC3z0cbP3qiWTPh22iSgxdj/rwXs5+2A1zamaAIUZX/HnLS2qNdmiTqqO
         ny5bu5a3h5FDYne55ZsTiEjrgZtQkPZZD5AoTHzVVEdk2FC/WEWcG3oVYWag2nPFvnLO
         1ZCLgEltX6gFF3ovdH/lrjscxeI+3UgLIRQn39UnRQ1z954CIQueCedZGchjVXBlKV9X
         h79g==
X-Forwarded-Encrypted: i=1; AKwUvBw+vK/ELKZX91E+BXHffpfs4UoQiRCwciXoDWcz1znixvAPeVwDlCi8ieK8KlEtzXwLSkZDIUSQqIsKTGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlBUznOWxKnp5J6MNhZkoLnROB/XtB5jJdsFOLCs2X24dqPGng
	Q6KD7+6PAoN0u6rP6yBpzz5nArtguIHL1NXWkzRNBWC93ShNtI2Ts45EBDKLLAO2Hw9fUVsQSt7
	uweWRPTMPM3oGVAYMtDr6ecLknoZF0s0=
X-Gm-Gg: AYBFou12aHAB/Zq8D7tY0ACOP0Tc2pxhI5YeKtDcHT/SGlQNVLvUwnGb+iHjuW229LA
	w7EZZqpBJenTzyAsYLk7HWn3uVmakL2bCc4AqXUV8zDrGsG+m2BhRxM8IEvNIsxf83jVpyWrSIa
	wU4nEWm1ZZVK0XWSNaHsmnhkzPylgsXiweNrUIN+uVsSfhv2a4FPlW5bfjSgpeyyYNbHaZcgHZD
	xkpgiy9Dpv5H7ZtpiZsRKjOEoMYiWkTnaFKPJmDciIEwrL1PHQsLCz4Jw03Nu7ZyvVP6Q7eR2Ew
	NhHr1CWsH00eMu4ZWDmiyliVMzBRse/Atb+hVdT6CR6BVqLxLDCRBbc6m6vDmfbFZ08d9SqiK60
	0fC9M6WLJXhgu6M+ck3cU4bHRYvAHGnY043KQF8BTC93Gi6uY0fjC+vkpnWjtsw1gaWNTKPf/ku
	nMu6QPHpMJYNU0B45NgvyIX29uJ3JhgGiGtYiH6Mqnys99
X-Received: by 2002:a05:7301:1a8c:b0:369:ffc5:6767 with SMTP id
 5a478bee46e88-36a1ffc100fmr5213282eec.2.1793199215122; Wed, 28 Oct 2026
 07:53:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com>
 <e0573e72-dcc1-4ff2-8cf2-53aefde912cb@amd.com> <CADnq5_M8f2Hgs06n9EXUaihGsr6YEm6G4YFVQmPfQbGU08XkBg@mail.gmail.com>
 <6f79a3e2-5510-4018-aabd-45fcdf5dcbb3@amd.com> <CADnq5_OTLQuD3B6-VUgZv6wGjhFNY_U77wqdv5Y+e25+O0B2ZA@mail.gmail.com>
 <138497f6-2271-4229-87f1-4e42e9d2b581@gmail.com> <76b577d9-e8ce-45d5-9330-564411cc099d@amd.com>
In-Reply-To: <76b577d9-e8ce-45d5-9330-564411cc099d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Oct 2026 10:53:22 -0400
X-Gm-Features: AclHuK9PGvqElJiJ4JkJ6TDlP1xlfh9iqAhttNXCNmpg8zpVdT6TtOWjX57qcnA
Message-ID: <CADnq5_NUKVeF_UNqx=8KfPQ8ntvkT5iv_Tfgp5v9r9ADv8go9g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K iMac
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Richard Lane <richardlanedev@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:14=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/27/26 18:59, Richard Lane wrote:
> > On 27/10/2026 13:37, Alex Deucher wrote:
> >> On Tue, Oct 27, 2026 at 9:16=E2=80=AFAM Mario Limonciello
> >> <mario.limonciello@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 10/27/26 07:57, Alex Deucher wrote:
> >>>> On Tue, Oct 27, 2026 at 8:21=E2=80=AFAM Christian K=C3=B6nig
> >>>> <christian.koenig@amd.com> wrote:
> >>>>>
> >>>>> On 10/26/26 23:46, Richard Lane wrote:
> >>>>>> Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
> >>>>>> VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated=
 EFI
> >>>>>> framebuffer.
> >>>>>>
> >>>>>> Override the stolen VGA memory allocation size to 64 MiB when matc=
hing
> >>>>>> PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
> >>>>>> framebuffer corruption during boot handover.
> >>>>>
> >>>>> Hacks like those are usually a big no-go.
> >>>>>
> >>>>> Why is that framebuffer handling not working with DC out of the box=
?
> >>>>
> >>>> The GMC IP code reserves the memory used by the display hardware fro=
m
> >>>> the pre-OS console.  The gmc get_vbios_fb_size() callback looks to s=
ee
> >>>> what display viewport was set by the pre-OS environment.  If the Mac=
s
> >>>> need a workaround, that's where it should go.  Since these displays
> >>>> require multiple display pipes, my guess is you need to double the
> >>>> allocation in that case since the current code just checks the first
> >>>> pipe.
> >>>
> >>>
> >>> Could this also be a logic error in that callback?  Would it be worth
> >>> double checking all the register values in that callback for this sys=
tem?
> >>>
> >>> I know for example there are a few different IP specific implementati=
ons
> >>> in gmc_v9_0_get_vbios_fb_size().
> >>
> >> Not likely.  I suspect the issue is that these systems use two display
> >> pipes so we only reserve enough memory to cover half of the display.
> >> On PCs the vbios never sets up MST.
> >>
> >> Alex
> >>
> >
> > I tested doubling the allocation in gmc_v8_0_get_vbios_fb_size():
> >
> >       if (adev->pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID_APPLE &&
> >           size =3D=3D (2560 * 2880 * 4))
> >               size *=3D 2;
> >
> > That eliminated the corruption across the middle (45-60%) of the screen=
,
> > but still left a band of corruption along the very bottom (95-100%) of
> > the screen.
> >
> > Dumping the DCE registers inside gmc_v8_0_get_vbios_fb_size() on the
> > iMac17,1 showed:
> >
> >    vram_start =3D 0xf400000000, d1vga =3D 0x0
> >    CRTC0: grph_en=3D0x1 surf_hi=3D0xf4 surf_lo=3D0x300000 pitch=3D5120 =
vp_size=3D2560x2880
> >    CRTC1: grph_en=3D0x80000000 surf_hi=3D0x0 surf_lo=3D0x0 pitch=3D0 vp=
_size=3D0x0
> >
> > Even though only CRTC0 is active at EFI boot with a 2560x2880 viewport,
> > Apple's EFI allocates a full 5120-pixel stride surface (mmGRPH_PITCH) a=
nd places
> > mmGRPH_PRIMARY_SURFACE_ADDRESS at a 3 MiB offset (0x300000) from
> > vram_start.
> >
> > Because CRTC0 scans out 2880 lines at a 5120-pixel pitch starting at
> > offset 3 MiB, the active pre-OS scanout spans [3 MiB, 59.25 MiB) in VRA=
M:
> > - Reserving 2560 * 2880 * 4 (28.125 MiB) places permanent driver BOs at
> >    ~28.125..32 MiB, corrupting the middle (40-60%) of the screen.
> > - Reserving 2 * 2560 * 2880 * 4 (56.25 MiB) places those BOs at
> >    ~56.25..59.25 MiB, leaving the final 3 MiB exposed due to the 0x3000=
00
> >    surface offset and corrupting the bottom (95-100%) of the screen.
> > - Accounting for the 5120 pitch and the 0x300000 surface offset reserve=
s
> >    the full 59.25 MiB span and eliminates the corruption completely.
> >
> > For v2 of the patch, which of the following two approaches in both
> > gmc_v7_0/v8_0_get_vbios_fb_size() would you prefer? Both tested working=
.
>
> My feeling is that Option A is less magical.  I'd actually wonder if we
> should be doing this more widely.  I'd *think* the same problem could
> happen on a non-Apple display that behaves similarly.

I had discussions with the vbios teams when this code was added.  They
said the display base was always put at the start of VRAM.  The only
area I have a concern about is adding the surface address.  It works
ok if the the displays are put near the start of VRAM, but if not
(e.g., the pre-OS environment puts then at the top of VRAM), we'll end
up reserving most or all of VRAM.  I think the right solution is to
add an offset to the reservation and then use the surface address as
the offset.  That's more work however so maybe it would be better as a
follow up clean up.

Alex

>
> >
> > Option A (change whole function):
> >
> >   static unsigned gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev=
)
> >   {
> >       u32 d1vga_control =3D RREG32(mmD1VGA_CONTROL);
> >       unsigned size;
> >
> >       if (REG_GET_FIELD(d1vga_control, D1VGA_CONTROL, D1VGA_MODE_ENABLE=
)) {
> >               size =3D AMDGPU_VBIOS_VGA_ALLOCATION;
> >       } else {
> >               u32 viewport =3D RREG32(mmVIEWPORT_SIZE);
> > -             size =3D (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT=
_HEIGHT) *
> > -                     REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_W=
IDTH) * 4);
> > +             size =3D REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_=
HEIGHT) *
> > +                    RREG32(mmGRPH_PITCH) * 4;
> > +             if (size)
> > +                     size +=3D RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) =
-
> > +                             lower_32_bits(adev->gmc.vram_start);
> >       }
> >
> >       return size;
> >   }
> >
> > Option B (add Apple 5K iMacs quirk):
> >
> >   static unsigned gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev=
)
> >   {
> >       u32 d1vga_control =3D RREG32(mmD1VGA_CONTROL);
> >       unsigned size;
> >
> >       if (REG_GET_FIELD(d1vga_control, D1VGA_CONTROL, D1VGA_MODE_ENABLE=
)) {
> >               size =3D AMDGPU_VBIOS_VGA_ALLOCATION;
> >       } else {
> >               u32 viewport =3D RREG32(mmVIEWPORT_SIZE);
> >               size =3D (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT=
_HEIGHT) *
> >                       REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_W=
IDTH) * 4);
> > +
> > +             if (adev->pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID_APP=
LE &&
> > +                 size =3D=3D (2560 * 2880 * 4))
> > +                     size =3D size * 2 + RREG32(mmGRPH_PRIMARY_SURFACE=
_ADDRESS);
> >       }
> >
> >       return size;
> >   }
> >
> >
> > Richard
> >
> >>>
> >>>>
> >>>> Alex
> >>>>
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >>>>>> ---
> >>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
> >>>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_gmc.c
> >>>>>> index 4204c3c750a8..8b196fbfa724 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >>>>>> @@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struc=
t amdgpu_device *adev)
> >>>>>>           } else {
> >>>>>>                   size =3D amdgpu_gmc_get_vbios_fb_size(adev);
> >>>>>>
> >>>>>> -               if (adev->mman.keep_stolen_vga_memory)
> >>>>>> +               /*
> >>>>>> +                * Apple 5K iMacs report one 2560x2880 tile in VIE=
WPORT_SIZE
> >>>>>> +                * while scanning out up to 64M across the relocat=
ed EFI
> >>>>>> +                * framebuffer.
> >>>>>> +                */
> >>>>>> +               if (adev->pdev->subsystem_vendor =3D=3D PCI_VENDOR=
_ID_APPLE &&
> >>>>>> +                   size =3D=3D (2560 * 2880 * 4))
> >>>>>> +                       size =3D 64U * 1024 * 1024;
> >>>>>> +               else if (adev->mman.keep_stolen_vga_memory)
> >>>>>>                           size =3D max(size, (unsigned)AMDGPU_VBIO=
S_VGA_ALLOCATION);
> >>>>>>           }
> >>>>>>
> >>>>>> --
> >>>>>> 2.55.0
> >>>>>
> >>>
> >
>
