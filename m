Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793108234;
	b=prBn2j5DUHkdnHDTgpeK7viL8f1E/0hLKliq0XRywqfIh6uaORKwljo/Yf0lBMoOMWz/
	 FB/PFsPMSTN2BVyz9UkhowYnAJ9Uvvz4EfsGCE9clbYe/ApBDaFDalz/ItVO+tcV2X85j
	 rCoUxtkyMDXV4gFu0/yULXSR6GLu2AfTb5MdOXlAUdAeYNlof1gNotzz1tCcB98QblpNH
	 fT/VSyzk8Z8aaeNacvdZoGmUj+G0rySAbiGqExjeC9LI9pb3HV9zP8nLYPzabejgcGsrV
	 mQMT1yG5DfV0IVSyNalreZf/HiRWhOuqRjCQaT0oUp8++jwt9HEi5JFbOYOMceD555A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FufhvRCtL/dPRhc2t8mrLa65DAQwulVvCxNep8YNhyQ=;
	b=2v13DylcR6o0tlgpDiTMmKyuSa8E9JiSZo+egiuvnzvnl3Q8D5nhyuJkojEZX9mOxjy6
	 /LibqTWhzGCKBA5MKYryg8PbuLoeUYW7nA4l37MmW6vNOHn0jkYd02qnoeOiKnl/WH0EH
	 Jyam2abz+O2dXWDXKUSisLu4/3VN5Fg+bLB+9hJpdHa6SsDrb3a1d1NnS+tTXusV7l16H
	 RTFwSvN2WxwxnnvZ4Kkx0Mq5V+K0ZuMs+2/387MicdmotAAyu6d04JAnidZqIv+c2CrQV
	 Uym9VVsthtk7zxr4PoYZcXvcwvuuYB6vL5qB0PUzo8xFb0gdGG9Uwphp/Y9CQhEKCJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g1kUemTG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BA606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g1kUemTG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3646e6de3e8so317277eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793108233; cv=none;
        d=google.com; s=arc-20260327;
        b=T7EUDKHAO3gUl8K27Q7Db752S4ZATenTzMFSfZEPZsJM7mlYz2bjB+WI98sXmm2B7C
         CskXgzhL9UzWVbPF0VX+3/rXiw3tGOsih2QIC0hIhbj1i1Wb4quUTJo9YnAd2IWmVcD0
         7bKNIaiUMzQfsL19rLnBI0nqpmkbehOROVodnBCtORi9ZUog8mG6WAGnp+fckA8wLvw+
         2AKjLjRhssSp7o3FEqTMCJmJAJJdUZ419ZzRyLHWQ0soqkruXWw1fDpgpyS4yQ5BIy00
         184v42UTW9Z6GzPzu7o9O2cvJZQ0hcEFlmBgKfmv5Aq/NktodIknCYuvxiLBUiiQph31
         ++AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FufhvRCtL/dPRhc2t8mrLa65DAQwulVvCxNep8YNhyQ=;
        fh=Tgr2s8Wo9RVETyIHRd1WdYDTGpA8DdpQB/Ff1T61Tco=;
        b=gT1iUbbMSr+nubMnooUa0LAaWOYC3kpVvoli+W/CLwuodMOC4L7RWQQF6liBk64vzL
         r0UO6BX6vlAMFnn85Q1ms3pdr3EQcd8qJd4lbi3ZWKmcO9IYWvknQc4sMki4e2RIwoBL
         IFlhZqtZqAm+ZDeIrbpQHdrsdv0QxMOxoUiPLG6B0bsKJ85ioRynmbG7HX4fz5iRpr+N
         B6tVSGibiu/T5YOljFYdketzFrxv+67U9sdLkakf6+l3kfT7LMR9dUxGV5l3o0V/FaxM
         8/nnQl8wwy6kbYxniN9ZEhqxX4WGg2mD1UgfYf4p2OXijxCs+ntS+D1vBZVFLB3gFIUF
         w7vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793108233; x=1793713033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FufhvRCtL/dPRhc2t8mrLa65DAQwulVvCxNep8YNhyQ=;
        b=g1kUemTGBljEWGG+/pPQrdT0SUxytqvZ5CqhD9Zq9K6ZdM+QF1XAHxYMKrDx9xqvOH
         SeRWZ/k9RymsKtwzIMguvaNbnLMF5yo2kIaqtfUldTBXFWPIf+lZLnB20vy8pzo3PNKz
         amRv0265/a5NBrHoAycETtDoAA2ZF9i8XHomsFze0IWpOpWNW2tcgAFy6OyhWdwyfgAT
         ROHzOszNL3WTZendNZWyibKKWrm0U+VjnUpkUeXYIneFMOR3lbvFILAG2A9l12MhmoGL
         Wu2tZs7rSHEw16Dok7toUJ8gCnjaVCQLieuS0n0mZrdVhHvtk4f1bYZfsvCy0xdUdhdX
         tvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108233; x=1793713033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FufhvRCtL/dPRhc2t8mrLa65DAQwulVvCxNep8YNhyQ=;
        b=HsD0+O8BR0tSVI8b5PJWH5Wk7d2wR/34pBaq43jdTH68Vvj0a5PGjPHZF6UUT0a7mm
         YkakxIeXv7AClNSOiVy3fYaUzsq6J5OLeX2rHvEt+nvRvBU3SPPAjk4ZJ99ud0qwo1Ph
         H846Knif5WMjI2ti/fMayQzMBmTLW0I8kS9wX44GDoyeSrE1FR8OiO4h+fcnilHBhu8V
         q2HPeZM2HgQJOVCSGJ7gh7bhwRTlvSCMpZuKamOyMgnsJ1ux18akOXNGJlaRfvV2LCAl
         +qtOe2oN5IIswL1sgVJREgvzptkzUZA9Q2xDwTvJiEPxZ2F3D0CIf7/lzXRGBH80+zT3
         hciQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4MGjkpNrAjvwdwj+AFnuOyIAY4VKRoKwNFSqBMCBDcpWvliNaK0r8J8D8nc03jczoTnlBCMMBUh2qGxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGiC9RtaD1HHKxiM9FjIDGCF6QgR54Y0sGn0lOghejXQNxgBo/
	QC/jLOYMEhHuS/YYxiF7ehZ8bj/O4g5Ryp4o9G01EkaYcN/bhoYAnjJiulUqUkftbprZDmKp9ct
	Zg4SwWpJopY7WKyPodsnMpDtnQF7OmgU=
X-Gm-Gg: AYBFou1pspBsPsLQ+3zBuOfD/flodrbyaDGBrmML1slXi+leCHs/CF/Lob11lldk+3q
	meaDDkvrHzmEcDNLQRMjSczPRZd8IBCqkh2CGfrwUkZR6Rm1gyVDxmk3WUFwWd/8jaj59X2B/uV
	8Po1Kf0nilkbD4+o6Kz4gt1Czrlq4A3xvt/SMympfmXYLGKE8myyLzizxG3DugswiITtxk/jttM
	+yjDjxLwT9TR8sLsR9f2aNCVKoGE5Xe8fF1UQeF/EiCJRVBOTIbsHRO+VOnytS8OOQcsU+MRskb
	S5cyL2t9tMtoOzz9drwctGvAnPjG3SFJBvMx7h/2dvpzflKUdSFhUMMlGm9Fk9b2s+YkMy4Oug4
	ZyjSHYaiojDQYHyfwpVHOjZs/FKWbyfs7prwbpvQF/wYkKt1tt1o1nBGyvshZ2cnrudL3rVP3sS
	mYF/ojrgJ+QYwZxscRlFpp3c8=
X-Received: by 2002:a05:701b:430a:b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-1991b142105mr20151825c88.0.1793108232858; Tue, 27 Oct 2026
 06:37:12 -0700 (PDT)
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
 <6f79a3e2-5510-4018-aabd-45fcdf5dcbb3@amd.com>
In-Reply-To: <6f79a3e2-5510-4018-aabd-45fcdf5dcbb3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 09:37:00 -0400
X-Gm-Features: AclHuK-wHTgKpLhkTxBfx8DFmsearMvG8jH9zbeIpPdOt_OZOMlG9BJnbkLKU4I
Message-ID: <CADnq5_OTLQuD3B6-VUgZv6wGjhFNY_U77wqdv5Y+e25+O0B2ZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K iMac
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Richard Lane <richardlanedev@gmail.com>, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:16=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/27/26 07:57, Alex Deucher wrote:
> > On Tue, Oct 27, 2026 at 8:21=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 10/26/26 23:46, Richard Lane wrote:
> >>> Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
> >>> VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated EF=
I
> >>> framebuffer.
> >>>
> >>> Override the stolen VGA memory allocation size to 64 MiB when matchin=
g
> >>> PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
> >>> framebuffer corruption during boot handover.
> >>
> >> Hacks like those are usually a big no-go.
> >>
> >> Why is that framebuffer handling not working with DC out of the box?
> >
> > The GMC IP code reserves the memory used by the display hardware from
> > the pre-OS console.  The gmc get_vbios_fb_size() callback looks to see
> > what display viewport was set by the pre-OS environment.  If the Macs
> > need a workaround, that's where it should go.  Since these displays
> > require multiple display pipes, my guess is you need to double the
> > allocation in that case since the current code just checks the first
> > pipe.
>
>
> Could this also be a logic error in that callback?  Would it be worth
> double checking all the register values in that callback for this system?
>
> I know for example there are a few different IP specific implementations
> in gmc_v9_0_get_vbios_fb_size().

Not likely.  I suspect the issue is that these systems use two display
pipes so we only reserve enough memory to cover half of the display.
On PCs the vbios never sets up MST.

Alex

>
> >
> > Alex
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
> >>>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gmc.c
> >>> index 4204c3c750a8..8b196fbfa724 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >>> @@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struct a=
mdgpu_device *adev)
> >>>          } else {
> >>>                  size =3D amdgpu_gmc_get_vbios_fb_size(adev);
> >>>
> >>> -               if (adev->mman.keep_stolen_vga_memory)
> >>> +               /*
> >>> +                * Apple 5K iMacs report one 2560x2880 tile in VIEWPO=
RT_SIZE
> >>> +                * while scanning out up to 64M across the relocated =
EFI
> >>> +                * framebuffer.
> >>> +                */
> >>> +               if (adev->pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID=
_APPLE &&
> >>> +                   size =3D=3D (2560 * 2880 * 4))
> >>> +                       size =3D 64U * 1024 * 1024;
> >>> +               else if (adev->mman.keep_stolen_vga_memory)
> >>>                          size =3D max(size, (unsigned)AMDGPU_VBIOS_VG=
A_ALLOCATION);
> >>>          }
> >>>
> >>> --
> >>> 2.55.0
> >>
>
