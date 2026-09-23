Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D71E51E0;
	Wed, 23 Sep 2026 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130222; cv=none; b=tJXuVrQSo8ZHYdWl9bmAfAD+zTQFY12iiDuwXeNs/EsAEzCXnBQQ6h8zCbQTOOggiRbbgeof8xZDWu1zV16l6hegR9RuSivMj4jo/4XMjRbknAwucQIHg1xStkzWjV1AMJoLmMBRz1ZvD4Vu5pWECJMA4j6lxVIE3NmNpJPwvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130222; c=relaxed/simple;
	bh=Bml4a70sKO3apn4qfj3MyjAUF6TLbi3VSLOK2FiWnkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=bi/L4ymmGwBfD9qapnOUfrP0zOuatagMwJDTel08o6Qc4w+O0g/+r3b7xGt5nJN8ILVukKqacflyT+73jNNm76Bpz1tQ+FFVU3jKtM5ABVSAlxparY0jN17HoLICFeHI4PUCjM7fD/JrJ/AyMJiO5fBvaH1C5OlDKGxfSGvw9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mIoSzk1h; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mIoSzk1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790130213;
	bh=8eBwOgT/P+WBWiIFGIYRyTHNte9OZxM1YATGcOp6ONg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=mIoSzk1hT4Z2Wu9/iLeLe6pZevO87wOXIt7NSzaHnu8cWWmSZ2WTsU6R8NoUvwbDW
	 pTnytW5u4EZAh4YZLCcdh6YRPac2J5Sr+fbJY7XASOQeGhvgTPurEIhTCeiFgUZycY
	 dKBWXVgsF/YFAo5o9GL9eWmvNmWCyfh3rsvobJpM=
X-QQ-mid: zesmtpsz6t1790130211ta5ccfb27
X-QQ-Originating-IP: Hv1VSePmG7o57TixVmzrTLL07Q9k+KrYHHFrBMvoc4Y=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:23:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10725776021509883648
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 10:23:26 +0800
Message-Id: <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOYO4i1Nbl+H8jeivgJACakzyOD0ErbrXh5EjLKpnWt1cQdZgFKQnBXV
	3t3q+l2EYlHsI+pTAKgg8n4csJs2Jl5tEXrI68RzaGIVTwst2Cc8g00SAeyBU5fdjUp8Djj
	o6n1z8+BDcJL8l1uHNeL13csk29byMipGKpwkKsHpej8hS9PSxFM1lQ1F6+IvL/bmDWDsQq
	ye2Vrz80lmR+wI643rszkQblqSnVc9k0z10vLsNpP1fFLRrb+yTgdGbmTTAGCkzqNyEl+VT
	unYxC9aYX9+bA0IuZePo/KN9f+UteVMM5EZij7jZd0cebfmzjJkAoz7gGEBeVfxLhdcaCZj
	0Obzd/xH9W0uoNFftZ/5cINQv71smTvgNT8EByf8rzAbxUNrZUz0AEQNFqkgTLXeoValjTI
	yokbG0VXZZaZrOzGbj6O3HAicjDh6zqaFEVCzw21nUzfQN1NiYiFHQY5vfHeUoOZY6lk2Xb
	IOsItq/wZwGWLRpRelsrOxLTXmPrTgqX7sxRe9fNJjEBB1ZkITmRXNWRO/sGglHNGXoLapi
	dv9on3KWLyey11GXkbjNavoyxEUMnBWvQAPR1kmamwtU9vyw5s7+sJ4mMK2C5foCSA1I5nS
	oxqw42hGDOegqzjOagqG2/Gv3NbDoiycdBA0z+X/APd8Wjt/afTdYS+Mc3Uzpky6wucU8FE
	hvefdcAlcMY508OMY2FRGkTWVSqSyEzLhGWlToo3wxJUWigb6CZqZEZcfBaUJ8QHBKG4Dwf
	bE/3jScp1tOZYwHh7JyXG2ECHLqBTWRz2j4e5OLr8PQBZFZ4qAsYkpBm68DyivPdk1SLQgt
	O2HDeASVHlIpLgGtfejGMQRlYBzbviFfC97LyhBen3vEFWcOmC8HGz3DK86YKBdhJ59hl9b
	3MTwpwB5pm9r3VshNSyxJn73V+Xy8eGO/iPgzZIgB5NEl13PePQ79a7GVcrRaNmG6iSnbsg
	fGwEthUTIItrYqPa0RscZ8Mo751W9oelZZBQ+HvKgizrOVlDEGYpjr2QWO8V5SpjR8/o9VH
	lnFAob1VSvOzI83eT2fJofGAUswrheHRWIgIbr0RFD4fUHtO4I5oJ7E65N2VWJVxW+ZzdoT
	D19WZKP9iSkaX4tyX3LUkvjV5xiwSQIji/oeHdF3knq
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:50PM +0800, Sandie Cao wrote:
> @@ -184,6 +185,24 @@ &combophy {
> [...]
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;

Does GPIO88 have an external pull-up? The SDK DTS [1] also includes
mmc1_cd_cfg in both pinctrl states, with a pull-up and 3.3 V configuration.
Neither mmc1_cfg nor mmc1_uhs_cfg covers this pin. Is that configuration
unnecessary on this board?

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&aldo4>;
> +	vqmmc-supply =3D <&aldo1>;

Could you confirm which rail supplies the card's VDD? The SDK DTS [1]
uses p3v3 for vmmc rather than aldo4. Does that RPMI regulator map to
ALDO4, or is the card powered by a different rail?

Link: https://github.com/spacemit-com/linux-6.18/blob/k3-br-v1.0.y/arch/ris=
cv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts [1]

--=20
Troy Mitchell

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM4Hg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvSEoA/3IWr2MzSgk80d2GUorlzgVL9dN5Z5Dsq+DhOJvZ
9VreAQDXTpwPqeRJwGQFCrvEkytE3PdxYiCDEuGXLDFlGMaZCg==
=Za92
-----END PGP SIGNATURE-----

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761--
