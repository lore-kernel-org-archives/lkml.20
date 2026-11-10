Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331613;
	b=tlxw8rJWRaOut8Axsf2HKMGas2EbaUNRfr0lge1jG62z1xA2PGJfqolcdXb/13uJULIv
	 ycZB6kvGSHHLpDFmWu/zq31E80ctfSHeE0HrDe0XicdiFuC0aMTK+mISCxktTJ6+VHMIZ
	 b7pUP7hwbVjvyQixNl90HPv5ik618xYia/vFz1nf4aL0tv8lvIit06KRMlXQ+MmwxJl35
	 W1tIV6damw8ZYCsoQbVz0XF/pkSgdfvMuZixcoUieroNZkE5NquumvOIYR5h8le4Ftfo8
	 2eBowxExOIOAhNe/qRI/01wEWIAeyxNWtSTVt1Z+eMs8jkdUGijY0IRivvXFCXOCiYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331613;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cmQoUl9fujoMKZGwxPMJk/W1qqjVzAa+dA0fv2IKSMw=;
	b=iG6Ac6KXLFmwVvqFIdM9z4p9Kdf9NQcdatSiyzW15zkP+k62rELau6rOG+NOYorSqg2H
	 pwved4HafiEyCRWrAAaw1D4Mud56wf+5IpOUcAEcVnsL78HwllHU2ItYk3W0fuPkqIAzr
	 gQGGD1hYxnqugUE4gODD7KDKtfyWxYQPPnXR4Z82vDgM2/Kpv4b3mp9n2w5zZbL9FUuYj
	 ODBjNtgnKc9GFvwojtMuMVowiWNze1xJdVTPxV1Ol0TPux8NO/y11Lb6fbgR0YPaajucd
	 Jyjk27xEiF0nLxbMLKRyZ2HST5TYdwboBrWpxjdy5m7atfKF8gW+afLA0lusyUG7ZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWKVhwUY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D7606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWKVhwUY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE8B1F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331613;
	bh=cmQoUl9fujoMKZGwxPMJk/W1qqjVzAa+dA0fv2IKSMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XWKVhwUYw2SyrkUSuYDPn4wNX/g3itQ/zZfFoGqSrdWTMTTQu/Z8wcQ0+HicaZQG/
	 ML0VK7tPHlid9zxNjAm7/Dv/6XYHyBeQF+fosNQxvSfN/biQogigY2LFmIdsJmWPJC
	 Z7WxUGjaj17kKXOOEq8MJG/7AgiXnt/lKWJsSEEFiRJbAjIlsLIgKYj7uQDL6vy1hL
	 0HwNNSBjWJaUr7a48LT5xzgKvXkyViWf8kMsMLbwSifTBL0r6Mspqs4/oNUWx9yhRf
	 PFj9Rf4QERfbGNppxoeDi/AqK3Em5W+1GNpZ8Gl8hxSV7y9KPrA3rtoZbqVe1jVZTL
	 gABomlT8sJjug==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3aced9804e8so19939881fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:26:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPIgvBymoCvElTJ0YPKgLYsjQeitAFOZ+gyPmG5aFhK0DB8FzOI+b6z7bVAHgYdJhNN17MsW1XgS1zjzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IOTzP89WR9cyywnV+0yzn0qGmzTKPDlez1Iw3OcR4sSlgjcEF
	MSYiLU000zJFIQhIwLIq4doD0HBsSL71D0W+Zm9JgjgAJNxC+I2MOJLfg/5QGSYnKLhQDUEFLKa
	zcQ7uOcej1qxyUKak+hiwuYcP6NYky/k=
X-Received: by 2002:a05:651c:2214:b0:3ac:ff0a:9d86 with SMTP id
 38308e7fff4ca-3ae096202efmr6674061fa.15.1794331611570; Tue, 10 Nov 2026
 09:26:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103114118.74782-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261103114118.74782-1-k.chen@smail.nju.edu.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:26:39 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iCfDR341Barrui1TSiY6o7ePYd2f7aZYXvo3aper2pvA@mail.gmail.com>
X-Gm-Features: AclHuK9Olaj_vF-OXIzinsrYt4nJo78Pj_uJi8sT6dq3T9Ngf7ytgRHpahlG2po
Message-ID: <CAJZ5v0iCfDR341Barrui1TSiY6o7ePYd2f7aZYXvo3aper2pvA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: video: reject out-of-range _BQC indexes
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Aaron Lu <aaron.lu@intel.com>, 
	Danny Baumann <dannybaumann@web.de>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:41=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> acpi_video_bqc_value_to_level() indexes brightness->levels[] with the
> value returned by _BQC once the index quirk has been armed, but does
> not verify that the value is inside the array.  A firmware that behaves
> consistently during the quirk detection and then returns a large value
> can make the driver read out of bounds; the reversed branch also
> underflows before indexing.
>
> Return an invalid level when the index is out of range, so that the
> existing callers disable _BQC.  Also guard against a brightness table
> with no usable levels, and tighten the range check in the quirk
> detection before its reversed subtraction.
>
> Fixes: 994fa63c5b12 ("ACPI / video: Fix applying indexed initial brightne=
ss value.")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> ---
>  drivers/acpi/acpi_video.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 2a2822516665..44af7ffb9a81 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -533,6 +533,13 @@ acpi_video_bqc_value_to_level(struct acpi_video_devi=
ce *device,
>                  * items with special meaning (see enum acpi_video_level_=
idx),
>                  * so we need to compensate for that by offsetting oursel=
ves
>                  */
> +               if (device->brightness->count <=3D ACPI_VIDEO_FIRST_LEVEL=
)
> +                       return U64_MAX;
> +
> +               if (bqc_value >=3D device->brightness->count -
> +                                ACPI_VIDEO_FIRST_LEVEL)
> +                       return U64_MAX;
> +
>                 if (device->brightness->flags._BCL_reversed)
>                         bqc_value =3D device->brightness->count -
>                                 ACPI_VIDEO_FIRST_LEVEL - 1 - bqc_value;
> @@ -781,7 +788,7 @@ static int acpi_video_bqc_quirk(struct acpi_video_dev=
ice *device,
>
>         if (level !=3D test_level) {
>                 /* buggy _BQC found, need to find out if it uses index */
> -               if (level < br->count) {
> +               if (level < br->count - ACPI_VIDEO_FIRST_LEVEL) {
>                         if (br->flags._BCL_reversed)
>                                 level =3D br->count - ACPI_VIDEO_FIRST_LE=
VEL - 1 - level;
>                         if (br->levels[level + ACPI_VIDEO_FIRST_LEVEL] =
=3D=3D test_level)
> --

Applied as 7.5 material, thanks!
