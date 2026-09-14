Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688233F65EF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377196; cv=pass; b=TuL+7JWJCQu6EopJi49PJ+jErrQupNLa7z08RSUQ4y2yAZbN3rkDq+YQAKbGL/trAafn5kxgt8M2Amqi6M3a81Xml1JpV6t7cZEn0Eb0T3ZXSJOAJBd78EZ9DUsgwC6/9J7bdxwfrje2kjQrIzegCtt8UO15Ky9JVae2K3Ig71c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377196; c=relaxed/simple;
	bh=D0ETO3SqBIk5IEsQo2JSdEPccv7vE73Bpl//dCwOus0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq6ivnNNTUjY/JFZwv0SehBpnn/fFX96KXb4WLlUnD4qS3xTaKCFePuLoooNctwQ0UF0tkRWxcVVlZ+8dfi0W4VuSl3f0cpPSM2RVofnsJKzB/7Vcj9Yy2kT+VJO0diAo6SlcTSPIc0eaus6u0SFOkKFcGJIysR5CB+K5CHe8Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a44EaHOY; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a44EaHOY"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78564313adaso325229137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377192; cv=none;
        d=google.com; s=arc-20260327;
        b=iy1jaxEOYVZ4OWE7pLUFx73yJiOiJ4foBeNiP+tm4p8OuP7IBAyHcEJAdo/DXg+6os
         x6nqtDv6rX3xtcLH+paKTraWOoWqDf4tti1yrmSGqDhbsxwq7oqQvmU1u9GOEJ2GwVWP
         hlePwetVfk8h8aal8xSoUiPrkw92AH9CTe0FBtR+m8aQ55XZd0aagQ+W7VylbfhJsWWw
         +PKi6+gq80ysgCWZs2UKD6cD6W4vAkb+slqzeksjwzzt0Ah8ARBCp2NEWBiVK18vODLM
         3njo0OHU6Fx5ao8tmQQ7RxIwm6QUBR1W8elGDOuSZ7+Fwvi4cMQvyJpVoN1IanB3UCmB
         vpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        fh=BEHMGA5jzvYOXMUpq64IjoF/19MAx1Fn7awI466ObaQ=;
        b=pkTKru4XqaHpOf84ZDwsyAQ7CkneYEqwOPDyo4yDtZ+A3MJmD+//FdsuK/m7b+VfMF
         Vvoxb+7xO40Ktmlcj8i30BWbd9qvXrqczYl1xZmzPkSOERBOrmi8Sr6DbXNzDKnwl7nW
         TLGiWmEe4Vko0rjzwhvqKaLvOHOQ3OS2P8CI1+t8tox+Y3L8WqrbDvTy6BjsLgDjzA8v
         bopz9bhsBFif3EG4kr1yKvoJmj93nyom55WBqqaPKgUC1iwwYMqxc03DafKfyc8ogh06
         8bp7ealG+MfMGgsOnl6qp0UghVAt261kF37IGx73TJ/bvEwo/arsMc0OWzF2BdzasqJ4
         1ECQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377192; x=1789981992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        b=a44EaHOY/yGS3KEXREdXtZRfn2Dg+B1TQVd7Hny41FZm7bZkKhrtyk888LGM1vjTho
         a7z0Ehv7nP9dIDWe8FBqNwH97/v1iRudLK97unaU1qMkcyI4xuRS5T3rSQYDmjThhC46
         IhRDEdR7pJU7KKtv6NLqyuMcXPF8tNB41PeyAXBB7wJ1MGTnvLusEIx1C/LTzuxkMzrt
         ZHQQWyIOsd4ZzvaqOFnlhmyeEcGoZD3GnlsM0TLPs5xeZWN2bva8+QrrC2AA5jQyjCIt
         plCYnMt+huQGmy7gFf0n6eOHit/bo268NM1z1DraDMPn06HxSMRAqxyS2+ozgss5hz35
         bNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377192; x=1789981992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        b=rTlgmMvZJh556z9kRY5SjfmzVBigUlMnEhVrO0BcsEu64yMjkZ1UStmQHiWWGAGq5N
         Fzw3Dm/hqBZlorQPTdv7T8k6ZA3IVb0u/K78faCySYRE/pjQeFd7sQLi/JqlKxKSVIfM
         WExic0k98LKHnodTJ8JbeRWPuHdKP1xSAsEzHfmCrFETlMrPW1zxLLSouxJ7wmUqktH6
         Dy/36WVbzO+xrZ2ZGY3qLuQKg3CnDDBohcZ66ghFqitGenAbHeWa0r4oKUC+HCDzoZs/
         3FMu5z8mK0zLJW+ZqozZlX6xsL5tqPP3gmztRrYt1Yh5L8+FzH1JwrHZeusby8QSIO6P
         dHTg==
X-Forwarded-Encrypted: i=1; AKwUvBzZWB5NFY6zN6RcCfDQMLSqGrYsiqmIle6I+qh0qUR7TP2wEPyRtIla2zZFS/HVaZLq4LIyRk+RTLVQNLA=@vger.kernel.org
X-Gm-Message-State: AFuF++l1+dRalD3faHwX6CHnU4ex5GmGyaK94jV1C2HENAUaMNDHokMh
	x3eEZn8EbnouitAXonhCvsw4xZlcqrHggCfE9yrOvJhAvfkCDmGteZa7sHC3dtdYm1Hu6i4EBcP
	2j6BnGAC8c74JBE+prrrJ4Q3IFsVXZdXuPO7X
X-Gm-Gg: AYBFou1QgdK5dX84EfHae4G1IxXSR+PjEa9L9b7VaTUQ9T+fRphKuUCMAHEicWmC7do
	2h7BiV1i6/JsiwrumGiVWBkweEcRfJwo5Lq0MLWOzw8mjqzupXmbR/0gm5b0XLddqVjq++E1Nqm
	u3pvRfP1pwB10TDa3eAyWn2wpjnTo2I+WmY2qwgH/Rof3B6epAsvCvTqt6iuUZd8qIBoXP8NN0l
	xr5jzI+agUYAxv0kZ5R0qzfkFAOYWc5hqC/CzxZeozAHnPkA3h5ZnQpUttqkf8cpnvrpRaDUpph
	okWS56Ysun1sLf2ie4x44oeIWrAIcIC9FzlQMHjgMW5+KBNRldui84rjFwqmWAZBPiPS
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id
 ada2fe7eead31-79bff9f793bmr208309137.0.1789377191635; Mon, 14 Sep 2026
 02:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com> <aqKTZCPto32Ur-CI@squawk>
In-Reply-To: <aqKTZCPto32Ur-CI@squawk>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:12:59 +0800
X-Gm-Features: AcwNN1V3y04gKXhBe5aO1nN-tlGDTBMqVkzX7yFfo0GoWFMUVZQ3mu1iCsjMyMw
Message-ID: <CAPBH0A-voEks+jygGaBErgFwqNMuk6QnO9PPiYzrRLKVua0mGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Sep 10, 2026 at 02:18:55PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 87 ++++++++++++++=
++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28e6ff9d9d9c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,87 @@
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
> > +    oneOf:
> > +      - const: infineon,tda38740
> > +      - const: infineon,tda38725
> > +    description: |
> > +      The Infineon TDA38740 and TDA38725 share the same PMBus programm=
ing
> > +      model. Use infineon,tda38740 as the preferred compatible string;
> > +      infineon,tda38725 is kept as a compatibility alias.
>
> This is not how this should be done. Instead, tda38725 should list
> tda38740 as a fallback compatible. Take a look at the example schema for
> how this can be done.
> Otherwise, this looks okay to me.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor,
Thanks for review and explanation.
I misunderstood the intended use of fallback compatible.
My v4 proposal was not correct approach.
```v4 used:
 compatible:
   enum:
     - infineon,tda38725
     - infineon,tda38740
```

I plan to change it and examples to:
```
  compatible:
    oneOf:
      - const: infineon,tda38740
      - items:
          - const: infineon,tda38725
          - const: infineon,tda38740

examples:
  - |
    i2c {
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        regulator@40 {
            compatible =3D "infineon,tda38725",
                         "infineon,tda38740";
            reg =3D <0x40>;
        };
    };

```
Is this what you had in mind?

BR,
Colin Huang

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
> > +    default: 1000000
> > +    minimum: 100000
> > +    maximum: 2000000
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
