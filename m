Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162B4DD6DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553891; cv=none; b=VOXVUOba4k5HJmNsMyyhAXWv4iQzSWo4Bvz4AaY1Evmw3YPm+bWszeCi+leXx47QtUSzaFKi1PZ5j4sn4Z5jh5btP5AHCngcwP0tob+/ihi5dNoQonpbIcNyfjvXOwOh3PmW5MfaYGHP03VhCAJMkIOCczLVpIbMG0oNCgoepiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553891; c=relaxed/simple;
	bh=7Cq8nxsPwCV0b+/Bf6nn+CaY0kXsOKQSTGyZuumBOZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B+Gdt00qLq6AKywdlbT2b2cl2KlL1X/4NuQ8Hc9C058w4101mpdvCLpdC4ivp0cOrRR5yrRyJsqXC0JYKw5t7fp7S4otrfl4DGGFRot+BC6sbc7gZlvnKne0or/NKPgy9JxjuoFXvHophyIDzIIQyxBBJTFj3gV0t+nWxeYCicg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=inB+YBwi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="inB+YBwi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso6495855e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789553870; x=1790158670; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3hmWtdZP0Fd0Xr4e68FJlMw+IYfmh5JRzNHS/YOcT0=;
        b=inB+YBwimVypoLoHc43poUT3h4Dxyb+xvHcOUYc1wR9PGeMdqjfGeVRwTWfCAcmake
         wnY5wevQ2/3C6IbFxByj2msYxX6tnxoLa4pSXS9RkqMO0SZHBq3sjraHFEtruujEWQV/
         9McSBbp/g2YZ4kjA3OrIj24uP59TlH1bEtSIbONm3p0xZkZfls/7N9D1Td7yIK4XmpwR
         3qhnkVzzIWP8WEteRzbbrD/q8z12rSTUV5r/idKY2qLD1lx84g3K1dPS2fDli/v/vGIk
         b0TFib6HIIZqh5AtRbLArQ+roChCF9E2nh/gIXs72Cdd6IZcYKRZkLatLRLoHigdaUPx
         tofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553870; x=1790158670;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t3hmWtdZP0Fd0Xr4e68FJlMw+IYfmh5JRzNHS/YOcT0=;
        b=tI+uAnBG0DPHJWy3taKcThTr0NDjI+iyTM6Ekflq2m1LCjhNGEEms0IEJ+NbgpQMKL
         LNAaz1LwYh1C3/OCys/08I2QX8QClHqBz2C48ppJ6Vd2mfFK/1rqYpDPH9Q7Da8HcC8i
         NadNbYPac78PV6i2JOCOJR/Ffch9tMijq8U4hqhN3IVNAY/5YEHVCljxFRPjEl0n8WI1
         qynV439u5lkChRrMvzQU10UIY1xmA+9ASPuZ2QISa20cdO8Vv65E/5y0tfd1M4viQ99b
         93spOgbESZF74j3kyhqvyDfz/U1VP3fyiZEs/mbJebtwcdX0a7v3jyZm+lAJoy+Tfi29
         zBmg==
X-Forwarded-Encrypted: i=1; AKwUvBwqx2TQpRQD6FI3zvjlDp/qKm+7CVtey3F3CO4OgtRENQcngz+/Dg4tamsNywZj96s70dErT+UTwbLTNU8=@vger.kernel.org
X-Gm-Message-State: AFuF++kl6nEkOg4s6DFZtcVnT/1bcr1xYLffl+lMb+P7TzQQk42zW1Ob
	wtSyQ9AItMrDIai0H5lMKvB3/Cs7+vprrjh2eSFtjDFRLYGz4WjSnteQHzdNhQs9nkA=
X-Gm-Gg: AYBFou1wYptmOiSgmzWjd6e+DHBCR9ICZgo9qNYEQvtJzHqq66lWcJI/1oLONPF4s9J
	/hiW0UzHviKelm3sCE+8NAJ/nGH8Ii1yIEQbZF5fVXIlJvmJDYg8NaIy+/LQFKmozglCNAaneue
	/wteyecO+ZT1fqDODFWoYcZBBmOFK/hRCTXj/fbM6tnFtqchVQ1Sxa+ifrrNCGcKdezTZ1w65HE
	GrgsjD7rsOZHs33KFY2k8fyX9sCsit1qJFzmV+MVjAabvJE8PbM8IDRVFDQo1NSlE3i7EaJPKNY
	WMoZUJ4UxwRHOe5pUd65t0GaZDgGlBmRGD+tJ6pzFdEifkL690bFR1iU7WfLk8LAPnXOnG/9jt3
	teG3pv3EkTwqvTL/5qd71PLR0i8J7eh5EhHGsYW6OhJQWlfIWzSVUmRUJXah2rgMSQdtzt+sfK0
	7VXu1FXby+nZuTDQlXBo0uJEeL1D2owAQVR6Dhh36CUg0n6kvoc20a1+7drhlzFEq3LQ==
X-Received: by 2002:a05:600c:4e89:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49eac463892mr21836755e9.1.1789553870070;
        Wed, 16 Sep 2026 03:17:50 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf462cesm6129385f8f.37.2026.09.16.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 12:17:42 +0200
Message-Id: <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com>
Cc: "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis"
 <afd@ti.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
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
To: "Francesco Dolcini" <francesco@dolcini.it>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911052428.GB5377@francesco-nb>
In-Reply-To: <20260911052428.GB5377@francesco-nb>

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Francesco,

On Fri Sep 11, 2026 at 7:24 AM CEST, Francesco Dolcini wrote:
> Hello Markus
>
> On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (TI) =
wrote:
>> For IO+DDR the wkup_r5fss0_core0 and the
>> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
>> setup is done. These are used to read the lpm metadata region in
>> which data is stored to resume. This needs to be done before RAM is
>> in use to avoid overwriting data.
>>=20
>> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
>> ipc-firmware dtsi files and to the lpm metadata region nodes of the
>> AM62A and AM62P boards.
>>=20
>> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
>> redundant with the dtsi-wide flag and is dropped.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ...
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am62p-verdin.dtsi
>> index 45ab9d947b3a..8976c0424cd1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca080=
00 {
>>  			compatible =3D "shared-dma-pool";
>>  			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>>  			no-map;
>> +			bootph-pre-ram;
>>  		};
>
> verdin-am62p has the various bootph tags only in the U-Boot dtsi
> (k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced it
> is a good idea to just add this single one here.

I don't see any bootph-* flags for any of the related memory regions in
k3-am62p5-verdin-wifi-dev-u-boot.dtsi. Is it in a different dtsi?

In general I am counting 72 bootph-* flags in the upstream devicetrees:

git grep bootph- | grep 'am62p' | sed 's/:.*//g' | sort | uniq -c
     38 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
      4 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
      9 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
      3 arch/arm64/boot/dts/ti/k3-am62p.dtsi
     14 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi

Best
Markus

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpsxhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPF
ZAD/eDJUC404z4tekZfsmiBsSdeLivl6qN7wKJXrKvbZT8oA+wcDLzFFZE77sGVB
8TuajZIIVN4aNTNdZ3YIBLPrhFkO
=F8Zw
-----END PGP SIGNATURE-----

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b--
