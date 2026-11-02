Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631211;
	b=0+HHpN76agqMnyCT5sPJsYW0SBzOwKhqb4C2ffkF26RqbwUBiC8ru7eNwl/u6f9I/ye0
	 hpTHjjQwRHu/TUc8ZuPDPbwWihKzj06Q/5cIbPccMpa0qNMM/HJxmn1Nm2A+fRsLJ9FOn
	 jr9tBXkf+Jg3QYfIZsel/AbN7SM/5wwVfuNPPPyh9EElC5/OvwLOwjnspc6BJ/kSsjCds
	 5f3Dg7tKhltxIDmXCR2zIQpr6fGOEDkZ0AWf+RKgAK2/3MmtnXY7bzJMNZm4heCpYqZ9a
	 Uz42903nQcCF1SoOHljFQ3RNCV9n0yy7ipWL1/OUrAbC1PfVNQVgMTlfs7V1Nt9+cQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
	b=QHVio2ijuNX5RnWUeoLj+8fn047seeP+IUh+yjOILOZggMOqA044ogbE+oAqEFoP4kvS
	 HZjCWFrtUdUv/XXnpPfahyBGW4m6eh4PzVbomUwXZ0jOJvdBJ5cGB+Ja45U6fixs61kjX
	 oMNjPGGQGbUc8mYsSd2ePxHpPyN1/+54w6sFPvLR3xRcIPPXOMCBdj2y+uEYxcWVzrBPI
	 JFGeCfLybxadXxAJ1Fjxo8Lm0we2BvyFsRY9y6HeJr45yai4c05Mdo0kjgTckqsP+YPdd
	 mCiYrTF+x197XfybuH//0A4Z4qWfTzGjE1FXQpBxJS7aXlsV+maFSZtt8yz1gX5V1cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxTWtTBP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802C607992E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D802C607992E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxTWtTBP
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ea929b2933so144391e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631210; cv=none;
        d=google.com; s=arc-20260327;
        b=VJk0fQxeSzCkvuZGd2WIl8NqYcNnO41npJqs3894eG3AtgIi9ElC4jI2qbb+5x9Jwg
         Y5CzWzm9WVwWzWLRF6zVUx/iJbownl6Aaz6hO/uYq2p49Qv/WwTC7l3/PPPKkXBNy4+Q
         GMn7REPNLc+R01J3lVuwuRRMCOKz7RukIvaBHSm5eGqAwZmUwH4Mfu11DIUajiq3uerA
         es70Z2DUaeGG5QKjF+dfMzQYWdQACKeSuI/PNezql+YHDyzaEUZVt2JW1lKOTHLvcSeO
         UiX0ZK1fGWeIBxTEL3YiXPTe1ft/8Kq2EIy7MJt7cZMMthWWJt/XvilC2MDUSEPfbZ5D
         lGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        fh=zjW+/cokUM293QmWYQYSHVsxDQSTchFseHzYY8N4u6s=;
        b=HspHpUvANHxOvO/yx1P1nCDtjrZEhGYP3Yh1Cu65YdeI9TjHXY0183EAz1JWlwiA8k
         tq88ojSRB2LI8odp5TVEyHjNnFiVdfxAEUSE8M3wmkxdqGQYf1eG64Znk+74Ysf+w0xg
         pe2ZcdX8Vi8mWVnb72C2UFf3LjRuqDL59CW1QqwBJWrYYBwikf1JTdSw1d7QcBJOFAV1
         pSYG61xUa4OWIg+3q44MrGuKhvv69xtPQdQ8RKYlNeZaSj98KhaawuCyh5+WPwNSrmSy
         3OMi4Ug6lazceq49sBYb4PT7/MzlHds9gJLLU+0anI693u4+F88o8yVxWXrNv6UZzsMk
         7Efg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631210; x=1794236010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        b=nxTWtTBPKVG7QfSMYQJen9k50Mp9t9o+/6JDWuNE/ywHN7dry6hA2Fp9HEnXuD7wjj
         b2FitoYa2STOdz0f2ZAU0QL9NOBa0pnLydIcfj6UNWETSD629kaBG/2t6aiTgDo2Ivz8
         GIlF/O9b9MM1Ps10MVjKLIfNBlpr5v04voyRYLdk2ZmFm7y24Td0NksruUlRKrpNiaRJ
         PJZDFeCEwE0dKYbkLTWVVRBLpc46BKw40UGa1tbb/TTtr6qFyoD/K6GcMsUfP9nb6UHx
         MCKMpZ8A44yP5WQflREMb3bIqAhfntIF0qn54w5iSUboesJ4k6Aq/GdMdkVShjgpCzS4
         BY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631210; x=1794236010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        b=gYfqN1akI18cn4MCL/DypD9BA8In8hOhLTsBnxFU4KIL+3LCh6PmQdC/GoSKkT6TFH
         5a5QJb2rd/3GxmlqEQuGsdE0HjO/uJvkFRlwKmUTthzYKjBBzK6jvbQcBtScfD1flPWD
         LK3qHszQOm3MBqbq+tHEAh4vuZTQGrYfFUCi6/O3iPwB8V+UmIt/8Su+663qINnCftTn
         dz6v+TfaUDOdk9qKVmzlqmSA2tsO8lCjMQVCkZacMUqxryvbNKEFw5WcwickbApeQWAV
         u7YiSAabOnbKW4s/7YEGnVERPq8vivx2N/lglsbaKuzLnSKvtfk1zaRk30v70gUyvgTV
         KQew==
X-Forwarded-Encrypted: i=1; AKwUvBzZCMxONVqFX4vC+y2EqgRR4eycAHI/4vsRKMJQMek5FmJaT9WI2dKdqGt13JbgS6A2WQvA7EUwo3hE46I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t1ar4Rtx0U8uCl5qGzSs313Ay4hI7Nqza78OZYn0pFkNftgw8
	JKyPsh3CEoda0j/j3UdomcsXSyj/R3LVDFBr2jSzfC6VwEqjoLad8XHK5kpxPjvMRAEiJZ4xc7B
	n8VAxin0lPStOz2C/Q0XCsemYtWsfxZU=
X-Gm-Gg: AYBFou0DkAMe/cpSHwwW7GXu8PHnZya75xfKo84k951VKuJJpkfN/j6YPICiob2N+6i
	cV8d4yyO/BW3HCmSQndLbbOdTZKCN2KAqzPAfJ53VBmwvF8A5hPx5HcDX4DCH7QYZ8PAOSuOaZY
	7ARlPKn4LY8qvFIWBLqsXif7sX+ocT24k/LSjeh58eqFKKfy3xfksdwvrSXcGq3i4BewDkqWSL9
	dYIo1mysjtqbf/ooCWYe+iTbRpSCcHPenM2j/M1jsXk0GjD3b+gt564nuYQ4cTswPXukMvHao0H
	tklh5+5TpXqUXxga/niBYPol8cifH28Fd9xpfbB8UuGi5ushWHt1SNzLNbNi37IurDdCPCtVDsR
	+KyKF7FC377UzA+AVPf1vzEo704hZrK3TF/IUtXzrAviWNfqcR1oXdIcd+VFd6lRPPVCb1TtVYw
	lsb1W/tG9F2X7TPeTkZWhxyUQ=
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id
 71dfb90a1353d-5ec6896981emr4303924e0c.4.1793631209491; Mon, 02 Nov 2026
 06:53:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.net> <sashiko-outbox-191902@kernel.org>
 <2630FE08-2F46-4D29-AF3C-DD9EF2DE581E@gmx.net> <sashiko-outbox-192131@kernel.org>
 <3CAB8D41-76B4-49D9-A4B4-6C78A93296C3@gmx.net>
In-Reply-To: <3CAB8D41-76B4-49D9-A4B4-6C78A93296C3@gmx.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 09:53:16 -0500
X-Gm-Features: AclHuK8wHgKFAL9IE6u51OD-FgMQVUF63LQs5DMX6Z93wgGJFSyEsyc3E1Nf9Ac
Message-ID: <CADnq5_OP7RLsj_RgEX9UN06x7_9wVWMX9FzTCP6+Je0ogxb72A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
To: Matthias Kesenheimer <m.kesenheimer@gmx.net>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, alex.deucher@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:11=E2=80=AFAM Matthias Kesenheimer
<m.kesenheimer@gmx.net> wrote:
>
> When multiple cards share the same PCI device ID (e.g. RX 6600 and
> RX 6600 XT both use 0x73ff), the VFCT table contains separate VBIOS
> images for each card distinguished by their bus number.
>
> The current implementation iterates VFCT entries and returns on the
> first device-identity match, which may not have an exact bus match.
> This causes cards to load the wrong VBIOS image (e.g. RX 6600 loading
> RX 6600 XT's VBIOS), resulting in incorrect clock speeds and
> potential system hangs.
>
> Walk the VFCT table in a single pass, preferring an exact bus match.
> amdgpu_acpi_vfct_match() returns 0 on an exact bus match, 1 on a
> device-identity-only match, or -ENODEV on no match. The walk records
> the matched entry - an exact bus match ends the walk immediately,
> otherwise the first device-identity match is kept as a fallback. The
> VBIOS is then loaded and validated once, after the walk, and the
> bus-mismatch notice is emitted only when that fallback is actually
> used.
>
> Changes since v2:
> - Load and validate the VBIOS once, after the walk, instead of
>   duplicating the kmemdup()/check_atom_bios()/amdgpu_bios_release()
>   sequence between the exact-match and fallback branches.
> - Only emit the bus-mismatch notice when the device-identity fallback
>   is actually used, avoiding a false notice on multi-GPU systems where
>   an exact bus match exists.
>
> Signed-off-by: Matthias Kesenheimer <m.kesenheimer@gmx.net>

This should be fixed properly with this series:
https://patchwork.freedesktop.org/series/176969/

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 66 ++++++++++++++++--------
>  1 file changed, 44 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_bios.c
> index f9315e0472fe..d69f8df87249 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct amdgpu_d=
evice *adev)
>   * the bus numbers disagree we accept the entry if the device identity
>   * matches.
>   *
> - * Returns: 0 on match, -ENODEV on no match
> + * Returns: 0 on exact bus match, 1 on device-identity match (bus
> + * mismatch), -ENODEV on no match
>   */
>  static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
>                                   VFCT_IMAGE_HEADER *vhdr)
> @@ -460,11 +461,7 @@ static int amdgpu_acpi_vfct_match(struct amdgpu_devi=
ce *adev,
>                 return 0;
>
>         /* Bus mismatch but device identity matches (PCI renumbering case=
) */
> -       dev_notice(adev->dev,
> -                  "VFCT bus number mismatch: table %u !=3D runtime %u, m=
atching by device identity (vendor 0x%04x device 0x%04x)\n",
> -                  vhdr->PCIBus, adev->pdev->bus->number,
> -                  adev->pdev->vendor, adev->pdev->device);
> -       return 0;
> +       return 1;
>  }
>
>  static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
> @@ -474,6 +471,7 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_devic=
e *adev)
>         UEFI_ACPI_VFCT *vfct;
>         unsigned int offset;
>         bool r =3D false;
> +       GOP_VBIOS_CONTENT *vbios =3D NULL;
>
>         if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
>                 return false;
> @@ -487,8 +485,9 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_devic=
e *adev)
>         offset =3D vfct->VBIOSImageOffset;
>
>         while (offset < tbl_size) {
> -               GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
> -               VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> +               GOP_VBIOS_CONTENT *entry =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
> +               VFCT_IMAGE_HEADER *vhdr =3D &entry->VbiosHeader;
> +               int match;
>
>                 offset +=3D sizeof(VFCT_IMAGE_HEADER);
>                 if (offset > tbl_size) {
> @@ -502,23 +501,46 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_dev=
ice *adev)
>                         goto out;
>                 }
>
> -               if (vhdr->ImageLength &&
> -                   !amdgpu_acpi_vfct_match(adev, vhdr)) {
> -                       adev->bios =3D kmemdup(&vbios->VbiosContent,
> -                                            vhdr->ImageLength,
> -                                            GFP_KERNEL);
> -
> -                       if (!check_atom_bios(adev, vhdr->ImageLength)) {
> -                               amdgpu_bios_release(adev);
> -                               goto out;
> -                       }
> -                       adev->bios_size =3D vhdr->ImageLength;
> -                       r =3D true;
> -                       goto out;
> +               if (!vhdr->ImageLength)
> +                       continue;
> +
> +               match =3D amdgpu_acpi_vfct_match(adev, vhdr);
> +               if (match < 0)
> +                       continue;
> +
> +               if (match =3D=3D 0) {
> +                       /* Exact bus match wins - use it and stop scannin=
g */
> +                       vbios =3D entry;
> +                       break;
>                 }
> +
> +               /* match =3D=3D 1: record the first device-identity match=
 as a fallback */
> +               if (!vbios)
> +                       vbios =3D entry;
>         }
>
> -       dev_info(adev->dev, "ACPI VFCT table present but broken (too shor=
t #2),skipping\n");
> +       /* Load and validate the matched VBIOS once */
> +       if (vbios) {
> +               VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> +
> +               if (vhdr->PCIBus !=3D adev->pdev->bus->number)
> +                       dev_notice(adev->dev,
> +                                  "VFCT bus number mismatch: table %u !=
=3D runtime %u, matching by device identity (vendor 0x%04x device 0x%04x)\n=
",
> +                                  vhdr->PCIBus, adev->pdev->bus->number,
> +                                  adev->pdev->vendor, adev->pdev->device=
);
> +               adev->bios =3D kmemdup(&vbios->VbiosContent,
> +                                    vhdr->ImageLength,
> +                                    GFP_KERNEL);
> +
> +               if (!check_atom_bios(adev, vhdr->ImageLength)) {
> +                       amdgpu_bios_release(adev);
> +                       goto out;
> +               }
> +               adev->bios_size =3D vhdr->ImageLength;
> +               r =3D true;
> +       } else {
> +               dev_info(adev->dev, "ACPI VFCT table present but broken (=
too short #2),skipping\n");
> +       }
>
>  out:
>         acpi_put_table(hdr);
> --
> 2.56.0
>
> > On 31. Oct 2026, at 21:51, sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [Medium] drm/amdgpu: changelog and Signed-off-by placed below --- sep=
arator
> > - [Low] drm/amdgpu: false bus-mismatch notice in amdgpu_acpi_vfct_match=
()
> > - [Low] drm/amdgpu: duplicated VBIOS load logic in amdgpu_acpi_vfct_bio=
s()
> > --
> >
> > commit 02e5f189d060ccb33fa88a19690736b51eba300f
> > Author: Matthias Kesenheimer <m.kesenheimer@gmx.net>
> >
> > drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
> >
> > This commit modifies amdgpu_acpi_vfct_bios() and amdgpu_acpi_vfct_match=
()
> > to walk the ACPI VFCT table in a single pass, preferring an exact PCI b=
us
> > number match and falling back to the first device-identity match only i=
f no
> > exact bus match is found.
> >
> >>    drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
> >>
> >>    Thanks for the review. Addressing both points:
> >>     - The unused fallback_vbios/fallback_vhdr are now actually used: t=
he first device-identity match is recorded during the pass and loaded only =
if no exact bus match is found.
> >>    - Collapsed the two passes into a single table walk, keeping all ma=
tching logic in amdgpu_acpi_vfct_match() (returns 0 exact-bus / 1 identity-=
only / -ENODEV none). Matching behavior is unchanged from v1.
> >>
> >>    The patch works on a live system.
> >
> > [Severity: Medium]
> > It looks like the v2 review reply was placed above the --- separator, w=
hile
> > the actual commit description and Signed-off-by tag were placed below i=
t.
> > When applied via git am, everything below --- is stripped, leaving the
> > commit without its changelog explanation or Signed-off-by tag. Could th=
e
> > commit description and Signed-off-by be moved above the --- line, with =
the
> > v2 changelog notes below it?
> >
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_bios.c
> >> index f9315e0472fe9..ef9fd98eb9e1a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> >> @@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct amdgp=
u_device *adev)
> >>  * the bus numbers disagree we accept the entry if the device identity
> >>  * matches.
> >>  *
> >> - * Returns: 0 on match, -ENODEV on no match
> >> + * Returns: 0 on exact bus match, 1 on device-identity match (bus
> >> + * mismatch), -ENODEV on no match
> >>  */
> >> static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
> >>  VFCT_IMAGE_HEADER *vhdr)
> >> @@ -464,7 +465,7 @@ static int amdgpu_acpi_vfct_match(struct amdgpu_de=
vice *adev,
> >>   "VFCT bus number mismatch: table %u !=3D runtime %u, matching by dev=
ice identity (vendor 0x%04x device 0x%04x)\n",
> >>   vhdr->PCIBus, adev->pdev->bus->number,
> >>   adev->pdev->vendor, adev->pdev->device);
> >> - return 0;
> >> + return 1;
> >> }
> >
> > [Severity: Low]
> > Will amdgpu_acpi_vfct_match() log a false bus-mismatch notice when prob=
ing
> > the second GPU on a system with multiple identical PCI device IDs?
> >
> > When amdgpu_acpi_vfct_bios() walks the VFCT table for the second card,
> > amdgpu_acpi_vfct_match() first encounters the entry for the first card =
on a
> > different bus and immediately prints:
> >
> >    dev_notice(adev->dev,
> >               "VFCT bus number mismatch: table %u !=3D runtime %u, matc=
hing by device identity (vendor 0x%04x device 0x%04x)\n",
> >               ...);
> >
> > before returning 1, even though a subsequent VFCT entry matches the sec=
ond
> > card's bus number exactly and is used instead.
> >
> > Would it be better to move this dev_notice() out of amdgpu_acpi_vfct_ma=
tch()
> > and emit it in amdgpu_acpi_vfct_bios() only when the fallback entry is
> > actually selected after the loop?
> >
> >>
> >> static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
> >> @@ -474,6 +475,8 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_de=
vice *adev)
> >> UEFI_ACPI_VFCT *vfct;
> >> unsigned int offset;
> >> bool r =3D false;
> >> + GOP_VBIOS_CONTENT *fallback_vbios =3D NULL;
> >> + VFCT_IMAGE_HEADER *fallback_vhdr =3D NULL;
> >>
> >> if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
> >> return false;
> >> @@ -489,6 +492,7 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_de=
vice *adev)
> >> while (offset < tbl_size) {
> >> GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char *)hdr + offse=
t);
> >> VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> >> + int match;
> >>
> >> offset +=3D sizeof(VFCT_IMAGE_HEADER);
> >> if (offset > tbl_size) {
> >> @@ -502,8 +506,15 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_d=
evice *adev)
> >> goto out;
> >> }
> >>
> >> - if (vhdr->ImageLength &&
> >> -    !amdgpu_acpi_vfct_match(adev, vhdr)) {
> >> + if (!vhdr->ImageLength)
> >> + continue;
> >> +
> >> + match =3D amdgpu_acpi_vfct_match(adev, vhdr);
> >> + if (match < 0)
> >> + continue;
> >> +
> >> + /* Exact bus match - use immediately */
> >> + if (match =3D=3D 0) {
> >> adev->bios =3D kmemdup(&vbios->VbiosContent,
> >>     vhdr->ImageLength,
> >>     GFP_KERNEL);
> >> @@ -516,9 +527,29 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_d=
evice *adev)
> >> r =3D true;
> >> goto out;
> >> }
> >> +
> >> + /* Device-identity match (bus mismatch) - record as fallback */
> >> + if (!fallback_vbios) {
> >> + fallback_vbios =3D vbios;
> >> + fallback_vhdr =3D vhdr;
> >> + }
> >> }
> >>
> >> - dev_info(adev->dev, "ACPI VFCT table present but broken (too short #=
2),skipping\n");
> >> + /* No exact bus match - use the first device-identity match */
> >> + if (fallback_vbios) {
> >> + adev->bios =3D kmemdup(&fallback_vbios->VbiosContent,
> >> +     fallback_vhdr->ImageLength,
> >> +     GFP_KERNEL);
> >> +
> >> + if (!check_atom_bios(adev, fallback_vhdr->ImageLength)) {
> >> + amdgpu_bios_release(adev);
> >> + goto out;
> >> + }
> >> + adev->bios_size =3D fallback_vhdr->ImageLength;
> >> + r =3D true;
> >> + } else {
> >> + dev_info(adev->dev, "ACPI VFCT table present but broken (too short #=
2),skipping\n");
> >> + }
> >
> > [Severity: Low]
> > As reported by Sashiko on v1 [1], this isn't a bug, but the kmemdup(),
> > check_atom_bios(), and amdgpu_bios_release() sequence in
> > amdgpu_acpi_vfct_bios() is still duplicated between the exact-match bra=
nch
> > inside the loop and the fallback_vbios branch after the loop.
> >
> > Since vhdr is &vbios->VbiosHeader, could the loop simply record the mat=
ched
> > GOP_VBIOS_CONTENT pointer (breaking immediately when match =3D=3D 0) an=
d run the
> > allocation and validation once after the loop?
> >
> > [1] https://lore.kernel.org/r/6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.=
net
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2630FE08-2F46-4=
D29-AF3C-DD9EF2DE581E@gmx.net?part=3D1
>
