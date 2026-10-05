Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755F4D17B4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219225; cv=pass; b=RWZbCgxyZDKFg/bSDUsq7o4b266nQKBIaxZrqPBBn2fGxaj6r/iCxPWyiaYZsmeLmldHH1fxk2PJ+ywbHyJT+4hrSklN8jyh/a+6MR4nE1AzxQWi18dd9bRSEfBh+BVNyT/u60fwaoYv+ZLaJNEFlyHBRJUzQefREqmukkBrMYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219225; c=relaxed/simple;
	bh=zSYpeV2P1QioqwAowluQEe3O60HHZwF3K/Julewq0kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDQ/LMJ+52d0QAIN6ipZ2FlxTTI6zY+4QbasktlXLL4XSTzOXWKw91jZjlCnJa1cZaUbUolNxmghI/mTdClm9NC10uB2byCHia36r4/A5Y0TYfWtiJEtAQ3azKaNpHAepzfNQfgxiv2g6xMi0p6ySxibU21/EMDOPXTm67x1o9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQzhVZRG; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQzhVZRG"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso1211715eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219222; cv=none;
        d=google.com; s=arc-20260327;
        b=jqLx/K4tuznkwEs5kV2S+GADamIvrZq4Vx/YnFKKRpy9Jg5BSgUeo9TQIq32Vu6wLt
         V+y1pa2V6GTY8/tehcVH/qLif/XfVw+9t+XnW02oYHygBicEarm0Oxzhd2nj+ZyyCvEc
         g+AVmqtZ3d7pV7+TZQPQS2z9FipntWMEkN4KTr19u87TziAlgjg5Xeia0j8UOwD9kirQ
         apKbOTiM9FniXT8xV1Jo7SYGf7QjVavak1S724AdjVmhBkKnWc9SBBmifNVENUT2U7fH
         PyMSDluX95mzSDK5ISomhLb6LlXDne7WuFxbm/f9YpijoRNEHUYKHVExyPCyMBchmVAK
         ZuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        fh=eI5D33wvHJKx+f2raL6BV2ctvUdDL8vKkntitPgfOvs=;
        b=TxJcnW1X3Ue7+0v7MVbwfcl1qHVMulvqJ5D6dlsnxintqveiyQDedRTCVOsTDbdYUj
         WhukiGcueQVHtnV5WHzrjgN1S6I7mN5tPwRUEIBdt4AJpRkQE0JTKz9RGcjG7i78S3TN
         UNMLyEd7VPvbzRFm2NbOOFHi2ZNNs946NspYJ3UfA1NxAueODBD1p9Cc8AYMloGqcF/M
         fiRhqncv0U3FmtzlKHtanbd9g2p8GxOws7d6mdn1HyR+fpSMv+ajXNwaT74ikuuKsSdz
         gduWSNZYXXLC2LB1Fq2pWsKdUEUHa7giEbmc+AlNEhvbE4RolvNluo/yZAppDA4Oe6lv
         shvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219222; x=1791824022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=oQzhVZRG1/i1tE/dByK3EUdbB5r6pa9Hw/FHX2RuROy1L1cO1yCZbs95WqQJtkLZu3
         HokXOoSh1Ns/qrHPybONQbBTCGBa7LXXoCWjoqGmW/LoeDefuv3gw+QzN68zHVcaEMvI
         AdFx0X46N8CgwhjncbkxXdl2JX6Ytg519aNwe/SEkVLjvvLIPim4ugQ+PwXxBOW64faQ
         ISHmHlql2SsnuPUtWoAvhzxQHJwKDdAtNx/Bl6Ym8pL1qR162kuFxPSG6MBArIyolS5B
         jiU4uEQcPA4XewEW4NIKQBV0DtRNAmxOst2MOJ6kWrjbkfT6XVNjOu6SLmcHSWGKcAND
         GyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219222; x=1791824022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=vPg5pfAFZ0acJHfAd1iCbokRG5tjtpzw1iCCP+ikmpmgGYZc9yX/XS6AKRl6TMmszf
         O1JTQJVYv42hUIttMtrMZTC4Vbh7890N1iPvOWdqGUcB2h+kje0ri6QzAxXIAXkggSXs
         YgvA//KUE5vD9qN89NBMnlc+pnUcV/erg4dT5H1oAyKth/dbashmFWZsgXbH1JyEC8UL
         9CL3ba+YSJ4U90fc56X+HJm8YkeQlL0l1OXI+PzJv4IJgbxM4Xu9J2LaBzohsbez6FdM
         m7lDxMT/AGZHI9iCnO6z2jJcK0koVKipHpVu0QdBuJ/MSZEdB0gKV24i3GqH90ZnsyTc
         NU4w==
X-Forwarded-Encrypted: i=1; AKwUvByTSpFtSAbL5yW/82BHxWZ9VewdjPCjWqKqds61nvrwX9meEPhvMweAMclQFoGlM7ML2KVur36iyQB7E5E=@vger.kernel.org
X-Gm-Message-State: AFuF++l8jTTBZj4rxKGE5YR5dszUHbWQfG5l1SoFkrDw2wrqjDnExDPi
	rgZ1BHewbVVgmqJKyQdspKUOPBiADdUAEc5zpFfuEFS4OHyh1eULaeoyiMoKL69x8ssXQFefZWd
	/13qvB1jUqmYhyyuM5TP68EeQknOzQrk=
X-Gm-Gg: AYBFou2aMOMsjc9oiAqJwz4chX5DZhYHH+1CP4GKOvJza9Sccc+y+lsLgWZluPfa50Z
	vUR9Rv93oT0dUkus4C1HjDyZLBYfLIi2rgZSzU88cgZSxIU6jQW7n6qNUrpMhFsH7R+vBlVxUWW
	LQ8rPHnOGDOcryq75fsWUQqFEPY1HZJRcmd0WiSm30y6DIHbxA6kDFyBgxPVzMYKhw3kJukqGZM
	FbF4h0UFNSwWaPZBsgkW7FVh6cNd9RBRt1E0lsueVCpPbzY3scGAZz9EFJ8D6m9syso5RbD8D7i
	2AjskeRwFV6gnMVXpz6yS3v8MiTVL6yi8cGUYz6tVbeZs7sPlvk0UuG53VB+m0Ij+ASZ/AHtIYA
	7leruKRodiWxa
X-Received: by 2002:a05:693c:8804:20b0:351:202c:c7a5 with SMTP id
 5a478bee46e88-351202cdc40mr6426669eec.0.1791219222183; Mon, 05 Oct 2026
 09:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-2-clamor95@gmail.com>
 <asPQ5FgHe87XQJBT@aspen.lan>
In-Reply-To: <asPQ5FgHe87XQJBT@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 19:53:30 +0300
X-Gm-Features: AclHuK80gf8oQpP3oXOiwBy9nGlcatk2lN-QYD_5rDpDvRkaMQwRh_t86WEgBCw
Message-ID: <CAPVz0n1-v-AcKg8O66q074N3gOZQD1Z6k6O+ae6yJS_-NvT6UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:31=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:19PM +0300, Svyatoslav Ryhel wrote:
> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > new file mode 100644
> > index 0000000000000..014678616076f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > @@ -0,0 +1,127 @@
> > [snip]
> > +  backlight:
> > +    $ref: /schemas/leds/backlight/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: skyworks,aat2870-backlight
> > +
> > +      led-max-microamp:
> > +        minimum: 450
> > +        maximum: 27900
> > +        default: 450
> > +
> > +      max-brightness:
> > +        default: 255
>
> Should there be a min/max here as well?
>

Seems that you are correct. Thank you!

>
> Daniel.
