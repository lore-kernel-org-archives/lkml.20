Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DF23546E1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137004; cv=pass; b=HVAIeaKuNU0KVEaJQZ0JfCXLeB0PoTCzb0i0c5fvgKGdeEPe/gt5tvG+IqqoZCcmpDXogIkf+IgzKXgFSy4wK7Om/BasHaIYozFit1PfcdGI/lfcD+4RtCjDR29nE36JeqQUcgp7y3++sddGUjjbTVao8Tnt/+FqiRPvyEyLej0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137004; c=relaxed/simple;
	bh=RaPpBgN+D6zuIGLXpWCho2L5MGJqgyWZi2TZOyFTZio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpCeGuIrXgFdbdYONTQifymv7j9buZAea8WxIGURTuMd3UqD/+ivT0m19Iu467qM/Pj3L2GnCizFfCeNO5geiRbkSRHBjSaHWXbFraEwmGCOqADyUlVO/u688qqmhxdayaZXcs9H2SwNsGswQim0fzRm1TgstUtLnp4StNg+VtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSGCXqA+; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSGCXqA+"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66fc2844f0eso878057d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137002; cv=none;
        d=google.com; s=arc-20260327;
        b=rrQV0XFKTH1N0rhH0ZJvV2ojhbybQCbCoWb212IbV82HwY4AZfvdlvIuK89QVqHSxE
         UsfwO06KZzJQIKwl5Y8aTKusc9Uu3zxCjTz6S0JaPKIgUVc+AwRK71MnU9UJxUGCB2YF
         BIhamLqba/+EHG+RZYPcdB14bzyQr0v9dBrdpro3aGAJYEeSM1EDB0Jasdfpij2dO4ox
         e9zr/nhBxVxX+MOPqqRyjG4g6Bwiwrek9eztMJjYZ8AKh+zGHQOTC7RpMD+mXsIeH+Tb
         uagauzcSKkG/xx/1MoUP8jFZEu0ah2LWUQcRM9QpoehMi5JoLrE583m5SHhSOOo15XJk
         qKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        fh=RfOfNM5b1wCAS6vJuMjD9Wmk00G3MxBgqbnFLuMnIIU=;
        b=s5luRWISAmHULPenHknaq8V/FLM2fja3Ao5vnlrcpzBhqcvpP98fzY5TRyz18ARj8Y
         oXw7mOeDeZCL787xmyxTvIsNRMFy2WFSGWtlUCpHNL911YAycItMumyfg90qpAl9Ll5C
         3WCY7C73yumt+M5bbzV30VL/bl0ei/rSFzGesiyM2OQ2ONhNsnLZr59EUeqkCQGeGmVF
         DXkURIpngEuBzQgbilF05vX8TyO97PkVOLn4VZaPH9Wuvn5YATMD5ZMOwIpYqMDU8Q6y
         Vyh0mEfzpMqxoEwyxZrSm+XeSxnw2sli0ENXMa4Ms0lDWPEPp1J+F9RD7k+nF8nsMv25
         KtOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137002; x=1789741802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=PSGCXqA+LTembs6869Z6+lxEJE5qWTfM9LaWWMcnqcCEHU/L0Q9/Q1EScyhQETNJHn
         CgeLXwJFAqkW5S8l+CIznafqzuFnxQ6cXq/C0i9QGaTfYx8P4gYJ7tGujajZ+lsz9i8j
         Bi86sWqvVsCbgT5A9DuEM1Y+/cKa7+Wmd722aLUMsdITy9Fx+Uovrg0eUhIWh4Z0sgDH
         D8+yfkr10OgPotItzTY8OIMxWNDbALQ/Aqe7tTw1ZLOy+XRY0lS3+AFKTgnr/Kf5XwOa
         LcMzZLFsAnS/T/89yFd9s1mFATipv4UNXegcYE6kJxerR65S+hqg7N2SEfwXhqotbDGb
         sVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137002; x=1789741802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=Tb1EO2xtX/Z1xnU84Z+ZZhGsLmUi7ysaqRS3b/pZbB4KYp2dziEzvg8ViNKmXh+CE7
         6Tnf39psXh1Fl5yzz9z8X40axMFR0d9rw4ki0vOZ1PvrlhatVDsmRdKLRU9vxIvuCnzV
         YdnR0tf3QI60AnmT7ulQyNhtBFV+EWjZVR7O0/ySz5QFhSYHBTXIBKjkF3v1o/Kaf2pJ
         eo8hDK1GGPJYATUCmb/o5gGSwkKbjh+/JvKib/VqeEd2/iFIoHuiKML/paO5Z/vA/EbW
         0bo/Ro2ublBnaykvYHJFIkxSBNx9wBeGICvUFbHLIW6gbxPpiIVQmdPBOHR2ktKsOhUl
         ngXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY+wnO1G5tG06UmLFJ1G+hGUxBYfSPVzMZHco5xmmpW3/MZMN4FqG8KTxYw9nieRXwF7Bqs/bhN28E77k=@vger.kernel.org
X-Gm-Message-State: AFuF++mtmUTeBFoWuGxTWDEyNEYd9WNCGsvIpDmGvApOrsvxRlOThuiQ
	ytEMO8WAZUFhqf4TXPAHxUQmIFfs8hBKm9Hxz3rAzqIPpa9/ASZcuiMua5wXlV2xulJn23MGb2S
	l0Y9o+Ov7vyYCi3txd1wLHf+yDMyhjg4=
X-Gm-Gg: AYBFou21YhTr1cZZqo1DYW7ycP/q8gaj6jJ+Ez8PryqlG/baXRtrKRPjmfDDM/ZDdFJ
	RZhLWwdJvsu2fqDBJOjcB+VOqIcIrzZBws/zCX4CHU1lmHeuDsl74At45Eo0THkINXbU5knMYHm
	dhzb1upYIgNrrSiAuwUpwqx0pqlvtUh+KdF1urgFtBuax0OsxAtl2ak45aQOuNnyEOoNhXi8TBF
	uZI9yTX7Wv5NuJ0vADrD54mdQTXlnSPhgYVdLRn8Fe5xzd3XmuWxGIuN4+T7Lc/XLhpKE1dMUm5
	MpZMg9x35oEF8q+OE2GCew/b6B3Apb7LbdhCFntJH+yizT2Jx7Eic3zhnusqICkkpXw=
X-Received: by 2002:a05:690e:d48:b0:66e:57d3:766f with SMTP id
 956f58d0204a3-6712457ec2amr1411116d50.5.1789137002131; Fri, 11 Sep 2026
 07:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com> <20260909-arcane-yellow-beluga-5ce6f7@quoll>
In-Reply-To: <20260909-arcane-yellow-beluga-5ce6f7@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Fri, 11 Sep 2026 19:59:49 +0530
X-Gm-Features: AcwNN1XJ7ErReuk8FrPMLVElmntuOvsTP3mJQkZbaLhh_fmWSTDFDh93bPAgHIo
Message-ID: <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +properties:
> > +  compatible:
> > +    const: lacie,netxbig-leds
> > +
> > +  gpio-ext:
> > +    description: Phandle for the gpio-ext bus.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  timers:
> > +    description: |
> > +      Timer array. Each timer entry is represented by three integers:
> > +      Mode (gpio-ext bus), delay_on and delay_off.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +patternProperties:
> > +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
>
> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
>
> Actually entire pattern is very odd - it has $ in the middle, but then
> followed with other REQUIRED stuff. I am surprised it works, but
> regardless it is absolutely not readable. Looks like a begative pattern,
> but why would you have negative pattern for known properties?

Thanks for the review Krzysztof.

The negative lookahead was added because patternProperties matches all top-
level property names that fit the pattern, so excluded known top-level
properties like gpio-ext and pinctrl-*;

In patch v1, I've used additionalProperties which removes the regex entirely
and allows arbitrary child-node names. But removed and used patternProperties
as per the review feedback.

Could you please suggest to me which way to proceed? with additionalProperties
or patternProperties

>
>
>
>
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      label: true
> > +      linux,default-trigger: true
>
> Drop both, common.yaml provides these.

Taken care in the next revision.

>
> > +
> > +      mode-addr:
> > +        description: Mode register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      mode-val:
> > +        description: |
>
> Do not need '|' unless you need to preserve formatting.

Taken care in the next revision.

>
> > +          Mode to value mapping. Each entry is represented by two integers:
> > +          a mode and the corresponding value on the gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +      bright-addr:
> > +        description: Brightness register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      max-brightness:
> > +        description: Maximum brightness value.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    required:
> > +      - mode-addr
> > +      - mode-val
> > +      - bright-addr
> > +      - max-brightness
> > +
> > +required:
> > +  - compatible
> > +  - gpio-ext
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/leds-netxbig.h>
> > +
> > +    netxbig-leds {
>
> Just "leds"

Taken care in the next revision.

>
> > +        compatible = "lacie,netxbig-leds";
>

Regards,
Udaya Kiran Challa
