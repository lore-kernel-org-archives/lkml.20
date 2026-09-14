Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17B44AB95
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387601; cv=pass; b=nv/NevZNUSAPZMkfZ46Md5TrRp/aRp6K2lTGeR1V3dp50uYaLNeMKBllPJo0ImHEI5nDYpswsGnHobsXOiD5zSXyemHMJC3U74i604rxcCswQj6S5qnEwRidvnpAAVPAB3VMso1/gV2zztzves1IvQm9JPV2sjMmoTyyfQsuSZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387601; c=relaxed/simple;
	bh=dAQLslpPj1WS5Id3+o7zx/jx5tvNIaiKqLwvi1h/rME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG4jhnb8hZ7M1Lpv3xAvv2Gg96WZtym3HUdcnV710wpCAZhEcxNbQJqPxQuaG/NHaHKoonNcCDd3pSNMkejyWNsXLgvwYyhMlnFK9DQ+o4Mwz4KFiETcSyV5eetm5esDmv7lH2cOvB42ZOmHZJuusDG9sOGJaj8eyvoy4CcC8mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+t5UHxD; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+t5UHxD"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790ec94be85so545199137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387597; cv=none;
        d=google.com; s=arc-20260327;
        b=sM/FsBouUccny6HoKZAw0jgROjpOfI4o+sMKp2oLdO8KaVRwjynPonBa9qLBdaix33
         9LjrjGSY9sRP7xCDlFxsUbuLQtf83+1W6FgaS5sih5HipF+ES93FIvi89K/pUne7m+Cx
         O9lepv3mlTkeSIwU9m5UUWOfq+VUTY3rdJTqODWLTnH1J/QXa7b48H1WmlhH32PHbnqd
         lqfMnBlV58/oyP8J8xCnrdvyx250Nyxfbxxhi0TZ5MsvheVdz+SiPZf4jCTBMTyfbFtu
         IVxIhJSOzQtuhA7J+zMv0z+oLYMhFu/694PNnlVDkqx0qo/w3xX9FpQVpCCX16/zODzm
         n3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        fh=iJ6ZDjbMY7k8Mpt/T0xHayQFfbMGG5G/jdzqb1mwhzk=;
        b=nBR8cE/QOveuyCPxUuvaBg+26SZ81sZ4OM8f5Lg9orrn9yL7sOnHqjwsZ/yKsfr8QG
         JeTdx+x/nov32ChuIKD1XIDMHYOJsqTx2rE04oU59ogJpURaxwfvkIZkt3VMfuFzS/nB
         4th+uPK4fATr+KkvSFzeQ31JtnbyWkbnL/6Yf5+j+DTQnt1kDlgwWI24t+xDyVbaJ7xw
         njGhSXWYNpa4KzGMWGo3QEyNvOFt6nYoKX0GYsAC7+EzKRxaqP4glFuUlhl36PN4xoLU
         k4ymu/y62JBZaWnbRVUnRS3kzvtysqCcy3lgKB6zHEiovhEt+vXtMRPHPV9fPnlq3TOM
         896A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387597; x=1789992397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=T+t5UHxDGs+bcV9iWAS7LO+KmsIPI42yGhLz5oEfqs6SPEpvPhxF98Shja7irTkSLq
         A/C90OkRujFq8qSq/yEHy++HH4iUyE0wSYdZaaKK6F2/2rKFj4tGB9ITtt1mQyr/34bt
         ebt2S2et3mM2nyl/d+YKLvlyACRY+YDpQqKT3DF55ElI0wHLFCiVzMMA6Rzvy5jFWkdB
         G1+TFvJXZCt3+6S4Rd1kdERxfJ046GRc5bBg+qmNozXpi5i/ELXOVFqEwSZ6/yd88PmC
         Jk6mJbDS+HnoxWDvc5TeK0rws5vIEArdViBJSA3w790OiU+AKtN7CKmB09dkV0fJDfIH
         X95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387597; x=1789992397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=ABESrR4JMoJctp+DxS0gFNFIvuBXCaE8lI/coCVhOU3a+0cuDnP2Tu8zAQeNMju5C2
         WyQgJl6ub5lj4viTCh7GKyZAiavDipxtXqdLkne8b3SvlVtWXjgxW1P9PHX8hwcfDfqj
         v/HwYuwgo+SktQZHa5OBgJSOkFqfycJzCQInYiFOLrLNeITkAD7wHT2MlqD66cWk++D9
         OLbJSuLeKE7+/NV0QtmJHRYEhx5QpmTQsUp1zHDFjd7MMHuGbgf2x7H+VMBSScpi50Za
         +28WIBxcrOqgNox0idW/9ZLYTw2fWsXe4VkDvrxEI/27EShYmfxyCaV/n/DvypAl1Xpo
         YMcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9X5F7hbV6SRUNA7cf3nKBFmaDe3inaXKxJ1/uxJ66pKzYm6h7kIwaKBiuJuBdmBJFIUFLdtDWEcyPvRo=@vger.kernel.org
X-Gm-Message-State: AFuF++mhuCxMHng9mjpGgPMRKQjdz2wbQndtpLpmV3RE41NgDlXVWExA
	MR+c1/Rn8r6XeDb/bBPnqIqQRoK1+fMAtb4pUY5zw/6zI/kp0ccWfM0EbbIHNukBjWFEkuwMO/h
	M5exP0Q5SXCtOMUPi63TsGjydhvkiwzxE0G4pj10=
X-Gm-Gg: AYBFou0YW33TntHMZZ5NvFfEEqO7uC1mGQdFdrczppaDDHZivMjU+4Dsah+jZF0Z1ZO
	ZwxJ41dZN6hYUV+SxDFWBZJgmUEPOvPVF4dUt/704EJhc5R9r1Q+UQAHJjUJ1XdFCBA9P4W3gwc
	4FoCQxFzsBADhCWuscA/IY7bqORVSIMxZwG34QtHSKUg2OfxgW/9iFDHEn4OX/QqbKK39Xe2NIU
	GEjfODSnMb6uu528CAIDGA+/jevfaBMX7Lqx4Ws195qBY1sOh8SPbhYi5FfUjpaFe7UmpEuVRCZ
	mzp4w8mkw23QAeDclH25ufYL3buLL02Bsl+rjj8VyzLuafFOB/yobRE+qdXMM66dcIhL
X-Received: by 2002:a05:6102:a50:b0:79c:23df:6fc1 with SMTP id
 ada2fe7eead31-79c23df7745mr548775137.2.1789387596957; Mon, 14 Sep 2026
 05:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
In-Reply-To: <20260908-dinner-atrophy-757595146656@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 20:06:25 +0800
X-Gm-Features: AcwNN1WwTccuI-E0Tg8O_HU6Y7-t9R9kzYG63DP3-KVuGmrC7El7wKFW8D4dhcc
Message-ID: <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=97=A5=
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > From: Colin Huang <u8813345@gmail.com>
> > > >
> > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > RAA229640 PMBus devices.
> > >
> > > Driver change suggests fallback compatibles could be used.
> > > Why aren't they? If they can be, add them. Otherwise, explain why not=
 in
> > > your commit message.
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > Hi Conor
> >   Thanks for the review.
> >
> >   I didn't add a fallback compatible because I only have document for
> > RAA229639 and RAA229640
> >   and could not verify full DT level compatibility with any existing
> > supported devices. While both devices
> >   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> > have sufficient information to establish
> >   a compatible fallback relationship.
>
> Given that the match data table looks like this:
> static const struct of_device_id isl68137_of_match[] =3D {
>         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1_2=
rail },
>         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmpvr=
2_3rail },
>
>         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2_2=
rail },
>         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2_3=
rail },
>         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmpvr=
2_2rail },
>
>         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { },
> };
>
> It's probably pretty safe to assume that a fallback would work here,
> given how many devices are served by the same data structures but
> maybe one of the Renesas folks on CC can confirm that for us.
> At the very least, you have documents for two devices and should be able
> to confirm if they're compatible with one another.
>
> Thanks,
> Conor.
>
Hi Conor,
  Thanks for the review.
  I found a very similar precedent here:
      Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy@ren=
esas.com
      RAA228942 and RAA228943 use renesas,raa228244 as fallback compatible

  Therefore, I plan to followthe same approach:
  RAA229639 and RAA229640 also use renesas,raa228244 as fallback compatible=
.

```
@@ -60,13 +60,13 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621

       - items:
           - enum:
               - renesas,raa228942
               - renesas,raa228943
+              - renesas,raa229639
+              - renesas,raa229640
           - const: renesas,raa228244

   reg:
```
Does this look reasonable?

Best regards,
Colin Huang

> >
> >   I will clarify this in commit message in v2.
> >
> > Thanks.
> > Colin
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml |=
 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl=
68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.ya=
ml
> > > > index 8216cdf758d8..3537c7ddfb09 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > @@ -60,6 +60,8 @@ properties:
> > > >            - renesas,raa229001
> > > >            - renesas,raa229004
> > > >            - renesas,raa229621
> > > > +          - renesas,raa229639
> > > > +          - renesas,raa229640
> > > >
> > > >        - items:
> > > >            - enum:
> > > >
> > > > --
> > > > 2.34.1
> > > >
