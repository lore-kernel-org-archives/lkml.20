Received: from mail-dy2-f32.google.com (mail-dy2-f32.google.com [74.125.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42404756DE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154117; cv=pass; b=m5cXkOQF8YWGXsfLmqYDKdEVfqZKYDhxuF7dOlcA4nqosmMgXUfmzKGxi12BELDnsd56wUx1HxPbDI8ZV6tH0zW72wzn88ZYX6vzZsZlYQfzc/by+0tV9bt4RYM43yIBSniCOOQJGSbqoehtONeBrkSlwf4lgtn6SaHpR1mlEIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154117; c=relaxed/simple;
	bh=XWasmCLbTpkMtaNIBxcFyKlUZqMngOiMWH9z3MuADco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxRAf7QnttT0pAdcUgdzmdWYBJRVDCXG281GXkXkTbjIwoaxWkX4LYWHdDc1v+n0sT2zj3DE9SZRxRfQCVFR+Rcyw+EDvKOEe3gwsWoSX19fTpPk+qfbhvos6P0qpp86mqLjpZvgkCqPl0gQonfBlSlPb5Sgz9hs2kvUVU7JiyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnVagqEn; arc=pass smtp.client-ip=74.125.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnVagqEn"
Received: by mail-dy2-f32.google.com with SMTP id 5a478bee46e88-33b9e805130so489112eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790154114; cv=none;
        d=google.com; s=arc-20260327;
        b=ngJC0bliwtZerD673TeXdF8Hm+ykG6g4r57nrh9ypSCU+uzD28hV1yoiyXzYTuQSfY
         TN5h1xpQsvbNq5U/Kf0bstVjnUeuULc9+1F85e8xiP7bbRP+wRDL+SLZg1IGXOcvdSx7
         gFIvi5eA6ur1wBQ3ZFwNo1+veQFXQsL9rZWChInGV80GmDGnjaZZcDRxZ5LDKM1SF9fJ
         nzzgoAJ/ntTSUOIRqcM9F3x2x6g44YJbi6VDkAfgp6s/0kIk3nmrlUlVaiCS+v5e7GNx
         Pzf/4005rTklazEgLiM+EvArnOY9YyBSx46zD5akcvt5C6f3/I4HD8zO0B32Irfdk0DH
         j6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjOcACOQ84uZLyigV2GcZi49bVP1E0iHpSer6k3KKIE=;
        fh=AYa6ClBMydgNucT4TjGWdYsRp6gOpySRu9Rd9SfVq08=;
        b=YmQxmGDApBuF7W68ax/HP4LudxYrQ5nfATqS9r37KSdAMroLItNbn9oRqLVMGObXWJ
         RIWWzAyu9zXRCd/76zAtJKettlnJY5qCibqza6OlaSh5wPgfQL5T2qAFEq6RYe+RnLVj
         naNi9pQKixtEGEIKUMz7CGqcYbpIU+GA9J2o6k/tB6a0TlsyUDt9cXFgG+FdbkJhTBa8
         FTz/+e3pVwa6jmyo0gsijCKqbqf5rdaxGC/p227jbhBuDSVlSI6R4ufFxdT41z+GH5mT
         pWXK2NFfKzJ1daQKgJW+RTazxGO6IimxyFlUP9TEF5ry5seLNDoerzmGYnFzTgqvwxv+
         3Mzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154114; x=1790758914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjOcACOQ84uZLyigV2GcZi49bVP1E0iHpSer6k3KKIE=;
        b=qnVagqEnVQpTsiWR7/ywwfwXpzbqVhwJWww5RBeM9nv7u09qFe7uagWkubODNeqmX2
         bTkYPbc4W4X4Dr3SoFHGmRTUnI7veb0NlTj7hDtUUo5mgJXvXDKIQgVjF23idqcig0AH
         D7iPNs9yfch/ZkVyxku8YlTcoLJSIrHUXOpEKiT/vXJnl/oJlYyXZXix7J/GBZ3xP9Ch
         6loAe4BIE76Nu47e9mWnflZtLRMBC98Mmvzl8rSM+Y75Jmm3t3+tzkbjsk01efm2kH5P
         bDAvkwjlyLQsooxNpT8Jet2BEZoNGBvawHrJJv5FR+E1B1Iu/Zuhs3nIgbmIc/DnqHcp
         tSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154114; x=1790758914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjOcACOQ84uZLyigV2GcZi49bVP1E0iHpSer6k3KKIE=;
        b=ewxcZ+sRMs4ziY+M29S9t8dqZdNfm3/uW1ACSAWqnvOaCkNCVZ2zJQEEBziUWAgBzQ
         jeRgvM3Jrhqb+66d+t9l0i5km2v3dbMgV/PgiIXFI68+3rxIEA0LhTLuyawMxD2S+Zkn
         becKDk9A4w2WcFH4ktun9kcRwLOXU9cz0ZxEJ3Zezj/RDMYJiLkkGjl/xt3ksQjTz8V0
         0sqGapyrgq2gSRaIw1ngq2q4u91DTm3SxKuT7NXItpjkkybeUIG16fXxTPRC1DSG//yM
         k2C3FAMZgqxYQYjw/Jksa5zySnZ6nMUHeRbNOe/UHSASlm/kptEeReRZkfH4+7b8hQVL
         PoNQ==
X-Forwarded-Encrypted: i=1; AKwUvByMNmy22D/RVAbOgJlN0nCAoK4ya2fc96ShFLEoa4rxWgAgwfxE57j/CW73saXf5Lwln6u2pEHoQvzNc3w=@vger.kernel.org
X-Gm-Message-State: AFuF++l7cmbTis1OclY2t1vH+PsxgQ1+XFOg2ud2k9WdAyw/SzjfmAQK
	eESSOEwOjAx8naqfNId/V3qY/9oWjDd6sWHKFrEt809EvU4Ri/JoEMJaAbFx6Q4u5RYePgAZ0gM
	Ty4s4/7K/0qvLBBAJL89O0J/aVSTwpvs=
X-Gm-Gg: AYBFou3GmmpkJN/cADfYTAyEpxFaAaM21Q9AkoCk7TLbDJan2oR9pkSWR4SELUT5Vv7
	eqNW1DVs3JtjAUinyrEpGWotdUFXS16IujgzuyYsaLjfQj5kI1ZnF+YktEy2XqFFEbkFd3LdJ3M
	wz7vQ2rdc2Ab2bqZulzppXPCb1w6PueIcMQ2iv3lTSNI5JrQj3jYnKc7BUJXGfcyIj44wuHCoIO
	j3aTlhNEBibFq7rPK+PmHhk9mrTxuRzn1tlxJFT6CkkNkJLIfPPZFg68bE55s0Z1FNfCGoRft4l
	xUIDwqh79Ews6fBy8M8o7iyCrZeoNyc2L4Rx0zRN+9PLq0tYirBEBa4g3P9AGQOe8B7ftT/MhU3
	XtkiUpGAftc0vBiOW8C/jhjJ+d9pEBRrFWw==
X-Received: by 2002:a05:7300:7aa1:b0:333:b6d8:c2fe with SMTP id
 5a478bee46e88-33e8bc73e92mr2136223eec.3.1790154114330; Wed, 23 Sep 2026
 02:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922212140.1118832-1-robh@kernel.org>
In-Reply-To: <20260922212140.1118832-1-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 23 Sep 2026 12:01:42 +0300
X-Gm-Features: AclHuK--rrpTa2MdKLfMK3GbLeSYH8PrO-a7xgk48uzyykmF1zLZGB5x0hLGZSA
Message-ID: <CAPVz0n3G603j60SF4mhOZYkDPs8OX4QgZnYy_zKpOH8iQaxJqQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: Add MAX20024 sd4
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 23 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 00:21 Rob =
Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Allow the MAX20024 extra sd4 regulator and its in-sd4 supply in the
> MAX77620 regulator schema. The other DCDC and LDO names remain
> unchanged.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/regulator/maxim,max77620-regulator.yaml | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-r=
egulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-=
regulator.yaml
> index 7118c34961ba..0f2901cab8af 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulato=
r.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulato=
r.yaml
> @@ -10,17 +10,17 @@ maintainers:
>    - Svyatoslav Ryhel <clamor95@gmail.com>
>
>  description:
> -  Device has multiple DCDC(sd[0-3]) and LDOs(ldo[0-8]). The input supply
> -  of these regulators are defined under parent device node. Details of
> -  regulator properties are defined as child node under sub-node "regulat=
ors"
> -  which is child node of device node.
> +  Device has multiple DCDC (sd[0-3], plus sd4 on MAX20024) and LDOs
> +  (ldo[0-8]). The input supply of these regulators are defined under par=
ent
> +  device node. Details of regulator properties are defined as child node=
 under
> +  sub-node "regulators" which is child node of device node.
>
>  patternProperties:
> -  "^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$":
> +  "^in-(sd[0-4]|ldo(0-1|2|3-5|4-6|7-8))-supply$":
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: Input supply for DCDC or LDO
>
> -  "^(sd[0-3]|ldo[0-8])$":
> +  "^(sd[0-4]|ldo[0-8])$":
>      type: object
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
> --
> 2.53.0
>

Thank you!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
