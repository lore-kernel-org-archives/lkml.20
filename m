Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A368379990;
	Wed, 23 Sep 2026 02:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129908; cv=none; b=oiLfZ+URX4Ki+BHurmjOjGbESehh7FMZ5REGsyAmv/btwWjgSCgvJoa9yVPmoQk9rK1X41hLRrGBKLx2wsdIVVOcwaDFrvZPU8/9ePdjsMjRq65vknUbaM037kQ4mytU07A0KIjB0lUjzfiqWWIAtDYgg9IcmRiPph/h/yVWnGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129908; c=relaxed/simple;
	bh=sbdU4Q5D/LstC2WUTuiP3pcjcK0GAJxb3ROux06l8Xs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=ktFufEQ1ufAO0uV+xsuXRutXQ3nTe3L7xTtazwjAkr+NbCdAvXBSVJTzs087E/Zon3kWIKXeF9XEV0foNd1EfTFPUPWHRd/UalPuQ3jvWBF2HCPcAcRXm7gj7I6++mxRyw1Jzigx01324/OW05X8hkiQzzYWmLqbrCiMO8Mv0Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=rJdQikee; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="rJdQikee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790129895;
	bh=HsUHDmsVehcHWKUK7oJBtX9pkySO3eKim9u+3rp9Bko=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=rJdQikeejBuSo5reflZegyaGrtBbC+TXu03wiWZ2pRrz/V8CIL1Kwfy4ENzDWm7QC
	 0HEM8A3G5UumQ6nyB8PhEjIIPUBZWlw3PDNyOYn/mNYpFuLlkPnSWLFG0WUdosMwQI
	 gpaI8ESXLo4nX5P6MfbGFtOd1Cgf010f7JsbDXQA=
X-QQ-mid: esmtpsz10t1790129894t25376d77
X-QQ-Originating-IP: 0Lfhv4AIErF+dHYAdIw4Ywjd5xgJufwHFdrpdtg487M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:18:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12085916592293753369
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 10:18:09 +0800
Message-Id: <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OE3tIrIEWSq43rDHmXEwWm6YamyBTwRvidVnM1uaWIPCTXslRtIdAJeH
	DO5d/fjbUi6M4pK+V+YbgsGh/aMUgvNfsTOVKqdF9dyjQHhX9mYcVF5mWa8H2HGhEA+gY0V
	UqwM/Ursv212CCqjVVIGJaGJJ/4XAojHl0svAz5yMYnA8wrR0b7woV5+dfDGXzWSZGzT4Oj
	sM+pSL9RybQiHolhzKHkojlkQc6cmtFIF47weSd8DfBO2BTJPHa19PXYYjM6OaFr2VpuiCp
	SLz9rYHjqKXN2mfQlrMztAIBbGCKDmNwgxewrRZj6+J5Fl802rjOZSs7b3lneuxGJHsfQ1K
	FpphpSVpV+ln82CS1JibPYZwhtw7E7/gCkZW0LScetHLAeAchq2nqqDlubRdZoJriAuMvjL
	pJW8aBiPkBGQQ4MtXtdcYp0XiaKi/+mnIWh8KFrbgW9XNCVBq2UhviXvK0OUDtyt3lkzZqB
	NshLhVIIr2D3VPg7T18vnXigA0K74AGeQJKO515Y/p2KQRpX8uiEBfefm0NMtz3thowObZt
	Xtj1eOvdbdNErBxv0uZr3Bv2Br6CZ+qJ9lrI/C19V3FajTmwnsYsl4O7AHsR8iP+RccD3Js
	mkNqWZOMq/5WZWbZE5VecsRw+bHT4RqulY9OeKcxrHmZAMvmL1NjTtIpepz3Hykq80QsntP
	LZ32zPYRJvfoi0/Ur3bcUmMtPxjwlenfXvepOkeSVD+oDs0n9YzEW+ZcyVkbRijK8kbSTY1
	lGdTQJkAV386X+AplhhwdkPttfZx13+ejrVMsR+o+P6wANCTytdd8IBHvriO1hEnqHG05de
	H/FbP1Y98Tg5pwUfxodZkWn4iQ32BxxVC9YEyI1DdzQ+/rc5R3B+9WrINmb9DO3Q7qeSQ4J
	UGQK8PtIxkUwjk1V8gS/Jk3I28VQdjt0QpqFIM/rAmIpAeqfsCf96qmxjg3bBWY62LWmIlA
	SCx14TJ13FY7xcTIM8/ICRztJGEQEQPFuLNXpJt3fnFzzWAPjQnGjOq7UkDdKHidLtPShK/
	gDrWrxE+Lq5U5IfDugHWW+qOpskVTcxfj6uMTVXY2iQ4RQqUWkdxHSg3OY1qMLKCNxitriY
	+futk5ODbAI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:34PM +0800, Sandie Cao wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> [...]
> @@ -441,6 +441,72 @@ soc: soc {
> [...]
> +		usb3b_u2phy: phy@81500000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81500000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> [...]
> +		usb3c_u2phy: phy@81800000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81800000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
Should these use CLK_APMU_USB3_PORTB_BUS and CLK_APMU_USB3_PORTC_BUS,
respectively?

--=20
Troy Mitchell

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM24Q0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAmYA/iFLvoo8oOH/IDlcVXEOznjisdfEqNwOm+oJljGB
ZmcGAQDPw3wYW5xpApTx/6vIfixeGWSBTL26yVlHUBqZlx8QBw==
=zTrC
-----END PGP SIGNATURE-----

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74--
