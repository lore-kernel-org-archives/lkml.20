Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25C441605
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122673; cv=pass; b=LUGcClfsUSaxcjh1dVWfKepHJYFCa95vCHF4YkKG28EhRWY5/HGJjuxqtDTG2ffSKQhgjyfHXx015OEaqJLRGXJAsxzXNcrN1ehVfdpVJsiMVNcH+kKcvS/HHCyTDUsHj/idhruYaExzBU7rbrETHUsKr4Fi2yKtYGZyU9GrC58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122673; c=relaxed/simple;
	bh=zQvitaeXvIXPsBzLHJD4W7X6qye0XVH/jk4cnitg1Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT5s66Dzk5J8ig0WBvEjO4obtm46++O2JoyAuL5czcR70dPKbKkGHWvHUFzGgfU4s0LJQTxq1uln+V1bhm+K23ozRC+PVMG7iLkpGHM35lZp0cKrH84LFeFzWalkcvt1NTbUyPugVD3h2c530NLrj+gBY1T3Fg81Q8ds5T9DVBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftQUyQkG; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftQUyQkG"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ac8c533385so4712687b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791122671; cv=none;
        d=google.com; s=arc-20260327;
        b=eUByRuvZkhA1UHu5mrSZuBcodJC+0vFr48PCdFHQtUcnVnN0mAidTq/oiFJ9wtME6E
         E17VjevVHYwtJukfFI3J6IC5hIZydw72Mqwi/hk4wtn+J6Dm/gFysCMc6liCEFzWVcwp
         0uEBbbPp43nWG9yoLAVc/GWfrKkgpnS9HYGDuulnJBsuqGeWzgfYf7iO6dNFvjBaNbwU
         ROCSNZ72riv5BFlmIc5q9C6jjnPzGOnDhPFTWBYh4HXPFiwvJDNncNm5kUHOpAxhTQ7q
         i2kffri8OdjJDnHXDh9rVIXGeIcevLS0nRvzdsejJRlRXrjktPGVb3hocoBbEia4Q0Gf
         8Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        fh=VyoACvUqI9b4mqnta+LgJTCOCaO8qtK2IRYH2ksbLHQ=;
        b=J+VwEJkRh4oEiN462XW6OU73RIPJwHRIiIcLjWGfN5aP9xCTdC7CV/YRjNk4vSRTHF
         S9qyh3++kY+Har8c6is5QrXEJ7ZhUqQu0e/I/XoMaaEnHMuhjCHEtP6ScW8GXY7AhbJf
         bSZAz6jAHO1W2CASVWxKWedY7yodAz2ZqR1D2dT52YEIic+3he4tYyyca6nHE0EnhBKp
         XMIkkV9qzSvFyuAPuY9CxGS5KliXHeByphRYg1kE4BYMcDSzEf3ej7ZRxi88AeiNye11
         1tKCZnoV3OmgZ+AfMkdPE/ZcG7jokszwY4NQbfRs1AZ8Y093hdwm3S0C8Fa4Yn8+ofap
         zWaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122671; x=1791727471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        b=ftQUyQkG+UApOz3N48cMNnWYQL4ijCkijE5ox8/EKFDbl4A+U0lAwXlsIa4D/ZQAKi
         i09beRXkWesIif+5Q79oRGas+iuXUYz7FpfD6OtT9mUQWsepBuVyu6IaJTQ1q6/wC4nB
         lA9+xS5s3T1q957OsDiwUX6wt5JBrivakwbyhtA3BN7C2/roUEvnQrLQPn1zweqQPHsK
         HmijqrBuc4EAuulTL2fYBd/1pT3PApE2yUUX2MDq1Jv4pdWbr74f3feD8B/+/RIrw28f
         TtzmRg1HcRYKO3asm2EsftP/3bVODcI/H6gU44DlETGNyYb+2qcV6nmJjNyiHasd49V+
         fBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122671; x=1791727471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        b=oFj9F6x8J3kGe+eCiR+ywNDZmOVhveIYR4rFhfaJIJyj4pmlYtClaPZrAnLNfao1Am
         Tqd/l0sYdaDPshMae7oBUsuxJGB0UMUR3w5oZJwqo4dIrgHpmrsn+Zvf7tPzE+37c9hX
         b9qXf9S+RGcLoKwNiDX40Bx0J1sxXp5qT8qhVregrMzGIdTzJVfNlzqcnPpq+9zPe2AV
         byhMxICkczy9dOJ4BOZRE3S7+VLHYgggXWRJbkg/LtQiAKGLVi/B3YFQdU+zck9aqkw0
         xm7ttW4u4OOaHXvFY1DJ8LrRdpN+Siyf/mLgRjRLxXCJydIFrqudpv2nI/3vP1jP0lzb
         AoUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl5341TDqmObwSocpcoDm8ITv+C5DMKIfGgTsishN8rSjDXz03Lqzlb/oGPmnnimE0pRM0zFm3DzOVYYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKDrSakZzx3wxLe6EBmwCDbJ2xEkK33+0vAwZUtSr5AuG3OA8Z
	rciC5dNSje8XEjuXRdGJ8WWiRs4SrafxGDvyCKavTfklHcqEtFFyo2sKA8A/Iugqi7L9cR6Z+fS
	1XDK0YsBb7MVILsKeo0QbloURuOec1qk=
X-Gm-Gg: AYBFou21VblKy0xWihqeiolM+gFw67MBYSO2nOV1Y9as9XaCCkW8vb44Vwe43QfvKuP
	RmHQzq2OpDzYy/a0E54NcHg3IncfhqQlxOSwM2cyFdAqLuh2swHKPTPm6je/iMugdwsjagibV0g
	/CFkViryPZcKpq/KqyMCNIWUWZ4HzqSs+uK2rAS8l2L4D7Y4GZWDkCZjBbE0u/Dn0iailCZ5X3C
	FYiQFiWtLPPoyN495+xLZ9UGwr0OSqOgRAqmZBh+9h/r7QoEYJup3Y1TEbKTeC12tBVIgA4WvX7
	H9iW6kzC6TxkX3DAouoaChyOqW3c2BdOOGCTVXSpbUNHA9UsERCEzlHJ3DVQDoBZsS0=
X-Received: by 2002:a05:690c:808:b0:894:4ded:2746 with SMTP id
 00721157ae682-8ae39bc3a5emr29986867b3.36.1791122670719; Sun, 04 Oct 2026
 07:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org> <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
 <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org>
In-Reply-To: <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 4 Oct 2026 19:34:19 +0530
X-Gm-Features: AclHuK-smCoxAzq60YVQ3K1PKT1W0UA8Bq-Qwa7xNOwTShMYhxgCUih7FvIhu4Y
Message-ID: <CAAj-GBkPTmSxjKcXrzeMA3bz89vPGHt0Ai4Gat3KSz3epusRjw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:39=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/09/2026 19:58, Uday Kiran wrote:
> > On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/09/2026 16:29, Uday Kiran wrote:
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: lacie,netxbig-leds
> >>>>> +
> >>>>> +  gpio-ext:
> >>>>> +    description: Phandle for the gpio-ext bus.
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>> +
> >>>>> +  timers:
> >>>>> +    description: |
> >>>>> +      Timer array. Each timer entry is represented by three intege=
rs:
> >>>>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>>> +
> >>>>> +patternProperties:
> >>>>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>>>
> >>>> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>>>
> >>>> Actually entire pattern is very odd - it has $ in the middle, but th=
en
> >>>> followed with other REQUIRED stuff. I am surprised it works, but
> >>>> regardless it is absolutely not readable. Looks like a begative patt=
ern,
> >>>> but why would you have negative pattern for known properties?
> >>>
> >>> Thanks for the review Krzysztof.
> >>>
> >>> The negative lookahead was added because patternProperties matches al=
l top-
> >>> level property names that fit the pattern, so excluded known top-leve=
l
> >>> properties like gpio-ext and pinctrl-*;
> >>>
> >>> In patch v1, I've used additionalProperties which removes the regex e=
ntirely
> >>> and allows arbitrary child-node names. But removed and used patternPr=
operties
> >>> as per the review feedback.
> >>>
> >>> Could you please suggest to me which way to proceed? with additionalP=
roperties
> >>> or patternProperties
> >>
> >>
> >> The children are leds, so they should use generic node name pattern li=
ke
> >> "^led-[a-z0-9]+$"
> >
> > Yes, Krzysztof but the original binding uses blue-power, red-power,
> > blue-sata0, etc.
> > as LED child node names. Would you like me to rename these nodes to
> > led-blue-power, led-red-power, etc. to use the suggested
> > ^led-[a-z0-9]+$ pattern,
> > or should I retain the existing node names and use a more specific
> > pattern for them
> > like "^(blue|red)-(power|sata[0-9]+)$"
>
> I did not see original binding mentioning any names. Neither in the drive=
r.

Sorry for the delayed response, Krzysztof.

You are right that the binding text and the driver do not mandate node name=
s.
However, the existing device tree source use names like blue-power,
red-sata0, etc.:

arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi

Also, the driver uses the node name as a fallback LED label when the label
property is absent.

drivers/leds/leds-netxbig.c, lines 585-588.

If we enforce ^led-[a-z0-9]+$ in the schema, the existing DTS file would fa=
il
validation, and renaming the nodes would change the userspace-visible
LED names.

Regards,
Udaya Kiran Challa
