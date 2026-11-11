Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357749;
	b=HIlo7BZtnObUWO8+PQXmMSBJbH9lZSqvwQ1e2WbRC1qbTuLIcQhWjgtyKARLa0x1aHvX
	 Q5uPbxYFiamQPyKlGNsBC9/jkv7PUenA+Kquu7gh8FqXR6kGcsTsTbevXGAdRazMnWXWG
	 wXJfl4OalWt7Rw/p+uOYBh6iiuJEBWpXPsKv2nil1xhqyYAewK/HKwL9u/D6nQ0O+6e7p
	 3p7yiFfX9anC/CJZAfHuveizg/blMJz5pajSKEP+KD9yC0g6j5yvt0Cx5F+fvaUfD2e0U
	 CjirpcK7JNboz6jjF80ob8QLIR6KmnR8tMn4sK0ZMBN3s6bfuj7vUiKwBKL/z/dK+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
	b=edrfftl066/1/ChNIjZ63f9kpc78ifslK7sWN/iksUDFpYpPUNs2dHVsWHhw4dm0HH44
	 TRnUmI8B3KKuWhocFgEks3umCZvS12PCWSDfc/RK9t8j6mnlhuvUFWQ49EwrtmcKVRCLi
	 bRDIppbXpzw5Fj/++f75GukK+LkjuqBciJzng4FZ3SjP0mYOT9DFRK+0BU6v5epoamQP9
	 uWlODr+Q4jlanTIa7n56xNr4gxUeBrJKkcJQE1ftHHjdTbrtbQK2gNTejDyC10Du+gl3j
	 mDbgDgv5Zkaex/Haq4pUQflFeATn1pzInsLOwhMnBDioVFB/QBOoyhlOWPM02Ah9JBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7sD6QLs;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B6B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7sD6QLs
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so990354f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794357747; x=1794962547; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
        b=E7sD6QLs/JTqFWSkB7hHTWPc1IbiQa8RF1Z6jO75nCHyz/qg7g3dDboQtZPPDIa73o
         jNXkNcnZZWoCSsdnYizHXNEFKdE66CXtJJxotbhZgWRFGas+U4/MLtqyh4W5Ii4VKzAv
         LgaRZt7BaNGNYiqaNMPYBMjpaAc9J6eIJSkJlhg9IEIRUmxuBGL+bXhHhh4Mjci574yt
         tlsWqwP2cqR/MFb7Pu88/A5muqd0MwoRIX/+VUwGOwYNc1B0Ty8W2Xa/MC80kzJO+eBI
         I5XYrRXS60dYsmmBk+oY/DrJLFmiZ8vybSN9C1KJ0FJdmkWo4X10ACsfGmNDp/w2kXpC
         pchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357747; x=1794962547;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
        b=K7yhM02peItF+6OlymsbEqqHaGpwwB+hH7McUp9jJK7F5Yx6ZVPV9W8fKI7DgwlTqi
         PKAM/Ene7zzj0IrCvHinmEfMmj9Fy+Y1+46/xl6wwzeTTuUR30/BsqSiDHNX+Iz8aduX
         r+vjxwRx/o+SUzFM0gtPiEougsOKyv7qQgM50HvwtVoUw5uGjoZh/rVslLFjnWRsYasR
         h8EmWsHbdCpiXF7C9HGVR5ZiQhqs+lAHCjbq7xbaBCkitcSng21vFzxNUwpyiU8693C+
         JRBP6j4+qLgmtKTFRag0Zmo4H5qSddNz2VZ48vVzzvdHpF2Urs8CHYyTraKpWW7591fW
         RHSA==
X-Gm-Message-State: APuU4Z+Cou8C4xXtuCbP2hotAQWHIdsc/FDP43wJL7dy76xZ/ch3gwSP
	Ct7RlWOTba4yGkMV5huZ7+fw9wzU6sF+7sc22SE/y7B8DTQM+7c0uGx5ORol7RvxlXA=
X-Gm-Gg: AYBFou0Gu5K6JOCuS4mOpyVuYG7be1t9nANCFL0IDt336bBDqFVLVx/IVY7WosqtphR
	7VDDh8zqNEQCNTOhf2cyMwppW2GO5mofS7U0OHj1PDJ1UW3xpgVXmB1QJfbSiQMEIs3zzCEGNwe
	JRAG05MHreW89rhphfE6cFoFnwXhtkzX7ApXq/XD6cXQWt8mgRBF359BIBeUIl1Wiv32/b3XuG8
	jw+iYHNvwhoIenC3J/K+aRBBnsk6FQd6zU/SiCRQ1C1MOuYrP0jefm1yOM01zcY6osnOu/L4DTg
	v/ghbJ5C0T9TXsCQUlSCe28FY9HoExuArfanfPooUa6O5HRJtswGtl4SDK773GMjrpNa9P++TYj
	e4ct9yx6kiGamCWMCYPiukmipm4YtU9FJN/d5fW3BV9s1jtM1C7cG5Ls9IXjif4gAdDPR639VD/
	nc/NzGCkdrcYCQhf5pLIibXX7M8xKfhOEbdNpRk0FG/Sn9T4kmZz7iv1OrkhIpFNimDDPTNGLex
	id6JmQgbVsC4pXvBswxBZ3CCSipspuLojVoGXMWxKZ0hAHQxa9YTRb+52X4XOgldbFisEWT0I0W
	nBXraoySsbSV3AxF+F01Mtd++DD6X74OdLTVeJuB5WYLvQaIJugmsBpeDj4PNCtEa8CVrcg9p5t
	rs+0Qf8baaaqO/w==
X-Received: by 2002:a05:6000:248a:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-499c792df18mr850020f8f.43.1794357747215;
        Tue, 10 Nov 2026 16:42:27 -0800 (PST)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm8383111f8f.57.2026.11.10.16.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 16:42:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 00:42:24 +0000
Message-Id: <DMRYQFZGG5ZI.2T97YA5MCL74Y@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [thermal: thermal/linux-next] thermal/drivers/samsung:
 acpm-tmu: Rename platform driver to "exynos-acpm-tmu"
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <linux-pm@vger.kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
 <179389375857.1009794.283716939057872036.tip-bot2@tip-bot2>
In-Reply-To: <179389375857.1009794.283716939057872036.tip-bot2@tip-bot2>

On Thu Nov 5, 2026 at 3:49 PM GMT, thermal-bot for Tudor Ambarus wrote:
> The following commit has been merged into the thermal/linux-next branch o=
f thermal:
>
> Commit-ID:     ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
> Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/thermal/li=
nux.git//ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
> Author:        Tudor Ambarus <tudor.ambarus@linaro.org>
> AuthorDate:    Mon, 26 Oct 2026 16:01:28=20
> Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
> CommitterDate: Tue, 03 Nov 2026 19:51:51 +01:00
>
> thermal/drivers/samsung: acpm-tmu: Rename platform driver to "exynos-acpm=
-tmu"

Also, the fix for this problem was sent here earlier:
https://lore.kernel.org/linux-samsung-soc/20261020-acpm-thermal-drv-name-fi=
x-v1-1-71f72280583b@linaro.org/

Why taking this one and ignoring the fix that was sent earlier -- this
should be at least explained.

> Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
> that the ACPM TMU architecture is shared across Samsung Exynos SoCs
> (such as GS101, AutoV920, and Exynos850) rather than being specific to
> GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.
>
> Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>

I don't recall suggesting this. Reporting -- yes, but not renaming to
"exynos-acpm-tmu".

This was reported months ago and was never fixed in the updated
series for acpm-tmu.c.

> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
> Link: https://patch.msgid.link/20261026-acpm-tmu-fixes-v1-11-0637431b7268=
@linaro.org
> ---
>  drivers/thermal/samsung/acpm-tmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> index 42b338d..2324efc 100644
> --- a/drivers/thermal/samsung/acpm-tmu.c
> +++ b/drivers/thermal/samsung/acpm-tmu.c
> @@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops =3D {
> =20
>  static struct platform_driver acpm_tmu_driver =3D {
>  	.driver =3D {
> -		.name   =3D "gs-tmu",
> +		.name   =3D "exynos-acpm-tmu",

It is minor but it potentially clashes with exynos-acpm-tmu firmware
file name. All other names in file acpm-tmu.c are "acpm-tmu".

