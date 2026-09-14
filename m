Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8DE49AA55
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408700; cv=pass; b=aIqR4VnH5X6zJiaknRKmdIVRDreZS2AW9BJZCrkhCyWdozfYsqyuIne0K55nyYR/hlNHaidlxYHXUWut7GVi2I65HU92sNaIanLUZur5Ua/wjsR3SrBS4BAZi4Z8Anl9GU/JKXpl4gOVqOzLq1p8Ki/8hBLE/hDbfu+RY/GKEj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408700; c=relaxed/simple;
	bh=MC6tVURhAg6t9rRXYll8+R5TEvwcrPn5tWtq6NstdZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kce7Pie0Qg/frNglNDFw79pcyfcJG5qy+GhpIHUuWTqRqaTnkh8aQrA7aRS+NVVYp0D/Zu3N9QEiM0I4VhcGYbmuOn+JXFBnbHgo31P06FHzIbzbHVnAEc1LlqfJ83mrOeVWvGlXobiMJgJVNztGPtMamY+ZtkLbIJ6T/sX9YOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBDIXb2C; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBDIXb2C"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-87ffa98d4a9so32789197b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789408697; cv=none;
        d=google.com; s=arc-20260327;
        b=oMmGTE0Am3cEQExKZk24szCAu8NmbsRbIZDKGSnAshdL2TzQZ2gLieBGjpjnjTAisS
         o+mxhSrQELuPfwm0rPlApL68yuCZywUUryAF86dUT7G1Ws3F66vgYQZ6YXYrIRCeK1IZ
         4vm/hxriled1Pj0r3Dn49lzG9dYFMe0JLNy6CB9BydYhvmmndDFCjDA8quzLDZ3cnbie
         MA754xQZststPFEZMS6kmiskTkbXKbKq0fQX76AYw7TZSO/SoN/STskC7fM9oJQyDm4n
         EKI3zQ1O0M1rWOsMjo/3xOWiVrJFNpV82Ma1n05R6QJtvD9r71ZdBvCyHipcKl7yrj0f
         Ar0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        fh=Kuz7PqEc9q8DUrM8+q1Doav0T17wXRkfmbMDDTAS8ys=;
        b=FRfXE/f6GzbeNyrx0CJAN3qd07JERjE1pbZQ8ANhqkSnGChWjqpDu3mkhCG/vQkjpv
         k+hQ8iwypokv0x+n6tKO0ncLcpmBTu3jlwsjNKx71cPGLe6a3E0Il2OHfXeOpGaAWdGD
         ORNpNiFkYHK44+KoYsZNP+bdwsaxg5gAmRWxlc6+GhLCLLLZZP0WXzuESwGDGNB1dK6h
         VI6ySyKibqfUmyplnHFZM6pQTbfHAYLpYVviglgGWAfNfzrI3VV9N6McjT44H1aHywdQ
         3TB+kJDHIjtXbU7AM7zZIDu1rxWY96OZYk+hYBYxf8TOeHrl/rHavaaGOo/FiS8nAw2M
         D/6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408697; x=1790013497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=WBDIXb2CzThvh/ReckI1zVvavMA1he7nL3wkYVtzY/weJ3J3T6cN+23Ixhe8GT93uJ
         qCAPeFHKzDaIt0efqo5g5vn/ek4/0ijzh5GlcPBmT8psoaTG6hlCcWZD30YOAZ+iGxpr
         NWOg63QOOI9c81vRrMLGBapGWMw+/i3RBFOgm+LWckTohVrRkrm+N+DMMrHHId8PbdjW
         iRo7tftaq2kh5GFEt3btorciKnWpVlCJS9nwnLhUbutXxWP4IEgrFkBjVE61EIxu4jCs
         4m840sYq/6TdnmvXOaTKbeFUa1DF3v85Pjwo/VQdnzaaAMKZVfPBamMVYrOAqc/HkzUI
         9Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408697; x=1790013497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=VX8guMVpXaDO96c6SXQ0Pe7xkjRSJaIcJtf8pemHtCQItghTyPzgTnE8ruBVgD8uyo
         FHLDAOyiD887IUIofOPIZtW3BVGx3yYb20xu7cTWFDLzupQAY+ZE0TvumYdlHwE+D7Dq
         MBZVABbxRcbE0XQQXSHXcZQr7ch5ebxD/MgCAs5ZlfZ4uRFcaDViY/xKAp6ECIjhT1bc
         p26XXuI563DWiFusAw+ZkIaNQqegloKS7M2Qkz2aVmOANhjGIhaO2eL8gUU7k51ArtRA
         AbACRlHLYCQTUjiS0P5LLFBQ2cTyKszmIsbKAuybf1NuohGZz+isGFNXFAXp8qTdu/1z
         y+VA==
X-Forwarded-Encrypted: i=1; AKwUvBwrjRA2xHnyyZ2xar+XVuLkdB3eDHZEuL02i8b1i4weR2LjfBoFDs0MAuyPvFdzmHpV0xNUqEYtYp/iFB4=@vger.kernel.org
X-Gm-Message-State: AFuF++nUXGUiR9jb3eUujVI5cBuJmsM0OZ5g/s4GjXgfiLrH7HuK7BI/
	ITIZFj+bCZibG+/OER76Bz3k1wzOPBZfguAAGGTxQDDwrA128/ECzChDYKcqwn095XSbW56qB71
	SBKnJhZ8rTpW8ns4ORIFEtmVPnc9FWF4=
X-Gm-Gg: AYBFou1ctJ7LXcaY8DSFia1iLL/dVNZUu8FIdag55pXK8nXyh0d2QlLZ56EpXSSmmy9
	MozhDO2tTZkUID5beqlNkWQr+fW6ARGogs2dbdvWSAloPQ+mUBXfCLZlWMBL5oVz3eoT7PKICQK
	Gi6rx1mrra4bDnbQS2Ta2Msx3dcGk15Db9ytDHXRw6LKGslYUEYsKaqhTTMsUH2FqpVhTfIXHwF
	C4hqe4rMy8pbsl/CzNGgbmcgQNZlE8cg/St/M0485i+0x1iFPhSlKwmgVWph2IyvSwqWkS84tV5
	Wg9QGHYde8Gk/ErXuAcfS9zDvv8v5KlQD1hdsXx9xKl7OAsHO6vGqDCPeMtIzp1GvxrPPJOcWYS
	9nQ1eaSGbvyGFPP/7XvMqLwSm
X-Received: by 2002:a05:690c:dd4:b0:873:5bb2:6c04 with SMTP id
 00721157ae682-88d22120688mr11381817b3.46.1789408697551; Mon, 14 Sep 2026
 10:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
In-Reply-To: <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Mon, 14 Sep 2026 23:28:06 +0530
X-Gm-Features: AcwNN1XmAr2U4Y7hTnsIi3akRJyGBw_2Sdlm7tt1jAvzlcyQNUU17kLda5H3aR4
Message-ID: <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2026 16:29, Uday Kiran wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lacie,netxbig-leds
> >>> +
> >>> +  gpio-ext:
> >>> +    description: Phandle for the gpio-ext bus.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +  timers:
> >>> +    description: |
> >>> +      Timer array. Each timer entry is represented by three integers=
:
> >>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +patternProperties:
> >>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>
> >> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>
> >> Actually entire pattern is very odd - it has $ in the middle, but then
> >> followed with other REQUIRED stuff. I am surprised it works, but
> >> regardless it is absolutely not readable. Looks like a begative patter=
n,
> >> but why would you have negative pattern for known properties?
> >
> > Thanks for the review Krzysztof.
> >
> > The negative lookahead was added because patternProperties matches all =
top-
> > level property names that fit the pattern, so excluded known top-level
> > properties like gpio-ext and pinctrl-*;
> >
> > In patch v1, I've used additionalProperties which removes the regex ent=
irely
> > and allows arbitrary child-node names. But removed and used patternProp=
erties
> > as per the review feedback.
> >
> > Could you please suggest to me which way to proceed? with additionalPro=
perties
> > or patternProperties
>
>
> The children are leds, so they should use generic node name pattern like
> "^led-[a-z0-9]+$"

Yes, Krzysztof but the original binding uses blue-power, red-power,
blue-sata0, etc.
as LED child node names. Would you like me to rename these nodes to
led-blue-power, led-red-power, etc. to use the suggested
^led-[a-z0-9]+$ pattern,
or should I retain the existing node names and use a more specific
pattern for them
like "^(blue|red)-(power|sata[0-9]+)$"

Regards,
Udaya Kiran Challa
