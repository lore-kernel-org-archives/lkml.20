Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332572;
	b=k+SFdlupy7a/N0omrXJZC0Y0Xpk4NEIMwbd//2MeQZqheiWPBI4aHcAs8o2yV2l2jDK4
	 6GIqUG33Kqw/HaXcWNMCJZxHshLI9a3efTSR/CfCD0zwWku3GIR0XI6QucsqbSfSnjKF7
	 JYIhf0NU9ZE2aEa9ztQR9/TO2g9DFddH25pwFf0QATvScs53LwYBGxYVNWa1Rd0Cu9KFO
	 8PbBGqviNvyWHjSf3jvoQcOy36ZdkMB6s0ewJOKkR3j761Q1RqFmIqx+ewk5ilPEDfrA/
	 wxpJb+wOrqSkg8R0c151HI3MewToRPP7aIyfaInLcewu85lvDNsl7S/XCnW4P//RDMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332572;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WJ2VhX1zIunziDo8+1yMjNUGG0cVlFTY9J5xCG4anBY=;
	b=k6pDMHmobRH++cPIaE8MjytE1UeOWXvfAoqVOqKOQk5PiWofJu3S7cxsjJjwW65mySSa
	 LE/BF+ZFshzCYO/DkmqAL4APpCQyFiJrr4xiFPSUxTMWAie0I9lhAItgYMBHvyKv0WxKM
	 qjK3bi8ytcQqjBO5CEwWUAalUJtoWHNFIEBGzzm7vvG2zf7c90F+WK+EPbIhkKPxis43B
	 BAqMOiqFmmQlP/eDFQVug6ttTmmTJ5cPmHyNlvEzqCmJinQq8jLHJawCIH6aFzBP5rEXL
	 xjPtWQIDB2u5inS/U5QSdXLsZ0IkKkU01RXjq8/dWmWmt1dkff4l/JB4f3E7b7HMg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rrs1g4bI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9BA60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rrs1g4bI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3261F00900
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332571;
	bh=WJ2VhX1zIunziDo8+1yMjNUGG0cVlFTY9J5xCG4anBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rrs1g4bI3bealFFCrTKGzgW7nULJYNNq0U8n1ryvUN1UTexowUObEe4GzxWkm0SVc
	 bax9c4VqNOuEFa5aCuIQGmbq0iwqZmNUIXBpc90R5VJ0fHsKlZl3na6po4egT9VG7D
	 jtlhGQhkLMDEX0jg1gynA1aA7kFPMbeeR1DaSii57Ixd+aeAvRgN/mkorgUsybNxHP
	 xNAaNSJU4BMfro1OFEf9Z6vET8jPzpijibNpWVc/4zw+DFeeGZRc1wi3wX4sT9251/
	 vVKENhp0EPpTtxUtfH5VVaUXMTig6S6wNV21t/BtY/aA8tQu0NxOM5nEqZ2zMM493i
	 lKxn8PQ7h4sgQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso17920101fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFjxb8cb7duUmzs7l0dXxBc/T4ZE2p3cXGxlhm/8mKX5XM9sM9cJYkNIzpUq612W3bh/pHWg0qbn5+WaeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cMARkyazlGpiBsxO6Ou0+t0uZahSVzSj7R2Gjpqii6wJ2iSep
	/fgus/QcFOzOq0CrvdPOLnznBU2Rbj14w1lPgb10GnSTelkCXAFiYifuNXwakUhkd1xi7zGIDm7
	qVLjz3waN/z4xGzQYXhUaqMuiM9mX2yc=
X-Received: by 2002:a05:651c:2110:b0:3ac:f258:6191 with SMTP id
 38308e7fff4ca-3ae0964afcemr8335641fa.23.1794332569598; Tue, 10 Nov 2026
 09:42:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103114143.75756-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261103114143.75756-1-k.chen@smail.nju.edu.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:42:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0huO=PGM60O=e-SmVdGpevFH0JWXb4vaVNAiJL-9wOUPQ@mail.gmail.com>
X-Gm-Features: AclHuK8Vk8YduiLbbVx_kyTD4Z9jZoc1RuwBnQppkz7Vu3gLKg-vqQlNv_eOdGY
Message-ID: <CAJZ5v0huO=PGM60O=e-SmVdGpevFH0JWXb4vaVNAiJL-9wOUPQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: property: verify nested _DSD packages
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:42=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> acpi_properties_format_valid() and acpi_add_nondev_subnodes() inspect
> the package.count of nested elements before checking that those
> elements actually are packages.  In union acpi_object, count aliases
> the length of a string or buffer, so a Buffer(2) or String(2) element
> passes the two-element test and the following elements[0]/elements[1]
> accesses read past the small allocation.  In the non-device subnode
> path, the resulting string pointer can reach acpi_get_handle().
>
> Test for ACPI_TYPE_PACKAGE before using package.count in both
> functions.  Also require an even number of entries in the _DSD package
> before reading paired GUID/link elements.
>
> Fixes: ffdcd955c307 ("ACPI: Add support for device specific properties")
> Fixes: 99db5ff7fe0b ("ACPI / property: Hierarchical properties support up=
date")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Applied as 7.5 material, thanks!

> ---
>  drivers/acpi/property.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> index 8ee5a1f0eb48..f5e0dc87edde 100644
> --- a/drivers/acpi/property.c
> +++ b/drivers/acpi/property.c
> @@ -194,7 +194,8 @@ static bool acpi_add_nondev_subnodes(acpi_handle scop=
e,
>
>                 link =3D &links->package.elements[i];
>                 /* Only two elements allowed. */
> -               if (link->package.count !=3D 2)
> +               if (link->type !=3D ACPI_TYPE_PACKAGE ||
> +                   link->package.count !=3D 2)
>                         continue;
>
>                 /* The first one (the key) must be a string. */
> @@ -262,6 +263,9 @@ static bool acpi_enumerate_nondev_subnodes(acpi_handl=
e scope,
>         int i;
>
>         /* Look for the ACPI data subnodes GUID. */
> +       if (desc->package.count % 2)
> +               return false;
> +
>         for (i =3D 0; i < desc->package.count; i +=3D 2) {
>                 const union acpi_object *guid;
>                 union acpi_object *links;
> @@ -331,9 +335,10 @@ static bool acpi_properties_format_valid(const union=
 acpi_object *properties)
>                  * Only two elements allowed, the first one must be a str=
ing and
>                  * the second one has to satisfy certain conditions.
>                  */
> -               if (property->package.count !=3D 2
> -                   || property->package.elements[0].type !=3D ACPI_TYPE_=
STRING
> -                   || !acpi_property_value_ok(&property->package.element=
s[1]))
> +               if (property->type !=3D ACPI_TYPE_PACKAGE ||
> +                   property->package.count !=3D 2 ||
> +                   property->package.elements[0].type !=3D ACPI_TYPE_STR=
ING ||
> +                   !acpi_property_value_ok(&property->package.elements[1=
]))
>                         return false;
>         }
>         return true;
> --
> 2.34.1
>
