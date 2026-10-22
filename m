Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639138;
	b=If8e1Ok/WXFqVJNr36akVhINtyOGQNfDfy3magpXhUpK8+oY9awVlt9EiPXOlwPynVSq
	 iesX4WQRapOKfBCPrwiWZpFcEzBZxvl5mZUj0Z3sf2A25IvyqXG0Ax9mpZMfRTAiyI5jK
	 XMgxysBTPSIZjjFu3v51PixP4HLH3DHf/Hx+YQ2agAM3kLDCb8ElB7aFmntgRzXy+GtxD
	 tbMROYOpSxOoUK7uCkcb6cJIzqanqkrXLrB1a9K1vUrNYHxofvIBj0og1xRqKwtnJEvN8
	 2PZV66AemEPfcP63CELDe7PbIG0fIG6/rMccGp3Diav4zLC1sCx6pt+lmjUFYWXA9zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639138;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:References:
	 In-Reply-To:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=/JUTPTDl3DvoEWfToW36E2HDw8Rwl5aay5g6qHBleZg=;
	b=t9L4IZ0zA/bANhjor3rPxSgUGZTD3UPjE1ni3UbWl9sgrQqQMdVwXUowI8k+RuesFSa7
	 NeLZFdg3L/R+qwWDQ2AIDOj18llrCFHqOanUtMxDWBwc3p16k8qG1HkshaYZtpXhGyMms
	 oDM4qOrYE/COcF7YDWYd6lg+mZHn+YxN02NWg1DNiyakQOqHeZeW1svmnbkdaL1EZwtXx
	 IqdtjXLZcPxWS5d21ff9rkBb8/3/uaGTMoQBgYPHout3ZIvHRLxf1Ci/rdvHjUkacz6Qt
	 WEwx9wpsinpOSnejTZfVOGY768EbKVrgwNk284hR8VqwwT03UchN3CO26qfXGVbZ5dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=K3RTbP3D;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640F606A325;
	Thu, 22 Oct 2026 03:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2640F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=K3RTbP3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792639125;
	bh=/JUTPTDl3DvoEWfToW36E2HDw8Rwl5aay5g6qHBleZg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=K3RTbP3Dm/Q3Rza4/lthR/aT2EctP713zqvnPliF61BdUkqDZ41G5jvFU8XGPNFOE
	 celuf1OoYn4AdldWov5SzOtb2PpKE9qb85yyP6biAqZGstMPtLiC9Ycsi8yemFP6xk
	 uC4/i5CftAO4pG6LW8jds7wZ3GlhuuT1pguIU6cA=
X-QQ-mid: esmtpgz16t1792639123tafb198f4
X-QQ-Originating-IP: ICPxySEftKnBISmNiBeiOIrTueBfjfFOrGVxa1s5a28=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 11:18:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6102986534664089495
EX-QQ-RecipientCnt: 14
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 22 Oct 2026 11:18:38 +0800
Message-Id: <DMB1J6C0UYAM.SN46HDB4HISY@linux.spacemit.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
 <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOPJ7pYMv25tzb+B9IEof59Rk9dOr8qezPNZcRg1vsXCQ1J+aAVq17dJ
	nAkUrWPfxfmk4nzI/iAR76YCwgkeBRN5fj+jmJmCeAWIw/nn9gaaS6KdsCTJwaHYA1aFiUc
	DehTppXi63wqwyLob/wcNGYd6zpo3WbwaykxJjXV+VXFLFRIIiCYHCaVgUXZwR813AzDZij
	rt1NJ1d874fWC+3JN1BFmPSsu2KvKNavnd6qZysglgv4oAA35Glrms8MxylOBaSyxorB2d+
	QOZh2GJYNsqU8nRTFhBI5W3rm4Fmq3vIPSMaP54nzhRQT4YKI3Uj+pT2EnC6dU3XLjmtS1x
	u+gpwtfuxbytkIt14gT2CeZmomlvCF13oA4nssvO2sgL0XE78An8OUYi1h9NoH4Docks4Qx
	bHzBLKW+TyAR4E15sarlGKOOR2osunFjkP0FWeA4DCoFDZwlhZ6bE5VdBn9gPVyPIEBS2zu
	dmrSiE31ZguwirzQIaVISTRoeBLZOmeCpV30ggDj5IYtzoGHcWMyCqf0vtMiViOOWnvtieD
	pr65fkDTcAyyaD3e6/7lXBH2iPgLY0UyPl/+LJoIPZBjW+5bM+RSfENtWszyli2u3WNUyDf
	S7hqCUSnCYO2Gt3B3DemkhQpq6eEp+yVXVYYDLxOdh32p6USbyRHI968Zw/vwRYPIqnbzLn
	u7BUVzFQ7Qdykwa8wHWHmwZ/4UrhzMWgNNKXD4+C6ynz1mKKuqb4KawH3dFtT9NDIk/dddN
	cUT5Wfo70CHL63Bvxg3BGl7uWnwr20U4SylZVahiBT2/5XjY3u/nw3VYye428sXETztl/Uw
	8mUpNBv3udCHFaEcajvahm/PC8um9hsnGkGNIS37VR5D2Q2XvYxYGvQ5gg+QjHyVIWSdAhV
	aoBWEZ4WlfGxJtgZAAU+oPwJ6+kgAvOzdAM00iJaBhb/Tev4o3JbxS03ri0d4SH1CctHCsx
	RP1C+ek2sUy2Tnjb4X7hr/FCUbCiVvDqpJnyPRQ0jD5VKNHYVHLUGLUWOgQAeq2JozdHhTS
	2goQ3HVDyr3PqHBmYQUPmaz4Lc7V2+6Kbl0yjLaCOriyQqLFbLDB2feR8ka79LNIbILoehk
	IH7s+C5Sx6arvdkxx0bKZuI0l9khzbyCbMJc1LeEi2j
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 20, 2026 at 4:20 PM +08, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for Micro SD card slot.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962..09e3d46a2ea3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2026 DeepComputing (HK) Limited
>   */
> +#include <dt-bindings/gpio/gpio.h>

This header is no longer needed now that cd-gpios has been removed.

> =20
>  #include "k3.dtsi"
>  #include "k3-pinctrl.dtsi"
> @@ -184,6 +185,23 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	non-removable;

Could we add a comment explaining why the SD card is marked as
non-removable?


--=20
Troy Mitchell


--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatmAjwAKCRCYCe+A+TM0
L8C8AP9Irgawm5YpoIAUfeaOEmpkeMyleK+xG8EFI61rJSKlOAEA6/HVKU2fHd7+
uPDtKcTGGCeydx5BiDR2GfdRfcLrGAk=
=qRux
-----END PGP SIGNATURE-----

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7--
