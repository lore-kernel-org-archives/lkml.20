Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FC472533
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791137840; cv=pass; b=sw41kwRrBUQ/hWfXX2lhWwH+XfyWnDFAz0nFeV3JNOpr7pjd/CEGVa6YdyYgso0Bn0Mj6nuUuPfOFdqDhIQqsBHrWwZdEbXoAvE8pMvY7DKRTqq/pHCX24hsBA/BBxVYiCnXzitYiWFcjI3agF4lvTgWzE5iyXoSSc0400S3pIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791137840; c=relaxed/simple;
	bh=cJR4lAp9V5AURTVqP2Gl5OsN2xzomRNzgeycLcomVm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGugjN5BbJRp0izhDdZzlg4tR5o6Agoev7PWHUufdm6WIZSnB/K0X2h6ZiVLJfCI4+hkpmqz7FHqUPjiDfEvUvVrxeLqEKadEbukejC5D9ZhZzmil0rkLZA5tHhMnp1tdSMovR68Tx6jkmWigU1oZre0v/NF0t6+Xmzo7m1LqXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAYqgGy9; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAYqgGy9"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-836c4474028so8031627b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791137838; cv=none;
        d=google.com; s=arc-20260327;
        b=NQWjSL0pH4uG7v+q8OK8cyvBdVofEk0i8x4TsCrMwa+vd6toIoRvYHKKFja0ALQEhV
         VOMVJzJk9v+xHLDZAqhKExAmKHZd2VmMv67iiWJlAiC0MY84TsESq/ZcJq9SUDO0a9X7
         cSCLaaJmLGU+mIu0/iJHk1Kll8DofmImK5CNXXZoRsSZG41L3zQ/Oz+67SHM91guA6YT
         rsZ13+qvb4iVMeNLWB+ar8HU/grJ5o+OoElmO8lhWNNfac+Yx3k714PzX0P7JaISSJqa
         cZmZBxxMdajiJpYGWPIxVOl21tYO4fAS2xloElTbUWGthAylSzC7fvw1i9bZALrKx4mM
         Q6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFmpccpIR+RbcQ/MVQmCJHkfs/R9fTCLwYQLZmcFH54=;
        fh=iRBSSLc5EKzQXZb0BXigNBtCy9E1mxYf+IpIYglwmMU=;
        b=AKaIDAnrCLBWnyXadDGaRMSJSnfueGjs8dT7ghua/kn2+0VCxbmkNOc0tWtE0NX1yo
         KL2BQa9bRmaUzCHo63r9ugmfSqcBJUVRtC+FF/08UCCUtKP9vcwWJUSmHmQN8eCRZVbn
         7eu/tp0FN0nWedVQ026lfpe6v+qhTOWtKfiTk+X5hI7Zujb1g6NG3YN6ACYkQq2EgsO/
         Uj+11R486rd6xdBrJocCGdcAQEYMauHJVsXYwneB/Vv4bGZsH1i8Jtcihq0vOHc7LupL
         5D8owIeLEdub/PG2NuXfTpUurQWcwB1cWZ25QiRRUBXk41TE/A++zvWrBLBiyjgg/Cab
         uDRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791137838; x=1791742638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFmpccpIR+RbcQ/MVQmCJHkfs/R9fTCLwYQLZmcFH54=;
        b=MAYqgGy9y5v1+6oe21qsvjYKYOjtqMCZCAXKdKRrBxJP6obvD5VsSRYhk48kJksZ3T
         s19bsLQ0z7YSFxqcIzVofZmjwOxf1U3NGExx+Um+hgYRubpXoIwkvqC4BS2Fsz0TFEN5
         v/Nkq2Q25TrkNRA1osSp8usmyxIPMEg/+jGOq0D/UwizXxP3qmA/CXaRY1FvyfMcumse
         UC1qZr2ez4JF5lQoeviwIjjfrK/9XwylCv2Yd7Vp3wbDrD7AY8Gf4sDqjQX+YkDhVVSR
         E1KtL5iTWLs59qX5Jb7nSKKo+ExYlZhfTCBP8xrlNSseBp3phODL3ez3zXnCCS5rqY33
         6M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137838; x=1791742638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFmpccpIR+RbcQ/MVQmCJHkfs/R9fTCLwYQLZmcFH54=;
        b=GAdLITLn1hpdXZV1dvutK6rtubiHZDitV6pF4XsOZX1b76P8Kr5BFdIkFGd6bqFYCe
         31ZxvduXfv+T+c/0NX1lMj0MYtSbMjO2+z1yg0Et7tDscxrOg4Vd5TQCSe0eK10OOtmk
         vFd7TcRhpI40cMNoq390U/FxOxfB0tkAw3yFrLyyO7jLpQSvxM7+kZYMbnd1v2pQzOFZ
         cv0bUPaNWW/NC9da8kMhh3TvJ9+sHycsCOV3bmjUBno7qv5V3d/SkwrunP+62kiY08Si
         asJCBUTPrcKegKL4Fuj9cK5Hx9WdIrl4TXqTFoW3HzMllQmx1Eb/Q1SXcGkZcLL2ikQD
         UmeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkXv3UCEwuCdz0x80r2mh//9W6tCUHaw0jEe2+cW2Wf9JLV0MurZmxdDR06FuopsD64jlyScuptvCVLS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIG/Zny6JKf/w4xQuQUcr6dBBpeP5Oe1FA+MEJappjce1Gcfk4
	rAK+JDexSqwl8endQGiUB4ir/SQcIk0qziV+175CQwUZBvznvUh5uo/UczUdosWvWJIf5EF9C/9
	bghg7sZ2d25uZAr1wngdNBqk/ngKzLlM=
X-Gm-Gg: AYBFou2/imSDrjO1YwazndQDzfoSY+CegA4pGJh2D4cUH9vGT6rEybGtyvDes1C0V4o
	lRk5iLRpbZGEHL4HQnSLy+Ghp5IJo9TCvq2608BUe7TmmoCTATKYeQpO0ypCnfCRaxwwHVPgBC7
	GWVPdcjMuchs0jXLSvLrb6hOh06pKm5qGPE3yhCN7C54DEmwiazQitqjsmRCJ5but8EMHbU1nXL
	zgkiW5t4U/xnmjGunb+FQI84QrudTZ9IKKNGnduaq4Ys/DrqQE5I/RonFaRG9im9UOXuYEzDJA+
	U1S7pMZ6Ik5LolvFgjGIXdZyhhtp07KM1wC04VcRMNcjW37qDVzkF+pfwnAmfYQDREw=
X-Received: by 2002:a05:690c:67c3:b0:8a5:af04:fb1d with SMTP id
 00721157ae682-8ae957d3279mr23973447b3.55.1791137838008; Sun, 04 Oct 2026
 11:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org> <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
 <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org> <CAAj-GBkPTmSxjKcXrzeMA3bz89vPGHt0Ai4Gat3KSz3epusRjw@mail.gmail.com>
 <5b34d2da-6e53-4a93-9d08-7d64e9072562@kernel.org>
In-Reply-To: <5b34d2da-6e53-4a93-9d08-7d64e9072562@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 4 Oct 2026 23:47:06 +0530
X-Gm-Features: AclHuK8yMHOs5OrM1gtLGut4uFd1mZ5OV0auRu3panCfI1lvD8IXn4aLVjemE3g
Message-ID: <CAAj-GBnDZ1NoGamjXFpE1wsnnQcUzjoSnsqxjzT6nsetYW0QZw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 8:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/10/2026 16:04, Uday Kiran wrote:
> > On Wed, Sep 16, 2026 at 11:39=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 14/09/2026 19:58, Uday Kiran wrote:
> >>> On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 11/09/2026 16:29, Uday Kiran wrote:
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    const: lacie,netxbig-leds
> >>>>>>> +
> >>>>>>> +  gpio-ext:
> >>>>>>> +    description: Phandle for the gpio-ext bus.
> >>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>>>> +
> >>>>>>> +  timers:
> >>>>>>> +    description: |
> >>>>>>> +      Timer array. Each timer entry is represented by three inte=
gers:
> >>>>>>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>>>>> +
> >>>>>>> +patternProperties:
> >>>>>>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>>>>>
> >>>>>> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>>>>>
> >>>>>> Actually entire pattern is very odd - it has $ in the middle, but =
then
> >>>>>> followed with other REQUIRED stuff. I am surprised it works, but
> >>>>>> regardless it is absolutely not readable. Looks like a begative pa=
ttern,
> >>>>>> but why would you have negative pattern for known properties?
> >>>>>
> >>>>> Thanks for the review Krzysztof.
> >>>>>
> >>>>> The negative lookahead was added because patternProperties matches =
all top-
> >>>>> level property names that fit the pattern, so excluded known top-le=
vel
> >>>>> properties like gpio-ext and pinctrl-*;
> >>>>>
> >>>>> In patch v1, I've used additionalProperties which removes the regex=
 entirely
> >>>>> and allows arbitrary child-node names. But removed and used pattern=
Properties
> >>>>> as per the review feedback.
> >>>>>
> >>>>> Could you please suggest to me which way to proceed? with additiona=
lProperties
> >>>>> or patternProperties
> >>>>
> >>>>
> >>>> The children are leds, so they should use generic node name pattern =
like
> >>>> "^led-[a-z0-9]+$"
> >>>
> >>> Yes, Krzysztof but the original binding uses blue-power, red-power,
> >>> blue-sata0, etc.
> >>> as LED child node names. Would you like me to rename these nodes to
> >>> led-blue-power, led-red-power, etc. to use the suggested
> >>> ^led-[a-z0-9]+$ pattern,
> >>> or should I retain the existing node names and use a more specific
> >>> pattern for them
> >>> like "^(blue|red)-(power|sata[0-9]+)$"
> >>
> >> I did not see original binding mentioning any names. Neither in the dr=
iver.
> >
> > Sorry for the delayed response, Krzysztof.
> >
> > You are right that the binding text and the driver do not mandate node =
names.
> > However, the existing device tree source use names like blue-power,
> > red-sata0, etc.:
> >
> > arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
> >
> > Also, the driver uses the node name as a fallback LED label when the la=
bel
> > property is absent.
> >
> > drivers/leds/leds-netxbig.c, lines 585-588.
>
> So what is the problem exactly? You rename the nodes and use label. Does
> anything break?

You are right. It will not break anything. will update the binding and DTS =
files
accordingly and send the next revision

Regards,
Udaya Kiran Challa
