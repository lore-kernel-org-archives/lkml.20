Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A34854ED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263300; cv=pass; b=L/j3riTjPUESzpzldJauQ4fBa322J/yH3sbHtpk89tGRn6D8dckotRTrcF/a6DSQm1ZIBw+fl5FXXAsgGrmxZv9Uofia66MwSH8VNvT/P8XPiNu715pSiHuTEYiKWA3O1yDYpCQJsVZzSEu3w21rYRwnEBin4T+BWuV1pP9yZa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263300; c=relaxed/simple;
	bh=1PezfFvCvwXvJ3mJWEDIGf5AAICgiWnymZnxH0N/8F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UF/oTkLjCvRy5bF6sHYYg3J/zp+r4Yg/UPP9qLZPpk/SXLvQ8X2zB8EpSbvLgAdqZ6xqdT1D8ZjYyXPV2LB4JCIUxfF2LGV6eOZbhwAycxCu+gzlAoYh4I4n2r5AopYbZe3NJWCi9FbQ/3ypkbs7cDz6GGcIESmVlyprNPGnw58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozHZIVYd; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozHZIVYd"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341107ec0a9so38056eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263298; cv=none;
        d=google.com; s=arc-20260327;
        b=GYDai9WoxCwBfDMiLuX/qdJ8X/Kwnm5BolwyosGh7yyw7ZovP0N3300UhuyTKdJXbS
         l/DcqNvHSg6h3MimyLemEDrc+xzhlLRMjQMzJtMAk6MkfkxlBqE5FUgKt8R7S4+Mvr3X
         K8NhNzUnS7Jlc3rR/fsPoYE84r0y+ga6ICt4jvz05WMug0Ctsgd2Dbx+54F8mzUDHmED
         4KrYJ8CuTL2mI4FxKHTBKy+SGKU87K6Zyf2SlJgZzEeAfAxj2R/BqfyCePGRG0tMtbIy
         sSXyaMig7bwVx1ITiBN1eIBTCCtVcPlbdlAzpE6shXh0wZLaowelxENixO8zNyA0xmld
         tNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1HbT6s9c6aFM0LJbQwaDMayMtoWgK4wRQAnAVfXVUqE=;
        fh=86HVmpgY2DtBrNnK4bAdOckwB/9r37ALwSdTjgeq714=;
        b=SFcm2nS6Vh2fQ6OyTAwwFP8nwgDw89Ecf8pJjTjhnIIgYuLQxbLHazOw2Y0c4Sna30
         DnOjMBxV/A1NDsjbZh+0H5pdXDyNrjVf0FzQtPK+fp/6ssDTVumviwWOKPgZ3E889x4U
         u8BzNzZY9Ko6HmA+JXDQg7S1xqclAnEsSwBOzYqyoS9+hXpngOc3e4aGHiglAAF5feKs
         IbFYbe8j4K3Iv6BiMkjsy5b0PMM4zPbK6aFbcaWWrc3qvNY1tfBJO1oGFm2tG3gVv9/b
         2V2nzAI48tJ22SLukguakCETZ5v+L0HhNfMgwKtHKwSIrAYHv2qnN32RH7cb34ac9pPB
         IhSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790263298; x=1790868098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1HbT6s9c6aFM0LJbQwaDMayMtoWgK4wRQAnAVfXVUqE=;
        b=ozHZIVYdBmfIA0o585X/4cHlmrYuCLnycm1oJxUwmi2jSwCmxarQxmrxHcZOzwk3Qp
         qIRfQZ/kNjyGuRxPUIhGAUNQHms8Z5Cuan3SICo0HTg1E6cWHgeatfuS97gr1aEwTxVM
         RGfiRyEnLe3u2XNLTD73ZqnhcrXjiS1fbiqTjAJ1LGZvPce0k4M90U25sl4h9kCK6x/F
         Pa2nCjphud4PYZebZjDXV1ezrIh1nsZV2DCyOcqg+tGtM28u8jLbRaw/mNJ5C/j8SL9T
         sEs89xFdcyV44SuaUxwb/FLDDSRa6NaXjnVnWUxwQXK6mETnvKoqX1fNWzmho1J0mMR6
         nttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263298; x=1790868098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HbT6s9c6aFM0LJbQwaDMayMtoWgK4wRQAnAVfXVUqE=;
        b=vlDksoH89noKgkEWv4hg4vggn2IvpPFpCZXxThNa5BUlk0XPY34v28WFKM7ANKj4tK
         eyMWxU/LszUlgTI8ZWO5w2XEWoWjw2gIjirgEB8nQqbF4DkpSUVsmIYr9Zsu+8DAKsgI
         ULpUCvrGNTPmxwUePlHeJ0j12NAtzd3Zoyh38k2hJd36/Bdb0LHzpFYkKv5kfksfZSaP
         3Xbz3U4bS26a7PH2pysuc1NWIIpAaWqP/X9GgvAQCgxgBLlMck4h96MYHlEuq0EXvTnV
         o8N2zAzuiwOFYV2+S1DNIFF6HMPP6ttBMJZXuE0E5XfDZnz/jMQdiLChGOrbwmdD5aCr
         xijw==
X-Forwarded-Encrypted: i=1; AKwUvBziy25pPB8pBNV1Wv65tf5rNc01IJE/gH5rKMhSb+E2zhfgsH4hetuy18CHKAETUCyaAvneWJ9H8sFyez0=@vger.kernel.org
X-Gm-Message-State: AFuF++muEMc2DQRNrBhHRXTMKtOvYL4MqjEC0lR9cPxo5Isn7+z3qJgL
	fHEdR2ivnovd8QRnjjUtQznmn1VYYXOSWpiXnfvnfNQaJmuaQd48Pf62SUCzgQdxKFPaTlHoHBe
	PsGmOFWt4512kqTgwu7/KnKNbPpNKerM=
X-Gm-Gg: AYBFou3OmLV1gADZALHmSdAKyJ1vbjNMdLSwHV0LvpnnC6ry6XcrhLbSHZbpsRcwowL
	7Vpmu5fsWkOkfm0F1WGhlhdixDX7K+Du6QXd3QnUnxYG54IykFsBVghQPkayOL1sKIdvJTOVtUX
	WcdQ/VHHEVBNqtLTYjN9/q40W1FjDovgq3/0lL4HJ7IPqM2WuCEUWx8XgqvEm+NjNu/6cZ3602m
	wTr7EfYDB0r+gS71NJSZGfopq9AScP2/ozTrQO6BgMqg6bhOEqXKlLHdWaJquehl5iys5225Pz3
	A6HuSMO+sal2PvN0SvIllgYVJ6LyvZ0thU1CI/7lPvmx5DS4+eivDdCcM0PJ8V/RfClBonMe5+M
	wVwDhF+2gd1OOxU/ijC5n7z5rNhGPCKGUITH1N68guV94Pwl6ijWT
X-Received: by 2002:a05:701b:4510:10b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-1450405cf58mr3632727c88.1.1790263297559; Thu, 24 Sep 2026
 08:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924132952.25054-1-fbeltranmillalen@gmail.com> <9c2ce6d3-46ea-4a69-a227-a5431c3447a6@amd.com>
In-Reply-To: <9c2ce6d3-46ea-4a69-a227-a5431c3447a6@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 11:21:25 -0400
X-Gm-Features: AclHuK939X-LsDc1Mw-gpXK0-LhWwyhpUJXbBj2XeAIu67VCJD_e4BSptwVLNXw
Message-ID: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc_v8_0: restore the FB location after a re-POST
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Francisco_Beltr=C3=A1n_Millal=C3=A9n?= <fbeltranmillalen@gmail.com>, 
	alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:06=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/24/26 15:29, Francisco Beltr=C3=A1n Millal=C3=A9n wrote:
> > On a MacBookPro14,3 (Radeon Pro 560, POLARIS11) amdgpu has never recove=
red
> > from an ASIC reset: five attempts recorded, zero successes.  Since susp=
end
> > to RAM goes through a reset, S3 fails the same way, and as the internal
> > panel hangs off the AMD GPU the machine comes back blind.
> >
> > The failure looks like VRAM going write-only-dead: writes are silently
> > dropped while reads still work, the driver reports success at every ste=
p,
> > and then it hands the SMU a pointer to a table that was never written:
> >
> >   amdgpu_device_asic_init()  -> 0          (reports success)
> >   gmc_v8_0_hw_init()         -> 0          (reports success)
> >   memcpy_toio()                             (write silently discarded)
> >   send_msg(0x251, ...)                      (SMU parses garbage)
> >   smu7_check_fw_load_finish() -> -EINVAL -> black screen
> >
> > It is not VRAM dying.  It is the framebuffer moving.
> >
> > On this machine the Apple firmware places VRAM at MC address 0 on a col=
d
> > boot, and gmc_v8_0_vram_gtt_location() reads MC_VM_FB_LOCATION once, at
> > init, to derive vram_start.  A re-POST -- which is what an ASIC reset a=
nd
> > an S3 resume both trigger -- lets the VBIOS put the framebuffer back at
> > its own default instead, 0xf400_0000 here:
> >
> >   cold boot:   MC_VM_FB_LOCATION =3D 0x007f0000
> >   after reset: MC_VM_FB_LOCATION =3D 0xf47ff400
>
> Mhm, interesting I'm really wondering where those values come from.
>
> >
> > gmc_v8_0_mc_program() programs the system aperture from the stale
> > vram_start, but only writes MC_VM_FB_LOCATION and HDP_NONSURFACE_BASE
> > under SR-IOV; on bare metal it trusts whatever the VBIOS left behind.
> > While the MC is still in pass-through everything appears to work, so th=
e
> > mismatch goes unnoticed.  Then gmc_v8_0_gart_enable() sets ENABLE_L1_TL=
B,
> > SYSTEM_ACCESS_MODE=3D3 and ENABLE_ADVANCED_DRIVER_MODEL, the MC starts
> > checking the system aperture, and every access lands outside it -- whic=
h
> > is why reads return data written before the reset, from a different
> > physical place than the writes are going to.
> >
> > Write the framebuffer location back when it does not match the one the
> > driver is working with, which is what the SR-IOV path already does.  Th=
e
> > comparison keeps this a no-op on machines where the VBIOS restores the
> > same location, so nothing changes for them.
>
> That is still a rather bad idea for multiple reasons.
>
> You often run into suspend/resume and random memory corruption issues whe=
n stuff like that is done and we never fully implemented blocking VRAM acce=
ss during a runtime ASIC reset.
>
> I think the more defensive approach is to do an ASIC reset on driver load=
 and use the values the AtomBIOS init function comes up with.
>
> @Alex what's your take here?

Sounds like crazy Mac specific behavior.  The asic_init bios table has
to reprogram the FB aperture otherwise the pre-OS environment won't
work.  Moreover, at some point, these registers became privileged such
that only firmware can program them.  I agree that running asic_init
on boot for Macs would make sense.  I think we already have a similar
workaround for some other mac models, probably to work around a
similar issue:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Da5be7ad8f5f0e067613e9197638f216f46252946
Maybe add your device to that existing quirk or make the quirk generic
for all VI boards with apple ssids?

Alex


>
> Regards,
> Christian.
>
> >
> > This runs after the VGA aperture has been locked out and with the displ=
ay
> > suspended, so the MC does not need to be stopped; only CPU access throu=
gh
> > the BAR could land while the FB and HDP bases disagree, so BIF_FB_EN is
> > cleared around the update and re-enabled below.
> >
> > With this the GPU survives resets and S3: the machine has since complet=
ed
> > twelve suspend/resume cycles in a single boot without a failure, and th=
e
> > restore is visible on each resume:
> >
> >   amdgpu 0000:01:00.0: amdgpu: FB location 0xf47ff400 does not match
> >   vram_start, restoring 0x007f0000
> >
> > To be precise about what those cycles prove: the kernel they were run o=
n
> > also carries unrelated local patches for this machine's Thunderbolt
> > controller, which fails separately.  This patch is the one that brings =
the
> > display back -- without it the GPU never recovered from a reset at all.
> >
> > Tested on 6.18.49 on a MacBookPro14,3.  I have no other smu7 hardware, =
so
> > this is only known to matter on machines whose firmware boots the GPU a=
t a
> > different framebuffer location than the VBIOS default; elsewhere the ne=
w
> > branch does nothing.
> >
> > Signed-off-by: Francisco Beltr=C3=A1n Millal=C3=A9n <fbeltranmillalen@g=
mail.com>
> > ---
> > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> > @@ -472,14 +472,42 @@
> >         WREG32(mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR,
> >                adev->mem_scratch.gpu_addr >> 12);
> >
> > +       tmp =3D ((adev->gmc.vram_end >> 24) & 0xFFFF) << 16;
> > +       tmp |=3D ((adev->gmc.vram_start >> 24) & 0xFFFF);
> > +
> >         if (amdgpu_sriov_vf(adev)) {
> > -               tmp =3D ((adev->gmc.vram_end >> 24) & 0xFFFF) << 16;
> > -               tmp |=3D ((adev->gmc.vram_start >> 24) & 0xFFFF);
> >                 WREG32(mmMC_VM_FB_LOCATION, tmp);
> >                 /* XXX double check these! */
> >                 WREG32(mmHDP_NONSURFACE_BASE, (adev->gmc.vram_start >> =
8));
> >                 WREG32(mmHDP_NONSURFACE_INFO, (2 << 7) | (1 << 30));
> >                 WREG32(mmHDP_NONSURFACE_SIZE, 0x3FFFFFFF);
> > +       } else {
> > +               u32 fb_loc =3D RREG32(mmMC_VM_FB_LOCATION);
> > +
> > +               /*
> > +                * On bare metal vram_start is the FB base found at ini=
t (see
> > +                * gmc_v8_0_vram_gtt_location()).  Normally the VBIOS p=
ut it
> > +                * there and a later re-POST puts it back in the same p=
lace.
> > +                * On MacBookPros with switchable graphics VRAM is at 0=
 at boot
> > +                * instead, and a re-POST (S3 resume, ASIC reset) moves=
 it to
> > +                * the VBIOS default, away from the addresses the drive=
r
> > +                * already uses.  Move it back.
> > +                *
> > +                * This only happens after a re-POST: the display is su=
spended
> > +                * and the VGA aperture has been locked out above, so t=
here is
> > +                * no need to stop the MC.  Only CPU access through the=
 BAR
> > +                * could land while the FB and HDP bases disagree, so b=
lock it
> > +                * here; BIF_FB_EN is enabled again below.
> > +                */
> > +               if (REG_GET_FIELD(fb_loc, MC_VM_FB_LOCATION, FB_BASE) !=
=3D
> > +                   REG_GET_FIELD(tmp, MC_VM_FB_LOCATION, FB_BASE)) {
> > +                       dev_info(adev->dev,
> > +                                "FB location 0x%08x does not match vra=
m_start, restoring 0x%08x\n",
> > +                                fb_loc, tmp);
> > +                       WREG32(mmBIF_FB_EN, 0);
> > +                       WREG32(mmMC_VM_FB_LOCATION, tmp);
> > +                       WREG32(mmHDP_NONSURFACE_BASE, (adev->gmc.vram_s=
tart >> 8));
> > +               }
> >         }
> >
> >         WREG32(mmMC_VM_AGP_BASE, 0);
>
