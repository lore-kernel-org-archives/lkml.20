Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B54CA29B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554214; cv=none; b=KDKJf2IlQk9XbEXADm2EcJUkALNI9UftsguYKVUrrVMc0Tcb1agjtwgO0mxxjfaVBEQlgzTY+UwZj0eJTtQvGCp+uTsiiltA3GQTdwpQEI7W1SpaeuF138Bk2P4FkErgpK9FfRhIi3Pt3Aq6bs1smmBQlVC+uLLD85aCQq2fp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554214; c=relaxed/simple;
	bh=9Jl4vgLjlkns9w1TzXuJs2UdxbB6eEhBBB9cmhqBEi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hnmbQ5Grn0obUs8heCdwLWVNn0W/gZqI2mRgTHkcCfnhKb2GIDNAcwFxY04WCTpKxV0J0N6fXrWujcqtE7hL2PBFFxl5agOdBmuKM/JjMXtFkd3BIDlBm2tVtDfPnq7VIFH/SgA1FFQ7HIcX7XNcVEpcUzSxvfusonwsO/uawDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OZRSUVEj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OZRSUVEj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so322754f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789554181; x=1790158981; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=OZRSUVEjUOOEhYtXJGLIY9zin7GFfFtmpswtQQ4R4Uf0bUP7XuaB0GFQiwwyyi81Ib
         h1UeZgcN7S5crtw8L5Y3BvilkMiG49GA8+KayXlAeUmH21eiEdMXiHQ3cViBVz8ny4Rt
         9BV+jqZwuYYZCfwRgDhMnku2NSMXLpKTjD7kA5mIKuRfH6ZEuzV2BGl/HNaHBOxjYhk6
         hJT/eZY3/qdZ4xWwiUMlo5YPfGyAl/FkE7o7xZYT9Nhik6HxB08wZzeVFkVSoOtTfUM9
         50fIAIe9naMLTMh0Czmfrwrnapweqn9E60TVOYpNG9eTLK9/by2uJWFh0Jr2obTXO7Vg
         t/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554181; x=1790158981;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=1hSJLkJvHm5+fHDdGuCjdMgK7eJyIqPIv262pJKfm43G8toL4pDzRTH1Y18aZNU24M
         4uEyg0TEf6s15tjO+7UwG0LCko03y95BsGK/Hze7xy11+cGl6BP552Uxk9tEqsPWK89N
         +8qCY9O4XWyDmGMjUvmnz077M9CBPKPQa6/27P72zNOTIUQvPQDnZ0qWN+27v52FO8WG
         AHWLoVWXrTVflyJ3AE/ZV5Rq0/LB9gFTBUciEvpBc7war+IV7rh4B3uUFVBkCNqXZWRv
         MJxtZe2eXRlGt+PEvjJjXl70iwtpBnG0F8j6ZBZi5WflwXqy0YHjRJGPpuUryy8vZMCD
         xDNw==
X-Forwarded-Encrypted: i=1; AKwUvBxz08sUDZBJxHqEB87znzKTv0kJwGUJtVGM9sgb3bE7D1sG86rgKGvLZiREr/sMNZPOUaohcV7GlsezCEk=@vger.kernel.org
X-Gm-Message-State: AFuF++liwJYrISfwM7FHUtpatQY/Xx226xS9xOv2Zm87DJmGGPRFERRL
	3Sza6fPDrB+VDlQDLBq9uDIJlFTaj4YtHYyBJcmgePi5O9T+JkcnHfeswVS/ijz4AjU=
X-Gm-Gg: AYBFou03RVCCkLgtIqbpP7WXotJAxleeYrBqAE8p3Pr7iQHQu6ubZwVdBuQn29AyZyy
	d9LtiuBC97JQFmK1Bfi5EAQs6i9lPxfbGndaqhGY4nADkbqyWdhN2VTFIonbvYsyd8R/ek1Fnw1
	nRD8Jg02piI+YJWkh2xBAgju1yvALmRGt+350xcVzrZzfoTMD3RLNcVbo1sGMUk+/7e+PsQCrXb
	9rZjx822NptH3D2IcuEBw/PakVG+EuZd59ItkYSkLB2ajyrJ80uHoBbm8fVWEPOoGRliZnjZ/Z2
	aUT02dKfXxKE/N1jK44+qmY8OXobtNc1GSg0KHUs9aV0mZLuhquckJJKleDfgpTGs9c6OsHbdLb
	1je7n7jwTmwO3DivGunkQijEc/LWu5jGW9PVLjjFzSSpMB97QMZxLMfhaLX1JnUKiWMKFIPjdaC
	H5mXH5WIvWP7X0O6SLlJB555PVN7nJBnOSQvDv9SeHG1hpbhKZjKvJEiypYkAYV7qKZayZj3GSs
	3dB
X-Received: by 2002:a05:6000:1789:b0:487:528:cd3b with SMTP id ffacd0b85a97d-4870d057324mr2601650f8f.53.1789554181539;
        Wed, 16 Sep 2026 03:23:01 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm6429347f8f.14.2026.09.16.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 12:22:55 +0200
Message-Id: <DLGO0EVE0R9G.3MLT4ORYWOK8D@baylibre.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
 "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis" <afd@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>,
 "Kendall Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911074213.uucibicxngghf4rt@famine>
In-Reply-To: <20260911074213.uucibicxngghf4rt@famine>

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 9:42 AM CEST, Nishanth Menon wrote:
> On 14:39-20260903, Markus Schneider-Pargmann (TI) wrote:
> [...]
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> index 84dfbfd1986c..a343166b815e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> @@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
>>  			      "lpm-metadata", "lpm-context",
>>  			      "dm-firmware";
>>  	status =3D "okay";
>> +	bootph-pre-ram;
>
> Additionally, please check for dt style (status comes last and has an
> EoL prefix).
>
> Documentation/devicetree/bindings/dts-coding-style.rst
>
> Could you kindly see closer with dt-style-check --strict as well (it is
> a bit noisy atm, but it does need manual check on the log)
>
> This specific one was caught by review-prompts[1].
>
> [1] https://github.com/masoncl/review-prompts

Thanks, indeed, I will fix these. Also thanks for the link I didn't know
that existed.

Best
Markus

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpt/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN/
DwD/TUtAHwXUjrcmYytdre2lYelDM8Hv7O5A38tPdzGKZyEBALivuMFtjvENBV4o
sYGZRRl4K26KXxKWAlRx8OBIAYwJ
=8jd7
-----END PGP SIGNATURE-----

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f--
