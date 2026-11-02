Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636099;
	b=P4wZzwOuTNehDduQQHStNUscv4OVPQJLdpIU7xGRPpLSQXdeo0KHTWIZRUkhJQFRNCR6
	 a4rbKclRu7c9N+CDJVk0Pz4aRzigsMCWajMn1RDVVUTfSec/+edlY4QfLAGdx0Qm/E+9w
	 JiIvBfXT4tunYF4+rPaPKTvcaBDM1twbwhXPEsDocC/Axtwq/hS6AX25xcMXvmUim+23N
	 VGNVQdn1yz7torFw5QrA2z3/o/aJmbWIwPaG4CJl2TVET+pbKY+uo7TlIzTUzVRKDfXWp
	 /SYhev6kjhOmWlqa5aYYz/5uDGSAaur33UtROp+NOvPuaq5cUvkVf4287Yn6ipF/DmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RpuEFdOA57qiMSteSsYhsgM5FdR44dmDyqhBvmhwCMU=;
	b=M3Ft5SFiKvyYXufrbrMYC0Yt9mtEJmcpHAQMdxKn6EHlzL4SUoMPUwRZAhn9/3W0+pVr
	 JgM8G6Lpc5jh+KkLyCztRCaAUyr2PwKjE5IKknhNapvG2Fi0AZfGz8BAetd+63pbhoOOH
	 59lmQrJfSbYGHM3rWW8zp2tIoLclgbgPsfn6of7uu7T4y8WwcCKQR+MF5lHf+DQpxiFvY
	 wUVXwgjpKJiaG8ihwxBhUhqqv8umcHfcly9RvlaioOcsZpw6ZNiWPQRXMDQP6SpBJeLA9
	 AmPfQBAzaC7TdLaV6hZQVdQodnOafgv5K4E/KDbjvsoVuUt6p1eelxqJWkeE59d0N3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgT70eXS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939596082616
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939596082616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgT70eXS
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1430eec0070so108793c88.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636098; cv=none;
        d=google.com; s=arc-20260327;
        b=Azq8rGUnmj4ReMhF8iR0ftEJ2zyJGJkJ2Z5fa/yCwW66uZh5oxgaAuP5yWBak0SfkY
         QqXyyz5ccWVKjZmp1KhAWcVwNWZgm0JXpxITJriOUDZxFkWfQqOQ69e32mlpPuPK7ryp
         ld9gvDu9cLPHg/D5uFazecW90G3DeP8regHWKff589JYc30uSaXceoHrShueX02zPsg1
         Lp+R2+bRbUUGx2VKL3R35bsZ1hqkoEfQe6TTkIbRgQSP4Op+3mrSlNLUUTviVLyFeFrN
         raOIumORdcF+mX5RYij+dt3CNXt05BBUNNBsp13ow013sS13hEQwIPCXNigsYeMYjEq2
         7VrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpuEFdOA57qiMSteSsYhsgM5FdR44dmDyqhBvmhwCMU=;
        fh=WTZB89gz7w4CvcK5Ntuypym0DuHGrq0h1Hi+kzezFck=;
        b=Vc3BpzWqtfKXrfL1z5pml5JE57KRbgP7k5VckQkdoVXgh8pn2RW7DODmekEArz11Lr
         o4lTYSWiO60lZH1dt0j5qWV0C9YuzUoknYFisk6eNQC9HdUvEkkLHec9bm0wUxmA0njM
         VUOUs7jPQfGiMbRU4gmQcpsqpN8IIUZLw1JwOSqgmgkP4sG7a+EUDnPS60rK7kadD4G1
         KGrxXh1mXglmEQ4l5BHxYlVGFQsDYEounXUvkb+XxmTvXxu/SwxQsbMR2Z53r5r4t9Sa
         36UMVNC7JoOjYWDM2WGS0Z2jKqiMZ9nxMACxbuQe1kwG+/YVEINzQ2hxvCqTWpLv1YUY
         PJWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636098; x=1794240898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpuEFdOA57qiMSteSsYhsgM5FdR44dmDyqhBvmhwCMU=;
        b=RgT70eXS75/abuwsKiT6GAvHxyg7xJIPSP2RQecvAnSSllGPPMl7V1fXBsxotceoGt
         Xk7sCfkTSnr5BNdA4K8x92jmX5GHECO1mkPSuZah1agN7gjapPHv5LFnIyTuB9waY3Oe
         YKaAXBRuQITiWpFRGHsLrfCgxPUZwbTZIwL1WX/pv94RN4SvrcdXPmrpZP8vtWIcW32R
         9+ByglVveUgJgBUDUZP4/SkNF8UqHIyfvi05nK6ZjdFSVINJ6s63OmW8BN9WbGxKVNya
         CF50Wp64PCy9QPFijE0YCNs562tgDFL9LrI3aqGv52kqsj3D+xQJ35+I1fYU9vb0VbUs
         KJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636098; x=1794240898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpuEFdOA57qiMSteSsYhsgM5FdR44dmDyqhBvmhwCMU=;
        b=ZPKA6ysE6Z55lttZLFVvxl6U8UwhxtqRW+GFRarp4QOmLdlHA8Zka2DhSDiEbiWsw9
         0Zb0bjPxw9hpwgkpGXD/q2Ud9Cjn0vCRaZzICQWZupoOTJPvtnMEwhmmhE2biiLFuiM5
         c5sCQI9vNxGsPbV0fQvSqCA4ahyaW8lGAqihzD0SsUY3ZTkRDYJ6OsKsqmEFB7R3pUDh
         xtIJc9KNPFtofwpvxSmjiR3Zr6BIB4rOOb8g6isp+z2v1YJB8psKzyAH++qL/Ie4xPif
         OqquoCdoF2DQMZ+tPvxNbQ5XGZxLA+pLmxGEhUoPZHUD9L2ALCP/7ak7FsYUup4TI89d
         Z9uA==
X-Forwarded-Encrypted: i=1; AKwUvByQd2iDqOXPF6/msh8MY7uACmr2wdTNO1NLRBaK0aMslA923aLb3WHPvDPBxjzKNAn65OQtNjiG//nBirM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/tP5PBSjavkOS46ryjT8QgISp8KLK+/f2q5U8fTXJesRMHkSP
	hbl4ZatOP2GiOtd4OZupSDed/kaDuvqIW5xenjwT3Ms4wdIF/YXs1uYi6SrqRQ7DckgMSUdV6+4
	l3R0Ya89JAVybO0uMFGHIOh/UL0TUtmk=
X-Gm-Gg: AYBFou0oNc25+Vy52uCmjKMLzGbrfuHPi+mvaK/qwinFjBxhSvDlxXJonOkf76tEeos
	AZuulsxJrXBf7kqZaOwzgRSFt09QwCFIVOSPKSB2q74z+ID4wLbbFinZM1Xp+BuBJVsKlX6nNfc
	tW2Pig2oYufxS3LUfktEkQ3C5Rd5yEgvhBi+ur+CHvpIDJ6b9v78wK+qUskHn1SaeSxiuPBpzJA
	W1snLr3aJQcSd6zrqQkGZQqP72wVNJ+E4vUBj0PPEijY8KKvIZ9KbmUXxVl/r8Kxg5WFeL1dcQc
	pdagqri3qUM7ouO6/oio9WDUTxEI2OKxk8YFmKv7ZMf5ml3Mvz9F85UkNUlnfFZ1shU39xvgGW8
	AKf6n4UtY19JMlukgQ72LdR/YogWaJj9pf9K3J1BrnFLYn3EuDeoDB1Ajgfdo4bG+Sg8Ye3ljjt
	8UMEGRSb2cbrD98aM8t4rU/G8kPnYfE2aQ1mzVsDQ+8I8p
X-Received: by 2002:a05:7022:b053:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-1ac500d67e6mr26290103c88.0.1793636098164; Mon, 02 Nov 2026
 08:14:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029170831.915318-1-tristmd@gmail.com>
In-Reply-To: <20261029170831.915318-1-tristmd@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 11:14:46 -0500
X-Gm-Features: AclHuK_JcRVN6W2vlVWf4f1-FWgd_LnG4QSNqF29fy2tI4WLRUhM7uUGnOkvvqI
Message-ID: <CADnq5_P9fh0dDU7-vBiBPEY8iNJ2eVZS1kojvObngsYQzb459Q@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: validate ATRM return buffer type and length
To: Tristan Madani <tristmd@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Fri, Oct 30, 2026 at 5:13=E2=80=AFAM Tristan Madani <tristmd@gmail.com> =
wrote:
>
> From: Tristan Madani <tristan@talencesecurity.com>
>
> radeon_atrm_call() copies the ACPI ATRM method return data without
> checking that the returned object is actually a buffer or that its
> length fits within the caller-provided size.  If the ATRM method
> returns a non-buffer object type or an oversized buffer, the memcpy
> writes past the destination bounds.
>
> Add a NULL pointer check and ACPI_TYPE_BUFFER type validation before
> accessing the buffer fields, and clamp the copy length to the
> requested size.  This matches the validation already present in the
> amdgpu counterpart amdgpu_atrm_call().
>
> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX ha=
ndler (v3)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/gpu/drm/radeon/radeon_bios.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeo=
n/radeon_bios.c
> index 1da6bf1c17ff3..579ba1c1f23a4 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -183,8 +183,13 @@ static int radeon_atrm_call(acpi_handle atrm_handle,=
 uint8_t *bios,
>         }
>
>         obj =3D (union acpi_object *)buffer.pointer;
> -       memcpy(bios+offset, obj->buffer.pointer, obj->buffer.length);
> -       len =3D obj->buffer.length;
> +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER) {
> +               kfree(buffer.pointer);
> +               return -EINVAL;
> +       }
> +
> +       len =3D min_t(size_t, obj->buffer.length, len);
> +       memcpy(bios + offset, obj->buffer.pointer, len);
>         kfree(buffer.pointer);
>         return len;
>  }
> --
> 2.47.3
>
