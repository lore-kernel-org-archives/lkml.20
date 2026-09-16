Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B521B4AB3CE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574849; cv=none; b=ErHktE1sh7dydr4iUOsMuJc6NK6m4yozRNx1aLNaaLG4NWdcgdSfYbcMnffVUcva3nupc95OWDKbioRDVMAUgp0O5lhptZm+0M6gcSLtUTyfLL+EaYL9VBy8XfXWvFuJ1qvUdL/WcD+3tB9RoQN9RtxLAX68IqyUw1KvrLbrCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574849; c=relaxed/simple;
	bh=v5T5L+sjj0QEbIFkeomSUY3aW/E3FyLnS4/5K1I+vx8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=oUDOfko94e6xfQNDXr0L1HG5Tnp7KYpJbY2mjgTOOU4Qwd6k7iyPHncJvrGau2DnvmmX3NfsUuqERDpLyYyhWZMloY6Ur0hSrsFw9r5qmxUpEFF+pFrZyhYW1bYr3bIeR8mBaoIhyZ5ljjhqK3Kpqb49M3DInHAg+fhINTXlOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KdpJRtIk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KdpJRtIk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3766495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789574845; x=1790179645; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JT7BltXK/O+RVr7HZDUyFWjcaSBcl/b5sxD3x657pVM=;
        b=KdpJRtIkWsmGduBP229+G/QeSVDt+NI7V3ncizCkpSkbwFcrGYwLbovgusmwbggBLK
         slr3Btm0Z18sAsxk9jkRYua4/JNSLPZelAWOQ4vQyxmlVisu5tZIKj0ItP01tF5Luq2u
         m/D+M57sDzA1AmBQM5WJLU0hvm31H2gOphC3NzIARiFYNXrxvpCltsqsxp0IKRTqQFfS
         PvScMgzG/WV0ZL4TkVJhVQxy/CgqhX6r5E6hF4TpMbbD+eKqnVBktE/qy+ICf/0RQEsu
         TRnUYL3DEHXkuGvtNFUf1c2xoWoA42KF2OBqPJfDTms1oZLHn4SKqmbDDo53C/06stOo
         7l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574845; x=1790179645;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JT7BltXK/O+RVr7HZDUyFWjcaSBcl/b5sxD3x657pVM=;
        b=xUz7vA4jgX5zGmWwmPc7V90jEiyt9WgrgeLoP/scUZa7mSIKhvT3QBx+ge8HqXGgVq
         GDphrGMRU+76OfDA5bgXxrfMKq1IFtYBPwpJQ2cET7iSMRXPICvPkAKnC+aPBcbhlNLP
         OQ+RMuB3yxX/x1MnF0EPKSoaIckowGbI4uFHHB9yFIQj2zQ8FBcn74mW2X6c7JYghlFS
         jufZGSONUOYrBmfTv/pk5MIex5opYcj+RoZLDnJzI0QrhPaizTj3yQ6je1Mv2UmrTuwJ
         Hnzv2u6nHJmSOd8lHPdk/0RPAPFsLLdKZtC6+kGP6n/Q+LIb52w87uXsH5d2Oe8unzq5
         MQ2w==
X-Forwarded-Encrypted: i=1; AKwUvBxeawQfEFEWE/3aQNWpJ3dA6d/n71px7jt5g68lsNzlx2LCmOBs9GeDk9ML9qqmLUSaXnSiesB8+Qny9C0=@vger.kernel.org
X-Gm-Message-State: AFuF++kEABhRkYJttmXjZJtUM5+GTqmyMwSnSxFQ4nAVelxTUxmm1EWN
	RsIRLd0ndmFYQnFICC3yLlDhub0jVka7ygWoByoEeiuE7MuO0t8wdSKwp0u9SsZioFU=
X-Gm-Gg: AYBFou1Kh4i56TFOZ3goAVIGgfkhrpv76ihbgFYCkOi1z/avpzz3US9gPbyfOw9zhzN
	Hm8di0bECve2SWTBkgel3+uYh8LEQYpBOciHHT++CrnlLakhnixHVpGqmExni32yNNQfyiZYd2A
	J7laBACgfIWpwA5NQTr6UtNX73D0/BSjYp64W49+OzAVQHFiVNLmuL/Ymra417wHuYkwFl4fed4
	tNlCGay5nDi/4bJ/Qk1PyZEP7gFT+OtKSZcOh8Y9k6uDED4GqNPOfsnkRTM2bRL9bjTBKEWkbuO
	N+6h97ep3dPYllxOCN5C82TjLXU4gQtoDHBvDhVy/U30oMWKuH+XVemBJeGIHsvMJUfeI0IGj0v
	dDjke2DzCz9707FPXjt3b9ypdOGku8xzRZ5EvoTOEZ83SFDk3A2Kozi+nJtkFTyEg6sPQycDsNx
	uMk+P1RvnLLgM5DCLY1zuhpbOl7BY9VGkUX2ftAhHx5q+0zQqipQ3baSqY6eq28oz2cw==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr2094185e9.3.1789574844730;
        Wed, 16 Sep 2026 09:07:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232b25sm1173905e9.4.2026.09.16.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 18:07:16 +0200
Message-Id: <DLGVC2B0B20H.12SWQB4JAGCJ0@baylibre.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>
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
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911052428.GB5377@francesco-nb> <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com> <20260916104017.GA284106@francesco-nb>
In-Reply-To: <20260916104017.GA284106@francesco-nb>

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Francesco,

On Wed Sep 16, 2026 at 12:40 PM CEST, Francesco Dolcini wrote:
> On Wed, Sep 16, 2026 at 12:17:42PM +0200, Markus Schneider-Pargmann wrote=
:
>> Hi Francesco,
>>=20
>> On Fri Sep 11, 2026 at 7:24 AM CEST, Francesco Dolcini wrote:
>> > Hello Markus
>> >
>> > On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (T=
I) wrote:
>> >> For IO+DDR the wkup_r5fss0_core0 and the
>> >> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
>> >> setup is done. These are used to read the lpm metadata region in
>> >> which data is stored to resume. This needs to be done before RAM is
>> >> in use to avoid overwriting data.
>> >>=20
>> >> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
>> >> ipc-firmware dtsi files and to the lpm metadata region nodes of the
>> >> AM62A and AM62P boards.
>> >>=20
>> >> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
>> >> redundant with the dtsi-wide flag and is dropped.
>> >>=20
>> >> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> > ...
>> >
>> >> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64=
/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> index 45ab9d947b3a..8976c0424cd1 100644
>> >> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca=
08000 {
>> >>  			compatible =3D "shared-dma-pool";
>> >>  			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>> >>  			no-map;
>> >> +			bootph-pre-ram;
>> >>  		};
>> >
>> > verdin-am62p has the various bootph tags only in the U-Boot dtsi
>> > (k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced =
it
>> > is a good idea to just add this single one here.
>>=20
>> I don't see any bootph-* flags for any of the related memory regions in
>> k3-am62p5-verdin-wifi-dev-u-boot.dtsi. Is it in a different dtsi?
>
> What I meant is that any bootph- property is in
> arch/arm/dts/k3-am6p25-verdin-wifi-dev-u-boot.dtsi=20
>
> And I would not start adding spreading this in 2 different places.

As I said, there are 72 bootph- properties in am62p related devicetrees
in the kernel devicetrees. For k3-am62p-verdin*.dts the relevant ones
are probably:

      3 arch/arm64/boot/dts/ti/k3-am62p.dtsi
     14 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi

Also if I understand correctly, it is preferred to get these bootph-
tags into the upstream devicetree:

  https://lore.kernel.org/u-boot/20260903144032.GI1764417@bill-the-cat/

Best
Markus

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqq+tBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMa
CwD/UzU/bEn+SvEhbYhrvo356ps/AZUBbSCU7LIcWlv3E5YBAJxIt80j3RbsiuhH
LWCPbjxjKVKr3P1SKVvEXWAyHpEF
=8soS
-----END PGP SIGNATURE-----

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4--
