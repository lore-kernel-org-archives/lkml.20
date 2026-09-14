Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0F42A141
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377780; cv=pass; b=b81oVx86FN8hk5JZGevHw034cvndjvAbOoQAtEzIMJcDn3q9ngCpZtMaI/AlXloE8XVobZ47iRCFpXyhzP/qknatM7t91CsenmVnIEoODQoBKzPBckDcSQ2e/fB3R/Je5qa6DYSpsOh/797K3rinlI/xxO8MMIKjEH2EIkAw8os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377780; c=relaxed/simple;
	bh=OQIDM3IadPguqK9CTcDIpxeqUSPP28I07Cp1akqRRk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e19Z2tHLM2zCX1G8yqnl0D/NBTg4bdan92iFB2qrSbNx6/1ROedF6Mu++socVfcXVTA12imdMqJqqlI91pB4/9SsqIzOszRhqquOv6Z6w8GLpjRY7BrtYWgi07gHV8lks+L57F/o4scGMs6hu7a4aJ2ihPpQVePnKkKfiaUDLo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN9yXWj2; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN9yXWj2"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so813872e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377776; cv=none;
        d=google.com; s=arc-20260327;
        b=JBxfP5ih+4WfjMC2w1ydbwF+a67IFRW0zBzeLVeBYIlYpOnBHlkgzgKXUlRtZZVRoY
         +/xto8WO7Alhw2kl1u0mpxlunQ8q+ve3Os6kEBXJQAdUKJCDKIqH9I8RwoHJY48uP3Au
         E3NuCFwaCHqWDON1EcQUGveiKHTF6RfclB1K5kssjdqPRivkK9xcsOazDTgIJbvDazAj
         NYiZeWUhvdB5MGnsdJHKFIWWR5TlTseFYJtUhPgHkZZQLm0Y2RuAGShyuUtfouVjNoSa
         UEoMbLm612Ou3do/jVjxTQfHD4P1f1YNExjF6M6pBZpNjTS18nuxtXA1xRygMJcMrxey
         iHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        fh=IeWArUP2oIa7obERNeo9NK6nMgnhF3L8AGGvXuX+6Ug=;
        b=V1adHFpV572XAHboN+ow5Gc0iYcHZvMJIJpAuGskLgYpoYT0wNXusCnfrRrIl/gF6K
         pJWshPRMsM32ZdmJ0DtcnaFYeNlBRpcZVV+mOtAzPAFwFVqXKNtdKHrSvX4uKlqlXEpI
         rgZfS4Ky89OiFkctXRpOacosZXI7H3UYOZzUW3PqkAUOPjQwzi/n3hVhOp14RPMtyR28
         kKg6GdZ/C1U9305u+LDijFXdzvGfOIqRP2FcWPWyh2d4YhqU09968zUI22kxv0mBYFDp
         f50eB4UxcqR6dcUgGn4ko7tQRN1a9yTRsYs5OQJPCr/+ToA327XaI2PIvqdE4YJ3EE4+
         zK3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377776; x=1789982576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=gN9yXWj2NwLeAygJFikNXoAQYCoJ++oqeZ0Y5hC7wNvahvx3+BU6UIP8KB2Wd9G+ha
         z+ppUR8y4ILjC4GZ+mhAqrXxcFu677LT5zmmzXqdmjjJ5v7PQCTFqPBGgjQUVfBOtHao
         JqKeeHpxuHbQsGO3UmboepPwIDyzYXHN//94WiD+d9zzbwxgPrCmTyVXEFgF12CzZCrZ
         eDsDH2CSNepnrpT0GZauLSwYMjN+wTiQo6bt0x9peP01nvXAUEGQE7Wg7ktK841UTmPr
         3XKTHe8qOpa9lnfhV6DjIS1DQ45n9nRqZzHutlRG1bJZjgnR/+AXmcXORoxq2/kxsiXp
         iNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377776; x=1789982576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=ORbz+6XmigiNq0eijiG2OuDbqo/cqoT6LhEux2Mdxwr+jygL82hWh8B8FtqG6MuM4C
         J41zUXLNcnb1u6FKBGts8f35SqcAPQdeqFgXM+Jb4gEHess0QVTcDZzbIXaHpE6SWi0r
         llvX4y+FopirJKCuc5prQPVNBk1eIN+qQVTMR8mKhpl0qFSVRKwZeCBcxe2wwfK9PeTO
         o/go5J8kbsxOIiJR2ithLOPhTb8c8sIynAWB9+Inf0/RhAm9Ik6bzUCCN5mw3py6gd1D
         UH7ccvWZMAfyJoKV6U3jjil7GrXdstGKyLOyN6zcekMVpPe5Fv52N8VvKWd+Y58xi7Rh
         883g==
X-Forwarded-Encrypted: i=1; AKwUvBwBB58WW75P4PkmW/IPwGoKnnMOZrcuSRGpx+NdTivOHgPF1sqiuw9fCtc3b4J+XPmJ2eSuUYUK6dxIjSU=@vger.kernel.org
X-Gm-Message-State: AFuF++n3vJfCPSgFTplR/ZxBuc+CBg0eaWmZsCABPG/6JRNMgOxgfPmw
	y6mHmJBNEBpv4tQOrF563tP4QtzAS1rzMXPiLinBMpHQPH5c3giZ+2uXkQuHkKpE0a77UilvfNp
	kmuJokq1YHhFS99kUlC+nRL94nscS2EE=
X-Gm-Gg: AYBFou1JoAMiyRIHNnNkr0nd/ktjZJX1tcH1FHZUIh22veNsTGbUVwNoqMx97efy9NZ
	bAgvuFpTJr9afpacjPCSsMLZfSA5oY+tlj0MH30eGw9eYtbfgIORWxFFFYwiya5EXiVJMtgWofv
	NDXnm7Y2niT2g6z/u0BwmN1On6B+lGFNXVZ7imXWAj/A2BhyvzHnRD5FzP/3j+n/Mz862ponhEq
	ARhh1D0zEaBs/VrJOYojeoK27xLQLZsJjNKbklauJsOKJ+FZ/5YijJNkfMv+Df+CPROmxcAuBw+
	nhoU5cMId/MH/ClMCOJfT4GEOvBoC16sbHJkGxfk4YLCRX+77qyChj9wAw==
X-Received: by 2002:a05:6102:3a0c:b0:790:2ae8:32c3 with SMTP id
 ada2fe7eead31-79b58093728mr573931137.6.1789377776433; Mon, 14 Sep 2026
 02:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com> <20260911-placid-clever-lizard-de1258@quoll>
In-Reply-To: <20260911-placid-clever-lizard-de1258@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:22:44 +0800
X-Gm-Features: AcwNN1Vq0GUYmtB80Y3cnrvTLaVxABwghCq2riX6lN5HPRWReqpu9nIst8JoDro
Message-ID: <CAPBH0A_-fUYsbweGEu8gkUEYNHp=dXxupxW0bqNkKKr2vJH--Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8811=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Sep 10, 2026 at 08:35:50PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28eeb85f13df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
>
> There is no blank line here. Do not come with own style (like your
> version 1).
>
Hi Krzysztof
  Thanks for review.
  I will remove this blank line in next rev.

Best regards,
Colin Huang

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
> I don't see how you responded to Conor's feedback.
>
Thanks for remind.
I have responded Connor's feedback today.

Best regards,
Colin Huang

> Best regards,
> Krzysztof
>
