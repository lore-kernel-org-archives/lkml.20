Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318538;
	b=h0HQQ+n0YinwDVWQR9GoBtmtZLApFzKsuQD76jPZ64UXHzGIR3G0kmrLkJoEznzfmixg
	 C+x4WLnIyek2lpbhiA9EItvc4azXzwiW0uwmCAm7e1+tSO2qLefVp/4Kvu0xJWBSBZgiH
	 ZEo6xYyYBvBjinw4yNPM//rBVeC1PTcaO756ZRqlJppUNYi/566bZd3W99iktCVycluV4
	 6JvbORTHuMhy+QIqkmbo6vgPBZ6cu5GwLyEHQTlBJenTdJjV+IwSJTfQ3aV5G3gbTLLM+
	 VSfM4ot40mHN8LNtIZHdqTRJhfOJ3HerH5/ocLAQfvxpsc9h1GllcTDjGXOQESnkL5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318538;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gndjf7aFT+hCYUBKXAUjQiEIBojTbevvLFHHCbIYzhc=;
	b=DOHTgf3cF0AnkfwtCxWj5HzNQpwkVEHO+lp2awv5ciqltSFfQAV4GaZdYse1uIh6mF5v
	 0tNJ++0AaLtE3G6beGZsof5QZIo5wWqdmQ2oUn2Xda1cAFndJtNCIdoscN+Vwc5mf6Xzd
	 OgGBnKPpRnFd1YTpOP94uRggVmrFce9q7Tg3HsPuErSDLErZ7tMtilIxwP4AlB76QZNqr
	 QQwkbwtWHVT+Yamm8VPcqyAwfm0UXMqVPuexY0Z4nJJx7CkPyAAQ2q6Ge9UKUu+09kLpu
	 efEsU/4/1bsjRbAnoTPHZE71jnIMNSPkTfa7Z0oBY8GGmfShYCa6dTcNfawVK+zB20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2agSBXV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E9606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2agSBXV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6A31F008A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318537;
	bh=gndjf7aFT+hCYUBKXAUjQiEIBojTbevvLFHHCbIYzhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h2agSBXVWDGlNK9B8Wi59uwx9iD4hHre5yp2xvOmZBaVaR2ECFrVjhRqhsbABasRd
	 iGA+/lnU1bj4NyKsZwawF2pmKWq7+Vp+rgZQXaVaO8FQXor6K80LyBdRnix7/PgTPm
	 fv57qHdjaE2ogO8kUjinEXaCpK6LW7hAZ0TNL+W062JjvkrtHBzzbQuZdUJIygd5Hq
	 KZtW4wy2LdHLsyuaat+KQGRaNFg2HlSGJ6mupJC09tVrbSO4zqddCWH9g9IoDQKsSJ
	 KgD1Li9mzZucieHObtF6YwDzv6Re1AN3/riDnMNaI/2zPVdEb2XfoKSwuqJWVpl4TV
	 8MK1++ZmGQMqw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfc004920so17437301fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzlAu0n5wUJLlSsKgpQE76NuNcWxV+vasBMS2OQetLJfBPM7z/QOny2M3BRRv8Rn0VBzFvLbD4tw7GCG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oH3MF8QnkyRJMUDzSdppRC2tjdrblGtg2gNZFMmJYvFxanqJJ
	NUKV8WphelXonOIfLTvpfeWgd24A07/YGRwlgiB6VIAlE18lmIAmAsvqOzvD8ipkFHmdaGQ3HKL
	ffblOofgjj3b6VUuRIFanyFUg1wBao7k=
X-Received: by 2002:a05:651c:2214:b0:3ac:ff0a:9d86 with SMTP id
 38308e7fff4ca-3ae096202efmr5199701fa.15.1794318535632; Tue, 10 Nov 2026
 05:48:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107201553.9268-1-asaba90@gmail.com>
In-Reply-To: <20261107201553.9268-1-asaba90@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 14:48:42 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jhQZeim_dmXG=CHsfjffY6irXfRSgRP7vwVGz9J+=OWA@mail.gmail.com>
X-Gm-Features: AclHuK8Gi7vmCqKEjt2tT4GrLFgpWm1NuYKWB8dsvjv73V1tYGJ7lnDd1dWpliE
Message-ID: <CAJZ5v0jhQZeim_dmXG=CHsfjffY6irXfRSgRP7vwVGz9J+=OWA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: EC: Add quirk for Lenovo Yoga S740-14IIL
To: Amir Sabbaghi <asaba90@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:16=E2=80=AFPM Amir Sabbaghi <asaba90@gmail.com> wr=
ote:
>
> On the Lenovo Yoga S740-14IIL (81RS, BIOS BYCN29WW), the ECDT
> advertises GPE 0x6E for the embedded controller, but the EC is
> actually wired to GPE 0x43, which is what the DSDT EC0 device's
> _GPE method returns. Since the ECDT and DSDT EC share the same
> command/data ports (0x66/0x62), acpi_ec_add() keeps the ECDT GPE,
> so no EC events are ever handled:
>
>   ACPI: EC: GPE=3D0x6e
>
>   /sys/firmware/acpi/interrupts/gpe6E:  0  EN  enabled   unmasked
>   /sys/firmware/acpi/interrupts/gpe43:  0  EN STS invalid unmasked
>
> GPE 0x6E never fires, while GPE 0x43 is left enabled with its status
> bit set and no handler, so each SCI it raises is counted in sci_not
> (about 7/s, 1.4 million over 55 hours of uptime). As a result, EC
> query events are lost: the brightness hotkeys and several other Fn
> hotkeys produce no input events at all, and battery/AC notifications/
> laptop lid event are not delivered.
>
> Add the machine to ec_dmi_table so that the DSDT GPE is used.
>
> Tested by overriding the ECDT through the initrd with a copy whose
> GPE was changed from 0x6E to 0x43, and later by applying this patch
> and removing the override. With the fix the kernel reports
> "ACPI: EC: GPE=3D0x43", gpe43 receives events, sci_not stays at 0,
> and the brightness and other Fn hotkeys work.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Amir Sabbaghi <asaba90@gmail.com>
> ---
>  drivers/acpi/ec.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
> index a89f10256..7c0643d5d 100644
> --- a/drivers/acpi/ec.c
> +++ b/drivers/acpi/ec.c
> @@ -2007,6 +2007,16 @@ static const struct dmi_system_id ec_dmi_table[] _=
_initconst =3D {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "HP 250 G7 Notebook P=
C"),
>                 },
>         },
> +       {
> +               /*
> +                * Lenovo Yoga S740-14IIL
> +                */
> +               .callback =3D ec_honor_dsdt_gpe,
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga S740-=
14IIL"),
> +               },
> +       },
>         {
>                 /*
>                  * Samsung hardware
> --

Applied as 7.5 material, thanks!
