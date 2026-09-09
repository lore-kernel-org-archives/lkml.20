Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF457D239
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969365; cv=none; b=qdkIUZjAU7LPfP4HpP0m+Oq3N5WwhfBnaJK8hAvPalZVn2MOGCY5/sKoypeWX9LkJaj5qTd5VNx0su8Lj3vzDUCK1KkUX6ZOxbiqUtP7BOvDxS/RFKdSR1yq/h28dp0OTW7vUjK4C/wPHEYhMy2UC8bo8IDKXPuymNofg1z8NnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969365; c=relaxed/simple;
	bh=lh59o6alPrhA0kytkDF8a2N0VXb3/OZaW+SxY6bjQcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYYlzfVKG6EPo05Hh8dti36jeOApIJVnP3Zxuz/8a3AZtO8OOzlwIb5c1LrfeqvKQg01Yzci8ZLiJw8iiLitydoXGJkfW73+Bj0ysWKyqYnqalOaJLNebVo9Tc22a1X/i7sJlsAufieF4Ros8KaVsmHwd58wwlc20K1mBJsYKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9/vMKom; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9/vMKom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C681F00AC4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969362;
	bh=ioV+x+EFqcjOBqUqrRqh+sx26qTm5P9GhDhi1qLRWwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n9/vMKom/fhoOgCHfwSU6u0gIiUcmCizW91SbWNZRnGp6MFIQ2xp3qPGEUOhS97g9
	 R4uYA4FmkPaMddatRqkxwriiFvDgppyfXNdRYhGM93ChMROyBih0mffe3aRpPBktuh
	 YXO1fMiKa8SOL6YPjpi0EBo6nRlC/XrfH5zYYBTp7K9mgklf3IuDZkzxulRG8rc0mG
	 SXSeOd+IsiZxkRiYRN+A9IFw9SBhO3huBaOGuGZ8wkeLKxSfVxWO8TJtVeXkoYQvMp
	 tKQ6Pmb764b9LcUFIeW5Yd5KNmMi/FWXZ6BrodKMaeX8AeLmNO0T6dDh/ZXB/J5LLC
	 2M4Y6eq6yYM4g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a49a022221so10011101fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJTvItWJiOEkuKIbhwE3UzaEV7EavtTG47wXT/cq7Ykzb6xp28Y2t3atEOfTCJT82v6P0ruE05SC/KzEs=@vger.kernel.org
X-Gm-Message-State: AFuF++lzh/ebXc5IOYYVF0eZXx55+5GT/kYq/VtRcC4FIJdqz2ER70T6
	cZnTDXa5k/Sg834EQVc+OuMbTAEA/XB5D0W76oTUDndEqHZpfqbePNKT7EyJOaX43FfTTzI912C
	YlUly19oqm+XPuQBNLmxqTsmcODA+khs=
X-Received: by 2002:a2e:a9a5:0:b0:3a3:74d6:50aa with SMTP id
 38308e7fff4ca-3a374d65137mr34005511fa.29.1788969361185; Wed, 09 Sep 2026
 08:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902114912.6690-1-prabhakar.pujeri@dell.com>
In-Reply-To: <20260902114912.6690-1-prabhakar.pujeri@dell.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 9 Sep 2026 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gDyP7aXAgePQR2RtWodedQqHf4UPB576vCcQPoSgt17g@mail.gmail.com>
X-Gm-Features: AcwNN1Wl0aBn1Kv58PDCI537TmRA1xDDy3FlcWhWY3V4Qk01tRDuevwl3cPzeA8
Message-ID: <CAJZ5v0gDyP7aXAgePQR2RtWodedQqHf4UPB576vCcQPoSgt17g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: ACPI: EINJ: Update stale driver source reference
To: Prabhakar Pujeri <prabhakar.pujeri@dell.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:49=E2=80=AFPM Prabhakar Pujeri
<prabhakar.pujeri@dell.com> wrote:
>
> The EINJ implementation was split when CXL protocol error injection
> support landed: einj-core.c holds the core logic, einj-cxl.c the
> CXL-specific part, and apei-internal.h the shared plumbing. The old
> drivers/acpi/apei/einj.c does not exist anymore, so the documentation
> points readers at a nonexistent file.
>
> Point them at the actual files instead.
>
> Signed-off-by: Prabhakar Pujeri <prabhakar.pujeri@dell.com>
> ---
>  Documentation/firmware-guide/acpi/apei/einj.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/firmware-guide/acpi/apei/einj.rst b/Documentat=
ion/firmware-guide/acpi/apei/einj.rst
> index 7d8435d35..70fa59bd9 100644
> --- a/Documentation/firmware-guide/acpi/apei/einj.rst
> +++ b/Documentation/firmware-guide/acpi/apei/einj.rst
> @@ -180,8 +180,10 @@ function are specified using param1::
>         | segment |   bus  | device | function | reserved |
>         +-------------------------------------------------+
>
> -Anyway, you get the idea, if there's doubt just take a look at the code
> -in drivers/acpi/apei/einj.c.
> +Anyway, you get the idea, if there's doubt just take a look at the code:
> +drivers/acpi/apei/einj-core.c holds the core logic, while CXL-specific
> +handling lives in drivers/acpi/apei/einj-cxl.c and the shared plumbing
> +in drivers/acpi/apei/apei-internal.h.
>
>  An ACPI 5.0 BIOS may also allow vendor-specific errors to be injected.
>  In this case a file named vendor will contain identifying information
>
> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
> --

Applied as 7.4 material, thanks!
