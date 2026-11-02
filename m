Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636781;
	b=tMJt7SaDSul976WsnIq3J7a30hW/jkDKMIHR2GrVikLKaXC1n8G35XdLVsAu5F+3jS2w
	 nzQ4tVu2BeT/uoibAGdJLsDnsA3PK0TaK6X+eZlTDI04J0Wg29TWAQxxY2tItal3yFCE6
	 L/ktxDi6fxgvscBsneOLvfrzZpWjlCR/FRxDLIq6qzf/EtD5WlJTvwKtwlED9tWOUkjYY
	 AgnciAktodgdVRxk40SBZ07beRLm7hEnu2QvreP97w5e6R9csekUFLS0Tk00RSXFdMpkB
	 XQCTcQ4uxePIfP+G7wQQx0BYRSpXhDXDFKQccP1Hq2SVasWFFUTlOhNkXVZdxrdpBtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qucegT0GPEVFirSiuMs+ziNH5YCrypPe21lyqCO0TWs=;
	b=21Da63xVWz2b9ZE3nxWyq3PbwZTxQKoM0HkZq9v0WzH9YJ8v2T0nnHe1fd6EhLQPluJ3
	 PPAvIeSC8QQP3NbeQTA3jbLWQPEkBzaUNykDPxm58OcxpmLGUQp2dRTh8kt7Q4c/tkAz0
	 iwkXXgoh7RT1ZtLJERpEoFhXsIDrPRlyLzhiNjsPfdeclROmV0wTM3TPPMQ/cPiLV632t
	 Bs4hF/hsb7OuV0LxMEQSxJIWFiCQVCqjykKRUgRLgKyV8Uyj2t+4DwfaB3caf42/lvbsK
	 DgSjN7+2KIwzasbivN9swG1Bwmv54QyYcvIseVVp1ZZhmBiVGZQU4P5KCNWaRkCOWzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgZvGy2n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E2606A903
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E3E2606A903
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgZvGy2n
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1397a4855beso168892c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636781; cv=none;
        d=google.com; s=arc-20260327;
        b=sdfLPFBHUNbfjlvRT3QBZ89rOe45Rp9QUhEtC92kFgPqQ1XzyuW1XRazneWtEYOQax
         EeOu+us8f8Aq8qA7Tkd+LUZo1vfX+zn9a+/vzuGvf4dW/PXIC+mXssVo1XkaFyv/sfiD
         DoWO9V2YoFAYbovt/TahUxcSBnb7dsqw/pdWD16LdRXuE5oqxZJXnAR2gs/uaqJ4drTO
         H7Huo54oP5FUnL2VlXXb6JcmIDoBauv7BDLeXZUugreqqQO/oRLKmixrCFE1sXlQbwnG
         hXqwagkwFyXc5fUeZQFwzwX7Eae0cxBDu4b1v3nI80ZkGoJRF8b6lrybda63lBgQcmdB
         uyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qucegT0GPEVFirSiuMs+ziNH5YCrypPe21lyqCO0TWs=;
        fh=tKeDonvoYaY9NiBQJDqwRJRk5nLuOC6Ic36sAsE1oCQ=;
        b=kAL9tXIGl868ehtNf+35Kw4LFpA/8LIlrfuVdO5YDjgswylbGcWRZ82eZm6goC8Ta5
         hVK0MDoCU66hfFKNtx/ShK5YPdnMT1qiO4EplKHtpmtJxL87QZXHzuH+LyviIWYD3adz
         t0q1Pfa7asszH7vNpIBgc3hrBie8wYh/hP/72nOaUlh3EQOz5oj+HOLM4FUuYkVJKVIg
         RKTZQ1nDEBVOH8j9VA78XKZ6TBehDALw85fnfyg54SWHjqK167sS9arOT9ZJ5lImdosc
         bMS3xI2v6lWnTXZ2MW5LecJ5b5rrzzJOTRSQHDyaJC2EXrkdr7ULpxW6DdCyjGnJBlCd
         seAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636781; x=1794241581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qucegT0GPEVFirSiuMs+ziNH5YCrypPe21lyqCO0TWs=;
        b=CgZvGy2nX27nxnrUArKEXhMjKS8vnJfcCy7qmKfHr9ntcTwQXIO4Cs9J0/+xV15EbG
         eK4v2aR4RZdX5Z9SM1cry8vej0Bl63wQDproT4DUJ06qGKQgT8E5xaDUzx4lvVyeolcc
         mkG6PVWkEs0hOmaqp53dbstVYxrOLle2cz1qt9jhTlYY2hNHOsV2ti40fwVBmrUDVscC
         Lu86MPrCscfEdVeFNTmwVAkTvlT7G0RF2+KVcigCCZYY9wSpWJjiFUrPl3zzHNTaeYN+
         3KHUZxyBjdnixmkH69srjt4H23fQvWX684nDQaCAlQT/OQYZ7IHF4cCJk9B93EOqpMkh
         mLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636781; x=1794241581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qucegT0GPEVFirSiuMs+ziNH5YCrypPe21lyqCO0TWs=;
        b=qRC9KIyyT0xEjWQZaF51Lm5NOW2P65KgPusTwVgWyAdm4GqQk3NfnoYdw4SEcdyqCj
         FwwbHXfwz7kdnnrMvv4Wi7XtoBNxij0yHBaA1R9uNk0CSQA9dDTfFpBCCascIQshZ4hn
         8FnF/lN0xvQyCt+5hLJ/BMriYdrooVZy8HHvsxA0pm8fOfRvvY0qhBY5P/qSIr6gS0vT
         L/A3WTjdj2A67iSHWNTTXBSjTh7lGHXJdBx5/XCoG4J9iDpr56IFgpwfDjRby4FzhDVj
         LUhd4wmPijDN5IsEt82ToqeN/c+MnTi66/3hUWL18wa4W/9nkntUGQav1MZW8YKY77zR
         x53Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGsaCw5fa4a8dDS+Vn9ldpDbGkjk5YgLn/mfBUYNz6A1LCsW2KENRhSXYsSMdAvB5PaSYgCbreXxPPpTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjgGERxwxJT5J3ogaY6ZgeL56r+NavBmbbiJr7K/WY0G6W3aZC
	R+IztWQMmP9WJrLUc/908Y/FqTz41vD82/Z1dOkJQyazM5gq5oHlPzdaM9yxChsWiaQ0Vfd0RYv
	2tszEhTNRNBepGc9dKk9LSLXgUSoKzDQ=
X-Gm-Gg: AYBFou3CkGGwojpJ9jf3ft0mA2g++StH4DmnclSKQaoOuoVfSS4NDy1h34pa2WOA7iH
	fpsffKYppNxoO5v5SmEOvwtgk/0nxRZxteJAfGBiLhAD4uY9Nn9y7M8TftY8E0PDPtoD80oRl7M
	y2bRIXos/f77mT00X4c8fK+bhLqdnAGJ+K7q3jRxRe+JaEKMReCZjq8k4zAkwCOadwwfNesfRzU
	soy/j7pz6vaF1ekZfmPtdmIChYGdESsWfsRlICQUM8uEorgQfzchzVZTKwjfYWN3ICDkV3xaGiB
	OmkaJ6wusk4hX/vLULEAfP8XKL8AgSZzb1SeToG7IcIWIFXWYyWtxlFnL/z6vNemjFN25yX14Kx
	k7yRMbMwpofLGNmIjnoYjr2dG220K8npxcvY7LE/S59A6QobtntqI5euR2Ke/ih3EGhXTAjOISL
	9cZC4+vTyaZaeJbOeZUukwznNp1UJiAHldbYXElaTkMHXe
X-Received: by 2002:a05:7022:c90:b0:127:def:dd72 with SMTP id
 a92af1059eb24-1ac5914348dmr21533874c88.2.1793636780378; Mon, 02 Nov 2026
 08:26:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMwFX_CpeF-K1-9R38Fscu7EghETOOV5FmJvd=8No7YhapvL1w@mail.gmail.com>
In-Reply-To: <CAMwFX_CpeF-K1-9R38Fscu7EghETOOV5FmJvd=8No7YhapvL1w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 11:26:08 -0500
X-Gm-Features: AclHuK9xq0E4ivi-W8VggfJkbcZCnlA03ilqfpjC2gopSzo50cdjzh-WV6hPi_g
Message-ID: <CADnq5_P-oF5U1sYWiDKGNRZOCEc5p-oOFA9zJpH69Cb2dUSEdQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/radeon: UVD GTT corruption and RV6xx coverage
To: Ted Bullock <tbullock@comlore.com>
Cc: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
	simona@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Thu, Oct 29, 2026 at 4:05=E2=80=AFAM Ted Bullock <tbullock@comlore.com> =
wrote:
>
> I investigated video corruption on my older iMac7,1 (RV610/M74,
> device ID 1002:94c8).
>
> When the decoder was reading compressed video from system memory while
> the GPU was drawing, it would corrupt video frames. Moving the input
> to VRAM allowed frames to decode correctly. Disabling graphics draws
> also stopped the corruption.
>
> Here is a proposal to keep UVD buffers in VRAM for this family of
> devices, as the driver already does for some other chips. The patch
> covers RV610, RV620, RV630, RV635 and RV670. These chips share the
> RV6xx decoder path and legacy R600 firmware, so I think they are
> likely to have the same hardware requirements. Someone with the
> other hardware would need to verify that.
>
> I tested this on Debian.
>
> I used Codex to help with the investigation, testing and patch.
>
> Signed-off-by: Ted Bullock <tbullock@comlore.com>
> ---
>  drivers/gpu/drm/radeon/radeon_cs.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c
> b/drivers/gpu/drm/radeon/radeon_cs.c
> index 2db819a..9bfd3ea 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -125,11 +125,16 @@ static int radeon_cs_parser_relocs(struct
> radeon_cs_parser *p)
>
>                 /* The first reloc of an UVD job is the msg and that must=
 be in
>                  * VRAM, the second reloc is the DPB and for WMV that mus=
t be in
> -                * VRAM as well. Also put everything into VRAM on AGP car=
ds and older
> -                * IGP chips to avoid image corruptions
> +                * VRAM as well. Also put everything into VRAM on RV6xx, =
AGP cards
> +                * and older IGP chips to avoid image corruptions
>                  */
>                 if (p->ring =3D=3D R600_RING_TYPE_UVD_INDEX &&
>                     (i <=3D 0 || pci_find_capability(p->rdev->pdev, PCI_C=
AP_ID_AGP) ||
> +                    p->rdev->family =3D=3D CHIP_RV610 ||
> +                    p->rdev->family =3D=3D CHIP_RV620 ||
> +                    p->rdev->family =3D=3D CHIP_RV630 ||
> +                    p->rdev->family =3D=3D CHIP_RV635 ||
> +                    p->rdev->family =3D=3D CHIP_RV670 ||
>                      p->rdev->family =3D=3D CHIP_RS780 ||
>                      p->rdev->family =3D=3D CHIP_RS880)) {
