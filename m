Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BC3A83BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008720; cv=none; b=Wo5wfN9yK9Pb1iMvsDtrQWNhXFuffrtIe5yD03VkyiBsnt0NdNU9kSH6+L1G5viuNZEdJnH4wlERtV9b+Q9gIWtqr3Qz8rXXbgNOYxbd/8t9+31plgaiabrzLTYjHUZskK5UKpLLz2TnsU1uO8lw5oMB4v6IJZUc+E3kW9QTmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008720; c=relaxed/simple;
	bh=AzuibgOomTJrAluUZ3IB/sjvIr/n2WqQL4ef0MuCUsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HW6Jmr0gMtrhiCzNNSe+0/T0eg6viKQuldWH5VVpuWOkQqZmZwUrf9XaUxMQaYArbKDLpPtySFceE10wVEm0gznv8aLmJNbxr+ld+0CkJGilMOZKYVdRm4092of69lxqwbmlxnfdW+rcwb7RB6lSTPHfWkhYCJzzkiFQ0a4yBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEi5MMYB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEi5MMYB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a01933b584so39614655e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792008718; x=1792613518; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZvB8uEgwH3FOtyg8jjKySlsj8oVq373OT0N/xZEySo=;
        b=CEi5MMYBoN1xpBoFWkg0xI3wFoxhPIpiYongZNWfolzPH8RZMsQTwtJPWyxUouo3HC
         +mM8bQ7sIaJRwAOSD3a7IXtDn84SlV91DMrrIbQHaoicb7AZB5deBbp8UY4FBqCv/rJ/
         +yJXH9qrncBPKc/A96BpqbhYiAN7+4RClpmflvk309Lczsug7V2FAaSWbO8Wp5tBjaSb
         em+BDcDXUHZMaxxUqDghv2Q3ySCDGV1YA9ZK0edqKrDEPS4PaXbUCdOvRb5lv5as1mvb
         2VtpY4ePNpgHA7fX4zIW9lBw8/CRIHAwayBLmMecfomLy6UoqlRhYbqAm+puhT0E6RiM
         2U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008718; x=1792613518;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZvB8uEgwH3FOtyg8jjKySlsj8oVq373OT0N/xZEySo=;
        b=jcOZ6XkO96fs6KwmRww7MbZTc4ISzfJZy443kBCUIf1zNKJ5tb/xDL8Q0j/aczK5Ed
         3rZZKL43tXleuRBEJpPogY9TqClMrY2iZb7EsuVAEvQIqdA33ZHhTvrJyTdcKGqng2Zn
         kIuq7NrsSVUUD/cm7TFMmd7VKslCOiCNFTxCgAGuQ3njNqkbQsphoIO0hOJtIB0vVRIi
         92zlXLF+wfukVz7wCci3yoZKTjclN85IMXgusU6g5Zk9XZIFhXdoOjdmdFO6vXz9oCt7
         2hzGhhojkcKjDqiJ2m6N87rnGS37mZGlnib2yGjkYn8wB9AVLIXZtkCUucnmng2suLcW
         1BzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2Ehgb6gh71SdMb0Vk2Uhg9fqARfe7T31ZGJ3ocmow+12OVh+yUiczdCJeofOLsmkqW+P5OWjNXYaTPus=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyC3cnpR2m6gTKsVWrHKS2W5nOMtOv4/z3nnTadd6I0DdFuvMd
	c3BfFL88+av3dqyAkuCiHBXOs+qM7S01B2IegXP5P6QCAHVq7Scai0g6
X-Gm-Gg: AYBFou1szx4vJfewjSeMZMTJF7CYn0AEn6CFCN36WBjQ8bEcYqmclAdmT95ZN/Cqkwu
	DqXNpLYbsNxXdtibqOXLaT9DPQuktlJYqWo5fqmLPH5rKlX3cKfUMGyq8TrAmlsNMrxX6F0hm+M
	r7Se66jUPXmy6JXCO5wQnOiluGukZ4butict86Vhl3U6CoOP2JYwAE7vxQp3uu47Qm6OmtFaNWS
	xD4GY0QqmQD4192dzoN4UUIWGg8Qfzjjc30KkrLhEkGkO5M1uWWDMyDIRaPGJ9dh2P8Lob7aEOR
	TZaKxSzhfB8ukq0QJrHFguRGeojKb0jiQYLM8sxMPswh/D4jBcTscir57psAGcDzBSHKHtL4qHA
	bd9eDIaQhEIBkkE1pfPX6GFrrY9fgx/0GEp+6m9wmer0vMTpSYxJNxCvqE1LzM3GLafN2KEo/j/
	BLIVO1pz/kRjvV9M4uPh8gMMT40s1w3izTx9L5de3KiO/LOiTsVdCzmpYBymAj9Jn41Hkiqdi52
	vMCKDuo/smsJib/uDFRipKYl4hq6Y4CjQKRkPVIu2IfbDly5hQ=
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr193706685e9.4.1792008717371;
        Wed, 14 Oct 2026 13:11:57 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd5ec195sm18169355e9.0.2026.10.14.13.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:11:56 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with
 Stefan Doesinger
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-ID: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
In-Reply-To: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
References:
 <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-2-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartNxO1axjoTnWkvnYZN3HUUQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartNxO1axjoTnWkvnYZN3HUUQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-ID: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
In-Reply-To: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:41 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:

> -ARM/ZTE ZX29 SOC SUPPORT
> +ARM/ZTE ZX SOC SUPPORT
>  M:	Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +M:	Navid Ghahremani <ghahramani.navid@gmail.com>

I am generally OK with that, at least once Navid's patches 1-6 passed revie=
w.

>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-
subscribers)
> -S:	Odd fixes
> +S:	Maintained

I think it is better to keep it ad "Odd fixes" as it is a hobby project to =
both=20
myself and Navid. I don't know where the dividing line between "Maintained"=
=20
and "Odd Fixes" is when it comes to SoCs ( yes I read https://docs.kernel.o=
rg/
process/maintainers.html ). I guess once we have a third developer and/or a=
n=20
openwrt userbase I'd feel better elevating that.

>  F:	Documentation/arch/arm/zte/
> +F:	Documentation/devicetree/bindings/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/bindings/clock/zte,zx*
> +F:	Documentation/devicetree/bindings/gpio/zte,zx*
> +F:	Documentation/devicetree/bindings/net/zte,zx*
> +F:	Documentation/devicetree/bindings/pci/zte,zx*
> +F:	Documentation/devicetree/bindings/phy/zte,zx*
> +F:	Documentation/devicetree/bindings/reset/zte,zx*
> +F:	Documentation/devicetree/bindings/spi/zte,zx*
> +F:	Documentation/devicetree/bindings/usb/zte,zx*

This should go into or near the patches that add the files in question. ( I=
=20
took that reading from https://lore.kernel.org/linux-mediatek/
2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com in particular.=20
https://lore.kernel.org/linux-mediatek/20260506-honest-cyan-cow-d6c5b0@quol=
l/=20
suggests that too ). But yes, that can also cause annoying merge conflicts =
when=20
PR'ing patches to their respective trees.

--nextPartNxO1axjoTnWkvnYZN3HUUQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP4gcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi7zYP/2fAvvx5fPT4SsWjdFdI
ABhAtJyWB4RG60JTfTVzXe5Qk37bsWxDMWZGDS5CCk2223n7pwnAooriQJ5a3Kub
S9GtdDVdDrJrlL1QTxQsyCjoNXFBOC/PxSm8uOwEZ8G27Y/y/HOpGIMXRPKoOHnE
2EMSVeNOgqKNMLtpdR4SqO79G1RazLNhiuVjadX2Xi7gGZ8Lx5Fxybv0+INi9T3n
pA7fw/G48AmrnzXvXniQ0YIZug+sngeIhqekjpRMXoOFJfSQzjFkR9Kihxdj1TuR
LiLnIJxAcNGac7WFuuL2VXpHbhKfEPwgRnmXX7xCiER9GrsU8mX6UvTYXBZrOnRV
xJkGNrOn1E8DVx1BpGdS7WcXJh8wDEoPA7UAWCNSF8AwSHi3enXgboGubXuQHavG
fuXWEx6DxjeNf44GUlA8KnDC1YDvXydyS426Z0oaMH/c/y6rJblBbG8aQA24XMDM
FkgpIt6MlpnB9bd3n4kAP2vq/tf/1Jjr0J9fTq7uOPzya73eAnZeulZKJhTyFBrr
sJzg8p8ix7JlJIlzNA1ucMMg5e8A1MK0OZwvVsQZuHGd+RLYHBUtB+Du5aOhwxnv
7UmvYhazw1O67OcEiSir27cK3aSHv8jXcdlx/lkJpZ4NVBOCGwVcYALCH/RKsoaB
8PBzu6beSOYdYS8pLH6jz6sd
=7Rzi
-----END PGP SIGNATURE-----

--nextPartNxO1axjoTnWkvnYZN3HUUQ--



