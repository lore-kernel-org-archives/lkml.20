Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EC37C92D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021050; cv=pass; b=RTJ67oAEHy69y6/QnT0nGTi6C9kmYQ+dvLjgmlVLJVWMlJ5pinyp3VDeW5u963sLJOF3uOk5gma82KGRLLJJ7cd36NJX5YNr+Sti0VH9x0FdJNQ5tn3wCpqEvbF/Rrl5bmXTkhxab/F/mJ1ir6c+u+yeeyzBg8Fv8RNGcwYHJNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021050; c=relaxed/simple;
	bh=cPrLSyGwGLPmONlY2FTynuZ/8LkekDLtwBlnPe36bVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShRXX/+l8ImpXWhUsozKHudWg9+7O88oNy1cPdB9267wUUMn2VyLZ/cfUgIssa2KQFmZQ8439rGN08ang3d5prGbYk53450GpaJy4oR4C+hfXsevGlJ4DPGWKf9SgwygzhVckUCXGkvDazhfRjHQsq0w0AcXmmbmsS4CUNQIhho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3IRDFHO; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3IRDFHO"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-765c077b5c1so2328722137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021039; cv=none;
        d=google.com; s=arc-20260327;
        b=KCKOKuaIJdk97EIwUeycnHu+YsbfaebTiqUg1K2MCarbftUdCLUVoynEdirim1sZNJ
         OqC8WNii4uSEsUfyrjqCuESHBZ69Jxf+PvdO7yTZiMhRvyErpWodC6I5W9a3DOmrawj2
         MH+Gp92FFYnoYQrL7UL8YkO5GPWTR60BO0Hsw7uvI4p9W5KrK7dqT7UI2Q094QP9bLW8
         Dshv+9UhDfcMwsMY84oR5KsagPj2zAP+c1yXZb8pbXI8JpphEmBDO67lIyNqDiYze7UQ
         DvbHh7LzaA+GCv8pX0ryOP429lgZ09joWTVZLXviM6UZKwxb7hf3mMog0wKnJxxtWv0b
         Ta5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        fh=RnxLmKgWDWglo+axLboAZSBYBhynzuVvGyEv6Fqs3s0=;
        b=BPgOPigjm483FEPXYKlD/GySLBHYIEWaJtUlLOPvYQhPorEa9zGO9AqkJ+tuJ4fWBt
         l9yL0M6LJGPk57gvKQ33tkat8upMpw7Cd7ojelECFn++q9lgv91y/zWaCoh1xtrZYiJQ
         Yjhap/SeR8wzufvGyKHm/+HQgUKP/7ToPwYzBtk5wjRrK/mVu67gJcDY56gIwkhmemfl
         KBk35jKKtxBjxAts9qWuTmr7TFm/vbtiOnMu+ndp215JF1Ycqy93myj8KUlbcZk+eynF
         5TDaL7QkpR5hOxgCcGsFo78NnEdmCjVXK1vA3ppzlsVpKahu7ssjLEUJa1RpzF7qLOWA
         9c9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021039; x=1789625839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=s3IRDFHORWZQjwdW8fT9py5zLtdIu3NrcUBW8HwlshmHkVbq7hSqqQnn/JXiPd1oRB
         MrjoTiU25YpaKxuU3fFnrY9y7J2Li1XRnfOMF0ZYVgkI0XYO/Wj8f/mzkR+9nhlX3NIR
         +J0AQYTFrnxg2+Mr0eairAHic8ngLO5WMIJ8SoSIq4IQJiGqAyhHlkMmeDOT3ksQHYL1
         mm3O4SkyotrikclbGD1ICnejW1wNu8YfX5TC1v0pM1z79Y6cqMwQaNekO9pRC4UOx4dZ
         OaDm+JCSFl7phKSKvx5WwDTnZM38t1rDSHxrqcXdhggVw75ZLi/1+GmSCGTzjcBqOasa
         Sk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021039; x=1789625839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=E0L/veabmNjcfytnfaL5h3BcqCROizv5TQTwUnZKXTQs3AnRn7BtSoc99A5GWefTYQ
         NcFca8HtqiPes7/frVnLAkLIQb6nl7noPOXf47nRcyPglLiRE6SuH0cRZ0whUyckPUEs
         Wrd1WjzLFNaGjPf8jG1v9zeitoA/Dllyji2tegBKlloOJvoo5LkUUq28SsfH6Ni6EV0v
         jXsTJWjigHmmfL8uGd0p80WITRMYt4ZMS9W6wBrDr1yJvWggR9LnsT/BI6NSNTqtLXfU
         drj/azjNYJXZr8TWiEJcVLmQvhaPPCGRu5POoLaU5Imlx8Hl+3+DXlEMLhQdmCBOqRyc
         aDTA==
X-Forwarded-Encrypted: i=1; AKwUvBzfRhzhXoQ0QIY40Dw0TaIFH6TxlvQ0nshdgQ7TonrY9rzxuIq8eeUsBwOX85lgh2voVYo9/KybOQzKhDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mtXdETANm8VBpflmvujKEiYu3WF58jzuoiK1FgMzsGpJALeGdq
	gSxnlPi3c1Xiy2dzXGuvYwaQoWQ5bZQsV8vusGH6it9J+evNSJOHx7buugat2FFWvBegOuuxc4i
	oLxRj2jI0daUXc809yGi5SZGjb97LyTk=
X-Gm-Gg: AYBFou1pZoukffEI6i6rj2OPzNrMTsPsrawfBC0f6Pj/zkd8Lx15eHHffgBInJNGQK3
	LG2YFUCWAhrhypaBy1XkEB5a69Dk8xwMaNkeze2b3TzPcG8OVPYE5vdG2qYSG1AmDCuIwMLiNoy
	iXpC9PosWb3GVh12udJq7H1I8WEcOM2mYEz2+OQuSSTyCaEycWMdN6W1TnwZaXfnbCPsL3nfAJh
	AVIkVf6RsIAQqtSgOk/n/BqF4wqUDJJw5uqJiWUhZsQ/fXoJMkPvVSUrAVV3zXrTPzQ3BsN/0oS
	t59gA4sjOCSw7LfxW9Jr6YyyldjICN8Y2con+puFQs30fcq8Oy1mlBCz1xz19RjrYfHktg==
X-Received: by 2002:a05:6102:fa8:b0:78f:5bab:4761 with SMTP id
 ada2fe7eead31-78f5bab4867mr6319524137.8.1789021039061; Wed, 09 Sep 2026
 23:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com> <20260907-kangaroo-ascend-d0541fbdc975@spud>
In-Reply-To: <20260907-kangaroo-ascend-d0541fbdc975@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 10 Sep 2026 14:17:05 +0800
X-Gm-Features: AcwNN1WJnyA4tn7yoArv1afcfdYawuxDz1IlQc9gvSLXyiXSPW2rdMiDiRDwIWA
Message-ID: <CAPBH0A9ULmcNV_SGf7GsywpdW_LZubkFY8hCrV7x_oXtv6-7dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 02:52:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++=
++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..c9bf19902d3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> If the programming model for these devices doesn't differ, one should
> fall back to the other.
>
Thanks for review.
I will update.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,vout-scale-micro:
> > +    description: |
> > +      Scaling factor applied to READ_VOUT telemetry.
> > +
> > +      TDA38740/25 pin strap parts are available in two flavors of
> > +      VOUT_SCALE_LOOP: 1:1 and 1:2.
> > +
> > +      For the 1:1 VOUT_SCALE_LOOP version, output voltage sense pins a=
re
> > +      directly connected to the output, and no resistor divider is use=
d.
> > +
> > +      For the 1:2 version, a resistor divider is typically used (for e=
xample,
> > +      499 ohms for both top and bottom resistors).
> > +
> > +      In some designs, users intentionally modify the feedback divider=
 ratio
> > +      to obtain an output voltage different from the internally config=
ured
> > +      VBOOT or VOUT value.
> > +
> > +      In such cases, the device telemetry (READ_VOUT) continues to rep=
ort
> > +      the internally programmed voltage and does not reflect the actua=
l
> > +      externally adjusted output voltage.
> > +
> > +      This property provides a multiplier to scale the reported teleme=
try
> > +      value so that the monitoring system reflects the actual output v=
oltage.
> > +
> > +      The value shall be expressed in micro units where 1,000,000 repr=
esents
> > +      a scaling factor of 1.0.
> > +
> > +      Example:
> > +        If actual Vout =3D 0.75V and READ_VOUT reports 0.7V:
> > +        scaling factor =3D 0.75 / 0.7 =3D 1.071
> > +        value =3D 1071000
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 100000
> > +    maximum: 2000000
>
> This is not a required property, so you need a default.
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Thanks.
I will add the default.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        sensor@40 {
> > +            compatible =3D "infineon,tda38740";
> > +            reg =3D <0x40>;
> > +            infineon,vout-scale-micro =3D <1071000>;
> > +        };
> > +    };
> > +
> >
> > --
> > 2.34.1
> >
