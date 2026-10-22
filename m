Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694681;
	b=p9KyCeXymjCIXcfxgk/z7oble3QQ2aAc1Rez7+2WAz97YAO718zt0vvqmjiO3Rt9eaZC
	 3iljQU398H2HraZE1uhK+tg9psR8k6UoonvQGk2/NK96SFmoEyQUXwoV4/8FqsviUHiEX
	 ScaTZ023p0N7k4wme9TgZ9D/ePyPHvsoxRY28xG69VwqSubP//MA8WceMSrzNRTc3xu7S
	 PYmSNfHBnYyKRy3vaAb1FLGEPVQ+KUtUWo0IoXd2HU3R76ZysKAdmBZsBZYbwYV3hgB/x
	 JfHVsH5vY0AQm9UDDJAxq4CXmeOL14AVPkeg7Fuhsm1Co9ZF9nNwfpVslmioWyY1mAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694681;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g2LfIwDxVBmR9BMyADZLLYuuWNtJdFL8FAUPTERMtU8=;
	b=XIVIyZtmOlti/Em3vVBefwmhexsZdQDDX0c2PR2WwylW4y9xDXbbZdZ7V0bs5hipfdK6
	 xmbMDNI7KJwsHWis8IqkvPuWsjlOjHpXsxkS/MuTy7KmZ7DS4DkKxKLHCDE60KTH6zXpl
	 SMS6OLYzpWHKn1y/0cmyeaEEnuqmKqMz+uDXiVKkudC6rYhoy68Mnf8XfydPMrus8dg3y
	 Il5+Qh2qo2ifqUMLijB40DEnzhfNH3uE8M5QhoYG4286DbVlL3TF9TAmNlgQERDbPLwmS
	 Hb3PBsuaJkINuNkvU3OomrrOe14PeQIjMWU2ZQBlaEuT5OA5+tyqNWaRmg43z6NfgYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Od/13cqW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7680606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Od/13cqW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DB71F01829
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694680;
	bh=g2LfIwDxVBmR9BMyADZLLYuuWNtJdFL8FAUPTERMtU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Od/13cqWMRUeTGz+uowEVhEOkpveKmzT+5c8EG2HZpytg+C1uowtXjUQK4Q2FQ20N
	 oyFtQd0cX6dozkuzXy/a+V9L/k7SSJzeWyym+tcDSbtAtKvdg9dZDkV8UycCOfzu7/
	 jpYreTLAkJ8jYEM02hbu5pviztpWJEgLfjG5OqvrZFLNERYch8wRHXVlJ73rkPncsK
	 vKQ02b/jeKHAbSgdNUQTw8Aji+X73on1NpmhGuZVdhSOs1lYFqJyQHoJ9A+7RwjUGc
	 D57xJAbTQRkWlv/zNssM1EZcVnf6kac7XuskhHAQgxmpiseezcqQezW9PZTEnvlTkm
	 uMVI9ed9DP/vA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so17015e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3g9gDWBk9e1Q+7rQo+tFClzC99ruYiv+hM6TMcP8aj1kq+E3GA6oIl6GBU2gq5+t32lNTYKuYZx3xab8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/wOtHSFipgykfO5Z7pYc6Yzln21Mlhg8wzCA3/YWrq2is6WQi
	Il54mV50HU3vny/J/Y2dSmeYnXuOJ2/E1zTtup3g1IbuPvOLvgfqSOBJk9PKdF/5gX9nYRzbwo9
	+9dbO/GyUr9qL7J6gWEOoAszmn5JaDwk=
X-Received: by 2002:a05:6512:3b0b:b0:5be:5196:9591 with SMTP id
 2adb3069b0e04-5bfa1c4f787mr2669620e87.59.1792694678773; Thu, 22 Oct 2026
 11:44:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180728.957618-1-jamien@nvidia.com>
In-Reply-To: <20261013180728.957618-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 20:42:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iwUo6OmDEVBCoSp4Gtopntp3w1gw6s4yTTKFygmsrONQ@mail.gmail.com>
X-Gm-Features: AclHuK86uxd2cAvIMmFetJsl2IEyYqV7HJXL18Dj7Ear_GON0bDSDngEWudD6a4
Message-ID: <CAJZ5v0iwUo6OmDEVBCoSp4Gtopntp3w1gw6s4yTTKFygmsrONQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: sysfs: Map only the requested range in acpi_data_show()
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Punit Agrawal <punitagrawal@gmail.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:08=E2=80=AFPM Jamie Nguyen <jamien@nvidia.com> wr=
ote:
>
> acpi_data_show() maps the whole data region on every read(), although
> it copies at most count bytes and sysfs passes at most PAGE_SIZE bytes
> per call. acpi_os_unmap_iomem() defers the iounmap until after an RCU
> grace period, so a process reading one of these files in a loop keeps
> many full-size mappings in flight.
>
> Map only the range being read. acpi_os_map_iomem() rounds the mapping
> to page boundaries, so each mapping is now at most two pages, whatever
> the size of the region.
>
> A malformed table can describe a region that wraps around the end of
> the physical address space. acpi_os_map_iomem() doesn't check for that,
> and its lookup of existing mappings then matches an unrelated mapping,
> with or without this change. Fail reads of such a region before mapping
> anything.
>
> Assisted-by: LLM
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
> As discussed on the BDAT v2 thread:
> https://lore.kernel.org/r/CAJZ5v0ixQ_5jmrfm4mz50tZtCEq6nJt1b2eMoBdhr0f3AY=
+k7w@mail.gmail.com
>
> This doesn't depend on that series and applies on its own.
>
> Tested on an arm64 server with 4K and 64K pages, with the BDAT v2
> series applied:
>
> - The BERT and BDAT data files match /dev/mem when read whole, byte by
>   byte, page by page, and across page boundaries.
> - Each read maps at most two pages. With 4K pages, looping full reads
>   of the 90754-byte BDAT file kept at most 167 MiB of vmalloc space
>   mapped (1740 MiB before), and looping 1-byte reads at most 355 MiB
>   (3090 MiB before).
> - Malformed BERT tables loaded via initrd table upgrade, with regions
>   that wrap around the end of the physical address space, fail every
>   read with -EINVAL.
>
>  drivers/acpi/sysfs.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
> index dd4a99f09efea65..138009659a7b55f 100644
> --- a/drivers/acpi/sysfs.c
> +++ b/drivers/acpi/sysfs.c
> @@ -419,6 +419,7 @@ static ssize_t acpi_data_show(struct file *filp, stru=
ct kobject *kobj,
>         struct acpi_data_attr *data_attr;
>         void __iomem *base;
>         ssize_t size;
> +       u64 end;
>
>         data_attr =3D container_of(bin_attr, struct acpi_data_attr, attr)=
;
>         size =3D data_attr->attr.size;
> @@ -432,13 +433,17 @@ static ssize_t acpi_data_show(struct file *filp, st=
ruct kobject *kobj,
>         if (count > size - offset)
>                 count =3D size - offset;
>
> -       base =3D acpi_os_map_iomem(data_attr->addr, size);
> +       /* acpi_os_map_iomem() can't handle a range that wraps around */
> +       if (check_add_overflow(data_attr->addr, size, &end))
> +               return -EINVAL;
> +
> +       base =3D acpi_os_map_iomem(data_attr->addr + offset, count);
>         if (!base)
>                 return -ENOMEM;
>
> -       memcpy_fromio(buf, base + offset, count);
> +       memcpy_fromio(buf, base, count);
>
> -       acpi_os_unmap_iomem(base, size);
> +       acpi_os_unmap_iomem(base, count);
>
>         return count;
>  }
> --

Applied as 7.4-rc material, thanks!
