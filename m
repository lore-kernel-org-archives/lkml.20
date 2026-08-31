Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81041B8CC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220314; cv=pass; b=VOz80o7RSca3dulTfBESdGKfVRtKb0gzQ0tCgxfUVWH5rJyCX/L6/m7EJfcis3bDioh4CblY/D+JFvdtHS3kRdhaDNS+fyYRlPkmpeAmthnZzetRoWOyWPcdgIFD8T53sRHFTmAlcMC8S5Y4kCh95onoMJHYKHv15N2c8X4YQm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220314; c=relaxed/simple;
	bh=t3xYH86c4ExcaKChH03nscVoJU8EICNUpRC002l28p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU3fgn+v8lK/8qa75Ms6L+X9VYEJ8kfHEib7dfjji1aNglRqVN0o9hLHiPP6kB2t5vf+Y0ROjNK3ZoJrgnhlZD8jd+OoN7HQmNV/4qmzlHxr4KdjLgLVR1/yb/1sNrsRDHAAlpg3g5fTQd0J/1pxbh0HxFFz4gfgYqbVYP52mac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0XmTq+M; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0XmTq+M"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c254ce42dc2so57175166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788220311; cv=none;
        d=google.com; s=arc-20260327;
        b=E+6fgnmqOMfra4uuz/n7AAAN203mD+CYE0/P9O+Hcsn21KG4IvE7N4CsISRAXKqpiw
         reLXDQ/Z/CsgLQEH9vp0T11M0YdvnlBzbjN8nnzc2ivsWOYMW+TvOnI8TE8jDtoKsRa5
         mJTQ3cQfC4XgQh3zi7fUnMzcmXBX3L/DfAq9l7uyQdbzbJBINe9EBiwmL+2FMcJ/AuC1
         RAsnE7ilKwtWPEuGFVt8mUUzKUw3lkYF19abrY3WCHRkI2jOrDvBNSo4zfRjaqzmrAXN
         5ealX19IITyGDZ4Eqai6yy4daidUoF3hdEVVvIVsiMaop0pRFpoSNWx0NLB3d/pfTyim
         2upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        fh=V1Q/XKOAKq7MbamkPYE3d7QJJqDLnK0XwZVfYmtn1RY=;
        b=gjELaxFZvadfqaDegSKtz7CUQkReGlMbmIUtVt6TprcjU4iCRH4PzDQyfiSPTIZVkT
         bC7pEoEiYEcIckndP9T5tBPNUTDDAhGJiksp+yQNu8WRyULlwdAxkpkh6Nu9IflAtzbN
         AUWbfOcDM1Mrv0cIpoLZON2G1VJ+GQv9Fx6nE80/1KNeQYsOItDARYtiPGU8k5fOsiH2
         8+tkXAzGggz/hrOO+EZBYXVVkJZ/h24I61O8NnA6JVegHbZeNgRIO4aMt15diCgrweU/
         jKxMPyroopWDDUw/dax3ejQFkYK/kGlisJYPSqWVHzRY7J5REApmrdLNwLhU+1Z+wNZa
         g6zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788220311; x=1788825111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        b=j0XmTq+MWVZZoJEyl/HiVf27hDQ62KTcKDngUOqX7Rd3DpMLYfEluu04viTfJFTn7u
         u6YfwiwqjNOxshrgiJJlsfCwGfDGYxAN0ObJwOXhV//1uVn9YoTboLUVW1jdAn+AUcV6
         JdRaxvynPp4feqSyEuXdhWfFSRq+dO3mOtjvmxCRyj76kKFvaP1AZSvLGto4h4wRPDkA
         KP7Jr6KjexuDZtzK7A3h2G0rmwOZI0Ey1rxXxCuTsqgSV25dXj9pCz0HGnEMshUNd9Ji
         7Oxk2tOzLCt5Yf4g/hLFyr6aZdk5UWMnK3ZqNKBFQ1UxL2MpkG+DvQs4nlUjn9jGMr5V
         no2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788220311; x=1788825111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        b=biTnakoQwK/J1Jnqd4NHt2ZEM+dUanYtpkLttJ4DHYV8BLlDPBJAOMZRmwlnYtMIdt
         WpCk4awQT94PdgztSYCx7u24UiO/atuVfmF5/SB2RXt2ciNygh/ur0EIC7WOaykHfKvr
         QGa5CVXQnukgnspvtBMHrjOmarig8FLnYf63D+GIY4lOIvVoFglkb0uOqIHNAny7213V
         5kNlHUUic+qhCFPcdrtM3PSfNIkYDoniTiT9hApD5I6EiJvbYgpwR6Eap8yxNulmMdoO
         6RDEkcqtSAZCFSFzEvLtm1QNxeHpXc+jQBmKheewlFY25QogzB32bGjUhSlhZKwzEI1Q
         J7Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxgBdxzEcUHAGDtnX8Mw1afmyxLtDELwA7R6qoRGH4Q9UX761Rj/GR2N7HCtdPEOs+yI82jWJNi1LRL070=@vger.kernel.org
X-Gm-Message-State: AFuF++mtZBy18l6rxdlOEl7pUtUgo1YlJge64/A/okJzlF6o0Odl0iRT
	rqq2AA/P+u7M7mjbGGrnKAQnoojl0C44HXNGij24k6nfA+1dZU3fxkFxacU0o8M9NkyUrnUC44h
	kzBmdUGEdX3nqwFmtXAxwU6BHljvCnnQ=
X-Gm-Gg: AYBFou3VMByDTOaHuYFUr/fgV8cz6zjLHqQ5yjC/XvesgtJBl0EfITlrWCaydVneL77
	WE4EronQ+u5R/B7MH37c020ZY5cJKoP7Qn/fV765qX5iqkPJpwNBJaNZQKwWAHHTMuhN3TY+C3/
	LzURIKj9DIaEX6Vqcw6llHYDembqYOcklyq9sNLTL85fndDg47uOagbGcEe1j9mwjGN+whyECIT
	TpIB9OmkIDQ+dbUPlukGhmi3yk06mLSbMEgwgh9ZBpp7nxuOR9dr18LRcvHfyuC+qg2miQzNFbL
	aE/QK6Slb3gqE+1/cw2NhMTCxG4xxZ9feU+RWr1TgDZsgH6rzYWbZFSzd7PbrEAHpHXh02Ijzsv
	LIK8=
X-Received: by 2002:a05:6402:3204:b0:68e:4c0:f59a with SMTP id
 4fb4d7f45d1cf-6a668cbdadamr1448205a12.2.1788220310870; Mon, 31 Aug 2026
 16:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com> <20260830-honored-llama-of-realization-38eddd@quoll>
In-Reply-To: <20260830-honored-llama-of-realization-38eddd@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 05:21:38 +0530
X-Gm-Features: AcwNN1W9t_PNkWAnCMFSJa_lGVlfSOa-JFT3_994hP0eVrH-g0-08VIHzNJXlew
Message-ID: <CAOWyW_44Z4rQ98H_i_tO8bB2Jkj5psCeEEtT8kSEgL+XOGshOg@mail.gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 2:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Aug 22, 2026 at 12:40:28AM +0530, Bhargav Joshi wrote:
> > +    patternProperties:
> > +      "^ldo([0-9]|_rtc)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          nvidia,tegra-cpu-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "CPU domain" voltage regulat=
or.
> > +
> > +          nvidia,tegra-core-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "Core domain" voltage regula=
tor.
> > +
> > +          nvidia,tegra-rtc-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "RTC domain" voltage regulat=
or.
>
> These are coming from nvidia,tegra-regulators-coupling.txt, so the best
> if you also:
> 1. First patch: convert nvidia,tegra-regulators-coupling.txt, to a
> shared schema and correct other devices which use nvidia properties,
> e.g.: ti,tps62360.yaml if I am right.
>
> 2.  Second/this patch: reference here the schema
> allOf:
>  - $ref: regulator.yaml#
>  - $ref: nvidia,tegra-regulators-coupling.yaml

sure I'll send v2 shortly with suggested changes
>
> Rest looks good, thank you for doing the conversion. It is very
> appreciated, although I am bit slow with the reviews last days.
>
> Best regards,
> Krzysztof
>
