Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416862;
	b=p7LI6HNhjMaQkQpYpXtS1nQrKJX/MrYjdsI9GUuOWAcXUeMnc1Kg/PUWyGhcXZFEWArH
	 28arrC+OQqVnX3DAgXUhR/WqmbZg9vRWrzPX83TW0ROxzhl1cE2JJr/0KeONnXcM9g9JB
	 FLnXZn8Jvw0HaoxG6SV3musftQLA1CskhmhlQO2z7mm7zjf+iGGdX0BSC5EAxULh0GImf
	 Lv95xd1kmB3TxWm1/Lh6vTi/hUGNOYpknCMXPXehdbUHZTQakdzc64hDIW6+XBB5VFDBs
	 +imfPmtkPDd0pPBaqLSyqk15Mn7lsQWAouVQVX1HaibU1bO1EeQCFS04d0YADTK4cBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m8C3iSuJZb/bfGc8EsYwKela7J4KFddbxGMaPc1LKNI=;
	b=T6PCdAaaTCz5M3auAOH0e6fHZOPyKOl6BaZALOdczlMEir4f1LhuwJVDzSqYWZethrZa
	 x5LWVE0cwgQRYg6blcycfETIOu352H4T5CLwdOJjHIB8RG50t/FtpxJ2GCAq+IQR3e2iV
	 TSv9+LqAao7LWS3Ax993po5RvhBqkHFkvs2bHh2HN4D+W2T48K2DBXlCSO87qFe6RqZTA
	 0Jjas9QqgVkD9p0rdIIsQAtigYUhzhZkXu2giXz9UCVYWq5jWka7jHYgHJWx2dyTwunOr
	 PbbqY4xP3RwR6buwzony8YhKYGiXVAxmnzGWBpt35u6upmazRsyLELNH7HlrcKrS1PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yu0tahuo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15DB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15DB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yu0tahuo
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-372cba0ecf9so85464eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416861; cv=none;
        d=google.com; s=arc-20260327;
        b=Sk8WmxEFwFezTYseUJjRrZ+5aTljXK2DJ2/1DzxVZTRiMqpTmrT0nwTZovAEQ1G5Ac
         eo3LQmZYoRbE4Nlm06U+l3CDweVTZtIguq7l/jzNYFxBMcmFdJw54Hcw7yJ8+GM6AcQO
         HTBxR/EUK5iKX+H4CSyIltfyCYYkha0bjKwtT8TMcfZpQOZ9ZumMwGVzVzWFSCkKiVtA
         b7qM1nxDKVlqQX6qFDK9c0E01bHf4ZJOVnu8jFsSNBbHxQAoEAaxutd8ZLwn9P7IS3eB
         zK8RzMnZC3OGhtxNV3IKPvXXTCcbPGPfrr4rHlmChusxFZXiC4FvICbiCZHEV8LluLuH
         0rJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m8C3iSuJZb/bfGc8EsYwKela7J4KFddbxGMaPc1LKNI=;
        fh=ov6HcoEUjbtcHy4nV6aozD5vwkgFcdISk/t7CsO1B98=;
        b=jQYY5/pnYYfpJorPbWZ9t8gY2JJaqRAgkBLs0odgvr7wqHU8Xg5VT3Y/0dzM3OD304
         rGWo2KrtCSYS6WJcPLult43YsHmNMAIlR8Ui6E2jXlv019+YLFhgYW+q5+bzV4DPQ1ll
         Sdn7JnDuf4rvVuh8OR6Lf70sH6jBwKUxMtPmcGHy7VHCq0N5ESrltQIodGTI5XTknCpC
         UDOOstWEWpj6l7A+j9g5VAMRfDyMGWcitjytP4n/tLokqm7oXcV5UeXjVBuTZDUGpapw
         r/UrII1zL21OIzNV0uaIirsMgya/8D9Ms8QDgvz4wY/3LcRNcJTfTXe545YfA1KyA4T2
         wl3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416861; x=1795021661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m8C3iSuJZb/bfGc8EsYwKela7J4KFddbxGMaPc1LKNI=;
        b=Yu0tahuocuESYqefq+y7fSQYzAxt4lPHSsg5PGKLsWgwc3nznCgyZoywvLPhsnWXaL
         naTEK8iktIklEsNs6WGYObHqJmu/w/VY5IxwuHHnJU8DdKNH6RS+5MSDELQhLRfPbJN7
         U6khKuJMZ6CmYJYj/TiGT50rf1I6yS2tca1y6tLxdM8jXW8R/+XwwtLonfE6zrMyXDeQ
         54ScTlscyGh73yv9Gg2joc4Qqvrmb8Xf+b5cQ3d0XSzwYmmKneN9p2fbsDvPZA/sjCAK
         +hmhfjJaSH21k1NVqzl5XRhA8F8l2/QZD2M7ssSNUHE1mC3vzZxMKc6gYcx6Q19DmKKR
         mx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416861; x=1795021661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8C3iSuJZb/bfGc8EsYwKela7J4KFddbxGMaPc1LKNI=;
        b=QJ8foOWyPcR3Uvp+9o4BIynqUN9iBufkGdqDGBneqDkdQRelnAHVjQZWP9QoQ4bpx1
         RWYhSjB1KVoXNLsu0NraQqU0+UpkG+QAIH7scENwAxfZpOvV3cQbNNDMeEBDqyW2PkIc
         pYm6h6ZO5YK4Ccd/BredFVsTozon6rxgFfcSHdhRTTuNGaQLl4Lf6x8U3st5RLF6selM
         BQ3c1fZYVoU2VxcJdla4LB6/NCf28abinEGbQWVHbxfSqDllojJSKhWzGxA+lFhPeNlw
         NrGnZsXfo+QhV0ooQw14BcnEVqzXT+W07PcQu/PAM6uFNxOMlhWDtDO9Ky1f18kdTww2
         gQfw==
X-Forwarded-Encrypted: i=1; AL+hErGzsVV4BsqBCdEAHCOahyUx5ktWz3fdW73UKiiQnef1JK7I//rm3QYyRYzm5vPBHBfSncWy3+AknpH9jgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+52+p4VppuPKuGOKpI7SczCVzD0QYM6xqcMeCciUpjZVjD0vQz
	7+fyKwGqmsG+Xx+z3pwM2HkK2Tv6Y7YHltd/XeawuA8oK9eDX3nkoEM7eHC8fXZe7pms9/RNbKQ
	s1is08r9ah8WINQt3wdo7zxAHLafwbT5mIw==
X-Gm-Gg: AYBFou39JdxIM4lqtR4TX+/X79A+9rby47dYrqk/Lqm1KVpoAMbbbm5gh/Y+PU0jlWR
	+fiWUrTScO6qJQGnv74Hr7NEWbmpGhxze+qCRpnLR4aWI3F9ihkV18Q1IvOkpygdM7esQ9AvfVU
	7XSIio7gltox6T+CHOLeIPD6oWHBfSYkheiGgXnZ/MyqISaLUEyj9kjpgn3NRbbcUvbzsj+OBop
	H6xf/oXEJ7jqehlwADMNPQGOB82OHBjpOxsj3TDuulLOGF87lSvjMijHiIdgrWpIqu9kAotE7KC
	YPwPSxWwhYFqwG4lmlV444J+x67XIZrLFdPw61cEQM6Noc0r8qiqZdi5m7lOryNCl0qucWwCLEQ
	YwwCNqvEbzwJ7MEyDdsxyqGvlniv+0gqevBxpBRfBqTpR0WsHa31e849GQQ922hLbQHqwBvBMG2
	zgZltRNBg2ur0rockfJX+3/iiSr1w7JatnltmsGbgyZoS50g0JK9FWFNNSVDw=
X-Received: by 2002:a05:7022:3a86:b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-1b3c01600d4mr4530976c88.0.1794416860548; Wed, 11 Nov 2026
 09:07:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109155215.3946844-1-amisiurov@cloudlinux.com>
In-Reply-To: <20261109155215.3946844-1-amisiurov@cloudlinux.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:07:28 -0500
X-Gm-Features: AclHuK-_9BWEPd6xXKjNjzph_kbOJc93rFAg-o-qHWWs0SN7OfCKCcfKPgpijZs
Message-ID: <CADnq5_N=v=k0e=+aqwohNMoKEmoCbMj5PyEM38_fKa=h6O1Z=A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Bound GPIO I2C table entry count from VBIOS
To: Andrey Misiurov <amisiurov@cloudlinux.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Tue, Nov 10, 2026 at 3:41=E2=80=AFAM Andrey Misiurov
<amisiurov@cloudlinux.com> wrote:
>
> radeon_atombios_i2c_init() derives the number of GPIO I2C entries from
> the size field of the VBIOS GPIO_I2C_Info table and stores a bus for
> every valid entry in rdev->i2c_bus[i], which has RADEON_MAX_I2C_BUS
> (16) slots.  A table that claims more than 16 entries makes it write
> past the end of the array into the rest of struct radeon_device.  A
> size smaller than the common header wraps the subtraction and the loop
> walks far past the table.  radeon_lookup_i2c_gpio() uses the same
> calculation.
>
> Reject undersized tables and cap the entry count at
> RADEON_MAX_I2C_BUS.
>
> Fixes: f376b94fbc0a ("drm/radeon/kms: unify i2c handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
> ---
> Found by code inspection.  Not reproduced at runtime; it needs a VBIOS
> with a malformed GPIO_I2C_Info table.
>
>  drivers/gpu/drm/radeon/radeon_atombios.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/r=
adeon/radeon_atombios.c
> index 3dd9724..c4e1272 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -125,6 +125,22 @@ static struct radeon_i2c_bus_rec radeon_get_bus_rec_=
for_i2c_gpio(ATOM_GPIO_I2C_A
>         return i2c;
>  }
>
> +/*
> + * The VBIOS table size is not checked against the image; cap the
> + * entry count to RADEON_MAX_I2C_BUS, the size of rdev->i2c_bus[].
> + */
> +static int radeon_atombios_gpio_i2c_num_entries(uint16_t size)
> +{
> +       u32 bytes;
> +
> +       if (size < sizeof(ATOM_COMMON_TABLE_HEADER))
> +               return 0;
> +
> +       bytes =3D size - sizeof(ATOM_COMMON_TABLE_HEADER);
> +       return min_t(u32, bytes / sizeof(ATOM_GPIO_I2C_ASSIGMENT),
> +                    RADEON_MAX_I2C_BUS);
> +}
> +
>  static struct radeon_i2c_bus_rec radeon_lookup_i2c_gpio(struct radeon_de=
vice *rdev,
>                                                                uint8_t id=
)
>  {
> @@ -142,8 +158,7 @@ static struct radeon_i2c_bus_rec radeon_lookup_i2c_gp=
io(struct radeon_device *rd
>         if (atom_parse_data_header(ctx, index, &size, NULL, NULL, &data_o=
ffset)) {
>                 i2c_info =3D (struct _ATOM_GPIO_I2C_INFO *)(ctx->bios + d=
ata_offset);
>
> -               num_indices =3D (size - sizeof(ATOM_COMMON_TABLE_HEADER))=
 /
> -                       sizeof(ATOM_GPIO_I2C_ASSIGMENT);
> +               num_indices =3D radeon_atombios_gpio_i2c_num_entries(size=
);
>
>                 gpio =3D &i2c_info->asGPIO_Info[0];
>                 for (i =3D 0; i < num_indices; i++) {
> @@ -176,8 +191,7 @@ void radeon_atombios_i2c_init(struct radeon_device *r=
dev)
>         if (atom_parse_data_header(ctx, index, &size, NULL, NULL, &data_o=
ffset)) {
>                 i2c_info =3D (struct _ATOM_GPIO_I2C_INFO *)(ctx->bios + d=
ata_offset);
>
> -               num_indices =3D (size - sizeof(ATOM_COMMON_TABLE_HEADER))=
 /
> -                       sizeof(ATOM_GPIO_I2C_ASSIGMENT);
> +               num_indices =3D radeon_atombios_gpio_i2c_num_entries(size=
);
>
>                 gpio =3D &i2c_info->asGPIO_Info[0];
>                 for (i =3D 0; i < num_indices; i++) {
> --
> 2.43.7
>
